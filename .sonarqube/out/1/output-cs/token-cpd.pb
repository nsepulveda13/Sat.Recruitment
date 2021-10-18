Ô
LC:\Users\nsepulveda\source\repos\Sat.Recruitment\Access\Access\IQueryUser.cs
	namespace 	
Data
 
. 
Access 
{ 
public		 

	interface		 

IQueryUser		 
{

 
Task 
< 
IEnumerable 
< 
User 
> 
> 
GetUsersAsync  -
(- .
). /
;/ 0
} 
} ú
KC:\Users\nsepulveda\source\repos\Sat.Recruitment\Access\Access\QueryUser.cs
	namespace 	
Data
 
. 
Access 
{ 
public		 

class		 
	QueryUser		 
:		 

IQueryUser		 '
{

 
public 
async 
Task 
< 
IEnumerable %
<% &
User& *
>* +
>+ ,
GetUsersAsync- :
(: ;
); <
{ 	
var 
users 
= 
new 
List  
<  !
User! %
>% &
(& '
)' (
;( )
using 
( 
var 

readerUser !
=" #
new$ '
FileReaderUser( 6
(6 7
)7 8
.8 9
GetStreamReaderUser9 L
(L M
)M N
)N O
{ 
string 
line 
; 
while 
( 
( 
line 
= 
await $

readerUser% /
./ 0
ReadLineAsync0 =
(= >
)> ?
)? @
!=A C
nullD H
)H I
{ 
var 
lineSeparated %
=& '
line( ,
., -
Split- 2
(2 3
$char3 6
)6 7
;7 8
var 
	userToAdd !
=" #
new$ '
User( ,
{ 
Name 
= 
lineSeparated ,
[, -
$num- .
]. /
,/ 0
Email 
= 
lineSeparated  -
[- .
$num. /
]/ 0
,0 1
Phone 
= 
lineSeparated  -
[- .
$num. /
]/ 0
,0 1
Address 
=  !
lineSeparated" /
[/ 0
$num0 1
]1 2
,2 3
UserType  
=! "
lineSeparated# 0
[0 1
$num1 2
]2 3
,3 4
Money 
= 
decimal  '
.' (
Parse( -
(- .
lineSeparated. ;
[; <
$num< =
]= >
)> ?
,? @
} 
; 
users 
. 
Add 
( 
	userToAdd '
)' (
;( )
} 
} 
return   
users   
;   
}!! 	
}## 
}$$ «
NC:\Users\nsepulveda\source\repos\Sat.Recruitment\Access\DependencyInjection.cs
	namespace 	
Data
 
{ 
public		 

static		 
class		 
DependencyInjection		 +
{

 
public 
static 
void 
AddRepositories *
(* +
this+ /
IServiceCollection0 B
servicesC K
)K L
{ 	
services 
. 
	AddScoped 
< 

IQueryUser )
,) *
	QueryUser+ 4
>4 5
(5 6
)6 7
;7 8
} 	
} 
} ë
TC:\Users\nsepulveda\source\repos\Sat.Recruitment\Access\FileReader\FileReaderUser.cs
	namespace 	
Data
 
. 

FileReader 
{ 
public 

class 
FileReaderUser 
{ 
private 
const 
string 
PathFileUsers *
=+ ,
$str- ?
;? @
public		 
StreamReader		 
GetStreamReaderUser		 /
(		/ 0
)		0 1
{

 	
var 
path 
= 
	Directory  
.  !
GetCurrentDirectory! 4
(4 5
)5 6
+7 8
PathFileUsers9 F
;F G
var 

fileStream 
= 
new  

FileStream! +
(+ ,
path, 0
,0 1
FileMode2 :
.: ;
Open; ?
)? @
;@ A
return 
new 
StreamReader #
(# $

fileStream$ .
). /
;/ 0
} 	
} 
} 