{$mode objfpc}{$H+}{$J-}

program RefCountingDemo(output);
uses SysUtils, Classes; // for TComponent

type
  TGun = class(TComponent)
  end;

  TPlayer = class(TComponent)
    Gun1, Gun2, Gun3: TGun;
    ManualGun: TGun;
    constructor Create(AOwner: TComponent); override;
    procedure PlayGame;
  end;

constructor TPlayer.Create(AOwner: TComponent);
begin
  inherited; // invoke the TComponent constructor
  Gun1 := TGun.Create(Self); // So TPlayer owns this object
  Gun2 := TGun.Create(Self);
  Gun3 := TGun.Create(Self);
  ManualGun := TGun.Create(Nil)
end;

procedure TPlayer.PlayGame;
begin
  WriteLn('Playing the game')
end;

var
  Player: TPlayer;

begin
  try
    Player := TPlayer.Create(nil); // no owner for Player
    Player.PlayGame
  finally
    FreeAndNil(Player.ManualGun); // needed since ManualGun is not "owned"
    FreeAndNil(Player)
  end
end.