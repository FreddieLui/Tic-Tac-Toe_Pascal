
Uses sysutils, crt;

Var status :   array[1..3,1..3] Of char;
    player :   integer;
    x1, y1 :   integer;
    //current position
    f :   text;
    playno :   integer;
    key :   char;

Type 
    a =   array[1..3,1..3] Of char;

Procedure writefile(f:text);

Var i,j :   integer;
Begin
    assign(f, inttostr(playno) + '.txt');
    rewrite(f);
    For i := 1 To 3 Do
        Begin
            For j := 1 To 3 Do
                writeln(status[i,j]);
        End;
    close(f);

End;

procedure resetboard(params;
begin
    Var i:   char;

Begin
    For i := a to z do begin
    
        End;
End;

end;


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
    If player = 0 Then
        Begin
            player := 1;
            key := 'X';
        End
    Else If player = 1 Then
             Begin
                 player := 0;
                 key := 'O';
             End
End;

Procedure writeboard;

Var i,j :   integer;

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

Function select(x1,y1:integer):   a ;

Var k :   char;

    //missing x1y1 initialization,range
Begin
    Repeat
        k := ord(readkey);
        //ord value #
        While ((x1>1) And (x1<3)) and ((y1>1) And (y1<3)) Do
            Begin
                If k = 'A' Then x1 := x1-1
                Else
                    If k = 'D' Then x1 := x1+1
                Else
                    If k = 'W' Then y1 := y1+1
                Else
                    If readkey = 'S' Then y1 := y1-1;
            End
    Until readkey = #10;
    select[1,1] := [x1,y1] ;

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
                write(key,status(select));
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
    
    While movecnt = 9 then 
     writeln('TIE');

    readln;
End.
