{$mode objfpc}{$H+}{$J-}
{$R+} 

program LoopsDemo(output);
type
  TMyColours = (Red, Blue, Green, Yellow, Orange, Fuchsia, Chartreuse);

  TColours = set of TMyColours;

var
  Arr: array[1..10] of Integer;
  I: Integer;
  C: TMyColours;
  Colours: TColours;

begin

  for I :=  1 to 10 do 
    Arr[I] := I * I;

  for I := 1 to 10 do
    Write(Arr[I], ' ');
  WriteLn;

  for I := Low(Arr) to High(Arr) do
    Write(Arr[I], ' ');
  WriteLn;

  I := 1;
  while I <= 10 do
    begin
      Write(Arr[I],  ' ');
      Inc(I)
    end;
  WriteLn;

  I := 1;
  repeat
    Write(Arr[I], ' ');
    Inc(I)
  until I > 10;
  WriteLn;

  // this iterates over the value, not the indices
  for I in Arr do
    Write(I, ' ');
  WriteLn;

  for C in TMyColours do
    Write(C, ' ');
  WriteLn;

  Colours := [Yellow, Chartreuse];
  for C in Colours do
    Write(C, ' ');
  WriteLn
end.