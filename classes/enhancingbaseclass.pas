{$mode objfpc}{$H+}{$J-}

program EnhancingBaseClass(output);
uses SysUtils;

type
  TMyClass1 = class
    constructor Create;
    procedure MyMethod(const A: Integer);
  end;

  TMyClass2 = class(TMyClass1)
    constructor Create;
    procedure MyMethod(const A: Integer);
  end;

constructor TMyClass1.Create;
begin
  inherited Create; // calls TObject.Create, not needed
  WriteLn('TMyClass1.Create')
end;

procedure TMyClass1.MyMethod(const A: Integer);
begin
  WriteLn('TMyClass1.MyMethod, A = ', A)
end;

constructor TMyClass2.Create;
begin
  inherited Create; // calls TMyClass1.Create
  WriteLn('TMyClass2.Create')
end;

procedure TMyClass2.MyMethod(const A: Integer);
begin
  inherited MyMethod(A); // calls TMyClass1.MyMethod
  WriteLn('TMyClass2.MyMethod, A = ', A)
end;

var
  O: TMyClass2;

begin
  try
    O := TMyClass2.Create;
    O.MyMethod(12345)
  finally
    FreeAndNil(O)
  end
end.
