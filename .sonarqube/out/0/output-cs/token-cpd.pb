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
}KK ‹V
rD:\GitHub-Projects\Recyclable-Scroll-Rect\Assets\Recyclable Scroll Rect\Main\Editor1\RecyclableScrollRectEditor.cs
	namespace 	
PolyAndCode
 
. 
UI 
{ 
[ 
CustomEditor 
( 
typeof 
(  
RecyclableScrollRect -
)- .
,. /
true0 4
)4 5
]5 6
[		 "
CanEditMultipleObjects		 
]		 
public 

class &
RecyclableScrollRectEditor +
:, -
Editor. 4
{ 
SerializedProperty 
	m_Content $
;$ %
SerializedProperty 
m_MovementType )
;) *
SerializedProperty 
m_Elasticity '
;' (
SerializedProperty 
	m_Inertia $
;$ %
SerializedProperty 
m_DecelerationRate -
;- .
SerializedProperty 
m_ScrollSensitivity .
;. /
SerializedProperty 

m_Viewport %
;% &
SerializedProperty 
m_OnValueChanged +
;+ ,
SerializedProperty 
_protoTypeCell )
;) *
SerializedProperty 
_selfInitialize *
;* +
SerializedProperty 

_direction %
;% &
SerializedProperty 
_type  
;  !
SerializedProperty 
	_segments $
;$ %
AnimBool   
m_ShowElasticity   !
;  ! "
AnimBool!! "
m_ShowDecelerationRate!! '
;!!' ( 
RecyclableScrollRect## 
_script## $
;##$ %
	protected$$ 
virtual$$ 
void$$ 
OnEnable$$ '
($$' (
)$$( )
{%% 	
_script&& 
=&& 
(&&  
RecyclableScrollRect&& +
)&&+ ,
target&&, 2
;&&2 3
	m_Content(( 
=(( 
serializedObject(( (
.((( )
FindProperty(() 5
(((5 6
$str((6 A
)((A B
;((B C
m_MovementType)) 
=)) 
serializedObject)) -
.))- .
FindProperty)). :
()): ;
$str)); K
)))K L
;))L M
m_Elasticity** 
=** 
serializedObject** +
.**+ ,
FindProperty**, 8
(**8 9
$str**9 G
)**G H
;**H I
	m_Inertia++ 
=++ 
serializedObject++ (
.++( )
FindProperty++) 5
(++5 6
$str++6 A
)++A B
;++B C
m_DecelerationRate,, 
=,,  
serializedObject,,! 1
.,,1 2
FindProperty,,2 >
(,,> ?
$str,,? S
),,S T
;,,T U
m_ScrollSensitivity-- 
=--  !
serializedObject--" 2
.--2 3
FindProperty--3 ?
(--? @
$str--@ U
)--U V
;--V W

m_Viewport.. 
=.. 
serializedObject.. )
...) *
FindProperty..* 6
(..6 7
$str..7 C
)..C D
;..D E
m_OnValueChanged// 
=// 
serializedObject// /
./// 0
FindProperty//0 <
(//< =
$str//= O
)//O P
;//P Q
_protoTypeCell22 
=22 
serializedObject22 -
.22- .
FindProperty22. :
(22: ;
$str22; J
)22J K
;22K L
_selfInitialize33 
=33 
serializedObject33 .
.33. /
FindProperty33/ ;
(33; <
$str33< L
)33L M
;33M N

_direction44 
=44 
serializedObject44 )
.44) *
FindProperty44* 6
(446 7
$str447 B
)44B C
;44C D
_type55 
=55 
serializedObject55 $
.55$ %
FindProperty55% 1
(551 2
$str552 8
)558 9
;559 :
	_segments66 
=66 
serializedObject66 (
.66( )
FindProperty66) 5
(665 6
$str666 A
)66A B
;66B C
m_ShowElasticity88 
=88 
new88 "
AnimBool88# +
(88+ ,
Repaint88, 3
)883 4
;884 5"
m_ShowDecelerationRate99 "
=99# $
new99% (
AnimBool99) 1
(991 2
Repaint992 9
)999 :
;99: ;
SetAnimBools:: 
(:: 
true:: 
):: 
;:: 
};; 	
	protected== 
virtual== 
void== 
	OnDisable== (
(==( )
)==) *
{>> 	
m_ShowElasticity?? 
.?? 
valueChanged?? )
.??) *
RemoveListener??* 8
(??8 9
Repaint??9 @
)??@ A
;??A B"
m_ShowDecelerationRate@@ "
.@@" #
valueChanged@@# /
.@@/ 0
RemoveListener@@0 >
(@@> ?
Repaint@@? F
)@@F G
;@@G H
}AA 	
voidCC 
SetAnimBoolsCC 
(CC 
boolCC 
instantCC &
)CC& '
{DD 	
SetAnimBoolEE 
(EE 
m_ShowElasticityEE (
,EE( )
!EE* +
m_MovementTypeEE+ 9
.EE9 :&
hasMultipleDifferentValuesEE: T
&&EEU W
m_MovementTypeEEX f
.EEf g
enumValueIndexEEg u
==EEv x
(EEy z
intEEz }
)EE} ~

ScrollRect	EE~ à
.
EEà â
MovementType
EEâ ï
.
EEï ñ
Elastic
EEñ ù
,
EEù û
instant
EEü ¶
)
EE¶ ß
;
EEß ®
SetAnimBoolFF 
(FF "
m_ShowDecelerationRateFF .
,FF. /
!FF0 1
	m_InertiaFF1 :
.FF: ;&
hasMultipleDifferentValuesFF; U
&&FFV X
	m_InertiaFFY b
.FFb c
	boolValueFFc l
==FFm o
trueFFp t
,FFt u
instantFFv }
)FF} ~
;FF~ 
}GG 	
voidII 
SetAnimBoolII 
(II 
AnimBoolII !
aII" #
,II# $
boolII% )
valueII* /
,II/ 0
boolII1 5
instantII6 =
)II= >
{JJ 	
ifKK 
(KK 
instantKK 
)KK 
aLL 
.LL 
valueLL 
=LL 
valueLL 
;LL  
elseMM 
aNN 
.NN 
targetNN 
=NN 
valueNN  
;NN  !
}OO 	
publicQQ 
overrideQQ 
voidQQ 
OnInspectorGUIQQ +
(QQ+ ,
)QQ, -
{RR 	
SetAnimBoolsSS 
(SS 
falseSS 
)SS 
;SS  
serializedObjectTT 
.TT 
UpdateTT #
(TT# $
)TT$ %
;TT% &
EditorGUILayoutWW 
.WW 
PropertyFieldWW )
(WW) *

_directionWW* 4
)WW4 5
;WW5 6
EditorGUILayoutXX 
.XX 
PropertyFieldXX )
(XX) *
_typeXX* /
)XX/ 0
;XX0 1
ifYY 
(YY 
_typeYY 
.YY 
	boolValueYY 
)YY  
{ZZ 
string\\ 
title\\ 
=\\ 

_direction\\ )
.\\) *
enumValueIndex\\* 8
==\\9 ;
(\\< =
int\\= @
)\\@ A 
RecyclableScrollRect\\A U
.\\U V
DirectionType\\V c
.\\c d
Vertical\\d l
?\\m n
$str\\o y
:\\z {
$str	\\| Ç
;
\\Ç É
_script]] 
.]] 
Segments]] 
=]]  !
EditorGUILayout]]# 2
.]]2 3
IntField]]3 ;
(]]; <
title]]< A
,]]A B
_script]]C J
.]]J K
Segments]]K S
)]]S T
;]]T U
}^^ 
EditorGUILayout`` 
.`` 
PropertyField`` )
(``) *
_selfInitialize``* 9
)``9 :
;``: ;
EditorGUILayoutaa 
.aa 
PropertyFieldaa )
(aa) *

m_Viewportaa* 4
)aa4 5
;aa5 6
EditorGUILayoutbb 
.bb 
PropertyFieldbb )
(bb) *
	m_Contentbb* 3
)bb3 4
;bb4 5
EditorGUILayoutcc 
.cc 
PropertyFieldcc )
(cc) *
_protoTypeCellcc* 8
)cc8 9
;cc9 :
EditorGUILayoutdd 
.dd 
Spacedd !
(dd! "
)dd" #
;dd# $
EditorGUILayoutff 
.ff 
PropertyFieldff )
(ff) *
m_MovementTypeff* 8
)ff8 9
;ff9 :
ifgg 
(gg 
EditorGUILayoutgg 
.gg  
BeginFadeGroupgg  .
(gg. /
m_ShowElasticitygg/ ?
.gg? @
fadedgg@ E
)ggE F
)ggF G
{hh 
	EditorGUIii 
.ii 
indentLevelii %
++ii% '
;ii' (
EditorGUILayoutjj 
.jj  
PropertyFieldjj  -
(jj- .
m_Elasticityjj. :
)jj: ;
;jj; <
	EditorGUIkk 
.kk 
indentLevelkk %
--kk% '
;kk' (
}ll 
EditorGUILayoutmm 
.mm 
EndFadeGroupmm (
(mm( )
)mm) *
;mm* +
EditorGUILayoutoo 
.oo 
PropertyFieldoo )
(oo) *
	m_Inertiaoo* 3
)oo3 4
;oo4 5
ifpp 
(pp 
EditorGUILayoutpp 
.pp  
BeginFadeGrouppp  .
(pp. /"
m_ShowDecelerationRatepp/ E
.ppE F
fadedppF K
)ppK L
)ppL M
{qq 
	EditorGUIrr 
.rr 
indentLevelrr %
++rr% '
;rr' (
EditorGUILayoutss 
.ss  
PropertyFieldss  -
(ss- .
m_DecelerationRatess. @
)ss@ A
;ssA B
	EditorGUItt 
.tt 
indentLeveltt %
--tt% '
;tt' (
}uu 
EditorGUILayoutvv 
.vv 
EndFadeGroupvv (
(vv( )
)vv) *
;vv* +
EditorGUILayoutxx 
.xx 
PropertyFieldxx )
(xx) *
m_ScrollSensitivityxx* =
)xx= >
;xx> ?
EditorGUILayoutzz 
.zz 
Spacezz !
(zz! "
)zz" #
;zz# $
EditorGUILayout|| 
.|| 
PropertyField|| )
(||) *
m_OnValueChanged||* :
)||: ;
;||; <
serializedObject~~ 
.~~ #
ApplyModifiedProperties~~ 4
(~~4 5
)~~5 6
;~~6 7
} 	
}
ÄÄ 
}ÅÅ ≠
vD:\GitHub-Projects\Recyclable-Scroll-Rect\Assets\Recyclable Scroll Rect\Main\Editor1\RecyclableScrollViewEditorTool.cs
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
|| 
selected %
.% &
	transform& /
./ 0
GetType0 7
(7 8
)8 9
!=: <
typeof= C
(C D
RectTransformD Q
)Q R
)R S
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
= 
UnityEngine )
.) *
Object* 0
.0 1
Instantiate1 <
(< =
asset= B
)B C
asD F

GameObjectG Q
;Q R
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
}## áà
qD:\GitHub-Projects\Recyclable-Scroll-Rect\Assets\Recyclable Scroll Rect\Main\Scripts\HorizontalRecyclingSystem.cs
	namespace

 	
PolyAndCode


 
.

 
UI

 
{

 
public 

class %
HorizontalRecyclingSystem *
:+ ,
RecyclingSystem- <
{ 
private 
int 
_rows 
; 
private 
float 

_cellWidth  
,  !
_cellHeight" -
;- .
private 
int 
_leftMostCellRow $
,$ %
_RightMostCellRow& 7
,7 8
_currentRow9 D
;D E
private 
bool !
_contentSizeIncreased *
;* +
private +
IRecyclableScrollRectDataSource /
_dataSource0 ;
;; <
private 
List 
< 
RectTransform "
>" #
	_cellPool$ -
;- .
private 
List 
< 
ICell 
> 
_cachedCells (
;( )
private 
RectTransform 
_listContainer ,
;, -
private 
Bounds !
_recyclableViewBounds ,
;, -
private 
float 
_recyclingThreshold )
=* +
$num, /
;/ 0
private!! 
Vector3!! 
[!! 
]!! 
_corners!! "
=!!# $
new!!% (
Vector3!!) 0
[!!0 1
$num!!1 2
]!!2 3
;!!3 4
private"" 
bool"" 

_recycling"" 
;""  
private%% 
int%% 
leftMostCellIndex%% %
,%%% &
rightMostCellIndex%%' 9
;%%9 :
private&& 
int&& 
currentItemCount&& $
;&&$ %
public)) %
HorizontalRecyclingSystem)) (
())( )
RectTransform))) 6
prototypeCell))7 D
,))D E
RectTransform))F S
viewport))T \
,))\ ]
RectTransform))^ k
content))l s
,))s t,
IRecyclableScrollRectDataSource	))u î

dataSource
))ï ü
,
))ü †
bool
))° •
isGrid
))¶ ¨
,
))¨ ≠
int
))Æ ±
rows
))≤ ∂
)
))∂ ∑
{** 	
PrototypeCell++ 
=++ 
prototypeCell++ )
;++) *
Viewport,, 
=,, 
viewport,, 
;,,  
Content-- 
=-- 
content-- 
;-- 
_dataSource.. 
=.. 

dataSource.. $
;..$ %
IsGrid// 
=// 
isGrid// 
;// 
_rows00 
=00 
isGrid00 
?00 
rows00 !
:00" #
$num00$ %
;00% &
}11 	
public33 
override33 
IEnumerator33 #
InitCoroutine33$ 1
(331 2
Action332 8
onInitialized339 F
)33F G
{44 	
	SetAnchor66 
(66 
Content66 
)66 
;66 
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
leftMostCellIndex== 
=== 
$num==  !
;==! "
rightMostCellIndex>> 
=>>  
	_cellPool>>! *
.>>* +
Count>>+ 0
->>1 2
$num>>3 4
;>>4 5
int@@ 
coloums@@ 
=@@ 
(@@ 
int@@ 
)@@ 
Mathf@@ $
.@@$ %
Ceil@@% )
(@@) *
(@@* +
float@@+ 0
)@@0 1
	_cellPool@@1 :
.@@: ;
Count@@; @
/@@A B
(@@C D
float@@D I
)@@I J
_rows@@J O
)@@O P
;@@P Q
floatCC 
contentXSizeCC 
=CC  
coloumsCC! (
*CC( )
PrototypeCellCC* 7
.CC7 8
	sizeDeltaCC8 A
.CCA B
xCCB C
;CCC D
ContentDD 
.DD 
	sizeDeltaDD 
=DD 
newDD  #
Vector2DD$ +
(DD+ ,
contentXSizeDD, 8
,DD8 9
ContentDD: A
.DDA B
	sizeDeltaDDB K
.DDK L
yDDL M
)DDM N
;DDN O
currentItemCountEE 
=EE 
	_cellPoolEE (
.EE( )
CountEE) .
;EE. /
	SetAnchorFF 
(FF 
ContentFF 
)FF 
;FF 
onInitializedGG 
(GG 
)GG 
;GG 
}HH 	
privateNN 
voidNN 
SetRecyclingBoundsNN '
(NN' (
)NN( )
{OO 	
ViewportPP 
.PP 
GetWorldCornersPP $
(PP$ %
_cornersPP% -
)PP- .
;PP. /
floatQQ 

threshHoldQQ 
=QQ 
_recyclingThresholdQQ 2
*QQ3 4
(QQ5 6
_cornersQQ6 >
[QQ> ?
$numQQ? @
]QQ@ A
.QQA B
xQQB C
-QQD E
_cornersQQF N
[QQN O
$numQQO P
]QQP Q
.QQQ R
xQQR S
)QQS T
;QQT U!
_recyclableViewBoundsRR !
.RR! "
minRR" %
=RR& '
newRR( +
Vector3RR, 3
(RR3 4
_cornersRR4 <
[RR< =
$numRR= >
]RR> ?
.RR? @
xRR@ A
-RRB C

threshHoldRRD N
,RRN O
_cornersRRP X
[RRX Y
$numRRY Z
]RRZ [
.RR[ \
yRR\ ]
)RR] ^
;RR^ _!
_recyclableViewBoundsSS !
.SS! "
maxSS" %
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
+SSB C

threshHoldSSD N
,SSN O
_cornersSSP X
[SSX Y
$numSSY Z
]SSZ [
.SS[ \
ySS\ ]
)SS] ^
;SS^ _
}TT 	
privateYY 
voidYY 
CreateCellPoolYY #
(YY# $
)YY$ %
{ZZ 	
if\\ 
(\\ 
	_cellPool\\ 
!=\\ 
null\\ !
)\\! "
{]] 
	_cellPool^^ 
.^^ 
ForEach^^ !
(^^! "
(^^" #
RectTransform^^# 0
item^^1 5
)^^5 6
=>^^7 9
UnityEngine^^: E
.^^E F
Object^^F L
.^^L M
Destroy^^M T
(^^T U
item^^U Y
.^^Y Z

gameObject^^Z d
)^^d e
)^^e f
;^^f g
	_cellPool__ 
.__ 
Clear__ 
(__  
)__  !
;__! "
_cachedCells`` 
.`` 
Clear`` "
(``" #
)``# $
;``$ %
}aa 
elsebb 
{cc 
_cachedCellsdd 
=dd 
newdd "
Listdd# '
<dd' (
ICelldd( -
>dd- .
(dd. /
)dd/ 0
;dd0 1
	_cellPoolee 
=ee 
newee 
Listee  $
<ee$ %
RectTransformee% 2
>ee2 3
(ee3 4
)ee4 5
;ee5 6
}ff 
PrototypeCellii 
.ii 

gameObjectii $
.ii$ %
	SetActiveii% .
(ii. /
trueii/ 3
)ii3 4
;ii4 5
	SetAnchorjj 
(jj 
PrototypeCelljj #
)jj# $
;jj$ %
floatmm 
currentPoolCoveragemm %
=mm& '
$nummm( )
;mm) *
intnn 
poolSizenn 
=nn 
$numnn 
;nn 
floatoo 
posXoo 
=oo 
$numoo 
;oo 
floatpp 
posYpp 
=pp 
$numpp 
;pp 
_cellHeightss 
=ss 
Contentss !
.ss! "
rectss" &
.ss& '
heightss' -
/ss. /
_rowsss0 5
;ss5 6

_cellWidthtt 
=tt 
PrototypeCelltt &
.tt& '
	sizeDeltatt' 0
.tt0 1
xtt1 2
/tt3 4
PrototypeCelltt5 B
.ttB C
	sizeDeltattC L
.ttL M
yttM N
*ttO P
_cellHeightttQ \
;tt\ ]
PrototypeCelluu 
.uu 
	sizeDeltauu #
=uu$ %
newuu& )
Vector3uu* 1
(uu1 2

_cellWidthuu2 <
,uu< =
_cellHeightuu> I
)uuI J
;uuJ K
_currentRowvv 
=vv 
_leftMostCellRowvv *
=vv+ ,
$numvv- .
;vv. /
floatzz 
requriedCoveragezz "
=zz# $
MinPoolCoveragezz% 4
*zz5 6
Viewportzz7 ?
.zz? @
rectzz@ D
.zzD E
widthzzE J
;zzJ K
int|| 
minPoolSize|| 
=|| 
Math|| "
.||" #
Min||# &
(||& '
MinPoolSize||' 2
,||2 3
_dataSource||4 ?
.||? @
GetItemCount||@ L
(||L M
)||M N
)||N O
;||O P
while~~ 
(~~ 
(~~ 
poolSize~~ 
<~~ 
minPoolSize~~ *
||~~+ -
currentPoolCoverage~~. A
<~~B C
requriedCoverage~~D T
)~~T U
&&~~V X
poolSize~~Y a
<~~b c
_dataSource~~d o
.~~o p
GetItemCount~~p |
(~~| }
)~~} ~
)~~~ 
{ 
RectTransform
ÅÅ 
item
ÅÅ "
=
ÅÅ# $
(
ÅÅ% &
UnityEngine
ÅÅ& 1
.
ÅÅ1 2
Object
ÅÅ2 8
.
ÅÅ8 9
Instantiate
ÅÅ9 D
(
ÅÅD E
PrototypeCell
ÅÅE R
.
ÅÅR S

gameObject
ÅÅS ]
)
ÅÅ] ^
as
ÅÅ_ a

GameObject
ÅÅb l
)
ÅÅl m
.
ÅÅm n
GetComponent
ÅÅn z
<
ÅÅz {
RectTransformÅÅ{ à
>ÅÅà â
(ÅÅâ ä
)ÅÅä ã
;ÅÅã å
item
ÇÇ 
.
ÇÇ 
name
ÇÇ 
=
ÇÇ 
$str
ÇÇ "
;
ÇÇ" #
	_cellPool
ÉÉ 
.
ÉÉ 
Add
ÉÉ 
(
ÉÉ 
item
ÉÉ "
)
ÉÉ" #
;
ÉÉ# $
item
ÑÑ 
.
ÑÑ 
	SetParent
ÑÑ 
(
ÑÑ 
Content
ÑÑ &
,
ÑÑ& '
false
ÑÑ( -
)
ÑÑ- .
;
ÑÑ. /
if
ÜÜ 
(
ÜÜ 
IsGrid
ÜÜ 
)
ÜÜ 
{
áá 
item
àà 
.
àà 
anchoredPosition
àà )
=
àà* +
new
àà, /
Vector2
àà0 7
(
àà7 8
posX
àà8 <
,
àà< =
posY
àà> B
)
ààB C
;
ààC D
_currentRow
ââ 
++
ââ !
;
ââ! "
posY
ää 
=
ää 
_currentRow
ää &
>=
ää' )
_rows
ää* /
?
ää0 1
$num
ää2 3
:
ää4 5
posY
ää6 :
-
ää; <
_cellHeight
ää= H
;
ääH I
posX
ãã 
=
ãã 
_currentRow
ãã &
>=
ãã' )
_rows
ãã* /
?
ãã0 1
posX
ãã2 6
+
ãã7 8

_cellWidth
ãã9 C
:
ããD E
posX
ããF J
;
ããJ K
if
åå 
(
åå 
_currentRow
åå #
>=
åå$ &
_rows
åå' ,
)
åå, -
{
çç 
_currentRow
éé #
=
éé$ %
$num
éé& '
;
éé' (!
currentPoolCoverage
èè +
+=
èè, .
item
èè/ 3
.
èè3 4
rect
èè4 8
.
èè8 9
width
èè9 >
;
èè> ?
}
êê 
}
ëë 
else
íí 
{
íí 
item
îî 
.
îî 
anchoredPosition
îî )
=
îî* +
new
îî, /
Vector2
îî0 7
(
îî7 8
posX
îî8 <
,
îî< =
$num
îî> ?
)
îî? @
;
îî@ A
posX
ïï 
=
ïï 
item
ïï 
.
ïï  
anchoredPosition
ïï  0
.
ïï0 1
x
ïï1 2
+
ïï3 4
item
ïï5 9
.
ïï9 :
rect
ïï: >
.
ïï> ?
width
ïï? D
;
ïïD E!
currentPoolCoverage
ññ '
+=
ññ( *
item
ññ+ /
.
ññ/ 0
rect
ññ0 4
.
ññ4 5
width
ññ5 :
;
ññ: ;
}
óó 
_cachedCells
õõ 
.
õõ 
Add
õõ  
(
õõ  !
item
õõ! %
.
õõ% &
GetComponent
õõ& 2
<
õõ2 3
ICell
õõ3 8
>
õõ8 9
(
õõ9 :
)
õõ: ;
)
õõ; <
;
õõ< =
_dataSource
úú 
.
úú 
SetCell
úú #
(
úú# $
_cachedCells
úú$ 0
[
úú0 1
_cachedCells
úú1 =
.
úú= >
Count
úú> C
-
úúD E
$num
úúF G
]
úúG H
,
úúH I
poolSize
úúJ R
)
úúR S
;
úúS T
poolSize
üü 
++
üü 
;
üü 
}
†† 
_leftMostCellRow
¢¢ 
=
¢¢ 
$num
¢¢  
;
¢¢  !
_RightMostCellRow
££ 
=
££ 
(
££  !
_currentRow
££! ,
-
££- .
$num
££/ 0
+
££1 2
_rows
££3 8
)
££8 9
%
££: ;
_rows
££< A
;
££A B
if
¶¶ 
(
¶¶ 
PrototypeCell
¶¶ 
.
¶¶ 

gameObject
¶¶ (
.
¶¶( )
scene
¶¶) .
.
¶¶. /
IsValid
¶¶/ 6
(
¶¶6 7
)
¶¶7 8
)
¶¶8 9
{
ßß 
PrototypeCell
®® 
.
®® 

gameObject
®® (
.
®®( )
	SetActive
®®) 2
(
®®2 3
false
®®3 8
)
®®8 9
;
®®9 :
}
©© 
}
™™ 	
Vector2
¨¨ 

zeroVector
¨¨ 
=
¨¨ 
Vector2
¨¨ $
.
¨¨$ %
zero
¨¨% )
;
¨¨) *
public
≠≠ 
override
≠≠ 
Vector2
≠≠ $
OnValueChangedListener
≠≠  6
(
≠≠6 7
Vector2
≠≠7 >
args
≠≠? C
)
≠≠C D
{
ÆÆ 	
if
ØØ 
(
ØØ 

_recycling
ØØ 
||
ØØ 
	_cellPool
ØØ '
==
ØØ( *
null
ØØ+ /
||
ØØ0 2
	_cellPool
ØØ3 <
.
ØØ< =
Count
ØØ= B
==
ØØC E
$num
ØØF G
)
ØØG H
return
ØØI O

zeroVector
ØØP Z
;
ØØZ [ 
SetRecyclingBounds
≤≤ 
(
≤≤ 
)
≤≤  
;
≤≤  !
if
¥¥ 
(
¥¥ 
	_cellPool
¥¥ 
[
¥¥  
rightMostCellIndex
¥¥ ,
]
¥¥, -
.
¥¥- .
MinX
¥¥. 2
(
¥¥2 3
)
¥¥3 4
<
¥¥5 6#
_recyclableViewBounds
¥¥7 L
.
¥¥L M
max
¥¥M P
.
¥¥P Q
x
¥¥Q R
)
¥¥R S
{
µµ 
return
∑∑  
RecycleLeftToRight
∑∑ (
(
∑∑( )
)
∑∑) *
;
∑∑* +
}
∏∏ 
else
ππ 
if
ππ 
(
ππ 
	_cellPool
ππ 
[
ππ 
leftMostCellIndex
ππ 0
]
ππ0 1
.
ππ1 2
MaxX
ππ2 6
(
ππ6 7
)
ππ7 8
>
ππ9 :#
_recyclableViewBounds
ππ; P
.
ππP Q
min
ππQ T
.
ππT U
x
ππU V
)
ππV W
{
∫∫ 
return
ºº  
RecycleRightToleft
ºº (
(
ºº( )
)
ºº) *
;
ºº* +
}
ΩΩ 
return
øø 

zeroVector
øø 
;
øø 
}
¿¿ 	
private
≈≈ 
Vector2
≈≈  
RecycleLeftToRight
≈≈ *
(
≈≈* +
)
≈≈+ ,
{
∆∆ 	

_recycling
«« 
=
«« 
true
«« 
;
«« 
int
…… 
n
…… 
=
…… 
$num
…… 
;
…… 
float
   
posX
   
=
   
$num
   
;
   
float
ÀÀ 
posY
ÀÀ 
=
ÀÀ 
$num
ÀÀ 
;
ÀÀ 
if
ÕÕ 
(
ÕÕ 
IsGrid
ÕÕ 
)
ÕÕ 
{
ŒŒ 
posX
œœ 
=
œœ 
	_cellPool
œœ  
[
œœ  ! 
rightMostCellIndex
œœ! 3
]
œœ3 4
.
œœ4 5
anchoredPosition
œœ5 E
.
œœE F
x
œœF G
;
œœG H
if
—— 
(
—— 
_RightMostCellRow
—— %
==
——& (
_rows
——) .
-
——/ 0
$num
——1 2
)
——2 3
{
““ 
posX
”” 
+=
”” 

_cellWidth
”” &
;
””& '
}
‘‘ 
_currentRow
÷÷ 
=
÷÷ 
_RightMostCellRow
÷÷ /
;
÷÷/ 0
}
◊◊ 
while
ŸŸ 
(
ŸŸ 
	_cellPool
ŸŸ 
[
ŸŸ 
leftMostCellIndex
ŸŸ .
]
ŸŸ. /
.
ŸŸ/ 0
MaxX
ŸŸ0 4
(
ŸŸ4 5
)
ŸŸ5 6
<
ŸŸ7 8#
_recyclableViewBounds
ŸŸ9 N
.
ŸŸN O
min
ŸŸO R
.
ŸŸR S
x
ŸŸS T
&&
ŸŸU W
currentItemCount
ŸŸX h
<
ŸŸi j
_dataSource
ŸŸk v
.
ŸŸv w
GetItemCountŸŸw É
(ŸŸÉ Ñ
)ŸŸÑ Ö
)ŸŸÖ Ü
{
⁄⁄ 
if
€€ 
(
€€ 
IsGrid
€€ 
)
€€ 
{
‹‹ 
_currentRow
›› 
++
›› !
;
››! "
if
ﬂﬂ 
(
ﬂﬂ 
_currentRow
ﬂﬂ "
>=
ﬂﬂ# %
_rows
ﬂﬂ& +
)
ﬂﬂ+ ,
{
‡‡ 
n
·· 
++
·· 
;
·· 
_currentRow
‚‚ #
=
‚‚$ %
$num
‚‚& '
;
‚‚' (
}
„„ 
posY
‰‰ 
=
‰‰ 
-
‰‰ 
_currentRow
‰‰ '
*
‰‰( )
_cellHeight
‰‰* 5
;
‰‰5 6
if
ÊÊ 
(
ÊÊ 
_currentRow
ÊÊ #
==
ÊÊ$ &
$num
ÊÊ' (
)
ÊÊ( )
{
ÁÁ 
posX
ÈÈ 
=
ÈÈ 
	_cellPool
ÈÈ (
[
ÈÈ( ) 
rightMostCellIndex
ÈÈ) ;
]
ÈÈ; <
.
ÈÈ< =
anchoredPosition
ÈÈ= M
.
ÈÈM N
x
ÈÈN O
+
ÈÈP Q

_cellWidth
ÈÈR \
;
ÈÈ\ ]
}
ÍÍ 
	_cellPool
ÏÏ 
[
ÏÏ 
leftMostCellIndex
ÏÏ /
]
ÏÏ/ 0
.
ÏÏ0 1
anchoredPosition
ÏÏ1 A
=
ÏÏB C
new
ÏÏD G
Vector2
ÏÏH O
(
ÏÏO P
posX
ÏÏP T
,
ÏÏT U
posY
ÏÏV Z
)
ÏÏZ [
;
ÏÏ[ \
_leftMostCellRow
ÓÓ $
=
ÓÓ% &
(
ÓÓ' (
_leftMostCellRow
ÓÓ( 8
+
ÓÓ9 :
$num
ÓÓ; <
)
ÓÓ< =
%
ÓÓ> ?
_rows
ÓÓ@ E
;
ÓÓE F
}
 
else
ÒÒ 
{
ÒÒ 
posX
ÚÚ 
=
ÚÚ 
	_cellPool
ÚÚ $
[
ÚÚ$ % 
rightMostCellIndex
ÚÚ% 7
]
ÚÚ7 8
.
ÚÚ8 9
anchoredPosition
ÚÚ9 I
.
ÚÚI J
x
ÚÚJ K
+
ÚÚL M
	_cellPool
ÚÚN W
[
ÚÚW X 
rightMostCellIndex
ÚÚX j
]
ÚÚj k
.
ÚÚk l
	sizeDelta
ÚÚl u
.
ÚÚu v
x
ÚÚv w
;
ÚÚw x
	_cellPool
ÛÛ 
[
ÛÛ 
leftMostCellIndex
ÛÛ /
]
ÛÛ/ 0
.
ÛÛ0 1
anchoredPosition
ÛÛ1 A
=
ÛÛB C
new
ÛÛD G
Vector2
ÛÛH O
(
ÛÛO P
posX
ÛÛP T
,
ÛÛT U
	_cellPool
ÛÛV _
[
ÛÛ_ `
leftMostCellIndex
ÛÛ` q
]
ÛÛq r
.
ÛÛr s
anchoredPositionÛÛs É
.ÛÛÉ Ñ
yÛÛÑ Ö
)ÛÛÖ Ü
;ÛÛÜ á
}
ÙÙ 
_dataSource
˜˜ 
.
˜˜ 
SetCell
˜˜ #
(
˜˜# $
_cachedCells
˜˜$ 0
[
˜˜0 1
leftMostCellIndex
˜˜1 B
]
˜˜B C
,
˜˜C D
currentItemCount
˜˜E U
)
˜˜U V
;
˜˜V W 
rightMostCellIndex
˙˙ "
=
˙˙# $
leftMostCellIndex
˙˙% 6
;
˙˙6 7
leftMostCellIndex
˚˚ !
=
˚˚" #
(
˚˚$ %
leftMostCellIndex
˚˚% 6
+
˚˚7 8
$num
˚˚9 :
)
˚˚: ;
%
˚˚< =
	_cellPool
˚˚> G
.
˚˚G H
Count
˚˚H M
;
˚˚M N
currentItemCount
˝˝  
++
˝˝  "
;
˝˝" #
if
˛˛ 
(
˛˛ 
!
˛˛ 
IsGrid
˛˛ 
)
˛˛ 
n
˛˛ 
++
˛˛  
;
˛˛  !
}
ˇˇ 
if
ÇÇ 
(
ÇÇ 
IsGrid
ÇÇ 
)
ÇÇ 
{
ÉÉ 
_RightMostCellRow
ÑÑ !
=
ÑÑ" #
_currentRow
ÑÑ$ /
;
ÑÑ/ 0
if
áá 
(
áá 
!
áá #
_contentSizeIncreased
áá *
)
áá* +
{
àà 
if
ää 
(
ää 
_currentRow
ää #
!=
ää$ &
_rows
ää' ,
-
ää- .
$num
ää/ 0
)
ää0 1
{
ãã 
Content
çç 
.
çç  
	sizeDelta
çç  )
+=
çç* ,
Vector2
çç- 4
.
çç4 5
right
çç5 :
*
çç; <

_cellWidth
çç= G
;
ççG H
n
éé 
-=
éé 
$num
éé 
;
éé #
_contentSizeIncreased
èè -
=
èè. /
true
èè0 4
;
èè4 5
}
êê 
}
ëë 
else
íí 
{
ìì 
if
ïï 
(
ïï 
_currentRow
ïï #
==
ïï$ &
_rows
ïï' ,
-
ïï- .
$num
ïï/ 0
)
ïï0 1
{
ññ 
Content
óó 
.
óó  
	sizeDelta
óó  )
-=
óó* ,
Vector2
óó- 4
.
óó4 5
right
óó5 :
*
óó; <

_cellWidth
óó= G
;
óóG H#
_contentSizeIncreased
òò -
=
òò. /
false
òò0 5
;
òò5 6
}
ôô 
}
öö 
}
úú 
	_cellPool
†† 
.
†† 
ForEach
†† 
(
†† 
(
†† 
RectTransform
†† ,
cell
††- 1
)
††1 2
=>
††3 5
cell
††6 :
.
††: ;
anchoredPosition
††; K
-=
††L N
n
††O P
*
††Q R
Vector2
††S Z
.
††Z [
right
††[ `
*
††a b
	_cellPool
††c l
[
††l m
leftMostCellIndex
††m ~
]
††~ 
.†† Ä
	sizeDelta††Ä â
.††â ä
x††ä ã
)††ã å
;††å ç
Content
°° 
.
°° 
anchoredPosition
°° $
+=
°°% '
n
°°( )
*
°°* +
Vector2
°°, 3
.
°°3 4
right
°°4 9
*
°°: ;
	_cellPool
°°< E
[
°°E F
leftMostCellIndex
°°F W
]
°°W X
.
°°X Y
	sizeDelta
°°Y b
.
°°b c
x
°°c d
;
°°d e

_recycling
¢¢ 
=
¢¢ 
false
¢¢ 
;
¢¢ 
return
££ 
n
££ 
*
££ 
Vector2
££ 
.
££  
right
££  %
*
££& '
	_cellPool
££( 1
[
££1 2
leftMostCellIndex
££2 C
]
££C D
.
££D E
	sizeDelta
££E N
.
££N O
x
££O P
;
££P Q
}
√√ 	
private
»» 
Vector2
»»  
RecycleRightToleft
»» *
(
»»* +
)
»»+ ,
{
…… 	

_recycling
   
=
   
true
   
;
   
int
ÃÃ 
n
ÃÃ 
=
ÃÃ 
$num
ÃÃ 
;
ÃÃ 
float
ÕÕ 
posX
ÕÕ 
=
ÕÕ 
$num
ÕÕ 
;
ÕÕ 
float
œœ 
posY
œœ 
=
œœ 
$num
œœ 
;
œœ 
if
—— 
(
—— 
IsGrid
—— 
)
—— 
{
““ 
float
”” 
_posX
”” 
=
”” 
	_cellPool
”” '
[
””' (
leftMostCellIndex
””( 9
]
””9 :
.
””: ;
anchoredPosition
””; K
.
””K L
x
””L M
-
””N O

_cellWidth
””P Z
;
””Z [
if
’’ 
(
’’ 
_leftMostCellRow
’’ $
==
’’% '
$num
’’( )
)
’’) *
{
÷÷ 
_posX
◊◊ 
-=
◊◊ 

_cellWidth
◊◊ '
;
◊◊' (
}
ÿÿ 
_currentRow
⁄⁄ 
=
⁄⁄ 
_leftMostCellRow
⁄⁄ .
;
⁄⁄. /
}
€€ 
while
‹‹ 
(
‹‹ 
	_cellPool
‹‹ 
[
‹‹  
rightMostCellIndex
‹‹ /
]
‹‹/ 0
.
‹‹0 1
MinX
‹‹1 5
(
‹‹5 6
)
‹‹6 7
>
‹‹8 9#
_recyclableViewBounds
‹‹: O
.
‹‹O P
max
‹‹P S
.
‹‹S T
x
‹‹T U
&&
‹‹V X
currentItemCount
‹‹Y i
>
‹‹j k
	_cellPool
‹‹l u
.
‹‹u v
Count
‹‹v {
)
‹‹{ |
{
›› 
if
ﬁﬁ 
(
ﬁﬁ 
IsGrid
ﬁﬁ 
)
ﬁﬁ 
{
ﬂﬂ 
_currentRow
‡‡ 
--
‡‡  "
;
‡‡" #
if
‚‚ 
(
‚‚ 
_currentRow
‚‚ #
<
‚‚$ %
$num
‚‚& '
)
‚‚' (
{
„„ 
n
‰‰ 
++
‰‰ 
;
‰‰ 
_currentRow
ÂÂ #
=
ÂÂ$ %
_rows
ÂÂ& +
-
ÂÂ, -
$num
ÂÂ. /
;
ÂÂ/ 0
}
ÊÊ 
posY
ÁÁ 
=
ÁÁ 
-
ÁÁ 
_currentRow
ÁÁ '
*
ÁÁ( )
_cellHeight
ÁÁ* 5
;
ÁÁ5 6
if
ÈÈ 
(
ÈÈ 
_currentRow
ÈÈ #
==
ÈÈ$ &
_rows
ÈÈ' ,
-
ÈÈ- .
$num
ÈÈ/ 0
)
ÈÈ0 1
{
ÍÍ 
posX
ÏÏ 
=
ÏÏ 
	_cellPool
ÏÏ (
[
ÏÏ( )
leftMostCellIndex
ÏÏ) :
]
ÏÏ: ;
.
ÏÏ; <
anchoredPosition
ÏÏ< L
.
ÏÏL M
x
ÏÏM N
-
ÏÏO P

_cellWidth
ÏÏQ [
;
ÏÏ[ \
}
ÌÌ 
	_cellPool
ÔÔ 
[
ÔÔ  
rightMostCellIndex
ÔÔ 0
]
ÔÔ0 1
.
ÔÔ1 2
anchoredPosition
ÔÔ2 B
=
ÔÔC D
new
ÔÔE H
Vector2
ÔÔI P
(
ÔÔP Q
posX
ÔÔQ U
,
ÔÔU V
posY
ÔÔW [
)
ÔÔ[ \
;
ÔÔ\ ]
_leftMostCellRow
ÒÒ $
=
ÒÒ% &
(
ÒÒ' (
_leftMostCellRow
ÒÒ( 8
-
ÒÒ9 :
$num
ÒÒ; <
+
ÒÒ= >
_rows
ÒÒ? D
)
ÒÒD E
%
ÒÒF G
_rows
ÒÒH M
;
ÒÒM N
}
ÛÛ 
else
ÙÙ 
{
ıı 
posX
˜˜ 
=
˜˜ 
	_cellPool
˜˜ $
[
˜˜$ %
leftMostCellIndex
˜˜% 6
]
˜˜6 7
.
˜˜7 8
anchoredPosition
˜˜8 H
.
˜˜H I
x
˜˜I J
-
˜˜K L
	_cellPool
˜˜M V
[
˜˜V W
leftMostCellIndex
˜˜W h
]
˜˜h i
.
˜˜i j
	sizeDelta
˜˜j s
.
˜˜s t
x
˜˜t u
;
˜˜u v
	_cellPool
¯¯ 
[
¯¯  
rightMostCellIndex
¯¯ 0
]
¯¯0 1
.
¯¯1 2
anchoredPosition
¯¯2 B
=
¯¯C D
new
¯¯E H
Vector2
¯¯I P
(
¯¯P Q
posX
¯¯Q U
,
¯¯U V
	_cellPool
¯¯W `
[
¯¯` a 
rightMostCellIndex
¯¯a s
]
¯¯s t
.
¯¯t u
anchoredPosition¯¯u Ö
.¯¯Ö Ü
y¯¯Ü á
)¯¯á à
;¯¯à â
n
˘˘ 
++
˘˘ 
;
˘˘ 
}
˙˙ 
currentItemCount
¸¸  
--
¸¸  "
;
¸¸" #
_dataSource
˛˛ 
.
˛˛ 
SetCell
˛˛ #
(
˛˛# $
_cachedCells
˛˛$ 0
[
˛˛0 1 
rightMostCellIndex
˛˛1 C
]
˛˛C D
,
˛˛D E
currentItemCount
˛˛F V
-
˛˛W X
	_cellPool
˛˛Y b
.
˛˛b c
Count
˛˛c h
)
˛˛h i
;
˛˛i j
leftMostCellIndex
ÅÅ !
=
ÅÅ" # 
rightMostCellIndex
ÅÅ$ 6
;
ÅÅ6 7 
rightMostCellIndex
ÇÇ "
=
ÇÇ# $
(
ÇÇ% & 
rightMostCellIndex
ÇÇ& 8
-
ÇÇ9 :
$num
ÇÇ; <
+
ÇÇ= >
	_cellPool
ÇÇ? H
.
ÇÇH I
Count
ÇÇI N
)
ÇÇN O
%
ÇÇP Q
	_cellPool
ÇÇR [
.
ÇÇ[ \
Count
ÇÇ\ a
;
ÇÇa b
}
ÉÉ 
if
ÖÖ 
(
ÖÖ 
IsGrid
ÖÖ 
)
ÖÖ 
{
ÜÜ 
_leftMostCellRow
áá  
=
áá! "
_currentRow
áá# .
;
áá. /
if
ää 
(
ää 
!
ää #
_contentSizeIncreased
ää *
)
ää* +
{
ãã 
if
çç 
(
çç 
_currentRow
çç #
!=
çç$ &
$num
çç' (
)
çç( )
{
éé 
Content
êê 
.
êê  
	sizeDelta
êê  )
+=
êê* ,
Vector2
êê- 4
.
êê4 5
right
êê5 :
*
êê; <

_cellWidth
êê= G
;
êêG H
n
ëë 
-=
ëë 
$num
ëë 
;
ëë #
_contentSizeIncreased
íí -
=
íí. /
true
íí0 4
;
íí4 5
}
ìì 
}
îî 
else
ïï 
{
ññ 
if
òò 
(
òò 
_currentRow
òò #
==
òò$ &
$num
òò' (
)
òò( )
{
ôô 
Content
öö 
.
öö  
	sizeDelta
öö  )
-=
öö* ,
Vector2
öö- 4
.
öö4 5
right
öö5 :
*
öö; <

_cellWidth
öö= G
;
ööG H#
_contentSizeIncreased
õõ -
=
õõ. /
false
õõ0 5
;
õõ5 6
}
úú 
}
ùù 
}
ûû 
	_cellPool
££ 
.
££ 
ForEach
££ 
(
££ 
(
££ 
RectTransform
££ ,
cell
££- 1
)
££1 2
=>
££3 5
cell
££6 :
.
££: ;
anchoredPosition
££; K
+=
££L N
n
££O P
*
££Q R
Vector2
££S Z
.
££Z [
right
££[ `
*
££a b
	_cellPool
££c l
[
££l m
leftMostCellIndex
££m ~
]
££~ 
.££ Ä
	sizeDelta££Ä â
.££â ä
x££ä ã
)££ã å
;££å ç
Content
§§ 
.
§§ 
anchoredPosition
§§ $
-=
§§% '
n
§§( )
*
§§* +
Vector2
§§, 3
.
§§3 4
right
§§4 9
*
§§: ;
	_cellPool
§§< E
[
§§E F
leftMostCellIndex
§§F W
]
§§W X
.
§§X Y
	sizeDelta
§§Y b
.
§§b c
x
§§c d
;
§§d e

_recycling
•• 
=
•• 
false
•• 
;
•• 
return
¶¶ 
-
¶¶ 
n
¶¶ 
*
¶¶ 
Vector2
¶¶ 
.
¶¶  
right
¶¶  %
*
¶¶& '
	_cellPool
¶¶( 1
[
¶¶1 2
leftMostCellIndex
¶¶2 C
]
¶¶C D
.
¶¶D E
	sizeDelta
¶¶E N
.
¶¶N O
x
¶¶O P
;
¶¶P Q
}
∆∆ 	
private
ŒŒ 
void
ŒŒ 
	SetAnchor
ŒŒ 
(
ŒŒ 
RectTransform
ŒŒ ,
rectTransform
ŒŒ- :
)
ŒŒ: ;
{
œœ 	
float
—— 
width
—— 
=
—— 
rectTransform
—— '
.
——' (
rect
——( ,
.
——, -
width
——- 2
;
——2 3
float
““ 
height
““ 
=
““ 
rectTransform
““ (
.
““( )
rect
““) -
.
““- .
height
““. 4
;
““4 5
Vector2
‘‘ 
pos
‘‘ 
=
‘‘ 
IsGrid
‘‘  
?
‘‘! "
new
‘‘# &
Vector2
‘‘' .
(
‘‘. /
$num
‘‘/ 0
,
‘‘0 1
$num
‘‘2 3
)
‘‘3 4
:
‘‘5 6
new
‘‘7 :
Vector2
‘‘; B
(
‘‘B C
$num
‘‘C D
,
‘‘D E
$num
‘‘F J
)
‘‘J K
;
‘‘K L
rectTransform
◊◊ 
.
◊◊ 
	anchorMin
◊◊ #
=
◊◊$ %
pos
◊◊& )
;
◊◊) *
rectTransform
ÿÿ 
.
ÿÿ 
	anchorMax
ÿÿ #
=
ÿÿ$ %
pos
ÿÿ& )
;
ÿÿ) *
rectTransform
ŸŸ 
.
ŸŸ 
pivot
ŸŸ 
=
ŸŸ  !
pos
ŸŸ" %
;
ŸŸ% &
rectTransform
›› 
.
›› 
	sizeDelta
›› #
=
››$ %
new
››& )
Vector2
››* 1
(
››1 2
width
››2 7
,
››7 8
height
››9 ?
)
››? @
;
››@ A
}
ﬁﬁ 	
}
·· 
}ÊÊ ¢
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
} „+
lD:\GitHub-Projects\Recyclable-Scroll-Rect\Assets\Recyclable Scroll Rect\Main\Scripts\RecyclableScrollRect.cs
	namespace 	
PolyAndCode
 
. 
UI 
{ 
public 

class  
RecyclableScrollRect %
:& '

ScrollRect( 2
{ 
public 
bool 
Grid 
; 
public 
enum 
DirectionType !
{ 	
Vertical 
, 

Horizontal 
} 	
public 
DirectionType 
	Direction &
;& '
[ 	
SerializeField	 
] 
public 
int 
Segments 
{ 
set 
{ 
	_segments 
= 
Math  
.  !
Max! $
($ %
value% *
,* +
$num, -
)- .
;. /
}   
get!! 
{!! 
return"" 
	_segments""  
;""  !
}## 
}$$ 	
[&& 	
SerializeField&&	 
]&& 
private'' 
int'' 
	_segments'' 
;'' 
public(( 
RectTransform(( 
PrototypeCell(( *
;((* +
public)) 
bool)) 
SelfInitialize)) "
=))# $
true))% )
;))) *
[++ 	
HideInInspector++	 
]++ 
public,, +
IRecyclableScrollRectDataSource,, .

DataSource,,/ 9
;,,9 :
private.. 
RecyclingSystem..  
recyclableScrollRect..  4
;..4 5
	protected00 
override00 
void00 
Start00  %
(00% &
)00& '
{11 	
vertical44 
=44 
false44 
;44 

horizontal55 
=55 
true55 
;55 
if77 
(77 
!77 
Application77 
.77 
	isPlaying77 &
)77& '
return77( .
;77. /
if99 
(99 
SelfInitialize99 
)99 

Initialize99  *
(99* +
)99+ ,
;99, -
}:: 	
private== 
void== 

Initialize== 
(==  
)==  !
{>> 	
if?? 
(?? 
	Direction?? 
==?? 
DirectionType?? *
.??* +
Vertical??+ 3
)??3 4
{@@  
recyclableScrollRectAA $
=AA% &
newAA' *#
VerticalRecyclingSystemAA+ B
(AAB C
PrototypeCellAAC P
,AAP Q
viewportAAR Z
,AAZ [
contentAA\ c
,AAc d

DataSourceAAe o
,AAo p
GridAAq u
,AAu v
SegmentsAAw 
)	AA Ä
;
AAÄ Å
}BB 
elseCC 
ifCC 
(CC 
	DirectionCC 
==CC !
DirectionTypeCC" /
.CC/ 0

HorizontalCC0 :
)CC: ;
{DD  
recyclableScrollRectEE $
=EE% &
newEE' *%
HorizontalRecyclingSystemEE+ D
(EED E
PrototypeCellEEE R
,EER S
viewportEET \
,EE\ ]
contentEE^ e
,EEe f

DataSourceEEg q
,EEq r
GridEEs w
,EEw x
Segments	EEy Å
)
EEÅ Ç
;
EEÇ É
}FF 
verticalHH 
=HH 
	DirectionHH  
==HH! #
DirectionTypeHH$ 1
.HH1 2
VerticalHH2 :
;HH: ;

horizontalII 
=II 
	DirectionII "
==II# %
DirectionTypeII& 3
.II3 4

HorizontalII4 >
;II> ?
onValueChangedKK 
.KK 
RemoveListenerKK )
(KK) *"
OnValueChangedListenerKK* @
)KK@ A
;KKA B
StartCoroutineNN 
(NN  
recyclableScrollRectNN /
.NN/ 0
InitCoroutineNN0 =
(NN= >
(NN> ?
)NN? @
=>NNA C
onValueChangedOO? M
.OOM N
AddListenerOON Y
(OOY Z"
OnValueChangedListenerOOZ p
)OOp q
)PP> ?
)PP? @
;PP@ A
}SS 	
publicUU 
voidUU 

InitializeUU 
(UU +
IRecyclableScrollRectDataSourceUU >

dataSourceUU? I
)UUI J
{VV 	

DataSourceWW 
=WW 

dataSourceWW #
;WW# $

InitializeXX 
(XX 
)XX 
;XX 
}YY 	
public\\ 
void\\ "
OnValueChangedListener\\ *
(\\* +
Vector2\\+ 2
args\\3 7
)\\7 8
{]] 	"
m_ContentStartPosition^^ "
+=^^# % 
recyclableScrollRect^^& :
.^^: ;"
OnValueChangedListener^^; Q
(^^Q R
args^^R V
)^^V W
;^^W X
}__ 	
privatebb 
voidbb 
OnDrawGizmosbb !
(bb! "
)bb" #
{cc 	
ifdd 
(dd  
recyclableScrollRectdd $
isdd% '#
VerticalRecyclingSystemdd( ?
)dd? @
{ee 
(ff 
(ff #
VerticalRecyclingSystemff )
)ff) * 
recyclableScrollRectff* >
)ff> ?
.ff? @
OnDrawGizmosff@ L
(ffL M
)ffM N
;ffN O
}gg 
}ii 	
}ll 
}mm Á	
gD:\GitHub-Projects\Recyclable-Scroll-Rect\Assets\Recyclable Scroll Rect\Main\Scripts\RecyclingSystem.cs
	namespace 	
PolyAndCode
 
. 
UI 
{ 
public 

abstract 
class 
RecyclingSystem )
{		 
	protected

 
RectTransform

 
Viewport

  (
,

( )
Content

* 1
;

1 2
	protected 
bool 
IsGrid 
; 
	protected 
RectTransform 
PrototypeCell  -
;- .
	protected 
float 
MinPoolCoverage '
=( )
$num* .
;. /
	protected 
int 
MinPoolSize !
=" #
$num$ &
;& '
public 
abstract 
IEnumerator #
InitCoroutine$ 1
(1 2
System2 8
.8 9
Action9 ?
onInitialized@ M
)M N
;N O
public 
abstract 
Vector2 "
OnValueChangedListener  6
(6 7
Vector27 >
args? C
)C D
;D E
} 
} ¡
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
}(( ıƒ
oD:\GitHub-Projects\Recyclable-Scroll-Rect\Assets\Recyclable Scroll Rect\Main\Scripts\VerticalRecyclingSystem.cs
	namespace 	
PolyAndCode
 
. 
UI 
{ 
public		 
class		 #
VerticalRecyclingSystem		 %
:		& '
RecyclingSystem		( 7
{

 
private 
int 
	_coloumns 
= 
$num  !
;! "
private 
float 

_cellWidth  
,  !
_cellHeight" -
;- .
private 
int 
_topMostCellColoumn '
,' ("
_bottomMostCellColoumn) ?
,? @
_currentColoumnA P
;P Q
private 
bool !
_contentSizeIncreased *
;* +
private +
IRecyclableScrollRectDataSource /
_dataSource0 ;
;; <
public 
bool 
SelfInitialize "
=# $
true% )
;) *
private 
List 
< 
RectTransform "
>" #
	_cellPool$ -
;- .
private 
List 
< 
ICell 
> 
_cachedCells (
;( )
private 
RectTransform 
_listContainer ,
;, -
private 
Bounds !
_recyclableViewBounds ,
;, -
private 
float 
_recyclingThreshold )
=* +
$num, /
;/ 0
private 
Vector3 
[ 
] 
_corners "
=# $
new% (
Vector3) 0
[0 1
$num1 2
]2 3
;3 4
private   
bool   

_recycling   
;    
private## 
int## 
topMostCellIndex## $
,##$ %
bottomMostCellIndex##& 9
;##9 :
private$$ 
int$$ 
currentItemCount$$ $
;$$$ %
public&& #
VerticalRecyclingSystem&& &
(&&& '
RectTransform&&' 4
prototypeCell&&5 B
,&&B C
RectTransform&&D Q
viewport&&R Z
,&&Z [
RectTransform&&\ i
content&&j q
,&&q r,
IRecyclableScrollRectDataSource	&&s í

dataSource
&&ì ù
,
&&ù û
bool
&&ü £
isGrid
&&§ ™
,
&&™ ´
int
&&´ Æ
coloumns
&&Ø ∑
)
&&∑ ∏
{'' 	
PrototypeCell(( 
=(( 
prototypeCell(( )
;(() *
Viewport)) 
=)) 
viewport)) 
;))  
Content** 
=** 
content** 
;** 
_dataSource++ 
=++ 

dataSource++ $
;++$ %
IsGrid,, 
=,, 
isGrid,, 
;,, 
	_coloumns.. 
=.. 
isGrid.. 
?..  !
coloumns.." *
:..+ ,
$num..- .
;... /
}// 	
publicVV 
overrideVV 
IEnumeratorVV #
InitCoroutineVV$ 1
(VV1 2
SystemVV2 8
.VV8 9
ActionVV9 ?
onInitializedVV@ M
)VVM N
{WW 	
SetTopAnchorbb 
(bb 
Contentbb  
)bb  !
;bb! "
Contentcc 
.cc 
anchoredPositioncc $
=cc% &
Vector3cc' .
.cc. /
zerocc/ 3
;cc3 4
yielddd 
returndd 
nulldd 
;dd 
SetRecyclingBoundsee 
(ee 
)ee  
;ee  !
CreateCellPoolhh 
(hh 
)hh 
;hh 
topMostCellIndexjj 
=jj 
$numjj  
;jj  !
bottomMostCellIndexkk 
=kk  !
	_cellPoolkk" +
.kk+ ,
Countkk, 1
-kk2 3
$numkk4 5
;kk5 6
intmm 
noOfRowsmm 
=mm 
(mm 
intmm 
)mm  
Mathfmm  %
.mm% &
Ceilmm& *
(mm* +
(mm+ ,
floatmm, 1
)mm1 2
	_cellPoolmm2 ;
.mm; <
Countmm< A
/mmB C
(mmD E
floatmmE J
)mmJ K
	_coloumnsmmK T
)mmT U
;mmU V
floatpp 
contentYSizepp 
=pp  
noOfRowspp" *
*pp+ ,
PrototypeCellpp- :
.pp: ;
	sizeDeltapp; D
.ppD E
yppE F
;ppF G
Contentqq 
.qq 
	sizeDeltaqq 
=qq 
newqq  #
Vector2qq$ +
(qq+ ,
Contentqq, 3
.qq3 4
	sizeDeltaqq4 =
.qq= >
xqq> ?
,qq? @
contentYSizeqqA M
)qqM N
;qqN O
currentItemCountrr 
=rr 
	_cellPoolrr (
.rr( )
Countrr) .
;rr. /
SetTopAnchorss 
(ss 
Contentss  
)ss  !
;ss! "
ifuu 
(uu 
onInitializeduu 
!=uu 
nulluu  $
)uu$ %
onInitializeduu& 3
(uu3 4
)uu4 5
;uu5 6
}xx 	
private}} 
void}} 
SetRecyclingBounds}} '
(}}' (
)}}( )
{~~ 	
Viewport 
. 
GetWorldCorners $
($ %
_corners% -
)- .
;. /
float
ÄÄ 

threshHold
ÄÄ 
=
ÄÄ !
_recyclingThreshold
ÄÄ 2
*
ÄÄ3 4
(
ÄÄ5 6
_corners
ÄÄ6 >
[
ÄÄ> ?
$num
ÄÄ? @
]
ÄÄ@ A
.
ÄÄA B
y
ÄÄB C
-
ÄÄD E
_corners
ÄÄF N
[
ÄÄN O
$num
ÄÄO P
]
ÄÄP Q
.
ÄÄQ R
y
ÄÄR S
)
ÄÄS T
;
ÄÄT U#
_recyclableViewBounds
ÅÅ !
.
ÅÅ! "
min
ÅÅ" %
=
ÅÅ& '
new
ÅÅ( +
Vector3
ÅÅ, 3
(
ÅÅ3 4
_corners
ÅÅ4 <
[
ÅÅ< =
$num
ÅÅ= >
]
ÅÅ> ?
.
ÅÅ? @
x
ÅÅ@ A
,
ÅÅA B
_corners
ÅÅC K
[
ÅÅK L
$num
ÅÅL M
]
ÅÅM N
.
ÅÅN O
y
ÅÅO P
-
ÅÅQ R

threshHold
ÅÅS ]
)
ÅÅ] ^
;
ÅÅ^ _#
_recyclableViewBounds
ÇÇ !
.
ÇÇ! "
max
ÇÇ" %
=
ÇÇ& '
new
ÇÇ( +
Vector3
ÇÇ, 3
(
ÇÇ3 4
_corners
ÇÇ4 <
[
ÇÇ< =
$num
ÇÇ= >
]
ÇÇ> ?
.
ÇÇ? @
x
ÇÇ@ A
,
ÇÇA B
_corners
ÇÇC K
[
ÇÇK L
$num
ÇÇL M
]
ÇÇM N
.
ÇÇN O
y
ÇÇO P
+
ÇÇQ R

threshHold
ÇÇS ]
)
ÇÇ] ^
;
ÇÇ^ _
}
ÉÉ 	
private
àà 
void
àà 
CreateCellPool
àà $
(
àà$ %
)
àà% &
{
ââ 	
if
ãã 
(
ãã 
	_cellPool
ãã 
!=
ãã 
null
ãã !
)
ãã! "
{
åå 
	_cellPool
çç 
.
çç 
ForEach
çç !
(
çç! "
(
çç" #
RectTransform
çç# 0
item
çç1 5
)
çç5 6
=>
çç7 9
UnityEngine
çç: E
.
ççE F
Object
ççF L
.
ççL M
Destroy
ççM T
(
ççT U
item
ççU Y
.
ççY Z

gameObject
ççZ d
)
ççd e
)
ççe f
;
ççf g
	_cellPool
éé 
.
éé 
Clear
éé 
(
éé  
)
éé  !
;
éé! "
_cachedCells
èè 
.
èè 
Clear
èè "
(
èè" #
)
èè# $
;
èè$ %
}
êê 
else
ëë 
{
íí 
_cachedCells
ìì 
=
ìì 
new
ìì "
List
ìì# '
<
ìì' (
ICell
ìì( -
>
ìì- .
(
ìì. /
)
ìì/ 0
;
ìì0 1
	_cellPool
îî 
=
îî 
new
îî 
List
îî  $
<
îî$ %
RectTransform
îî% 2
>
îî2 3
(
îî3 4
)
îî4 5
;
îî5 6
}
ïï 
PrototypeCell
òò 
.
òò 

gameObject
òò $
.
òò$ %
	SetActive
òò% .
(
òò. /
true
òò/ 3
)
òò3 4
;
òò4 5
if
ôô 
(
ôô 
IsGrid
ôô 
)
ôô 
{
öö 
SetTopLeftAnchor
õõ  
(
õõ  !
PrototypeCell
õõ! .
)
õõ. /
;
õõ/ 0
}
úú 
else
ùù 
{
ûû 
SetTopAnchor
üü 
(
üü 
PrototypeCell
üü *
)
üü* +
;
üü+ ,
}
†† 
float
££ !
currentPoolCoverage
££ %
=
££& '
$num
££( )
;
££) *
int
§§ 
poolSize
§§ 
=
§§ 
$num
§§ 
;
§§ 
float
¶¶ 
posX
¶¶ 
=
¶¶ 
$num
¶¶ 
;
¶¶ 
float
ßß 
posY
ßß 
=
ßß 
$num
ßß 
;
ßß 

_cellWidth
©© 
=
©© 
Content
©©  
.
©©  !
rect
©©! %
.
©©% &
width
©©& +
/
©©, -
	_coloumns
©©. 7
;
©©7 8
_cellHeight
™™ 
=
™™ 
PrototypeCell
™™ '
.
™™' (
	sizeDelta
™™( 1
.
™™1 2
y
™™2 3
/
™™4 5
PrototypeCell
™™6 C
.
™™C D
	sizeDelta
™™D M
.
™™M N
x
™™N O
*
™™P Q

_cellWidth
™™R \
;
™™\ ]
PrototypeCell
´´ 
.
´´ 
	sizeDelta
´´ #
=
´´$ %
new
´´& )
Vector3
´´* 1
(
´´1 2

_cellWidth
´´2 <
,
´´< =
_cellHeight
´´> I
)
´´I J
;
´´J K
_currentColoumn
¨¨ 
=
¨¨ !
_topMostCellColoumn
¨¨ 1
=
¨¨2 3
$num
¨¨4 5
;
¨¨5 6
float
≤≤ 
requriedCoverage
≤≤ "
=
≤≤# $
MinPoolCoverage
≤≤% 4
*
≤≤5 6
Viewport
≤≤7 ?
.
≤≤? @
rect
≤≤@ D
.
≤≤D E
height
≤≤E K
;
≤≤K L
int
¥¥ 
minPoolSize
¥¥ 
=
¥¥ 
Math
¥¥ "
.
¥¥" #
Min
¥¥# &
(
¥¥& '
MinPoolSize
¥¥' 2
,
¥¥2 3
_dataSource
¥¥4 ?
.
¥¥? @
GetItemCount
¥¥@ L
(
¥¥L M
)
¥¥M N
)
¥¥N O
;
¥¥O P
while
∑∑ 
(
∑∑ 
(
∑∑ 
poolSize
∑∑ 
<
∑∑ 
$num
∑∑ !
||
∑∑" $!
currentPoolCoverage
∑∑% 8
<
∑∑9 :
requriedCoverage
∑∑; K
)
∑∑K L
&&
∑∑M O
poolSize
∑∑P X
<
∑∑Y Z
_dataSource
∑∑[ f
.
∑∑f g
GetItemCount
∑∑g s
(
∑∑s t
)
∑∑t u
)
∑∑u v
{
∏∏ 
RectTransform
∫∫ 
item
∫∫ "
=
∫∫# $
(
∫∫% &
UnityEngine
∫∫& 1
.
∫∫1 2
Object
∫∫2 8
.
∫∫8 9
Instantiate
∫∫9 D
(
∫∫D E
PrototypeCell
∫∫E R
.
∫∫R S

gameObject
∫∫S ]
)
∫∫] ^
as
∫∫_ a

GameObject
∫∫b l
)
∫∫l m
.
∫∫m n
GetComponent
∫∫n z
<
∫∫z {
RectTransform∫∫{ à
>∫∫à â
(∫∫â ä
)∫∫ä ã
;∫∫ã å
item
ªª 
.
ªª 
name
ªª 
=
ªª 
$str
ªª "
;
ªª" #
	_cellPool
ºº 
.
ºº 
Add
ºº 
(
ºº 
item
ºº "
)
ºº" #
;
ºº# $
item
ΩΩ 
.
ΩΩ 
	SetParent
ΩΩ 
(
ΩΩ 
Content
ΩΩ &
,
ΩΩ& '
false
ΩΩ( -
)
ΩΩ- .
;
ΩΩ. /
if
øø 
(
øø 
IsGrid
øø 
)
øø 
{
¿¿ 
item
¡¡ 
.
¡¡ 
anchoredPosition
¡¡ )
=
¡¡* +
new
¡¡, /
Vector2
¡¡0 7
(
¡¡7 8
posX
¡¡8 <
,
¡¡< =
posY
¡¡> B
)
¡¡B C
;
¡¡C D
_currentColoumn
¬¬ #
++
¬¬# %
;
¬¬% &
posX
√√ 
=
√√ 
_currentColoumn
√√ *
>=
√√+ -
	_coloumns
√√. 7
?
√√8 9
$num
√√: ;
:
√√< =
posX
√√> B
+
√√C D

_cellWidth
√√E O
;
√√O P
posY
ƒƒ 
=
ƒƒ 
_currentColoumn
ƒƒ *
>=
ƒƒ+ -
	_coloumns
ƒƒ. 7
?
ƒƒ8 9
posY
ƒƒ: >
-
ƒƒ? @
_cellHeight
ƒƒA L
:
ƒƒM N
posY
ƒƒO S
;
ƒƒS T
if
≈≈ 
(
≈≈ 
_currentColoumn
≈≈ '
>=
≈≈( *
	_coloumns
≈≈+ 4
)
≈≈4 5
{
∆∆ 
_currentColoumn
«« '
=
««( )
$num
««* +
;
««+ ,!
currentPoolCoverage
»» +
+=
»», .
item
»»/ 3
.
»»3 4
rect
»»4 8
.
»»8 9
height
»»9 ?
;
»»? @
}
…… 
}
   
else
ÀÀ 
{
ÀÀ 
item
ÕÕ 
.
ÕÕ 
anchoredPosition
ÕÕ )
=
ÕÕ* +
new
ÕÕ, /
Vector2
ÕÕ0 7
(
ÕÕ7 8
$num
ÕÕ8 9
,
ÕÕ9 :
posY
ÕÕ; ?
)
ÕÕ? @
;
ÕÕ@ A
posY
ŒŒ 
=
ŒŒ 
item
ŒŒ 
.
ŒŒ  
anchoredPosition
ŒŒ  0
.
ŒŒ0 1
y
ŒŒ1 2
-
ŒŒ3 4
item
ŒŒ5 9
.
ŒŒ9 :
rect
ŒŒ: >
.
ŒŒ> ?
height
ŒŒ? E
;
ŒŒE F!
currentPoolCoverage
œœ '
+=
œœ( *
item
œœ+ /
.
œœ/ 0
rect
œœ0 4
.
œœ4 5
height
œœ5 ;
;
œœ; <
}
–– 
_cachedCells
’’ 
.
’’ 
Add
’’  
(
’’  !
item
’’! %
.
’’% &
GetComponent
’’& 2
<
’’2 3
ICell
’’3 8
>
’’8 9
(
’’9 :
)
’’: ;
)
’’; <
;
’’< =
_dataSource
÷÷ 
.
÷÷ 
SetCell
÷÷ #
(
÷÷# $
_cachedCells
÷÷$ 0
[
÷÷0 1
_cachedCells
÷÷1 =
.
÷÷= >
Count
÷÷> C
-
÷÷D E
$num
÷÷F G
]
÷÷G H
,
÷÷H I
poolSize
÷÷J R
)
÷÷R S
;
÷÷S T
poolSize
ŸŸ 
++
ŸŸ 
;
ŸŸ 
}
⁄⁄ 
if
›› 
(
›› 
IsGrid
›› 
)
›› 
{
ﬁﬁ $
_bottomMostCellColoumn
ﬂﬂ &
=
ﬂﬂ' (
(
ﬂﬂ) *
_currentColoumn
ﬂﬂ* 9
-
ﬂﬂ: ;
$num
ﬂﬂ< =
+
ﬂﬂ> ?
	_coloumns
ﬂﬂ@ I
)
ﬂﬂI J
%
ﬂﬂK L
	_coloumns
ﬂﬂM V
;
ﬂﬂV W
}
‡‡ 
if
„„ 
(
„„ 
PrototypeCell
„„ 
.
„„ 

gameObject
„„ (
.
„„( )
scene
„„) .
.
„„. /
IsValid
„„/ 6
(
„„6 7
)
„„7 8
)
„„8 9
{
‰‰ 
PrototypeCell
ÂÂ 
.
ÂÂ 

gameObject
ÂÂ (
.
ÂÂ( )
	SetActive
ÂÂ) 2
(
ÂÂ2 3
false
ÂÂ3 8
)
ÂÂ8 9
;
ÂÂ9 :
}
ÊÊ 
}
ÁÁ 	
Vector2
ÍÍ 

zeroVector
ÍÍ 
=
ÍÍ 
Vector2
ÍÍ $
.
ÍÍ$ %
zero
ÍÍ% )
;
ÍÍ) *
public
 
override
 
Vector2
 $
OnValueChangedListener
  6
(
6 7
Vector2
7 >
args
? C
)
C D
{
ÒÒ 	
if
ÚÚ 
(
ÚÚ 

_recycling
ÚÚ 
||
ÚÚ 
	_cellPool
ÚÚ '
==
ÚÚ( *
null
ÚÚ+ /
||
ÚÚ0 2
	_cellPool
ÚÚ3 <
.
ÚÚ< =
Count
ÚÚ= B
==
ÚÚC E
$num
ÚÚF G
)
ÚÚG H
return
ÚÚI O

zeroVector
ÚÚP Z
;
ÚÚ[ \
foreach
ÙÙ 
(
ÙÙ 
var
ÙÙ 
i
ÙÙ 
in
ÙÙ 
	_cellPool
ÙÙ '
)
ÙÙ' (
{
ÙÙ) *
if
ıı 
(
ıı 
i
ıı 
==
ıı 
	_cellPool
ıı "
[
ıı" #
topMostCellIndex
ıı# 3
]
ıı3 4
)
ıı4 5
{
ˆˆ 
i
˜˜ 
.
˜˜ 
GetComponent
˜˜ "
<
˜˜" #
Image
˜˜# (
>
˜˜( )
(
˜˜) *
)
˜˜* +
.
˜˜+ ,
color
˜˜, 1
=
˜˜2 3
Color
˜˜4 9
.
˜˜9 :
red
˜˜: =
;
˜˜= >
}
¯¯ 
else
˘˘ 
if
˘˘ 
(
˘˘ 
i
˘˘ 
==
˘˘ 
	_cellPool
˘˘ '
[
˘˘' (!
bottomMostCellIndex
˘˘( ;
]
˘˘; <
)
˘˘< =
{
˙˙ 
i
˚˚ 
.
˚˚ 
GetComponent
˚˚ "
<
˚˚" #
Image
˚˚# (
>
˚˚( )
(
˚˚) *
)
˚˚* +
.
˚˚+ ,
color
˚˚, 1
=
˚˚2 3
Color
˚˚4 9
.
˚˚9 :
green
˚˚: ?
;
˚˚? @
}
¸¸ 
else
˝˝ 
{
˝˝ 
i
˛˛ 
.
˛˛ 
GetComponent
˛˛ "
<
˛˛" #
Image
˛˛# (
>
˛˛( )
(
˛˛) *
)
˛˛* +
.
˛˛+ ,
color
˛˛, 1
=
˛˛2 3
Color
˛˛4 9
.
˛˛9 :
white
˛˛: ?
;
˛˛? @
}
ÄÄ 
}
ÅÅ  
SetRecyclingBounds
ÑÑ 
(
ÑÑ 
)
ÑÑ  
;
ÑÑ  !
if
ÜÜ 
(
ÜÜ 
	_cellPool
ÜÜ 
[
ÜÜ !
bottomMostCellIndex
ÜÜ -
]
ÜÜ- .
.
ÜÜ. /
MinY
ÜÜ/ 3
(
ÜÜ3 4
)
ÜÜ4 5
>
ÜÜ6 7#
_recyclableViewBounds
ÜÜ8 M
.
ÜÜM N
min
ÜÜN Q
.
ÜÜQ R
y
ÜÜR S
)
ÜÜS T
{
áá 
return
ãã  
RecycleTopToBottom
ãã *
(
ãã* +
)
ãã+ ,
;
ãã, -
}
åå 
else
çç 
if
çç 
(
çç 
	_cellPool
çç 
[
çç 
topMostCellIndex
çç /
]
çç/ 0
.
çç0 1
MaxY
çç1 5
(
çç5 6
)
çç6 7
<
çç8 9#
_recyclableViewBounds
çç: O
.
ççO P
max
ççP S
.
ççS T
y
ççT U
)
ççU V
{
éé 
Debug
èè 
.
èè 
Log
èè 
(
èè 
$str
èè )
)
èè) *
;
èè* +
Debug
êê 
.
êê 
Log
êê 
(
êê 
$str
êê !
+
êê" #
topMostCellIndex
êê$ 4
)
êê4 5
;
êê5 6
Debug
íí 
.
íí 
Log
íí 
(
íí 
$str
íí "
+
íí# $
	_cellPool
íí% .
[
íí. /
topMostCellIndex
íí/ ?
]
íí? @
.
íí@ A
MaxY
ííA E
(
ííE F
)
ííF G
)
ííG H
;
ííH I
Debug
ìì 
.
ìì 
Log
ìì 
(
ìì 
$str
ìì  
+
ìì! "#
_recyclableViewBounds
ìì# 8
.
ìì8 9
max
ìì9 <
.
ìì< =
y
ìì= >
)
ìì> ?
;
ìì? @
return
óó  
RecycleBottomToTop
óó )
(
óó) *
)
óó* +
;
óó+ ,
}
òò 
return
öö 

zeroVector
öö 
;
öö 
}
úú 	
private
¢¢ 
Vector2
¢¢  
RecycleTopToBottom
¢¢ *
(
¢¢* +
)
¢¢+ ,
{
££ 	

_recycling
§§ 
=
§§ 
true
§§ 
;
§§ 
int
¶¶ 
n
¶¶ 
=
¶¶ 
$num
¶¶ 
;
¶¶ 
float
ßß 
posY
ßß 
=
ßß 
$num
ßß 
;
ßß 
float
®® 
posX
®® 
=
®® 
$num
®® 
;
®® 
if
™™ 
(
™™ 
IsGrid
™™ 
)
™™ 
{
´´ 
posY
¨¨ 
=
¨¨ 
	_cellPool
¨¨ !
[
¨¨! "!
bottomMostCellIndex
¨¨" 5
]
¨¨5 6
.
¨¨6 7
anchoredPosition
¨¨7 G
.
¨¨G H
y
¨¨H I
;
¨¨I J
if
ÆÆ 
(
ÆÆ $
_bottomMostCellColoumn
ÆÆ *
==
ÆÆ+ -
	_coloumns
ÆÆ. 7
-
ÆÆ8 9
$num
ÆÆ: ;
)
ÆÆ; <
{
ØØ 
posY
∞∞ 
-=
∞∞ 
	_cellPool
∞∞ %
[
∞∞% &
topMostCellIndex
∞∞& 6
]
∞∞6 7
.
∞∞7 8
rect
∞∞8 <
.
∞∞< =
height
∞∞= C
;
∞∞C D
}
±± 
_currentColoumn
≤≤ 
=
≤≤  !$
_bottomMostCellColoumn
≤≤" 8
;
≤≤8 9
}
≥≥ 
while
∂∂ 
(
∂∂ 
	_cellPool
∂∂ 
[
∂∂ 
topMostCellIndex
∂∂ -
]
∂∂- .
.
∂∂. /
MinY
∂∂/ 3
(
∂∂3 4
)
∂∂4 5
>
∂∂6 7#
_recyclableViewBounds
∂∂8 M
.
∂∂M N
max
∂∂N Q
.
∂∂Q R
y
∂∂R S
&&
∂∂T V
currentItemCount
∂∂W g
<
∂∂h i
_dataSource
∂∂j u
.
∂∂u v
GetItemCount∂∂v Ç
(∂∂Ç É
)∂∂É Ñ
)∂∂Ñ Ö
{
∑∑ 
if
∏∏ 
(
∏∏ 
IsGrid
∏∏ 
)
∏∏ 
{
ππ 
_currentColoumn
∫∫ #
++
∫∫$ &
;
∫∫& '
if
ºº 
(
ºº 
_currentColoumn
ºº '
>=
ºº( *
	_coloumns
ºº+ 4
)
ºº4 5
{
ΩΩ 
n
ææ 
++
ææ 
;
ææ 
_currentColoumn
øø '
=
øø( )
$num
øø* +
;
øø+ ,
}
¿¿ 
posX
¡¡ 
=
¡¡ 
_currentColoumn
¡¡ *
*
¡¡+ ,

_cellWidth
¡¡- 7
;
¡¡7 8
if
√√ 
(
√√ 
_currentColoumn
√√ '
==
√√( *
$num
√√+ ,
)
√√, -
{
ƒƒ 
posY
∆∆ 
=
∆∆ 
	_cellPool
∆∆ (
[
∆∆( )!
bottomMostCellIndex
∆∆) <
]
∆∆< =
.
∆∆= >
anchoredPosition
∆∆> N
.
∆∆N O
y
∆∆O P
-
∆∆Q R
_cellHeight
∆∆S ^
;
∆∆^ _
}
«« 
	_cellPool
   
[
   
topMostCellIndex
   .
]
  . /
.
  / 0
anchoredPosition
  0 @
=
  A B
new
  C F
Vector2
  G N
(
  N O
posX
  O S
,
  S T
posY
  U Y
)
  Y Z
;
  Z [!
_topMostCellColoumn
ÀÀ '
=
ÀÀ( )
(
ÀÀ* +!
_topMostCellColoumn
ÀÀ+ >
+
ÀÀ? @
$num
ÀÀA B
)
ÀÀB C
%
ÀÀD E
	_coloumns
ÀÀF O
;
ÀÀO P
}
ÕÕ 
else
ŒŒ 
{
ŒŒ 
posY
–– 
=
–– 
	_cellPool
–– $
[
––$ %!
bottomMostCellIndex
––% 8
]
––8 9
.
––9 :
anchoredPosition
––: J
.
––J K
y
––K L
-
––M N
	_cellPool
––O X
[
––X Y!
bottomMostCellIndex
––Y l
]
––l m
.
––m n
	sizeDelta
––n w
.
––w x
y
––x y
;
––y z
	_cellPool
—— 
[
—— 
topMostCellIndex
—— .
]
——. /
.
——/ 0
anchoredPosition
——0 @
=
——A B
new
——C F
Vector2
——G N
(
——N O
	_cellPool
——O X
[
——X Y
topMostCellIndex
——Y i
]
——i j
.
——j k
anchoredPosition
——k {
.
——{ |
x
——| }
,
——} ~
posY—— É
)——É Ñ
;——Ñ Ö
}
““ 
_dataSource
’’ 
.
’’ 
SetCell
’’ #
(
’’# $
_cachedCells
’’$ 0
[
’’0 1
topMostCellIndex
’’1 A
]
’’A B
,
’’B C
currentItemCount
’’D T
)
’’T U
;
’’U V!
bottomMostCellIndex
ÿÿ #
=
ÿÿ$ %
topMostCellIndex
ÿÿ& 6
;
ÿÿ6 7
topMostCellIndex
ŸŸ  
=
ŸŸ! "
(
ŸŸ# $
topMostCellIndex
ŸŸ$ 4
+
ŸŸ5 6
$num
ŸŸ7 8
)
ŸŸ8 9
%
ŸŸ: ;
	_cellPool
ŸŸ< E
.
ŸŸE F
Count
ŸŸF K
;
ŸŸK L
currentItemCount
€€  
++
€€  "
;
€€" #
if
‹‹ 
(
‹‹ 
!
‹‹ 
IsGrid
‹‹ 
)
‹‹ 
n
‹‹ 
++
‹‹  
;
‹‹  !
}
›› 
if
‡‡ 
(
‡‡ 
IsGrid
‡‡ 
)
‡‡ 
{
·· $
_bottomMostCellColoumn
‚‚ &
=
‚‚' (
_currentColoumn
‚‚) 8
;
‚‚8 9
if
ÂÂ 
(
ÂÂ 
!
ÂÂ #
_contentSizeIncreased
ÂÂ *
)
ÂÂ* +
{
ÊÊ 
if
ËË 
(
ËË 
_currentColoumn
ËË '
!=
ËË( *
	_coloumns
ËË+ 4
-
ËË5 6
$num
ËË7 8
)
ËË8 9
{
ÈÈ 
Content
ÎÎ 
.
ÎÎ  
	sizeDelta
ÎÎ  )
+=
ÎÎ* ,
Vector2
ÎÎ- 4
.
ÎÎ4 5
up
ÎÎ5 7
*
ÎÎ8 9
	_cellPool
ÎÎ: C
[
ÎÎC D
topMostCellIndex
ÎÎD T
]
ÎÎT U
.
ÎÎU V
	sizeDelta
ÎÎV _
.
ÎÎ_ `
y
ÎÎ` a
;
ÎÎa b
n
ÏÏ 
-=
ÏÏ 
$num
ÏÏ 
;
ÏÏ #
_contentSizeIncreased
ÌÌ -
=
ÌÌ. /
true
ÌÌ0 4
;
ÌÌ4 5
}
ÓÓ 
}
ÔÔ 
else
 
{
ÒÒ 
if
ÛÛ 
(
ÛÛ 
_currentColoumn
ÛÛ '
==
ÛÛ( *
	_coloumns
ÛÛ+ 4
-
ÛÛ5 6
$num
ÛÛ7 8
)
ÛÛ8 9
{
ÙÙ 
Content
ıı 
.
ıı  
	sizeDelta
ıı  )
-=
ıı* ,
Vector2
ıı- 4
.
ıı4 5
up
ıı5 7
*
ıı8 9
	_cellPool
ıı: C
[
ııC D
topMostCellIndex
ııD T
]
ııT U
.
ııU V
	sizeDelta
ııV _
.
ıı_ `
y
ıı` a
;
ııa b#
_contentSizeIncreased
ˆˆ -
=
ˆˆ. /
false
ˆˆ0 5
;
ˆˆ5 6
}
˜˜ 
}
¯¯ 
}
˙˙ 
	_cellPool
ˇˇ 
.
ˇˇ 
ForEach
ˇˇ 
(
ˇˇ 
(
ˇˇ 
RectTransform
ˇˇ ,
cell
ˇˇ- 1
)
ˇˇ1 2
=>
ˇˇ3 5
cell
ˇˇ6 :
.
ˇˇ: ;
anchoredPosition
ˇˇ; K
+=
ˇˇL N
n
ˇˇO P
*
ˇˇQ R
Vector2
ˇˇS Z
.
ˇˇZ [
up
ˇˇ[ ]
*
ˇˇ^ _
	_cellPool
ˇˇ` i
[
ˇˇi j
topMostCellIndex
ˇˇj z
]
ˇˇz {
.
ˇˇ{ |
	sizeDeltaˇˇ| Ö
.ˇˇÖ Ü
yˇˇÜ á
)ˇˇá à
;ˇˇà â
Content
ÅÅ 
.
ÅÅ 
anchoredPosition
ÅÅ $
-=
ÅÅ% '
n
ÅÅ( )
*
ÅÅ* +
Vector2
ÅÅ, 3
.
ÅÅ3 4
up
ÅÅ4 6
*
ÅÅ7 8
	_cellPool
ÅÅ9 B
[
ÅÅB C
topMostCellIndex
ÅÅC S
]
ÅÅS T
.
ÅÅT U
	sizeDelta
ÅÅU ^
.
ÅÅ^ _
y
ÅÅ_ `
;
ÅÅ` a

_recycling
ÑÑ 
=
ÑÑ 
false
ÑÑ 
;
ÑÑ 
return
ÖÖ 
-
ÖÖ 
new
ÖÖ 
Vector2
ÖÖ  
(
ÖÖ  !
$num
ÖÖ! "
,
ÖÖ" #
n
ÖÖ$ %
*
ÖÖ& '
	_cellPool
ÖÖ( 1
[
ÖÖ1 2
topMostCellIndex
ÖÖ2 B
]
ÖÖB C
.
ÖÖC D
	sizeDelta
ÖÖD M
.
ÖÖM N
y
ÖÖN O
)
ÖÖO P
;
ÖÖP Q
}
áá 	
private
çç 
Vector2
çç  
RecycleBottomToTop
çç *
(
çç* +
)
çç+ ,
{
éé 	
Debug
èè 
.
èè 
Log
èè 
(
èè 
$str
èè %
+
èè& '
topMostCellIndex
èè( 8
)
èè8 9
;
èè9 :

_recycling
ëë 
=
ëë 
true
ëë 
;
ëë 
int
ìì 
n
ìì 
=
ìì 
$num
ìì 
;
ìì 
float
îî 
posY
îî 
=
îî 
$num
îî 
;
îî 
float
ññ 
posX
ññ 
=
ññ 
$num
ññ 
;
ññ 
if
óó 
(
óó 
IsGrid
óó 
)
óó 
{
óó 
float
òò 
_posY
òò 
=
òò 
	_cellPool
òò '
[
òò' (
topMostCellIndex
òò( 8
]
òò8 9
.
òò9 :
anchoredPosition
òò: J
.
òòJ K
y
òòK L
;
òòL M
if
öö 
(
öö !
_topMostCellColoumn
öö '
==
öö( *
$num
öö+ ,
)
öö, -
{
õõ 
posY
úú 
+=
úú 
	_cellPool
úú %
[
úú% &
topMostCellIndex
úú& 6
]
úú6 7
.
úú7 8
rect
úú8 <
.
úú< =
height
úú= C
;
úúC D
}
ùù 
_currentColoumn
üü  
=
üü! "!
_topMostCellColoumn
üü# 6
;
üü6 7
}
†† 
while
§§ 
(
§§ 
	_cellPool
§§ 
[
§§ !
bottomMostCellIndex
§§ 0
]
§§0 1
.
§§1 2
MaxY
§§2 6
(
§§6 7
)
§§7 8
<
§§9 :#
_recyclableViewBounds
§§; P
.
§§P Q
min
§§Q T
.
§§T U
y
§§U V
&&
§§W Y
currentItemCount
§§Z j
>
§§k l
	_cellPool
§§m v
.
§§v w
Count
§§w |
)
§§| }
{
•• 
if
ßß 
(
ßß 
IsGrid
ßß 
)
ßß 
{
®® 
_currentColoumn
©© #
-=
©©$ &
$num
©©' (
;
©©( )
if
´´ 
(
´´ 
_currentColoumn
´´ '
<
´´( )
$num
´´* +
)
´´+ ,
{
¨¨ 
n
≠≠ 
++
≠≠ 
;
≠≠ 
_currentColoumn
ÆÆ '
=
ÆÆ( )
	_coloumns
ÆÆ* 3
-
ÆÆ4 5
$num
ÆÆ6 7
;
ÆÆ7 8
}
ØØ 
posX
±± 
=
±± 
_currentColoumn
±± *
*
±±+ ,

_cellWidth
±±- 7
;
±±7 8
if
≥≥ 
(
≥≥ 
_currentColoumn
≥≥ '
==
≥≥( *
	_coloumns
≥≥+ 4
-
≥≥5 6
$num
≥≥7 8
)
≥≥8 9
{
¥¥ 
posY
∂∂ 
=
∂∂ 
	_cellPool
∂∂ (
[
∂∂( )
topMostCellIndex
∂∂) 9
]
∂∂9 :
.
∂∂: ;
anchoredPosition
∂∂; K
.
∂∂K L
y
∂∂L M
+
∂∂N O
_cellHeight
∂∂P [
;
∂∂[ \
}
∑∑ 
	_cellPool
∏∏ 
[
∏∏ !
bottomMostCellIndex
∏∏ 1
]
∏∏1 2
.
∏∏2 3
anchoredPosition
∏∏3 C
=
∏∏D E
new
∏∏F I
Vector2
∏∏J Q
(
∏∏Q R
posX
∏∏R V
,
∏∏V W
posY
∏∏X \
)
∏∏\ ]
;
∏∏] ^$
_bottomMostCellColoumn
ππ *
=
ππ+ ,
(
ππ- .$
_bottomMostCellColoumn
ππ. D
-
ππE F
$num
ππG H
+
ππI J
	_coloumns
ππK T
)
ππT U
%
ππV W
	_coloumns
ππX a
;
ππa b
}
ªª 
else
ºº 
{
ºº 
posY
ææ 
=
ææ 
	_cellPool
ææ  
[
ææ  !
topMostCellIndex
ææ! 1
]
ææ1 2
.
ææ2 3
anchoredPosition
ææ3 C
.
ææC D
y
ææD E
+
ææF G
	_cellPool
ææH Q
[
ææQ R
topMostCellIndex
ææR b
]
ææb c
.
ææc d
	sizeDelta
ææd m
.
ææm n
y
ææn o
;
ææo p
	_cellPool
øø 
[
øø !
bottomMostCellIndex
øø -
]
øø- .
.
øø. /
anchoredPosition
øø/ ?
=
øø@ A
new
øøB E
Vector2
øøF M
(
øøM N
	_cellPool
øøN W
[
øøW X!
bottomMostCellIndex
øøX k
]
øøk l
.
øøl m
anchoredPosition
øøm }
.
øø} ~
x
øø~ 
,øø Ä
posYøøÅ Ö
)øøÖ Ü
;øøÜ á
n
¡¡ 
++
¡¡ 
;
¡¡ 
}
√√ 
currentItemCount
∆∆  
--
∆∆  "
;
∆∆" #
_dataSource
   
.
   
SetCell
   #
(
  # $
_cachedCells
  $ 0
[
  0 1!
bottomMostCellIndex
  1 D
]
  D E
,
  E F
currentItemCount
  G W
-
  X Y
	_cellPool
  Z c
.
  c d
Count
  d i
)
  i j
;
  j k
topMostCellIndex
ÕÕ  
=
ÕÕ! "!
bottomMostCellIndex
ÕÕ# 6
;
ÕÕ6 7!
bottomMostCellIndex
ŒŒ #
=
ŒŒ$ %
(
ŒŒ& '!
bottomMostCellIndex
ŒŒ' :
-
ŒŒ; <
$num
ŒŒ= >
+
ŒŒ? @
	_cellPool
ŒŒA J
.
ŒŒJ K
Count
ŒŒK P
)
ŒŒP Q
%
ŒŒR S
	_cellPool
ŒŒT ]
.
ŒŒ] ^
Count
ŒŒ^ c
;
ŒŒc d
}
œœ 
if
““ 
(
““ 
IsGrid
““ 
)
““ 
{
““ !
_topMostCellColoumn
”” #
=
””$ %
_currentColoumn
””& 5
;
””5 6
if
÷÷ 
(
÷÷ 
!
÷÷ #
_contentSizeIncreased
÷÷ *
)
÷÷* +
{
◊◊ 
if
ŸŸ 
(
ŸŸ 
_currentColoumn
ŸŸ '
!=
ŸŸ( *
$num
ŸŸ+ ,
)
ŸŸ, -
{
⁄⁄ 
Content
‹‹ 
.
‹‹  
	sizeDelta
‹‹  )
+=
‹‹* ,
Vector2
‹‹- 4
.
‹‹4 5
up
‹‹5 7
*
‹‹8 9
	_cellPool
‹‹: C
[
‹‹C D
topMostCellIndex
‹‹D T
]
‹‹T U
.
‹‹U V
	sizeDelta
‹‹V _
.
‹‹_ `
y
‹‹` a
;
‹‹a b
n
›› 
-=
›› 
$num
›› 
;
›› #
_contentSizeIncreased
ﬁﬁ -
=
ﬁﬁ. /
true
ﬁﬁ0 4
;
ﬁﬁ4 5
}
ﬂﬂ 
}
‡‡ 
else
·· 
{
‚‚ 
if
‰‰ 
(
‰‰ 
_currentColoumn
‰‰ '
==
‰‰( *
$num
‰‰+ ,
)
‰‰, -
{
ÂÂ 
Content
ÊÊ 
.
ÊÊ  
	sizeDelta
ÊÊ  )
-=
ÊÊ* ,
Vector2
ÊÊ- 4
.
ÊÊ4 5
up
ÊÊ5 7
*
ÊÊ8 9
	_cellPool
ÊÊ: C
[
ÊÊC D
topMostCellIndex
ÊÊD T
]
ÊÊT U
.
ÊÊU V
	sizeDelta
ÊÊV _
.
ÊÊ_ `
y
ÊÊ` a
;
ÊÊa b#
_contentSizeIncreased
ÁÁ -
=
ÁÁ. /
false
ÁÁ0 5
;
ÁÁ5 6
}
ËË 
}
ÈÈ 
}
ÍÍ 
	_cellPool
ÔÔ 
.
ÔÔ 
ForEach
ÔÔ 
(
ÔÔ 
(
ÔÔ 
RectTransform
ÔÔ ,
cell
ÔÔ- 1
)
ÔÔ1 2
=>
ÔÔ3 5
cell
ÔÔ6 :
.
ÔÔ: ;
anchoredPosition
ÔÔ; K
-=
ÔÔL N
n
ÔÔO P
*
ÔÔQ R
Vector2
ÔÔS Z
.
ÔÔZ [
up
ÔÔ[ ]
*
ÔÔ^ _
	_cellPool
ÔÔ` i
[
ÔÔi j
topMostCellIndex
ÔÔj z
]
ÔÔz {
.
ÔÔ{ |
	sizeDeltaÔÔ| Ö
.ÔÔÖ Ü
yÔÔÜ á
)ÔÔá à
;ÔÔà â
Content
ÒÒ 
.
ÒÒ 
anchoredPosition
ÒÒ $
+=
ÒÒ% '
n
ÒÒ( )
*
ÒÒ* +
Vector2
ÒÒ, 3
.
ÒÒ3 4
up
ÒÒ4 6
*
ÒÒ7 8
	_cellPool
ÒÒ9 B
[
ÒÒB C
topMostCellIndex
ÒÒC S
]
ÒÒS T
.
ÒÒT U
	sizeDelta
ÒÒU ^
.
ÒÒ^ _
y
ÒÒ_ `
;
ÒÒ` a

_recycling
ÙÙ 
=
ÙÙ 
false
ÙÙ 
;
ÙÙ 
return
ıı 
new
ıı 
Vector2
ıı  
(
ıı  !
$num
ıı! "
,
ıı" #
n
ıı$ %
*
ıı& '
	_cellPool
ıı( 1
[
ıı1 2
topMostCellIndex
ıı2 B
]
ııB C
.
ııC D
	sizeDelta
ııD M
.
ııM N
y
ııN O
)
ııO P
;
ııP Q
}
ˆˆ 	
private
˛˛ 
void
˛˛ 
SetTopAnchor
˛˛ !
(
˛˛! "
RectTransform
˛˛" /
rectTransform
˛˛0 =
)
˛˛= >
{
ˇˇ 	
float
ÅÅ 
width
ÅÅ 
=
ÅÅ 
rectTransform
ÅÅ '
.
ÅÅ' (
rect
ÅÅ( ,
.
ÅÅ, -
width
ÅÅ- 2
;
ÅÅ2 3
float
ÇÇ 
height
ÇÇ 
=
ÇÇ 
rectTransform
ÇÇ (
.
ÇÇ( )
rect
ÇÇ) -
.
ÇÇ- .
height
ÇÇ. 4
;
ÇÇ4 5
rectTransform
ÖÖ 
.
ÖÖ 
	anchorMin
ÖÖ #
=
ÖÖ$ %
new
ÖÖ& )
Vector2
ÖÖ* 1
(
ÖÖ1 2
$num
ÖÖ2 6
,
ÖÖ6 7
$num
ÖÖ8 9
)
ÖÖ9 :
;
ÖÖ: ;
rectTransform
ÜÜ 
.
ÜÜ 
	anchorMax
ÜÜ #
=
ÜÜ$ %
new
ÜÜ& )
Vector2
ÜÜ* 1
(
ÜÜ1 2
$num
ÜÜ2 6
,
ÜÜ6 7
$num
ÜÜ8 9
)
ÜÜ9 :
;
ÜÜ: ;
rectTransform
áá 
.
áá 
pivot
áá 
=
áá  !
new
áá" %
Vector2
áá& -
(
áá- .
$num
áá. 2
,
áá2 3
$num
áá4 5
)
áá5 6
;
áá6 7
rectTransform
ää 
.
ää 
	sizeDelta
ää #
=
ää$ %
new
ää& )
Vector2
ää* 1
(
ää1 2
width
ää2 7
,
ää7 8
height
ää9 ?
)
ää? @
;
ää@ A
}
ãã 	
private
çç 
void
çç 
SetTopLeftAnchor
çç %
(
çç% &
RectTransform
çç& 3
rectTransform
çç4 A
)
ççA B
{
éé 	
float
êê 
width
êê 
=
êê 
rectTransform
êê '
.
êê' (
rect
êê( ,
.
êê, -
width
êê- 2
;
êê2 3
float
ëë 
height
ëë 
=
ëë 
rectTransform
ëë (
.
ëë( )
rect
ëë) -
.
ëë- .
height
ëë. 4
;
ëë4 5
rectTransform
îî 
.
îî 
	anchorMin
îî #
=
îî$ %
new
îî& )
Vector2
îî* 1
(
îî1 2
$num
îî2 3
,
îî3 4
$num
îî5 6
)
îî6 7
;
îî7 8
rectTransform
ïï 
.
ïï 
	anchorMax
ïï #
=
ïï$ %
new
ïï& )
Vector2
ïï* 1
(
ïï1 2
$num
ïï2 3
,
ïï3 4
$num
ïï5 6
)
ïï6 7
;
ïï7 8
rectTransform
ññ 
.
ññ 
pivot
ññ 
=
ññ  !
new
ññ" %
Vector2
ññ& -
(
ññ- .
$num
ññ. /
,
ññ/ 0
$num
ññ1 2
)
ññ2 3
;
ññ3 4
rectTransform
ôô 
.
ôô 
	sizeDelta
ôô #
=
ôô$ %
new
ôô& )
Vector2
ôô* 1
(
ôô1 2
width
ôô2 7
,
ôô7 8
height
ôô9 ?
)
ôô? @
;
ôô@ A
}
öö 	
public
ûû 
void
ûû 
OnDrawGizmos
ûû  
(
ûû  !
)
ûû! "
{
üü 	
Gizmos
†† 
.
†† 
color
†† 
=
†† 
Color
††  
.
††  !
green
††! &
;
††& '
Gizmos
°° 
.
°° 
DrawLine
°° 
(
°° #
_recyclableViewBounds
°° 1
.
°°1 2
min
°°2 5
-
°°6 7
new
°°8 ;
Vector3
°°< C
(
°°C D
$num
°°D H
,
°°H I
$num
°°J K
)
°°K L
,
°°L M#
_recyclableViewBounds
°°N c
.
°°c d
min
°°d g
+
°°h i
new
°°j m
Vector3
°°n u
(
°°u v
$num
°°v z
,
°°z {
$num
°°| }
)
°°} ~
)
°°~ 
;°° Ä
Gizmos
¢¢ 
.
¢¢ 
color
¢¢ 
=
¢¢ 
Color
¢¢  
.
¢¢  !
red
¢¢! $
;
¢¢$ %
Gizmos
££ 
.
££ 
DrawLine
££ 
(
££ #
_recyclableViewBounds
££ 1
.
££1 2
max
££2 5
-
££6 7
new
££8 ;
Vector3
££< C
(
££C D
$num
££D H
,
££H I
$num
££J K
)
££K L
,
££L M#
_recyclableViewBounds
££N c
.
££c d
max
££d g
+
££h i
new
££j m
Vector3
££n u
(
££u v
$num
££v z
,
££z {
$num
££| }
)
££} ~
)
££~ 
;££ Ä
}
§§ 	
}
¶¶ 
}ßß 