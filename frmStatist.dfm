object MDIStatistChild: TMDIStatistChild
  Left = 0
  Top = 0
  Caption = 'MDIStatistChild'
  ClientHeight = 611
  ClientWidth = 884
  Color = clBtnFace
  ParentFont = True
  FormStyle = fsMDIChild
  Position = poDefault
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 15
  object splFind: TSplitter
    Left = 0
    Top = 273
    Width = 884
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitTop = 41
    ExplicitWidth = 558
  end
  object pnlFind: TPanel
    Left = 0
    Top = 0
    Width = 884
    Height = 273
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 784
  end
  object pnlControls: TPanel
    Left = 0
    Top = 276
    Width = 884
    Height = 335
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 784
    DesignSize = (
      884
      335)
    object grpRefList: TGroupBox
      Left = 503
      Top = 6
      Width = 202
      Height = 323
      Anchors = [akLeft, akTop, akBottom]
      Caption = #1057#1087#1080#1089#1086#1082' '#1089#1087#1088#1072#1074#1086#1082
      TabOrder = 0
      object lvRef: TListView
        AlignWithMargins = True
        Left = 5
        Top = 20
        Width = 192
        Height = 298
        Align = alClient
        Columns = <
          item
            AutoSize = True
            Caption = #1057#1087#1088#1072#1074#1082#1072
          end>
        HideSelection = False
        ReadOnly = True
        RowSelect = True
        ShowColumnHeaders = False
        TabOrder = 0
        ViewStyle = vsReport
        OnSelectItem = lvRefSelectItem
        ExplicitLeft = 48
        ExplicitTop = 88
        ExplicitWidth = 250
        ExplicitHeight = 150
      end
    end
    object grpFind: TGroupBox
      Left = 8
      Top = 6
      Width = 257
      Height = 323
      Anchors = [akLeft, akTop, akBottom]
      Caption = #1055#1086#1080#1089#1082
      TabOrder = 1
      object lblFio: TLabel
        Left = 16
        Top = 22
        Width = 30
        Height = 15
        Caption = #1060#1048#1054':'
      end
      object lblBirth1: TLabel
        Left = 7
        Top = 83
        Width = 8
        Height = 15
        Caption = #1057
      end
      object lblBirth2: TLabel
        Left = 131
        Top = 83
        Width = 14
        Height = 15
        Caption = #1087#1086
      end
      object lblFind3: TLabel
        Left = 7
        Top = 139
        Width = 8
        Height = 15
        Caption = #1057
      end
      object lblBirth3: TLabel
        Left = 131
        Top = 139
        Width = 14
        Height = 15
        Caption = #1087#1086
      end
      object edtFindFio: TEdit
        Left = 53
        Top = 19
        Width = 172
        Height = 23
        TabOrder = 0
      end
      object chkBirth: TCheckBox
        Left = 82
        Top = 56
        Width = 117
        Height = 17
        Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
        TabOrder = 1
        OnClick = chkBirthClick
      end
      object dtpBirth1: TDateTimePicker
        Left = 25
        Top = 79
        Width = 97
        Height = 23
        Date = 45082.000000000000000000
        Time = 0.667089050926733800
        Enabled = False
        TabOrder = 2
      end
      object dtpBirth2: TDateTimePicker
        Left = 154
        Top = 79
        Width = 97
        Height = 23
        Date = 45082.000000000000000000
        Time = 0.667320567132264800
        Enabled = False
        TabOrder = 3
      end
      object dtpCreated1: TDateTimePicker
        Left = 25
        Top = 135
        Width = 97
        Height = 23
        Date = 45082.000000000000000000
        Time = 0.667089050926733800
        Enabled = False
        TabOrder = 4
      end
      object dtpCreated2: TDateTimePicker
        Left = 154
        Top = 135
        Width = 97
        Height = 23
        Date = 45082.000000000000000000
        Time = 0.667320567132264800
        Enabled = False
        TabOrder = 5
      end
      object chkFindDateCreated: TCheckBox
        Left = 92
        Top = 112
        Width = 97
        Height = 17
        Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103':'
        TabOrder = 6
        OnClick = chkFindDateCreatedClick
      end
      object btnFind: TButton
        Left = 91
        Top = 176
        Width = 75
        Height = 25
        Caption = #1055#1086#1080#1089#1082
        TabOrder = 7
        OnClick = btnFindClick
      end
      object btnClean: TButton
        Left = 228
        Top = 18
        Width = 23
        Height = 25
        Hint = #1054#1095#1080#1089#1090#1080#1090#1100
        Caption = 'x'
        ImageIndex = 21
        Images = MainForm.ImageList1
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        OnClick = btnCleanClick
      end
    end
    object grpUsers: TGroupBox
      Left = 271
      Top = 6
      Width = 226
      Height = 323
      Anchors = [akLeft, akTop, akBottom]
      Caption = #1053#1072#1081#1076#1077#1085#1086
      TabOrder = 2
      object lvUsers: TListView
        AlignWithMargins = True
        Left = 5
        Top = 20
        Width = 216
        Height = 298
        Align = alClient
        Columns = <
          item
            AutoSize = True
            Caption = #1060#1048#1054
          end>
        HideSelection = False
        ReadOnly = True
        RowSelect = True
        ShowColumnHeaders = False
        TabOrder = 0
        ViewStyle = vsReport
        OnSelectItem = lvUsersSelectItem
        ExplicitLeft = 64
        ExplicitTop = 48
        ExplicitWidth = 250
        ExplicitHeight = 150
      end
    end
    object grpRefCnt: TGroupBox
      Left = 711
      Top = 6
      Width = 166
      Height = 323
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = #1057#1087#1088#1072#1074#1082#1072
      TabOrder = 3
      object mmoRef: TMemo
        AlignWithMargins = True
        Left = 5
        Top = 20
        Width = 156
        Height = 298
        Align = alClient
        ReadOnly = True
        TabOrder = 0
        ExplicitLeft = 48
        ExplicitTop = 112
        ExplicitWidth = 185
        ExplicitHeight = 89
      end
    end
  end
end
