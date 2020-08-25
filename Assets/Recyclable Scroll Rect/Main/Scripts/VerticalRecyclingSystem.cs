using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

namespace PolyAndCode.UI
{
	public class VerticalRecyclingSystem : RecyclingSystem
	{
        private int _coloumns = 1;
        private float _cellWidth, _cellHeight;

        private int _topMostCellColoumn, _bottomMostCellColoumn, _currentColoumn;
        private bool _contentSizeIncreased;

        //DataSource. Responsible for Data related operations
        private IRecyclableScrollRectDataSource _dataSource;

        //Cell
        public bool SelfInitialize = true;

        //Pool Generation
        private List<RectTransform> _cellPool;
        private List<ICell> _cachedCells;
        private RectTransform _listContainer;
        private Bounds _recyclableViewBounds;
        private float _recyclingThreshold = .2f; //Threshold for recycling above and below viewport

        //Temps, Flags
        private Vector3[] _corners = new Vector3[4];
        private bool _recycling;

        //Trackers
        private int topMostCellIndex, bottomMostCellIndex; //Topmost and bottommost cell in the heirarchy
        private int currentItemCount; //item count corresponding the datasource.
         
        public VerticalRecyclingSystem(RectTransform prototypeCell, RectTransform viewport, RectTransform content, IRecyclableScrollRectDataSource dataSource, bool isGrid,int coloumns)
        {
            PrototypeCell = prototypeCell;
            Viewport = viewport;
            Content = content;
            _dataSource = dataSource;
            IsGrid = isGrid;
            
            _coloumns =  isGrid ? coloumns : 1;
        }

        /*
        protected override void Start()
        {
            //Currently supports only vertical lists
            vertical = true;
            horizontal = false;

            if (!Application.isPlaying) return;

            if (SelfInitialize) StartCoroutine(InitCoroutine());
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
        } */

        #region INIT
        /// <summary>
        /// using coroutine for init because few UI stuff need a frame to update
        /// </summary>
        public override IEnumerator InitCoroutine(System.Action onInitialized)
        {
         //   onValueChanged.RemoveListener(OnValueChangedlistener);

            //Setting up container and bounds
            //if (!_listContainer)
            //{
            //    _listContainer = (new GameObject()).AddComponent<RectTransform>();
            //    _listContainer.SetParent(_content, false);
            //    _listContainer.gameObject.name = "List Container";
            //}
            //SetTopAnchor(_listContainer);
            SetTopAnchor(Content);
            Content.anchoredPosition = Vector3.zero;
            yield return null;
            SetRecyclingBounds();

            //Cell Poool
            CreateCellPool();
          
            topMostCellIndex = 0;
            bottomMostCellIndex = _cellPool.Count - 1;

            int noOfRows = (int)Mathf.Ceil((float)_cellPool.Count / (float)_coloumns);
            
            //Set content height according to no of cells
            float contentYSize =  noOfRows * PrototypeCell.sizeDelta.y;
            Content.sizeDelta = new Vector2(Content.sizeDelta.x, contentYSize);
            currentItemCount = _cellPool.Count;
            SetTopAnchor(Content);

            if(onInitialized != null) onInitialized();
            //Add listener for recycling
        //    onValueChanged.AddListener(OnValueChangedlistener);
        }

        /// <summary>
        /// Sets the uppper and lower bounds for recycling cells.
        /// </summary>
        private void SetRecyclingBounds()
        {
            Viewport.GetWorldCorners(_corners);
            float threshHold = _recyclingThreshold * (_corners[2].y - _corners[0].y);
            _recyclableViewBounds.min = new Vector3(_corners[0].x, _corners[0].y - threshHold);
            _recyclableViewBounds.max = new Vector3(_corners[2].x, _corners[2].y + threshHold);
        }

        /// <summary>
        /// Creates cell Pool for recycling, Caches ICells
        /// </summary>
        private void  CreateCellPool()
        {
            //Reseting Pool
            if (_cellPool != null)
            {
                _cellPool.ForEach((RectTransform item) => UnityEngine.Object.Destroy(item.gameObject));
                _cellPool.Clear();
                _cachedCells.Clear();
            }
            else
            {
                _cachedCells = new List<ICell>();
                _cellPool = new List<RectTransform>();
            }
              
            //Set the prototype cell active and set cell anchor as top 
            PrototypeCell.gameObject.SetActive(true);
            if (IsGrid)
            {
                SetTopLeftAnchor(PrototypeCell);
            }
            else
            {
                SetTopAnchor(PrototypeCell);
            }

            //Temps
            float currentPoolCoverage = 0;
            int poolSize = 0;

            float posX = 0;
            float posY = 0;

            _cellWidth = Content.rect.width / _coloumns;
            _cellHeight = PrototypeCell.sizeDelta.y / PrototypeCell.sizeDelta.x * _cellWidth;
            PrototypeCell.sizeDelta = new Vector3(_cellWidth, _cellHeight);
            _currentColoumn = _topMostCellColoumn = 0;


            //Recycle cells untill the Pool area is covered
            //            while ( && poolCount < _dataSource.GetItemCount())
            //Recycle cells untill the Pool area is covered
            float requriedCoverage = MinPoolCoverage * Viewport.rect.height;

            int minPoolSize = Math.Min(MinPoolSize, _dataSource.GetItemCount());

            //create cells untill the Pool area is covered and pool size is the minimum required
            while ((poolSize < minPoolSize || currentPoolCoverage < requriedCoverage) && poolSize < _dataSource.GetItemCount())
            {
                //Instantiate and add to Pool
                RectTransform item = (UnityEngine.Object.Instantiate(PrototypeCell.gameObject) as GameObject).GetComponent<RectTransform>();
                item.name = "Cell";
                _cellPool.Add(item);
                item.SetParent(Content, false);                

                if (IsGrid)
                {
                    item.anchoredPosition = new Vector2(posX, posY);
                    _currentColoumn++;
                    posX = _currentColoumn >= _coloumns ? 0 : posX + _cellWidth;
                    posY = _currentColoumn >= _coloumns ? posY - _cellHeight : posY;
                    if (_currentColoumn >= _coloumns)
                    {
                        _currentColoumn = 0;
                        currentPoolCoverage += item.rect.height;
                    }
                }
                else {
                    //Positioning
                    item.anchoredPosition = new Vector2(0, posY);
                    posY = item.anchoredPosition.y - item.rect.height;
                    currentPoolCoverage += item.rect.height;
                }

              

                //Data setting in Cell
                _cachedCells.Add(item.GetComponent<ICell>());
                _dataSource.SetCell(_cachedCells[_cachedCells.Count - 1], poolSize);

                //Update the Pool size
                poolSize++;
            }

            //TODO : you alrady have a _currentColoumn varaiable. Why this calculation?????
            if (IsGrid)
            {
                _bottomMostCellColoumn = (_currentColoumn - 1 + _coloumns) % _coloumns;
                _contentSizeIncreased = _bottomMostCellColoumn != _coloumns - 1;
            }
            
            //Deactivate prototype cell if it is not a prefab(i.e it's present in scene)
            if (PrototypeCell.gameObject.scene.IsValid())
            {
                PrototypeCell.gameObject.SetActive(false);
            }
        }
        #endregion

        Vector2 zeroVector = Vector2.zero;
       // private Vector2 _offsetCorrection = Vector2.zero;
        #region RECYCLING
        /// <summary>
        /// Recycling tick
        /// </summary>
        public override Vector2 OnValueChangedListener(Vector2 direction)
        {
            if (_recycling || _cellPool == null || _cellPool.Count == 0) return zeroVector ;
          
            foreach (var i in _cellPool) {
                if (i == _cellPool[topMostCellIndex])
                {
                    i.GetComponent<Image>().color = Color.red;
                }
                else if (i == _cellPool[bottomMostCellIndex])
                {
                    i.GetComponent<Image>().color = Color.green;
                }
                else { 
                    i.GetComponent<Image>().color = Color.white;

                }
            }

            //Updating Recyclable view bounds since it can change with resolution changes.
            SetRecyclingBounds();
          //  _offsetCorrection = zeroVector;
            if (direction.y > 0 && _cellPool[bottomMostCellIndex].MaxY() > _recyclableViewBounds.min.y)
            {
              //  RecycleTopToBottom(out _offsetCorrection);
                //RecycleTopToBottom((Vector2 offset) => contentOffset = offset );

                 return RecycleTopToBottom();
            }
            else if (direction.y < 0 && _cellPool[topMostCellIndex].MinY() < _recyclableViewBounds.max.y)
            {
                Debug.Log("bottom to top");
                Debug.Log("index" + topMostCellIndex);

                Debug.Log("cell y" + _cellPool[topMostCellIndex].MaxY());
                Debug.Log("up y" + _recyclableViewBounds.max.y);

                //  RecycleBottomToTop(out _offsetCorrection);
                // RecycleBottomToTop((Vector2 offset) => offsetCorrection = offset);
                return RecycleBottomToTop();
            }

            return zeroVector;
           // return _offsetCorrection;
        }

        /// <summary>
        /// Recycles cells from top to bottom in the List heirarchy
        /// </summary>
        // private void RecycleTopToBottom(UnityAction<Vector2> onComplete)
        private Vector2 RecycleTopToBottom()
        {
            _recycling = true;

            int n = 0;
            float posY = 0;
            float posX = 0;

            if (IsGrid)
            {
                 posY = _cellPool[bottomMostCellIndex].anchoredPosition.y;
                //if top most cell is in the last coloumn then the new cell will come below this row
                if (_bottomMostCellColoumn == _coloumns - 1)
                {
                    posY -= _cellPool[topMostCellIndex].rect.height;
                }
                _currentColoumn = _bottomMostCellColoumn;
            }

            //If there is a  cell at top available to recyle and current item count is under the data source length
            while (_cellPool[topMostCellIndex].MinY() > _recyclableViewBounds.max.y && currentItemCount < _dataSource.GetItemCount())
            {
                if (IsGrid)
                { 
                    _currentColoumn ++;

                    if (_currentColoumn >= _coloumns)
                    {
                        n++;
                        _currentColoumn = 0;
                    }
                    posX = _currentColoumn * _cellWidth;
                    // posY = currentColoumn >= coloumns ? _cellPool[bottomMostCellIndex].anchoredPosition.y - _cellPool[bottomMostCellIndex].sizeDelta.y : posY;
                    if (_currentColoumn == 0)
                    {
                        //TODO : change  _cellPool[bottomMostCellIndex].sizeDelta.y to cached cell height;
                        posY = _cellPool[bottomMostCellIndex].anchoredPosition.y - _cellHeight;// _cellPool[bottomMostCellIndex].sizeDelta.y;
                    }
                    // posY = _cellPool[bottomMostCellIndex].anchoredPosition.y - _cellPool[bottomMostCellIndex].sizeDelta.y;

                    _cellPool[topMostCellIndex].anchoredPosition = new Vector2(posX, posY);
                    _topMostCellColoumn = (_topMostCellColoumn + 1) % _coloumns;

                }
                else {
                    //Move top cell to bottom
                    posY = _cellPool[bottomMostCellIndex].anchoredPosition.y - _cellPool[bottomMostCellIndex].sizeDelta.y;
                    _cellPool[topMostCellIndex].anchoredPosition = new Vector2(_cellPool[topMostCellIndex].anchoredPosition.x, posY);
                }

                //Cell for row at
                _dataSource.SetCell(_cachedCells[topMostCellIndex], currentItemCount);

                //set new indices
                bottomMostCellIndex = topMostCellIndex;
                topMostCellIndex = (topMostCellIndex + 1) % _cellPool.Count;

                currentItemCount++;
                if (!IsGrid) n++;
            }

            //TODO : put the  below block in a sepearte method
            if (IsGrid)
            {
                _bottomMostCellColoumn = _currentColoumn;

                //content size won't remain same everytime for grids.
                if (!_contentSizeIncreased)
                {
                    //if all coloumns are not filled i.e the current coloumn is not last coloumn, the vertical height of content will be more.
                    if (_currentColoumn != _coloumns - 1)
                    {
                        //Resizing the parent.
                        Content.sizeDelta += Vector2.up * _cellPool[topMostCellIndex].sizeDelta.y;
                        n -= 1;
                        _contentSizeIncreased = true;
                    }
                }
                else
                {
                    //if _contentSizeIncreased is true and now the currentcoloumn is last coloumn, it means content size has shrinked.
                    if (_currentColoumn == _coloumns - 1)
                    {
                        Content.sizeDelta -= Vector2.up * _cellPool[topMostCellIndex].sizeDelta.y;
                        _contentSizeIncreased = false;
                    }
                }

            }

            //Content anchor position adjustment.
            // _listContainer.anchoredPosition += n * Vector2.up * _cellPool[topMostCellIndex].sizeDelta.y;

            _cellPool.ForEach((RectTransform cell) => cell.anchoredPosition += n * Vector2.up * _cellPool[topMostCellIndex].sizeDelta.y);

            Content.anchoredPosition -= n * Vector2.up * _cellPool[topMostCellIndex].sizeDelta.y;
           // offsetCorrection = -new Vector2(0, n * _cellPool[topMostCellIndex].sizeDelta.y);
            //  onComplete(-new Vector2(0, n * _cellPool[topMostCellIndex].sizeDelta.y));
            _recycling = false;
             return -new Vector2(0, n * _cellPool[topMostCellIndex].sizeDelta.y);

        }

        /// <summary>
        /// Recycles cells from bottom to top in the List heirarchy
        /// </summary>
      //  private void RecycleBottomToTop(UnityAction<Vector2> onComplete)
        private Vector2 RecycleBottomToTop()
        {
            Debug.Log("bottom to top" + topMostCellIndex);

            _recycling = true;

            int n = 0;
            float posY = 0;

            float posX = 0;
            if (IsGrid) {
                float _posY = _cellPool[topMostCellIndex].anchoredPosition.y;
                //if top most cell is in the first coloumn then the new cell will come above this row
                if (_topMostCellColoumn == 0)
                {
                    posY += _cellPool[topMostCellIndex].rect.height;
                }
                //  float posY = _cellPool[bottomMostCellIndex].anchoredPosition.y - _cellPool[topMostCellIndex].rect.height;
                 _currentColoumn = _topMostCellColoumn;
            }

            //If there is a  cell at bottom avaiable for recycling and current item count is greater than _cellPool length.
            //Since _cellPool is the minimum no of items and no recycling can be done if the item count is already equal to it.
            while (_cellPool[bottomMostCellIndex].MaxY() < _recyclableViewBounds.min.y && currentItemCount > _cellPool.Count)
            {

                if (IsGrid)
                {
                    _currentColoumn -= 1;

                    if (_currentColoumn < 0)
                    {
                        n++;
                        _currentColoumn = _coloumns - 1;
                    }

                    posX = _currentColoumn * _cellWidth;

                    if (_currentColoumn == _coloumns - 1)
                    {
                        //TODO : change  _cellPool[topMostCellIndex].sizeDelta.y to cached cell height;
                        posY = _cellPool[topMostCellIndex].anchoredPosition.y + _cellHeight;// _cellPool[topMostCellIndex].sizeDelta.y;
                    }
                    _cellPool[bottomMostCellIndex].anchoredPosition = new Vector2(posX, posY);
                    _bottomMostCellColoumn = (_bottomMostCellColoumn - 1 + _coloumns) % _coloumns;

                }
                else { 
                //Move top cell to bottom
                posY = _cellPool[topMostCellIndex].anchoredPosition.y + _cellPool[topMostCellIndex].sizeDelta.y;
                _cellPool[bottomMostCellIndex].anchoredPosition = new Vector2(_cellPool[bottomMostCellIndex].anchoredPosition.x, posY);

                n++;
                
                }


                currentItemCount--;

                //Cell for row at
                //TODO: Why currentItemCount - _cellPool.Count
                _dataSource.SetCell(_cachedCells[bottomMostCellIndex], currentItemCount - _cellPool.Count);

                //set new indices
                topMostCellIndex = bottomMostCellIndex;
                bottomMostCellIndex = (bottomMostCellIndex - 1 + _cellPool.Count) % _cellPool.Count;
            }

          
            if (IsGrid) {
                _topMostCellColoumn = _currentColoumn;

                //content size won't remain same everytime for grids.
                if (!_contentSizeIncreased)
                {
                    //if all coloumns are not filled i.e the current coloumn is not 0, the vertical height of content will be more.
                    if (_currentColoumn != 0)
                    {
                        //Resizing the parent.
                        Content.sizeDelta += Vector2.up * _cellPool[topMostCellIndex].sizeDelta.y;
                        n -= 1;
                        _contentSizeIncreased = true;
                    }
                }
                else
                {
                    //if _contentSizeIncreased is true and now the currentcoloumn is 0, it means content size has shrinked.
                    if (_currentColoumn == 0)
                    {
                        Content.sizeDelta -= Vector2.up * _cellPool[topMostCellIndex].sizeDelta.y;
                        _contentSizeIncreased = false;
                    }
                }
            }
            //Content anchor position adjustment.
            //   m_ContentStartPosition += new Vector2(0, n * _cellPool[topMostCellIndex].sizeDelta.y);
            // return new Vector2(0, n * _cellPool[topMostCellIndex].sizeDelta.y);

            _cellPool.ForEach((RectTransform cell) => cell.anchoredPosition -= n * Vector2.up * _cellPool[topMostCellIndex].sizeDelta.y);

            Content.anchoredPosition += n * Vector2.up * _cellPool[topMostCellIndex].sizeDelta.y;
          //  offsetCorrection = new Vector2(0, n * _cellPool[topMostCellIndex].sizeDelta.y);
            //onComplete(new Vector2(0, n * _cellPool[topMostCellIndex].sizeDelta.y));
            _recycling = false;
              return new Vector2(0, n * _cellPool[topMostCellIndex].sizeDelta.y);
        }
        #endregion

        #region  HELPERS
        /// <summary>
        /// Anchoring cell and content rect transforms to top preset. Makes repositioning easy.
        /// </summary>
        /// <param name="rectTransform"></param>
        private void SetTopAnchor(RectTransform rectTransform)
        {
            //Saving to reapply after anchoring. Width and height changes if anchoring is change. 
            float width = rectTransform.rect.width;
            float height = rectTransform.rect.height;

            //Setting top anchor 
            rectTransform.anchorMin = new Vector2(0.5f, 1);
            rectTransform.anchorMax = new Vector2(0.5f, 1);
            rectTransform.pivot = new Vector2(0.5f, 1);

            //Reapply size
            rectTransform.sizeDelta = new Vector2(width, height);
        }

        private void SetTopLeftAnchor(RectTransform rectTransform)
        {
            //Saving to reapply after anchoring. Width and height changes if anchoring is change. 
            float width = rectTransform.rect.width;
            float height = rectTransform.rect.height;

            //Setting top anchor 
            rectTransform.anchorMin = new Vector2(0, 1);
            rectTransform.anchorMax = new Vector2(0, 1);
            rectTransform.pivot = new Vector2(0, 1);

            //Reapply size
            rectTransform.sizeDelta = new Vector2(width, height);
        }
        #endregion

        #region  TESTING
        public void OnDrawGizmos()
        {
            Gizmos.color = Color.green;
            Gizmos.DrawLine(_recyclableViewBounds.min - new Vector3(2000, 0), _recyclableViewBounds.min + new Vector3(2000, 0));
            Gizmos.color = Color.red;
            Gizmos.DrawLine(_recyclableViewBounds.max - new Vector3(2000, 0), _recyclableViewBounds.max + new Vector3(2000, 0));
        }
        #endregion
    }
}
