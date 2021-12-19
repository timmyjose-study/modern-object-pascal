{$mode objfpc}{$H+}{$J-}
{$static ON}

program StaticMemberDemo(output);
uses SysUtils;

type
  TMyClass = class
    Num: Integer; static;
  public
    constructor Init;
  end;

constructor TMyClass.Init;
begin
  Num := Num + 1
end;

var
  O1, O2: TMyClass;

begin
  try
    O1 := TMyClass.Init;
    WriteLn('Num = ', TMyClass.Num);

    O2 := TMyClass.Init;
    WriteLn('Num = ', TMyClass.Num)
  finally
    FreeAndNil(O1);
    FreeAndNil(O2)
  end
end.
