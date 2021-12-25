{$mode objfpc}{$H+}{$J-}

program NestedClassesDemo(output);
uses SysUtils;

type
  TMyClass = class
    private
      type
        TMyInternalClass = class
            Velocity: Single;
            procedure DoSomething;
          end;

      var
        FInternalClass: TMyInternalClass;
    public
      const
        DefaultVelocity = 100.0;

      constructor Create;
      destructor Destroy; override;

      procedure DoSomething;
  end;

constructor TMyClass.Create;
begin
  inherited;
  FInternalClass := TMyInternalClass.Create;
  FInternalClass.Velocity := DefaultVelocity
end;

destructor TMyClass.Destroy;
begin
  FreeAndNil(FInternalClass);
  inherited
end;

procedure TMyClass.DoSomething;
begin
  FInternalClass.DoSomething
end;

procedure TMyClass.TMyInternalClass.DoSomething;
begin
  WriteLn(Format('The current velocity is %.2f', [Velocity]))
end;

var
  C: TMyClass;

begin
  try
    C := TMyClass.Create;
    C.DoSomething
  finally
    FreeAndNil(C)
  end
end.