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
        private int leftMostCellIndex, rightMostCellIndex; //Topmost and bottommost cell in the List
        private int _leftMostCellRow, _RightMostCellRow; // used for recyling in Grid layout. leftmost and rightmost row

        //Cached zero vector 
        private Vector2 zeroVector = Vector2.zero;
        #region INIT
        public HorizontalRecyclingSystem(RectTransform prototypeCell, RectTransform viewport, RectTransform content, IRecyclableScrollRectDataSource dataSource, bool isGrid, int rows)
        {
            PrototypeCell = prototypeCell;
            Viewport = viewport;
            Content = content;
            DataSource = dataSource;
            IsGrid = isGrid;
            _rows = isGrid ? rows : 1;
            _recyclableViewBounds = new Bounds();
        }

        /// <summary>
        /// Corotuine for initiazation.
        /// Using coroutine for init because few UI stuff requires a frame to update
        /// </summary>
        /// <param name="onInitialized">callback when init done</param>
        /// <returns></returns>
        public override IEnumerator InitCoroutine(Action onInitialized)
        {
            //Setting up container and bounds
            SetLeftAnchor(Content);
            Content.anchoredPosition = Vector3.zero;
            yield return null;
            SetRecyclingBounds();

            //Cell Poool
            CreateCellPool();
            currentItemCount = _cellPool.Count;
            leftMostCellIndex = 0;
            rightMostCellIndex = _cellPool.Count - 1;

            //Set content width according to no of coloums
            int coloums = Mathf.CeilToInt((float)_cellPool.Count / _rows);
            float contentXSize = coloums * _cellWidth;
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
            _cellHeight = Content.rect.height / _rows;
            _cellWidth = PrototypeCell.sizeDelta.x / PrototypeCell.sizeDelta.y * _cellHeight;

            //Reset
            _leftMostCellRow = _RightMostCellRow = 0;

            //Temps
            float currentPoolCoverage = 0;
            int poolSize = 0;
            float posX = 0;
            float posY = 0;

            //Get the required pool coverage and mininum size for the Cell pool
            float requriedCoverage = MinPoolCoverage * Viewport.rect.width;
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
                    posY = -_RightMostCellRow * _cellHeight;
                    item.anchoredPosition = new Vector2(posX, posY);
                    if (++_RightMostCellRow >= _rows)
                    {
                        _RightMostCellRow = 0;
                        posX += _cellWidth;
                        currentPoolCoverage += item.rect.width;
                    }
                }
                else
                {
                    item.anchoredPosition = new Vector2(posX, 0);
                    posX = item.anchoredPosition.x + item.rect.width;
                    currentPoolCoverage += item.rect.width;
                }

                //Setting data for Cell
                _cachedCells.Add(item.GetComponent<ICell>());
                DataSource.SetCell(_cachedCells[_cachedCells.Count - 1], poolSize);

                //Update the Pool size
                poolSize++;
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

            if (direction.x < 0 && _cellPool[rightMostCellIndex].MinX() < _recyclableViewBounds.max.x)
            {
                return RecycleLeftToRight();
            }
            else if (direction.x > 0 && _cellPool[leftMostCellIndex].MaxX() > _recyclableViewBounds.min.x)
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
            float posX = IsGrid ? _cellPool[rightMostCellIndex].anchoredPosition.x : 0;
            float posY = 0;

            //to determine if content size needs to be updated
            int additionalColoums = 0;

            //Recycle until cell at left is avaiable and current item count smaller than datasource
            while (_cellPool[leftMostCellIndex].MaxX() < _recyclableViewBounds.min.x && currentItemCount < DataSource.GetItemCount())
            {
                if (IsGrid)
                {
                    if (++_RightMostCellRow >= _rows)
                    {
                        n++;
                        _RightMostCellRow = 0;
                        posX = _cellPool[rightMostCellIndex].anchoredPosition.x + _cellWidth;
                        additionalColoums++;
                    }

                    //Move Left most cell to right
                    posY = -_RightMostCellRow * _cellHeight;
                    _cellPool[leftMostCellIndex].anchoredPosition = new Vector2(posX, posY);

                    if (++_leftMostCellRow >= _rows)
                    {
                        _leftMostCellRow = 0;
                        additionalColoums--;
                    }
                }
                else
                {
                    //Move Left most cell to right
                    posX = _cellPool[rightMostCellIndex].anchoredPosition.x + _cellPool[rightMostCellIndex].sizeDelta.x;
                    _cellPool[leftMostCellIndex].anchoredPosition = new Vector2(posX, _cellPool[leftMostCellIndex].anchoredPosition.y);
                }

                //Cell for row at
                DataSource.SetCell(_cachedCells[leftMostCellIndex], currentItemCount);

                //set new indices
                rightMostCellIndex = leftMostCellIndex;
                leftMostCellIndex = (leftMostCellIndex + 1) % _cellPool.Count;

                currentItemCount++;
                if (!IsGrid) n++;
            }

            //Content size adjustment 
            if (IsGrid)
            {
                Content.sizeDelta += additionalColoums * Vector2.right * _cellWidth;
                if (additionalColoums > 0)
                {
                    n -= additionalColoums;
                }
            }

            //Content anchor position adjustment.
            _cellPool.ForEach((RectTransform cell) => cell.anchoredPosition -= n * Vector2.right * _cellPool[leftMostCellIndex].sizeDelta.x);
            Content.anchoredPosition += n * Vector2.right * _cellPool[leftMostCellIndex].sizeDelta.x;
            _recycling = false;
            return n * Vector2.right * _cellPool[leftMostCellIndex].sizeDelta.x;

        }

        /// <summary>
        /// Recycles cells from Right to Left in the List heirarchy
        /// </summary>
        private Vector2 RecycleRightToleft()
        {
            _recycling = true;

            int n = 0;
            float posX = IsGrid ? _cellPool[leftMostCellIndex].anchoredPosition.x : 0;
            float posY = 0;

            //to determine if content size needs to be updated
            int additionalColoums = 0;
            //Recycle until cell at Right end is avaiable and current item count is greater than cellpool size
            while (_cellPool[rightMostCellIndex].MinX() > _recyclableViewBounds.max.x && currentItemCount > _cellPool.Count)
            {
                if (IsGrid)
                {
                    if (--_leftMostCellRow < 0)
                    {
                        n++;
                        _leftMostCellRow = _rows - 1;
                        posX = _cellPool[leftMostCellIndex].anchoredPosition.x - _cellWidth;
                        additionalColoums++;
                    }

                    //Move Right most cell to left
                    posY = -_leftMostCellRow * _cellHeight;
                    _cellPool[rightMostCellIndex].anchoredPosition = new Vector2(posX, posY);

                    if (--_RightMostCellRow < 0)
                    {
                        _RightMostCellRow = _rows - 1;
                        additionalColoums--;
                    }
                }
                else
                {
                    //Move Right most cell to left
                    posX = _cellPool[leftMostCellIndex].anchoredPosition.x - _cellPool[leftMostCellIndex].sizeDelta.x;
                    _cellPool[rightMostCellIndex].anchoredPosition = new Vector2(posX, _cellPool[rightMostCellIndex].anchoredPosition.y);
                    n++;
                }

                currentItemCount--;
                //Cell for row at
                DataSource.SetCell(_cachedCells[rightMostCellIndex], currentItemCount - _cellPool.Count);

                //set new indices
                leftMostCellIndex = rightMostCellIndex;
                rightMostCellIndex = (rightMostCellIndex - 1 + _cellPool.Count) % _cellPool.Count;
            }

            //Content size adjustment
            if (IsGrid)
            {
                Content.sizeDelta += additionalColoums * Vector2.right * _cellWidth;
                if (additionalColoums > 0)
                {
                    n -= additionalColoums;
                }
            }

            //Content anchor position adjustment.
            _cellPool.ForEach((RectTransform cell) => cell.anchoredPosition += n * Vector2.right * _cellPool[leftMostCellIndex].sizeDelta.x);
            Content.anchoredPosition -= n * Vector2.right * _cellPool[leftMostCellIndex].sizeDelta.x;
            _recycling = false;
            return -n * Vector2.right * _cellPool[leftMostCellIndex].sizeDelta.x;
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
