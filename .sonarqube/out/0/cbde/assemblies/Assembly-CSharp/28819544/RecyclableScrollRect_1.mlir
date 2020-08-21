func @_PolyAndCode.UI.RecyclableScrollRect.Start$$() -> () loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\RecyclableScrollRect.cs" :47 :8) {
^entry :
br ^0

^0: // BinaryBranchBlock
%0 = constant 0 : i1 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\RecyclableScrollRect.cs" :51 :23) // false
%1 = constant 1 : i1 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\RecyclableScrollRect.cs" :52 :25) // true
// Entity from another assembly: Application
%2 = cbde.unknown : i1 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\RecyclableScrollRect.cs" :54 :17) // Application.isPlaying (SimpleMemberAccessExpression)
%3 = cbde.unknown : i1 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\RecyclableScrollRect.cs" :54 :16) // !Application.isPlaying (LogicalNotExpression)
cond_br %3, ^1, ^2 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\RecyclableScrollRect.cs" :54 :16)

^1: // JumpBlock
return loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\RecyclableScrollRect.cs" :54 :40)

^2: // BinaryBranchBlock
%4 = cbde.unknown : i1 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\RecyclableScrollRect.cs" :56 :16) // Not a variable of known type: SelfInitialize
cond_br %4, ^3, ^4 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\RecyclableScrollRect.cs" :56 :16)

^3: // SimpleBlock
// Skipped because MethodDeclarationSyntax or ClassDeclarationSyntax or NamespaceDeclarationSyntax: Initialize
%5 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\RecyclableScrollRect.cs" :56 :32) // Initialize() (InvocationExpression)
br ^4

^4: // ExitBlock
return

}
// Skipping function Initialize(), it contains poisonous unsupported syntaxes

func @_PolyAndCode.UI.RecyclableScrollRect.Initialize$PolyAndCode.UI.IRecyclableScrollRectDataSource$(none) -> () loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\RecyclableScrollRect.cs" :84 :8) {
^entry (%_dataSource : none):
%0 = cbde.alloca none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\RecyclableScrollRect.cs" :84 :31)
cbde.store %_dataSource, %0 : memref<none> loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\RecyclableScrollRect.cs" :84 :31)
br ^0

^0: // SimpleBlock
%1 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\RecyclableScrollRect.cs" :86 :25) // Not a variable of known type: dataSource
// Skipped because MethodDeclarationSyntax or ClassDeclarationSyntax or NamespaceDeclarationSyntax: Initialize
%2 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\RecyclableScrollRect.cs" :87 :12) // Initialize() (InvocationExpression)
br ^1

^1: // ExitBlock
return

}
func @_PolyAndCode.UI.RecyclableScrollRect.OnValueChangedListener$UnityEngine.Vector2$(none) -> () loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\RecyclableScrollRect.cs" :91 :8) {
^entry (%_args : none):
%0 = cbde.alloca none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\RecyclableScrollRect.cs" :91 :43)
cbde.store %_args, %0 : memref<none> loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\RecyclableScrollRect.cs" :91 :43)
br ^0

^0: // SimpleBlock
%1 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\RecyclableScrollRect.cs" :93 :12) // Identifier from another assembly: m_ContentStartPosition
%2 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\RecyclableScrollRect.cs" :93 :38) // Not a variable of known type: recyclableScrollRect
%3 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\RecyclableScrollRect.cs" :93 :82) // Not a variable of known type: args
%4 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\RecyclableScrollRect.cs" :93 :38) // recyclableScrollRect.OnValueChangedListener(args) (InvocationExpression)
%5 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\RecyclableScrollRect.cs" :93 :12) // Binary expression on unsupported types m_ContentStartPosition += recyclableScrollRect.OnValueChangedListener(args)
br ^1

^1: // ExitBlock
return

}
func @_PolyAndCode.UI.RecyclableScrollRect.OnDrawGizmos$$() -> () loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\RecyclableScrollRect.cs" :97 :8) {
^entry :
br ^0

^0: // BinaryBranchBlock
%0 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\RecyclableScrollRect.cs" :99 :16) // Not a variable of known type: recyclableScrollRect
%1 = cbde.unknown : i1 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\RecyclableScrollRect.cs" :99 :16) // recyclableScrollRect is VerticalRecyclingSystem (IsExpression)
cond_br %1, ^1, ^2 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\RecyclableScrollRect.cs" :99 :16)

^1: // SimpleBlock
%2 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\RecyclableScrollRect.cs" :101 :42) // Not a variable of known type: recyclableScrollRect
%3 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\RecyclableScrollRect.cs" :101 :17) // (VerticalRecyclingSystem)recyclableScrollRect (CastExpression)
%4 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Main\\Scripts\\RecyclableScrollRect.cs" :101 :16) // ((VerticalRecyclingSystem)recyclableScrollRect).OnDrawGizmos() (InvocationExpression)
br ^2

^2: // ExitBlock
return

}
