VERSION 5.00
Begin VB.Form frmReport_FileFolderLabels
  Caption = " File Folder Labels"
  ScaleMode = 1
  WhatsThisButton = 0   'False
  BorderStyle = 3 'Fixed Dialog
  'Icon = n/a
  LinkTopic = "Form1"
  MaxButton = 0   'False
  MinButton = 0   'False
  ControlBox = 0   'False
  KeyPreview = -1  'True
  ClientLeft = 45
  ClientTop = 330
  ClientWidth = 5685
  ClientHeight = 2895
  LockControls = -1  'True
  BeginProperty Font
    Name = "Arial"
    Size = 9
    Charset = 0
    Weight = 400
    Underline = 0 'False
    Italic = 0 'False
    Strikethrough = 0 'False
  EndProperty
  ShowInTaskbar = 0   'False
  StartUpPosition = 1 'CenterOwner
  Begin VB.CommandButton cmdCancel
    Caption = "&Cancel"
    Left = 3870
    Top = 2400
    Width = 1695
    Height = 405
    TabIndex = 4
  End
  Begin VB.CommandButton cmdPrint
    Caption = "&Preview Labels"
    Left = 2130
    Top = 2400
    Width = 1695
    Height = 405
    TabIndex = 3
  End
  Begin TrueOleDBList80.TDBCombo tdbcFirst
    Left = 120
    Top = 360
    Width = 5445
    Height = 360
    TabIndex = 0
  End
  Begin TrueOleDBList80.TDBCombo tdbcSecond
    Left = 120
    Top = 1140
    Width = 5445
    Height = 360
    TabIndex = 1
  End
  Begin TrueOleDBList80.TDBCombo tdbcThird
    Left = 120
    Top = 1920
    Width = 5445
    Height = 360
    TabIndex = 2
  End
  Begin VB.Label Label3
    Caption = "Third Patient"
    Left = 120
    Top = 1620
    Width = 1035
    Height = 225
    TabIndex = 7
    AutoSize = -1  'True
  End
  Begin VB.Label Label2
    Caption = "Second Patient"
    Left = 120
    Top = 840
    Width = 1245
    Height = 225
    TabIndex = 6
    AutoSize = -1  'True
  End
  Begin VB.Label Label1
    Caption = "First Patient"
    Left = 120
    Top = 90
    Width = 975
    Height = 225
    TabIndex = 5
    AutoSize = -1  'True
  End
End

Attribute VB_Name = "frmReport_FileFolderLabels"