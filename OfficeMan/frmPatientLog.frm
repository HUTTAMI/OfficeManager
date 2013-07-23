VERSION 5.00
Begin VB.Form frmPatientLog
  Caption = " Patient Log Entry"
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
  ClientWidth = 4635
  ClientHeight = 6210
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
  Begin VB.CommandButton cmdOk
    Caption = "&OK"
    Left = 1050
    Top = 5760
    Width = 1725
    Height = 375
    TabIndex = 4
    TabStop = 0   'False
  End
  Begin VB.CommandButton cmdCancel
    Caption = "&Cancel"
    Left = 2820
    Top = 5760
    Width = 1725
    Height = 375
    TabIndex = 5
    TabStop = 0   'False
  End
  Begin VB.ComboBox cboLogType
    Style = 2
    Left = 1110
    Top = 90
    Width = 3465
    Height = 345
    TabIndex = 0
  End
  Begin VB.CheckBox chkImportant
    Caption = " Important Note"
    ForeColor = &H80000008&
    Left = 2910
    Top = 510
    Width = 1785
    Height = 285
    TabIndex = 2
    Appearance = 0 'Flat
  End
  Begin VB.CheckBox chkPhoneCall
    Caption = " Phone Call"
    ForeColor = &H80000008&
    Left = 1110
    Top = 510
    Width = 1695
    Height = 285
    TabIndex = 1
    Appearance = 0 'Flat
  End
  Begin TDBText6Ctl.TDBText tdbtLogEntry
    Left = 90
    Top = 900
    Width = 4455
    Height = 4785
    TabIndex = 3
  End
  Begin VB.Label Label1
    Caption = "Log Type:"
    Left = 90
    Top = 120
    Width = 795
    Height = 225
    TabIndex = 6
    AutoSize = -1  'True
    BackStyle = 0 'Transparent
  End
End

Attribute VB_Name = "frmPatientLog"