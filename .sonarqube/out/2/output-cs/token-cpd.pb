˚
XC:\Users\nsepulveda\source\repos\Sat.Recruitment\Bussines\Handlers\UserRequestHandler.cs
	namespace 	
Bussines
 
. 
Handlers 
{ 
public 

class 
UserRequestHandler #
:$ %
IRequestHandler& 5
<5 6
UserRequest6 A
,A B
UserResponseC O
>O P
{ 
private 
readonly 
IMapper  
_mapper! (
;( )
private 
readonly 

IQueryUser #
_repository$ /
;/ 0
private 
readonly 
IUserService %
_userService& 2
;2 3
public 
UserRequestHandler !
(! "
IMapper" )
mapper* 0
,0 1

IQueryUser2 <

repository= G
,H I
IUserServiceJ V
userServiceW b
)c d
{ 	
_mapper 
= 
mapper 
; 
_repository 
= 

repository $
;$ %
_userService 
= 
userService &
;& '
} 	
public 
async 
Task 
< 
UserResponse &
>& '
Handle( .
(. /
UserRequest/ :
request; B
,B C
CancellationTokenD U
cancellationTokenV g
)g h
{   	
var!! 
userDTO!! 
=!! 
_mapper!! !
.!!! "
Map!!" %
<!!% &
UserDTO!!& -
>!!- .
(!!. /
request!!/ 6
)!!6 7
;!!7 8
var"" 
user"" 
="" 
_userService"" #
.""# $
MapDto""$ *
(""* +
userDTO""+ 2
)""2 3
;""3 4
var## 
	listUsers## 
=## 
await## !
_repository##" -
.##- .
GetUsersAsync##. ;
(##; <
)##< =
;##= >
if$$ 
($$ 
	listUsers$$ 
.$$ 
Any$$ 
($$ 
u$$ 
=>$$  "
u$$# $
.$$$ %
Email$$% *
==$$+ -
user$$. 2
.$$2 3
Email$$3 8
||$$9 ;
u$$< =
.$$= >
Name$$> B
==$$C E
user$$E I
.$$I J
Name$$J N
||$$O Q
u$$R S
.$$S T
Phone$$T Y
==$$Z \
user$$] a
.$$a b
Phone$$b g
)$$g h
)$$h i
{%% 
return&& 
new&& 
UserResponse&& '
(&&' (
)&&( )
{'' 
	IsSuccess(( 
=(( 
false((  %
,((% &
ResultValue)) 
=))  !
string))" (
.))( )
Empty))) .
,))/ 0
Message** 
=** 
$str** 6
}++ 
;++ 
},, 
return-- 
new-- 
UserResponse-- #
(--# $
)--$ %
{.. 
	IsSuccess// 
=// 
true//  
,//  !
ResultValue00 
=00 
user00 "
,00" #
Message11 
=11 
$str11 )
}22 
;22 
}44 	
}77 
}88 Æ

_C:\Users\nsepulveda\source\repos\Sat.Recruitment\Bussines\Infractrusture\DependencyInjection.cs
	namespace 	
Bussines
 
. 
Infractrusture !
{		 
public

 
static

	 
class

 
DependencyInjection

 )
{ 
public 
static 
void 

AddMappers %
(% &
this& *
IServiceCollection+ =
services> F
)F G
{ 	
var 
config 
= 
new 
MapperConfiguration 0
(0 1
m1 2
=>3 5
{ 
m 
. 

AddProfile 
( 
typeof #
(# $
MappingProfile$ 2
)2 3
)3 4
;4 5
} 
) 
; 
services 
. 
AddSingleton !
(! "
config" (
.( )
CreateMapper) 5
(5 6
)6 7
)7 8
;8 9
services 
. 
AddSingleton !
<! "
IUserService" .
,. /
User0 4
>4 5
(5 6
)6 7
;7 8
} 	
} 
} î
WC:\Users\nsepulveda\source\repos\Sat.Recruitment\Bussines\Infractrusture\FactoryUser.cs
	namespace 	
Bussines
 
{		 
public

 

class

 
FactoryUser

 
{ 
private 
readonly 

Dictionary #
<# $
string$ *
,* +
IStrategyCalculate, >
>> ?
users@ E
;E F
public 
FactoryUser 
( 
) 
{ 	
users 
= 
new 

Dictionary "
<" #
string# )
,) *
IStrategyCalculate+ =
>= >
{ 
{ 
$str 
, 
new 
NormalUserCalculate  3
(3 4
)4 5
}6 7
,7 8
{ 
$str 
, 
new "
SuperUserCalculate# 5
(5 6
)6 7
}8 9
,9 :
{ 
$str 
, 
new   
PremiumUserCalculate! 5
(5 6
)6 7
}8 9
} 
; 
} 	
public 
decimal $
GetMoneyCalculatedByUser /
(/ 0
User0 4
user5 9
)9 :
{ 	
var 

percentage 
= 
users "
[" #
user# '
.' (
UserType( 0
]0 1
.1 2
GetPercentage2 ?
(? @
user@ D
.D E
MoneyE J
)J K
;K L
var 
gif 
= 
user 
. 
Money  
*! "
Convert# *
.* +
	ToDecimal+ 4
(4 5

percentage5 ?
)? @
;@ A
return 
user 
. 
Money 
+ 
gif  #
;# $
} 	
}   
}!! Ë
ZC:\Users\nsepulveda\source\repos\Sat.Recruitment\Bussines\Infractrusture\MappingProfile.cs
	namespace		 	
Bussines		
 
.		 
Infractrusture		 !
{

 
class 	
MappingProfile
 
: 
Profile "
{ 
public 
MappingProfile 
( 
) 
{ 	
	CreateMap 
< 
UserRequest !
,! "
UserDTO# *
>* +
(+ ,
), -
;- .
	CreateMap 
< 
UserDTO 
, 
UserResponse +
>+ ,
(, -
)- .
;. /
} 	
} 
}  
[C:\Users\nsepulveda\source\repos\Sat.Recruitment\Bussines\Infractrusture\StringValidator.cs
	namespace 	
Bussines
 
{ 
public 

class 
StringValidator  
{ 
public			 
static		 
String		 
NormalizeEmail		 ,
(		, -
String		- 3
email		4 9
)		9 :
{

 	
var 
aux 
= 
email 
. 
Split !
(! "
new" %
char& *
[* +
]+ ,
{- .
$char/ 2
}3 4
,4 5
StringSplitOptions6 H
.H I
RemoveEmptyEntriesI [
)[ \
;\ ]
var 
atIndex 
= 
aux 
[ 
$num 
]  
.  !
IndexOf! (
(( )
$str) ,
,, -
StringComparison. >
.> ?
Ordinal? F
)F G
;G H
aux 
[ 
$num 
] 
= 
atIndex 
< 
$num  
?! "
aux# &
[& '
$num' (
]( )
.) *
Replace* 1
(1 2
$str2 5
,5 6
$str7 9
)9 :
:; <
aux= @
[@ A
$numA B
]B C
.C D
ReplaceD K
(K L
$strL O
,O P
$strQ S
)S T
.T U
RemoveU [
([ \
atIndex\ c
)c d
;d e
return 
string 
. 
Join 
( 
$str "
," #
new$ '
string( .
[. /
]/ 0
{1 2
aux3 6
[6 7
$num7 8
]8 9
,9 :
aux; >
[> ?
$num? @
]@ A
}B C
)C D
;D E
} 	
} 
} ı
RC:\Users\nsepulveda\source\repos\Sat.Recruitment\Bussines\Services\IUserService.cs
	namespace 	
Bussines
 
. 
Services 
{ 
public		 	
	interface		
 
IUserService		  
{

 
public 
Domain 
. 
Models 
. 
User 
MapDto  &
(& '
UserDTO' .
user/ 3
)3 4
;4 5
} 
} §
JC:\Users\nsepulveda\source\repos\Sat.Recruitment\Bussines\Services\User.cs
	namespace 	
Bussines
 
. 
Services 
{ 
public 
class
 
User 
: 
IUserService #
{		 
public

 
Domain

 
.

 
Models

 
.

 
User

 !
MapDto

" (
(

( )
UserDTO

) 0
user

1 5
)

5 6
{ 	
var 
factory 
= 
new 
FactoryUser )
() *
)* +
;+ ,
Domain 
. 
Models 
. 
User 
	nuevoUser (
=) *
new+ .
Domain/ 5
.5 6
Models6 <
.< =
User= A
(A B
)B C
{ 
Name 
= 
user 
. 
Name  
,  !
Email 
= 
StringValidator '
.' (
NormalizeEmail( 6
(6 7
user7 ;
.; <
Email< A
)A B
,B C
Address 
= 
user 
. 
Address &
,& '
Phone 
= 
user 
. 
Phone "
," #
UserType 
= 
user 
.  
UserType  (
,( )
Money 
= 
user 
. 
Money "
} 
; 
	nuevoUser 
. 
Money 
= 
factory %
.% &$
GetMoneyCalculatedByUser& >
(> ?
	nuevoUser? H
)H I
;I J
return 
	nuevoUser 
; 
} 	
} 
} ±	
cC:\Users\nsepulveda\source\repos\Sat.Recruitment\Bussines\Strategy\Concretes\NormalUserCalculate.cs
	namespace 	
Bussines
 
. 
Strategy 
. 
	Concretes %
{ 
class 	
NormalUserCalculate
 
: 
IStrategyCalculate  2
{		 
public

 
double

 
GetPercentage

 #
(

# $
decimal

$ +
moneyToCalculate

, <
)

< =
{ 	
var 

percentage 
= 
$num  
;  !
if 
( 
moneyToCalculate  
>! "
$num# &
)& '
{ 

percentage 
= 
$num !
;! "
} 
if 
( 
moneyToCalculate  
<! "
$num# &
&&' )
moneyToCalculate* :
>; <
$num= ?
)? @
{ 

percentage 
= 
$num  
;  !
} 
return 

percentage 
; 
} 	
} 
} Î
dC:\Users\nsepulveda\source\repos\Sat.Recruitment\Bussines\Strategy\Concretes\PremiumUserCalculate.cs
	namespace 	
Bussines
 
. 
Strategy 
{ 
class 	 
PremiumUserCalculate
 
:  
IStrategyCalculate! 3
{ 
public		 
double		 
GetPercentage		 #
(		# $
decimal		$ +
moneyToCalculate		, <
)		< =
{

 	
var 

percentage 
= 
$num 
; 
if 
( 
moneyToCalculate  
>! "
$num# &
)& '
{ 

percentage 
= 
$num 
; 
} 
return 

percentage 
; 
} 	
} 
} ç
bC:\Users\nsepulveda\source\repos\Sat.Recruitment\Bussines\Strategy\Concretes\SuperUserCalculate.cs
	namespace 	
Bussines
 
. 
Strategy 
. 
	Concretes %
{ 
class 	
SuperUserCalculate
 
: 
IStrategyCalculate 1
{ 
public		 
double		 
GetPercentage		 #
(		# $
decimal		$ +
moneyToCalculate		, <
)		< =
{

 	
var 

percentage 
= 
$num  
;  !
if 
( 
moneyToCalculate  
>! "
$num# &
)& '
{ 

percentage 
= 
$num !
;! "
} 
return 

percentage 
; 
} 	
} 
} –
XC:\Users\nsepulveda\source\repos\Sat.Recruitment\Bussines\Strategy\IStrategyCalculate.cs
	namespace 	
Bussines
 
. 
Strategy 
{ 
public 
	interface
 
IStrategyCalculate &
{ 
public

 
double

 
GetPercentage

 "
(

" #
decimal

# *
moneyToCalculate

+ ;
)

; <
;

< =
} 
} 