object Form1: TForm1
  Left = 192
  Top = 107
  Width = 696
  Height = 105
  Caption = 'Посылка текстовой строки в порт'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 8
    Top = 16
    Width = 577
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 600
    Top = 8
    Width = 81
    Height = 25
    Caption = 'Отправить'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 40
    Width = 233
    Height = 25
    Hint = 'Считать содержимое входного буфера'
    Caption = 'Закончить чтение'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = Button2Click
  end
end
