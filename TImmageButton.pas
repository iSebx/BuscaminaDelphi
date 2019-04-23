unit TImmageButton;

interface
uses StdCtrls, Graphics, Classes, SysUtils, Buttons;

type
  TImageButton = class (TSpeedButton)
    private
      fpath: String;
      fbmp: TBitmap;
      fImgVisible: Boolean;

      procedure SetImageVisible (value:Boolean);
    protected
      procedure Paint; override;
    public
      constructor Create (AOwner: TComponent);
      destructor Destroy;
      function LoadImageFromFile (Url: String): HResult;
      function AssignImage (_bmp: TBitmap): HResult;
    published
      property ImageVisible: Boolean read fImgVisible write SetImageVisible;
  end;

implementation

{ TImageButton }

constructor TImageButton.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Self.fpath:='';
  Self.fbmp:=TBitmap.Create;
  fImgVisible:= false;
end;

destructor TImageButton.Destroy;
begin
  self.fbmp.FreeImage;
end;

procedure TImageButton.Paint;
begin
  inherited;
  if (Self.fImgVisible)and(Self.fbmp<>nil) then Begin
    With Canvas do
      CopyRect(ClipRect, fbmp.Canvas, fbmp.Canvas.ClipRect);
  End;
end;

function TIMageButton.LoadImageFromFile (Url: String): HResult;
begin
  if FileExists(Url) then begin
    Self.fpath:= url;
    Self.fbmp.LoadFromFile(url);
  end;
end;

function TIMageButton.AssignImage (_bmp: TBitmap): HResult;
begin
  if (_bmp<>nil) then begin
    Self.fpath:= 'No Especificado';
    Self.fbmp:= _bmp;
  end
end;

procedure TImageButton.SetImageVisible(value: Boolean);
begin
  if (Self.fImgVisible<>Value) then begin
    Self.fImgVisible:=value;
    Self.Repaint;
  end;
end;

end.
