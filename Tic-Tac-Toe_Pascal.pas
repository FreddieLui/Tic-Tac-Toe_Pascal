uses sysutils, crt;

Var status :   array[1..3,1..3] Of char;
    player :   integer;
    //p0_p1
    x1, y1 :   integer;
    //current position
    f :   text;
    playno :   integer;
    key :   char;

type
a = array[1..3,1..3] of char;

Procedure writefile(f:text);
var i,j : integer;
Begin
    assign(f, inttostr(playno) + '.txt');
    rewrite(f);
    for i := 1 to 3 do
    begin for j := 1 to 3 do
    writeln(status[i,j]);
    end;

End;


Function wincheck(status:a) :   boolean;
Begin
    If (status[1,1] = status[1,2]) And (status[1,2]= status[1,3]) Then
        wincheck := true
    Else If (status[2,1] = status[2,2]) And (status[2,2]= status[2,3]) Then
             wincheck := true
    Else If (status[3,1] = status[3,2]) And (status[3,2]= status[3,3]) Then
             wincheck := true
    Else If (status[1,1] = status[2,1]) And (status[2,1]= status[3,1])Then
             wincheck := true
    Else If (status[1,2] = status[2,2]) And (status[2,2]= status[3,2])Then
             wincheck := true
    Else If (status[1,3] = status[2,3]) And (status[2,3]= status[3,3])Then
             wincheck := true
    Else If (status[1,1] = status[2,2]) And (status[2,2]= status[3,3])Then
             wincheck := true
    Else If (status[3,1] = status[2,2]) And (status[2,2]= status[1,3])
             Then wincheck := true;
End;

Procedure switchplayer(player:integer);
Begin
If player = 0 Then begin player := 1;
                             key := 'X'; end
Else If player = 1 Then begin player := 0;
key := 'O'; end
End;

Procedure writeboard;
var i,j : integer;

Begin
    For i := 1 To 3 Do
        Begin
            For j := 1 To 3 Do
                Begin
                    Write('|',status[i,j],'|');
                End;
            writeln('_____________');
        End;
End;

Function select(x1,y1:integer): a ;
var k : char;

//missing x1y1 initialization,range
Begin
    Repeat
      k := ord(readkey);
        //ord value #
        If k = 'A' Then x1 := x1-1
        Else
            If k = 'D' Then x1 := x1+1
        Else
            If k = 'W' Then y1 := y1+1
        Else
            If readkey = 'S' Then y1 := y1-1;
    Until readkey = #10;
          select[1,1]:= [x1,y1] ;

End;

//MAIN
Begin
    writeln('THE TIC TAC TOE GAME');
    readln();
    wincheck := false;
    While wincheck = false Do
        Begin
            writeboard;
            select;
            gotoxy(select);
            If status(select) = '' Then
                write(key);
            wincheck;
            switchplayer;
        End;

    While wincheck= true Do
        Begin
            writeln(player,'WINS');
            writefile;
            readln;
            clrscr;
            wincheck := false;

        End;
    readln;
End.
