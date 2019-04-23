program BuscaminasDelphi;

uses
  Vcl.Forms,
  U_FrmMain in 'U_FrmMain.pas' {Form1},
  U_Button in 'U_Button.pas',
  U_Game in 'U_Game.pas',
  Unit1 in 'Unit1.pas' {IWFrame1: TFrame},
  TImmageButton in 'TImmageButton.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
