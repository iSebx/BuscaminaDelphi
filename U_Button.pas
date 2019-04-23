unit U_Button;

interface

uses Buttons, classes, graphics, SysUtils, StdCtrls, ExtCtrls, Controls;

type
  TSquareType = (st_Agua,st_Bomba, st_Numero);
  TBButton = class (TSpeedButton)
    private
      FType: TSquareType;
      FNumber: Integer;
      FClicked: Boolean;
      FIndexX: Integer;
      FIndexY: Integer;
      FText: String;

      Procedure SetType (value: TSquareType);
      Procedure SetNumber (value: Integer);
      Procedure SetClicked (value: Boolean);
      procedure SetIndexX (value: Integer);
      procedure SetIndexY (value: Integer);
      procedure SetText (Value: String);
    public
      constructor Create(AOwner: TComponent);
      function isBomb: boolean;
      procedure Button1Click(Sender: TObject); //assignar al evento
      procedure ButtonMouseUp(Sender: TObject; Button: TMouseButton;
                              Shift: TShiftState; X, Y: Integer);
      procedure IncNumber;
    published
      property Tipo: TSquareType read FType write SetType;
      property Numero: integer read FNumber write SetNumber;
      property Pulsado: Boolean read FClicked write SetClicked;
      property IndexX: Integer read FIndexX write SetIndexX;
      property IndexY: Integer read FIndexY write SetIndexY;
      property Text: String read FText write SetText;
  end;

const
  SIZEBUTTON = 40;

implementation

////////////////////////////////////////////////////////////////////////////////
//////////// TBButton Implementations //////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
constructor TBButton.Create(AOwner: TComponent);
begin
  inherited create(AOwner);

  self.Width:= SIZEBUTTON;
  self.Height:= SIZEBUTTON;
  self.FClicked:= false;
  self.FNumber:= 0;
  self.FType:= st_Agua;
  self.Color:= clRed;

  self.OnClick:= Button1Click;
  self.OnMouseUp:= ButtonMouseUp;
end;

procedure TBButton.SetIndexX (value: Integer);
begin
  self.FIndexX:= value;
end;

procedure TBButton.SetIndexY (value: Integer);
begin
  self.FIndexY:= value;
end;

Procedure TBButton.SetType (value: TSquareType);
begin
  FType:= value;
end;

Procedure TBButton.SetNumber (value: Integer);
begin
  FNumber:= value;
end;

Procedure TBButton.SetClicked (value: Boolean);
begin
  FClicked:= value;
end;

Procedure TBButton.SetText(Value: string);
begin
  FText:=Value;
end;

function TBButton.isBomb: boolean;
begin
  if (FType = TSquareType.st_Bomba)
    then result:= true
    else result:= false;
end;

procedure TBButton.Button1Click(Sender: TObject); //assignar al evento
begin
end;

procedure TBButton.ButtonMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  case Button of
    mbLeft: begin
      Self.FClicked:= true;
      self.Caption:= self.FText;
    end;
    mbRight: begin
      self.Caption:= '?';
    end;
  end;
end;

procedure TBButton.IncNumber;
begin
  inc(Self.FNumber);
  Self.FText:= IntToStr(self.FNumber);
end;
end.
