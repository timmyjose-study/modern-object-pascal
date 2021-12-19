{$mode objfpc}{$H+}{$J-}

program CastingDemo(output);
uses SysUtils;

type
  TMyBaseClass = class
    procedure MyBaseMethod;
  end;

  TMyDerivedClass = class(TMyBaseClass)
    procedure MyDerivedMethod;
  end;

procedure TMyBaseClass.MyBaseMethod;
begin
  WriteLn('TMyBaseClass.MyBaseMethod invoked')
end;

procedure TMyDerivedClass.MyDerivedMethod;
begin
  WriteLn('TMYDerivedClass.MyDerivedMethod invoked')
end;

var
  B: TMyBaseClass;
  D: TMyDerivedClass;

begin
  try
    D := TMyDerivedClass.Create;
    D.MyBaseMethod;
    D.MyDerivedMethod;

    B := D;
    B.MyBaseMethod;
    // this is a compile-time error
    //B.MyDerivedMethod
    
    if B is TMyDerivedClass then
      (B as TMyDerivedClass).MyDerivedMethod;

    // same, but faster, but only safe when we know for sure that the type is correct
    if B is TMYDerivedClass then
      TMYDerivedClass(B).MyDerivedMethod
  finally
    FreeAndNil(D)
  end;

  try
    B := TMyBaseClass.Create;
    B.MyBaseMethod
  finally
    FreeAndNil(B)
  end
end.

