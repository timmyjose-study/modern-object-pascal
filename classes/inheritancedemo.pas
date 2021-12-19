{$mode objfpc}{$H+}{$J-}

program InheritanceDemo(output);
uses SysUtils;

type
  TMyClass = class
    MyInt: Integer; // default 0
    property MyIntProperty: Integer read MyInt write MyInt;
    procedure MyVirtualMethod; virtual;
  end;

  TMyDerivedClass = class(TMyClass)
    procedure MyVirtualMethod; override;
  end;

procedure TMyClass.MyVirtualMethod;
begin
  WriteLn('[TMyClass.MyVirtualMethod] MyInt + 10 = ', MyInt + 10)
end;

procedure TMYDerivedClass.MyVirtualMethod;
begin
  WriteLn('[TMyDerivedClass.MyVirtualMethod] MyInt + 20 = ', MyInt + 20)
end;

var
  O: TMyClass;

begin
  try
    O := TMyClass.Create;
    O.MyVirtualMethod
  finally
    FreeAndNil(O)
  end;

  try
    O := TMyDerivedClass.Create;
    O.MyVirtualMethod
  finally
    FreeAndNil(O)
  end
end.
