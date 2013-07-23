VERSION 5.00
Begin VB.Form frmCRXViewer
  Caption = " Report Viewer"
  WindowState = 2
  ScaleMode = 1
  WhatsThisButton = 0   'False
  Icon = "frmCRXViewer.frx":0
  LinkTopic = "Form1"
  KeyPreview = -1  'True
  ClientLeft = 60
  ClientTop = 345
  ClientWidth = 8280
  ClientHeight = 4455
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
  StartUpPosition = 3 'Windows Default
  Begin CrystalActiveXReportViewerLib11Ctl.CrystalActiveXReportViewer crystal1
    Left = 60
    Top = 510
    Width = 8175
    Height = 3885
    TabIndex = 1
  End
  Begin VB.CommandButton cmdPrintSetup
    Caption = "Print &Setup"
    Left = 60
    Top = 60
    Width = 1515
    Height = 345
    TabIndex = 0
    TabStop = 0   'False
  End
End

Attribute VB_Name = "frmCRXViewer"