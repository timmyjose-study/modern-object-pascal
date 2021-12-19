{$mode objfpc}{$H+}{$J-}
{$M+}

unit StudentUnit;

interface

type TStudent = class
  private
    Name: String;
    Id: Integer;

  public
    constructor Init(N: String; I: Integer);
    destructor Deinit;

    procedure SetName(N: String);
    function GetName: String;

    procedure SetId(I: Integer);
    function GetId: Integer;
  end;

implementation

constructor TStudent.Init(N: String; I: Integer);
begin
  Name := N;
  Id := I
end;

destructor TStudent.Deinit;
begin
end;

procedure TStudent.SetName(N: String);
begin
  Name := N
end;

function TStudent.GetName: String;
begin
  Result := Name
end;

procedure TStudent.SetId(I: Integer);
begin
  Id := I
end;

function TStudent.GetId: Integer;
begin
  Result := Id
end;

initialization
  WriteLn('Initialised StudentUnit')

finalization
  WriteLn('De-initialised StudentUnit')
end.
