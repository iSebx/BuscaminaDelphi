object IWFrame1: TIWFrame1
  Left = 0
  Top = 0
  Width = 582
  Height = 389
  TabOrder = 0
  object IWFrameRegion: TIWRegion
    Left = 0
    Top = 0
    Width = 582
    Height = 389
    Cursor = crAuto
    RenderInvisibleControls = False
    TabOrder = 0
    Align = alClient
    BorderOptions.NumericWidth = 1
    BorderOptions.BorderWidth = cbwNumeric
    BorderOptions.Style = cbsSolid
    BorderOptions.Color = clNone
    Color = clNone
    ParentShowHint = False
    ShowHint = True
    ZIndex = 1000
    Splitter = False
    ExplicitWidth = 343
    ExplicitHeight = 169
  end
  object Edit1: TEdit
    Left = 120
    Top = 96
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
    OnClick = Edit1Click
  end
end
