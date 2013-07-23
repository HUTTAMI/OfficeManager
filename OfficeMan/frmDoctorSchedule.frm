VERSION 5.00
Begin VB.Form frmDoctorSchedule
  Caption = " Doctor Schedule"
  BackColor = &HFFFFFF&
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
  ClientWidth = 11295
  ClientHeight = 7170
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
  Appearance = 0 'Flat
  ShowInTaskbar = 0   'False
  StartUpPosition = 1 'CenterOwner
  Moveable = 0   'False
  Begin VB.CommandButton cmdClose
    Caption = "&Close"
    Left = 9990
    Top = 150
    Width = 1185
    Height = 315
    TabIndex = 16
    Cancel = -1  'True
  End
  Begin VB.CheckBox chkBiweekly
    Caption = " BiWeekly Schedule"
    BackColor = &HFFC0C0&
    ForeColor = &H80000008&
    Left = 5040
    Top = 150
    Width = 1875
    Height = 285
    TabIndex = 14
    Appearance = 0 'Flat
  End
  Begin VB.CommandButton cmdDelete
    Index = 13
    Left = 10290
    Top = 6720
    Width = 315
    Height = 315
    TabIndex = 74
    TabStop = 0   'False
    Picture = "frmDoctorSchedule.frx":0
    ToolTipText = "Delete Doctor Entry from Schedule ..."
    Style = 1
  End
  Begin VB.CommandButton cmdEdit
    Index = 13
    Left = 9960
    Top = 6720
    Width = 315
    Height = 315
    TabIndex = 73
    TabStop = 0   'False
    Picture = "frmDoctorSchedule.frx":58A
    ToolTipText = "Update Doctor Schedule Entry ..."
    Style = 1
  End
  Begin VB.CommandButton cmdAdd
    Index = 13
    Left = 9630
    Top = 6720
    Width = 315
    Height = 315
    TabIndex = 72
    TabStop = 0   'False
    Picture = "frmDoctorSchedule.frx":B14
    ToolTipText = "Add Doctor Entry to Schedule ..."
    Style = 1
  End
  Begin VB.CommandButton cmdDelete
    Index = 12
    Left = 8700
    Top = 6720
    Width = 315
    Height = 315
    TabIndex = 71
    TabStop = 0   'False
    Picture = "frmDoctorSchedule.frx":109E
    ToolTipText = "Delete Doctor Entry from Schedule ..."
    Style = 1
  End
  Begin VB.CommandButton cmdEdit
    Index = 12
    Left = 8370
    Top = 6720
    Width = 315
    Height = 315
    TabIndex = 70
    TabStop = 0   'False
    Picture = "frmDoctorSchedule.frx":1628
    ToolTipText = "Update Doctor Schedule Entry ..."
    Style = 1
  End
  Begin VB.CommandButton cmdAdd
    Index = 12
    Left = 8040
    Top = 6720
    Width = 315
    Height = 315
    TabIndex = 69
    TabStop = 0   'False
    Picture = "frmDoctorSchedule.frx":1BB2
    ToolTipText = "Add Doctor Entry to Schedule ..."
    Style = 1
  End
  Begin VB.CommandButton cmdDelete
    Index = 11
    Left = 7110
    Top = 6720
    Width = 315
    Height = 315
    TabIndex = 68
    TabStop = 0   'False
    Picture = "frmDoctorSchedule.frx":213C
    ToolTipText = "Delete Doctor Entry from Schedule ..."
    Style = 1
  End
  Begin VB.CommandButton cmdEdit
    Index = 11
    Left = 6780
    Top = 6720
    Width = 315
    Height = 315
    TabIndex = 67
    TabStop = 0   'False
    Picture = "frmDoctorSchedule.frx":26C6
    ToolTipText = "Update Doctor Schedule Entry ..."
    Style = 1
  End
  Begin VB.CommandButton cmdAdd
    Index = 11
    Left = 6450
    Top = 6720
    Width = 315
    Height = 315
    TabIndex = 66
    TabStop = 0   'False
    Picture = "frmDoctorSchedule.frx":2C50
    ToolTipText = "Add Doctor Entry to Schedule ..."
    Style = 1
  End
  Begin VB.CommandButton cmdDelete
    Index = 10
    Left = 5520
    Top = 6720
    Width = 315
    Height = 315
    TabIndex = 65
    TabStop = 0   'False
    Picture = "frmDoctorSchedule.frx":31DA
    ToolTipText = "Delete Doctor Entry from Schedule ..."
    Style = 1
  End
  Begin VB.CommandButton cmdEdit
    Index = 10
    Left = 5190
    Top = 6720
    Width = 315
    Height = 315
    TabIndex = 64
    TabStop = 0   'False
    Picture = "frmDoctorSchedule.frx":3764
    ToolTipText = "Update Doctor Schedule Entry ..."
    Style = 1
  End
  Begin VB.CommandButton cmdAdd
    Index = 10
    Left = 4860
    Top = 6720
    Width = 315
    Height = 315
    TabIndex = 63
    TabStop = 0   'False
    Picture = "frmDoctorSchedule.frx":3CEE
    ToolTipText = "Add Doctor Entry to Schedule ..."
    Style = 1
  End
  Begin VB.CommandButton cmdDelete
    Index = 9
    Left = 3930
    Top = 6720
    Width = 315
    Height = 315
    TabIndex = 62
    TabStop = 0   'False
    Picture = "frmDoctorSchedule.frx":4278
    ToolTipText = "Delete Doctor Entry from Schedule ..."
    Style = 1
  End
  Begin VB.CommandButton cmdEdit
    Index = 9
    Left = 3600
    Top = 6720
    Width = 315
    Height = 315
    TabIndex = 61
    TabStop = 0   'False
    Picture = "frmDoctorSchedule.frx":4802
    ToolTipText = "Update Doctor Schedule Entry ..."
    Style = 1
  End
  Begin VB.CommandButton cmdAdd
    Index = 9
    Left = 3270
    Top = 6720
    Width = 315
    Height = 315
    TabIndex = 60
    TabStop = 0   'False
    Picture = "frmDoctorSchedule.frx":4D8C
    ToolTipText = "Add Doctor Entry to Schedule ..."
    Style = 1
  End
  Begin VB.CommandButton cmdDelete
    Index = 8
    Left = 2340
    Top = 6720
    Width = 315
    Height = 315
    TabIndex = 59
    TabStop = 0   'False
    Picture = "frmDoctorSchedule.frx":5316
    ToolTipText = "Delete Doctor Entry from Schedule ..."
    Style = 1
  End
  Begin VB.CommandButton cmdEdit
    Index = 8
    Left = 2010
    Top = 6720
    Width = 315
    Height = 315
    TabIndex = 58
    TabStop = 0   'False
    Picture = "frmDoctorSchedule.frx":58A0
    ToolTipText = "Update Doctor Schedule Entry ..."
    Style = 1
  End
  Begin VB.CommandButton cmdAdd
    Index = 8
    Left = 1680
    Top = 6720
    Width = 315
    Height = 315
    TabIndex = 57
    TabStop = 0   'False
    Picture = "frmDoctorSchedule.frx":5E2A
    ToolTipText = "Add Doctor Entry to Schedule ..."
    Style = 1
  End
  Begin VB.CommandButton cmdDelete
    Index = 7
    Left = 750
    Top = 6720
    Width = 315
    Height = 315
    TabIndex = 56
    TabStop = 0   'False
    Picture = "frmDoctorSchedule.frx":63B4
    ToolTipText = "Delete Doctor Entry from Schedule ..."
    Style = 1
  End
  Begin VB.CommandButton cmdEdit
    Index = 7
    Left = 420
    Top = 6720
    Width = 315
    Height = 315
    TabIndex = 55
    TabStop = 0   'False
    Picture = "frmDoctorSchedule.frx":693E
    ToolTipText = "Update Doctor Schedule Entry ..."
    Style = 1
  End
  Begin VB.CommandButton cmdAdd
    Index = 7
    Left = 90
    Top = 6720
    Width = 315
    Height = 315
    TabIndex = 54
    TabStop = 0   'False
    Picture = "frmDoctorSchedule.frx":6EC8
    ToolTipText = "Add Doctor Entry to Schedule ..."
    Style = 1
  End
  Begin VB.CommandButton cmdDelete
    Index = 6
    Left = 10290
    Top = 3180
    Width = 315
    Height = 315
    TabIndex = 45
    TabStop = 0   'False
    Picture = "frmDoctorSchedule.frx":7452
    ToolTipText = "Delete Doctor Entry from Schedule ..."
    Style = 1
  End
  Begin VB.CommandButton cmdEdit
    Index = 6
    Left = 9960
    Top = 3180
    Width = 315
    Height = 315
    TabIndex = 44
    TabStop = 0   'False
    Picture = "frmDoctorSchedule.frx":79DC
    ToolTipText = "Update Doctor Schedule Entry ..."
    Style = 1
  End
  Begin VB.CommandButton cmdAdd
    Index = 6
    Left = 9630
    Top = 3180
    Width = 315
    Height = 315
    TabIndex = 43
    TabStop = 0   'False
    Picture = "frmDoctorSchedule.frx":7F66
    ToolTipText = "Add Doctor Entry to Schedule ..."
    Style = 1
  End
  Begin VB.CommandButton cmdDelete
    Index = 5
    Left = 8700
    Top = 3180
    Width = 315
    Height = 315
    TabIndex = 42
    TabStop = 0   'False
    Picture = "frmDoctorSchedule.frx":84F0
    ToolTipText = "Delete Doctor Entry from Schedule ..."
    Style = 1
  End
  Begin VB.CommandButton cmdEdit
    Index = 5
    Left = 8370
    Top = 3180
    Width = 315
    Height = 315
    TabIndex = 41
    TabStop = 0   'False
    Picture = "frmDoctorSchedule.frx":8A7A
    ToolTipText = "Update Doctor Schedule Entry ..."
    Style = 1
  End
  Begin VB.CommandButton cmdAdd
    Index = 5
    Left = 8040
    Top = 3180
    Width = 315
    Height = 315
    TabIndex = 40
    TabStop = 0   'False
    Picture = "frmDoctorSchedule.frx":9004
    ToolTipText = "Add Doctor Entry to Schedule ..."
    Style = 1
  End
  Begin VB.CommandButton cmdDelete
    Index = 4
    Left = 7110
    Top = 3180
    Width = 315
    Height = 315
    TabIndex = 39
    TabStop = 0   'False
    Picture = "frmDoctorSchedule.frx":958E
    ToolTipText = "Delete Doctor Entry from Schedule ..."
    Style = 1
  End
  Begin VB.CommandButton cmdEdit
    Index = 4
    Left = 6780
    Top = 3180
    Width = 315
    Height = 315
    TabIndex = 38
    TabStop = 0   'False
    Picture = "frmDoctorSchedule.frx":9B18
    ToolTipText = "Update Doctor Schedule Entry ..."
    Style = 1
  End
  Begin VB.CommandButton cmdAdd
    Index = 4
    Left = 6450
    Top = 3180
    Width = 315
    Height = 315
    TabIndex = 37
    TabStop = 0   'False
    Picture = "frmDoctorSchedule.frx":A0A2
    ToolTipText = "Add Doctor Entry to Schedule ..."
    Style = 1
  End
  Begin VB.CommandButton cmdDelete
    Index = 3
    Left = 5520
    Top = 3180
    Width = 315
    Height = 315
    TabIndex = 36
    TabStop = 0   'False
    Picture = "frmDoctorSchedule.frx":A62C
    ToolTipText = "Delete Doctor Entry from Schedule ..."
    Style = 1
  End
  Begin VB.CommandButton cmdEdit
    Index = 3
    Left = 5190
    Top = 3180
    Width = 315
    Height = 315
    TabIndex = 35
    TabStop = 0   'False
    Picture = "frmDoctorSchedule.frx":ABB6
    ToolTipText = "Update Doctor Schedule Entry ..."
    Style = 1
  End
  Begin VB.CommandButton cmdAdd
    Index = 3
    Left = 4860
    Top = 3180
    Width = 315
    Height = 315
    TabIndex = 34
    TabStop = 0   'False
    Picture = "frmDoctorSchedule.frx":B140
    ToolTipText = "Add Doctor Entry to Schedule ..."
    Style = 1
  End
  Begin VB.CommandButton cmdDelete
    Index = 2
    Left = 3930
    Top = 3180
    Width = 315
    Height = 315
    TabIndex = 33
    TabStop = 0   'False
    Picture = "frmDoctorSchedule.frx":B6CA
    ToolTipText = "Delete Doctor Entry from Schedule ..."
    Style = 1
  End
  Begin VB.CommandButton cmdEdit
    Index = 2
    Left = 3600
    Top = 3180
    Width = 315
    Height = 315
    TabIndex = 32
    TabStop = 0   'False
    Picture = "frmDoctorSchedule.frx":BC54
    ToolTipText = "Update Doctor Schedule Entry ..."
    Style = 1
  End
  Begin VB.CommandButton cmdAdd
    Index = 2
    Left = 3270
    Top = 3180
    Width = 315
    Height = 315
    TabIndex = 31
    TabStop = 0   'False
    Picture = "frmDoctorSchedule.frx":C1DE
    ToolTipText = "Add Doctor Entry to Schedule ..."
    Style = 1
  End
  Begin VB.CommandButton cmdDelete
    Index = 1
    Left = 2340
    Top = 3180
    Width = 315
    Height = 315
    TabIndex = 30
    TabStop = 0   'False
    Picture = "frmDoctorSchedule.frx":C768
    ToolTipText = "Delete Doctor Entry from Schedule ..."
    Style = 1
  End
  Begin VB.CommandButton cmdEdit
    Index = 1
    Left = 2010
    Top = 3180
    Width = 315
    Height = 315
    TabIndex = 29
    TabStop = 0   'False
    Picture = "frmDoctorSchedule.frx":CCF2
    ToolTipText = "Update Doctor Schedule Entry ..."
    Style = 1
  End
  Begin VB.CommandButton cmdAdd
    Index = 1
    Left = 1680
    Top = 3180
    Width = 315
    Height = 315
    TabIndex = 28
    TabStop = 0   'False
    Picture = "frmDoctorSchedule.frx":D27C
    ToolTipText = "Add Doctor Entry to Schedule ..."
    Style = 1
  End
  Begin VB.CommandButton cmdDelete
    Index = 0
    Left = 750
    Top = 3180
    Width = 315
    Height = 315
    TabIndex = 27
    TabStop = 0   'False
    Picture = "frmDoctorSchedule.frx":D806
    ToolTipText = "Delete Doctor Entry from Schedule ..."
    Style = 1
  End
  Begin VB.CommandButton cmdEdit
    Index = 0
    Left = 420
    Top = 3180
    Width = 315
    Height = 315
    TabIndex = 26
    TabStop = 0   'False
    Picture = "frmDoctorSchedule.frx":DD90
    ToolTipText = "Update Doctor Schedule Entry ..."
    Style = 1
  End
  Begin VB.CommandButton cmdAdd
    Index = 0
    Left = 90
    Top = 3180
    Width = 315
    Height = 315
    TabIndex = 25
    TabStop = 0   'False
    Picture = "frmDoctorSchedule.frx":E31A
    ToolTipText = "Add Doctor Entry to Schedule ..."
    Style = 1
  End
  Begin TrueOleDBGrid80.TDBGrid tdbgSchedule
    Index = 0
    Left = 150
    Top = 930
    Width = 1485
    Height = 2145
    TabIndex = 0
  End
  Begin TrueOleDBGrid80.TDBGrid tdbgSchedule
    Index = 1
    Left = 1740
    Top = 930
    Width = 1485
    Height = 2145
    TabIndex = 1
  End
  Begin TrueOleDBGrid80.TDBGrid tdbgSchedule
    Index = 2
    Left = 3330
    Top = 930
    Width = 1485
    Height = 2145
    TabIndex = 2
  End
  Begin TrueOleDBGrid80.TDBGrid tdbgSchedule
    Index = 3
    Left = 4920
    Top = 930
    Width = 1485
    Height = 2145
    TabIndex = 3
  End
  Begin TrueOleDBGrid80.TDBGrid tdbgSchedule
    Index = 4
    Left = 6510
    Top = 930
    Width = 1485
    Height = 2145
    TabIndex = 4
  End
  Begin TrueOleDBGrid80.TDBGrid tdbgSchedule
    Index = 5
    Left = 8100
    Top = 930
    Width = 1485
    Height = 2145
    TabIndex = 5
  End
  Begin TrueOleDBGrid80.TDBGrid tdbgSchedule
    Index = 6
    Left = 9690
    Top = 930
    Width = 1485
    Height = 2145
    TabIndex = 6
  End
  Begin TrueOleDBGrid80.TDBGrid tdbgSchedule
    Index = 7
    Left = 150
    Top = 4470
    Width = 1485
    Height = 2145
    TabIndex = 7
  End
  Begin TrueOleDBGrid80.TDBGrid tdbgSchedule
    Index = 8
    Left = 1740
    Top = 4470
    Width = 1485
    Height = 2145
    TabIndex = 8
  End
  Begin TrueOleDBGrid80.TDBGrid tdbgSchedule
    Index = 9
    Left = 3330
    Top = 4470
    Width = 1485
    Height = 2145
    TabIndex = 9
  End
  Begin TrueOleDBGrid80.TDBGrid tdbgSchedule
    Index = 10
    Left = 4920
    Top = 4470
    Width = 1485
    Height = 2145
    TabIndex = 10
  End
  Begin TrueOleDBGrid80.TDBGrid tdbgSchedule
    Index = 11
    Left = 6510
    Top = 4470
    Width = 1485
    Height = 2145
    TabIndex = 11
  End
  Begin TrueOleDBGrid80.TDBGrid tdbgSchedule
    Index = 12
    Left = 8100
    Top = 4470
    Width = 1485
    Height = 2145
    TabIndex = 12
  End
  Begin TrueOleDBGrid80.TDBGrid tdbgSchedule
    Index = 13
    Left = 9690
    Top = 4470
    Width = 1485
    Height = 2145
    TabIndex = 13
  End
  Begin TDBDate6Ctl.TDBDate tdbdBiWeekStart
    Left = 7110
    Top = 150
    Width = 2595
    Height = 285
    TabIndex = 15
  End
  Begin VB.Label HeaderCaption
    Caption = "Week 2"
    Index = 1
    BackColor = &H80000005&
    ForeColor = &HFFFFFF&
    Left = 180
    Top = 3630
    Width = 1155
    Height = 405
    TabIndex = 53
    AutoSize = -1  'True
    BackStyle = 0 'Transparent
    BeginProperty Font
      Name = "Arial Black"
      Size = 14.25
      Charset = 0
      Weight = 400
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.Label lblDayCaption
    Caption = "Saturday"
    Index = 13
    ForeColor = &H996733&
    Left = 9690
    Top = 4110
    Width = 975
    Height = 270
    TabIndex = 52
    AutoSize = -1  'True
    BackStyle = 0 'Transparent
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
  Begin VB.Shape shapeBack
    Index = 13
    BorderColor = &HC0C0C0&
    Left = 9630
    Top = 4410
    Width = 1500
    Height = 2265
    FillColor = &HFFFFFF&
    FillStyle = 0
  End
  Begin VB.Label lblDayCaption
    Caption = "Friday"
    Index = 12
    ForeColor = &H996733&
    Left = 8100
    Top = 4110
    Width = 675
    Height = 270
    TabIndex = 51
    AutoSize = -1  'True
    BackStyle = 0 'Transparent
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
  Begin VB.Shape shapeBack
    Index = 12
    BorderColor = &HC0C0C0&
    Left = 8040
    Top = 4410
    Width = 1500
    Height = 2265
    FillColor = &HFFFFFF&
    FillStyle = 0
  End
  Begin VB.Label lblDayCaption
    Caption = "Thursday"
    Index = 11
    ForeColor = &H996733&
    Left = 6510
    Top = 4110
    Width = 1005
    Height = 270
    TabIndex = 50
    AutoSize = -1  'True
    BackStyle = 0 'Transparent
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
  Begin VB.Shape shapeBack
    Index = 11
    BorderColor = &HC0C0C0&
    Left = 6450
    Top = 4410
    Width = 1500
    Height = 2265
    FillColor = &HFFFFFF&
    FillStyle = 0
  End
  Begin VB.Label lblDayCaption
    Caption = "Wednesday"
    Index = 10
    ForeColor = &H996733&
    Left = 4920
    Top = 4110
    Width = 1245
    Height = 270
    TabIndex = 49
    AutoSize = -1  'True
    BackStyle = 0 'Transparent
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
  Begin VB.Shape shapeBack
    Index = 10
    BorderColor = &HC0C0C0&
    Left = 4860
    Top = 4410
    Width = 1500
    Height = 2265
    FillColor = &HFFFFFF&
    FillStyle = 0
  End
  Begin VB.Label lblDayCaption
    Caption = "Tuesday"
    Index = 9
    ForeColor = &H996733&
    Left = 3330
    Top = 4110
    Width = 915
    Height = 270
    TabIndex = 48
    AutoSize = -1  'True
    BackStyle = 0 'Transparent
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
  Begin VB.Shape shapeBack
    Index = 9
    BorderColor = &HC0C0C0&
    Left = 3270
    Top = 4410
    Width = 1500
    Height = 2265
    FillColor = &HFFFFFF&
    FillStyle = 0
  End
  Begin VB.Label lblDayCaption
    Caption = "Monday"
    Index = 8
    ForeColor = &H996733&
    Left = 1740
    Top = 4110
    Width = 840
    Height = 270
    TabIndex = 47
    AutoSize = -1  'True
    BackStyle = 0 'Transparent
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
  Begin VB.Shape shapeBack
    Index = 8
    BorderColor = &HC0C0C0&
    Left = 1680
    Top = 4410
    Width = 1500
    Height = 2265
    FillColor = &HFFFFFF&
    FillStyle = 0
  End
  Begin VB.Label lblDayCaption
    Caption = "Sunday"
    Index = 7
    ForeColor = &H996733&
    Left = 150
    Top = 4110
    Width = 795
    Height = 270
    TabIndex = 46
    AutoSize = -1  'True
    BackStyle = 0 'Transparent
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
  Begin VB.Shape shapeBack
    Index = 7
    BorderColor = &HC0C0C0&
    Left = 90
    Top = 4410
    Width = 1500
    Height = 2265
    FillColor = &HFFFFFF&
    FillStyle = 0
  End
  Begin VB.Label HeaderCaption
    Caption = "Week 1"
    Index = 0
    BackColor = &H80000005&
    ForeColor = &HFFFFFF&
    Left = 180
    Top = 90
    Width = 1155
    Height = 405
    TabIndex = 24
    AutoSize = -1  'True
    BackStyle = 0 'Transparent
    BeginProperty Font
      Name = "Arial Black"
      Size = 14.25
      Charset = 0
      Weight = 400
      Underline = 0 'False
      Italic = 0 'False
      Strikethrough = 0 'False
    EndProperty
    Appearance = 0 'Flat
  End
  Begin VB.Label lblDayCaption
    Caption = "Saturday"
    Index = 6
    ForeColor = &H996733&
    Left = 9690
    Top = 570
    Width = 975
    Height = 270
    TabIndex = 23
    AutoSize = -1  'True
    BackStyle = 0 'Transparent
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
  Begin VB.Shape shapeBack
    Index = 6
    BorderColor = &HC0C0C0&
    Left = 9630
    Top = 870
    Width = 1500
    Height = 2265
    FillColor = &HFFFFFF&
    FillStyle = 0
  End
  Begin VB.Label lblDayCaption
    Caption = "Friday"
    Index = 5
    ForeColor = &H996733&
    Left = 8100
    Top = 570
    Width = 675
    Height = 270
    TabIndex = 22
    AutoSize = -1  'True
    BackStyle = 0 'Transparent
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
  Begin VB.Shape shapeBack
    Index = 5
    BorderColor = &HC0C0C0&
    Left = 8040
    Top = 870
    Width = 1500
    Height = 2265
    FillColor = &HFFFFFF&
    FillStyle = 0
  End
  Begin VB.Label lblDayCaption
    Caption = "Thursday"
    Index = 4
    ForeColor = &H996733&
    Left = 6510
    Top = 570
    Width = 1005
    Height = 270
    TabIndex = 21
    AutoSize = -1  'True
    BackStyle = 0 'Transparent
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
  Begin VB.Shape shapeBack
    Index = 4
    BorderColor = &HC0C0C0&
    Left = 6450
    Top = 870
    Width = 1500
    Height = 2265
    FillColor = &HFFFFFF&
    FillStyle = 0
  End
  Begin VB.Label lblDayCaption
    Caption = "Wednesday"
    Index = 3
    ForeColor = &H996733&
    Left = 4920
    Top = 570
    Width = 1245
    Height = 270
    TabIndex = 20
    AutoSize = -1  'True
    BackStyle = 0 'Transparent
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
  Begin VB.Shape shapeBack
    Index = 3
    BorderColor = &HC0C0C0&
    Left = 4860
    Top = 870
    Width = 1500
    Height = 2265
    FillColor = &HFFFFFF&
    FillStyle = 0
  End
  Begin VB.Label lblDayCaption
    Caption = "Tuesday"
    Index = 2
    ForeColor = &H996733&
    Left = 3330
    Top = 570
    Width = 915
    Height = 270
    TabIndex = 19
    AutoSize = -1  'True
    BackStyle = 0 'Transparent
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
  Begin VB.Shape shapeBack
    Index = 2
    BorderColor = &HC0C0C0&
    Left = 3270
    Top = 870
    Width = 1500
    Height = 2265
    FillColor = &HFFFFFF&
    FillStyle = 0
  End
  Begin VB.Label lblDayCaption
    Caption = "Monday"
    Index = 1
    ForeColor = &H996733&
    Left = 1740
    Top = 570
    Width = 840
    Height = 270
    TabIndex = 18
    AutoSize = -1  'True
    BackStyle = 0 'Transparent
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
  Begin VB.Shape shapeBack
    Index = 1
    BorderColor = &HC0C0C0&
    Left = 1680
    Top = 870
    Width = 1500
    Height = 2265
    FillColor = &HFFFFFF&
    FillStyle = 0
  End
  Begin VB.Label lblDayCaption
    Caption = "Sunday"
    Index = 0
    ForeColor = &H996733&
    Left = 150
    Top = 570
    Width = 795
    Height = 270
    TabIndex = 17
    AutoSize = -1  'True
    BackStyle = 0 'Transparent
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
  Begin VB.Shape shapeBack
    Index = 0
    BorderColor = &HC0C0C0&
    Left = 90
    Top = 870
    Width = 1500
    Height = 2265
    FillColor = &HFFFFFF&
    FillStyle = 0
  End
  Begin VB.Shape shHeader
    Index = 0
    Left = 90
    Top = 90
    Width = 11145
    Height = 435
    BorderStyle = 0 'None
    FillColor = &HFFC0C0&
    FillStyle = 0
  End
  Begin VB.Shape shHeader
    Index = 1
    Left = 90
    Top = 3630
    Width = 11145
    Height = 435
    BorderStyle = 0 'None
    FillColor = &HFFC0C0&
    FillStyle = 0
  End
End

Attribute VB_Name = "frmDoctorSchedule"