object FindForm: TFindForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FindForm'
  ClientHeight = 286
  ClientWidth = 900
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 15
  object grpFind: TGroupBox
    AlignWithMargins = True
    Left = 6
    Top = 6
    Width = 888
    Height = 274
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Align = alClient
    Caption = #1055#1086#1080#1089#1082
    TabOrder = 0
    ExplicitWidth = 628
    DesignSize = (
      888
      274)
    object lblFio: TLabel
      Left = 16
      Top = 24
      Width = 30
      Height = 15
      Caption = #1060#1048#1054':'
    end
    object lblInfo: TLabel
      Left = 246
      Top = 23
      Width = 74
      Height = 15
      Anchors = [akTop]
      Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
    end
    object lblFindRef: TLabel
      Left = 576
      Top = 23
      Width = 105
      Height = 15
      Caption = #1042#1099#1076#1072#1085#1085#1099#1077' '#1089#1087#1088#1072#1074#1082#1080
    end
    object lblFindRefInfo: TLabel
      Left = 736
      Top = 23
      Width = 117
      Height = 15
      Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1089#1087#1088#1072#1074#1082#1080
    end
    object edtFindName: TEdit
      Left = 52
      Top = 21
      Width = 128
      Height = 23
      TabOrder = 0
    end
    object mmoData: TMemo
      Left = 235
      Top = 50
      Width = 302
      Height = 214
      Anchors = [akLeft, akTop, akBottom]
      ReadOnly = True
      TabOrder = 1
    end
    object btnFind: TButton
      Left = 186
      Top = 19
      Width = 44
      Height = 25
      Caption = #1055#1086#1080#1089#1082
      TabOrder = 2
      OnClick = btnFindClick
    end
    object lvUsers: TListView
      Left = 5
      Top = 50
      Width = 224
      Height = 214
      Anchors = [akLeft, akTop, akBottom]
      Columns = <
        item
          AutoSize = True
          Caption = #1060#1048#1054
        end>
      HideSelection = False
      ReadOnly = True
      RowSelect = True
      ShowColumnHeaders = False
      TabOrder = 3
      ViewStyle = vsReport
      OnSelectItem = lvUsersSelectItem
    end
    object lvFindRef: TListView
      Left = 543
      Top = 50
      Width = 170
      Height = 214
      Anchors = [akLeft, akTop, akBottom]
      Columns = <
        item
          AutoSize = True
          Caption = #1058#1077#1082#1089#1090
        end>
      HideSelection = False
      ReadOnly = True
      RowSelect = True
      ShowColumnHeaders = False
      TabOrder = 4
      ViewStyle = vsReport
      OnSelectItem = lvFindRefSelectItem
    end
    object mmoRefInfo: TMemo
      Left = 719
      Top = 50
      Width = 163
      Height = 214
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 5
    end
  end
end
