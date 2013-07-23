VERSION 5.00
Begin VB.Form frmAppEdit
  Caption = " Appointment"
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
  ClientWidth = 4455
  ClientHeight = 2835
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
  Begin TDBTime6Ctl.TDBTime tdbtAppointmentTime
    Left = 150
    Top = 540
    Width = 2655
    Height = 345
    TabIndex = 1
  End
  Begin VB.CommandButton cmdCancel
    Caption = "&Cancel"
    Left = 2250
    Top = 2370
    Width = 1725
    Height = 375
    TabIndex = 6
  End
  Begin VB.CommandButton cmdOk
    Caption = "&OK"
    Left = 480
    Top = 2370
    Width = 1725
    Height = 375
    TabIndex = 5
  End
  Begin TDBDate6Ctl.TDBDate tdbdAppointmentDate
    Left = 150
    Top = 120
    Width = 4155
    Height = 345
    TabIndex = 0
  End
  Begin TDBDate6Ctl.TDBDate tdbdRegisterDate
    Left = 150
    Top = 960
    Width = 4155
    Height = 345
    TabIndex = 2
  End
  Begin TrueOleDBList80.TDBCombo tdbcOperatingDoctor
    Left = 1800
    Top = 1380
    Width = 2505
    Height = 360
    TabIndex = 3
  End
  Begin TrueOleDBList80.TDBCombo tdbcOperationType
    Left = 1800
    Top = 1830
    Width = 2505
    Height = 360
    TabIndex = 4
  End
  Begin VB.Label Label1
    Caption = "Operation Type"
    Left = 150
    Top = 1890
    Width = 1245
    Height = 225
    TabIndex = 8
    AutoSize = -1  'True
  End
  Begin VB.Label Label3
    Caption = "Operating Doctor"
    Left = 150
    Top = 1440
    Width = 1395
    Height = 225
    TabIndex = 7
    AutoSize = -1  'True
  End
End

Attribute VB_Name = "frmAppEdit"