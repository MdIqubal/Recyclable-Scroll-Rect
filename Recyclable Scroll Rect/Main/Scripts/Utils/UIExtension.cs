﻿//MIT License
//Copyright (c) 2020 Mohammed Iqubal Hussain
//Website : Polyandcode.com 

using UnityEngine;

/// <summary>
/// Extension methods for Rect Transform
/// </summary>
public static class UIExtension
{
    public static Vector3[] GetCorners(this RectTransform rectTransform)
    {
        Vector3[] corners = new Vector3[4];
        rectTransform.GetWorldCorners(corners);
        return corners;
    }
    public static float MaxY(this RectTransform rectTransform)
    {
        return rectTransform.GetCorners()[1].y;
    }

    public static float MinY(this RectTransform rectTransform)
    {
        return rectTransform.GetCorners()[0].y;
    }

    public static float MaxX(this RectTransform rectTransform)
    {
        return rectTransform.GetCorners()[2].x;
    }

    public static float MinX(this RectTransform rectTransform)
    {
        return rectTransform.GetCorners()[0].x;
    }

}