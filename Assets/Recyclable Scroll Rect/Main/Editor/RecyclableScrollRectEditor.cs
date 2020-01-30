using UnityEngine.UI;
using UnityEditor.AnimatedValues;
using UnityEditor;

namespace PolyAndCode.UI
{
    [CustomEditor(typeof(RecyclableScrollRect), true)]
    [CanEditMultipleObjects]
    /// <summary>
    ///   Custom Editor for the Recyclable ScrollRect Component.
    ///   Moified Scroll rect custom editor for the ScrollRect-derived component.
    /// </summary>

public class RecyclableScrollRectEditor : Editor {
        SerializedProperty m_Content;
        SerializedProperty m_MovementType;
        SerializedProperty m_Elasticity;
        SerializedProperty m_Inertia;
        SerializedProperty m_DecelerationRate;
        SerializedProperty m_ScrollSensitivity;
        SerializedProperty m_Viewport;
        SerializedProperty m_OnValueChanged;

		//inherited
		SerializedProperty m_Cell;
        SerializedProperty m_SelfInitialize;

        AnimBool m_ShowElasticity;
        AnimBool m_ShowDecelerationRate;
       
        protected virtual void OnEnable()
        {
            m_Content               = serializedObject.FindProperty("m_Content");
            m_MovementType          = serializedObject.FindProperty("m_MovementType");
            m_Elasticity            = serializedObject.FindProperty("m_Elasticity");
            m_Inertia               = serializedObject.FindProperty("m_Inertia");
            m_DecelerationRate      = serializedObject.FindProperty("m_DecelerationRate");
            m_ScrollSensitivity     = serializedObject.FindProperty("m_ScrollSensitivity");
            m_Viewport              = serializedObject.FindProperty("m_Viewport");
            m_OnValueChanged        = serializedObject.FindProperty("m_OnValueChanged");
			
			//Inherited
			m_Cell        = serializedObject.FindProperty("PrototypeCell");
            m_SelfInitialize        = serializedObject.FindProperty("SelfInitialize");

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
            SetAnimBool(m_ShowDecelerationRate, !m_Inertia.hasMultipleDifferentValues && m_Inertia.boolValue == true, instant);
        }

        void SetAnimBool(AnimBool a, bool value, bool instant)
        {
            if (instant)
                a.value = value;
            else
                a.target = value;
        }

        void CalculateCachedValues()
        {
            
        }

        public override void OnInspectorGUI()
        {
            SetAnimBools(false);

            serializedObject.Update();
            // Once we have a reliable way to know if the object changed, only re-cache in that case.
            CalculateCachedValues();

            EditorGUILayout.PropertyField(m_SelfInitialize);
            EditorGUILayout.PropertyField(m_Viewport);
            EditorGUILayout.PropertyField(m_Content);
			EditorGUILayout.PropertyField(m_Cell);
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