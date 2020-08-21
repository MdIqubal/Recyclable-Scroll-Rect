

using System.Collections;
using System.Collections.Generic;
using UnityEngine;
namespace PolyAndCode.UI
{
    public abstract class RecyclingSystem
    {
        protected RectTransform Viewport, Content;
        protected bool IsGrid;
        protected RectTransform PrototypeCell;

        protected float MinPoolCoverage = 1.5f; // The recyclable pool must cover (viewPort * _poolCoverage) area.
        protected int MinPoolSize = 10; // Cell pool must have a min size

        public abstract IEnumerator InitCoroutine(System.Action onInitialized);

        public abstract Vector2 OnValueChangedListener(Vector2 args);
    }
}