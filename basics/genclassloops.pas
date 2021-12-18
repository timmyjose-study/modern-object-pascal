{$mode objfpc}{$H+}{$J-}

program GenClassLoops(output);
uses SysUtils, FGL;

type
  TMyClass = class
    I, Square: Integer
  end;

  TMyClassList = specialize TFPGObjectList<TMyClass>;

var
  List: TMyClassList;
  C: TMyClass;
  I: Integer;

begin
  List := TMyClassList.Create(true); // true -> owns children
  try
    for I := 1 to 10 do
      begin
        C := TMyClass.Create;
        C.I := I;
        C.Square := I * I;
        List.Add(C)
      end;

    for C in List do
      WriteLn('Square of ', C.I, ' is ', C.Square)
  finally
    FreeAndNil(List)
  end
end.
