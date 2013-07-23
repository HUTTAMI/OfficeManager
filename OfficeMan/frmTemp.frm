VERSION 5.00
Begin VB.Form frmTemp
  Caption = "Form1"
  ScaleMode = 1
  WhatsThisButton = 0   'False
  'Icon = n/a
  LinkTopic = "Form1"
  ClientLeft = 60
  ClientTop = 345
  ClientWidth = 12480
  ClientHeight = 5265
  StartUpPosition = 3 'Windows Default
  Begin VB.CommandButton cmdEdit
    Caption = "Edit"
    Index = 8
    Left = 120
    Top = 120
    Width = 915
    Height = 315
    TabIndex = 2
  End
  Begin VB.CommandButton cmdCancel
    Index = 8
    Left = 1620
    Top = 120
    Width = 500
    Height = 315
    TabIndex = 1
    Picture = "frmTemp.frx":0
    Style = 1
  End
  Begin VB.CommandButton cmdSave
    Index = 8
    Left = 1080
    Top = 120
    Width = 500
    Height = 315
    TabIndex = 0
    Picture = "frmTemp.frx":14A
    Style = 1
  End
  Begin TDBDate6Ctl.TDBDate tdbdFinalConfirmDate
    Left = 120
    Top = 450
    Width = 3495
    Height = 345
    TabIndex = 3
  End
  Begin TrueOleDBList80.TDBCombo tdbcFinalConfirmStatus
    Left = 4470
    Top = 450
    Width = 1995
    Height = 360
    TabIndex = 4
  End
  Begin TDBText6Ctl.TDBText tdbtFinalConfirmNote
    Left = 6630
    Top = 450
    Width = 5025
    Height = 345
    TabIndex = 5
  End
  Begin VB.Label Label7
    Caption = "Status"
    Left = 3840
    Top = 510
    Width = 525
    Height = 225
    TabIndex = 7
    AutoSize = -1  'True
  End
  Begin VB.Label lblUpdateFinalConfirm
    Caption = "Updated By:"
    ForeColor = &HC00000&
    Left = 2250
    Top = 150
    Width = 3975
    Height = 210
    TabIndex = 6
    AutoSize = -1  'True
    WordWrap = -1  'True
    BackStyle = 0 'Transparent
    BeginProperty Font
      Name = "Arial"
      Size = 8.25
      Charset = 0
      Weight = 400
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
End

Attribute VB_Name = "frmTemp"