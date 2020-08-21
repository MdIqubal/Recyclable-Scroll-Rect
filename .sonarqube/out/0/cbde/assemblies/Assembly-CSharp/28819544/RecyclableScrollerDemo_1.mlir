func @_RecyclableScrollerDemo.Awake$$() -> () loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :30 :4) {
^entry :
br ^0

^0: // SimpleBlock
// Skipped because MethodDeclarationSyntax or ClassDeclarationSyntax or NamespaceDeclarationSyntax: InitData
%0 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :32 :8) // InitData() (InvocationExpression)
%1 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :33 :8) // Not a variable of known type: _recyclableScrollRect
%2 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :33 :8) // _recyclableScrollRect.DataSource (SimpleMemberAccessExpression)
%3 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :33 :43) // this (ThisExpression)
br ^1

^1: // ExitBlock
return

}
func @_RecyclableScrollerDemo.InitData$$() -> () loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :37 :4) {
^entry :
br ^0

^0: // BinaryBranchBlock
%0 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :39 :12) // Not a variable of known type: _contactList
%1 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :39 :28) // null (NullLiteralExpression)
%2 = cbde.unknown : i1  loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :39 :12) // comparison of unknown type: _contactList != null
cond_br %2, ^1, ^2 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :39 :12)

^1: // SimpleBlock
%3 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :39 :34) // Not a variable of known type: _contactList
%4 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :39 :34) // _contactList.Clear() (InvocationExpression)
br ^2

^2: // ForInitializerBlock
%5 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :41 :29) // "Male" (StringLiteralExpression)
%6 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :41 :37) // "Female" (StringLiteralExpression)
%8 = constant 0 : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :42 :21)
%9 = cbde.alloca i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :42 :17) // i
cbde.store %8, %9 : memref<i32> loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :42 :17)
br ^3

^3: // BinaryBranchBlock
%10 = cbde.load %9 : memref<i32> loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :42 :24)
%11 = cbde.unknown : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :42 :28) // Not a variable of known type: _dataLength
%12 = cmpi "slt", %10, %11 : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :42 :24)
cond_br %12, ^4, ^5 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :42 :24)

^4: // SimpleBlock
%13 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :44 :30) // new ContactInfo() (ObjectCreationExpression)
%15 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :45 :12) // Not a variable of known type: obj
%16 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :45 :12) // obj.Name (SimpleMemberAccessExpression)
%17 = cbde.load %9 : memref<i32> loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :45 :23)
%18 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :45 :27) // "_Name" (StringLiteralExpression)
%19 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :45 :23) // Binary expression on unsupported types i + "_Name"
%20 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :46 :12) // Not a variable of known type: obj
%21 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :46 :12) // obj.Gender (SimpleMemberAccessExpression)
%22 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :46 :25) // Not a variable of known type: genders
// Entity from another assembly: Random
%23 = constant 0 : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :46 :46)
%24 = constant 2 : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :46 :49)
%25 = cbde.unknown : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :46 :33) // Random.Range(0, 2) (InvocationExpression)
%26 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :46 :25) // genders[Random.Range(0, 2)] (ElementAccessExpression)
%27 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :47 :12) // Not a variable of known type: obj
%28 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :47 :12) // obj.id (SimpleMemberAccessExpression)
%29 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :47 :21) // "item : " (StringLiteralExpression)
%30 = cbde.load %9 : memref<i32> loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :47 :33)
%31 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :47 :21) // Binary expression on unsupported types "item : " + i
%32 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :48 :12) // Not a variable of known type: _contactList
%33 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :48 :29) // Not a variable of known type: obj
%34 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :48 :12) // _contactList.Add(obj) (InvocationExpression)
br ^6

^6: // SimpleBlock
%35 = cbde.load %9 : memref<i32> loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :42 :41)
%36 = constant 1 : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :42 :41)
%37 = addi %35, %36 : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :42 :41)
cbde.store %37, %9 : memref<i32> loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :42 :41)
br ^3

^5: // ExitBlock
return

}
func @_RecyclableScrollerDemo.GetItemCount$$() -> i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :57 :4) {
^entry :
br ^0

^0: // JumpBlock
%0 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :59 :15) // Not a variable of known type: _contactList
%1 = cbde.unknown : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :59 :15) // _contactList.Count (SimpleMemberAccessExpression)
return %1 : i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :59 :8)

^1: // ExitBlock
cbde.unreachable

}
func @_RecyclableScrollerDemo.SetCell$PolyAndCode.UI.ICell.int$(none, i32) -> () loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :66 :4) {
^entry (%_cell : none, %_index : i32):
%0 = cbde.alloca none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :66 :24)
cbde.store %_cell, %0 : memref<none> loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :66 :24)
%1 = cbde.alloca i32 loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :66 :36)
cbde.store %_index, %1 : memref<i32> loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :66 :36)
br ^0

^0: // SimpleBlock
%2 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :69 :19) // Not a variable of known type: cell
%3 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :69 :19) // cell as DemoCell (AsExpression)
%5 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :70 :8) // Not a variable of known type: item
%6 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :70 :27) // Not a variable of known type: _contactList
%7 = cbde.load %1 : memref<i32> loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :70 :40)
%8 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :70 :27) // _contactList[index] (ElementAccessExpression)
%9 = cbde.load %1 : memref<i32> loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :70 :47)
%10 = cbde.unknown : none loc("D:\\GitHub-Projects\\Recyclable-Scroll-Rect\\Assets\\Recyclable Scroll Rect\\Demo\\Scripts\\RecyclableScrollerDemo.cs" :70 :8) // item.ConfigureCell(_contactList[index],index) (InvocationExpression)
br ^1

^1: // ExitBlock
return

}
