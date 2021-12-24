{$mode objfpc}{$H+}{$J-}

{ `constref` appears to behave pretty much as `const` in C++ }
program ConstrefDemo(output);
uses SysUtils;

type
  TMyClass = class
      Name: String;
      constructor Create(N: String);
    end;

constructor TMyClass.Create(N: String);
begin
  Name := N
end;

procedure DoSomethingWithMyClass(C: TMyClass);
begin
  { this is fine as well, but only changes the local value of `C` }
  //C := TMyClass.Create('An-nyong');
  C.Name := C.Name + '1'
end;

procedure DoSomethingWithMyClassAgain(var C: TMyClass);
begin
  { this is fine for `var` }
  //C := TMyClass.Create('Privet');
  C.Name := C.Name + '2'
end;

procedure DoSomethingWithMyClassYetAgain(constref C: TMyClass);
begin
  { this doesn't work due to the constref }
  //C := TMyClass.Create('Hola');
  C.Name := C.Name + '3'
end;

var
  C: TMyClass;

begin
  try
    C := TMyClass.Create('Name');

    DoSomethingWithMyClass(C);
    WriteLn(C.Name);

    DoSomethingWithMyClassAgain(C);
    WriteLn(C.Name);

    DoSomethingWithMyClassYetAgain(C);
    WriteLn(C.Name)
  finally
    FreeAndNil(C)
  end
end.
