unit U_FrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, U_Button, U_Game, Unit1,
  Vcl.StdCtrls, Vcl.ExtCtrls, TImmageButton, Vcl.ExtDlgs;

type

  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    Panel4: TPanel;
    Panel5: TPanel;
    Timer: TTimer;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Juego: TGame;
    ImageButton: TImageButton;
    procedure CreatePanel (Start: TPoint);
  end;

var
  Form1: TForm1;
  sec: Integer;
implementation

procedure TForm1.CreatePanel (Start: TPoint);
begin  //8x8
  Juego.NewGame(gd_Easy);
end;

{$R *.dfm}


procedure TForm1.FormCreate(Sender: TObject);
begin
  Juego:= TGame.Create(9,10,Panel2);
  juego.Left:= (Panel2.Width-Juego.Width)div 2;
  Juego.Top:=  (Panel2.Height-Juego.Height)div 2;
  Panel5.Caption:= IntToStr(10);
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  CreatePanel (Point(10,10));
  sec:=0;
  Timer.Enabled:=true;
end;

procedure TForm1.TimerTimer(Sender: TObject);
begin
  inc(sec);
  panel4.Caption:= intToStr(sec div 60)+':'+intToStr(sec mod 60)
end;

end.
