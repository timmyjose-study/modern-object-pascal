{$mode objfpc}{$H+}{$J-}

program NoMemLeaksConstructor;
uses SysUtils;

type
  TGun = class
  end;

  TPlayer = class
    Gun1, Gun2: TGun;

    constructor Create;
    destructor Destroy; override;
  end;

constructor TPlayer.Create;
begin
  inherited;
  Gun1 := TGun.Create;
  raise Exception.Create('Raising an exception in TPlayer.Create');
  Gun2 := TGun.Create
end;

destructor TPlayer.Destroy;
begin
  FreeAndNil(Gun1);
  FreeAndNil(Gun2);
  inherited
end;

var
  P: TPlayer;

begin
  try
    try
      P := TPlayer.Create;
    except
      on E:Exception do
        WriteLn('Caught an exception - ', E.Message)
    end
  finally
    { not required in this case since construction does not happen, but in general, yes }
    FreeAndNil(P)
  end
end.