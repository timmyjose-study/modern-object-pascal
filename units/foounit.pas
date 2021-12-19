{$mode objfpc}{$H+}{$J-}

unit FooUnit;

interface

type 
  Quux = class
    procedure DoSomething;
  end;

implementation

procedure Quux.DoSomething;
begin
  WriteLn('[FooUnit.Quux] Did something')
end;
end.
