{$mode objfpc}{$H+}{$J-}

program ExceptionsDemo(output);
uses SysUtils;

type
  TMyClass = class
    procedure MyMethod;
  end;

procedure TMyClass.MyMethod;
var
  R: Real;
begin
  R := Random;
  WriteLn(Format('R = %f', [R]));

  if R > 0.5 then
    raise Exception.Create('Something awful happened')
end;

var
  O: TMyClass;

begin
  Randomize;

  O := TMyClass.Create;
  try
    try
      O.MyMethod
    except 
      on E:Exception do
        begin
          WriteLn('Error: ', E.Message);
          Exit
        end
    end
  finally
    FreeAndNil(O)
  end
end.
