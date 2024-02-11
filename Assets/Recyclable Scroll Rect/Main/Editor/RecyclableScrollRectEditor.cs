//MIT License
//Copyright (c) 2020 Mohammed Iqubal Hussain
//Website : Polyandcode.com 

using UnityEngine.UI;
using UnityEditor.AnimatedValues;
using UnityEditor;
using UnityEngine;

namespace PolyAndCode.UI
{
    [CustomEditor(typeof(RecyclableScrollRect), true)]
    [CanEditMultipleObjects]
    /// <summary>
    /// Custom Editor for the Recyclable Scroll Rect Component which is derived from Scroll Rect.
    /// </summary>

    public class RecyclableScrollRectEditor : Editor
    {
        SerializedProperty m_Content;
        SerializedProperty m_MovementType;
        SerializedProperty m_Elasticity;
        SerializedProperty m_Inertia;
        SerializedProperty m_DecelerationRate;
        SerializedProperty m_ScrollSensitivity;
        SerializedProperty m_Viewport;
        SerializedProperty m_OnValueChanged;

        //inherited
        SerializedProperty _protoTypeCell;
        SerializedProperty _selfInitialize;
        SerializedProperty _direction;
        SerializedProperty _padding;
        SerializedProperty _spacing;
        SerializedProperty _grid;
        SerializedProperty _loop;
        SerializedProperty _reverse;

        AnimBool m_ShowElasticity;
        AnimBool m_ShowDecelerationRate;

        RecyclableScrollRect _script;
        protected virtual void OnEnable()
        {
            _script = (RecyclableScrollRect)target;

            m_Content = serializedObject.FindProperty("m_Content");
            m_MovementType = serializedObject.FindProperty("m_MovementType");
            m_Elasticity = serializedObject.FindProperty("m_Elasticity");
            m_Inertia = serializedObject.FindProperty("m_Inertia");
            m_DecelerationRate = serializedObject.FindProperty("m_DecelerationRate");
            m_ScrollSensitivity = serializedObject.FindProperty("m_ScrollSensitivity");
            m_Viewport = serializedObject.FindProperty("m_Viewport");
            m_OnValueChanged = serializedObject.FindProperty("m_OnValueChanged");

            //Inherited
            _protoTypeCell = serializedObject.FindProperty("PrototypeCell");
            _selfInitialize = serializedObject.FindProperty("SelfInitialize");
            _direction = serializedObject.FindProperty("Direction");
            _padding = serializedObject.FindProperty("Padding");
            _spacing = serializedObject.FindProperty("Spacing");
            _grid = serializedObject.FindProperty("IsGrid");
            _loop = serializedObject.FindProperty("IsLoop");
            _reverse = serializedObject.FindProperty("IsReverse");

            m_ShowElasticity = new AnimBool(Repaint);
            m_ShowDecelerationRate = new AnimBool(Repaint);
            SetAnimBools(true);
        }

        protected virtual void OnDisable()
        {
            m_ShowElasticity.valueChanged.RemoveListener(Repaint);
            m_ShowDecelerationRate.valueChanged.RemoveListener(Repaint);
        }

        void SetAnimBools(bool instant)
        {
            SetAnimBool(m_ShowElasticity, !m_MovementType.hasMultipleDifferentValues && m_MovementType.enumValueIndex == (int)ScrollRect.MovementType.Elastic, instant);
            SetAnimBool(m_ShowDecelerationRate, !m_Inertia.hasMultipleDifferentValues && m_Inertia.boolValue, instant);
        }

        void SetAnimBool(AnimBool a, bool value, bool instant)
        {
            if (instant)
                a.value = value;
            else
                a.target = value;
        }

        public override void OnInspectorGUI()
        {
            SetAnimBools(false);
            serializedObject.Update();

            EditorGUILayout.PropertyField(_direction);
            EditorGUILayout.PropertyField(_grid, new GUIContent("Grid"));
            if (_grid.boolValue)
            {
                string title = _direction.enumValueIndex == (int)RecyclableScrollRect.DirectionType.Vertical ? "Coloumns" : "Rows";
                _script.Segments = EditorGUILayout.IntField(title, _script.Segments);
            }

            EditorGUILayout.PropertyField(_loop);
            using (var scope = new EditorGUI.DisabledGroupScope(true))
            {
                EditorGUILayout.PropertyField(_reverse);
            }

            EditorGUILayout.PropertyField(_padding);

            if (_grid.boolValue)
            {
                EditorGUILayout.PropertyField(_spacing);
            }
            else
            {
                float value = EditorGUILayout.FloatField("Spacing", _direction.enumValueIndex == (int)RecyclableScrollRect.DirectionType.Vertical ? _script.Spacing.y : _script.Spacing.x);
                _script.Spacing = new Vector2(value,value);
            }
                
            EditorGUILayout.PropertyField(_selfInitialize);
            EditorGUILayout.PropertyField(m_Viewport);
            EditorGUILayout.PropertyField(m_Content);
            EditorGUILayout.PropertyField(_protoTypeCell);
            EditorGUILayout.Space();

            EditorGUILayout.PropertyField(m_MovementType);
            if (EditorGUILayout.BeginFadeGroup(m_ShowElasticity.faded))
            {
                EditorGUI.indentLevel++;
                EditorGUILayout.PropertyField(m_Elasticity);
                EditorGUI.indentLevel--;
            }
            EditorGUILayout.EndFadeGroup();

            EditorGUILayout.PropertyField(m_Inertia);
            if (EditorGUILayout.BeginFadeGroup(m_ShowDecelerationRate.faded))
            {
                EditorGUI.indentLevel++;
                EditorGUILayout.PropertyField(m_DecelerationRate);
                EditorGUI.indentLevel--;
            }
            EditorGUILayout.EndFadeGroup();

            EditorGUILayout.PropertyField(m_ScrollSensitivity);

            EditorGUILayout.Space();

            EditorGUILayout.PropertyField(m_OnValueChanged);

            serializedObject.ApplyModifiedProperties();
        }
    }
}