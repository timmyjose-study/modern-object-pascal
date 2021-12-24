{$mode objfpc}{$H+}{$J-}

program InheritanceCloningDemo(output);
uses SysUtils, Classes;

type
  TMyClass = class(TPersistent)
      public
        MyInt: Integer;
        procedure Assign(Source: TPersistent); override;
    end;

  TMySubclass = class(TMyClass) 
      public
        MyString: String;
        procedure Assign(Source: TPersistent); override;
    end;

procedure TMyClass.Assign(Source: TPersistent);
begin
  if Source is TMyClass then
    MyInt := (Source as TMyClass).MyInt
  else
    inherited Assign(Source)
end;

procedure TMySubclass.Assign(Source: TPersistent);
begin
  if Source is TMySubclass then
    MyString := (Source as TMySubclass).MyString;

  inherited Assign(Source)
end;

var
  C1, C2: TMyClass;
  S1, S2: TMySubclass;

begin
  C1 := TMyClass.Create;
  C2 := TMyClass.Create;

  try
    C1.MyInt := 42;
    C2.Assign(C1);
    WriteLn('[C1] MyInt = ', C1.MyInt);
    WriteLn('[C2] MyInt = ', C2.MyInt)
  finally
    FreeAndNil(C1);
    FreeAndNil(C2)
  end;

  S1 := TMySubclass.Create;
  S2 := TMySubclass.Create;

  try
    S1.MyInt := 1; // hence the `inherited` in TMySubclass.Assign
    S1.MyString := 'Hello';
    S2.Assign(S1);
    WriteLn('[S1] MyInt = ', S1.MyInt, ', MyString = ', S1.MyString);
    WriteLn('[S2] MyInt = ', S2.MyInt, ', MyString = ', S2.MyString)
  finally
    FreeAndNil(S1);
    FreeAndNil(S2)
  end
end.
