{$mode objfpc}{$H+}{$J-}

program PropDemo(output);
uses SysUtils;

type
  TMyClass = class
    MyInt: Integer;
    MyString: String;

    property MyIntProperty: Integer read MyInt write MyInt;
    property MyStringProperty: String read MyString write MyString;

    procedure MyMethod;
  end;

procedure TMyClass.MyMethod;
begin
  WriteLn(MyInt + 10);
  WriteLn(MyString)
end;

var
  O: TMyClass;

begin
  try
    O := TMyClass.Create;
    O.MyInt := 42;
    O.MyString := 'Hello';
    O.MyMethod
  finally
    FreeAndNil(O)
  end
end.