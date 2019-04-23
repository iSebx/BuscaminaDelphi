unit U_Game;

interface

uses U_Button, Controls, classes, sysUtils, windows, graphics;

const
  bmpAguaPath = '\res\agua.bmp';
  bmpBombPath = '\res\bomb.bmp';
var
  COUNT: Integer;

type
  TButtonArray = Array of TBButton;
  TGameDifficult = (gd_Hard, gd_Standar, gd_Easy);
  TGame = class
    private
      FSize: integer; //cantidad de cuadros por lado
      FCountBombs: Integer; //Cantidad de Bombas
      FGameDifficult: TGameDifficult; //dificultad de juego
      FLeft: integer;
      FTop: Integer;
      FWidth: Integer;
      FHeight: Integer;

      Parent: TWinControl; //Quien contendra el juego
      ButtonList : array of TButtonArray; //Lista de Botones


      procedure SetSize (value: integer);
      procedure SetCountBombs (value: Integer);
      procedure SetGameDifficult (value: TGameDifficult);
      procedure SetLeft (value: Integer);
      procedure SetTop (value: Integer);
      procedure AssignBomb;
//      Procedure AssignNumbers;

      Function GetIndexFromCoord (x,y: Integer): integer;
      Function GetCoordFromIndex (idx: Integer): TPoint;
    public
      Constructor Create (_Size: Integer; _bombs: Integer; _parent: TWinControl);

      procedure NewGame (difficult: TGameDifficult);
      procedure SetNewParent (_parent: TWinControl);
      function GetParent: TWinControl;

      Procedure AssignNumbers;
   published
      property Tamaño: Integer read FSize write SetSize;
      property CantBombas: Integer read FCountBombs write SetCountBombs;
      property Dificultad: TGameDifficult read FGameDifficult write SetGameDifficult;
      property Left: Integer read Fleft write SetLeft;
      property Top: Integer read FTop write SetTop;
      property Width: Integer read FWidth;
      property Height: Integer read FHeight;
  end;


implementation

Constructor TGame.Create (_Size: Integer; _bombs: Integer; _parent: TWinControl);
var
  i: Integer;
begin
  self.FSize:= _Size;
  self.FCountBombs:= _bombs;
  self.Parent:= _parent;
  setlength(ButtonList, _Size);
  for i := 0 to _Size-1 do
    Setlength (ButtonList[i], _Size);
  self.FWidth:= (SIZEBUTTON*_Size)+ (_Size-1);
  self.FHeight:= self.FWidth;
end;

procedure TGame.SetSize (value: integer);
begin
  self.FSize:= value;
end;

procedure TGame.SetCountBombs (value: Integer);
begin
  self.FCountBombs:= value;
end;

procedure TGame.SetLeft (value: Integer);
begin
  self.FLeft:= value;
end;

procedure TGame.SetTop (value: Integer);
begin
  self.FTop:= value;
end;

procedure TGame.SetGameDifficult (value: TGameDifficult);
begin
  FGameDifficult:= value;
end;

Function TGame.GetIndexFromCoord (x,y: Integer): integer;
var
  idx: integer;
begin
  idx:= (y*self.FSize)+x;
  result:= idx;
end;

Function TGame.GetCoordFromIndex (idx: Integer): TPoint;
var
  x,y: Integer;
begin
  while (idx>self.FSize) do begin
    idx:=idx-Self.FSize;
    y:= y+1;
  end;
  x:= idx;
  result:= Point(x,y);
end;

procedure TGame.NewGame (difficult: TGameDifficult);
var
  i, j: Integer;
  aux: TBButton;
begin
  //NO IMPLEMENTADA DIFICULTAD
  for j:= 0 to self.FSize-1 do
    for i := 0 to self.FSize-1 do begin
      aux:= TBButton.Create(self.Parent);
      aux.Left:= i*SIZEBUTTON+1+Self.FLeft;
      aux.Top:= j*SIZEBUTTON+1+Self.FTop;
      aux.Parent:= self.Parent;
      aux.Text:='Agua';
      aux.IndexX:=j;
      aux.IndexY:=i;
      Self.ButtonList[i][j]:= Aux;
    end;
  self.AssignBomb;
  self.AssignNumbers;
end;

procedure TGame.AssignBomb;
var
  i:integer;
  auxX, AuxY: integer;
  str: String;
begin
  Randomize;
  i:=0;
  while (i<=Self.FCountBombs-1) do begin
    auxX:= Random(self.FSize);
    auxY:= Random(self.FSize);
    if not self.ButtonList[AuxX][AuxY].isBomb then begin
      self.ButtonList[AuxX][AuxY].Tipo:= st_Bomba;
      str:=GetCurrentDir+bmpBombPath;
//      self.ButtonList[AuxX][AuxY].Glyph.LoadFromFile(str);
//      self.ButtonList[AuxX][AuxY].Glyph.;
      self.ButtonList[AuxX][AuxY].Text:='Bomba';
      inc(i);
    end;
  end;
end;

Procedure TGame.AssignNumbers;
var x, y, i, j:Integer;
begin
  for y := 0 to FSize-1 do
    for X := 0 to FSize-1 do
      if not self.ButtonList[x][y].isBomb then
        for i := -1 to 1 do
          for j := -1 to 1 do
            if (x+i>=0)and (x+i<FSize)and (y+j>=0) and (y+j<=FSize) and (ButtonList[x+i][y+j].isBomb)
              then self.ButtonList[x][y].IncNumber;
end;

procedure TGame.SetNewParent (_parent: TWinControl);
begin
  Self.Parent:= _parent;
end;

function TGame.GetParent: TWinControl;
begin
  result:= Self.Parent;
end;


end.
