//MIT License
//Copyright (c) 2020 Mohammed Iqubal Hussain
//Website : Polyandcode.com 


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
        protected bool IsGrid;

        protected float MinPoolCoverage = 1.5f; // The recyclable pool must cover (viewPort * _poolCoverage) area.
        protected int MinPoolSize = 10; // Cell pool must have a min size
        protected float RecyclingThreshold = .2f; //Threshold for recycling above and below viewport

        public abstract IEnumerator InitCoroutine(System.Action onInitialized = null);

        public abstract Vector2 OnValueChangedListener(Vector2 direction);
    }
}