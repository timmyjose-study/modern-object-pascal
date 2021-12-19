{$mode objfpc}{$H+}{$J-}

program CallingSelfMethod(output);
uses SysUtils;

type
  TMyClass1 = class
    procedure MyMethod;
  end;

  TMyClass2 = class(TMyClass1)
    procedure MyMethod;
    procedure MySecondMethod;
  end;

procedure TMyClass1.MyMethod;
begin
  WriteLn('TMyclass1.MyMethod')
end;

procedure TMyClass2.MyMethod;
begin
  WriteLn('TMyClass2.MyMethod')
end;

procedure TMyClass2.MySecondMethod;
begin
  WriteLn('TMyClass2.MySecondMethod calling...');
  MyMethod // this calls TMyClass2.MyMethod, naturally
end;

var
  O1: TMyClass1;
  O2: TMyClass2;

begin
  O1 := TMyClass1.Create;
  O2 := TMyClass2.Create;

  try
    O1.MyMethod;
    O2.MyMethod;
    O2.MySecondMethod
  finally
    FreeAndNil(O1);
    FreeAndNil(O2)
  end
end.
