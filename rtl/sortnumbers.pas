{$mode objfpc}{$H+}{$J-}

program SortNumbers(input, output);
uses SysUtils, Generics.Defaults, Generics.Collections;

type
  TIntWrapper = class
      Value: Integer;
      constructor Create(N: Integer);
    end;

  TIntegerList = specialize TObjectList<TIntWrapper>;
  TIntegerComparer = specialize TComparer<TIntWrapper>;

constructor TIntWrapper.Create(N: Integer);
begin
  Value := N
end;

procedure ReadNums(var Nums: TIntegerList; N: Integer);
var
  I, D: Integer;
begin
  for I := 0 to N-1 do
    begin
      Read(D);
      Nums.Add(TIntWrapper.Create(D))
    end
end;

procedure ShowNums(constref Nums: TIntegerList);
var
  D: TIntWrapper;
begin
  for D in Nums do
    Write(D.Value, ' ');
  WriteLn
end;

function CompareAscending(constref N1, N2: TIntWrapper): Integer;
begin
  if N1.Value < N2.Value then
    Result := -1
  else if N1.Value > N2.Value then
    Result := 1
  else
    Result := 0
end;

function CompareDescending(constref N1, N2: TIntWrapper): Integer;
begin
  if N1.Value < N2.Value then 
    Result := 1
  else if N1.Value > N2.Value then
    Result := -1
  else
    Result := 0
end;

var
  N: Integer;
  Nums: TIntegerList;

begin
  ReadLn(N);

  try
    Nums := TIntegerList.Create(true);
    ReadNums(Nums, N);
    
    WriteLn('Before sorting...');
    ShowNums(Nums);
    WriteLn;

    Nums.Sort(TIntegerComparer.Construct(@CompareAscending));
    WriteLn('After sortingin ascending order...');
    ShowNums(Nums);
    WriteLn;

    Nums.Sort(TIntegerComparer.Construct(@CompareDescending));
    WriteLn('After sorting in descending order...');
    ShowNums(Nums)
  finally
    FreeAndNil(Nums)
  end
end.
