object MDIOperatorChild: TMDIOperatorChild
  Left = 197
  Top = 117
  Caption = 'MDIOperatorChild'
  ClientHeight = 477
  ClientWidth = 784
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
    Top = 185
    Width = 784
    Height = 4
    Cursor = crVSplit
    Align = alTop
  end
  object pnlFind: TPanel
    Left = 0
    Top = 0
    Width = 784
    Height = 185
    Align = alTop
    TabOrder = 0
  end
  object pnlControls: TPanel
    Left = 0
    Top = 189
    Width = 784
    Height = 288
    Align = alClient
    TabOrder = 1
    object grpOperator: TGroupBox
      AlignWithMargins = True
      Left = 7
      Top = 7
      Width = 770
      Height = 274
      Margins.Left = 6
      Margins.Top = 6
      Margins.Right = 6
      Margins.Bottom = 6
      Align = alClient
      Caption = #1054#1087#1077#1088#1072#1090#1086#1088
      TabOrder = 0
      DesignSize = (
        770
        274)
      object grpAddUser: TGroupBox
        Left = 16
        Top = 24
        Width = 249
        Height = 121
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        TabOrder = 0
        object lblBirth: TLabel
          Left = 16
          Top = 56
          Width = 86
          Height = 15
          Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103':'
        end
        object lblFio: TLabel
          Left = 16
          Top = 24
          Width = 30
          Height = 15
          Caption = #1060#1048#1054':'
        end
        object edtFio: TEdit
          Left = 52
          Top = 21
          Width = 181
          Height = 23
          TabOrder = 0
        end
        object dtpBirth: TDateTimePicker
          Left = 108
          Top = 53
          Width = 125
          Height = 23
          Date = 45082.000000000000000000
          Time = 0.626702349538391000
          TabOrder = 1
        end
        object btnAddUser: TButton
          Left = 80
          Top = 82
          Width = 75
          Height = 25
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100
          TabOrder = 2
          OnClick = btnAddUserClick
        end
      end
      object grpLastUsers: TGroupBox
        Left = 16
        Top = 151
        Width = 249
        Height = 115
        Anchors = [akLeft, akTop, akBottom]
        Caption = #1055#1086#1089#1083#1077#1076#1085#1080#1077' 10'
        TabOrder = 1
        object lvLastUsers: TListView
          AlignWithMargins = True
          Left = 5
          Top = 20
          Width = 239
          Height = 90
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
          OnSelectItem = lvLastUsersSelectItem
        end
      end
      object grpRefList: TGroupBox
        Left = 528
        Top = 24
        Width = 233
        Height = 242
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = #1057#1087#1080#1089#1086#1082' '#1089#1087#1088#1072#1074#1086#1082
        TabOrder = 2
        object lvRefList: TListView
          AlignWithMargins = True
          Left = 5
          Top = 20
          Width = 223
          Height = 217
          Hint = #1044#1074#1086#1081#1085#1086#1081' '#1097#1077#1083#1095#1077#1082' '#1076#1083#1103' '#1087#1088#1086#1089#1084#1086#1090#1088#1072
          Align = alClient
          Columns = <
            item
              Caption = #8470
              Width = 30
            end
            item
              AutoSize = True
              Caption = #1058#1077#1082#1089#1090
            end
            item
              AutoSize = True
              Caption = #1044#1072#1090#1072
            end>
          HideSelection = False
          ReadOnly = True
          RowSelect = True
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          ViewStyle = vsReport
          OnDblClick = lvRefListDblClick
        end
      end
      object grpRefAdd: TGroupBox
        Left = 271
        Top = 24
        Width = 251
        Height = 242
        Anchors = [akLeft, akTop, akBottom]
        Caption = #1042#1099#1076#1072#1090#1100' '#1089#1087#1088#1072#1074#1082#1091
        TabOrder = 3
        DesignSize = (
          251
          242)
        object lblRefDate: TLabel
          Left = 16
          Top = 57
          Width = 28
          Height = 15
          Caption = #1044#1072#1090#1072':'
        end
        object lblRefNote: TLabel
          Left = 88
          Top = 83
          Width = 72
          Height = 15
          Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077':'
        end
        object lblRefName: TLabel
          Left = 12
          Top = 24
          Width = 32
          Height = 15
          Caption = #1058#1077#1082#1089#1090':'
        end
        object dtpRefDate: TDateTimePicker
          Left = 50
          Top = 54
          Width = 191
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          Date = 45082.000000000000000000
          Time = 0.637647847222979200
          TabOrder = 0
        end
        object mmoRefNote: TMemo
          Left = 8
          Top = 105
          Width = 233
          Height = 97
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
        end
        object btnRefAdd: TButton
          Left = 65
          Top = 208
          Width = 105
          Height = 25
          Anchors = [akLeft, akBottom]
          Caption = #1042#1099#1076#1072#1090#1100' '#1089#1087#1088#1072#1074#1082#1091
          TabOrder = 2
          OnClick = btnRefAddClick
        end
        object edtRefName: TEdit
          Left = 50
          Top = 21
          Width = 191
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
        end
      end
    end
  end
end
