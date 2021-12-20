{$mode objfpc}{$H+}{$J-}

program OwnershipDemo(output);
uses SysUtils, Classes, FGL;

type
  TGun = class
  end;

  TGunList = specialize TFPGObjectList<TGun>;

  TPlayer = class
    Guns: TGunList;
    Gun1, Gun2, Gun3: TGun;

    constructor Create;
    destructor Destroy; override;

    procedure PlayGame;
  end;

constructor TPlayer.Create;
begin
  // OwnsObject is true by default
  // so when the list is freed, the components are freed as well. Sort of like RAII.
  Guns := TGunList.Create(true);
  Gun1 := TGun.Create;
  Guns.Add(Gun1);

  Gun2 := TGun.Create;
  Guns.Add(Gun2);

  Gun3 := TGun.Create;
  Guns.Add(Gun3)
end;

destructor TPlayer.Destroy;
begin
  FreeAndNil(Guns);

  { Gun1, Gun2, and Gun3 have already been freed due to the call above, but it's
    good practice to set them to nil explicitly }
  Gun1 := Nil;
  Gun2 := Nil;
  Gun3 := Nil;
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
    FreeAndNil(Player) // invokes the destructor
  end
end.
