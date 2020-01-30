using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public static class UIExtension
{
    public static float maxY(this RectTransform rectTransform){
          Vector3[] corners = new Vector3[4];
         rectTransform.GetWorldCorners(corners);
        
            return corners[1].y;
    }

      public static float minY(this RectTransform rectTransform){
          Vector3[] corners = new Vector3[4];
         rectTransform.GetWorldCorners(corners);
        
            return corners[0].y;
    }
}
