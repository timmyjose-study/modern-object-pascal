{$mode objfpc}{$H+}{$J-}

program ClassrefDemo;
uses SysUtils, Classes;

type
  TMyClass = class(TComponent)
    end;

  TMyClass1 = class(TMyClass)
    end;

  TMyClass2 = class(TMyClass)
    end;

  TMyClassRef = class of TMyClass;

var
  C: TMyClass;
  CRef: TMyClassRef;

begin
  C := TMyClass.Create(nil);
  FreeAndNil(C);

  C := TMyClass1.Create(nil);
  FreeAndNil(C);

  C := TMyClass1.Create(nil);
  FreeAndNil(C);

  { we can also do this - basically `TClassRef` can have a reference to `TMyClass` or any of its subclasses, at runtime }
  CRef := TMyClass;
  C := CRef.Create(nil);
  FreeAndNil(C);

  CRef := TMyClass1;
  C := CRef.Create(nil);
  FreeAndNil(C);

  CRef := TMyClass2;
  C := CRef.Create(nil);
  FreeAndNil(C)
end.
