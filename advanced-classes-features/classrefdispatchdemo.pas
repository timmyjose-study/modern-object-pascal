{$mode objfpc}{$H+}{$J-}

program ClassrefDispatchDemo(output);
uses SysUtils, Classes;

type
  TMyClass = class(TComponent)
      class procedure DoSomething; virtual; abstract;
    end;

  TMyClass1 = class(TMyClass)
      class procedure DoSomething; override;
    end;

  TMyClass2 = class(TMyClass)
      class procedure DoSomething; override;
    end;

  TMyClassRef = class of TMyClass;

class procedure TMyClass1.DoSomething;
begin
  WriteLn('Hola from TMyClass1')
end;

class procedure TMyClass2.DoSomething;
begin
  WriteLn('Hello from TMyClass2')
end;

var
  CRef: TMyClassRef;

begin
  CRef := TMyClass1;
  CRef.DoSomething;

  CRef := TMyClass2;
  CRef.DoSomething;

  { this will cause a runtime exception since the method is abstract }
  //CRef := TMyClass;
  //CRef.DoSomething
end.

