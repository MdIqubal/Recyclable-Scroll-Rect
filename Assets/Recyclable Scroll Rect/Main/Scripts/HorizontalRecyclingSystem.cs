using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;


namespace PolyAndCode.UI
{
    public class HorizontalRecyclingSystem : RecyclingSystem
    {

        private int _rows;

        private float _cellWidth, _cellHeight;
        //TODO : why a _currentRow and _RightMostCellRow, aren't both same?
        private int _leftMostCellRow, _RightMostCellRow;
        private bool _contentSizeIncreased;
        //DataSource. Responsible for Data related operations

        private IRecyclableScrollRectDataSource _dataSource;

        //Pool Generation
        private List<RectTransform> _cellPool;
        private List<ICell> _cachedCells;
        private RectTransform _listContainer;
        //  private float _poolCoverage = 1.5f; // the recyclable pool must cover (viewPort * _poolCoverage) area.
        private Bounds _recyclableViewBounds;
        private float _recyclingThreshold = .2f; //Threshold for recycling above and below viewport

        //Temps, Flags
        private Vector3[] _corners = new Vector3[4];
        private bool _recycling;

        //Trackers
        private int leftMostCellIndex, rightMostCellIndex; //Topmost and bottommost cell in the heirarchy
        private int currentItemCount; //item count corresponding the datasource.

        public HorizontalRecyclingSystem(RectTransform prototypeCell, RectTransform viewport, RectTransform content, IRecyclableScrollRectDataSource dataSource, bool isGrid, int rows)
        {
            
            PrototypeCell = prototypeCell;
            Viewport = viewport;
            Content = content;
            _dataSource = dataSource;
            IsGrid = isGrid;
            _rows = isGrid ? rows : 1;
        }

        public override IEnumerator InitCoroutine(Action onInitialized)
        {
            //Setting up container and bounds
            SetAnchor(Content);
            Content.anchoredPosition = Vector3.zero;
            yield return null;
            SetRecyclingBounds();

            //Cell Poool
            CreateCellPool();
            leftMostCellIndex = 0;
            rightMostCellIndex = _cellPool.Count - 1;
            yield return null;
        //    Debug.Log(Mathf.CeilToInt((float)_cellPool.Count / _rows));
            int coloums = Mathf.CeilToInt((float)_cellPool.Count /_rows);
            SetAnchor(Content);
            //Set content height according to no of cells
            float contentXSize = coloums * PrototypeCell.sizeDelta.x;
          //  Debug.Log(contentXSize);
            Content.sizeDelta = new Vector2(contentXSize, Content.sizeDelta.y);
            currentItemCount = _cellPool.Count;
            onInitialized();
        }


        /// <summary>
        /// Sets the uppper and lower bounds for recycling cells.
        /// </summary>
        private void SetRecyclingBounds()
        {
            Viewport.GetWorldCorners(_corners);
            float threshHold = _recyclingThreshold * (_corners[2].x - _corners[0].x);
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
            SetAnchor(PrototypeCell);

            //Temps
            float currentPoolCoverage = 0;
            int poolSize = 0;
            float posX = 0;
            float posY = 0;


            _cellHeight = Content.rect.height / _rows;
            _cellWidth = PrototypeCell.sizeDelta.x / PrototypeCell.sizeDelta.y * _cellHeight;
            PrototypeCell.sizeDelta = new Vector3(_cellWidth, _cellHeight);
             _leftMostCellRow = 0;


            //Recycle cells untill the Pool area is covered
            float requriedCoverage = MinPoolCoverage * Viewport.rect.width;

            int minPoolSize = Math.Min(MinPoolSize, _dataSource.GetItemCount());

            var currentRow = 0;
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
                    currentRow++;
                    posY = currentRow >= _rows ? 0 : posY - _cellHeight;
                    posX = currentRow >= _rows ? posX + _cellWidth : posX;
                    if (currentRow >= _rows)
                    {
                        currentRow = 0;
                        currentPoolCoverage += item.rect.width;
                    }
                }
                else
                {
                    //Positioning
                    item.anchoredPosition = new Vector2(posX, 0);
                    posX = item.anchoredPosition.x + item.rect.width;
                    currentPoolCoverage += item.rect.width;
                }


                //Data setting in Cell
                _cachedCells.Add(item.GetComponent<ICell>());
                _dataSource.SetCell(_cachedCells[_cachedCells.Count - 1], poolSize);

                //Update the Pool size
                poolSize++;
            }

            _leftMostCellRow = 0;
            _RightMostCellRow = (currentRow - 1 + _rows) % _rows;
            if (_RightMostCellRow != _rows - 1) {
                _contentSizeIncreased = true;
            }
            //Deactivate prototype cell if it is not a prefab(i.e it's present in scene)
            if (PrototypeCell.gameObject.scene.IsValid())
            {
                PrototypeCell.gameObject.SetActive(false);
            }
        }

        Vector2 zeroVector = Vector2.zero;
        public override Vector2 OnValueChangedListener(Vector2 direction)
        {
           // Debug.Log(args);
            if (_recycling || _cellPool == null || _cellPool.Count == 0) return zeroVector;
            foreach (var i in _cellPool)
            {
                if (i == _cellPool[leftMostCellIndex])
                {
                    i.GetComponent<Image>().color = Color.red;
                }
                else if (i == _cellPool[rightMostCellIndex])
                {
                    i.GetComponent<Image>().color = Color.green;
                }
                else
                {
                    i.GetComponent<Image>().color = Color.white;

                }
            }

            //Updating Recyclable view bounds since it can change with resolution changes.
            SetRecyclingBounds();

             
            if (direction.x < 0 && _cellPool[rightMostCellIndex].MinX() < _recyclableViewBounds.max.x)
            {

                //recycle right to left
                return RecycleLeftToRight();
            }
            else if (direction.x > 0 && _cellPool[leftMostCellIndex].MaxX() > _recyclableViewBounds.min.x)
            {

                //recycleleft to right
                return RecycleRightToleft();
            }
            return zeroVector;
        }

        /// <summary>
        /// Recycles cells from top to bottom in the List heirarchy
        /// </summary>
        private Vector2 RecycleLeftToRight()
        {
            _recycling = true;

            int n = 0;
            float posX = IsGrid ? _cellPool[rightMostCellIndex].anchoredPosition.x : 0;
            float posY = 0;

            int additionalColoums = 0;
            while (_cellPool[leftMostCellIndex].MaxX() < _recyclableViewBounds.min.x && currentItemCount < _dataSource.GetItemCount())
            {
                if (IsGrid)
                {
                    _RightMostCellRow++;
                    if (_RightMostCellRow >= _rows)
                    {
                        n++;
                        _RightMostCellRow = 0;
                        posX = _cellPool[rightMostCellIndex].anchoredPosition.x + _cellWidth;
                        additionalColoums++;
                    }
                    posY = -_RightMostCellRow * _cellHeight;

                    /*if (_RightMostCellRow == 0)
                    {
                        posX = _cellPool[rightMostCellIndex].anchoredPosition.x + _cellWidth;
                    }*/

                    _cellPool[leftMostCellIndex].anchoredPosition = new Vector2(posX, posY);

                    _leftMostCellRow++;
                    if (_leftMostCellRow >= _rows)
                    {
                        _leftMostCellRow = 0;
                        additionalColoums--;
                    }
                }
                else
                {
                    posX = _cellPool[rightMostCellIndex].anchoredPosition.x + _cellPool[rightMostCellIndex].sizeDelta.x;
                    _cellPool[leftMostCellIndex].anchoredPosition = new Vector2(posX, _cellPool[leftMostCellIndex].anchoredPosition.y);
                }
                //Cell for row at
                _dataSource.SetCell(_cachedCells[leftMostCellIndex], currentItemCount);

                //set new indices
                rightMostCellIndex = leftMostCellIndex;
                leftMostCellIndex = (leftMostCellIndex + 1) % _cellPool.Count;

                currentItemCount++;
                if (!IsGrid) n++;
            }
            if (IsGrid)
            {
                Debug.Log(additionalColoums);
                Content.sizeDelta += additionalColoums * Vector2.right * _cellWidth;
                n -= additionalColoums;
            }
            //Content anchor position adjustment.
            _cellPool.ForEach((RectTransform cell) => cell.anchoredPosition -= n * Vector2.right * _cellPool[leftMostCellIndex].sizeDelta.x);
            Content.anchoredPosition += n * Vector2.right * _cellPool[leftMostCellIndex].sizeDelta.x;
            _recycling = false;
            return n * Vector2.right * _cellPool[leftMostCellIndex].sizeDelta.x;

        }

        /// <summary>
        /// Recycles cells from bottom to top in the List heirarchy
        /// </summary>
        private Vector2 RecycleRightToleft()
        {
            _recycling = true;

            int n = 0;
            float posX = IsGrid ? _cellPool[leftMostCellIndex].anchoredPosition.x :   0;
            float posY = 0;

            //if (IsGrid)
            //{
            //    float _posX = _cellPool[leftMostCellIndex].anchoredPosition.x - _cellWidth;
            //    //if top most cell is in the first coloumn then the new cell will come above this row
            //    if (_leftMostCellRow == 0)
            //    {
            //        _posX -= _cellWidth;
            //    }
            //    //  float posY = _cellPool[bottomMostCellIndex].anchoredPosition.y - _cellPool[topMostCellIndex].rect.height;
            //}

            int additionalColoums = 0;
            while (_cellPool[rightMostCellIndex].MinX() > _recyclableViewBounds.max.x && currentItemCount > _cellPool.Count)
            {
                if (IsGrid)
                {
                    _leftMostCellRow--;

                    if (_leftMostCellRow < 0)
                    {
                        n++;
                        _leftMostCellRow = _rows - 1;
                        additionalColoums++;
                    }
                    posY = -_leftMostCellRow * _cellHeight;

                    if (_leftMostCellRow == _rows - 1)
                    {
                        //TODO : change  _cellPool[bottomMostCellIndex].sizeDelta.y to cached cell height;
                        posX = _cellPool[leftMostCellIndex].anchoredPosition.x - _cellWidth;// _cellPool[bottomMostCellIndex].sizeDelta.y;
                    }

                    _cellPool[rightMostCellIndex].anchoredPosition = new Vector2(posX, posY);

                    _RightMostCellRow--;
                    if (_RightMostCellRow < 0)
                    {
                        _RightMostCellRow = _rows - 1;
                        additionalColoums--;
                    }

                    //  _RightMostCellRow = (_RightMostCellRow - 1 + _rows) % _rows;


                }
                else
                {
                    //Move top cell to bottom
                    posX = _cellPool[leftMostCellIndex].anchoredPosition.x - _cellPool[leftMostCellIndex].sizeDelta.x;
                    _cellPool[rightMostCellIndex].anchoredPosition = new Vector2(posX, _cellPool[rightMostCellIndex].anchoredPosition.y);
                    n++;
                }

                currentItemCount--;
                //Cell for row at
                _dataSource.SetCell(_cachedCells[rightMostCellIndex], currentItemCount - _cellPool.Count);

                //set new indices
                leftMostCellIndex = rightMostCellIndex;
                rightMostCellIndex = (rightMostCellIndex - 1 + _cellPool.Count) % _cellPool.Count;
            }
            
            if (IsGrid)
            {
                Debug.Log(additionalColoums);
                Content.sizeDelta += additionalColoums * Vector2.right * _cellWidth;
                if (additionalColoums > 0) {
                    n -= additionalColoums;
                } 
            }
            
            //Content anchor position adjustment.
            _cellPool.ForEach((RectTransform cell) => cell.anchoredPosition += n * Vector2.right * _cellPool[leftMostCellIndex].sizeDelta.x);
            Content.anchoredPosition -= n * Vector2.right * _cellPool[leftMostCellIndex].sizeDelta.x;
            _recycling = false;
            return -n * Vector2.right * _cellPool[leftMostCellIndex].sizeDelta.x;
        }

        #region  HELPERS

        /// <summary>
        /// Anchoring cell and content rect transforms to top preset. Makes repositioning easy.
        /// </summary>
        /// <param name="rectTransform"></param>
        private void SetAnchor(RectTransform rectTransform)
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
