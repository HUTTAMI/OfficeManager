VERSION 5.00
Begin VB.Form frmTeamMessenger
  Caption = " Team Messenger"
  ScaleMode = 1
  WhatsThisButton = 0   'False
  BorderStyle = 3 'Fixed Dialog
  'Icon = n/a
  LinkTopic = "Form1"
  MaxButton = 0   'False
  MinButton = 0   'False
  ControlBox = 0   'False
  ClientLeft = 45
  ClientTop = 330
  ClientWidth = 8925
  ClientHeight = 7020
  BeginProperty Font
    Name = "Arial"
    Size = 8.25
    Charset = 0
    Weight = 400
    Underline = 0 'False
    Italic = 0 'False
    Strikethrough = 0 'False
  EndProperty
  ShowInTaskbar = 0   'False
  StartUpPosition = 3 'Windows Default
  Begin TrueOleDBGrid80.TDBGrid tdbgMessages
    Left = 60
    Top = 90
    Width = 8790
    Height = 3225
    TabIndex = 0
  End
End

Attribute VB_Name = "frmTeamMessenger"