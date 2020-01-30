using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using UnityEngine.UI;

[ExecuteInEditMode]
public static class RecyclableScrollViewEditorTool
{
    const string PrefabPath  = "Assets/Recyclable Scroll Rect/Main/Prefab/Recyclable Scroll View.prefab";

    [MenuItem("GameObject/UI/Recyclable Scroll View")]
    private static void createRecyclableScrollView()
    {
        GameObject selected = Selection.activeGameObject;

		//If selected isn't a UI gameobject then find a Canvas
        if (!selected || selected.transform.GetType() != typeof(RectTransform))
        {
            selected = GameObject.FindObjectOfType<Canvas>().gameObject;
        }

        if (!selected)
        {
            return;
        }

        GameObject asset = AssetDatabase.LoadAssetAtPath(PrefabPath, typeof(GameObject)) as GameObject;

        GameObject item = UnityEngine.Object.Instantiate(asset) as GameObject;
        item.name = "Recyclable Scroll View";

        item.transform.SetParent(selected.transform);
        item.transform.localPosition = Vector3.zero;
        Selection.activeGameObject = item;
		Undo.RegisterCreatedObjectUndo(item,"Create Recycalable Scroll view");
    }
}
