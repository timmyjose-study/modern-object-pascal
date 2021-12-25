{$mode objfpc}{$H+}{$J-}

program ClassMethodsDemo(output);
uses SysUtils;

type
  TMyClass = class
      MyInt: Integer;
      MyCount: Integer; static;

      constructor Create;
      procedure ShowMyInt;
      class procedure ShowCount;
    end;

constructor TMyClass.Create;
begin
  TMyClass.MyCount := TMyClass.MyCount + 1
end;

procedure TMyClass.ShowMyInt;
begin
  WriteLn(Format('MyInt is %d', [MyInt]))
end;

class procedure TMyClass.ShowCount;
begin
  WriteLn(Format('Number of instances created = %d', [TMyClass.MyCount]))
end;

var
  C1, C2: TMyClass;

begin
  try
    C1 := TMyClass.Create;
    C1.MyInt := 42;
    WriteLn('C1 = ', C1.MyInt);
    TMyClass.ShowCount;

    C2 := TMyClass.Create;
    C2.MyInt := 21;
    TMyClass.ShowCount
  finally
    FreeAndNil(C1);
    FreeAndNil(C2)
  end
end.
