func @_UIExtension.MaxY$UnityEngine.RectTransform$(none) -> none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :11 :4) {
^entry (%_rectTransform : none):
%0 = cbde.alloca none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :11 :29)
cbde.store %_rectTransform, %0 : memref<none> loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :11 :29)
br ^0

^0: // JumpBlock
%1 = constant 4 : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :13 :40)
%2 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :13 :32) // Vector3[4] (ArrayType)
%3 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :13 :28) // new Vector3[4] (ArrayCreationExpression)
%5 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :14 :8) // Not a variable of known type: rectTransform
%6 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :14 :38) // Not a variable of known type: corners
%7 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :14 :8) // rectTransform.GetWorldCorners(corners) (InvocationExpression)
%8 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :15 :15) // Not a variable of known type: corners
%9 = constant 1 : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :15 :23)
%10 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :15 :15) // corners[1] (ElementAccessExpression)
%11 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :15 :15) // corners[1].y (SimpleMemberAccessExpression)
return %11 : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :15 :8)

^1: // ExitBlock
cbde.unreachable

}
func @_UIExtension.MinY$UnityEngine.RectTransform$(none) -> none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :18 :4) {
^entry (%_rectTransform : none):
%0 = cbde.alloca none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :18 :29)
cbde.store %_rectTransform, %0 : memref<none> loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :18 :29)
br ^0

^0: // JumpBlock
%1 = constant 4 : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :20 :40)
%2 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :20 :32) // Vector3[4] (ArrayType)
%3 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :20 :28) // new Vector3[4] (ArrayCreationExpression)
%5 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :21 :8) // Not a variable of known type: rectTransform
%6 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :21 :38) // Not a variable of known type: corners
%7 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :21 :8) // rectTransform.GetWorldCorners(corners) (InvocationExpression)
%8 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :22 :15) // Not a variable of known type: corners
%9 = constant 0 : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :22 :23)
%10 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :22 :15) // corners[0] (ElementAccessExpression)
%11 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :22 :15) // corners[0].y (SimpleMemberAccessExpression)
return %11 : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :22 :8)

^1: // ExitBlock
cbde.unreachable

}
func @_UIExtension.MaxX$UnityEngine.RectTransform$(none) -> none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :25 :4) {
^entry (%_rectTransform : none):
%0 = cbde.alloca none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :25 :29)
cbde.store %_rectTransform, %0 : memref<none> loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :25 :29)
br ^0

^0: // JumpBlock
%1 = constant 4 : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :27 :40)
%2 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :27 :32) // Vector3[4] (ArrayType)
%3 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :27 :28) // new Vector3[4] (ArrayCreationExpression)
%5 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :28 :8) // Not a variable of known type: rectTransform
%6 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :28 :38) // Not a variable of known type: corners
%7 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :28 :8) // rectTransform.GetWorldCorners(corners) (InvocationExpression)
%8 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :29 :15) // Not a variable of known type: corners
%9 = constant 2 : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :29 :23)
%10 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :29 :15) // corners[2] (ElementAccessExpression)
%11 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :29 :15) // corners[2].x (SimpleMemberAccessExpression)
return %11 : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :29 :8)

^1: // ExitBlock
cbde.unreachable

}
func @_UIExtension.MinX$UnityEngine.RectTransform$(none) -> none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :32 :4) {
^entry (%_rectTransform : none):
%0 = cbde.alloca none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :32 :29)
cbde.store %_rectTransform, %0 : memref<none> loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :32 :29)
br ^0

^0: // JumpBlock
%1 = constant 4 : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :34 :40)
%2 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :34 :32) // Vector3[4] (ArrayType)
%3 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :34 :28) // new Vector3[4] (ArrayCreationExpression)
%5 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :35 :8) // Not a variable of known type: rectTransform
%6 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :35 :38) // Not a variable of known type: corners
%7 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :35 :8) // rectTransform.GetWorldCorners(corners) (InvocationExpression)
%8 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :36 :15) // Not a variable of known type: corners
%9 = constant 0 : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :36 :23)
%10 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :36 :15) // corners[0] (ElementAccessExpression)
%11 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :36 :15) // corners[0].x (SimpleMemberAccessExpression)
return %11 : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\UIExtension.cs" :36 :8)

^1: // ExitBlock
cbde.unreachable

}
