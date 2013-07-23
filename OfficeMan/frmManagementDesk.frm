VERSION 5.00
Begin VB.Form frmManagementDesk
  Caption = " Management Desk"
  ScaleMode = 1
  WhatsThisButton = 0   'False
  Icon = "frmManagementDesk.frx":0
  LinkTopic = "Form1"
  KeyPreview = -1  'True
  ClientLeft = 60
  ClientTop = 345
  ClientWidth = 11880
  ClientHeight = 8190
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
  Begin VB.CommandButton cmdClose
    Caption = "&Back to Front Desk"
    Left = 9750
    Top = 7800
    Width = 2115
    Height = 375
    TabIndex = 1
  End
  Begin VB.Timer tmrRefresh
    Interval = 30000
    Left = 0
    Top = 0
    Width = 15368
    Height = 30
  End
  Begin VB.CommandButton cmdToday
    Caption = "Today"
    Left = 4710
    Top = 30
    Width = 1335
    Height = 315
    TabIndex = 0
    TabStop = 0   'False
  End
  Begin TrueOleDBGrid80.TDBGrid tdbgTeamDoc
    Left = 0
    Top = 420
    Width = 11865
    Height = 3255
    TabIndex = 2
  End
  Begin TDBDate6Ctl.TDBDate tdbdSelectedDate
    Left = 60
    Top = 30
    Width = 4575
    Height = 315
    TabIndex = 3
  End
End

Attribute VB_Name = "frmManagementDesk"