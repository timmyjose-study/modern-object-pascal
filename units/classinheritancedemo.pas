{$mode objfpc}{$H+}{$J-}
{$M+}

program ClassInheritanceDemo;
uses SysUtils;

type
  Book = class
  protected
    Title: String;
    Price: Single;

  public
    constructor Init(T: String; P: Single);
    destructor Deinit;

    procedure SetTitle(T: String);
    function GetTitle: String;

    procedure SetPrice(P: Single);
    function GetPrice: Single;

    procedure Display; virtual;
  end;

constructor Book.Init(T: String; P: Single);
begin
  Title := T;
  Price := P
end;

destructor Book.Deinit;
begin
end;

procedure Book.SetTitle(T: String);
begin
  Title := T
end;

function Book.GetTitle: String;
begin
  Result := Title
end;

procedure Book.SetPrice(P: Single);
begin
  Price := P
end;

function Book.GetPrice: Single;
begin
  Result := Price
end;

procedure Book.Display;
begin
  WriteLn('Title; ' , Title);
  WriteLn('Price: ', Price:1:2)
end;

type
  Novel = class(Book)
  private
    Author: String;

  public
    constructor Init(N: String; P: Single; A: String);
    destructor Deinit;

    procedure SetAuthor(A: String);
    function GetAuthor: String;

    procedure Display; override;
  end;

constructor Novel.Init(N: String; P: Single; A: String);
begin
  inherited Init(N, P);
  Author := A
end;

destructor Novel.Deinit;
begin
  inherited Deinit;
end;

procedure Novel.SetAuthor(A: String);
begin
  Author := A
end;

function Novel.GetAuthor: String;
begin
  Result := Author
end;

procedure Novel.Display;
begin
  inherited Display;
  WriteLn('Author: ', Author)
end;

var
  WarAndPeace: Novel;

begin
  try
    WarAndPeace := Novel.Init('War and Peace', 123.45, 'Leo Tolstoy');
    WarAndPeace.Display
  finally
    FreeAndNil(WarAndPeace)
  end
end.
