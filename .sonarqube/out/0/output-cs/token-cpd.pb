§
`D:\GitHub-Projects\Recyclable-Scroll-Rect\Assets\Recyclable Scroll Rect\Demo\Scripts\DemoCell.cs
public		 
class		 
DemoCell		 
:		 
MonoBehaviour		 %
,		% &
ICell		' ,
{

 
public 

Text 
	nameLabel 
; 
public 

Text 
genderLabel 
; 
public 

Text 
idLabel 
; 
private 
ContactInfo 
_contactInfo $
;$ %
private 
int 

_cellIndex 
; 
private 
void 
Start 
( 
) 
{ 
GetComponent 
< 
Button 
> 
( 
) 
. 
onClick &
.& '
AddListener' 2
(2 3
ButtonListener3 A
)A B
;B C
} 
public 

void 
ConfigureCell 
( 
ContactInfo )
contactInfo* 5
,5 6
int6 9
	cellIndex: C
)C D
{ 

_cellIndex 
= 
	cellIndex 
; 
_contactInfo 
= 
contactInfo "
;" #
	nameLabel   
.   
text   
=   
contactInfo   $
.  $ %
Name  % )
;  ) *
genderLabel!! 
.!! 
text!! 
=!! 
contactInfo!! &
.!!& '
Gender!!' -
;!!- .
idLabel"" 
."" 
text"" 
="" 
contactInfo"" "
.""" #
id""# %
;""% &
}## 
private&& 
void&& 
ButtonListener&& 
(&&  
)&&  !
{'' 
Debug(( 
.(( 
Log(( 
((( 
$str(( 
+(( 

_cellIndex(( )
+((* +
$str((- 8
+((9 :
_contactInfo((; G
.((G H
Name((H L
+((N O
$str((P ]
+((^ _
_contactInfo((` l
.((l m
Gender((m s
)((s t
;((t u
})) 
}** “
nD:\GitHub-Projects\Recyclable-Scroll-Rect\Assets\Recyclable Scroll Rect\Demo\Scripts\RecyclableScrollerDemo.cs
public 
struct 
ContactInfo 
{ 
public 

string 
Name 
; 
public 

string 
Gender 
; 
public 

string 
id 
; 
} 
public 
class "
RecyclableScrollerDemo #
:$ %
MonoBehaviour& 3
,3 4+
IRecyclableScrollRectDataSource5 T
{ 
[ 
SerializeField 
]  
RecyclableScrollRect !
_recyclableScrollRect .
;. /
[ 
SerializeField 
] 
private 
int 
_dataLength 
; 
private 
List 
< 
ContactInfo 
> 
_contactList *
=+ ,
new- 0
List1 5
<5 6
ContactInfo6 A
>A B
(B C
)C D
;D E
private 
void 
Awake 
( 
) 
{   
InitData!! 
(!! 
)!! 
;!! !
_recyclableScrollRect"" 
."" 

DataSource"" (
="") *
this""+ /
;""/ 0
}## 
private&& 
void&& 
InitData&& 
(&& 
)&& 
{'' 
if(( 

((( 
_contactList(( 
!=(( 
null((  
)((  !
_contactList((" .
.((. /
Clear((/ 4
(((4 5
)((5 6
;((6 7
string** 
[** 
]** 
genders** 
=** 
{** 
$str** #
,**# $
$str**% -
}**. /
;**/ 0
for++ 
(++ 
int++ 
i++ 
=++ 
$num++ 
;++ 
i++ 
<++ 
_dataLength++ '
;++' (
i++) *
++++* ,
)++, -
{,, 	
ContactInfo-- 
obj-- 
=-- 
new-- !
ContactInfo--" -
(--- .
)--. /
;--/ 0
obj.. 
... 
Name.. 
=.. 
i.. 
+.. 
$str.. "
;.." #
obj// 
.// 
Gender// 
=// 
genders//  
[//  !
Random//! '
.//' (
Range//( -
(//- .
$num//. /
,/// 0
$num//1 2
)//2 3
]//3 4
;//4 5
obj00 
.00 
id00 
=00 
$str00 
+00  
i00! "
;00" #
_contactList11 
.11 
Add11 
(11 
obj11  
)11  !
;11! "
}22 	
}33 
public:: 

int:: 
GetItemCount:: 
(:: 
):: 
{;; 
return<< 
_contactList<< 
.<< 
Count<< !
;<<! "
}== 
publicCC 

voidCC 
SetCellCC 
(CC 
ICellCC 
cellCC "
,CC" #
intCC$ '
indexCC( -
)CC- .
{DD 
varFF 
itemFF 
=FF 
cellFF 
asFF 
DemoCellFF #
;FF# $
itemGG 
.GG 
ConfigureCellGG 
(GG 
_contactListGG '
[GG' (
indexGG( -
]GG- .
,GG. /
indexGG/ 4
)GG4 5
;GG5 6
}HH 
}KK ∂V
rD:\GitHub-Projects\Recyclable-Scroll-Rect\Assets\Recyclable Scroll Rect\Main\Editors\RecyclableScrollRectEditor.cs
	namespace 	
PolyAndCode
 
. 
UI 
{ 
[ 
CustomEditor 
( 
typeof 
(  
RecyclableScrollRect -
)- .
,. /
true0 4
)4 5
]5 6
[ "
CanEditMultipleObjects 
] 
public 

class &
RecyclableScrollRectEditor +
:, -
Editor. 4
{ 
SerializedProperty 
	m_Content $
;$ %
SerializedProperty 
m_MovementType )
;) *
SerializedProperty 
m_Elasticity '
;' (
SerializedProperty 
	m_Inertia $
;$ %
SerializedProperty 
m_DecelerationRate -
;- .
SerializedProperty 
m_ScrollSensitivity .
;. /
SerializedProperty 

m_Viewport %
;% &
SerializedProperty 
m_OnValueChanged +
;+ ,
SerializedProperty 
_protoTypeCell )
;) *
SerializedProperty 
_selfInitialize *
;* +
SerializedProperty 

_direction %
;% &
SerializedProperty 
_type  
;  !
SerializedProperty 
	_segments $
;$ %
AnimBool 
m_ShowElasticity !
;! "
AnimBool   "
m_ShowDecelerationRate   '
;  ' ( 
RecyclableScrollRect"" 
_script"" $
;""$ %
	protected## 
virtual## 
void## 
OnEnable## '
(##' (
)##( )
{$$ 	
_script%% 
=%% 
(%%  
RecyclableScrollRect%% +
)%%+ ,
target%%, 2
;%%2 3
	m_Content'' 
='' 
serializedObject'' (
.''( )
FindProperty'') 5
(''5 6
$str''6 A
)''A B
;''B C
m_MovementType(( 
=(( 
serializedObject(( -
.((- .
FindProperty((. :
(((: ;
$str((; K
)((K L
;((L M
m_Elasticity)) 
=)) 
serializedObject)) +
.))+ ,
FindProperty)), 8
())8 9
$str))9 G
)))G H
;))H I
	m_Inertia** 
=** 
serializedObject** (
.**( )
FindProperty**) 5
(**5 6
$str**6 A
)**A B
;**B C
m_DecelerationRate++ 
=++  
serializedObject++! 1
.++1 2
FindProperty++2 >
(++> ?
$str++? S
)++S T
;++T U
m_ScrollSensitivity,, 
=,,  !
serializedObject,," 2
.,,2 3
FindProperty,,3 ?
(,,? @
$str,,@ U
),,U V
;,,V W

m_Viewport-- 
=-- 
serializedObject-- )
.--) *
FindProperty--* 6
(--6 7
$str--7 C
)--C D
;--D E
m_OnValueChanged.. 
=.. 
serializedObject.. /
.../ 0
FindProperty..0 <
(..< =
$str..= O
)..O P
;..P Q
_protoTypeCell11 
=11 
serializedObject11 -
.11- .
FindProperty11. :
(11: ;
$str11; J
)11J K
;11K L
_selfInitialize22 
=22 
serializedObject22 .
.22. /
FindProperty22/ ;
(22; <
$str22< L
)22L M
;22M N

_direction33 
=33 
serializedObject33 )
.33) *
FindProperty33* 6
(336 7
$str337 B
)33B C
;33C D
_type44 
=44 
serializedObject44 $
.44$ %
FindProperty44% 1
(441 2
$str442 8
)448 9
;449 :
	_segments55 
=55 
serializedObject55 (
.55( )
FindProperty55) 5
(555 6
$str556 A
)55A B
;55B C
m_ShowElasticity77 
=77 
new77 "
AnimBool77# +
(77+ ,
Repaint77, 3
)773 4
;774 5"
m_ShowDecelerationRate88 "
=88# $
new88% (
AnimBool88) 1
(881 2
Repaint882 9
)889 :
;88: ;
SetAnimBools99 
(99 
true99 
)99 
;99 
}:: 	
	protected<< 
virtual<< 
void<< 
	OnDisable<< (
(<<( )
)<<) *
{== 	
m_ShowElasticity>> 
.>> 
valueChanged>> )
.>>) *
RemoveListener>>* 8
(>>8 9
Repaint>>9 @
)>>@ A
;>>A B"
m_ShowDecelerationRate?? "
.??" #
valueChanged??# /
.??/ 0
RemoveListener??0 >
(??> ?
Repaint??? F
)??F G
;??G H
}@@ 	
voidBB 
SetAnimBoolsBB 
(BB 
boolBB 
instantBB &
)BB& '
{CC 	
SetAnimBoolDD 
(DD 
m_ShowElasticityDD (
,DD( )
!DD* +
m_MovementTypeDD+ 9
.DD9 :&
hasMultipleDifferentValuesDD: T
&&DDU W
m_MovementTypeDDX f
.DDf g
enumValueIndexDDg u
==DDv x
(DDy z
intDDz }
)DD} ~

ScrollRect	DD~ à
.
DDà â
MovementType
DDâ ï
.
DDï ñ
Elastic
DDñ ù
,
DDù û
instant
DDü ¶
)
DD¶ ß
;
DDß ®
SetAnimBoolEE 
(EE "
m_ShowDecelerationRateEE .
,EE. /
!EE0 1
	m_InertiaEE1 :
.EE: ;&
hasMultipleDifferentValuesEE; U
&&EEV X
	m_InertiaEEY b
.EEb c
	boolValueEEc l
,EEl m
instantEEn u
)EEu v
;EEv w
}FF 	
voidHH 
SetAnimBoolHH 
(HH 
AnimBoolHH !
aHH" #
,HH# $
boolHH% )
valueHH* /
,HH/ 0
boolHH1 5
instantHH6 =
)HH= >
{II 	
ifJJ 
(JJ 
instantJJ 
)JJ 
aKK 
.KK 
valueKK 
=KK 
valueKK 
;KK  
elseLL 
aMM 
.MM 
targetMM 
=MM 
valueMM  
;MM  !
}NN 	
publicPP 
overridePP 
voidPP 
OnInspectorGUIPP +
(PP+ ,
)PP, -
{QQ 	
SetAnimBoolsRR 
(RR 
falseRR 
)RR 
;RR  
serializedObjectSS 
.SS 
UpdateSS #
(SS# $
)SS$ %
;SS% &
EditorGUILayoutUU 
.UU 
PropertyFieldUU )
(UU) *

_directionUU* 4
)UU4 5
;UU5 6
EditorGUILayoutVV 
.VV 
PropertyFieldVV )
(VV) *
_typeVV* /
)VV/ 0
;VV0 1
ifWW 
(WW 
_typeWW 
.WW 
	boolValueWW 
)WW  
{XX 
stringYY 
titleYY 
=YY 

_directionYY )
.YY) *
enumValueIndexYY* 8
==YY9 ;
(YY< =
intYY= @
)YY@ A 
RecyclableScrollRectYYA U
.YYU V
DirectionTypeYYV c
.YYc d
VerticalYYd l
?YYm n
$strYYo y
:YYz {
$str	YY| Ç
;
YYÇ É
_scriptZZ 
.ZZ 
SegmentsZZ 
=ZZ  !
EditorGUILayoutZZ# 2
.ZZ2 3
IntFieldZZ3 ;
(ZZ; <
titleZZ< A
,ZZA B
_scriptZZC J
.ZZJ K
SegmentsZZK S
)ZZS T
;ZZT U
}[[ 
EditorGUILayout]] 
.]] 
PropertyField]] )
(]]) *
_selfInitialize]]* 9
)]]9 :
;]]: ;
EditorGUILayout^^ 
.^^ 
PropertyField^^ )
(^^) *

m_Viewport^^* 4
)^^4 5
;^^5 6
EditorGUILayout__ 
.__ 
PropertyField__ )
(__) *
	m_Content__* 3
)__3 4
;__4 5
EditorGUILayout`` 
.`` 
PropertyField`` )
(``) *
_protoTypeCell``* 8
)``8 9
;``9 :
EditorGUILayoutaa 
.aa 
Spaceaa !
(aa! "
)aa" #
;aa# $
EditorGUILayoutcc 
.cc 
PropertyFieldcc )
(cc) *
m_MovementTypecc* 8
)cc8 9
;cc9 :
ifdd 
(dd 
EditorGUILayoutdd 
.dd  
BeginFadeGroupdd  .
(dd. /
m_ShowElasticitydd/ ?
.dd? @
fadeddd@ E
)ddE F
)ddF G
{ee 
	EditorGUIff 
.ff 
indentLevelff %
++ff% '
;ff' (
EditorGUILayoutgg 
.gg  
PropertyFieldgg  -
(gg- .
m_Elasticitygg. :
)gg: ;
;gg; <
	EditorGUIhh 
.hh 
indentLevelhh %
--hh% '
;hh' (
}ii 
EditorGUILayoutjj 
.jj 
EndFadeGroupjj (
(jj( )
)jj) *
;jj* +
EditorGUILayoutll 
.ll 
PropertyFieldll )
(ll) *
	m_Inertiall* 3
)ll3 4
;ll4 5
ifmm 
(mm 
EditorGUILayoutmm 
.mm  
BeginFadeGroupmm  .
(mm. /"
m_ShowDecelerationRatemm/ E
.mmE F
fadedmmF K
)mmK L
)mmL M
{nn 
	EditorGUIoo 
.oo 
indentLeveloo %
++oo% '
;oo' (
EditorGUILayoutpp 
.pp  
PropertyFieldpp  -
(pp- .
m_DecelerationRatepp. @
)pp@ A
;ppA B
	EditorGUIqq 
.qq 
indentLevelqq %
--qq% '
;qq' (
}rr 
EditorGUILayoutss 
.ss 
EndFadeGroupss (
(ss( )
)ss) *
;ss* +
EditorGUILayoutuu 
.uu 
PropertyFielduu )
(uu) *
m_ScrollSensitivityuu* =
)uu= >
;uu> ?
EditorGUILayoutww 
.ww 
Spaceww !
(ww! "
)ww" #
;ww# $
EditorGUILayoutyy 
.yy 
PropertyFieldyy )
(yy) *
m_OnValueChangedyy* :
)yy: ;
;yy; <
serializedObject{{ 
.{{ #
ApplyModifiedProperties{{ 4
({{4 5
){{5 6
;{{6 7
}|| 	
}}} 
}~~ ñ
vD:\GitHub-Projects\Recyclable-Scroll-Rect\Assets\Recyclable Scroll Rect\Main\Editors\RecyclableScrollViewEditorTool.cs
	namespace 	
PolyAndCode
 
. 
UI 
{ 
[ 
ExecuteInEditMode 
] 
public 

static 
class *
RecyclableScrollViewEditorTool 6
{ 
const		 
string		 

PrefabPath		 
=		  !
$str		" k
;		k l
[ 	
MenuItem	 
( 
$str 8
)8 9
]9 :
private 
static 
void &
createRecyclableScrollView 6
(6 7
)7 8
{ 	

GameObject 
selected 
=  !
	Selection" +
.+ ,
activeGameObject, <
;< =
if 
( 
! 
selected 
|| 
! 
( 
selected '
.' (
	transform( 1
is2 4
RectTransform5 B
)B C
)C D
{ 
selected 
= 

GameObject %
.% &
FindObjectOfType& 6
<6 7
Canvas7 =
>= >
(> ?
)? @
.@ A

gameObjectA K
;K L
} 
if 
( 
! 
selected 
) 
return !
;! "

GameObject 
asset 
= 
AssetDatabase ,
., -
LoadAssetAtPath- <
(< =

PrefabPath= G
,G H
typeofI O
(O P

GameObjectP Z
)Z [
)[ \
as] _

GameObject` j
;j k

GameObject 
item 
= 
Object $
.$ %
Instantiate% 0
(0 1
asset1 6
)6 7
;7 8
item 
. 
name 
= 
$str 0
;0 1
item 
. 
	transform 
. 
	SetParent $
($ %
selected% -
.- .
	transform. 7
)7 8
;8 9
item 
. 
	transform 
. 
localPosition (
=) *
Vector3+ 2
.2 3
zero3 7
;7 8
	Selection 
. 
activeGameObject &
=' (
item) -
;- .
Undo   
.   %
RegisterCreatedObjectUndo   *
(  * +
item  + /
,  / 0
$str  1 Q
)  Q R
;  R S
}!! 	
}"" 
}## üˇ
qD:\GitHub-Projects\Recyclable-Scroll-Rect\Assets\Recyclable Scroll Rect\Main\Scripts\HorizontalRecyclingSystem.cs
	namespace 	
PolyAndCode
 
. 
UI 
{ 
public 

class %
HorizontalRecyclingSystem *
:+ ,
RecyclingSystem- <
{		 
private

 
readonly

 +
IRecyclableScrollRectDataSource

 8
_dataSource

9 D
;

D E
private 
readonly 
int 
_rows "
;" #
private 
float 

_cellWidth  
,  !
_cellHeight" -
;- .
private 
int 
_leftMostCellRow $
,$ %
_RightMostCellRow& 7
;7 8
private 
List 
< 
RectTransform "
>" #
	_cellPool$ -
;- .
private 
List 
< 
ICell 
> 
_cachedCells (
;( )
private 
Bounds !
_recyclableViewBounds ,
;, -
private 
readonly 
Vector3  
[  !
]! "
_corners# +
=, -
new. 1
Vector32 9
[9 :
$num: ;
]; <
;< =
private 
bool 

_recycling 
;  
private 
int 
leftMostCellIndex %
,% &
rightMostCellIndex' 9
;9 :
private 
int 
currentItemCount $
;$ %
public   %
HorizontalRecyclingSystem   (
(  ( )
RectTransform  ) 6
prototypeCell  7 D
,  D E
RectTransform  F S
viewport  T \
,  \ ]
RectTransform  ^ k
content  l s
,  s t,
IRecyclableScrollRectDataSource	  u î

dataSource
  ï ü
,
  ü †
bool
  ° •
isGrid
  ¶ ¨
,
  ¨ ≠
int
  Æ ±
rows
  ≤ ∂
)
  ∂ ∑
{!! 	
PrototypeCell## 
=## 
prototypeCell## )
;##) *
Viewport$$ 
=$$ 
viewport$$ 
;$$  
Content%% 
=%% 
content%% 
;%% 
_dataSource&& 
=&& 

dataSource&& $
;&&$ %
IsGrid'' 
='' 
isGrid'' 
;'' 
_rows(( 
=(( 
isGrid(( 
?(( 
rows(( !
:((" #
$num(($ %
;((% &
})) 	
public++ 
override++ 
IEnumerator++ #
InitCoroutine++$ 1
(++1 2
Action++2 8
onInitialized++9 F
)++F G
{,, 	
	SetAnchor.. 
(.. 
Content.. 
).. 
;.. 
Content// 
.// 
anchoredPosition// $
=//% &
Vector3//' .
.//. /
zero/// 3
;//3 4
yield00 
return00 
null00 
;00 
SetRecyclingBounds11 
(11 
)11  
;11  !
CreateCellPool44 
(44 
)44 
;44 
leftMostCellIndex55 
=55 
$num55  !
;55! "
rightMostCellIndex66 
=66  
	_cellPool66! *
.66* +
Count66+ 0
-661 2
$num663 4
;664 5
yield77 
return77 
null77 
;77 
int88 
coloums88 
=88 
Mathf88 
.88  
	CeilToInt88  )
(88) *
(88* +
float88+ 0
)880 1
	_cellPool881 :
.88: ;
Count88; @
/88A B
_rows88C H
)88H I
;88I J
	SetAnchor99 
(99 
Content99 
)99 
;99 
float:: 
contentXSize:: 
=::  
coloums::! (
*::) *
PrototypeCell::+ 8
.::8 9
	sizeDelta::9 B
.::B C
x::C D
;::D E
Content;; 
.;; 
	sizeDelta;; 
=;; 
new;;  #
Vector2;;$ +
(;;+ ,
contentXSize;;, 8
,;;8 9
Content;;: A
.;;A B
	sizeDelta;;B K
.;;K L
y;;L M
);;M N
;;;N O
currentItemCount<< 
=<< 
	_cellPool<< (
.<<( )
Count<<) .
;<<. /
onInitialized== 
(== 
)== 
;== 
}>> 	
privateDD 
voidDD 
SetRecyclingBoundsDD '
(DD' (
)DD( )
{EE 	
ViewportFF 
.FF 
GetWorldCornersFF $
(FF$ %
_cornersFF% -
)FF- .
;FF. /
floatGG 

threshHoldGG 
=GG 
RecyclingThresholdGG 1
*GG2 3
(GG4 5
_cornersGG5 =
[GG= >
$numGG> ?
]GG? @
.GG@ A
xGGA B
-GGC D
_cornersGGE M
[GGM N
$numGGN O
]GGO P
.GGP Q
xGGQ R
)GGR S
;GGS T!
_recyclableViewBoundsHH !
.HH! "
minHH" %
=HH& '
newHH( +
Vector3HH, 3
(HH3 4
_cornersHH4 <
[HH< =
$numHH= >
]HH> ?
.HH? @
xHH@ A
-HHB C

threshHoldHHD N
,HHN O
_cornersHHP X
[HHX Y
$numHHY Z
]HHZ [
.HH[ \
yHH\ ]
)HH] ^
;HH^ _!
_recyclableViewBoundsII !
.II! "
maxII" %
=II& '
newII( +
Vector3II, 3
(II3 4
_cornersII4 <
[II< =
$numII= >
]II> ?
.II? @
xII@ A
+IIB C

threshHoldIID N
,IIN O
_cornersIIP X
[IIX Y
$numIIY Z
]IIZ [
.II[ \
yII\ ]
)II] ^
;II^ _
}JJ 	
privateOO 
voidOO 
CreateCellPoolOO #
(OO# $
)OO$ %
{PP 	
ifRR 
(RR 
	_cellPoolRR 
!=RR 
nullRR !
)RR! "
{SS 
	_cellPoolTT 
.TT 
ForEachTT !
(TT! "
(TT" #
RectTransformTT# 0
itemTT1 5
)TT5 6
=>TT7 9
UnityEngineTT: E
.TTE F
ObjectTTF L
.TTL M
DestroyTTM T
(TTT U
itemTTU Y
.TTY Z

gameObjectTTZ d
)TTd e
)TTe f
;TTf g
	_cellPoolUU 
.UU 
ClearUU 
(UU  
)UU  !
;UU! "
_cachedCellsVV 
.VV 
ClearVV "
(VV" #
)VV# $
;VV$ %
}WW 
elseXX 
{YY 
_cachedCellsZZ 
=ZZ 
newZZ "
ListZZ# '
<ZZ' (
ICellZZ( -
>ZZ- .
(ZZ. /
)ZZ/ 0
;ZZ0 1
	_cellPool[[ 
=[[ 
new[[ 
List[[  $
<[[$ %
RectTransform[[% 2
>[[2 3
([[3 4
)[[4 5
;[[5 6
}\\ 
PrototypeCell__ 
.__ 

gameObject__ $
.__$ %
	SetActive__% .
(__. /
true__/ 3
)__3 4
;__4 5
	SetAnchor`` 
(`` 
PrototypeCell`` #
)``# $
;``$ %
_cellHeightcc 
=cc 
Contentcc !
.cc! "
rectcc" &
.cc& '
heightcc' -
/cc. /
_rowscc0 5
;cc5 6

_cellWidthdd 
=dd 
PrototypeCelldd &
.dd& '
	sizeDeltadd' 0
.dd0 1
xdd1 2
/dd3 4
PrototypeCelldd5 B
.ddB C
	sizeDeltaddC L
.ddL M
yddM N
*ddO P
_cellHeightddQ \
;dd\ ]
PrototypeCellee 
.ee 
	sizeDeltaee #
=ee$ %
newee& )
Vector3ee* 1
(ee1 2

_cellWidthee2 <
,ee< =
_cellHeightee> I
)eeI J
;eeJ K
_leftMostCellRowff 
=ff 
$numff  
;ff  !
_RightMostCellRowgg 
=gg 
$numgg  !
;gg! "
floatjj 
currentPoolCoveragejj %
=jj& '
$numjj( )
;jj) *
intkk 
poolSizekk 
=kk 
$numkk 
;kk 
floatll 
posXll 
=ll 
$numll 
;ll 
floatmm 
posYmm 
=mm 
$nummm 
;mm 
floatpp 
requriedCoveragepp "
=pp# $
MinPoolCoveragepp% 4
*pp5 6
Viewportpp7 ?
.pp? @
rectpp@ D
.ppD E
widthppE J
;ppJ K
intqq 
minPoolSizeqq 
=qq 
Mathqq "
.qq" #
Minqq# &
(qq& '
MinPoolSizeqq' 2
,qq2 3
_dataSourceqq4 ?
.qq? @
GetItemCountqq@ L
(qqL M
)qqM N
)qqN O
;qqO P
whiless 
(ss 
(ss 
poolSizess 
<ss 
minPoolSizess *
||ss+ -
currentPoolCoveragess. A
<ssB C
requriedCoveragessD T
)ssT U
&&ssV X
poolSizessY a
<ssb c
_dataSourcessd o
.sso p
GetItemCountssp |
(ss| }
)ss} ~
)ss~ 
{tt 
RectTransformvv 
itemvv "
=vv# $
(vv% &
UnityEnginevv& 1
.vv1 2
Objectvv2 8
.vv8 9
Instantiatevv9 D
(vvD E
PrototypeCellvvE R
.vvR S

gameObjectvvS ]
)vv] ^
)vv^ _
.vv_ `
GetComponentvv` l
<vvl m
RectTransformvvm z
>vvz {
(vv{ |
)vv| }
;vv} ~
itemww 
.ww 
nameww 
=ww 
$strww "
;ww" #
	_cellPoolxx 
.xx 
Addxx 
(xx 
itemxx "
)xx" #
;xx# $
itemyy 
.yy 
	SetParentyy 
(yy 
Contentyy &
,yy& '
falseyy( -
)yy- .
;yy. /
if{{ 
({{ 
IsGrid{{ 
){{ 
{|| 
posY}} 
=}} 
-}} 
_RightMostCellRow}} -
*}}. /
_cellHeight}}0 ;
;}}; <
item~~ 
.~~ 
anchoredPosition~~ )
=~~* +
new~~, /
Vector2~~0 7
(~~7 8
posX~~8 <
,~~< =
posY~~> B
)~~B C
;~~C D
if 
( 
++ 
_RightMostCellRow +
>=, .
_rows/ 4
)4 5
{
ÄÄ 
_RightMostCellRow
ÅÅ )
=
ÅÅ* +
$num
ÅÅ, -
;
ÅÅ- .
posX
ÇÇ 
+=
ÇÇ 

_cellWidth
ÇÇ  *
;
ÇÇ* +!
currentPoolCoverage
ÉÉ +
+=
ÉÉ, .
item
ÉÉ/ 3
.
ÉÉ3 4
rect
ÉÉ4 8
.
ÉÉ8 9
width
ÉÉ9 >
;
ÉÉ> ?
}
ÑÑ 
}
ÖÖ 
else
ÜÜ 
{
áá 
item
ââ 
.
ââ 
anchoredPosition
ââ )
=
ââ* +
new
ââ, /
Vector2
ââ0 7
(
ââ7 8
posX
ââ8 <
,
ââ< =
$num
ââ> ?
)
ââ? @
;
ââ@ A
posX
ää 
=
ää 
item
ää 
.
ää  
anchoredPosition
ää  0
.
ää0 1
x
ää1 2
+
ää3 4
item
ää5 9
.
ää9 :
rect
ää: >
.
ää> ?
width
ää? D
;
ääD E!
currentPoolCoverage
ãã '
+=
ãã( *
item
ãã+ /
.
ãã/ 0
rect
ãã0 4
.
ãã4 5
width
ãã5 :
;
ãã: ;
}
åå 
_cachedCells
èè 
.
èè 
Add
èè  
(
èè  !
item
èè! %
.
èè% &
GetComponent
èè& 2
<
èè2 3
ICell
èè3 8
>
èè8 9
(
èè9 :
)
èè: ;
)
èè; <
;
èè< =
_dataSource
êê 
.
êê 
SetCell
êê #
(
êê# $
_cachedCells
êê$ 0
[
êê0 1
_cachedCells
êê1 =
.
êê= >
Count
êê> C
-
êêD E
$num
êêF G
]
êêG H
,
êêH I
poolSize
êêJ R
)
êêR S
;
êêS T
poolSize
ìì 
++
ìì 
;
ìì 
}
îî 
if
ïï 
(
ïï 
IsGrid
ïï 
)
ïï 
{
ññ 
_RightMostCellRow
óó !
=
óó" #
(
óó$ %
_RightMostCellRow
óó% 6
-
óó7 8
$num
óó9 :
+
óó; <
_rows
óó= B
)
óóB C
%
óóD E
_rows
óóF K
;
óóK L
}
òò 
if
õõ 
(
õõ 
PrototypeCell
õõ 
.
õõ 

gameObject
õõ (
.
õõ( )
scene
õõ) .
.
õõ. /
IsValid
õõ/ 6
(
õõ6 7
)
õõ7 8
)
õõ8 9
{
úú 
PrototypeCell
ùù 
.
ùù 

gameObject
ùù (
.
ùù( )
	SetActive
ùù) 2
(
ùù2 3
false
ùù3 8
)
ùù8 9
;
ùù9 :
}
ûû 
}
üü 	
Vector2
°° 

zeroVector
°° 
=
°° 
Vector2
°° $
.
°°$ %
zero
°°% )
;
°°) *
public
¢¢ 
override
¢¢ 
Vector2
¢¢ $
OnValueChangedListener
¢¢  6
(
¢¢6 7
Vector2
¢¢7 >
	direction
¢¢? H
)
¢¢H I
{
££ 	
if
§§ 
(
§§ 

_recycling
§§ 
||
§§ 
	_cellPool
§§ '
==
§§( *
null
§§+ /
||
§§0 2
	_cellPool
§§3 <
.
§§< =
Count
§§= B
==
§§C E
$num
§§F G
)
§§G H
return
§§I O

zeroVector
§§P Z
;
§§Z [ 
SetRecyclingBounds
ßß 
(
ßß 
)
ßß  
;
ßß  !
if
™™ 
(
™™ 
	direction
™™ 
.
™™ 
x
™™ 
<
™™ 
$num
™™ 
&&
™™  "
	_cellPool
™™# ,
[
™™, - 
rightMostCellIndex
™™- ?
]
™™? @
.
™™@ A
MinX
™™A E
(
™™E F
)
™™F G
<
™™H I#
_recyclableViewBounds
™™J _
.
™™_ `
max
™™` c
.
™™c d
x
™™d e
)
™™e f
{
´´ 
return
¨¨  
RecycleLeftToRight
¨¨ )
(
¨¨) *
)
¨¨* +
;
¨¨+ ,
}
≠≠ 
else
ÆÆ 
if
ÆÆ 
(
ÆÆ 
	direction
ÆÆ 
.
ÆÆ 
x
ÆÆ  
>
ÆÆ! "
$num
ÆÆ# $
&&
ÆÆ% '
	_cellPool
ÆÆ( 1
[
ÆÆ1 2
leftMostCellIndex
ÆÆ2 C
]
ÆÆC D
.
ÆÆD E
MaxX
ÆÆE I
(
ÆÆI J
)
ÆÆJ K
>
ÆÆL M#
_recyclableViewBounds
ÆÆN c
.
ÆÆc d
min
ÆÆd g
.
ÆÆg h
x
ÆÆh i
)
ÆÆi j
{
ØØ 
return
∞∞  
RecycleRightToleft
∞∞ )
(
∞∞) *
)
∞∞* +
;
∞∞+ ,
}
±± 
return
≤≤ 

zeroVector
≤≤ 
;
≤≤ 
}
≥≥ 	
private
∏∏ 
Vector2
∏∏  
RecycleLeftToRight
∏∏ *
(
∏∏* +
)
∏∏+ ,
{
ππ 	

_recycling
∫∫ 
=
∫∫ 
true
∫∫ 
;
∫∫ 
int
ºº 
n
ºº 
=
ºº 
$num
ºº 
;
ºº 
float
ΩΩ 
posX
ΩΩ 
=
ΩΩ 
IsGrid
ΩΩ 
?
ΩΩ  !
	_cellPool
ΩΩ" +
[
ΩΩ+ , 
rightMostCellIndex
ΩΩ, >
]
ΩΩ> ?
.
ΩΩ? @
anchoredPosition
ΩΩ@ P
.
ΩΩP Q
x
ΩΩQ R
:
ΩΩS T
$num
ΩΩU V
;
ΩΩV W
float
ææ 
posY
ææ 
=
ææ 
$num
ææ 
;
ææ 
int
¿¿ 
additionalColoums
¿¿ !
=
¿¿" #
$num
¿¿$ %
;
¿¿% &
while
¡¡ 
(
¡¡ 
	_cellPool
¡¡ 
[
¡¡ 
leftMostCellIndex
¡¡ .
]
¡¡. /
.
¡¡/ 0
MaxX
¡¡0 4
(
¡¡4 5
)
¡¡5 6
<
¡¡7 8#
_recyclableViewBounds
¡¡9 N
.
¡¡N O
min
¡¡O R
.
¡¡R S
x
¡¡S T
&&
¡¡U W
currentItemCount
¡¡X h
<
¡¡i j
_dataSource
¡¡k v
.
¡¡v w
GetItemCount¡¡w É
(¡¡É Ñ
)¡¡Ñ Ö
)¡¡Ö Ü
{
¬¬ 
if
√√ 
(
√√ 
IsGrid
√√ 
)
√√ 
{
ƒƒ 
if
≈≈ 
(
≈≈ 
++
≈≈ 
_RightMostCellRow
≈≈ +
>=
≈≈, .
_rows
≈≈/ 4
)
≈≈4 5
{
∆∆ 
n
«« 
++
«« 
;
«« 
_RightMostCellRow
»» )
=
»»* +
$num
»», -
;
»»- .
posX
…… 
=
…… 
	_cellPool
…… (
[
……( ) 
rightMostCellIndex
……) ;
]
……; <
.
……< =
anchoredPosition
……= M
.
……M N
x
……N O
+
……P Q

_cellWidth
……R \
;
……\ ]
additionalColoums
   )
++
  ) +
;
  + ,
}
ÀÀ 
posY
ÃÃ 
=
ÃÃ 
-
ÃÃ 
_RightMostCellRow
ÃÃ -
*
ÃÃ. /
_cellHeight
ÃÃ0 ;
;
ÃÃ; <
	_cellPool
ŒŒ 
[
ŒŒ 
leftMostCellIndex
ŒŒ /
]
ŒŒ/ 0
.
ŒŒ0 1
anchoredPosition
ŒŒ1 A
=
ŒŒB C
new
ŒŒD G
Vector2
ŒŒH O
(
ŒŒO P
posX
ŒŒP T
,
ŒŒT U
posY
ŒŒV Z
)
ŒŒZ [
;
ŒŒ[ \
if
–– 
(
–– 
++
–– 
_leftMostCellRow
–– *
>=
––+ -
_rows
––. 3
)
––3 4
{
—— 
_leftMostCellRow
““ (
=
““) *
$num
““+ ,
;
““, -
additionalColoums
”” )
--
””) +
;
””+ ,
}
‘‘ 
}
’’ 
else
÷÷ 
{
◊◊ 
posX
ÿÿ 
=
ÿÿ 
	_cellPool
ÿÿ $
[
ÿÿ$ % 
rightMostCellIndex
ÿÿ% 7
]
ÿÿ7 8
.
ÿÿ8 9
anchoredPosition
ÿÿ9 I
.
ÿÿI J
x
ÿÿJ K
+
ÿÿL M
	_cellPool
ÿÿN W
[
ÿÿW X 
rightMostCellIndex
ÿÿX j
]
ÿÿj k
.
ÿÿk l
	sizeDelta
ÿÿl u
.
ÿÿu v
x
ÿÿv w
;
ÿÿw x
	_cellPool
ŸŸ 
[
ŸŸ 
leftMostCellIndex
ŸŸ /
]
ŸŸ/ 0
.
ŸŸ0 1
anchoredPosition
ŸŸ1 A
=
ŸŸB C
new
ŸŸD G
Vector2
ŸŸH O
(
ŸŸO P
posX
ŸŸP T
,
ŸŸT U
	_cellPool
ŸŸV _
[
ŸŸ_ `
leftMostCellIndex
ŸŸ` q
]
ŸŸq r
.
ŸŸr s
anchoredPositionŸŸs É
.ŸŸÉ Ñ
yŸŸÑ Ö
)ŸŸÖ Ü
;ŸŸÜ á
}
⁄⁄ 
_dataSource
‹‹ 
.
‹‹ 
SetCell
‹‹ #
(
‹‹# $
_cachedCells
‹‹$ 0
[
‹‹0 1
leftMostCellIndex
‹‹1 B
]
‹‹B C
,
‹‹C D
currentItemCount
‹‹E U
)
‹‹U V
;
‹‹V W 
rightMostCellIndex
ﬂﬂ "
=
ﬂﬂ# $
leftMostCellIndex
ﬂﬂ% 6
;
ﬂﬂ6 7
leftMostCellIndex
‡‡ !
=
‡‡" #
(
‡‡$ %
leftMostCellIndex
‡‡% 6
+
‡‡7 8
$num
‡‡9 :
)
‡‡: ;
%
‡‡< =
	_cellPool
‡‡> G
.
‡‡G H
Count
‡‡H M
;
‡‡M N
currentItemCount
‚‚  
++
‚‚  "
;
‚‚" #
if
„„ 
(
„„ 
!
„„ 
IsGrid
„„ 
)
„„ 
n
„„ 
++
„„  
;
„„  !
}
‰‰ 
if
ÂÂ 
(
ÂÂ 
IsGrid
ÂÂ 
)
ÂÂ 
{
ÊÊ 
Debug
ÁÁ 
.
ÁÁ 
Log
ÁÁ 
(
ÁÁ 
additionalColoums
ÁÁ +
)
ÁÁ+ ,
;
ÁÁ, -
Content
ËË 
.
ËË 
	sizeDelta
ËË !
+=
ËË" $
additionalColoums
ËË% 6
*
ËË7 8
Vector2
ËË9 @
.
ËË@ A
right
ËËA F
*
ËËG H

_cellWidth
ËËI S
;
ËËS T
n
ÈÈ 
-=
ÈÈ 
additionalColoums
ÈÈ &
;
ÈÈ& '
}
ÍÍ 
	_cellPool
ÏÏ 
.
ÏÏ 
ForEach
ÏÏ 
(
ÏÏ 
(
ÏÏ 
RectTransform
ÏÏ ,
cell
ÏÏ- 1
)
ÏÏ1 2
=>
ÏÏ3 5
cell
ÏÏ6 :
.
ÏÏ: ;
anchoredPosition
ÏÏ; K
-=
ÏÏL N
n
ÏÏO P
*
ÏÏQ R
Vector2
ÏÏS Z
.
ÏÏZ [
right
ÏÏ[ `
*
ÏÏa b
	_cellPool
ÏÏc l
[
ÏÏl m
leftMostCellIndex
ÏÏm ~
]
ÏÏ~ 
.ÏÏ Ä
	sizeDeltaÏÏÄ â
.ÏÏâ ä
xÏÏä ã
)ÏÏã å
;ÏÏå ç
Content
ÌÌ 
.
ÌÌ 
anchoredPosition
ÌÌ $
+=
ÌÌ% '
n
ÌÌ( )
*
ÌÌ* +
Vector2
ÌÌ, 3
.
ÌÌ3 4
right
ÌÌ4 9
*
ÌÌ: ;
	_cellPool
ÌÌ< E
[
ÌÌE F
leftMostCellIndex
ÌÌF W
]
ÌÌW X
.
ÌÌX Y
	sizeDelta
ÌÌY b
.
ÌÌb c
x
ÌÌc d
;
ÌÌd e

_recycling
ÓÓ 
=
ÓÓ 
false
ÓÓ 
;
ÓÓ 
return
ÔÔ 
n
ÔÔ 
*
ÔÔ 
Vector2
ÔÔ 
.
ÔÔ 
right
ÔÔ $
*
ÔÔ% &
	_cellPool
ÔÔ' 0
[
ÔÔ0 1
leftMostCellIndex
ÔÔ1 B
]
ÔÔB C
.
ÔÔC D
	sizeDelta
ÔÔD M
.
ÔÔM N
x
ÔÔN O
;
ÔÔO P
}
ÒÒ 	
private
ˆˆ 
Vector2
ˆˆ  
RecycleRightToleft
ˆˆ *
(
ˆˆ* +
)
ˆˆ+ ,
{
˜˜ 	

_recycling
¯¯ 
=
¯¯ 
true
¯¯ 
;
¯¯ 
int
˙˙ 
n
˙˙ 
=
˙˙ 
$num
˙˙ 
;
˙˙ 
float
˚˚ 
posX
˚˚ 
=
˚˚ 
IsGrid
˚˚ 
?
˚˚  !
	_cellPool
˚˚" +
[
˚˚+ ,
leftMostCellIndex
˚˚, =
]
˚˚= >
.
˚˚> ?
anchoredPosition
˚˚? O
.
˚˚O P
x
˚˚P Q
:
˚˚R S
$num
˚˚T U
;
˚˚U V
float
¸¸ 
posY
¸¸ 
=
¸¸ 
$num
¸¸ 
;
¸¸ 
int
˛˛ 
additionalColoums
˛˛ !
=
˛˛" #
$num
˛˛$ %
;
˛˛% &
while
ˇˇ 
(
ˇˇ 
	_cellPool
ˇˇ 
[
ˇˇ  
rightMostCellIndex
ˇˇ /
]
ˇˇ/ 0
.
ˇˇ0 1
MinX
ˇˇ1 5
(
ˇˇ5 6
)
ˇˇ6 7
>
ˇˇ8 9#
_recyclableViewBounds
ˇˇ: O
.
ˇˇO P
max
ˇˇP S
.
ˇˇS T
x
ˇˇT U
&&
ˇˇV X
currentItemCount
ˇˇY i
>
ˇˇj k
	_cellPool
ˇˇl u
.
ˇˇu v
Count
ˇˇv {
)
ˇˇ{ |
{
ÄÄ 
if
ÅÅ 
(
ÅÅ 
IsGrid
ÅÅ 
)
ÅÅ 
{
ÇÇ 
if
ÉÉ 
(
ÉÉ 
--
ÉÉ 
_leftMostCellRow
ÉÉ *
<
ÉÉ+ ,
$num
ÉÉ- .
)
ÉÉ. /
{
ÑÑ 
n
ÖÖ 
++
ÖÖ 
;
ÖÖ 
_leftMostCellRow
ÜÜ (
=
ÜÜ) *
_rows
ÜÜ+ 0
-
ÜÜ1 2
$num
ÜÜ3 4
;
ÜÜ4 5
posX
áá 
=
áá 
	_cellPool
áá (
[
áá( )
leftMostCellIndex
áá) :
]
áá: ;
.
áá; <
anchoredPosition
áá< L
.
ááL M
x
ááM N
-
ááO P

_cellWidth
ááQ [
;
áá[ \
additionalColoums
àà )
++
àà) +
;
àà+ ,
}
ââ 
posY
ää 
=
ää 
-
ää 
_leftMostCellRow
ää ,
*
ää- .
_cellHeight
ää/ :
;
ää: ;
	_cellPool
ãã 
[
ãã  
rightMostCellIndex
ãã 0
]
ãã0 1
.
ãã1 2
anchoredPosition
ãã2 B
=
ããC D
new
ããE H
Vector2
ããI P
(
ããP Q
posX
ããQ U
,
ããU V
posY
ããW [
)
ãã[ \
;
ãã\ ]
if
çç 
(
çç 
--
çç 
_RightMostCellRow
çç +
<
çç, -
$num
çç. /
)
çç/ 0
{
éé 
_RightMostCellRow
èè )
=
èè* +
_rows
èè, 1
-
èè2 3
$num
èè4 5
;
èè5 6
additionalColoums
êê )
--
êê) +
;
êê+ ,
}
ëë 
}
íí 
else
ìì 
{
îî 
posX
ññ 
=
ññ 
	_cellPool
ññ $
[
ññ$ %
leftMostCellIndex
ññ% 6
]
ññ6 7
.
ññ7 8
anchoredPosition
ññ8 H
.
ññH I
x
ññI J
-
ññK L
	_cellPool
ññM V
[
ññV W
leftMostCellIndex
ññW h
]
ññh i
.
ññi j
	sizeDelta
ññj s
.
ññs t
x
ññt u
;
ññu v
	_cellPool
óó 
[
óó  
rightMostCellIndex
óó 0
]
óó0 1
.
óó1 2
anchoredPosition
óó2 B
=
óóC D
new
óóE H
Vector2
óóI P
(
óóP Q
posX
óóQ U
,
óóU V
	_cellPool
óóW `
[
óó` a 
rightMostCellIndex
óóa s
]
óós t
.
óót u
anchoredPositionóóu Ö
.óóÖ Ü
yóóÜ á
)óóá à
;óóà â
n
òò 
++
òò 
;
òò 
}
ôô 
currentItemCount
õõ  
--
õõ  "
;
õõ" #
_dataSource
ùù 
.
ùù 
SetCell
ùù #
(
ùù# $
_cachedCells
ùù$ 0
[
ùù0 1 
rightMostCellIndex
ùù1 C
]
ùùC D
,
ùùD E
currentItemCount
ùùF V
-
ùùW X
	_cellPool
ùùY b
.
ùùb c
Count
ùùc h
)
ùùh i
;
ùùi j
leftMostCellIndex
†† !
=
††" # 
rightMostCellIndex
††$ 6
;
††6 7 
rightMostCellIndex
°° "
=
°°# $
(
°°% & 
rightMostCellIndex
°°& 8
-
°°9 :
$num
°°; <
+
°°= >
	_cellPool
°°? H
.
°°H I
Count
°°I N
)
°°N O
%
°°P Q
	_cellPool
°°R [
.
°°[ \
Count
°°\ a
;
°°a b
}
¢¢ 
if
§§ 
(
§§ 
IsGrid
§§ 
)
§§ 
{
•• 
Debug
¶¶ 
.
¶¶ 
Log
¶¶ 
(
¶¶ 
additionalColoums
¶¶ +
)
¶¶+ ,
;
¶¶, -
Content
ßß 
.
ßß 
	sizeDelta
ßß !
+=
ßß" $
additionalColoums
ßß% 6
*
ßß7 8
Vector2
ßß9 @
.
ßß@ A
right
ßßA F
*
ßßG H

_cellWidth
ßßI S
;
ßßS T
if
®® 
(
®® 
additionalColoums
®® %
>
®®& '
$num
®®( )
)
®®) *
{
©© 
n
™™ 
-=
™™ 
additionalColoums
™™ *
;
™™* +
}
´´ 
}
¨¨ 
	_cellPool
ØØ 
.
ØØ 
ForEach
ØØ 
(
ØØ 
(
ØØ 
RectTransform
ØØ ,
cell
ØØ- 1
)
ØØ1 2
=>
ØØ3 5
cell
ØØ6 :
.
ØØ: ;
anchoredPosition
ØØ; K
+=
ØØL N
n
ØØO P
*
ØØQ R
Vector2
ØØS Z
.
ØØZ [
right
ØØ[ `
*
ØØa b
	_cellPool
ØØc l
[
ØØl m
leftMostCellIndex
ØØm ~
]
ØØ~ 
.ØØ Ä
	sizeDeltaØØÄ â
.ØØâ ä
xØØä ã
)ØØã å
;ØØå ç
Content
∞∞ 
.
∞∞ 
anchoredPosition
∞∞ $
-=
∞∞% '
n
∞∞( )
*
∞∞* +
Vector2
∞∞, 3
.
∞∞3 4
right
∞∞4 9
*
∞∞: ;
	_cellPool
∞∞< E
[
∞∞E F
leftMostCellIndex
∞∞F W
]
∞∞W X
.
∞∞X Y
	sizeDelta
∞∞Y b
.
∞∞b c
x
∞∞c d
;
∞∞d e

_recycling
±± 
=
±± 
false
±± 
;
±± 
return
≤≤ 
-
≤≤ 
n
≤≤ 
*
≤≤ 
Vector2
≤≤ 
.
≤≤  
right
≤≤  %
*
≤≤& '
	_cellPool
≤≤( 1
[
≤≤1 2
leftMostCellIndex
≤≤2 C
]
≤≤C D
.
≤≤D E
	sizeDelta
≤≤E N
.
≤≤N O
x
≤≤O P
;
≤≤P Q
}
≥≥ 	
private
ªª 
void
ªª 
	SetAnchor
ªª 
(
ªª 
RectTransform
ªª ,
rectTransform
ªª- :
)
ªª: ;
{
ºº 	
float
ææ 
width
ææ 
=
ææ 
rectTransform
ææ '
.
ææ' (
rect
ææ( ,
.
ææ, -
width
ææ- 2
;
ææ2 3
float
øø 
height
øø 
=
øø 
rectTransform
øø (
.
øø( )
rect
øø) -
.
øø- .
height
øø. 4
;
øø4 5
Vector2
¡¡ 
pos
¡¡ 
=
¡¡ 
IsGrid
¡¡  
?
¡¡! "
new
¡¡# &
Vector2
¡¡' .
(
¡¡. /
$num
¡¡/ 0
,
¡¡0 1
$num
¡¡2 3
)
¡¡3 4
:
¡¡5 6
new
¡¡7 :
Vector2
¡¡; B
(
¡¡B C
$num
¡¡C D
,
¡¡D E
$num
¡¡F J
)
¡¡J K
;
¡¡K L
rectTransform
ƒƒ 
.
ƒƒ 
	anchorMin
ƒƒ #
=
ƒƒ$ %
pos
ƒƒ& )
;
ƒƒ) *
rectTransform
≈≈ 
.
≈≈ 
	anchorMax
≈≈ #
=
≈≈$ %
pos
≈≈& )
;
≈≈) *
rectTransform
∆∆ 
.
∆∆ 
pivot
∆∆ 
=
∆∆  !
pos
∆∆" %
;
∆∆% &
rectTransform
…… 
.
…… 
	sizeDelta
…… #
=
……$ %
new
……& )
Vector2
……* 1
(
……1 2
width
……2 7
,
……7 8
height
……9 ?
)
……? @
;
……@ A
}
   	
public
œœ 
void
œœ 
OnDrawGizmos
œœ  
(
œœ  !
)
œœ! "
{
–– 	
Gizmos
—— 
.
—— 
color
—— 
=
—— 
Color
——  
.
——  !
green
——! &
;
——& '
Gizmos
““ 
.
““ 
DrawLine
““ 
(
““ #
_recyclableViewBounds
““ 1
.
““1 2
min
““2 5
-
““6 7
new
““8 ;
Vector3
““< C
(
““C D
$num
““D E
,
““E F
$num
““G K
)
““K L
,
““L M#
_recyclableViewBounds
““N c
.
““c d
min
““d g
+
““h i
new
““j m
Vector3
““n u
(
““u v
$num
““v w
,
““w x
$num
““y }
)
““} ~
)
““~ 
;““ Ä
Gizmos
”” 
.
”” 
color
”” 
=
”” 
Color
””  
.
””  !
red
””! $
;
””$ %
Gizmos
‘‘ 
.
‘‘ 
DrawLine
‘‘ 
(
‘‘ #
_recyclableViewBounds
‘‘ 1
.
‘‘1 2
max
‘‘2 5
-
‘‘6 7
new
‘‘8 ;
Vector3
‘‘< C
(
‘‘C D
$num
‘‘D E
,
‘‘E F
$num
‘‘G K
)
‘‘K L
,
‘‘L M#
_recyclableViewBounds
‘‘N c
.
‘‘c d
max
‘‘d g
+
‘‘h i
new
‘‘j m
Vector3
‘‘n u
(
‘‘u v
$num
‘‘v w
,
‘‘w x
$num
‘‘y }
)
‘‘} ~
)
‘‘~ 
;‘‘ Ä
}
’’ 	
}
ÿÿ 
}⁄⁄ ¢
]D:\GitHub-Projects\Recyclable-Scroll-Rect\Assets\Recyclable Scroll Rect\Main\Scripts\ICell.cs
	namespace		 	
PolyAndCode		
 
.		 
UI		 
{

 
public 

	interface 
ICell 
{ 
} 
} ⁄
wD:\GitHub-Projects\Recyclable-Scroll-Rect\Assets\Recyclable Scroll Rect\Main\Scripts\IRecyclableScrollRectDataSource.cs
	namespace		 	
PolyAndCode		
 
.		 
UI		 
{

 
public 

	interface +
IRecyclableScrollRectDataSource 4
{ 
int 
GetItemCount 
( 
) 
; 
void 
SetCell 
( 
ICell 
cell 
,  
int! $
index% *
)* +
;+ ,
} 
} ≠.
lD:\GitHub-Projects\Recyclable-Scroll-Rect\Assets\Recyclable Scroll Rect\Main\Scripts\RecyclableScrollRect.cs
	namespace		 	
PolyAndCode		
 
.		 
UI		 
{

 
public 

class  
RecyclableScrollRect %
:& '

ScrollRect( 2
{ 
public 
bool 
Grid 
; 
public 
enum 
DirectionType !
{ 	
Vertical 
, 

Horizontal 
} 	
public 
DirectionType 
	Direction &
;& '
public 
int 
Segments 
{ 
set 
{ 
	_segments 
= 
Math  
.  !
Max! $
($ %
value% *
,* +
$num, -
)- .
;. /
} 
get 
{ 
return 
	_segments  
;  !
} 
}   	
["" 	
SerializeField""	 
]"" 
private## 
int## 
	_segments## 
;## 
public$$ 
RectTransform$$ 
PrototypeCell$$ *
;$$* +
public%% 
bool%% 
SelfInitialize%% "
=%%# $
true%%% )
;%%) *
['' 	
HideInInspector''	 
]'' 
public(( +
IRecyclableScrollRectDataSource(( .

DataSource((/ 9
;((9 :
private** 
RecyclingSystem**  
recyclableScrollRect**  4
;**4 5
	protected,, 
override,, 
void,, 
Start,,  %
(,,% &
),,& '
{-- 	
vertical// 
=// 
false// 
;// 

horizontal00 
=00 
true00 
;00 
if22 
(22 
!22 
Application22 
.22 
	isPlaying22 &
)22& '
return22( .
;22. /
if44 
(44 
SelfInitialize44 
)44 

Initialize44  *
(44* +
)44+ ,
;44, -
}55 	
private88 
void88 

Initialize88 
(88  
)88  !
{99 	
if:: 
(:: 
	Direction:: 
==:: 
DirectionType:: *
.::* +
Vertical::+ 3
)::3 4
{;;  
recyclableScrollRect<< $
=<<% &
new<<' *#
VerticalRecyclingSystem<<+ B
(<<B C
PrototypeCell<<C P
,<<P Q
viewport<<R Z
,<<Z [
content<<\ c
,<<c d

DataSource<<e o
,<<o p
Grid<<q u
,<<u v
Segments<<w 
)	<< Ä
;
<<Ä Å
}== 
else>> 
if>> 
(>> 
	Direction>> 
==>> !
DirectionType>>" /
.>>/ 0

Horizontal>>0 :
)>>: ;
{??  
recyclableScrollRect@@ $
=@@% &
new@@' *%
HorizontalRecyclingSystem@@+ D
(@@D E
PrototypeCell@@E R
,@@R S
viewport@@T \
,@@\ ]
content@@^ e
,@@e f

DataSource@@g q
,@@q r
Grid@@s w
,@@w x
Segments	@@y Å
)
@@Å Ç
;
@@Ç É
}AA 
verticalCC 
=CC 
	DirectionCC  
==CC! #
DirectionTypeCC$ 1
.CC1 2
VerticalCC2 :
;CC: ;

horizontalDD 
=DD 
	DirectionDD "
==DD# %
DirectionTypeDD& 3
.DD3 4

HorizontalDD4 >
;DD> ?
onValueChangedFF 
.FF 
RemoveListenerFF )
(FF) *"
OnValueChangedListenerFF* @
)FF@ A
;FFA B
StartCoroutineHH 
(HH  
recyclableScrollRectHH /
.HH/ 0
InitCoroutineHH0 =
(HH= >
(HH> ?
)HH? @
=>HHA C
onValueChangedII? M
.IIM N
AddListenerIIN Y
(IIY Z"
OnValueChangedListenerIIZ p
)IIp q
)JJ> ?
)JJ? @
;JJ@ A
}KK 	
publicMM 
voidMM 

InitializeMM 
(MM +
IRecyclableScrollRectDataSourceMM >

dataSourceMM? I
)MMI J
{NN 	

DataSourceOO 
=OO 

dataSourceOO #
;OO# $

InitializePP 
(PP 
)PP 
;PP 
}QQ 	
publicTT 
voidTT "
OnValueChangedListenerTT *
(TT* +
Vector2TT+ 2
argsTT3 7
)TT7 8
{UU 	"
m_ContentStartPositionVV "
+=VV# % 
recyclableScrollRectVV& :
.VV: ;"
OnValueChangedListenerVV; Q
(VVQ R
velocityVVR Z
)VVZ [
;VV[ \
}WW 	
privateZZ 
voidZZ 
OnDrawGizmosZZ !
(ZZ! "
)ZZ" #
{[[ 	
if\\ 
(\\  
recyclableScrollRect\\ $
is\\% '#
VerticalRecyclingSystem\\( ?
)\\? @
{]] 
(^^ 
(^^ #
VerticalRecyclingSystem^^ )
)^^) * 
recyclableScrollRect^^* >
)^^> ?
.^^? @
OnDrawGizmos^^@ L
(^^L M
)^^M N
;^^N O
}__ 
ifaa 
(aa  
recyclableScrollRectaa $
isaa% '%
HorizontalRecyclingSystemaa( A
)aaA B
{bb 
(cc 
(cc %
HorizontalRecyclingSystemcc +
)cc+ , 
recyclableScrollRectcc, @
)cc@ A
.ccA B
OnDrawGizmosccB N
(ccN O
)ccO P
;ccP Q
}dd 
}ff 	
}ii 
}jj Ê

gD:\GitHub-Projects\Recyclable-Scroll-Rect\Assets\Recyclable Scroll Rect\Main\Scripts\RecyclingSystem.cs
	namespace 	
PolyAndCode
 
. 
UI 
{ 
public 

abstract 
class 
RecyclingSystem )
{ 
	protected 
RectTransform 
Viewport  (
,( )
Content* 1
;1 2
	protected 
bool 
IsGrid 
; 
	protected		 
RectTransform		 
PrototypeCell		  -
;		- .
	protected 
float 
MinPoolCoverage '
=( )
$num* .
;. /
	protected 
int 
MinPoolSize !
=" #
$num$ &
;& '
	protected 
float 
RecyclingThreshold *
=+ ,
$num- 0
;0 1
public 
abstract 
IEnumerator #
InitCoroutine$ 1
(1 2
System2 8
.8 9
Action9 ?
onInitialized@ M
)M N
;N O
public 
abstract 
Vector2 "
OnValueChangedListener  6
(6 7
Vector27 >
	direction? H
)H I
;I J
} 
} ¡
cD:\GitHub-Projects\Recyclable-Scroll-Rect\Assets\Recyclable Scroll Rect\Main\Scripts\UIExtension.cs
public

 
static

 
class

 
UIExtension

 
{ 
public 

static 
float 
MaxY 
( 
this !
RectTransform" /
rectTransform0 =
)= >
{ 
Vector3 
[ 
] 
corners 
= 
new 
Vector3  '
[' (
$num( )
]) *
;* +
rectTransform 
. 
GetWorldCorners %
(% &
corners& -
)- .
;. /
return 
corners 
[ 
$num 
] 
. 
y 
; 
} 
public 

static 
float 
MinY 
( 
this !
RectTransform" /
rectTransform0 =
)= >
{ 
Vector3 
[ 
] 
corners 
= 
new 
Vector3  '
[' (
$num( )
]) *
;* +
rectTransform 
. 
GetWorldCorners %
(% &
corners& -
)- .
;. /
return 
corners 
[ 
$num 
] 
. 
y 
; 
} 
public 

static 
float 
MaxX 
( 
this !
RectTransform" /
rectTransform0 =
)= >
{ 
Vector3 
[ 
] 
corners 
= 
new 
Vector3  '
[' (
$num( )
]) *
;* +
rectTransform 
. 
GetWorldCorners %
(% &
corners& -
)- .
;. /
return 
corners 
[ 
$num 
] 
. 
x 
; 
} 
public!! 

static!! 
float!! 
MinX!! 
(!! 
this!! !
RectTransform!!" /
rectTransform!!0 =
)!!= >
{"" 
Vector3## 
[## 
]## 
corners## 
=## 
new## 
Vector3##  '
[##' (
$num##( )
]##) *
;##* +
rectTransform$$ 
.$$ 
GetWorldCorners$$ %
($$% &
corners$$& -
)$$- .
;$$. /
return%% 
corners%% 
[%% 
$num%% 
]%% 
.%% 
x%% 
;%% 
}&& 
}(( Åé
oD:\GitHub-Projects\Recyclable-Scroll-Rect\Assets\Recyclable Scroll Rect\Main\Scripts\VerticalRecyclingSystem.cs
	namespace 	
PolyAndCode
 
. 
UI 
{ 
public 

class #
VerticalRecyclingSystem (
:) *
RecyclingSystem+ :
{		 
private 
readonly +
IRecyclableScrollRectDataSource 8
_dataSource9 D
;D E
private 
readonly 
int 
	_coloumns &
;& '
private 
float 

_cellWidth  
,  !
_cellHeight" -
;- .
private 
int 
_topMostCellColoumn '
,' ("
_bottomMostCellColoumn) ?
;? @
public 
bool 
SelfInitialize "
=# $
true% )
;) *
private 
List 
< 
RectTransform "
>" #
	_cellPool$ -
;- .
private 
List 
< 
ICell 
> 
_cachedCells (
;( )
private 
Bounds !
_recyclableViewBounds ,
;, -
private 
readonly 
Vector3  
[  !
]! "
_corners# +
=, -
new. 1
Vector32 9
[9 :
$num: ;
]; <
;< =
private 
bool 

_recycling 
;  
private   
int   
topMostCellIndex   $
,  $ %
bottomMostCellIndex  & 9
;  9 :
private!! 
int!! 
currentItemCount!! $
;!!$ %
private## 
Vector2## 

zeroVector## "
=### $
Vector2##% ,
.##, -
zero##- 1
;##1 2
public%% #
VerticalRecyclingSystem%% &
(%%& '
RectTransform%%' 4
prototypeCell%%5 B
,%%B C
RectTransform%%D Q
viewport%%R Z
,%%Z [
RectTransform%%\ i
content%%j q
,%%q r,
IRecyclableScrollRectDataSource	%%s í

dataSource
%%ì ù
,
%%ù û
bool
%%ü £
isGrid
%%§ ™
,
%%™ ´
int
%%¨ Ø
coloumns
%%∞ ∏
)
%%∏ π
{&& 	
PrototypeCell'' 
='' 
prototypeCell'' )
;'') *
Viewport(( 
=(( 
viewport(( 
;((  
Content)) 
=)) 
content)) 
;)) 
_dataSource** 
=** 

dataSource** $
;**$ %
IsGrid++ 
=++ 
isGrid++ 
;++ 
	_coloumns-- 
=-- 
isGrid-- 
?--  
coloumns--! )
:--* +
$num--, -
;--- .
}.. 	
public44 
override44 
IEnumerator44 #
InitCoroutine44$ 1
(441 2
System442 8
.448 9
Action449 ?
onInitialized44@ M
)44M N
{55 	
SetTopAnchor66 
(66 
Content66  
)66  !
;66! "
Content77 
.77 
anchoredPosition77 $
=77% &
Vector377' .
.77. /
zero77/ 3
;773 4
yield88 
return88 
null88 
;88 
SetRecyclingBounds99 
(99 
)99  
;99  !
CreateCellPool<< 
(<< 
)<< 
;<< 
topMostCellIndex>> 
=>> 
$num>>  
;>>  !
bottomMostCellIndex?? 
=??  !
	_cellPool??" +
.??+ ,
Count??, 1
-??2 3
$num??4 5
;??5 6
intAA 
noOfRowsAA 
=AA 
(AA 
intAA 
)AA  
MathfAA  %
.AA% &
CeilAA& *
(AA* +
(AA+ ,
floatAA, 1
)AA1 2
	_cellPoolAA2 ;
.AA; <
CountAA< A
/AAB C
(AAD E
floatAAE J
)AAJ K
	_coloumnsAAK T
)AAT U
;AAU V
floatDD 
contentYSizeDD 
=DD  
noOfRowsDD! )
*DD* +
PrototypeCellDD, 9
.DD9 :
	sizeDeltaDD: C
.DDC D
yDDD E
;DDE F
ContentEE 
.EE 
	sizeDeltaEE 
=EE 
newEE  #
Vector2EE$ +
(EE+ ,
ContentEE, 3
.EE3 4
	sizeDeltaEE4 =
.EE= >
xEE> ?
,EE? @
contentYSizeEEA M
)EEM N
;EEN O
currentItemCountFF 
=FF 
	_cellPoolFF (
.FF( )
CountFF) .
;FF. /
SetTopAnchorGG 
(GG 
ContentGG  
)GG  !
;GG! "
ifII 
(II 
onInitializedII 
!=II  
nullII! %
)II% &
onInitializedII' 4
(II4 5
)II5 6
;II6 7
}JJ 	
privateOO 
voidOO 
SetRecyclingBoundsOO '
(OO' (
)OO( )
{PP 	
ViewportQQ 
.QQ 
GetWorldCornersQQ $
(QQ$ %
_cornersQQ% -
)QQ- .
;QQ. /
floatRR 

threshHoldRR 
=RR 
RecyclingThresholdRR 1
*RR2 3
(RR4 5
_cornersRR5 =
[RR= >
$numRR> ?
]RR? @
.RR@ A
yRRA B
-RRC D
_cornersRRE M
[RRM N
$numRRN O
]RRO P
.RRP Q
yRRQ R
)RRR S
;RRS T!
_recyclableViewBoundsSS !
.SS! "
minSS" %
=SS& '
newSS( +
Vector3SS, 3
(SS3 4
_cornersSS4 <
[SS< =
$numSS= >
]SS> ?
.SS? @
xSS@ A
,SSA B
_cornersSSC K
[SSK L
$numSSL M
]SSM N
.SSN O
ySSO P
-SSQ R

threshHoldSSS ]
)SS] ^
;SS^ _!
_recyclableViewBoundsTT !
.TT! "
maxTT" %
=TT& '
newTT( +
Vector3TT, 3
(TT3 4
_cornersTT4 <
[TT< =
$numTT= >
]TT> ?
.TT? @
xTT@ A
,TTA B
_cornersTTC K
[TTK L
$numTTL M
]TTM N
.TTN O
yTTO P
+TTQ R

threshHoldTTS ]
)TT] ^
;TT^ _
}UU 	
privateZZ 
voidZZ 
CreateCellPoolZZ #
(ZZ# $
)ZZ$ %
{[[ 	
if]] 
(]] 
	_cellPool]] 
!=]] 
null]] !
)]]! "
{^^ 
	_cellPool__ 
.__ 
ForEach__ !
(__! "
(__" #
RectTransform__# 0
item__1 5
)__5 6
=>__7 9
UnityEngine__: E
.__E F
Object__F L
.__L M
Destroy__M T
(__T U
item__U Y
.__Y Z

gameObject__Z d
)__d e
)__e f
;__f g
	_cellPool`` 
.`` 
Clear`` 
(``  
)``  !
;``! "
_cachedCellsaa 
.aa 
Clearaa "
(aa" #
)aa# $
;aa$ %
}bb 
elsecc 
{dd 
_cachedCellsee 
=ee 
newee "
Listee# '
<ee' (
ICellee( -
>ee- .
(ee. /
)ee/ 0
;ee0 1
	_cellPoolff 
=ff 
newff 
Listff  $
<ff$ %
RectTransformff% 2
>ff2 3
(ff3 4
)ff4 5
;ff5 6
}gg 
PrototypeCelljj 
.jj 

gameObjectjj $
.jj$ %
	SetActivejj% .
(jj. /
truejj/ 3
)jj3 4
;jj4 5
ifkk 
(kk 
IsGridkk 
)kk 
{ll 
SetTopLeftAnchormm  
(mm  !
PrototypeCellmm! .
)mm. /
;mm/ 0
}nn 
elseoo 
{pp 
SetTopAnchorqq 
(qq 
PrototypeCellqq *
)qq* +
;qq+ ,
}rr 
floatuu 
currentPoolCoverageuu %
=uu& '
$numuu( )
;uu) *
intvv 
poolSizevv 
=vv 
$numvv 
;vv 
floatxx 
posXxx 
=xx 
$numxx 
;xx 
floatyy 
posYyy 
=yy 
$numyy 
;yy 

_cellWidth{{ 
={{ 
Content{{  
.{{  !
rect{{! %
.{{% &
width{{& +
/{{, -
	_coloumns{{. 7
;{{7 8
_cellHeight|| 
=|| 
PrototypeCell|| '
.||' (
	sizeDelta||( 1
.||1 2
y||2 3
/||4 5
PrototypeCell||6 C
.||C D
	sizeDelta||D M
.||M N
x||N O
*||P Q

_cellWidth||R \
;||\ ]
PrototypeCell}} 
.}} 
	sizeDelta}} #
=}}$ %
new}}& )
Vector3}}* 1
(}}1 2

_cellWidth}}2 <
,}}< =
_cellHeight}}> I
)}}I J
;}}J K
float
ÄÄ 
requriedCoverage
ÄÄ "
=
ÄÄ# $
MinPoolCoverage
ÄÄ% 4
*
ÄÄ5 6
Viewport
ÄÄ7 ?
.
ÄÄ? @
rect
ÄÄ@ D
.
ÄÄD E
height
ÄÄE K
;
ÄÄK L
int
ÇÇ 
minPoolSize
ÇÇ 
=
ÇÇ 
Math
ÇÇ "
.
ÇÇ" #
Min
ÇÇ# &
(
ÇÇ& '
MinPoolSize
ÇÇ' 2
,
ÇÇ2 3
_dataSource
ÇÇ4 ?
.
ÇÇ? @
GetItemCount
ÇÇ@ L
(
ÇÇL M
)
ÇÇM N
)
ÇÇN O
;
ÇÇO P
while
ÖÖ 
(
ÖÖ 
(
ÖÖ 
poolSize
ÖÖ 
<
ÖÖ 
minPoolSize
ÖÖ *
||
ÖÖ+ -!
currentPoolCoverage
ÖÖ. A
<
ÖÖB C
requriedCoverage
ÖÖD T
)
ÖÖT U
&&
ÖÖV X
poolSize
ÖÖY a
<
ÖÖb c
_dataSource
ÖÖd o
.
ÖÖo p
GetItemCount
ÖÖp |
(
ÖÖ| }
)
ÖÖ} ~
)
ÖÖ~ 
{
ÜÜ 
RectTransform
àà 
item
àà "
=
àà# $
(
àà% &
UnityEngine
àà& 1
.
àà1 2
Object
àà2 8
.
àà8 9
Instantiate
àà9 D
(
ààD E
PrototypeCell
ààE R
.
ààR S

gameObject
ààS ]
)
àà] ^
)
àà^ _
.
àà_ `
GetComponent
àà` l
<
ààl m
RectTransform
ààm z
>
ààz {
(
àà{ |
)
àà| }
;
àà} ~
item
ââ 
.
ââ 
name
ââ 
=
ââ 
$str
ââ "
;
ââ" #
	_cellPool
ää 
.
ää 
Add
ää 
(
ää 
item
ää "
)
ää" #
;
ää# $
item
ãã 
.
ãã 
	SetParent
ãã 
(
ãã 
Content
ãã &
,
ãã& '
false
ãã( -
)
ãã- .
;
ãã. /
if
çç 
(
çç 
IsGrid
çç 
)
çç 
{
éé 
posX
èè 
=
èè $
_bottomMostCellColoumn
èè 1
*
èè2 3

_cellWidth
èè4 >
;
èè> ?
item
êê 
.
êê 
anchoredPosition
êê )
=
êê* +
new
êê, /
Vector2
êê0 7
(
êê7 8
posX
êê8 <
,
êê< =
posY
êê> B
)
êêB C
;
êêC D
if
ëë 
(
ëë 
++
ëë $
_bottomMostCellColoumn
ëë 0
>=
ëë1 3
	_coloumns
ëë4 =
)
ëë= >
{
íí $
_bottomMostCellColoumn
ìì .
=
ìì/ 0
$num
ìì1 2
;
ìì2 3
posY
îî 
-=
îî 
_cellHeight
îî  +
;
îî+ ,!
currentPoolCoverage
ïï +
+=
ïï, .
item
ïï/ 3
.
ïï3 4
rect
ïï4 8
.
ïï8 9
height
ïï9 ?
;
ïï? @
}
ññ 
}
óó 
else
òò 
{
ôô 
item
õõ 
.
õõ 
anchoredPosition
õõ )
=
õõ* +
new
õõ, /
Vector2
õõ0 7
(
õõ7 8
$num
õõ8 9
,
õõ9 :
posY
õõ; ?
)
õõ? @
;
õõ@ A
posY
úú 
=
úú 
item
úú 
.
úú  
anchoredPosition
úú  0
.
úú0 1
y
úú1 2
-
úú3 4
item
úú5 9
.
úú9 :
rect
úú: >
.
úú> ?
height
úú? E
;
úúE F!
currentPoolCoverage
ùù '
+=
ùù( *
item
ùù+ /
.
ùù/ 0
rect
ùù0 4
.
ùù4 5
height
ùù5 ;
;
ùù; <
}
ûû 
_cachedCells
°° 
.
°° 
Add
°°  
(
°°  !
item
°°! %
.
°°% &
GetComponent
°°& 2
<
°°2 3
ICell
°°3 8
>
°°8 9
(
°°9 :
)
°°: ;
)
°°; <
;
°°< =
_dataSource
¢¢ 
.
¢¢ 
SetCell
¢¢ #
(
¢¢# $
_cachedCells
¢¢$ 0
[
¢¢0 1
_cachedCells
¢¢1 =
.
¢¢= >
Count
¢¢> C
-
¢¢D E
$num
¢¢F G
]
¢¢G H
,
¢¢H I
poolSize
¢¢J R
)
¢¢R S
;
¢¢S T
poolSize
•• 
++
•• 
;
•• 
}
¶¶ 
if
©© 
(
©© 
IsGrid
©© 
)
©© 
{
™™ $
_bottomMostCellColoumn
´´ &
=
´´' (
(
´´) *$
_bottomMostCellColoumn
´´* @
-
´´A B
$num
´´C D
+
´´E F
	_coloumns
´´G P
)
´´P Q
%
´´R S
	_coloumns
´´T ]
;
´´] ^
}
¨¨ 
if
ØØ 
(
ØØ 
PrototypeCell
ØØ 
.
ØØ 

gameObject
ØØ (
.
ØØ( )
scene
ØØ) .
.
ØØ. /
IsValid
ØØ/ 6
(
ØØ6 7
)
ØØ7 8
)
ØØ8 9
{
∞∞ 
PrototypeCell
±± 
.
±± 

gameObject
±± (
.
±±( )
	SetActive
±±) 2
(
±±2 3
false
±±3 8
)
±±8 9
;
±±9 :
}
≤≤ 
}
≥≥ 	
public
∫∫ 
override
∫∫ 
Vector2
∫∫ $
OnValueChangedListener
∫∫  6
(
∫∫6 7
Vector2
∫∫7 >
	direction
∫∫? H
)
∫∫H I
{
ªª 	
if
ºº 
(
ºº 

_recycling
ºº 
||
ºº 
	_cellPool
ºº '
==
ºº( *
null
ºº+ /
||
ºº0 2
	_cellPool
ºº3 <
.
ºº< =
Count
ºº= B
==
ººC E
$num
ººF G
)
ººG H
return
ººI O

zeroVector
ººP Z
;
ººZ [ 
SetRecyclingBounds
øø 
(
øø 
)
øø  
;
øø  !
if
¿¿ 
(
¿¿ 
	direction
¿¿ 
.
¿¿ 
y
¿¿ 
>
¿¿ 
$num
¿¿ 
&&
¿¿  "
	_cellPool
¿¿# ,
[
¿¿, -!
bottomMostCellIndex
¿¿- @
]
¿¿@ A
.
¿¿A B
MaxY
¿¿B F
(
¿¿F G
)
¿¿G H
>
¿¿I J#
_recyclableViewBounds
¿¿K `
.
¿¿` a
min
¿¿a d
.
¿¿d e
y
¿¿e f
)
¿¿f g
{
¡¡ 
return
¬¬  
RecycleTopToBottom
¬¬ )
(
¬¬) *
)
¬¬* +
;
¬¬+ ,
}
√√ 
else
ƒƒ 
if
ƒƒ 
(
ƒƒ 
	direction
ƒƒ 
.
ƒƒ 
y
ƒƒ  
<
ƒƒ! "
$num
ƒƒ# $
&&
ƒƒ% '
	_cellPool
ƒƒ( 1
[
ƒƒ1 2
topMostCellIndex
ƒƒ2 B
]
ƒƒB C
.
ƒƒC D
MinY
ƒƒD H
(
ƒƒH I
)
ƒƒI J
<
ƒƒK L#
_recyclableViewBounds
ƒƒM b
.
ƒƒb c
max
ƒƒc f
.
ƒƒf g
y
ƒƒg h
)
ƒƒh i
{
≈≈ 
return
∆∆  
RecycleBottomToTop
∆∆ )
(
∆∆) *
)
∆∆* +
;
∆∆+ ,
}
«« 
return
…… 

zeroVector
…… 
;
…… 
}
   	
private
œœ 
Vector2
œœ  
RecycleTopToBottom
œœ *
(
œœ* +
)
œœ+ ,
{
–– 	

_recycling
—— 
=
—— 
true
—— 
;
—— 
int
”” 
n
”” 
=
”” 
$num
”” 
;
”” 
float
‘‘ 
posY
‘‘ 
=
‘‘ 
IsGrid
‘‘ 
?
‘‘  !
	_cellPool
‘‘" +
[
‘‘+ ,!
bottomMostCellIndex
‘‘, ?
]
‘‘? @
.
‘‘@ A
anchoredPosition
‘‘A Q
.
‘‘Q R
y
‘‘R S
:
‘‘T U
$num
‘‘V W
;
‘‘W X
float
’’ 
posX
’’ 
=
’’ 
$num
’’ 
;
’’ 
var
ŸŸ 
additionalRows
ŸŸ 
=
ŸŸ  
$num
ŸŸ! "
;
ŸŸ" #
while
⁄⁄ 
(
⁄⁄ 
	_cellPool
⁄⁄ 
[
⁄⁄ 
topMostCellIndex
⁄⁄ -
]
⁄⁄- .
.
⁄⁄. /
MinY
⁄⁄/ 3
(
⁄⁄3 4
)
⁄⁄4 5
>
⁄⁄6 7#
_recyclableViewBounds
⁄⁄8 M
.
⁄⁄M N
max
⁄⁄N Q
.
⁄⁄Q R
y
⁄⁄R S
&&
⁄⁄T V
currentItemCount
⁄⁄W g
<
⁄⁄h i
_dataSource
⁄⁄j u
.
⁄⁄u v
GetItemCount⁄⁄v Ç
(⁄⁄Ç É
)⁄⁄É Ñ
)⁄⁄Ñ Ö
{
€€ 
if
‹‹ 
(
‹‹ 
IsGrid
‹‹ 
)
‹‹ 
{
›› 
if
ﬁﬁ 
(
ﬁﬁ 
++
ﬁﬁ $
_bottomMostCellColoumn
ﬁﬁ 0
>=
ﬁﬁ1 3
	_coloumns
ﬁﬁ4 =
)
ﬁﬁ= >
{
ﬂﬂ 
n
‡‡ 
++
‡‡ 
;
‡‡ $
_bottomMostCellColoumn
·· .
=
··/ 0
$num
··1 2
;
··2 3
posY
‚‚ 
=
‚‚ 
	_cellPool
‚‚ (
[
‚‚( )!
bottomMostCellIndex
‚‚) <
]
‚‚< =
.
‚‚= >
anchoredPosition
‚‚> N
.
‚‚N O
y
‚‚O P
-
‚‚Q R
_cellHeight
‚‚S ^
;
‚‚^ _
additionalRows
„„ &
++
„„& (
;
„„( )
}
‰‰ 
posX
ÂÂ 
=
ÂÂ $
_bottomMostCellColoumn
ÂÂ 1
*
ÂÂ2 3

_cellWidth
ÂÂ4 >
;
ÂÂ> ?
	_cellPool
ÁÁ 
[
ÁÁ 
topMostCellIndex
ÁÁ .
]
ÁÁ. /
.
ÁÁ/ 0
anchoredPosition
ÁÁ0 @
=
ÁÁA B
new
ÁÁC F
Vector2
ÁÁG N
(
ÁÁN O
posX
ÁÁO S
,
ÁÁS T
posY
ÁÁU Y
)
ÁÁY Z
;
ÁÁZ [
if
ËË 
(
ËË 
++
ËË !
_topMostCellColoumn
ËË -
>=
ËË. 0
	_coloumns
ËË1 :
)
ËË: ;
{
ÈÈ !
_topMostCellColoumn
ÍÍ +
=
ÍÍ, -
$num
ÍÍ. /
;
ÍÍ/ 0
additionalRows
ÎÎ &
--
ÎÎ& (
;
ÎÎ( )
}
ÏÏ 
}
ÌÌ 
else
ÓÓ 
{
ÔÔ 
posY
ÒÒ 
=
ÒÒ 
	_cellPool
ÒÒ $
[
ÒÒ$ %!
bottomMostCellIndex
ÒÒ% 8
]
ÒÒ8 9
.
ÒÒ9 :
anchoredPosition
ÒÒ: J
.
ÒÒJ K
y
ÒÒK L
-
ÒÒM N
	_cellPool
ÒÒO X
[
ÒÒX Y!
bottomMostCellIndex
ÒÒY l
]
ÒÒl m
.
ÒÒm n
	sizeDelta
ÒÒn w
.
ÒÒw x
y
ÒÒx y
;
ÒÒy z
	_cellPool
ÚÚ 
[
ÚÚ 
topMostCellIndex
ÚÚ .
]
ÚÚ. /
.
ÚÚ/ 0
anchoredPosition
ÚÚ0 @
=
ÚÚA B
new
ÚÚC F
Vector2
ÚÚG N
(
ÚÚN O
	_cellPool
ÚÚO X
[
ÚÚX Y
topMostCellIndex
ÚÚY i
]
ÚÚi j
.
ÚÚj k
anchoredPosition
ÚÚk {
.
ÚÚ{ |
x
ÚÚ| }
,
ÚÚ} ~
posYÚÚ É
)ÚÚÉ Ñ
;ÚÚÑ Ö
}
ÛÛ 
_dataSource
ˆˆ 
.
ˆˆ 
SetCell
ˆˆ #
(
ˆˆ# $
_cachedCells
ˆˆ$ 0
[
ˆˆ0 1
topMostCellIndex
ˆˆ1 A
]
ˆˆA B
,
ˆˆB C
currentItemCount
ˆˆD T
)
ˆˆT U
;
ˆˆU V!
bottomMostCellIndex
˘˘ #
=
˘˘$ %
topMostCellIndex
˘˘& 6
;
˘˘6 7
topMostCellIndex
˙˙  
=
˙˙! "
(
˙˙# $
topMostCellIndex
˙˙$ 4
+
˙˙5 6
$num
˙˙7 8
)
˙˙8 9
%
˙˙: ;
	_cellPool
˙˙< E
.
˙˙E F
Count
˙˙F K
;
˙˙K L
currentItemCount
¸¸  
++
¸¸  "
;
¸¸" #
if
˝˝ 
(
˝˝ 
!
˝˝ 
IsGrid
˝˝ 
)
˝˝ 
n
˝˝ 
++
˝˝  
;
˝˝  !
}
˛˛ 
if
ÄÄ 
(
ÄÄ 
IsGrid
ÄÄ 
)
ÄÄ 
{
ÅÅ 
Content
ÇÇ 
.
ÇÇ 
	sizeDelta
ÇÇ !
+=
ÇÇ" $
additionalRows
ÇÇ% 3
*
ÇÇ4 5
Vector2
ÇÇ6 =
.
ÇÇ= >
up
ÇÇ> @
*
ÇÇA B
_cellHeight
ÇÇC N
;
ÇÇN O
n
ÑÑ 
-=
ÑÑ 
additionalRows
ÑÑ #
;
ÑÑ# $
}
ÖÖ 
	_cellPool
áá 
.
áá 
ForEach
áá 
(
áá 
(
áá 
RectTransform
áá ,
cell
áá- 1
)
áá1 2
=>
áá3 5
cell
áá6 :
.
áá: ;
anchoredPosition
áá; K
+=
ááL N
n
ááO P
*
ááQ R
Vector2
ááS Z
.
ááZ [
up
áá[ ]
*
áá^ _
	_cellPool
áá` i
[
áái j
topMostCellIndex
ááj z
]
ááz {
.
áá{ |
	sizeDeltaáá| Ö
.ááÖ Ü
yááÜ á
)ááá à
;ááà â
Content
ââ 
.
ââ 
anchoredPosition
ââ $
-=
ââ% '
n
ââ( )
*
ââ* +
Vector2
ââ, 3
.
ââ3 4
up
ââ4 6
*
ââ7 8
	_cellPool
ââ9 B
[
ââB C
topMostCellIndex
ââC S
]
ââS T
.
ââT U
	sizeDelta
ââU ^
.
ââ^ _
y
ââ_ `
;
ââ` a

_recycling
ää 
=
ää 
false
ää 
;
ää 
return
ãã 
-
ãã 
new
ãã 
Vector2
ãã 
(
ãã  
$num
ãã  !
,
ãã! "
n
ãã# $
*
ãã% &
	_cellPool
ãã' 0
[
ãã0 1
topMostCellIndex
ãã1 A
]
ããA B
.
ããB C
	sizeDelta
ããC L
.
ããL M
y
ããM N
)
ããN O
;
ããO P
}
çç 	
private
íí 
Vector2
íí  
RecycleBottomToTop
íí *
(
íí* +
)
íí+ ,
{
ìì 	

_recycling
îî 
=
îî 
true
îî 
;
îî 
int
ññ 
n
ññ 
=
ññ 
$num
ññ 
;
ññ 
float
óó 
posY
óó 
=
óó 
IsGrid
óó 
?
óó  !
	_cellPool
óó" +
[
óó+ ,
topMostCellIndex
óó, <
]
óó< =
.
óó= >
anchoredPosition
óó> N
.
óóN O
y
óóO P
:
óóQ R
$num
óóS T
;
óóT U
float
ôô 
posX
ôô 
=
ôô 
$num
ôô 
;
ôô 
var
ùù 
additionalRows
ùù 
=
ùù  
$num
ùù! "
;
ùù" #
while
ûû 
(
ûû 
	_cellPool
ûû 
[
ûû !
bottomMostCellIndex
ûû 0
]
ûû0 1
.
ûû1 2
MaxY
ûû2 6
(
ûû6 7
)
ûû7 8
<
ûû9 :#
_recyclableViewBounds
ûû; P
.
ûûP Q
min
ûûQ T
.
ûûT U
y
ûûU V
&&
ûûW Y
currentItemCount
ûûZ j
>
ûûk l
	_cellPool
ûûm v
.
ûûv w
Count
ûûw |
)
ûû| }
{
üü 
if
°° 
(
°° 
IsGrid
°° 
)
°° 
{
¢¢ 
if
££ 
(
££ 
--
££ !
_topMostCellColoumn
££ -
<
££. /
$num
££0 1
)
££1 2
{
§§ 
n
•• 
++
•• 
;
•• !
_topMostCellColoumn
¶¶ +
=
¶¶, -
	_coloumns
¶¶. 7
-
¶¶8 9
$num
¶¶: ;
;
¶¶; <
posY
ßß 
=
ßß 
	_cellPool
ßß (
[
ßß( )
topMostCellIndex
ßß) 9
]
ßß9 :
.
ßß: ;
anchoredPosition
ßß; K
.
ßßK L
y
ßßL M
+
ßßN O
_cellHeight
ßßP [
;
ßß[ \
additionalRows
®® &
++
®®& (
;
®®( )
}
©© 
posX
´´ 
=
´´ !
_topMostCellColoumn
´´ .
*
´´/ 0

_cellWidth
´´1 ;
;
´´; <
	_cellPool
≠≠ 
[
≠≠ !
bottomMostCellIndex
≠≠ 1
]
≠≠1 2
.
≠≠2 3
anchoredPosition
≠≠3 C
=
≠≠D E
new
≠≠F I
Vector2
≠≠J Q
(
≠≠Q R
posX
≠≠R V
,
≠≠V W
posY
≠≠X \
)
≠≠\ ]
;
≠≠] ^
if
ÆÆ 
(
ÆÆ 
--
ÆÆ $
_bottomMostCellColoumn
ÆÆ 0
<
ÆÆ1 2
$num
ÆÆ3 4
)
ÆÆ4 5
{
ØØ $
_bottomMostCellColoumn
∞∞ .
=
∞∞/ 0
	_coloumns
∞∞1 :
-
∞∞; <
$num
∞∞= >
;
∞∞> ?
additionalRows
±± &
--
±±& (
;
±±( )
}
≤≤ 
}
≥≥ 
else
¥¥ 
{
µµ 
posY
∑∑ 
=
∑∑ 
	_cellPool
∑∑ $
[
∑∑$ %
topMostCellIndex
∑∑% 5
]
∑∑5 6
.
∑∑6 7
anchoredPosition
∑∑7 G
.
∑∑G H
y
∑∑H I
+
∑∑J K
	_cellPool
∑∑L U
[
∑∑U V
topMostCellIndex
∑∑V f
]
∑∑f g
.
∑∑g h
	sizeDelta
∑∑h q
.
∑∑q r
y
∑∑r s
;
∑∑s t
	_cellPool
∏∏ 
[
∏∏ !
bottomMostCellIndex
∏∏ 1
]
∏∏1 2
.
∏∏2 3
anchoredPosition
∏∏3 C
=
∏∏D E
new
∏∏F I
Vector2
∏∏J Q
(
∏∏Q R
	_cellPool
∏∏R [
[
∏∏[ \!
bottomMostCellIndex
∏∏\ o
]
∏∏o p
.
∏∏p q
anchoredPosition∏∏q Å
.∏∏Å Ç
x∏∏Ç É
,∏∏É Ñ
posY∏∏Ö â
)∏∏â ä
;∏∏ä ã
n
∫∫ 
++
∫∫ 
;
∫∫ 
}
ªª 
currentItemCount
ΩΩ  
--
ΩΩ  "
;
ΩΩ" #
_dataSource
¿¿ 
.
¿¿ 
SetCell
¿¿ #
(
¿¿# $
_cachedCells
¿¿$ 0
[
¿¿0 1!
bottomMostCellIndex
¿¿1 D
]
¿¿D E
,
¿¿E F
currentItemCount
¿¿G W
-
¿¿X Y
	_cellPool
¿¿Z c
.
¿¿c d
Count
¿¿d i
)
¿¿i j
;
¿¿j k
topMostCellIndex
√√  
=
√√! "!
bottomMostCellIndex
√√# 6
;
√√6 7!
bottomMostCellIndex
ƒƒ #
=
ƒƒ$ %
(
ƒƒ& '!
bottomMostCellIndex
ƒƒ' :
-
ƒƒ; <
$num
ƒƒ= >
+
ƒƒ? @
	_cellPool
ƒƒA J
.
ƒƒJ K
Count
ƒƒK P
)
ƒƒP Q
%
ƒƒR S
	_cellPool
ƒƒT ]
.
ƒƒ] ^
Count
ƒƒ^ c
;
ƒƒc d
}
≈≈ 
if
«« 
(
«« 
IsGrid
«« 
)
«« 
{
»» 
Content
…… 
.
…… 
	sizeDelta
…… !
+=
……" $
additionalRows
……% 3
*
……4 5
Vector2
……6 =
.
……= >
up
……> @
*
……A B
_cellHeight
……C N
;
……N O
if
ÀÀ 
(
ÀÀ 
additionalRows
ÀÀ "
>
ÀÀ# $
$num
ÀÀ% &
)
ÀÀ& '
{
ÃÃ 
n
ÕÕ 
-=
ÕÕ 
additionalRows
ÕÕ '
;
ÕÕ' (
}
ŒŒ 
}
œœ 
	_cellPool
—— 
.
—— 
ForEach
—— 
(
—— 
(
—— 
RectTransform
—— ,
cell
——- 1
)
——1 2
=>
——3 5
cell
——6 :
.
——: ;
anchoredPosition
——; K
-=
——L N
n
——O P
*
——Q R
Vector2
——S Z
.
——Z [
up
——[ ]
*
——^ _
	_cellPool
——` i
[
——i j
topMostCellIndex
——j z
]
——z {
.
——{ |
	sizeDelta——| Ö
.——Ö Ü
y——Ü á
)——á à
;——à â
Content
““ 
.
““ 
anchoredPosition
““ $
+=
““% '
n
““( )
*
““* +
Vector2
““, 3
.
““3 4
up
““4 6
*
““7 8
	_cellPool
““9 B
[
““B C
topMostCellIndex
““C S
]
““S T
.
““T U
	sizeDelta
““U ^
.
““^ _
y
““_ `
;
““` a

_recycling
”” 
=
”” 
false
”” 
;
”” 
return
‘‘ 
new
‘‘ 
Vector2
‘‘ 
(
‘‘ 
$num
‘‘  
,
‘‘  !
n
‘‘" #
*
‘‘$ %
	_cellPool
‘‘& /
[
‘‘/ 0
topMostCellIndex
‘‘0 @
]
‘‘@ A
.
‘‘A B
	sizeDelta
‘‘B K
.
‘‘K L
y
‘‘L M
)
‘‘M N
;
‘‘N O
}
’’ 	
private
›› 
void
›› 
SetTopAnchor
›› !
(
››! "
RectTransform
››" /
rectTransform
››0 =
)
››= >
{
ﬁﬁ 	
float
‡‡ 
width
‡‡ 
=
‡‡ 
rectTransform
‡‡ '
.
‡‡' (
rect
‡‡( ,
.
‡‡, -
width
‡‡- 2
;
‡‡2 3
float
·· 
height
·· 
=
·· 
rectTransform
·· (
.
··( )
rect
··) -
.
··- .
height
··. 4
;
··4 5
rectTransform
‰‰ 
.
‰‰ 
	anchorMin
‰‰ #
=
‰‰$ %
new
‰‰& )
Vector2
‰‰* 1
(
‰‰1 2
$num
‰‰2 6
,
‰‰6 7
$num
‰‰8 9
)
‰‰9 :
;
‰‰: ;
rectTransform
ÂÂ 
.
ÂÂ 
	anchorMax
ÂÂ #
=
ÂÂ$ %
new
ÂÂ& )
Vector2
ÂÂ* 1
(
ÂÂ1 2
$num
ÂÂ2 6
,
ÂÂ6 7
$num
ÂÂ8 9
)
ÂÂ9 :
;
ÂÂ: ;
rectTransform
ÊÊ 
.
ÊÊ 
pivot
ÊÊ 
=
ÊÊ  !
new
ÊÊ" %
Vector2
ÊÊ& -
(
ÊÊ- .
$num
ÊÊ. 2
,
ÊÊ2 3
$num
ÊÊ4 5
)
ÊÊ5 6
;
ÊÊ6 7
rectTransform
ÈÈ 
.
ÈÈ 
	sizeDelta
ÈÈ #
=
ÈÈ$ %
new
ÈÈ& )
Vector2
ÈÈ* 1
(
ÈÈ1 2
width
ÈÈ2 7
,
ÈÈ7 8
height
ÈÈ9 ?
)
ÈÈ? @
;
ÈÈ@ A
}
ÍÍ 	
private
ÏÏ 
void
ÏÏ 
SetTopLeftAnchor
ÏÏ %
(
ÏÏ% &
RectTransform
ÏÏ& 3
rectTransform
ÏÏ4 A
)
ÏÏA B
{
ÌÌ 	
float
ÔÔ 
width
ÔÔ 
=
ÔÔ 
rectTransform
ÔÔ '
.
ÔÔ' (
rect
ÔÔ( ,
.
ÔÔ, -
width
ÔÔ- 2
;
ÔÔ2 3
float
 
height
 
=
 
rectTransform
 (
.
( )
rect
) -
.
- .
height
. 4
;
4 5
rectTransform
ÛÛ 
.
ÛÛ 
	anchorMin
ÛÛ #
=
ÛÛ$ %
new
ÛÛ& )
Vector2
ÛÛ* 1
(
ÛÛ1 2
$num
ÛÛ2 3
,
ÛÛ3 4
$num
ÛÛ5 6
)
ÛÛ6 7
;
ÛÛ7 8
rectTransform
ÙÙ 
.
ÙÙ 
	anchorMax
ÙÙ #
=
ÙÙ$ %
new
ÙÙ& )
Vector2
ÙÙ* 1
(
ÙÙ1 2
$num
ÙÙ2 3
,
ÙÙ3 4
$num
ÙÙ5 6
)
ÙÙ6 7
;
ÙÙ7 8
rectTransform
ıı 
.
ıı 
pivot
ıı 
=
ıı  !
new
ıı" %
Vector2
ıı& -
(
ıı- .
$num
ıı. /
,
ıı/ 0
$num
ıı1 2
)
ıı2 3
;
ıı3 4
rectTransform
¯¯ 
.
¯¯ 
	sizeDelta
¯¯ #
=
¯¯$ %
new
¯¯& )
Vector2
¯¯* 1
(
¯¯1 2
width
¯¯2 7
,
¯¯7 8
height
¯¯9 ?
)
¯¯? @
;
¯¯@ A
}
˘˘ 	
public
˝˝ 
void
˝˝ 
OnDrawGizmos
˝˝  
(
˝˝  !
)
˝˝! "
{
˛˛ 	
Gizmos
ˇˇ 
.
ˇˇ 
color
ˇˇ 
=
ˇˇ 
Color
ˇˇ  
.
ˇˇ  !
green
ˇˇ! &
;
ˇˇ& '
Gizmos
ÄÄ 
.
ÄÄ 
DrawLine
ÄÄ 
(
ÄÄ #
_recyclableViewBounds
ÄÄ 1
.
ÄÄ1 2
min
ÄÄ2 5
-
ÄÄ6 7
new
ÄÄ8 ;
Vector3
ÄÄ< C
(
ÄÄC D
$num
ÄÄD H
,
ÄÄH I
$num
ÄÄJ K
)
ÄÄK L
,
ÄÄL M#
_recyclableViewBounds
ÄÄN c
.
ÄÄc d
min
ÄÄd g
+
ÄÄh i
new
ÄÄj m
Vector3
ÄÄn u
(
ÄÄu v
$num
ÄÄv z
,
ÄÄz {
$num
ÄÄ| }
)
ÄÄ} ~
)
ÄÄ~ 
;ÄÄ Ä
Gizmos
ÅÅ 
.
ÅÅ 
color
ÅÅ 
=
ÅÅ 
Color
ÅÅ  
.
ÅÅ  !
red
ÅÅ! $
;
ÅÅ$ %
Gizmos
ÇÇ 
.
ÇÇ 
DrawLine
ÇÇ 
(
ÇÇ #
_recyclableViewBounds
ÇÇ 1
.
ÇÇ1 2
max
ÇÇ2 5
-
ÇÇ6 7
new
ÇÇ8 ;
Vector3
ÇÇ< C
(
ÇÇC D
$num
ÇÇD H
,
ÇÇH I
$num
ÇÇJ K
)
ÇÇK L
,
ÇÇL M#
_recyclableViewBounds
ÇÇN c
.
ÇÇc d
max
ÇÇd g
+
ÇÇh i
new
ÇÇj m
Vector3
ÇÇn u
(
ÇÇu v
$num
ÇÇv z
,
ÇÇz {
$num
ÇÇ| }
)
ÇÇ} ~
)
ÇÇ~ 
;ÇÇ Ä
}
ÉÉ 	
}
ÖÖ 
}ÜÜ 