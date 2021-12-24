{$mode objfpc}{$H+}{$J-}

program SortingGenericApples(output);
uses SysUtils, Generics.Defaults, Generics.Collections;

type
  TApple = class
      Name: String;
      constructor Create(N: String);
    end;

  TAppleList = specialize TObjectList<TApple>;

  TAppleComparer = specialize TComparer<TApple>;

constructor TApple.Create(N: String);
begin
  Name := N
end;

procedure ShowApples(constref Apples: TAppleList);
var
  A: TApple;
begin
  for A in Apples do
    WriteLn(A.Name)
end;

function CompareApples(constref Left, Right: TApple): Integer;
begin
  Result := AnsiCompareStr(Left.Name, Right.Name)
end;

var
  Apples: TAppleList;

begin
  try
    Apples := TAppleList.Create(true);
    Apples.Add(TApple.Create('Cameo'));
    Apples.Add(TApple.Create('Empire'));
    Apples.Add(TApple.Create('McIntosh'));
    Apples.Add(TApple.Create('Fuji'));
    Apples.Add(TApple.Create('Cortland'));
    Apples.Add(TApple.Create('Jonagold'));

    WriteLn('Before sorting...');
    ShowApples(Apples);

    WriteLn;

    { this constructs an IComparer instance }
    Apples.Sort(TAppleComparer.Construct(@CompareApples));

    WriteLn('After sorting...');
    ShowApples(Apples)
  finally
    FreeAndNil(Apples)
  end
end.
