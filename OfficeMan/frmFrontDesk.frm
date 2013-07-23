VERSION 5.00
Begin VB.Form frmFrontDesk 
   Appearance      =   0  'Flat
   Caption         =   " Front Desk"
   ClientHeight    =   8190
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   11850
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmFrontDesk.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   ScaleHeight     =   11490
   ScaleWidth      =   19080
   Begin VB.PictureBox imgFax 
      Height          =   2895
      Left            =   2640
      ScaleHeight     =   2835
      ScaleWidth      =   9105
      TabIndex        =   7
      TabStop         =   0   'False
      Top             =   4080
      Width           =   9165
   End
   Begin VB.CommandButton cmdViewFaxLog 
      Caption         =   "Show Fax Log"
      Height          =   315
      Left            =   5970
      TabIndex        =   21
      Top             =   7830
      Width           =   1965
   End
   Begin VB.PictureBox tdblFax 
      Height          =   2895
      Left            =   60
      ScaleHeight     =   2835
      ScaleWidth      =   2535
      TabIndex        =   6
      Top             =   4080
      Width           =   2595
   End
   Begin VB.CommandButton cmdDoctorSchedule 
      Caption         =   "Doctor Schedule"
      Height          =   315
      Left            =   3990
      TabIndex        =   20
      Top             =   7830
      Width           =   1965
   End
   Begin VB.CommandButton cmdClosedDays 
      Caption         =   "Closed Days"
      Height          =   315
      Left            =   2010
      TabIndex        =   19
      Top             =   7830
      Width           =   1965
   End
   Begin VB.CommandButton cmdChurchList 
      Caption         =   "Church List"
      Height          =   315
      Left            =   60
      TabIndex        =   18
      Top             =   7830
      Width           =   1935
   End
   Begin VB.CommandButton cmdLocateInTeam 
      Caption         =   "&Locate Appt in Team"
      Height          =   345
      Left            =   2010
      TabIndex        =   12
      Top             =   7380
      Width           =   1965
   End
   Begin VB.CommandButton cmdFileFolderLabels 
      Caption         =   "&File Folder Labels"
      Height          =   345
      Left            =   5970
      TabIndex        =   14
      Top             =   7380
      Width           =   1965
   End
   Begin VB.Timer tmrRefresh 
      Interval        =   60000
      Left            =   8040
      Top             =   0
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "E&xit"
      Height          =   315
      Left            =   9870
      TabIndex        =   22
      ToolTipText     =   "Exit Appointment Manager"
      Top             =   7830
      Width           =   1935
   End
   Begin VB.CommandButton cmdDeleteAppt 
      Caption         =   "Delete Appointment"
      Height          =   345
      Left            =   9810
      TabIndex        =   16
      Top             =   7020
      Width           =   1935
   End
   Begin VB.CommandButton cmdDeletePatient 
      Caption         =   "&Delete Patient"
      Height          =   345
      Left            =   3990
      TabIndex        =   10
      Top             =   7020
      Width           =   1965
   End
   Begin VB.CommandButton cmdReScheduleAppt 
      Caption         =   "&ReSchedule Appointment"
      Height          =   345
      Left            =   7950
      TabIndex        =   17
      Top             =   7380
      Width           =   3795
   End
   Begin VB.CommandButton cmdNewAppt 
      Caption         =   "New &Appointment"
      Height          =   345
      Left            =   7950
      TabIndex        =   15
      Top             =   7020
      Width           =   1845
   End
   Begin VB.CommandButton cmdAdminTools 
      Caption         =   "Ad&min Tools"
      Height          =   345
      Left            =   3990
      TabIndex        =   13
      Top             =   7380
      Width           =   1965
   End
   Begin VB.CommandButton cmdTeamDocument 
      Caption         =   "&Team Document"
      Height          =   345
      Left            =   120
      TabIndex        =   11
      Top             =   7380
      Width           =   1875
   End
   Begin VB.CommandButton cmdViewPatient 
      Caption         =   "&View Patient Info"
      Height          =   345
      Left            =   2010
      TabIndex        =   9
      Top             =   7020
      Width           =   1965
   End
   Begin VB.CommandButton cmdNewPatient 
      Caption         =   "&New Patient"
      Enabled         =   0   'False
      Height          =   345
      Left            =   120
      TabIndex        =   8
      Top             =   7020
      Width           =   1875
   End
   Begin VB.CommandButton cmdReset 
      Caption         =   "Reset"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   6480
      TabIndex        =   23
      TabStop         =   0   'False
      Top             =   1320
      Width           =   1215
   End
   Begin VB.PictureBox tdbmPhoneNo 
      Height          =   315
      Left            =   900
      ScaleHeight     =   255
      ScaleWidth      =   3015
      TabIndex        =   3
      Top             =   1290
      Width           =   3075
   End
   Begin VB.PictureBox tdbtFirstName 
      Height          =   315
      Left            =   900
      ScaleHeight     =   255
      ScaleWidth      =   4155
      TabIndex        =   1
      Top             =   450
      Width           =   4215
   End
   Begin VB.PictureBox tdbtLastName 
      Height          =   315
      Left            =   900
      ScaleHeight     =   255
      ScaleWidth      =   4155
      TabIndex        =   0
      Top             =   150
      Width           =   4215
   End
   Begin VB.PictureBox tdbgPatients 
      Height          =   5295
      Left            =   60
      ScaleHeight     =   5235
      ScaleWidth      =   6825
      TabIndex        =   4
      Top             =   1680
      Width           =   6885
   End
   Begin VB.PictureBox tdbgAppointments 
      Height          =   5295
      Left            =   6930
      ScaleHeight     =   5235
      ScaleWidth      =   4815
      TabIndex        =   5
      Top             =   1680
      Width           =   4875
   End
   Begin VB.PictureBox picKeyboard 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   1635
      Left            =   7740
      Picture         =   "frmFrontDesk.frx":6852
      ScaleHeight     =   1605
      ScaleWidth      =   4035
      TabIndex        =   24
      Top             =   60
      Width           =   4065
   End
   Begin VB.PictureBox tdbmChartNo 
      Height          =   315
      Left            =   900
      ScaleHeight     =   255
      ScaleWidth      =   3015
      TabIndex        =   2
      Top             =   870
      Width           =   3075
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      ForeColor       =   &H80000008&
      Height          =   1635
      Left            =   60
      ScaleHeight     =   1605
      ScaleWidth      =   7665
      TabIndex        =   25
      Top             =   60
      Width           =   7695
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "1"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   21.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00808080&
         Height          =   480
         Left            =   180
         TabIndex        =   28
         Top             =   0
         Width           =   225
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "2"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   21.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00808080&
         Height          =   480
         Left            =   180
         TabIndex        =   27
         Top             =   690
         Width           =   225
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "3"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   21.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00808080&
         Height          =   480
         Left            =   180
         TabIndex        =   26
         Top             =   1140
         Width           =   225
      End
   End
   Begin VB.PictureBox AutoLogOffHook 
      Height          =   480
      Left            =   0
      ScaleHeight     =   420
      ScaleWidth      =   1140
      TabIndex        =   29
      Top             =   0
      Width           =   1200
   End
   Begin VB.Shape Shape3 
      BackColor       =   &H00C0C0C0&
      BackStyle       =   1  'Opaque
      BorderColor     =   &H00000000&
      Height          =   825
      Left            =   60
      Top             =   6960
      Width           =   11745
   End
End
Attribute VB_Name = "frmFrontDesk"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

