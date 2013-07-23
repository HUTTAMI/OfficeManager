VERSION 5.00
Begin VB.Form frmLogin
  Caption = " Appointment Manager"
  ScaleMode = 1
  WhatsThisButton = 0   'False
  BorderStyle = 3 'Fixed Dialog
  Icon = "frmLogin.frx":0
  LinkTopic = "Form1"
  MaxButton = 0   'False
  MinButton = 0   'False
  ControlBox = 0   'False
  ClientLeft = 45
  ClientTop = 330
  ClientWidth = 4110
  ClientHeight = 3930
  LockControls = -1  'True
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
  StartUpPosition = 2 'CenterScreen
  Begin VB.CommandButton cmdSQLConfig
    Caption = "&SQL Client Configuration"
    Left = 1830
    Top = 3480
    Width = 2235
    Height = 375
    TabIndex = 10
    TabStop = 0   'False
  End
  Begin VB.CommandButton cmdexit
    Caption = "E&xit"
    Left = 1380
    Top = 1080
    Width = 1335
    Height = 375
    TabIndex = 3
    Cancel = -1  'True
  End
  Begin VB.CommandButton cmdmore
    Caption = "&More >>"
    Left = 2730
    Top = 1080
    Width = 1335
    Height = 375
    TabIndex = 4
  End
  Begin VB.CommandButton cmdok
    Caption = "&OK"
    Left = 30
    Top = 1080
    Width = 1335
    Height = 375
    TabIndex = 2
  End
  Begin VB.OptionButton optConnectMethod
    Caption = " Use Named Pipes to Connect"
    Index = 0
    ForeColor = &H80000008&
    Left = 150
    Top = 1620
    Width = 3765
    Height = 255
    TabIndex = 5
    TabStop = 0   'False
    Appearance = 0 'Flat
  End
  Begin VB.OptionButton optConnectMethod
    Caption = " Use TCP/IP to Connect"
    Index = 1
    ForeColor = &H80000008&
    Left = 150
    Top = 2370
    Width = 3765
    Height = 255
    TabIndex = 7
    TabStop = 0   'False
    Appearance = 0 'Flat
  End
  Begin TDBNumber6Ctl.TDBNumber tdbnPort
    Left = 180
    Top = 3000
    Width = 2205
    Height = 345
    TabStop = 0   'False
    TabIndex = 9
  End
  Begin TDBText6Ctl.TDBText tdbtUserID
    Left = 615
    Top = 150
    Width = 2865
    Height = 345
    TabIndex = 0
  End
  Begin TDBText6Ctl.TDBText tdbtPassword
    Left = 615
    Top = 570
    Width = 2865
    Height = 345
    TabIndex = 1
  End
  Begin TDBText6Ctl.TDBText tdbtServerPath
    Left = 180
    Top = 1920
    Width = 3825
    Height = 345
    TabStop = 0   'False
    TabIndex = 6
  End
  Begin TDBText6Ctl.TDBText tdbtIPAddress
    Left = 180
    Top = 2670
    Width = 3825
    Height = 345
    TabStop = 0   'False
    TabIndex = 8
  End
End

Attribute VB_Name = "frmLogin"