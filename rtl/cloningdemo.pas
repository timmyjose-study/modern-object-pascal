{$mode objfpc}{$H+}{$J-}

program CloningDemo(input, output);
uses SysUtils, Classes;

type
  generic TMyClass<T> = class(TPersistent)
    public
      Value: T;

      constructor Create;
      constructor Create(V: T);

      procedure Assign(Source: TPersistent); override;
    end;

  TMyIntClass = specialize TMyClass<Integer>;
  TMyStringClass = specialize TMyClass<String>;

constructor TMyClass.Create;
begin
end;

constructor TMyClass.Create(V: T);
begin
  Value := V
end;

procedure TMyClass.Assign(Source: TPersistent);
begin
  if Source is TMyClass then
    Value := (Source as TMyClass).Value
end;

var
  N: Integer;
  S: String;
  C1, C11: TMyIntClass;
  C2, C22: TMyStringClass;

begin
  try
    ReadLn(N);
    C1 := TMyIntClass.Create(N);
    C11 := TMyIntClass.Create;
    C11.Assign(C1);
    WriteLn('C1 = ', C1.Value, ', C11 = ', C11.Value);
    WriteLn;

    ReadLn(S);
    C2 := TMyStringClass.Create(S);
    C22 := TMyStringClass.Create;
    C22.Assign(C2);
    WriteLn('C2 = ', C2.Value, ', C22 = ', C22.Value);
    WriteLn
  finally
    FreeAndNil(C1);
    FreeAndNil(C11);
    FreeAndNil(C2);
    FreeAndNil(C22)
  end
end.
