{$mode objfpc}{$H+}{$J-}

program ListOfOperatorOverloadedClasses(input, output);
uses SysUtils, FGL;

type
  TMyClass = class
    MyInt: Integer;
    constructor Create(const N: Integer);
  end;

  TMyClassList = specialize TFPGList<TMyClass>; // owned type
  // TMyClassList = specialize TFPGObjectList<TMyClass>; // owned type

constructor TMyClass.Create(const N: Integer);
begin
  MyInt := N
end;

procedure ReadList(const N: Integer; var L: TMyClassList);
var
  I, D: Integer;
  C: TMyClass;
begin
  for I := 1 to N do
    begin
      Write('Enter integer for class ', I, ': ');
      ReadLn(D);
      C := TMyClass.Create(D);
      L.Add(C)
    end
end;

procedure ProcessList(const L: TMyClassList);
var
  C: TMyClass;
  S: Integer = 0;
begin
  for C in L do
    Write(Format('%d ', [C.MyInt]));
  WriteLn;

  for C in L do
    S := S + C.MyInt;

  WriteLn('Sum of classes = ', S)
end;

// This function is needed sinc TFPGList is not an owning type. 
// For an owning type such as TFPGObjectList, this is redundant,
// and simply freeing the list object will free its components
procedure FreeAndNilList(var L: TMyClassList);
var
  R, S: TMyClass;
begin
  for R in L do
    begin
      S := R;
      FreeAndNil(S)
    end;
  FreeAndNil(L)
end;

var
  N: Integer;
  List: TMyClassList;

begin
  List := TMyClassList.Create;
  try
    ReadLn(N);
    ReadList(N, List);
    ProcessList(List)
  finally
    FreeAndNilList(List)
    //FreeAndNil(List)
  end
end.
