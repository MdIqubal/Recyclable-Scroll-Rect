//MIT License
//Copyright (c) 2020 Mohammed Iqubal Hussain
//Website : Polyandcode.com 

using System.Collections.Generic;
using System.Collections;
using UnityEngine;
namespace PolyAndCode.UI
{
    /// <summary>
    /// Absract Class for creating a Recycling system.
    /// </summary>
    public abstract class RecyclingSystem
    {
        public IRecyclableScrollRectDataSource DataSource;

        protected RectTransform Viewport, Content;
        protected RectTransform PrototypeCell;
        protected RectOffset Padding;
        protected float Spacing;
        protected bool IsGrid;
        protected bool IsLoop;
        protected bool IsReverse;

        //Cell dimensions
        protected float _cellWidth, _cellHeight;

        //Pool Generation
        protected List<RectTransform> _totalCellPool;
        protected List<RectTransform> _cacheCellPool;
        protected List<ICell> _cachedCells;
        protected Bounds _recyclableViewBounds;
        public List<ICell> CachedCells => _cachedCells;

        //Trackers
        protected int _itemCount;
        protected int _currentTopItem, _currentBottomItem;

        //Temps, Flags
        protected readonly Vector3[] _corners = new Vector3[4];
        protected bool _recycling;

        protected float MinPoolCoverage = 1.5f; // The recyclable pool must cover (viewPort * _poolCoverage) area.
        protected int MinPoolSize = 10; // Cell pool must have a min size
        protected float RecyclingThreshold = .2f; //Threshold for recycling above and below viewport

        public abstract void Init(System.Action onInitialized = null);
        public abstract void Reset(System.Action onReset = null);
        public abstract void Refresh(System.Action onRefresh = null);


        public abstract Vector2 OnValueChangedListener(Vector2 direction);
    }
}