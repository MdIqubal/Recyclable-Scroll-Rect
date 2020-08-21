// Skipping function InitCoroutine(none), it contains poisonous unsupported syntaxes

func @_PolyAndCode.UI.VerticalRecyclingSystem.SetRecyclingBounds$$() -> () loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :124 :8) {
^entry :
br ^0

^0: // SimpleBlock
%0 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :126 :12) // Not a variable of known type: Viewport
%1 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :126 :37) // Not a variable of known type: _corners
%2 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :126 :12) // Viewport.GetWorldCorners(_corners) (InvocationExpression)
%3 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :127 :31) // Not a variable of known type: _recyclingThreshold
%4 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :127 :54) // Not a variable of known type: _corners
%5 = constant 2 : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :127 :63)
%6 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :127 :54) // _corners[2] (ElementAccessExpression)
%7 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :127 :54) // _corners[2].y (SimpleMemberAccessExpression)
%8 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :127 :70) // Not a variable of known type: _corners
%9 = constant 0 : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :127 :79)
%10 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :127 :70) // _corners[0] (ElementAccessExpression)
%11 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :127 :70) // _corners[0].y (SimpleMemberAccessExpression)
%12 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :127 :54) // Binary expression on unsupported types _corners[2].y - _corners[0].y
%13 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :127 :31) // Binary expression on unsupported types _recyclingThreshold * (_corners[2].y - _corners[0].y)
%15 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :128 :12) // Not a variable of known type: _recyclableViewBounds
%16 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :128 :12) // _recyclableViewBounds.min (SimpleMemberAccessExpression)
%17 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :128 :52) // Not a variable of known type: _corners
%18 = constant 0 : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :128 :61)
%19 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :128 :52) // _corners[0] (ElementAccessExpression)
%20 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :128 :52) // _corners[0].x (SimpleMemberAccessExpression)
%21 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :128 :67) // Not a variable of known type: _corners
%22 = constant 0 : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :128 :76)
%23 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :128 :67) // _corners[0] (ElementAccessExpression)
%24 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :128 :67) // _corners[0].y (SimpleMemberAccessExpression)
%25 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :128 :83) // Not a variable of known type: threshHold
%26 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :128 :67) // Binary expression on unsupported types _corners[0].y - threshHold
%27 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :128 :40) // new Vector3(_corners[0].x, _corners[0].y - threshHold) (ObjectCreationExpression)
%28 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :129 :12) // Not a variable of known type: _recyclableViewBounds
%29 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :129 :12) // _recyclableViewBounds.max (SimpleMemberAccessExpression)
%30 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :129 :52) // Not a variable of known type: _corners
%31 = constant 2 : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :129 :61)
%32 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :129 :52) // _corners[2] (ElementAccessExpression)
%33 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :129 :52) // _corners[2].x (SimpleMemberAccessExpression)
%34 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :129 :67) // Not a variable of known type: _corners
%35 = constant 2 : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :129 :76)
%36 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :129 :67) // _corners[2] (ElementAccessExpression)
%37 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :129 :67) // _corners[2].y (SimpleMemberAccessExpression)
%38 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :129 :83) // Not a variable of known type: threshHold
%39 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :129 :67) // Binary expression on unsupported types _corners[2].y + threshHold
%40 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :129 :40) // new Vector3(_corners[2].x, _corners[2].y + threshHold) (ObjectCreationExpression)
br ^1

^1: // ExitBlock
return

}
// Skipping function CreateCellPool(), it contains poisonous unsupported syntaxes

// Skipping function OnValueChangedListener(none), it contains poisonous unsupported syntaxes

// Skipping function RecycleTopToBottom(), it contains poisonous unsupported syntaxes

// Skipping function RecycleBottomToTop(), it contains poisonous unsupported syntaxes

func @_PolyAndCode.UI.VerticalRecyclingSystem.SetTopAnchor$UnityEngine.RectTransform$(none) -> () loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :509 :8) {
^entry (%_rectTransform : none):
%0 = cbde.alloca none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :509 :34)
cbde.store %_rectTransform, %0 : memref<none> loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :509 :34)
br ^0

^0: // SimpleBlock
%1 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :512 :26) // Not a variable of known type: rectTransform
%2 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :512 :26) // rectTransform.rect (SimpleMemberAccessExpression)
%3 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :512 :26) // rectTransform.rect.width (SimpleMemberAccessExpression)
%5 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :513 :27) // Not a variable of known type: rectTransform
%6 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :513 :27) // rectTransform.rect (SimpleMemberAccessExpression)
%7 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :513 :27) // rectTransform.rect.height (SimpleMemberAccessExpression)
%9 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :516 :12) // Not a variable of known type: rectTransform
%10 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :516 :12) // rectTransform.anchorMin (SimpleMemberAccessExpression)
%11 = constant unit loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :516 :50) // 0.5f (NumericLiteralExpression)
%12 = constant 1 : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :516 :56)
%13 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :516 :38) // new Vector2(0.5f, 1) (ObjectCreationExpression)
%14 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :517 :12) // Not a variable of known type: rectTransform
%15 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :517 :12) // rectTransform.anchorMax (SimpleMemberAccessExpression)
%16 = constant unit loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :517 :50) // 0.5f (NumericLiteralExpression)
%17 = constant 1 : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :517 :56)
%18 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :517 :38) // new Vector2(0.5f, 1) (ObjectCreationExpression)
%19 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :518 :12) // Not a variable of known type: rectTransform
%20 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :518 :12) // rectTransform.pivot (SimpleMemberAccessExpression)
%21 = constant unit loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :518 :46) // 0.5f (NumericLiteralExpression)
%22 = constant 1 : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :518 :52)
%23 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :518 :34) // new Vector2(0.5f, 1) (ObjectCreationExpression)
%24 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :521 :12) // Not a variable of known type: rectTransform
%25 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :521 :12) // rectTransform.sizeDelta (SimpleMemberAccessExpression)
%26 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :521 :50) // Not a variable of known type: width
%27 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :521 :57) // Not a variable of known type: height
%28 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :521 :38) // new Vector2(width, height) (ObjectCreationExpression)
br ^1

^1: // ExitBlock
return

}
func @_PolyAndCode.UI.VerticalRecyclingSystem.SetTopLeftAnchor$UnityEngine.RectTransform$(none) -> () loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :524 :8) {
^entry (%_rectTransform : none):
%0 = cbde.alloca none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :524 :38)
cbde.store %_rectTransform, %0 : memref<none> loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :524 :38)
br ^0

^0: // SimpleBlock
%1 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :527 :26) // Not a variable of known type: rectTransform
%2 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :527 :26) // rectTransform.rect (SimpleMemberAccessExpression)
%3 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :527 :26) // rectTransform.rect.width (SimpleMemberAccessExpression)
%5 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :528 :27) // Not a variable of known type: rectTransform
%6 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :528 :27) // rectTransform.rect (SimpleMemberAccessExpression)
%7 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :528 :27) // rectTransform.rect.height (SimpleMemberAccessExpression)
%9 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :531 :12) // Not a variable of known type: rectTransform
%10 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :531 :12) // rectTransform.anchorMin (SimpleMemberAccessExpression)
%11 = constant 0 : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :531 :50)
%12 = constant 1 : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :531 :53)
%13 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :531 :38) // new Vector2(0, 1) (ObjectCreationExpression)
%14 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :532 :12) // Not a variable of known type: rectTransform
%15 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :532 :12) // rectTransform.anchorMax (SimpleMemberAccessExpression)
%16 = constant 0 : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :532 :50)
%17 = constant 1 : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :532 :53)
%18 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :532 :38) // new Vector2(0, 1) (ObjectCreationExpression)
%19 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :533 :12) // Not a variable of known type: rectTransform
%20 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :533 :12) // rectTransform.pivot (SimpleMemberAccessExpression)
%21 = constant 0 : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :533 :46)
%22 = constant 1 : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :533 :49)
%23 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :533 :34) // new Vector2(0, 1) (ObjectCreationExpression)
%24 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :536 :12) // Not a variable of known type: rectTransform
%25 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :536 :12) // rectTransform.sizeDelta (SimpleMemberAccessExpression)
%26 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :536 :50) // Not a variable of known type: width
%27 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :536 :57) // Not a variable of known type: height
%28 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :536 :38) // new Vector2(width, height) (ObjectCreationExpression)
br ^1

^1: // ExitBlock
return

}
func @_PolyAndCode.UI.VerticalRecyclingSystem.OnDrawGizmos$$() -> () loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :541 :8) {
^entry :
br ^0

^0: // SimpleBlock
// Entity from another assembly: Gizmos
%0 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :543 :12) // Gizmos.color (SimpleMemberAccessExpression)
// Entity from another assembly: Color
%1 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :543 :27) // Color.green (SimpleMemberAccessExpression)
// Entity from another assembly: Gizmos
%2 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :544 :28) // Not a variable of known type: _recyclableViewBounds
%3 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :544 :28) // _recyclableViewBounds.min (SimpleMemberAccessExpression)
%4 = constant 2000 : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :544 :68)
%5 = constant 0 : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :544 :74)
%6 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :544 :56) // new Vector3(2000, 0) (ObjectCreationExpression)
%7 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :544 :28) // Binary expression on unsupported types _recyclableViewBounds.min - new Vector3(2000, 0)
%8 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :544 :78) // Not a variable of known type: _recyclableViewBounds
%9 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :544 :78) // _recyclableViewBounds.min (SimpleMemberAccessExpression)
%10 = constant 2000 : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :544 :118)
%11 = constant 0 : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :544 :124)
%12 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :544 :106) // new Vector3(2000, 0) (ObjectCreationExpression)
%13 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :544 :78) // Binary expression on unsupported types _recyclableViewBounds.min + new Vector3(2000, 0)
%14 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :544 :12) // Gizmos.DrawLine(_recyclableViewBounds.min - new Vector3(2000, 0), _recyclableViewBounds.min + new Vector3(2000, 0)) (InvocationExpression)
// Entity from another assembly: Gizmos
%15 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :545 :12) // Gizmos.color (SimpleMemberAccessExpression)
// Entity from another assembly: Color
%16 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :545 :27) // Color.red (SimpleMemberAccessExpression)
// Entity from another assembly: Gizmos
%17 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :546 :28) // Not a variable of known type: _recyclableViewBounds
%18 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :546 :28) // _recyclableViewBounds.max (SimpleMemberAccessExpression)
%19 = constant 2000 : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :546 :68)
%20 = constant 0 : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :546 :74)
%21 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :546 :56) // new Vector3(2000, 0) (ObjectCreationExpression)
%22 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :546 :28) // Binary expression on unsupported types _recyclableViewBounds.max - new Vector3(2000, 0)
%23 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :546 :78) // Not a variable of known type: _recyclableViewBounds
%24 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :546 :78) // _recyclableViewBounds.max (SimpleMemberAccessExpression)
%25 = constant 2000 : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :546 :118)
%26 = constant 0 : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :546 :124)
%27 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :546 :106) // new Vector3(2000, 0) (ObjectCreationExpression)
%28 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :546 :78) // Binary expression on unsupported types _recyclableViewBounds.max + new Vector3(2000, 0)
%29 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\VerticalRecyclingSystem.cs" :546 :12) // Gizmos.DrawLine(_recyclableViewBounds.max - new Vector3(2000, 0), _recyclableViewBounds.max + new Vector3(2000, 0)) (InvocationExpression)
br ^1

^1: // ExitBlock
return

}
