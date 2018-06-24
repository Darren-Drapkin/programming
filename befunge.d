import std.stdio ;
import std.string ;
import std.math ;

auto scan_grid(ref int []stack, int[][]grid){
int x,y,a,v,xstep,ystep;
int XSIZE = 10;//************************* grid.something.length
int YSIZE =10;//***************************grid.somethingelse.length
for(x=0,xstep=1,ystep=0,y=0;grid[x][y]!='@';x+=xstep,y+=ystep){
	switch(grid[x][y]){
		case'>':xstep=1;ystep=0;break;
		case'<':xstep=-1;ystep=0;break;
		case'^':xstep=0;ystep=-1;break;
		case'v':xstep=0;ystep=1;break;

		case'#':x+=xstep;y+=ystep;break;
		case'_':{
			a=pop(stack);
			if(a==0){xstep=1;ystep=0;}
				else{xstep=-1;ystep=0;}
			break;}//move right if a ==0 else move left
		case'|':a=pop(stack);
			if(a==0){xstep=0;ystep=1;}
				else{xstep=0;ystep=-1;}
			break;//move down if a ==0 else move up

		case'@': return; break;

		default:push(int(grid[x][y]),stack);break;}

	if(x>XSIZE){x=0;}
	if(x<0){x=XSIZE;}
	if(y>YSIZE){y=0;}
	if(y<0){y=YSIZE;}}


return;}


auto push( int element, ref int[] stack)
{
stack=element~stack;
return;}

auto pop(ref int[] stack){
int a;
a= stack[0];
stack=stack[1..$];
return a;}



char itoa(int cell){
string ascii_list="abcdefghijklmnopqrstuvwxyz";

//*************************************convert cell to ascii for O/P
return ascii_list[cell];
}
 
 int main(string[] args){
 int[] stack;
 int[][]grid;
 int x;
 int y;
 int i;
 
 string prog1 = "32*81-*.@"; 
 string prog2 = "55+.55-.@";

"RPN demos in befunge".writeln;
 foreach(element;prog1){
	push(int(element),stack);}
writeln( "prog1 = ", prog1);
writeln("Executing");
foreach(element; prog1){
	 parse(element,stack,grid);}
foreach(element;prog2){
	push(int(element),stack);}
writeln( "prog2 = ", prog2);
writeln("Executing");
foreach(element; prog2){
	 parse(element,stack,grid);}
writeln("\nDone");

"2d example".writeln;
/+
// 2d parse and I/O

for(i=0;i<10;i++){
i.writeln;
grid[1][i]=int(prog1[i]);
grid[2][i]=int(prog2[i]);}
for(y=0;y<10;y++){
	for(x=0;x<10;x++){
		scan_grid(stack,grid);
		parse(grid[x][y],stack,grid);
		"current grid".writeln;
		//grid.writeln;
		"current stack".writeln;
		//stack.writeln;
		}}
+/
"come back later".writeln;
return 0 ;}
 
 auto parse(int input, ref int[] stack,int[][]grid){
 int a, b,x,y,v;
switch(input){
case'0': push(0,stack);break;
case'1': push(1,stack);break;
case'2': push(2,stack);break;
case'3': push(3,stack);break;
case'4': push(4,stack);break;
case'5': push(5,stack);break;
case'6': push(6,stack);break;
case'7': push(7,stack);break;
case'8': push(8,stack);break;
case'9': push(9,stack);break;

case '+': push((pop(stack)+pop(stack)), stack);break;
case '*': push((pop(stack)*pop(stack)), stack);break;
case '%': push((pop(stack)%pop(stack)), stack);break;/***************/

case '-': {a=pop(stack);b=pop(stack); push (b-a, stack);break;}
case '/': {a=pop(stack);b=pop(stack); push (b/a, stack);break;}
case':':{a=pop(stack);push(a,stack);push(a,stack);break;}
case'\\':{a=pop(stack);b=pop(stack);push(a,stack);push(b,stack);break;}
case'$':a=pop(stack);break;
case'.':{stack.pop.write;" ".write;break;}
case',':stack.pop.itoa.write;break;
case'@': return stack;break;

case'!':{a=pop(stack);push(((a==0)?1:0),stack);break;}
case'`':{a=pop(stack);b=pop(stack);push(((b>a)?1:0),stack);break;}

case'p':{y=pop(stack);x=pop(stack);v=pop(stack);grid[x][y]=v;break;}
	//grid output.. pop y x and v change cell at grid[x][y] to v
case'g':{y=pop(stack);x=pop(stack);push(grid[x][y],stack);break;}
	//grid input.. pop y pop x, push grid[x][y]

default: break;}
return stack;}