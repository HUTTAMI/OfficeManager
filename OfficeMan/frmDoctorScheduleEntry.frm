VERSION 5.00
Begin VB.Form frmDoctorScheduleEntry
  Caption = " "
  BackColor = &H80000005&
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
  ClientWidth = 5085
  ClientHeight = 2970
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
  Appearance = 0 'Flat
  ShowInTaskbar = 0   'False
  StartUpPosition = 1 'CenterOwner
  Begin VB.CommandButton cmdOk
    Caption = "&OK"
    Left = 2460
    Top = 2490
    Width = 1245
    Height = 345
    TabIndex = 4
  End
  Begin VB.CommandButton cmdCancel
    Caption = "&Cancel"
    Left = 3720
    Top = 2490
    Width = 1245
    Height = 345
    TabIndex = 5
  End
  Begin TrueOleDBList80.TDBCombo tdbcDayofWeek
    Left = 1500
    Top = 630
    Width = 3435
    Height = 360
    TabIndex = 0
  End
  Begin TrueOleDBList80.TDBCombo tdbcPhysicians
    Left = 1500
    Top = 1080
    Width = 3435
    Height = 360
    TabIndex = 1
  End
  Begin TDBTime6Ctl.TDBTime tdbtStartTime
    Left = 180
    Top = 1530
    Width = 2415
    Height = 345
    TabIndex = 2
  End
End

Attribute VB_Name = "frmDoctorScheduleEntry"