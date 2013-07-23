VERSION 5.00
Begin VB.Form frmClientLookup
  Caption = " Patient Lookup"
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
  ClientWidth = 8055
  ClientHeight = 4410
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
  Begin VB.CommandButton cmdSearch
    Caption = "&Search"
    Left = 3150
    Top = 3390
    Width = 1725
    Height = 435
    TabIndex = 6
    BeginProperty Font
      Name = "Arial Black"
      Size = 9.75
      Charset = 0
      Weight = 400
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
  End
  Begin VB.CommandButton cmdOk
    Caption = "&OK"
    Left = 2280
    Top = 3960
    Width = 1725
    Height = 375
    TabIndex = 7
  End
  Begin VB.CommandButton cmdCancel
    Caption = "&Cancel"
    Left = 4050
    Top = 3960
    Width = 1725
    Height = 375
    TabIndex = 8
    Cancel = -1  'True
  End
  Begin TDBText6Ctl.TDBText tdbtFirstName
    Left = 3360
    Top = 2940
    Width = 3075
    Height = 315
    TabIndex = 4
  End
  Begin TDBText6Ctl.TDBText tdbtMI
    Left = 6870
    Top = 2940
    Width = 735
    Height = 315
    TabIndex = 5
  End
  Begin TDBText6Ctl.TDBText tdbtLastName
    Left = 150
    Top = 2940
    Width = 2955
    Height = 315
    TabIndex = 3
  End
  Begin TDBMask6Ctl.TDBMask tdbmPhone
    Left = 4560
    Top = 2550
    Width = 2385
    Height = 315
    TabIndex = 2
  End
  Begin TDBMask6Ctl.TDBMask tdbmChartNo
    Left = 150
    Top = 2550
    Width = 2175
    Height = 315
    TabIndex = 0
  End
  Begin TDBMask6Ctl.TDBMask tdbmSSN
    Left = 2490
    Top = 2550
    Width = 1905
    Height = 315
    TabIndex = 1
  End
  Begin TrueOleDBGrid80.TDBGrid tdbgPatients
    Left = 60
    Top = 60
    Width = 7935
    Height = 2385
    TabIndex = 9
  End
End

Attribute VB_Name = "frmClientLookup"