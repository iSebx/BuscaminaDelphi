unit Unit1;

interface

uses
  SysUtils, Classes, Controls, Forms,
  IWVCLBaseContainer, IWColor, IWContainer, IWRegion, Vcl.StdCtrls,
  IWHTMLContainer, IWHTML40Container, dialogs;

type
  TIWFrame1 = class(TFrame)
    IWFrameRegion: TIWRegion;
    Edit1: TEdit;
    procedure Edit1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TIWFrame1.Edit1Click(Sender: TObject);
begin
ShowMessage('Fruta');
end;

end.