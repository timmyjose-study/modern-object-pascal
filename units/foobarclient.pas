{$mode objfpc}{$H+}{$J-}

program FooBarClient(output);
uses SysUtils, FooUnit, BarUnit;

var
  Q1: Quux; // Bar.Quux
  Q2: FooUnit.Quux;
  Q3: BarUnit.Quux;

begin
  try
    Q1 := Quux.Create;
    Q1.DoSomething;

    Q2 := FooUnit.Quux.Create;
    Q2.DoSomething;

    Q3 := BarUnit.Quux.Create;
    Q3.DoSomething
  finally
    FreeAndNil(Q1);
    FreeAndNil(Q2);
    FreeAndNil(Q3)
  end
end.
