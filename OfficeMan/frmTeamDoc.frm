VERSION 5.00
Begin VB.Form frmTeamDoc 
   Caption         =   " Team Document"
   ClientHeight    =   8190
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   11880
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H8000000F&
   Icon            =   "frmTeamDoc.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   ScaleHeight     =   8190
   ScaleWidth      =   11880
   Begin VB.CommandButton cmdExpand 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      Height          =   315
      Left            =   11070
      MaskColor       =   &H00FFFFFF&
      Picture         =   "frmTeamDoc.frx":0442
      Style           =   1  'Graphical
      TabIndex        =   205
      TabStop         =   0   'False
      ToolTipText     =   "Enlarge / Shrink Team Grid"
      Top             =   30
      Width           =   795
   End
   Begin VB.PictureBox tdbgTeamDoc 
      Height          =   2265
      Left            =   0
      ScaleHeight     =   2205
      ScaleWidth      =   11805
      TabIndex        =   0
      Top             =   420
      Width           =   11865
   End
   Begin VB.CommandButton cmdPrintTeamDoc 
      Caption         =   "(Detailed)"
      Height          =   375
      Index           =   1
      Left            =   9390
      TabIndex        =   175
      ToolTipText     =   "Print Team Document (Detailed)"
      Top             =   7800
      Width           =   1125
   End
   Begin VB.CommandButton cmdDate 
      Height          =   315
      Index           =   1
      Left            =   4260
      Picture         =   "frmTeamDoc.frx":0904
      Style           =   1  'Graphical
      TabIndex        =   3
      TabStop         =   0   'False
      ToolTipText     =   "Next Day"
      Top             =   30
      Width           =   345
   End
   Begin VB.CommandButton cmdDate 
      Height          =   315
      Index           =   0
      Left            =   3900
      Picture         =   "frmTeamDoc.frx":0A4E
      Style           =   1  'Graphical
      TabIndex        =   2
      TabStop         =   0   'False
      ToolTipText     =   "Previous Day"
      Top             =   30
      Width           =   345
   End
   Begin VB.CommandButton cmdCheckIn 
      Caption         =   "Check In"
      Height          =   315
      Left            =   9990
      TabIndex        =   196
      TabStop         =   0   'False
      ToolTipText     =   "Check in Patient"
      Top             =   30
      Width           =   1035
   End
   Begin VB.CommandButton cmdRefresh 
      Caption         =   "Refresh"
      Height          =   375
      Left            =   6810
      TabIndex        =   173
      ToolTipText     =   "Refresh Team Document"
      Top             =   7800
      Width           =   1005
   End
   Begin VB.CommandButton cmdPrintTeamDoc 
      Caption         =   "Print Team"
      Height          =   375
      Index           =   0
      Left            =   7860
      TabIndex        =   174
      ToolTipText     =   "Print Team Document (Summarized)"
      Top             =   7800
      Width           =   1485
   End
   Begin VB.ComboBox cboSort 
      BackColor       =   &H00E0E0E0&
      ForeColor       =   &H00000000&
      Height          =   345
      Left            =   6570
      Style           =   2  'Dropdown List
      TabIndex        =   5
      TabStop         =   0   'False
      Top             =   30
      Width           =   3375
   End
   Begin VB.CommandButton cmdMarkAppointment 
      Caption         =   "Mark Appt."
      Height          =   375
      Left            =   0
      TabIndex        =   172
      TabStop         =   0   'False
      ToolTipText     =   "Mark Appointment"
      Top             =   7800
      Width           =   1215
   End
   Begin VB.CommandButton cmdToday 
      Caption         =   "Today"
      Height          =   315
      Left            =   4650
      TabIndex        =   4
      TabStop         =   0   'False
      ToolTipText     =   "Move to Today"
      Top             =   30
      Width           =   795
   End
   Begin VB.Timer tmrRefresh 
      Interval        =   60000
      Left            =   11430
      Top             =   0
   End
   Begin VB.PictureBox picDataEntry 
      Appearance      =   0  'Flat
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   4095
      Left            =   0
      ScaleHeight     =   4095
      ScaleWidth      =   11865
      TabIndex        =   129
      Top             =   3690
      Width           =   11865
      Begin VB.CommandButton cmdSave 
         Height          =   315
         Index           =   0
         Left            =   7620
         Picture         =   "frmTeamDoc.frx":0B98
         Style           =   1  'Graphical
         TabIndex        =   9
         Top             =   30
         Width           =   500
      End
      Begin VB.CommandButton cmdCancel 
         Height          =   315
         Index           =   0
         Left            =   8130
         Picture         =   "frmTeamDoc.frx":0CE2
         Style           =   1  'Graphical
         TabIndex        =   10
         Top             =   30
         Width           =   500
      End
      Begin VB.CommandButton cmdEdit 
         Caption         =   "Edit"
         Height          =   315
         Index           =   0
         Left            =   6660
         TabIndex        =   8
         Top             =   30
         Width           =   915
      End
      Begin VB.PictureBox tabMain 
         Height          =   3555
         Left            =   0
         ScaleHeight     =   3495
         ScaleWidth      =   11805
         TabIndex        =   11
         Top             =   480
         Width           =   11865
         Begin VB.CommandButton cmdActivityLogReports 
            Caption         =   "Reports"
            Height          =   420
            Left            =   32768
            TabIndex        =   104
            Top             =   65192
            Width           =   65534
         End
         Begin VB.CommandButton cmdShowAll_ActivityLog 
            Caption         =   "Show All"
            Height          =   420
            Left            =   32768
            TabIndex        =   108
            Top             =   63722
            Width           =   65534
         End
         Begin VB.PictureBox picLogTypeFilter 
            ForeColor       =   &H80000008&
            Height          =   780
            Left            =   32768
            ScaleHeight     =   720
            ScaleWidth      =   65475
            TabIndex        =   110
            Top             =   60272
            Width           =   65534
            Begin VB.CommandButton cmdLogTypeCancel 
               Caption         =   "Cancel"
               Height          =   315
               Left            =   4470
               TabIndex        =   202
               Top             =   2100
               Width           =   1185
            End
            Begin VB.CommandButton cmdLogTypeOK 
               Caption         =   "OK"
               Height          =   315
               Left            =   3240
               TabIndex        =   201
               Top             =   2100
               Width           =   1185
            End
            Begin VB.ListBox lstLogTypeFilter 
               Appearance      =   0  'Flat
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   1950
               IntegralHeight  =   0   'False
               Left            =   60
               Style           =   1  'Checkbox
               TabIndex        =   200
               Top             =   90
               Width           =   5595
            End
         End
         Begin VB.CommandButton cmdRefreshUserActLog 
            Caption         =   "Refresh"
            Height          =   420
            Left            =   32768
            TabIndex        =   111
            Top             =   1126
            Width           =   65535
         End
         Begin VB.CommandButton cmdFilterLogType 
            Height          =   420
            Left            =   32768
            TabIndex        =   112
            Top             =   60272
            Width           =   65534
         End
         Begin VB.CommandButton cmdReport_Cancellation 
            Caption         =   "Cancellation Report (All)"
            Height          =   480
            Index           =   1
            Left            =   32768
            TabIndex        =   113
            Top             =   63662
            Width           =   65534
         End
         Begin VB.PictureBox picTemp 
            ForeColor       =   &H80000008&
            Height          =   360
            Left            =   32768
            ScaleHeight     =   300
            ScaleWidth      =   65475
            TabIndex        =   114
            Top             =   62672
            Width           =   65534
            Begin VB.CommandButton cmdEdit 
               Caption         =   "Edit"
               Height          =   315
               Index           =   8
               Left            =   60
               TabIndex        =   105
               Top             =   60
               Width           =   915
            End
            Begin VB.CommandButton cmdCancel 
               Height          =   315
               Index           =   8
               Left            =   1560
               Picture         =   "frmTeamDoc.frx":0E2C
               Style           =   1  'Graphical
               TabIndex        =   107
               Top             =   60
               Width           =   500
            End
            Begin VB.CommandButton cmdSave 
               Height          =   315
               Index           =   8
               Left            =   1020
               Picture         =   "frmTeamDoc.frx":0F76
               Style           =   1  'Graphical
               TabIndex        =   106
               Top             =   60
               Width           =   500
            End
            Begin VB.Label lblUpdateCancellationReason 
               AutoSize        =   -1  'True
               BackStyle       =   0  'Transparent
               Caption         =   "Updated By:"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               ForeColor       =   &H00C00000&
               Height          =   210
               Left            =   2220
               TabIndex        =   195
               Top             =   120
               Width           =   2655
               WordWrap        =   -1  'True
            End
         End
         Begin VB.CommandButton cmdReport_NoShow 
            Caption         =   "No Show Report"
            Height          =   480
            Left            =   32768
            TabIndex        =   115
            Top             =   466
            Width           =   65535
         End
         Begin VB.CommandButton cmdPrintEnvelope 
            Caption         =   "Print Enveloper for Billy Bob"
            Height          =   3000
            Left            =   32768
            TabIndex        =   116
            Top             =   56252
            Width           =   65534
         End
         Begin VB.CommandButton cmdPrintCancellationLetter 
            Caption         =   "Print Cancellation Letter for Billy Bob"
            Height          =   2100
            Left            =   32768
            TabIndex        =   117
            Top             =   61622
            Width           =   65534
         End
         Begin VB.CommandButton cmdAddPatientLogEntry 
            Caption         =   "Add Patient Log Entry"
            Height          =   390
            Left            =   32768
            TabIndex        =   118
            Top             =   65492
            Width           =   65534
         End
         Begin VB.CommandButton cmdReport_Cancellation 
            Caption         =   "Cancellation Report (Unresolved)"
            Height          =   480
            Index           =   0
            Left            =   32768
            TabIndex        =   119
            Top             =   60542
            Width           =   65534
         End
         Begin VB.CommandButton cmdPrintPatientDue 
            Caption         =   "Print Patient Due Letter for All Patients on 01/01/1111"
            Height          =   2550
            Index           =   1
            Left            =   32768
            TabIndex        =   120
            Top             =   56252
            Width           =   65534
         End
         Begin VB.CommandButton cmdPrintPatientDue 
            Caption         =   "Print Patient Due Letter for Billy Bob"
            Height          =   2100
            Index           =   0
            Left            =   32768
            TabIndex        =   121
            Top             =   56252
            Width           =   65534
         End
         Begin VB.CommandButton cmdReport_Billing 
            Caption         =   "Billing Report"
            Height          =   480
            Left            =   32768
            TabIndex        =   122
            Top             =   58982
            Width           =   65534
         End
         Begin VB.CommandButton cmdReport_FollowupReminder 
            Caption         =   "Follow Up Reminder Report"
            Height          =   480
            Left            =   32768
            TabIndex        =   123
            Top             =   56222
            Width           =   65534
         End
         Begin VB.PictureBox pbStats 
            Height          =   540
            Index           =   0
            Left            =   32768
            ScaleHeight     =   480
            ScaleWidth      =   65475
            TabIndex        =   124
            Top             =   59042
            Width           =   65534
         End
         Begin VB.PictureBox picInsuranceInfo 
            Appearance      =   0  'Flat
            BorderStyle     =   0  'None
            ForeColor       =   &H80000008&
            Height          =   3195
            Left            =   30
            ScaleHeight     =   3195
            ScaleWidth      =   11775
            TabIndex        =   142
            Top             =   330
            Width           =   11775
            Begin VB.PictureBox picHoldClaim 
               Appearance      =   0  'Flat
               BorderStyle     =   0  'None
               ForeColor       =   &H80000008&
               Height          =   405
               Left            =   9870
               ScaleHeight     =   405
               ScaleWidth      =   1875
               TabIndex        =   210
               Top             =   1620
               Width           =   1875
               Begin VB.CheckBox chkHold 
                  Appearance      =   0  'Flat
                  Caption         =   "Hold Claim"
                  BeginProperty Font 
                     Name            =   "Arial Black"
                     Size            =   12
                     Charset         =   0
                     Weight          =   400
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  ForeColor       =   &H00808080&
                  Height          =   405
                  Left            =   90
                  TabIndex        =   38
                  Top             =   0
                  Width           =   1785
               End
            End
            Begin VB.CommandButton cmdEdit 
               Caption         =   "Edit"
               Height          =   315
               Index           =   4
               Left            =   120
               TabIndex        =   31
               Top             =   1260
               Width           =   915
            End
            Begin VB.CommandButton cmdCancel 
               Height          =   315
               Index           =   4
               Left            =   1620
               Picture         =   "frmTeamDoc.frx":10C0
               Style           =   1  'Graphical
               TabIndex        =   33
               Top             =   1260
               Width           =   500
            End
            Begin VB.CommandButton cmdSave 
               Height          =   315
               Index           =   4
               Left            =   1080
               Picture         =   "frmTeamDoc.frx":120A
               Style           =   1  'Graphical
               TabIndex        =   32
               Top             =   1260
               Width           =   500
            End
            Begin VB.PictureBox picAmountNegotiated 
               Appearance      =   0  'Flat
               BorderStyle     =   0  'None
               ForeColor       =   &H80000008&
               Height          =   345
               Left            =   1020
               ScaleHeight     =   345
               ScaleWidth      =   8205
               TabIndex        =   206
               Top             =   2010
               Width           =   8205
               Begin VB.CheckBox chkAmountNegotiated 
                  Appearance      =   0  'Flat
                  Caption         =   " Amt. Negotiated"
                  BeginProperty Font 
                     Name            =   "Arial"
                     Size            =   8.25
                     Charset         =   0
                     Weight          =   400
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  ForeColor       =   &H80000008&
                  Height          =   225
                  Left            =   120
                  TabIndex        =   39
                  Top             =   90
                  Width           =   1515
               End
               Begin VB.PictureBox tdbnNegPatientAmt 
                  Height          =   315
                  Left            =   1830
                  ScaleHeight     =   255
                  ScaleWidth      =   1485
                  TabIndex        =   40
                  Top             =   30
                  Width           =   1545
               End
               Begin VB.PictureBox tdbtNegReason 
                  Height          =   315
                  Left            =   3510
                  ScaleHeight     =   255
                  ScaleWidth      =   4605
                  TabIndex        =   41
                  Top             =   30
                  Width           =   4665
               End
            End
            Begin VB.PictureBox tdbnPInsAllowable 
               Height          =   345
               Left            =   6360
               ScaleHeight     =   285
               ScaleWidth      =   1200
               TabIndex        =   19
               Top             =   480
               Width           =   1260
            End
            Begin VB.PictureBox tdbtPInsName 
               Height          =   315
               Left            =   150
               ScaleHeight     =   255
               ScaleWidth      =   2145
               TabIndex        =   15
               Top             =   480
               Width           =   2205
            End
            Begin VB.PictureBox tdbnPInsCoIns 
               Height          =   315
               Left            =   10230
               ScaleHeight     =   255
               ScaleWidth      =   1095
               TabIndex        =   22
               Top             =   480
               Width           =   1155
            End
            Begin VB.PictureBox tdbnPInsDeduct 
               Height          =   315
               Left            =   2460
               ScaleHeight     =   255
               ScaleWidth      =   1140
               TabIndex        =   16
               Top             =   480
               Width           =   1200
            End
            Begin VB.PictureBox tdbnPInsDeductMet 
               Height          =   315
               Left            =   3750
               ScaleHeight     =   255
               ScaleWidth      =   1140
               TabIndex        =   17
               Top             =   480
               Width           =   1200
            End
            Begin VB.PictureBox tdbnPInsCoPay 
               Height          =   315
               Left            =   8880
               ScaleHeight     =   255
               ScaleWidth      =   1185
               TabIndex        =   21
               Top             =   480
               Width           =   1245
            End
            Begin VB.PictureBox tdbtInsVerifiedNote 
               Height          =   315
               Left            =   5310
               ScaleHeight     =   255
               ScaleWidth      =   6345
               TabIndex        =   48
               Top             =   2790
               Width           =   6405
            End
            Begin VB.PictureBox tdbtAuthorization 
               Height          =   315
               Left            =   6600
               ScaleHeight     =   255
               ScaleWidth      =   5055
               TabIndex        =   49
               Top             =   2490
               Width           =   5115
            End
            Begin VB.PictureBox tdbcPInsAllowLookup 
               Height          =   345
               Left            =   7590
               ScaleHeight     =   285
               ScaleWidth      =   1095
               TabIndex        =   20
               TabStop         =   0   'False
               Top             =   480
               Width           =   1155
            End
            Begin VB.CommandButton cmdSave 
               Height          =   315
               Index           =   5
               Left            =   1080
               Picture         =   "frmTeamDoc.frx":1354
               Style           =   1  'Graphical
               TabIndex        =   44
               Top             =   2460
               Width           =   500
            End
            Begin VB.CommandButton cmdSave 
               Height          =   315
               Index           =   1
               Left            =   1080
               Picture         =   "frmTeamDoc.frx":149E
               Style           =   1  'Graphical
               TabIndex        =   13
               Top             =   90
               Width           =   500
            End
            Begin VB.CommandButton cmdCancel 
               Height          =   315
               Index           =   5
               Left            =   1620
               Picture         =   "frmTeamDoc.frx":15E8
               Style           =   1  'Graphical
               TabIndex        =   45
               Top             =   2460
               Width           =   500
            End
            Begin VB.CommandButton cmdCancel 
               Height          =   315
               Index           =   1
               Left            =   1620
               Picture         =   "frmTeamDoc.frx":1732
               Style           =   1  'Graphical
               TabIndex        =   14
               Top             =   90
               Width           =   500
            End
            Begin VB.PictureBox picInsVerified 
               Appearance      =   0  'Flat
               BorderStyle     =   0  'None
               ForeColor       =   &H80000008&
               Height          =   375
               Left            =   90
               ScaleHeight     =   375
               ScaleWidth      =   2175
               TabIndex        =   147
               Top             =   2790
               Width           =   2175
               Begin VB.CheckBox chkInsVerified 
                  Appearance      =   0  'Flat
                  Caption         =   " Insurance Verified"
                  BeginProperty Font 
                     Name            =   "Arial"
                     Size            =   8.25
                     Charset         =   0
                     Weight          =   400
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  ForeColor       =   &H80000008&
                  Height          =   225
                  Left            =   60
                  TabIndex        =   46
                  Top             =   60
                  Width           =   1875
               End
            End
            Begin VB.CommandButton cmdEdit 
               Caption         =   "Edit"
               Height          =   315
               Index           =   5
               Left            =   120
               TabIndex        =   43
               Top             =   2460
               Width           =   915
            End
            Begin VB.CommandButton cmdEdit 
               Caption         =   "Edit"
               Height          =   315
               Index           =   1
               Left            =   120
               TabIndex        =   12
               Top             =   90
               Width           =   915
            End
            Begin VB.PictureBox tdbdDateInsVerified 
               Height          =   315
               Left            =   2400
               ScaleHeight     =   255
               ScaleWidth      =   2595
               TabIndex        =   47
               Top             =   2790
               Width           =   2655
            End
            Begin VB.PictureBox tdbnSInsAllowable 
               Height          =   345
               Left            =   6360
               ScaleHeight     =   285
               ScaleWidth      =   1200
               TabIndex        =   27
               Top             =   870
               Width           =   1260
            End
            Begin VB.PictureBox tdbtSInsName 
               Height          =   315
               Left            =   150
               ScaleHeight     =   255
               ScaleWidth      =   2145
               TabIndex        =   23
               Top             =   870
               Width           =   2205
            End
            Begin VB.PictureBox tdbcSInsAllowLookup 
               Height          =   345
               Left            =   7590
               ScaleHeight     =   285
               ScaleWidth      =   1095
               TabIndex        =   28
               TabStop         =   0   'False
               Top             =   870
               Width           =   1155
            End
            Begin VB.PictureBox tdbnSInsCoIns 
               Height          =   315
               Left            =   10230
               ScaleHeight     =   255
               ScaleWidth      =   1095
               TabIndex        =   30
               Top             =   870
               Width           =   1155
            End
            Begin VB.PictureBox tdbnSInsDeduct 
               Height          =   315
               Left            =   2460
               ScaleHeight     =   255
               ScaleWidth      =   1140
               TabIndex        =   24
               Top             =   870
               Width           =   1200
            End
            Begin VB.PictureBox tdbnSInsDeductMet 
               Height          =   315
               Left            =   3750
               ScaleHeight     =   255
               ScaleWidth      =   1140
               TabIndex        =   25
               Top             =   870
               Width           =   1200
            End
            Begin VB.PictureBox tdbnSInsCoPay 
               Height          =   315
               Left            =   8880
               ScaleHeight     =   255
               ScaleWidth      =   1185
               TabIndex        =   29
               Top             =   870
               Width           =   1245
            End
            Begin VB.PictureBox tdbnSInsDeductBalance 
               Height          =   315
               Left            =   5040
               ScaleHeight     =   255
               ScaleWidth      =   1140
               TabIndex        =   26
               TabStop         =   0   'False
               Top             =   870
               Width           =   1200
            End
            Begin VB.PictureBox tdbnPInsDeductBalance 
               Height          =   315
               Left            =   5040
               ScaleHeight     =   255
               ScaleWidth      =   1140
               TabIndex        =   18
               TabStop         =   0   'False
               Top             =   480
               Width           =   1200
            End
            Begin VB.PictureBox picDedAppliesProfSide 
               Appearance      =   0  'Flat
               BorderStyle     =   0  'None
               ForeColor       =   &H80000008&
               Height          =   375
               Left            =   7950
               ScaleHeight     =   375
               ScaleWidth      =   3795
               TabIndex        =   187
               Top             =   60
               Width           =   3795
               Begin VB.CheckBox chkDedAppliesProfSide 
                  Alignment       =   1  'Right Justify
                  Appearance      =   0  'Flat
                  Caption         =   " Deductible Applies to Professional Side"
                  BeginProperty Font 
                     Name            =   "Arial"
                     Size            =   8.25
                     Charset         =   0
                     Weight          =   400
                     Underline       =   0   'False
                     Italic          =   0   'False
                     Strikethrough   =   0   'False
                  EndProperty
                  ForeColor       =   &H80000008&
                  Height          =   225
                  Left            =   450
                  TabIndex        =   42
                  Top             =   60
                  Width           =   3285
               End
            End
            Begin VB.PictureBox tdbnTotalDue 
               Height          =   315
               Left            =   2100
               ScaleHeight     =   255
               ScaleWidth      =   1560
               TabIndex        =   35
               Top             =   1650
               Width           =   1620
            End
            Begin VB.PictureBox tdbnPatientAmount 
               Height          =   315
               Left            =   150
               ScaleHeight     =   255
               ScaleWidth      =   1770
               TabIndex        =   34
               Top             =   1650
               Width           =   1830
            End
            Begin VB.PictureBox tdbnAmountPaid 
               Height          =   315
               Left            =   3870
               ScaleHeight     =   255
               ScaleWidth      =   1815
               TabIndex        =   36
               Top             =   1650
               Width           =   1875
            End
            Begin VB.PictureBox tdbcPayMethod 
               Height          =   345
               Left            =   6900
               ScaleHeight     =   285
               ScaleWidth      =   1365
               TabIndex        =   37
               Top             =   1650
               Width           =   1425
            End
            Begin VB.Label lblFinalPatientAmount 
               Alignment       =   1  'Right Justify
               Caption         =   "Amount Due by Patient: $"
               BeginProperty Font 
                  Name            =   "Arial Black"
                  Size            =   12
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   375
               Left            =   6180
               TabIndex        =   209
               Top             =   1260
               Width           =   5475
            End
            Begin VB.Label Label8 
               AutoSize        =   -1  'True
               Caption         =   "Pay Method"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   210
               Left            =   5910
               TabIndex        =   208
               Top             =   1710
               Width           =   840
            End
            Begin VB.Label lblUpdateBilling 
               AutoSize        =   -1  'True
               BackStyle       =   0  'Transparent
               Caption         =   "Updated By:"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               ForeColor       =   &H00C00000&
               Height          =   210
               Left            =   2250
               TabIndex        =   207
               Top             =   1290
               Width           =   3225
               WordWrap        =   -1  'True
            End
            Begin VB.Label lblUpdateInsVerified 
               AutoSize        =   -1  'True
               BackStyle       =   0  'Transparent
               Caption         =   "Updated By:"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               ForeColor       =   &H00C00000&
               Height          =   210
               Left            =   2250
               TabIndex        =   144
               Top             =   2490
               Width           =   4275
               WordWrap        =   -1  'True
            End
            Begin VB.Label lblUpdateInsurance 
               AutoSize        =   -1  'True
               BackStyle       =   0  'Transparent
               Caption         =   "Updated By:"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               ForeColor       =   &H00C00000&
               Height          =   210
               Left            =   2250
               TabIndex        =   143
               Top             =   120
               Width           =   4275
               WordWrap        =   -1  'True
            End
         End
         Begin VB.PictureBox picPreOpConfirms 
            ForeColor       =   &H80000008&
            Height          =   330
            Left            =   32768
            ScaleHeight     =   270
            ScaleWidth      =   65475
            TabIndex        =   125
            Top             =   56102
            Width           =   65534
            Begin VB.CommandButton cmdSave 
               Height          =   315
               Index           =   7
               Left            =   1080
               Picture         =   "frmTeamDoc.frx":187C
               Style           =   1  'Graphical
               TabIndex        =   63
               Top             =   1590
               Width           =   500
            End
            Begin VB.CommandButton cmdSave 
               Height          =   315
               Index           =   6
               Left            =   1080
               Picture         =   "frmTeamDoc.frx":19C6
               Style           =   1  'Graphical
               TabIndex        =   57
               Top             =   870
               Width           =   500
            End
            Begin VB.CommandButton cmdSave 
               Height          =   315
               Index           =   2
               Left            =   1080
               Picture         =   "frmTeamDoc.frx":1B10
               Style           =   1  'Graphical
               TabIndex        =   51
               Top             =   90
               Width           =   500
            End
            Begin VB.CommandButton cmdCancel 
               Height          =   315
               Index           =   7
               Left            =   1620
               Picture         =   "frmTeamDoc.frx":1C5A
               Style           =   1  'Graphical
               TabIndex        =   64
               Top             =   1590
               Width           =   500
            End
            Begin VB.CommandButton cmdCancel 
               Height          =   315
               Index           =   6
               Left            =   1620
               Picture         =   "frmTeamDoc.frx":1DA4
               Style           =   1  'Graphical
               TabIndex        =   58
               Top             =   870
               Width           =   500
            End
            Begin VB.CommandButton cmdCancel 
               Height          =   315
               Index           =   2
               Left            =   1620
               Picture         =   "frmTeamDoc.frx":1EEE
               Style           =   1  'Graphical
               TabIndex        =   52
               Top             =   90
               Width           =   500
            End
            Begin VB.PictureBox picPacketMailed 
               Appearance      =   0  'Flat
               BorderStyle     =   0  'None
               ForeColor       =   &H80000008&
               Height          =   345
               Left            =   120
               ScaleHeight     =   345
               ScaleWidth      =   1725
               TabIndex        =   148
               Top             =   420
               Width           =   1725
               Begin VB.CheckBox chkPacketMailed 
                  Appearance      =   0  'Flat
                  Caption         =   " Packet Mailed"
                  ForeColor       =   &H80000008&
                  Height          =   225
                  Left            =   30
                  TabIndex        =   53
                  Top             =   60
                  Width           =   1755
               End
            End
            Begin VB.CommandButton cmdEdit 
               Caption         =   "Edit"
               Height          =   315
               Index           =   7
               Left            =   120
               TabIndex        =   62
               Top             =   1590
               Width           =   915
            End
            Begin VB.CommandButton cmdEdit 
               Caption         =   "Edit"
               Height          =   315
               Index           =   6
               Left            =   120
               TabIndex        =   56
               Top             =   870
               Width           =   915
            End
            Begin VB.CommandButton cmdEdit 
               Caption         =   "Edit"
               Height          =   315
               Index           =   2
               Left            =   120
               TabIndex        =   50
               Top             =   90
               Width           =   915
            End
            Begin VB.PictureBox tdbdPacketMailed 
               Height          =   315
               Left            =   1920
               ScaleHeight     =   255
               ScaleWidth      =   1215
               TabIndex        =   54
               Top             =   450
               Width           =   1275
            End
            Begin VB.PictureBox tdbtPacketMailedNote 
               Height          =   315
               Left            =   3330
               ScaleHeight     =   255
               ScaleWidth      =   5445
               TabIndex        =   55
               Top             =   450
               Width           =   5505
            End
            Begin VB.PictureBox tdbdIntroConfirmDate 
               Height          =   345
               Left            =   120
               ScaleHeight     =   285
               ScaleWidth      =   3435
               TabIndex        =   59
               Top             =   2760
               Visible         =   0   'False
               Width           =   3495
            End
            Begin VB.PictureBox tdbcIntroConfirmStatus 
               Height          =   360
               Left            =   3330
               ScaleHeight     =   300
               ScaleWidth      =   1935
               TabIndex        =   60
               Top             =   1200
               Width           =   1995
            End
            Begin VB.PictureBox tdbtIntroConfirmNote 
               Height          =   345
               Left            =   5490
               ScaleHeight     =   285
               ScaleWidth      =   6135
               TabIndex        =   61
               Top             =   1200
               Width           =   6195
            End
            Begin VB.PictureBox tdbdFollowupConfirmDate 
               Height          =   345
               Left            =   3780
               ScaleHeight     =   285
               ScaleWidth      =   3435
               TabIndex        =   65
               Top             =   2760
               Visible         =   0   'False
               Width           =   3495
            End
            Begin VB.PictureBox tdbcFollowupConfirmStatus 
               Height          =   360
               Left            =   3330
               ScaleHeight     =   300
               ScaleWidth      =   1935
               TabIndex        =   66
               Top             =   1920
               Width           =   1995
            End
            Begin VB.PictureBox tdbtFollowupConfirmNote 
               Height          =   345
               Left            =   5490
               ScaleHeight     =   285
               ScaleWidth      =   6135
               TabIndex        =   67
               Top             =   1920
               Width           =   6195
            End
            Begin VB.Label lblConfirmation 
               BackStyle       =   0  'Transparent
               Caption         =   "Follow Up Confirmation"
               Height          =   345
               Index           =   1
               Left            =   390
               TabIndex        =   204
               Top             =   1980
               Width           =   2235
            End
            Begin VB.Label lblConfirmation 
               BackStyle       =   0  'Transparent
               Caption         =   "Intro Confirmation"
               Height          =   345
               Index           =   0
               Left            =   390
               TabIndex        =   203
               Top             =   1260
               Width           =   2235
            End
            Begin VB.Label lblAppointmentKeyDate 
               Alignment       =   1  'Right Justify
               AutoSize        =   -1  'True
               BackStyle       =   0  'Transparent
               Caption         =   "Appointment Entered On"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               ForeColor       =   &H00C00000&
               Height          =   210
               Left            =   9930
               TabIndex        =   180
               Top             =   60
               Width           =   1755
            End
            Begin VB.Label lblUpdateFollowupConfirm 
               AutoSize        =   -1  'True
               BackStyle       =   0  'Transparent
               Caption         =   "Updated By:"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               ForeColor       =   &H00C00000&
               Height          =   210
               Left            =   2250
               TabIndex        =   141
               Top             =   1620
               Width           =   3975
               WordWrap        =   -1  'True
            End
            Begin VB.Label lblUpdateIntroConfirm 
               AutoSize        =   -1  'True
               BackStyle       =   0  'Transparent
               Caption         =   "Updated By:"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               ForeColor       =   &H00C00000&
               Height          =   210
               Left            =   2250
               TabIndex        =   140
               Top             =   900
               Width           =   3975
               WordWrap        =   -1  'True
            End
            Begin VB.Label lblUpdatePacketMailed 
               AutoSize        =   -1  'True
               BackStyle       =   0  'Transparent
               Caption         =   "Updated By:"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               ForeColor       =   &H00C00000&
               Height          =   210
               Left            =   2250
               TabIndex        =   139
               Top             =   150
               Width           =   3975
               WordWrap        =   -1  'True
            End
            Begin VB.Label Label3 
               AutoSize        =   -1  'True
               Caption         =   "Status"
               Height          =   225
               Left            =   2700
               TabIndex        =   138
               Top             =   1260
               Width           =   525
            End
            Begin VB.Label Label6 
               AutoSize        =   -1  'True
               Caption         =   "Status"
               Height          =   225
               Left            =   2700
               TabIndex        =   137
               Top             =   1980
               Width           =   525
            End
         End
         Begin VB.PictureBox picClientInfo 
            ForeColor       =   &H80000008&
            Height          =   330
            Left            =   32768
            ScaleHeight     =   270
            ScaleWidth      =   65475
            TabIndex        =   126
            Top             =   56102
            Width           =   65534
            Begin VB.PictureBox tdbtHomeAddr1 
               Height          =   315
               Left            =   120
               ScaleHeight     =   255
               ScaleWidth      =   6735
               TabIndex        =   93
               Top             =   840
               Width           =   6795
            End
            Begin VB.PictureBox tdbtFirstName 
               Height          =   315
               Left            =   120
               ScaleHeight     =   255
               ScaleWidth      =   3945
               TabIndex        =   90
               Top             =   540
               Width           =   4005
            End
            Begin VB.PictureBox tdbtMI 
               Height          =   315
               Left            =   4110
               ScaleHeight     =   255
               ScaleWidth      =   315
               TabIndex        =   91
               Top             =   540
               Width           =   375
            End
            Begin VB.PictureBox tdbnChartNo 
               Height          =   315
               Left            =   120
               ScaleHeight     =   255
               ScaleWidth      =   2715
               TabIndex        =   89
               Top             =   120
               Width           =   2775
            End
            Begin VB.PictureBox tdbtLastName 
               Height          =   315
               Left            =   4470
               ScaleHeight     =   255
               ScaleWidth      =   2385
               TabIndex        =   92
               Top             =   540
               Width           =   2445
            End
            Begin VB.PictureBox tdbtHomeAddr2 
               Height          =   315
               Left            =   120
               ScaleHeight     =   255
               ScaleWidth      =   6735
               TabIndex        =   94
               Top             =   1140
               Width           =   6795
            End
            Begin VB.PictureBox tdbtHomeCity 
               Height          =   315
               Left            =   1170
               ScaleHeight     =   255
               ScaleWidth      =   2595
               TabIndex        =   95
               Top             =   1440
               Width           =   2655
            End
            Begin VB.PictureBox tdbtHomeState 
               Height          =   315
               Left            =   3990
               ScaleHeight     =   255
               ScaleWidth      =   975
               TabIndex        =   96
               Top             =   1440
               Width           =   1035
            End
            Begin VB.PictureBox tdbmHomeZip 
               Height          =   315
               Left            =   5160
               ScaleHeight     =   255
               ScaleWidth      =   1695
               TabIndex        =   97
               Top             =   1440
               Width           =   1755
            End
            Begin VB.PictureBox tdbmPhoneNo 
               Height          =   315
               Left            =   270
               ScaleHeight     =   255
               ScaleWidth      =   2895
               TabIndex        =   98
               Top             =   1860
               Width           =   2955
            End
            Begin VB.PictureBox tdbmWorkPhone 
               Height          =   315
               Left            =   270
               ScaleHeight     =   255
               ScaleWidth      =   2895
               TabIndex        =   99
               Top             =   2160
               Width           =   2955
            End
            Begin VB.PictureBox tdbmCellPhone 
               Height          =   315
               Left            =   270
               ScaleHeight     =   255
               ScaleWidth      =   2895
               TabIndex        =   101
               Top             =   2460
               Width           =   2955
            End
            Begin VB.PictureBox tdbmOtherPhone 
               Height          =   315
               Left            =   270
               ScaleHeight     =   255
               ScaleWidth      =   2895
               TabIndex        =   102
               Top             =   2760
               Width           =   2955
            End
            Begin VB.PictureBox tdbtWorkExt 
               Height          =   315
               Left            =   3390
               ScaleHeight     =   255
               ScaleWidth      =   1365
               TabIndex        =   100
               Top             =   2160
               Width           =   1425
            End
            Begin VB.PictureBox tdbtOtherPhoneInfo 
               Height          =   315
               Left            =   3390
               ScaleHeight     =   255
               ScaleWidth      =   3495
               TabIndex        =   103
               Top             =   2760
               Width           =   3555
            End
            Begin VB.PictureBox tdbmSSN 
               Height          =   315
               Left            =   3120
               ScaleHeight     =   255
               ScaleWidth      =   2085
               TabIndex        =   185
               Top             =   120
               Width           =   2145
            End
            Begin VB.PictureBox tdbdDOB 
               Height          =   315
               Left            =   5520
               ScaleHeight     =   255
               ScaleWidth      =   1935
               TabIndex        =   186
               Top             =   120
               Width           =   1995
            End
         End
         Begin VB.PictureBox picBilling 
            ForeColor       =   &H80000008&
            Height          =   330
            Left            =   32768
            ScaleHeight     =   270
            ScaleWidth      =   65475
            TabIndex        =   127
            Top             =   56102
            Width           =   65534
         End
         Begin VB.PictureBox picOpDayChecks 
            ForeColor       =   &H80000008&
            Height          =   330
            Left            =   32768
            ScaleHeight     =   270
            ScaleWidth      =   65475
            TabIndex        =   130
            Top             =   56102
            Width           =   65534
            Begin VB.PictureBox picHospitalPatient 
               Appearance      =   0  'Flat
               BorderStyle     =   0  'None
               ForeColor       =   &H80000008&
               Height          =   345
               Left            =   5310
               ScaleHeight     =   345
               ScaleWidth      =   3135
               TabIndex        =   190
               Top             =   2610
               Width           =   3135
               Begin VB.CheckBox chkHospitalPatient 
                  Appearance      =   0  'Flat
                  Caption         =   " Hospital Patient"
                  ForeColor       =   &H80000008&
                  Height          =   225
                  Left            =   30
                  TabIndex        =   88
                  Top             =   30
                  Width           =   2475
               End
            End
            Begin VB.CommandButton cmdEdit 
               Caption         =   "Edit"
               Height          =   315
               Index           =   11
               Left            =   120
               TabIndex        =   84
               Top             =   2160
               Width           =   915
            End
            Begin VB.CommandButton cmdCancel 
               Height          =   315
               Index           =   11
               Left            =   1620
               Picture         =   "frmTeamDoc.frx":2038
               Style           =   1  'Graphical
               TabIndex        =   86
               Top             =   2160
               Width           =   500
            End
            Begin VB.CommandButton cmdSave 
               Height          =   315
               Index           =   11
               Left            =   1080
               Picture         =   "frmTeamDoc.frx":2182
               Style           =   1  'Graphical
               TabIndex        =   85
               Top             =   2160
               Width           =   500
            End
            Begin VB.CommandButton cmdSave 
               Height          =   315
               Index           =   9
               Left            =   1080
               Picture         =   "frmTeamDoc.frx":22CC
               Style           =   1  'Graphical
               TabIndex        =   79
               Top             =   1110
               Width           =   500
            End
            Begin VB.CommandButton cmdSave 
               Height          =   315
               Index           =   3
               Left            =   1080
               Picture         =   "frmTeamDoc.frx":2416
               Style           =   1  'Graphical
               TabIndex        =   73
               Top             =   90
               Width           =   500
            End
            Begin VB.CommandButton cmdCancel 
               Height          =   315
               Index           =   9
               Left            =   1620
               Picture         =   "frmTeamDoc.frx":2560
               Style           =   1  'Graphical
               TabIndex        =   80
               Top             =   1110
               Width           =   500
            End
            Begin VB.CommandButton cmdCancel 
               Height          =   315
               Index           =   3
               Left            =   1620
               Picture         =   "frmTeamDoc.frx":26AA
               Style           =   1  'Graphical
               TabIndex        =   74
               Top             =   90
               Width           =   500
            End
            Begin VB.PictureBox picPrepVerified 
               Appearance      =   0  'Flat
               BorderStyle     =   0  'None
               ForeColor       =   &H80000008&
               Height          =   345
               Left            =   150
               ScaleHeight     =   345
               ScaleWidth      =   1635
               TabIndex        =   150
               Top             =   1500
               Width           =   1635
               Begin VB.CheckBox chkPrepVerified 
                  Appearance      =   0  'Flat
                  Caption         =   " Prep Verified"
                  ForeColor       =   &H80000008&
                  Height          =   225
                  Left            =   30
                  TabIndex        =   81
                  Top             =   30
                  Width           =   1635
               End
            End
            Begin VB.PictureBox picDriverVerified 
               Appearance      =   0  'Flat
               BorderStyle     =   0  'None
               ForeColor       =   &H80000008&
               Height          =   345
               Left            =   150
               ScaleHeight     =   345
               ScaleWidth      =   1635
               TabIndex        =   149
               Top             =   510
               Width           =   1635
               Begin VB.CheckBox chkDriverVerified 
                  Appearance      =   0  'Flat
                  Caption         =   " Driver Verified"
                  ForeColor       =   &H80000008&
                  Height          =   225
                  Left            =   30
                  TabIndex        =   75
                  Top             =   30
                  Width           =   1635
               End
            End
            Begin VB.CommandButton cmdEdit 
               Caption         =   "Edit"
               Height          =   315
               Index           =   3
               Left            =   120
               TabIndex        =   72
               Top             =   90
               Width           =   915
            End
            Begin VB.CommandButton cmdEdit 
               Caption         =   "Edit"
               Height          =   315
               Index           =   9
               Left            =   120
               TabIndex        =   78
               Top             =   1110
               Width           =   915
            End
            Begin VB.PictureBox tdbdDriverVerifiedDate 
               Height          =   315
               Left            =   1920
               ScaleHeight     =   255
               ScaleWidth      =   1215
               TabIndex        =   76
               Top             =   510
               Width           =   1275
            End
            Begin VB.PictureBox tdbtDriverVerifiedNote 
               Height          =   315
               Left            =   3510
               ScaleHeight     =   255
               ScaleWidth      =   6765
               TabIndex        =   77
               Top             =   510
               Width           =   6825
            End
            Begin VB.PictureBox tdbdPrepVerifiedDate 
               Height          =   315
               Left            =   1920
               ScaleHeight     =   255
               ScaleWidth      =   1215
               TabIndex        =   82
               Top             =   1500
               Width           =   1275
            End
            Begin VB.PictureBox tdbtPrepVerifiedNote 
               Height          =   315
               Left            =   3510
               ScaleHeight     =   255
               ScaleWidth      =   6765
               TabIndex        =   83
               Top             =   1500
               Width           =   6825
            End
            Begin VB.PictureBox tdbcOperatingRoom 
               Height          =   360
               Left            =   1800
               ScaleHeight     =   300
               ScaleWidth      =   2955
               TabIndex        =   87
               Top             =   2580
               Width           =   3015
            End
            Begin VB.Label Label4 
               AutoSize        =   -1  'True
               Caption         =   "Operating Room"
               Height          =   225
               Left            =   180
               TabIndex        =   178
               Top             =   2640
               Width           =   1365
            End
            Begin VB.Label lblOperatingRoom 
               AutoSize        =   -1  'True
               BackStyle       =   0  'Transparent
               Caption         =   "Updated By:"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               ForeColor       =   &H00C00000&
               Height          =   210
               Left            =   2250
               TabIndex        =   177
               Top             =   2190
               Width           =   3945
               WordWrap        =   -1  'True
            End
            Begin VB.Label lblUpdateDriverVerified 
               AutoSize        =   -1  'True
               BackStyle       =   0  'Transparent
               Caption         =   "Updated By:"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               ForeColor       =   &H00C00000&
               Height          =   210
               Left            =   2250
               TabIndex        =   133
               Top             =   120
               Width           =   3945
               WordWrap        =   -1  'True
            End
            Begin VB.Label lblUpdatePrepVerified 
               AutoSize        =   -1  'True
               BackStyle       =   0  'Transparent
               Caption         =   "Updated By:"
               BeginProperty Font 
                  Name            =   "Arial"
                  Size            =   8.25
                  Charset         =   0
                  Weight          =   400
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               ForeColor       =   &H00C00000&
               Height          =   210
               Left            =   2250
               TabIndex        =   132
               Top             =   1140
               Width           =   3945
               WordWrap        =   -1  'True
            End
         End
         Begin VB.PictureBox picComments 
            ForeColor       =   &H80000008&
            Height          =   330
            Left            =   32768
            ScaleHeight     =   270
            ScaleWidth      =   65475
            TabIndex        =   131
            Top             =   56102
            Width           =   65534
            Begin VB.CommandButton cmdSave 
               Height          =   315
               Index           =   10
               Left            =   10650
               Picture         =   "frmTeamDoc.frx":27F4
               Style           =   1  'Graphical
               TabIndex        =   69
               Top             =   60
               Width           =   500
            End
            Begin VB.CommandButton cmdCancel 
               Height          =   315
               Index           =   10
               Left            =   11190
               Picture         =   "frmTeamDoc.frx":293E
               Style           =   1  'Graphical
               TabIndex        =   70
               Top             =   60
               Width           =   500
            End
            Begin VB.CommandButton cmdEdit 
               Caption         =   "Edit"
               Height          =   315
               Index           =   10
               Left            =   9690
               TabIndex        =   68
               Top             =   60
               Width           =   915
            End
            Begin VB.PictureBox tdbtComments 
               Height          =   2895
               Left            =   120
               ScaleHeight     =   2835
               ScaleWidth      =   11505
               TabIndex        =   71
               Top             =   180
               Width           =   11565
            End
         End
         Begin VB.PictureBox pbStats 
            Height          =   870
            Index           =   1
            Left            =   32768
            ScaleHeight     =   810
            ScaleWidth      =   65475
            TabIndex        =   134
            Top             =   59042
            Width           =   65534
         End
         Begin VB.PictureBox pbStats 
            Height          =   1200
            Index           =   2
            Left            =   32768
            ScaleHeight     =   1140
            ScaleWidth      =   65475
            TabIndex        =   135
            Top             =   59042
            Width           =   65534
         End
         Begin VB.PictureBox pbStats 
            Height          =   1530
            Index           =   3
            Left            =   32768
            ScaleHeight     =   1470
            ScaleWidth      =   65475
            TabIndex        =   136
            Top             =   59042
            Width           =   65534
         End
         Begin VB.PictureBox pbStats 
            Height          =   3120
            Index           =   4
            Left            =   32768
            ScaleHeight     =   3060
            ScaleWidth      =   65475
            TabIndex        =   151
            Top             =   59042
            Width           =   65534
         End
         Begin VB.PictureBox pbStats 
            Height          =   1860
            Index           =   5
            Left            =   32768
            ScaleHeight     =   1800
            ScaleWidth      =   65475
            TabIndex        =   152
            Top             =   59042
            Width           =   65534
         End
         Begin VB.PictureBox pbStats 
            Height          =   2190
            Index           =   6
            Left            =   32768
            ScaleHeight     =   2130
            ScaleWidth      =   65475
            TabIndex        =   153
            Top             =   59042
            Width           =   65534
         End
         Begin VB.PictureBox tdbdReport_From 
            Height          =   990
            Left            =   32768
            ScaleHeight     =   930
            ScaleWidth      =   65475
            TabIndex        =   154
            Top             =   56282
            Width           =   65534
         End
         Begin VB.PictureBox tdbdReport_To 
            Height          =   990
            Left            =   32768
            ScaleHeight     =   930
            ScaleWidth      =   65475
            TabIndex        =   155
            Top             =   58472
            Width           =   65534
         End
         Begin VB.PictureBox tdbtPatientLog 
            Height          =   480
            Left            =   32768
            ScaleHeight     =   420
            ScaleWidth      =   65475
            TabIndex        =   156
            Top             =   56192
            Width           =   65534
         End
         Begin VB.PictureBox tdbcDoctorFilter 
            Height          =   990
            Left            =   32768
            ScaleHeight     =   930
            ScaleWidth      =   65475
            TabIndex        =   157
            Top             =   61292
            Width           =   65534
         End
         Begin VB.PictureBox tdbtCancelResolution 
            Height          =   2550
            Left            =   32768
            ScaleHeight     =   2490
            ScaleWidth      =   65475
            TabIndex        =   158
            Top             =   56192
            Width           =   65534
         End
         Begin VB.PictureBox picCancellationResolved 
            ForeColor       =   &H80000008&
            Height          =   2160
            Left            =   32768
            ScaleHeight     =   2100
            ScaleWidth      =   65475
            TabIndex        =   159
            Top             =   56162
            Width           =   65534
            Begin VB.CheckBox chkCancellationResolved 
               Appearance      =   0  'Flat
               Caption         =   " Cancellation Resolved"
               ForeColor       =   &H80000008&
               Height          =   225
               Left            =   30
               TabIndex        =   109
               Top             =   60
               Width           =   2295
            End
         End
         Begin VB.PictureBox tdbtCancellationReason 
            Height          =   540
            Left            =   32768
            ScaleHeight     =   480
            ScaleWidth      =   65475
            TabIndex        =   160
            Top             =   56192
            Width           =   65534
         End
         Begin VB.PictureBox tdbcUserActivityLog 
            Height          =   420
            Left            =   32768
            ScaleHeight     =   360
            ScaleWidth      =   65475
            TabIndex        =   161
            Top             =   56882
            Width           =   65534
         End
         Begin VB.PictureBox tdbdActivityLogDate 
            Height          =   420
            Left            =   32768
            ScaleHeight     =   360
            ScaleWidth      =   65475
            TabIndex        =   162
            Top             =   60872
            Width           =   65534
         End
         Begin VB.PictureBox tdbgActivityLog 
            Height          =   870
            Left            =   32768
            ScaleHeight     =   810
            ScaleWidth      =   65475
            TabIndex        =   163
            Top             =   56162
            Width           =   65534
         End
         Begin VB.CommandButton cmdPrint_ActivityLog 
            Caption         =   "Print Log"
            Height          =   3060
            Left            =   32768
            TabIndex        =   164
            Top             =   1126
            Width           =   65535
         End
         Begin VB.CommandButton cmdAddUserLog 
            Caption         =   "Add User Log"
            Height          =   3060
            Left            =   32768
            TabIndex        =   165
            Top             =   64922
            Width           =   65534
         End
         Begin VB.Label lblFilterLogType 
            Caption         =   "Log Type"
            Height          =   480
            Left            =   32768
            TabIndex        =   166
            Top             =   59402
            Width           =   65534
         End
         Begin VB.Label lblUserActivityLog 
            Caption         =   "User"
            Height          =   480
            Left            =   32768
            TabIndex        =   167
            Top             =   56282
            Width           =   65534
         End
         Begin VB.Label Label5 
            Caption         =   "Doctor"
            Height          =   1050
            Left            =   32768
            TabIndex        =   168
            Top             =   60542
            Width           =   65534
         End
         Begin VB.Label lblPercentage 
            Caption         =   "%"
            Height          =   2220
            Index           =   6
            Left            =   32768
            TabIndex        =   169
            Top             =   65522
            Width           =   65534
         End
         Begin VB.Label lblStatsCaption 
            Caption         =   "Prep Verified"
            Height          =   2220
            Index           =   6
            Left            =   32768
            TabIndex        =   170
            Top             =   56252
            Width           =   65534
         End
         Begin VB.Label lblPercentage 
            Caption         =   "%"
            Height          =   1890
            Index           =   5
            Left            =   32768
            TabIndex        =   171
            Top             =   65522
            Width           =   65534
         End
         Begin VB.Label lblStatsCaption 
            Caption         =   "Driver Verified"
            Height          =   1890
            Index           =   5
            Left            =   32768
            TabIndex        =   182
            Top             =   56252
            Width           =   65534
         End
         Begin VB.Label lblPercentage 
            Caption         =   "%"
            Height          =   3150
            Index           =   4
            Left            =   32768
            TabIndex        =   183
            Top             =   65522
            Width           =   65534
         End
         Begin VB.Label lblStatsCaption 
            Caption         =   "Final Confirmation"
            Height          =   3150
            Index           =   4
            Left            =   32768
            TabIndex        =   184
            Top             =   56252
            Width           =   65534
         End
         Begin VB.Label lblPercentage 
            Caption         =   "%"
            Height          =   1560
            Index           =   3
            Left            =   32768
            TabIndex        =   188
            Top             =   65522
            Width           =   65534
         End
         Begin VB.Label lblStatsCaption 
            Caption         =   "Follow Up Confirmation"
            Height          =   1560
            Index           =   3
            Left            =   32768
            TabIndex        =   189
            Top             =   56252
            Width           =   65534
         End
         Begin VB.Label lblPercentage 
            Caption         =   "%"
            Height          =   1230
            Index           =   2
            Left            =   32768
            TabIndex        =   192
            Top             =   65522
            Width           =   65534
         End
         Begin VB.Label lblStatsCaption 
            Caption         =   "Intro Confirmation"
            Height          =   1230
            Index           =   2
            Left            =   32768
            TabIndex        =   193
            Top             =   56252
            Width           =   65534
         End
         Begin VB.Label lblPercentage 
            Caption         =   "%"
            Height          =   900
            Index           =   1
            Left            =   32768
            TabIndex        =   194
            Top             =   65522
            Width           =   65534
         End
         Begin VB.Label lblStatsCaption 
            Caption         =   "Insurance Verified"
            Height          =   900
            Index           =   1
            Left            =   32768
            TabIndex        =   197
            Top             =   56252
            Width           =   65534
         End
         Begin VB.Label lblPercentage 
            Caption         =   "%"
            Height          =   570
            Index           =   0
            Left            =   32768
            TabIndex        =   198
            Top             =   65522
            Width           =   65534
         End
         Begin VB.Label lblStatsCaption 
            Caption         =   "Packet Mailed"
            Height          =   570
            Index           =   0
            Left            =   32768
            TabIndex        =   199
            Top             =   56252
            Width           =   65534
         End
      End
      Begin VB.PictureBox tdbcOperDoctor 
         Height          =   360
         Left            =   4320
         ScaleHeight     =   300
         ScaleWidth      =   2145
         TabIndex        =   7
         Top             =   30
         Width           =   2205
      End
      Begin VB.PictureBox tdbdRegisterDate 
         Height          =   345
         Left            =   60
         ScaleHeight     =   285
         ScaleWidth      =   2565
         TabIndex        =   6
         Top             =   30
         Width           =   2625
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "Operating Doctor"
         Height          =   225
         Left            =   2790
         TabIndex        =   146
         Top             =   90
         Width           =   1395
      End
      Begin VB.Label lblUpdateAppt 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Updated By:"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00C00000&
         Height          =   210
         Left            =   8820
         TabIndex        =   145
         Top             =   90
         Width           =   2925
         WordWrap        =   -1  'True
      End
   End
   Begin VB.CommandButton cmdClose 
      Caption         =   "&Front Desk"
      Height          =   375
      Left            =   10560
      TabIndex        =   176
      ToolTipText     =   "Back to Front Desk"
      Top             =   7800
      Width           =   1305
   End
   Begin VB.PictureBox tdbdSelectedDate 
      Height          =   315
      Left            =   60
      ScaleHeight     =   255
      ScaleWidth      =   3735
      TabIndex        =   1
      Top             =   30
      Width           =   3795
   End
   Begin VB.PictureBox picTabBackTemplate 
      Appearance      =   0  'Flat
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   3195
      Left            =   6960
      ScaleHeight     =   3195
      ScaleWidth      =   11775
      TabIndex        =   128
      Top             =   7890
      Width           =   11775
   End
   Begin VB.PictureBox tdbgClosures 
      Height          =   975
      Left            =   0
      ScaleHeight     =   915
      ScaleWidth      =   11805
      TabIndex        =   191
      Top             =   2670
      Width           =   11865
   End
   Begin VB.Label lblAppointmentStatus 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Appointment Status:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00C00000&
      Height          =   210
      Left            =   1290
      TabIndex        =   181
      Top             =   7890
      Width           =   5415
      WordWrap        =   -1  'True
   End
   Begin VB.Label Label2 
      Alignment       =   1  'Right Justify
      Caption         =   "Sort Order"
      Height          =   285
      Left            =   5490
      TabIndex        =   179
      Top             =   90
      Width           =   975
   End
   Begin VB.Menu mnuMarkAppt 
      Caption         =   "MarkAppointment"
      Visible         =   0   'False
      Begin VB.Menu mnuMarkCancelled 
         Caption         =   "Mark Appointment Cancelled"
      End
      Begin VB.Menu mnuMarkNoShow 
         Caption         =   "Mark Appointment No Show"
      End
      Begin VB.Menu mnuMarkVIP 
         Caption         =   "Mark VIP Appointment"
      End
      Begin VB.Menu mnuCheckIn 
         Caption         =   "Check In"
      End
      Begin VB.Menu mnuRescheduleAppt 
         Caption         =   "ReSchedule Appointment"
      End
   End
   Begin VB.Menu mnuActivityLogReportsHeader 
      Caption         =   "Activity Log Reports"
      Visible         =   0   'False
      Begin VB.Menu mnuReport_AppointmentEntry 
         Caption         =   "Appointment Entry"
      End
      Begin VB.Menu mnuReport_Cancellations 
         Caption         =   "Cancellations"
      End
      Begin VB.Menu mnuReport_Reschedules 
         Caption         =   "ReSchedules"
      End
   End
End
Attribute VB_Name = "frmTeamDoc"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


'VA: 41E1E8
Private Declare Function DeviceCapabilities Lib "winspool.drv" Alias "DeviceCapabilitiesA" (ByVal lpDeviceName As String, ByVal lpPort As String, ByVal iIndex As Long, ByVal lpOutput As String, lpDevMode As DEVMODE) As Long
'VA: 41E19C
Private Declare Function ClosePrinter Lib "winspool.drv" (ByVal hPrinter As Long) As Long
'VA: 41E168
Private Declare Function OpenPrinter Lib "winspool.drv" Alias "OpenPrinterA" (ByVal pPrinterName As String, phPrinter As Long, pDefault As PRINTER_DEFAULTS) As Long
'VA: 41C840
Private Declare Function MoveFile Lib "kernel32" Alias "MoveFileA" (ByVal lpExistingFileName As String, ByVal lpNewFileName As String) As Long
'VA: 41C7F0
Private Declare Sub GetComputerNameA Lib "kernel32" ()
'VA: 41C790
Private Declare Sub StringFromGUID2 Lib "ole32.dll" ()
'VA: 41C748
Private Declare Sub CoCreateGuid Lib "ole32.dll" ()
'VA: 41C6F0
Private Declare Sub PathFileExistsA Lib "shlwapi.dll" ()
'VA: 41C698
Private Declare Function GetLogicalDriveStrings Lib "kernel32" Alias "GetLogicalDriveStringsA" (ByVal nBufferLength As Long, ByVal lpBuffer As String) As Long
'VA: 41C634
Private Declare Function FindClose Lib "kernel32" (ByVal hFindFile As Long) As Long
'VA: 41C5F0
Private Declare Function FindNextFile Lib "kernel32" Alias "FindNextFileA" (ByVal hFindFile As Long, lpFindFileData As WIN32_FIND_DATA) As Long
'VA: 41C5A8
Private Declare Function FindFirstFile Lib "kernel32" Alias "FindFirstFileA" (ByVal lpFileName As String, lpFindFileData As WIN32_FIND_DATA) As Long
'VA: 41C560
Private Declare Function SystemParametersInfo Lib "user32" Alias "SystemParametersInfoA" (ByVal uAction As Long, ByVal uParam As Long, ByRef lpvParam As Any, ByVal fuWinIni As Long) As Long
'VA: 41C510
Private Declare Function GetSystemDirectory Lib "kernel32" Alias "GetSystemDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
'VA: 41C4C4
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
'VA: 41C47C
Private Declare Function GetUserName Lib "advapi32.dll" Alias "GetUserNameA" (ByVal lpBuffer As String, nSize As Long) As Long
'VA: 41C420
Private Declare Function GetDesktopWindow Lib "user32" () As Long
'VA: 41C3D4
Private Declare Function CopyFile Lib "kernel32" Alias "CopyFileA" (ByVal lpExistingFileName As String, ByVal lpNewFileName As String, ByVal bFailIfExists As Long) As Long
'VA: 41C390
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
'VA: 41C348
Private Declare Sub SetLastError Lib "kernel32" (ByVal dwErrCode As Long)
'VA: 41C300
Private Declare Function AdjustTokenPrivileges Lib "advapi32.dll" (ByVal TokenHandle As Long, ByVal DisableAllPrivileges As Long, NewState As TOKEN_PRIVILEGES, ByVal BufferLength As Long, PreviousState As TOKEN_PRIVILEGES, ReturnLength As Long) As Long
'VA: 41C2AC
Private Declare Function LookupPrivilegeValue Lib "advapi32.dll" Alias "LookupPrivilegeValueA" (ByVal lpSystemName As String, ByVal lpName As String, lpLuid As LARGE_INTEGER) As Long
'VA: 41C25C
Private Declare Function OpenProcessToken Lib "advapi32.dll" (ByVal ProcessHandle As Long, ByVal DesiredAccess As Long, TokenHandle As Long) As Long
'VA: 41C200
Private Declare Function GetCurrentProcess Lib "kernel32" () As Long
'VA: 41C1B4
Private Declare Function GetVersion Lib "kernel32" () As Long
'VA: 41C170
Private Declare Function GetLastError Lib "kernel32" () As Long
'VA: 41C118
Private Declare Function ExitWindowsEx Lib "user32" (ByVal uFlags As Long, ByVal dwReserved As Long) As Long
