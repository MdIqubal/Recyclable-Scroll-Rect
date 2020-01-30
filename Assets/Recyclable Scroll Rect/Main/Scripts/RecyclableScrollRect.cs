//MIT License
//Copyright (c) 2020 Mohammed Iqubal Hussain
//Website : Polyandcode.com 

using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

namespace PolyAndCode.UI
{
    public class RecyclableScrollRect : ScrollRect
    {
        //DataSource. Responsible for Data related operations
        [HideInInspector]
        public IRecyclableScrollRectDataSource DataSource;
        //Cell
        public RectTransform PrototypeCell;
        public bool SelfInitialize = true;

        //Pool Generation
        private List<RectTransform> _cellPool;
        private List<ICell> _cachedCells;
        private RectTransform _listContainer;
        private float _poolCoverage = 1.5f; // the recyclable pool must cover (viewPort * _poolCoverage) area.
        private Bounds _recyclableViewBounds;
        private float _recyclingThreshold = .2f; //Threshold for recycling above and below viewport

        //Temps, Flags
        private Vector3[] _corners = new Vector3[4];
        private bool _recycling;

        //Trackers
        private int topMostCellIndex, bottomMostCellIndex; //Topmost and bottommost cell in the heirarchy
        private int currentItemCount; //item count corresponding the datasource.

        protected override void Start()
        {
            //Currently supports only vertical lists
            vertical = true;
            horizontal = false;

            if (!Application.isPlaying)
            {
                return;
            }

            if (SelfInitialize)
            {
                StartCoroutine(InitCoroutine());
            }
        }

        #region INIT
        /// <summary>
        /// Use this to init the list from the controller class when self-init is false
        /// </summary>
        /// <param name="dataSource"></param>
        public void Initialize(IRecyclableScrollRectDataSource dataSource)
        {
            DataSource = dataSource;
            StartCoroutine(InitCoroutine());
        }

        /// <summary>
        /// Use this to init the list from the controller class when self-init is false
        /// </summary>
        public void Initialize()
        {
            StartCoroutine(InitCoroutine());
        }

        /// <summary>
        /// using coroutine for init because few UI stuff need a frame to update
        /// </summary>
        IEnumerator InitCoroutine()
        {
            onValueChanged.RemoveAllListeners();
            if (!_listContainer)
            {
                _listContainer = (new GameObject()).AddComponent<RectTransform>();
                _listContainer.SetParent(content, false);
                _listContainer.gameObject.name = "List Container";
            }
            SetTopAnchor(_listContainer);
            SetTopAnchor(content);
            content.anchoredPosition = _listContainer.anchoredPosition = Vector3.zero;
            yield return null;
            SetRecyclingBounds();

            CreateCellPool();
            //Set the top and bottom most cell indices
            topMostCellIndex = 0;
            bottomMostCellIndex = _cellPool.Count - 1;

            //Set content height according to no of cells
            float contentYSize = _cellPool.Count * PrototypeCell.sizeDelta.y;
            content.sizeDelta = new Vector2(content.sizeDelta.x, contentYSize);
            currentItemCount = _cellPool.Count;

            SetTopAnchor(content);

            onValueChanged.AddListener(OnValueChanged);
        }

        /// <summary>
        /// Sets the uppper and lower bounds for recycling cells.
        /// </summary>
        private void SetRecyclingBounds()
        {
            viewport.GetWorldCorners(_corners);
            float threshHold = _recyclingThreshold * (_corners[2].y - _corners[0].y);
            _recyclableViewBounds.min = new Vector3(_corners[0].x, _corners[0].y - threshHold);
            _recyclableViewBounds.max = new Vector3(_corners[2].x, _corners[2].y + threshHold);
        }

        /// <summary>
        /// Creates cell Pool for recycling
        /// </summary>
        private void CreateCellPool()
        {
            //Caching ICells.
            if (_cellPool != null)
            {
                _cellPool.ForEach((RectTransform item) => Destroy(item.gameObject));
                _cellPool.Clear();
                _cachedCells.Clear();
            }
            else
            {
                _cachedCells = new List<ICell>();
                _cellPool = new List<RectTransform>();
            }

            //Set the prototype cell active 
            PrototypeCell.gameObject.SetActive(true);
            //Set cell anchor as top
            SetTopAnchor(PrototypeCell);

            //Temps
            float poolSize = 0;
            int poolCount = 0;
            float posY = 0;
            while (poolSize < _poolCoverage * viewport.rect.height && poolCount < DataSource.GetItemCount())
            {

                RectTransform item = (Instantiate(PrototypeCell.gameObject) as GameObject).GetComponent<RectTransform>();
                item.GetComponentInChildren<Text>().text = poolCount.ToString();
                _cellPool.Add(item);
                item.SetParent(_listContainer, false);

                item.anchoredPosition = new Vector2(0, posY);// - item.sizeDelta.y * 0.5f);
                posY = item.anchoredPosition.y - item.rect.height;// * 0.5f;

                //Cell for row at
                _cachedCells.Add(item.GetComponent<ICell>());
                DataSource.SetCell(item.GetComponent<ICell>(), poolCount);
                poolSize += item.rect.height;
                poolCount++;
            }

            //Deactivate  prototype cell if it is not a prefab, meaning it's present in scene.
            if (PrototypeCell.gameObject.scene.IsValid())
            {
                PrototypeCell.gameObject.SetActive(false);
            }
        }

        #endregion


        #region RECYCLING
        /// <summary>
        /// Recycling tick
        /// </summary>
        private void OnValueChanged(Vector2 args)
        {
            if (_recycling || _cellPool == null || _cellPool.Count == 0)
            {
                return;
            }

            //Updating Recyclable view bounds since it can change with resolution changes.
            SetRecyclingBounds();

            if (_cellPool[bottomMostCellIndex].minY() > _recyclableViewBounds.min.y)
            {
                RecycleTopToBottom();
            }
            else if (_cellPool[topMostCellIndex].maxY() < _recyclableViewBounds.max.y)
            {
                RecycleBottomToTop();
            }
        }

        /// <summary>
        /// Recycles cells from top to bottom in the List heirarchy
        /// </summary>
        private void RecycleTopToBottom()
        {
            _recycling = true;
            int n = 0;
            float posY = 0;
            while (_cellPool[topMostCellIndex].minY() > _recyclableViewBounds.max.y && currentItemCount < DataSource.GetItemCount())
            {
    
                posY = _cellPool[bottomMostCellIndex].anchoredPosition.y - _cellPool[bottomMostCellIndex].sizeDelta.y;

                //Move top cell to bottom
                _cellPool[topMostCellIndex].anchoredPosition = new Vector2(_cellPool[topMostCellIndex].anchoredPosition.x, posY);

                //Cell for row at
                DataSource.SetCell(_cachedCells[topMostCellIndex], currentItemCount);

                //set new indices
                bottomMostCellIndex = topMostCellIndex;
                topMostCellIndex = (topMostCellIndex + 1) % _cellPool.Count;//  topMostCellIndex + 1 >= cellPool.Count ? 0 : ++topMostCellIndex;

                currentItemCount++;
                n++;
            }

            //Content anchor position adjustment.
            _listContainer.anchoredPosition += n * Vector2.up * _cellPool[topMostCellIndex].sizeDelta.y;
            content.anchoredPosition -= n * Vector2.up * _cellPool[topMostCellIndex].sizeDelta.y;
            m_ContentStartPosition += -new Vector2(0, n * _cellPool[topMostCellIndex].sizeDelta.y);
            _recycling = false;
        }

        /// <summary>
        /// Recycles cells from bottom to top in the List heirarchy
        /// </summary>
        private void RecycleBottomToTop()
        {
            _recycling = true;
            int n = 0;
            float posY = 0;
            while (_cellPool[bottomMostCellIndex].maxY() < _recyclableViewBounds.min.y && currentItemCount > _cellPool.Count)
            {
                currentItemCount--;
                n++;
                
                posY = _cellPool[topMostCellIndex].anchoredPosition.y + _cellPool[topMostCellIndex].sizeDelta.y;// * 0.5f;

                //Move top cell to bottom
                _cellPool[bottomMostCellIndex].anchoredPosition = new Vector2(_cellPool[bottomMostCellIndex].anchoredPosition.x, posY);

                //Cell for row at
                DataSource.SetCell(_cachedCells[bottomMostCellIndex], currentItemCount - _cellPool.Count);

                //set new indices
                topMostCellIndex = bottomMostCellIndex;
                bottomMostCellIndex = (bottomMostCellIndex - 1 + _cellPool.Count) % _cellPool.Count;//  bottomMostCellIndex - 1 < 0 ? cellPool.Count-1 : --bottomMostCellIndex;//(bottomMostCellIndex - 1) % 10;//
            }

            //Content anchor position adjustment.
            _listContainer.anchoredPosition -= n * Vector2.up * _cellPool[topMostCellIndex].sizeDelta.y;
            content.anchoredPosition += n * Vector2.up * _cellPool[topMostCellIndex].sizeDelta.y;
            m_ContentStartPosition += new Vector2(0, n * _cellPool[topMostCellIndex].sizeDelta.y);

            _recycling = false;
        }

        #endregion

        #region  HELPERS

        /// <summary>
        /// Anchoring cell and content rect transforms to top preset. Makes repositioning easy.
        /// </summary>
        /// <param name="rectTransform"></param>
        void SetTopAnchor(RectTransform rectTransform)
        {
            //Width and height changes if anchoring is change. save to reapply after anchoring
            float width = rectTransform.rect.width;
            float height = rectTransform.rect.height;

            //Setting top anchor 
            rectTransform.anchorMin = new Vector2(0.5f, 1);
            rectTransform.anchorMax = new Vector2(0.5f, 1);
            rectTransform.pivot = new Vector2(0.5f, 1);

            //Reapply size
            rectTransform.sizeDelta = new Vector2(width, height);
            //rectTransform.anchoredPosition = new Vector3(0, -rectTransform.sizeDelta.y * 0.5f);
        }

        #endregion

        [UnityEditor.MenuItem("CONTEXT/Rigidbody/Double Mass")]
        static void DoSomething()
        {
            Debug.Log("Doing Something...");
        }

        /* 
            #region  TESTING
            private void OnDrawGizmos()
            {
                Gizmos.color = Color.green;
                Gizmos.DrawLine(_recyclableViewBounds.min - new Vector3(2000, 0), _recyclableViewBounds.min + new Vector3(2000, 0));
                Gizmos.color = Color.red;
                Gizmos.DrawLine(_recyclableViewBounds.max - new Vector3(2000, 0), _recyclableViewBounds.max + new Vector3(2000, 0));
            }
            #endregion
        */

    }
}
