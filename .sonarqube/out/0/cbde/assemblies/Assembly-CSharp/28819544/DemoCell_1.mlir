func @_DemoCell.Start$$() -> () loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\DemoCell.cs" :19 :4) {
^entry :
br ^0

^0: // SimpleBlock
%0 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\DemoCell.cs" :22 :8) // GetComponent<Button>() (InvocationExpression)
%1 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\DemoCell.cs" :22 :8) // GetComponent<Button>().onClick (SimpleMemberAccessExpression)
// Skipped because MethodDeclarationSyntax or ClassDeclarationSyntax or NamespaceDeclarationSyntax: ButtonListener
%2 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\DemoCell.cs" :22 :8) // GetComponent<Button>().onClick.AddListener(ButtonListener) (InvocationExpression)
br ^1

^1: // ExitBlock
return

}
func @_DemoCell.ConfigureCell$ContactInfo.int$(none, i32) -> () loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\DemoCell.cs" :26 :4) {
^entry (%_contactInfo : none, %_cellIndex : i32):
%0 = cbde.alloca none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\DemoCell.cs" :26 :30)
cbde.store %_contactInfo, %0 : memref<none> loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\DemoCell.cs" :26 :30)
%1 = cbde.alloca i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\DemoCell.cs" :26 :54)
cbde.store %_cellIndex, %1 : memref<i32> loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\DemoCell.cs" :26 :54)
br ^0

^0: // SimpleBlock
%2 = cbde.load %1 : memref<i32> loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\DemoCell.cs" :28 :21)
%3 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\DemoCell.cs" :29 :23) // Not a variable of known type: contactInfo
%4 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\DemoCell.cs" :31 :8) // Not a variable of known type: nameLabel
%5 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\DemoCell.cs" :31 :8) // nameLabel.text (SimpleMemberAccessExpression)
%6 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\DemoCell.cs" :31 :25) // Not a variable of known type: contactInfo
%7 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\DemoCell.cs" :31 :25) // contactInfo.Name (SimpleMemberAccessExpression)
%8 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\DemoCell.cs" :32 :8) // Not a variable of known type: genderLabel
%9 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\DemoCell.cs" :32 :8) // genderLabel.text (SimpleMemberAccessExpression)
%10 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\DemoCell.cs" :32 :27) // Not a variable of known type: contactInfo
%11 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\DemoCell.cs" :32 :27) // contactInfo.Gender (SimpleMemberAccessExpression)
%12 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\DemoCell.cs" :33 :8) // Not a variable of known type: idLabel
%13 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\DemoCell.cs" :33 :8) // idLabel.text (SimpleMemberAccessExpression)
%14 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\DemoCell.cs" :33 :23) // Not a variable of known type: contactInfo
%15 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\DemoCell.cs" :33 :23) // contactInfo.id (SimpleMemberAccessExpression)
br ^1

^1: // ExitBlock
return

}
func @_DemoCell.ButtonListener$$() -> () loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\DemoCell.cs" :37 :4) {
^entry :
br ^0

^0: // SimpleBlock
// Entity from another assembly: Debug
%0 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\DemoCell.cs" :39 :18) // "Index : " (StringLiteralExpression)
%1 = cbde.unknown : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\DemoCell.cs" :39 :31) // Not a variable of known type: _cellIndex
%2 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\DemoCell.cs" :39 :18) // Binary expression on unsupported types "Index : " + _cellIndex
%3 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\DemoCell.cs" :39 :45) // ", Name : " (StringLiteralExpression)
%4 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\DemoCell.cs" :39 :18) // Binary expression on unsupported types "Index : " + _cellIndex +  ", Name : "
%5 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\DemoCell.cs" :39 :59) // Not a variable of known type: _contactInfo
%6 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\DemoCell.cs" :39 :59) // _contactInfo.Name (SimpleMemberAccessExpression)
%7 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\DemoCell.cs" :39 :18) // Binary expression on unsupported types "Index : " + _cellIndex +  ", Name : " + _contactInfo.Name
%8 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\DemoCell.cs" :39 :80) // ", Gender : " (StringLiteralExpression)
%9 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\DemoCell.cs" :39 :18) // Binary expression on unsupported types "Index : " + _cellIndex +  ", Name : " + _contactInfo.Name  + ", Gender : "
%10 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\DemoCell.cs" :39 :96) // Not a variable of known type: _contactInfo
%11 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\DemoCell.cs" :39 :96) // _contactInfo.Gender (SimpleMemberAccessExpression)
%12 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\DemoCell.cs" :39 :18) // Binary expression on unsupported types "Index : " + _cellIndex +  ", Name : " + _contactInfo.Name  + ", Gender : " + _contactInfo.Gender
%13 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\DemoCell.cs" :39 :8) // Debug.Log("Index : " + _cellIndex +  ", Name : " + _contactInfo.Name  + ", Gender : " + _contactInfo.Gender) (InvocationExpression)
br ^1

^1: // ExitBlock
return

}
