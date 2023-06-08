object MDISettingsChild: TMDISettingsChild
  Left = 0
  Top = 0
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1041#1044
  ClientHeight = 196
  ClientWidth = 255
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 15
  object lblDBUser: TLabel
    Left = 41
    Top = 69
    Width = 26
    Height = 15
    Caption = 'User:'
  end
  object lblDBDatabase: TLabel
    Left = 13
    Top = 32
    Width = 54
    Height = 15
    Caption = 'Database: '
  end
  object lblDBPassword: TLabel
    Left = 14
    Top = 104
    Width = 53
    Height = 15
    Caption = 'Password:'
  end
  object edtDBUser: TEdit
    Left = 73
    Top = 66
    Width = 160
    Height = 23
    TabOrder = 1
  end
  object edtDBDatabase: TEdit
    Left = 73
    Top = 29
    Width = 160
    Height = 23
    TabOrder = 0
  end
  object edtDBPassword: TEdit
    Left = 73
    Top = 101
    Width = 160
    Height = 23
    PasswordChar = '*'
    TabOrder = 2
  end
  object btnDBSave: TButton
    Left = 90
    Top = 130
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 3
    OnClick = btnDBSaveClick
  end
  object btnCreateTables: TButton
    Left = 8
    Top = 161
    Width = 103
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1090#1072#1073#1083#1080#1094#1099
    TabOrder = 4
    OnClick = btnCreateTablesClick
  end
  object btnDropTables: TButton
    Left = 134
    Top = 161
    Width = 113
    Height = 25
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1090#1072#1073#1083#1080#1094#1099
    TabOrder = 5
    OnClick = btnDropTablesClick
  end
end
