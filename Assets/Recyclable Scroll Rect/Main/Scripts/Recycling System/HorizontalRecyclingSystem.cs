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
    /// Recyling system for horizontal type.
    /// </summary>
    public class HorizontalRecyclingSystem : RecyclingSystem
    {
        //Assigned by constructor
        private readonly int _rows;

        //Trackers
        private int _itemCount;
        private int _currentTopItem, _currentBottomItem;
        private int _leftMostCellIndex, _rightMostCellIndex; //Topmost and bottommost cell in the List
        private int _LeftMostCellRow, _RightMostCellRow; // used for recyling in Grid layout. leftmost and rightmost row
        private int _FirstCellRow,_LastCellRow; //used for loop recycling in grid layout.

        //Cached zero vector 
        private Vector2 zeroVector = Vector2.zero;
        #region INIT
        public HorizontalRecyclingSystem(RectTransform prototypeCell, RectTransform viewport, RectTransform content, RectOffset padding, float spacing, IRecyclableScrollRectDataSource dataSource, bool isGrid,bool isLoop,bool isReverse, int rows)
        {
            PrototypeCell = prototypeCell;
            Viewport = viewport;
            Content = content;
            Padding = padding;
            Spacing = spacing;
            DataSource = dataSource;
            IsGrid = isGrid;
            IsLoop = isLoop;
            IsReverse = isReverse;

            _rows = isGrid ? rows : 1;
            _recyclableViewBounds = new Bounds();
        }

        /// <summary>
        /// Corotuine for initiazation.
        /// Using coroutine for init because few UI stuff requires a frame to update
        /// </summary>
        /// <param name="onInitialized">callback when init done</param>
        /// <returns></returns>
        public override void Init(Action onInitialized)
        {
            //Setting up container and bounds
            SetLeftAnchor(Content);
            Content.anchoredPosition = Vector3.zero;
            SetRecyclingBounds();

            //Cell Poool
            CreateCellPool();

            _currentTopItem = (_cellPool.Count > _itemCount ? _cellPool.Count % _itemCount : _cellPool.Count) - 1;
            _currentBottomItem = 0;

            _FirstCellRow = 0;
            _LastCellRow = (_itemCount % _rows) - 1;

            if (_LastCellRow == -1) _LastCellRow = _rows - 1;

            _leftMostCellIndex = 0; 
            _rightMostCellIndex = _cellPool.Count - 1;


            //Set content width according to no of colomns
            int coloums;

            if (IsLoop && IsGrid && _itemCount < _cellPool.Count)
            {
                int colPerCluster = Mathf.CeilToInt((float)_itemCount / _rows);

                int residual = _cellPool.Count % _itemCount;

                int col1 = Mathf.CeilToInt(((float)(_cellPool.Count - residual) * colPerCluster) / _itemCount);
                int col2 = Mathf.CeilToInt((float)residual/ _rows);

                coloums = col1 + col2;
            }
            else
            {
                coloums = Mathf.CeilToInt(((float)_cellPool.Count) / _rows);
            }

            float contentXSize = coloums * _cellWidth + (coloums - 1) * Spacing + Padding.left + Padding.right;
            Content.sizeDelta = new Vector2(contentXSize, Content.sizeDelta.y);
            SetLeftAnchor(Content);

            if (onInitialized != null) onInitialized();
        }

        /// <summary>
        /// Sets the uppper and lower bounds for recycling cells.
        /// </summary>
        private void SetRecyclingBounds()
        {
            Viewport.GetWorldCorners(_corners);
            float threshHold = RecyclingThreshold * (_corners[2].x - _corners[0].x);
            _recyclableViewBounds.min = new Vector3(_corners[0].x - threshHold, _corners[0].y);
            _recyclableViewBounds.max = new Vector3(_corners[2].x + threshHold, _corners[2].y);
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
            SetLeftAnchor(PrototypeCell);

            //set new cell size according to its aspect ratio
            _cellHeight = ((Content.rect.height - Padding.top - Padding.bottom - (_rows - 1) * Spacing) / _rows);
            _cellWidth = PrototypeCell.sizeDelta.x / PrototypeCell.sizeDelta.y * _cellHeight;

            _itemCount = DataSource.GetItemCount();
            //Reset
            _LeftMostCellRow = _RightMostCellRow = 0;

            //Get the required pool coverage and mininum size for the Cell pool
            //Temps
            float currentPoolCoverage = 0;
            int poolSize = 0;
            int poolItem = 0;
            float posX = Padding.left;
            float posY = 0;

            //Get the required pool coverage and mininum size for the Cell pool
            float requriedCoverage = MinPoolCoverage * Viewport.rect.width;
            bool isReset;
            int minPoolSize;

            if (IsLoop)
            {
                minPoolSize = IsGrid ? MinPoolSize * _rows : MinPoolSize;

                //create cells untill the Pool area is covered and pool size is the minimum required
                while (poolSize < minPoolSize && currentPoolCoverage < requriedCoverage)
                {
                    //Instantiate and add to Pool
                    RectTransform item = (UnityEngine.Object.Instantiate(PrototypeCell.gameObject)).GetComponent<RectTransform>();
                    item.name = "Cell " + poolSize.ToString();
                    item.sizeDelta = new Vector2(_cellWidth, _cellHeight);
                    _cellPool.Add(item);
                    item.SetParent(Content, false);

                    isReset = poolItem + 1 >= _itemCount;

                    if (IsGrid)
                    {
                        posY = -_RightMostCellRow * _cellHeight - _RightMostCellRow * Spacing - Padding.top;
                        item.anchoredPosition = new Vector2(posX, posY);
                        if (++_RightMostCellRow >= _rows || poolItem + 1 >= _itemCount)
                        { 
                            _RightMostCellRow = _FirstCellRow;
                            posX += _cellWidth + Spacing;
                            currentPoolCoverage += item.rect.width + Spacing;
                        }
                    }
                    else
                    {
                        posY = (Padding.bottom - Padding.top) / 2;
                        item.anchoredPosition = new Vector2(posX, posY);
                        posX = item.anchoredPosition.x + item.rect.width + Spacing;
                        currentPoolCoverage += item.rect.width + Spacing;
                    }

                    //Setting data for Cell
                    _cachedCells.Add(item.GetComponent<ICell>());
                    DataSource.SetCell(_cachedCells[_cachedCells.Count - 1], poolItem);

                    //Update the Pool size
                    poolSize++;
                    poolItem++;

                    if (poolItem >= _itemCount) poolItem = 0;
                }
            }
            else
            {
                minPoolSize = Math.Min(MinPoolSize, _itemCount);

                //create cells untill the Pool area is covered and pool size is the minimum required
                while ((poolSize < minPoolSize || currentPoolCoverage < requriedCoverage) && poolItem < _itemCount)
                {
                    //Instantiate and add to Pool
                    RectTransform item = (UnityEngine.Object.Instantiate(PrototypeCell.gameObject)).GetComponent<RectTransform>();
                    item.name = "Cell " + poolSize.ToString();
                    item.sizeDelta = new Vector2(_cellWidth, _cellHeight);
                    _cellPool.Add(item);
                    item.SetParent(Content, false);

                    if (IsGrid)
                    {
                        posY = -_RightMostCellRow * _cellHeight - _RightMostCellRow * Spacing - Padding.top;
                        item.anchoredPosition = new Vector2(posX, posY);
                        if (++_RightMostCellRow >= _rows)
                        {
                            _RightMostCellRow = _FirstCellRow;
                            posX += _cellWidth + Spacing;
                            currentPoolCoverage += item.rect.width + Spacing;
                        }
                    }
                    else
                    {
                        posY = (Padding.bottom - Padding.top) / 2;
                        item.anchoredPosition = new Vector2(posX, posY);
                        posX = item.anchoredPosition.x + item.rect.width + Spacing;
                        currentPoolCoverage += item.rect.width + Spacing;
                    }

                    //Setting data for Cell
                    _cachedCells.Add(item.GetComponent<ICell>());
                    DataSource.SetCell(_cachedCells[_cachedCells.Count - 1], poolItem);

                    //Update the Pool size
                    poolSize++;
                    poolItem++;
                }
            }

            if (IsGrid)
            {
                _RightMostCellRow = (_RightMostCellRow - 1 + _rows) % _rows;
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

            if (direction.x < 0 && _cellPool[_rightMostCellIndex].MinX() < _recyclableViewBounds.max.x)
            {
                return RecycleLeftToRight();
            }
            else if (direction.x > 0 && _cellPool[_leftMostCellIndex].MaxX() > _recyclableViewBounds.min.x)
            {
                return RecycleRightToleft();
            }
            return zeroVector;
        }

        /// <summary>
        /// Recycles cells from Left to Right in the List heirarchy
        /// </summary>
        private Vector2 RecycleLeftToRight()
        {
            _recycling = true;

            int n = 0;
            float posX = IsGrid ? _cellPool[_rightMostCellIndex].anchoredPosition.x : 0;
            float posY = 0;

            //to determine if content size needs to be updated
            int additionalColoums = 0;

            //Recycle until cell at right is avaiable and current item count smaller than datasource (Not In Loop)
            bool canScroll = IsLoop ? true : _currentTopItem + 1 < _itemCount;

            while (_cellPool[_leftMostCellIndex].MaxX() < _recyclableViewBounds.min.x && canScroll)
            {
                _currentTopItem++;
                _currentBottomItem++;

                if (IsLoop)
                {
                    canScroll = true;
                    if (_currentTopItem >= _itemCount) _currentTopItem = 0;
                    if (_currentBottomItem >= _itemCount) _currentBottomItem = 0;
                }
                else
                {
                    canScroll = _currentTopItem + 1 < _itemCount;
                }

                //Cell for row at
                DataSource.SetCell(_cachedCells[_leftMostCellIndex], _currentTopItem);

                if (IsGrid)
                {
                    if (_currentTopItem == 0)
                    {
                        n++;
                        _RightMostCellRow = _FirstCellRow;
                        posX = _cellPool[_rightMostCellIndex].anchoredPosition.x + _cellWidth + Spacing;
                        additionalColoums++;
                    }
                    else if (++_RightMostCellRow >= _rows)
                    {
                        n++;
                        _RightMostCellRow = _FirstCellRow;
                        posX = _cellPool[_rightMostCellIndex].anchoredPosition.x + _cellWidth + Spacing;
                        additionalColoums++;
                    }

                    //Move Left most cell to right
                    posY = -_RightMostCellRow * _cellHeight - _RightMostCellRow * Spacing - Padding.top;
                    _cellPool[_leftMostCellIndex].anchoredPosition = new Vector2(posX, posY);

                    if (_currentBottomItem == 0)
                    {
                        _LeftMostCellRow = _FirstCellRow;
                        additionalColoums--;
                    }
                    else if (++_LeftMostCellRow >= _rows)
                    {
                        _LeftMostCellRow = _FirstCellRow;
                        additionalColoums--;
                    }

                    Debug.Log(_LeftMostCellRow);
                }
                else
                {
                    //Move Left most cell to right
                    posX = _cellPool[_rightMostCellIndex].anchoredPosition.x + _cellPool[_rightMostCellIndex].sizeDelta.x + Spacing;
                    _cellPool[_leftMostCellIndex].anchoredPosition = new Vector2(posX, _cellPool[_leftMostCellIndex].anchoredPosition.y);
                }

                //set new indices
                _rightMostCellIndex = _leftMostCellIndex;
                _leftMostCellIndex++;
                if (_leftMostCellIndex >= _cellPool.Count) _leftMostCellIndex = 0;

                if (!IsGrid) n++;
            }

            //Content size adjustment 
            if (IsGrid)
            {
                Content.sizeDelta += additionalColoums * Vector2.right * (_cellWidth + Spacing);
                if (additionalColoums > 0 || _currentBottomItem == 0 || _currentTopItem == _itemCount - 1)
                {
                    n -= additionalColoums;
                }
            }

            //Content anchor position adjustment.
            _cellPool.ForEach((RectTransform cell) => cell.anchoredPosition -= n * Vector2.right * (_cellPool[_leftMostCellIndex].sizeDelta.x + Spacing));
            Content.anchoredPosition += n * Vector2.right * (_cellPool[_leftMostCellIndex].sizeDelta.x + Spacing);
            _recycling = false;
            return n * Vector2.right * (_cellPool[_leftMostCellIndex].sizeDelta.x + Spacing);

        }

        /// <summary>
        /// Recycles cells from Right to Left in the List heirarchy
        /// </summary>
        private Vector2 RecycleRightToleft()
        {
            _recycling = true;

            int n = 0;
            float posX = IsGrid ? _cellPool[_leftMostCellIndex].anchoredPosition.x : 0;
            float posY = 0;

            //to determine if content size needs to be updated
            int additionalColoums = 0;
            //Recycle until cell at Left end is avaiable and current item count is greater than cellpool size
            bool canScroll = IsLoop ? true : _currentBottomItem > 0;

            while (_cellPool[_rightMostCellIndex].MinX() > _recyclableViewBounds.max.x && canScroll)
            {
                _currentTopItem--;
                _currentBottomItem--;

                if (IsLoop)
                {
                    canScroll = true;
                    if (_currentTopItem < 0) _currentTopItem = _itemCount - 1;
                    if (_currentBottomItem < 0) _currentBottomItem = _itemCount - 1;
                }
                else
                {
                    canScroll = _currentBottomItem > 0;
                }

                //Cell for row at
                DataSource.SetCell(_cachedCells[_rightMostCellIndex], _currentBottomItem);

                if (IsGrid)
                {
                    if (_currentBottomItem == _itemCount - 1)
                    {
                        n++;
                        _LeftMostCellRow = _LastCellRow;
                        posX = _cellPool[_leftMostCellIndex].anchoredPosition.x - _cellWidth - Spacing;
                        additionalColoums++;
                    }
                    else if (--_LeftMostCellRow < 0)
                    {
                        n++;
                        _LeftMostCellRow = _rows - 1;
                        posX = _cellPool[_leftMostCellIndex].anchoredPosition.x - _cellWidth - Spacing;
                        additionalColoums++;
                    }

                    //Move Right most cell to left
                    posY = -_LeftMostCellRow * _cellHeight - _LeftMostCellRow * Spacing - Padding.top;
                    _cellPool[_rightMostCellIndex].anchoredPosition = new Vector2(posX, posY);

                    if (_currentTopItem == _itemCount - 1)
                    {
                        _RightMostCellRow = _LastCellRow;
                        additionalColoums--;
                    }
                    else if (--_RightMostCellRow < 0)
                    {
                        _RightMostCellRow = _rows - 1;
                        additionalColoums--;
                    }
                }
                else
                {
                    //Move Right most cell to left
                    posX = _cellPool[_leftMostCellIndex].anchoredPosition.x - _cellPool[_leftMostCellIndex].sizeDelta.x - Spacing;
                    _cellPool[_rightMostCellIndex].anchoredPosition = new Vector2(posX, _cellPool[_rightMostCellIndex].anchoredPosition.y);
                    n++;
                }

                //set new indices
                _leftMostCellIndex = _rightMostCellIndex;
                _rightMostCellIndex--;
                if (_rightMostCellIndex < 0) _rightMostCellIndex = _cellPool.Count - 1;
            }

            //Content size adjustment
            if (IsGrid)
            {
                Content.sizeDelta += additionalColoums * Vector2.right * (_cellWidth + Spacing);
                //if (additionalColoums > 0)
                //{
                //    n -= additionalColoums;
                //}
            }

            //Content anchor position adjustment.
            _cellPool.ForEach((RectTransform cell) => cell.anchoredPosition += n * Vector2.right * (_cellPool[_leftMostCellIndex].sizeDelta.x + Spacing));
            Content.anchoredPosition -= n * Vector2.right * (_cellPool[_leftMostCellIndex].sizeDelta.x + Spacing);
            _recycling = false;
            return -n * Vector2.right * (_cellPool[_leftMostCellIndex].sizeDelta.x + Spacing);
        }
        #endregion

        #region  HELPERS
        /// <summary>
        /// Anchoring cell and content rect transforms to top preset. Makes repositioning easy.
        /// </summary>
        /// <param name="rectTransform"></param>
        private void SetLeftAnchor(RectTransform rectTransform)
        {
            //Saving to reapply after anchoring. Width and height changes if anchoring is change. 
            float width = rectTransform.rect.width;
            float height = rectTransform.rect.height;

            Vector2 pos = IsGrid ? new Vector2(0, 1) : new Vector2(0, 0.5f);

            //Setting top anchor 
            rectTransform.anchorMin = pos;
            rectTransform.anchorMax = pos;
            rectTransform.pivot = pos;

            //Reapply size
            rectTransform.sizeDelta = new Vector2(width, height);
        }

        #endregion

        #region  TESTING
        public void OnDrawGizmos()
        {
            Gizmos.color = Color.green;
            Gizmos.DrawLine(_recyclableViewBounds.min - new Vector3(0, 2000), _recyclableViewBounds.min + new Vector3(0, 2000));
            Gizmos.color = Color.red;
            Gizmos.DrawLine(_recyclableViewBounds.max - new Vector3(0, 2000), _recyclableViewBounds.max + new Vector3(0, 2000));
        }
        #endregion

    }
}
