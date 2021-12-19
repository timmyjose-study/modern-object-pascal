{$mode objfpc}{$H}{$J-}

unit BarUnit;

interface

type
  Quux = class
    procedure DoSomething;
  end;

implementation

procedure Quux.DoSomething;
begin
  WriteLn('[BarUnit.Quux] Did something')
end;
end.
