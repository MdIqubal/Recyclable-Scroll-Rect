// Skipping function InitCoroutine(none), it contains poisonous unsupported syntaxes

func @_PolyAndCode.UI.HorizontalRecyclingSystem.SetRecyclingBounds$$() -> () loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\HorizontalRecyclingSystem.cs" :77 :8) {
^entry :
br ^0

^0: // SimpleBlock
%0 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\HorizontalRecyclingSystem.cs" :79 :12) // Not a variable of known type: Viewport
%1 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\HorizontalRecyclingSystem.cs" :79 :37) // Not a variable of known type: _corners
%2 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\HorizontalRecyclingSystem.cs" :79 :12) // Viewport.GetWorldCorners(_corners) (InvocationExpression)
%3 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\HorizontalRecyclingSystem.cs" :80 :31) // Not a variable of known type: _recyclingThreshold
%4 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\HorizontalRecyclingSystem.cs" :80 :54) // Not a variable of known type: _corners
%5 = constant 2 : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\HorizontalRecyclingSystem.cs" :80 :63)
%6 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\HorizontalRecyclingSystem.cs" :80 :54) // _corners[2] (ElementAccessExpression)
%7 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\HorizontalRecyclingSystem.cs" :80 :54) // _corners[2].x (SimpleMemberAccessExpression)
%8 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\HorizontalRecyclingSystem.cs" :80 :70) // Not a variable of known type: _corners
%9 = constant 0 : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\HorizontalRecyclingSystem.cs" :80 :79)
%10 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\HorizontalRecyclingSystem.cs" :80 :70) // _corners[0] (ElementAccessExpression)
%11 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\HorizontalRecyclingSystem.cs" :80 :70) // _corners[0].x (SimpleMemberAccessExpression)
%12 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\HorizontalRecyclingSystem.cs" :80 :54) // Binary expression on unsupported types _corners[2].x - _corners[0].x
%13 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\HorizontalRecyclingSystem.cs" :80 :31) // Binary expression on unsupported types _recyclingThreshold * (_corners[2].x - _corners[0].x)
%15 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\HorizontalRecyclingSystem.cs" :81 :12) // Not a variable of known type: _recyclableViewBounds
%16 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\HorizontalRecyclingSystem.cs" :81 :12) // _recyclableViewBounds.min (SimpleMemberAccessExpression)
%17 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\HorizontalRecyclingSystem.cs" :81 :52) // Not a variable of known type: _corners
%18 = constant 0 : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\HorizontalRecyclingSystem.cs" :81 :61)
%19 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\HorizontalRecyclingSystem.cs" :81 :52) // _corners[0] (ElementAccessExpression)
%20 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\HorizontalRecyclingSystem.cs" :81 :52) // _corners[0].x (SimpleMemberAccessExpression)
%21 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\HorizontalRecyclingSystem.cs" :81 :68) // Not a variable of known type: threshHold
%22 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\HorizontalRecyclingSystem.cs" :81 :52) // Binary expression on unsupported types _corners[0].x - threshHold
%23 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\HorizontalRecyclingSystem.cs" :81 :80) // Not a variable of known type: _corners
%24 = constant 0 : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\HorizontalRecyclingSystem.cs" :81 :89)
%25 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\HorizontalRecyclingSystem.cs" :81 :80) // _corners[0] (ElementAccessExpression)
%26 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\HorizontalRecyclingSystem.cs" :81 :80) // _corners[0].y (SimpleMemberAccessExpression)
%27 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\HorizontalRecyclingSystem.cs" :81 :40) // new Vector3(_corners[0].x - threshHold, _corners[0].y) (ObjectCreationExpression)
%28 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\HorizontalRecyclingSystem.cs" :82 :12) // Not a variable of known type: _recyclableViewBounds
%29 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\HorizontalRecyclingSystem.cs" :82 :12) // _recyclableViewBounds.max (SimpleMemberAccessExpression)
%30 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\HorizontalRecyclingSystem.cs" :82 :52) // Not a variable of known type: _corners
%31 = constant 2 : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\HorizontalRecyclingSystem.cs" :82 :61)
%32 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\HorizontalRecyclingSystem.cs" :82 :52) // _corners[2] (ElementAccessExpression)
%33 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\HorizontalRecyclingSystem.cs" :82 :52) // _corners[2].x (SimpleMemberAccessExpression)
%34 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\HorizontalRecyclingSystem.cs" :82 :68) // Not a variable of known type: threshHold
%35 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\HorizontalRecyclingSystem.cs" :82 :52) // Binary expression on unsupported types _corners[2].x + threshHold
%36 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\HorizontalRecyclingSystem.cs" :82 :80) // Not a variable of known type: _corners
%37 = constant 2 : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\HorizontalRecyclingSystem.cs" :82 :89)
%38 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\HorizontalRecyclingSystem.cs" :82 :80) // _corners[2] (ElementAccessExpression)
%39 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\HorizontalRecyclingSystem.cs" :82 :80) // _corners[2].y (SimpleMemberAccessExpression)
%40 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\HorizontalRecyclingSystem.cs" :82 :40) // new Vector3(_corners[2].x + threshHold, _corners[2].y) (ObjectCreationExpression)
br ^1

^1: // ExitBlock
return

}
// Skipping function CreateCellPool(), it contains poisonous unsupported syntaxes

// Skipping function OnValueChangedListener(none), it contains poisonous unsupported syntaxes

// Skipping function RecycleLeftToRight(), it contains poisonous unsupported syntaxes

// Skipping function RecycleRightToleft(), it contains poisonous unsupported syntaxes

// Skipping function SetAnchor(none), it contains poisonous unsupported syntaxes

