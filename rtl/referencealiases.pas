{$mode objfpc}{$H+}{$J-}

program ReferenceAliases(output);
uses SysUtils;

type
  TMyClass = class
      Value: Integer
    end;

var
  C, C2: TMyClass;

begin
  try
    C := TMyClass.Create;
    C.Value := 12345;

    C2 := C; // this simply copies the reference, aliasing it

    WriteLn(C.Value, '  ', C2.Value)
  finally
    FreeAndNil(C)
    //FreeAndNil(C2) // so this would be a double free
  end
end.
