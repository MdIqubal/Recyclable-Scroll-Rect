//MIT License
//Copyright (c) 2020 Mohammed Iqubal Hussain
//Website : Polyandcode.com 

using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace PolyAndCode.UI
{

    /// <summary>
    /// Recyling system for Vertical type.
    /// </summary>
    public class VerticalRecyclingSystem : RecyclingSystem
    {
        //Assigned by constructor
        private readonly int _coloumns;

        //Cell dimensions
        private float _cellWidth, _cellHeight;

        //Pool Generation
        private List<RectTransform> _cellPool;
        private List<ICell> _cachedCells;
        private Bounds _recyclableViewBounds;

        //Temps, Flags 
        private readonly Vector3[] _corners = new Vector3[4];
        private bool _recycling;

        //Trackers
        private int currentItemCount; //item count corresponding to the datasource.
        private int topMostCellIndex, bottomMostCellIndex; //Topmost and bottommost cell in the heirarchy
        private int _topMostCellColoumn, _bottomMostCellColoumn; // used for recyling in Grid layout. top-most and bottom-most coloumn

        //Cached zero vector 
        private Vector2 zeroVector = Vector2.zero;

        #region INIT
        public VerticalRecyclingSystem(RectTransform prototypeCell, RectTransform viewport, RectTransform content, IRecyclableScrollRectDataSource dataSource, bool isGrid, int coloumns)
        {
            PrototypeCell = prototypeCell;
            Viewport = viewport;
            Content = content;
            DataSource = dataSource;
            IsGrid = isGrid;
            _coloumns = isGrid ? coloumns : 1;
            _recyclableViewBounds = new Bounds();
        }

        /// <summary>
        /// Corotuine for initiazation.
        /// Using coroutine for init because few UI stuff requires a frame to update
        /// </summary>
        /// <param name="onInitialized">callback when init done</param>
        /// <returns></returns>>
        public override IEnumerator InitCoroutine(System.Action onInitialized)
        {
            SetTopAnchor(Content);
            Content.anchoredPosition = Vector3.zero;
            yield return null;
            SetRecyclingBounds();

            //Cell Poool
            CreateCellPool();
            currentItemCount = _cellPool.Count;
            topMostCellIndex = 0;
            bottomMostCellIndex = _cellPool.Count - 1;

            //Set content height according to no of rows
            int noOfRows = (int)Mathf.Ceil((float)_cellPool.Count / (float)_coloumns);
            float contentYSize = noOfRows * _cellHeight;
            Content.sizeDelta = new Vector2(Content.sizeDelta.x, contentYSize);
            SetTopAnchor(Content);

            if (onInitialized != null) onInitialized();
        }

        /// <summary>
        /// Sets the uppper and lower bounds for recycling cells.
        /// </summary>
        private void SetRecyclingBounds()
        {
            Viewport.GetWorldCorners(_corners);
            float threshHold = RecyclingThreshold * (_corners[2].y - _corners[0].y);
            _recyclableViewBounds.min = new Vector3(_corners[0].x, _corners[0].y - threshHold);
            _recyclableViewBounds.max = new Vector3(_corners[2].x, _corners[2].y + threshHold);
        }

        /// <summary>
        /// Creates cell Pool for recycling, Caches ICells
        /// </summary>
        private void CreateCellPool()
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

            //Reset
            _topMostCellColoumn = _bottomMostCellColoumn = 0;

            //Temps
            float currentPoolCoverage = 0;
            int poolSize = 0;
            float posX = 0;
            float posY = 0;

            //set new cell size according to its aspect ratio
            _cellWidth = Content.rect.width / _coloumns;
            _cellHeight = PrototypeCell.sizeDelta.y / PrototypeCell.sizeDelta.x * _cellWidth;

            //Get the required pool coverage and mininum size for the Cell pool
            float requriedCoverage = MinPoolCoverage * Viewport.rect.height;
            int minPoolSize = Math.Min(MinPoolSize, DataSource.GetItemCount());

            //create cells untill the Pool area is covered and pool size is the minimum required
            while ((poolSize < minPoolSize || currentPoolCoverage < requriedCoverage) && poolSize < DataSource.GetItemCount())
            {
                //Instantiate and add to Pool
                RectTransform item = (UnityEngine.Object.Instantiate(PrototypeCell.gameObject)).GetComponent<RectTransform>();
                item.name = "Cell";
                item.sizeDelta = new Vector2(_cellWidth, _cellHeight);
                _cellPool.Add(item);
                item.SetParent(Content, false);

                if (IsGrid)
                {
                    posX = _bottomMostCellColoumn * _cellWidth;
                    item.anchoredPosition = new Vector2(posX, posY);
                    if (++_bottomMostCellColoumn >= _coloumns)
                    {
                        _bottomMostCellColoumn = 0;
                        posY -= _cellHeight;
                        currentPoolCoverage += item.rect.height;
                    }
                }
                else
                {
                    item.anchoredPosition = new Vector2(0, posY);
                    posY = item.anchoredPosition.y - item.rect.height;
                    currentPoolCoverage += item.rect.height;
                }

                //Setting data for Cell
                _cachedCells.Add(item.GetComponent<ICell>());
                DataSource.SetCell(_cachedCells[_cachedCells.Count - 1], poolSize);

                //Update the Pool size
                poolSize++;
            }

            //TODO : you alrady have a _currentColoumn varaiable. Why this calculation?????
            if (IsGrid)
            {
                _bottomMostCellColoumn = (_bottomMostCellColoumn - 1 + _coloumns) % _coloumns;
            }

            //Deactivate prototype cell if it is not a prefab(i.e it's present in scene)
            if (PrototypeCell.gameObject.scene.IsValid())
            {
                PrototypeCell.gameObject.SetActive(false);
            }
        }
        #endregion

        #region RECYCLING
        /// <summary>
        /// Recyling entry point
        /// </summary>
        /// <param name="direction">scroll direction </param>
        /// <returns></returns>
        public override Vector2 OnValueChangedListener(Vector2 direction)
        {
            if (_recycling || _cellPool == null || _cellPool.Count == 0) return zeroVector;

            //Updating Recyclable view bounds since it can change with resolution changes.
            SetRecyclingBounds();

            if (direction.y > 0 && _cellPool[bottomMostCellIndex].MaxY() > _recyclableViewBounds.min.y)
            {
                return RecycleTopToBottom();
            }
            else if (direction.y < 0 && _cellPool[topMostCellIndex].MinY() < _recyclableViewBounds.max.y)
            {
                return RecycleBottomToTop();
            }

            return zeroVector;
        }

        /// <summary>
        /// Recycles cells from top to bottom in the List heirarchy
        /// </summary>
        private Vector2 RecycleTopToBottom()
        {
            _recycling = true;

            int n = 0;
            float posY = IsGrid ? _cellPool[bottomMostCellIndex].anchoredPosition.y : 0;
            float posX = 0;

            //to determine if content size needs to be updated
            int additionalRows = 0;
            //Recycle until cell at Top is avaiable and current item count smaller than datasource
            while (_cellPool[topMostCellIndex].MinY() > _recyclableViewBounds.max.y && currentItemCount < DataSource.GetItemCount())
            {
                if (IsGrid)
                {
                    if (++_bottomMostCellColoumn >= _coloumns)
                    {
                        n++;
                        _bottomMostCellColoumn = 0;
                        posY = _cellPool[bottomMostCellIndex].anchoredPosition.y - _cellHeight;
                        additionalRows++;
                    }

                    //Move top cell to bottom
                    posX = _bottomMostCellColoumn * _cellWidth;
                    _cellPool[topMostCellIndex].anchoredPosition = new Vector2(posX, posY);

                    if (++_topMostCellColoumn >= _coloumns)
                    {
                        _topMostCellColoumn = 0;
                        additionalRows--;
                    }
                }
                else
                {
                    //Move top cell to bottom
                    posY = _cellPool[bottomMostCellIndex].anchoredPosition.y - _cellPool[bottomMostCellIndex].sizeDelta.y;
                    _cellPool[topMostCellIndex].anchoredPosition = new Vector2(_cellPool[topMostCellIndex].anchoredPosition.x, posY);
                }

                //Cell for row at
                DataSource.SetCell(_cachedCells[topMostCellIndex], currentItemCount);

                //set new indices
                bottomMostCellIndex = topMostCellIndex;
                topMostCellIndex = (topMostCellIndex + 1) % _cellPool.Count;

                currentItemCount++;
                if (!IsGrid) n++;
            }

            //Content size adjustment 
            if (IsGrid)
            {
                Content.sizeDelta += additionalRows * Vector2.up * _cellHeight;
                //TODO : check if it is supposed to be done only when > 0
                if (additionalRows > 0)
                {
                    n -= additionalRows;
                }
            }

            //Content anchor position adjustment.
            _cellPool.ForEach((RectTransform cell) => cell.anchoredPosition += n * Vector2.up * _cellPool[topMostCellIndex].sizeDelta.y);
            Content.anchoredPosition -= n * Vector2.up * _cellPool[topMostCellIndex].sizeDelta.y;
            _recycling = false;
            return -new Vector2(0, n * _cellPool[topMostCellIndex].sizeDelta.y);

        }

        /// <summary>
        /// Recycles cells from bottom to top in the List heirarchy
        /// </summary>
        private Vector2 RecycleBottomToTop()
        {
            _recycling = true;

            int n = 0;
            float posY = IsGrid ? _cellPool[topMostCellIndex].anchoredPosition.y : 0;
            float posX = 0;

            //to determine if content size needs to be updated
            int additionalRows = 0;
            //Recycle until cell at bottom is avaiable and current item count is greater than cellpool size
            while (_cellPool[bottomMostCellIndex].MaxY() < _recyclableViewBounds.min.y && currentItemCount > _cellPool.Count)
            {

                if (IsGrid)
                {
                    if (--_topMostCellColoumn < 0)
                    {
                        n++;
                        _topMostCellColoumn = _coloumns - 1;
                        posY = _cellPool[topMostCellIndex].anchoredPosition.y + _cellHeight;
                        additionalRows++;
                    }

                    //Move bottom cell to top
                    posX = _topMostCellColoumn * _cellWidth;
                    _cellPool[bottomMostCellIndex].anchoredPosition = new Vector2(posX, posY);

                    if (--_bottomMostCellColoumn < 0)
                    {
                        _bottomMostCellColoumn = _coloumns - 1;
                        additionalRows--;
                    }
                }
                else
                {
                    //Move bottom cell to top
                    posY = _cellPool[topMostCellIndex].anchoredPosition.y + _cellPool[topMostCellIndex].sizeDelta.y;
                    _cellPool[bottomMostCellIndex].anchoredPosition = new Vector2(_cellPool[bottomMostCellIndex].anchoredPosition.x, posY);
                    n++;
                }

                currentItemCount--;

                //Cell for row at
                DataSource.SetCell(_cachedCells[bottomMostCellIndex], currentItemCount - _cellPool.Count);

                //set new indices
                topMostCellIndex = bottomMostCellIndex;
                bottomMostCellIndex = (bottomMostCellIndex - 1 + _cellPool.Count) % _cellPool.Count;
            }

            if (IsGrid)
            {
                Content.sizeDelta += additionalRows * Vector2.up * _cellHeight;
                //TODOL : check if it is supposed to be done only when > 0
                if (additionalRows > 0)
                {
                    n -= additionalRows;
                }
            }

            _cellPool.ForEach((RectTransform cell) => cell.anchoredPosition -= n * Vector2.up * _cellPool[topMostCellIndex].sizeDelta.y);
            Content.anchoredPosition += n * Vector2.up * _cellPool[topMostCellIndex].sizeDelta.y;
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

        #region TESTING
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
