{$mode objfpc}{$H+}{$J-}

program FreeAndNilDemo(output);
uses SysUtils;

type
  TGun = class
  end;

  TPlayer = class
    Gun1, Gun2, Gun3: TGun;

    constructor Create;
    destructor Destroy; override;

    procedure PlayGame;
  end;

constructor TPlayer.Create;
begin
  inherited;
  Gun1 := TGun.Create;
  Gun2 := TGun.Create;
  Gun3 := TGun.Create
end;

destructor TPlayer.Destroy;
begin
  FreeAndNil(Gun1);
  FreeAndNil(Gun2);
  FreeAndNil(Gun3);
  inherited
end;

procedure TPlayer.PlayGame;
begin
  WriteLn('Playing game')
end;

var
  Player: TPlayer;

begin
  try
    Player := TPlayer.Create;
    Player.PlayGame
  finally
    FreeAndNil(Player)
  end
end.