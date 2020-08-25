//MIT License
//Copyright (c) 2020 Mohammed Iqubal Hussain
//Website : Polyandcode.com 

using System;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using UnityEngine;
using UnityEngine.UI;

namespace PolyAndCode.UI
{
    public class RecyclableScrollRect : ScrollRect
    {

        public bool Grid;

        public enum DirectionType
        {
            Vertical,
            Horizontal
        }


        public DirectionType Direction;

        [SerializeField]
        public int Segments {
            set {
                _segments = Math.Max(value, 2);
            }
            get {
                return _segments;
            }
        } //coloums for vertical and rows for horizontal.

        [SerializeField]
        private int _segments;
        public RectTransform PrototypeCell;
        public bool SelfInitialize = true;

        [HideInInspector]
        public IRecyclableScrollRectDataSource DataSource;

        private RecyclingSystem recyclableScrollRect;

        protected override void Start()
        {

            //Currently supports only vertical lists
            vertical = false;
            horizontal = true;

            if (!Application.isPlaying) return;

            if (SelfInitialize) Initialize();
        }


        private void Initialize()
        {
            if (Direction == DirectionType.Vertical)
            {  
                recyclableScrollRect = new VerticalRecyclingSystem(PrototypeCell, viewport, content, DataSource, Grid, Segments);
            }
            else if (Direction == DirectionType.Horizontal)
            {
                recyclableScrollRect = new HorizontalRecyclingSystem(PrototypeCell, viewport, content, DataSource, Grid, Segments);
            }

            vertical = Direction == DirectionType.Vertical;
            horizontal = Direction == DirectionType.Horizontal;

            onValueChanged.RemoveListener(OnValueChangedListener);

            //TODO : assign valuechanged listener after pool creation to avoid unintentional recycling before pool creation.(untested rare scenerio)
            StartCoroutine(recyclableScrollRect.InitCoroutine(() =>
                                                               onValueChanged.AddListener(OnValueChangedListener)
                                                              ));
            //  StartCoroutine(recyclableScrollRect.InitCoroutine(null));
            //	onValueChanged.AddListener(recyclableScrollRect.OnValueChangedlistener);
        }

        public void Initialize(IRecyclableScrollRectDataSource dataSource)
        {
            DataSource = dataSource;
            Initialize();
        }


        public void OnValueChangedListener(Vector2 args)
        {
            m_ContentStartPosition += recyclableScrollRect.OnValueChangedListener(velocity);
        }

        #region Testing
        private void OnDrawGizmos()
        {
            if (recyclableScrollRect is VerticalRecyclingSystem)
            {
                ((VerticalRecyclingSystem)recyclableScrollRect).OnDrawGizmos();
            }

            if (recyclableScrollRect is HorizontalRecyclingSystem)
            {
                ((HorizontalRecyclingSystem)recyclableScrollRect).OnDrawGizmos();
            }

        }
        #endregion

    }
}