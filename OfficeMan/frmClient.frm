VERSION 5.00
Begin VB.Form frmClient 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   " Patient"
   ClientHeight    =   5835
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7050
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   9
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5835
   ScaleWidth      =   7050
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.PictureBox picPatientInfo 
      Appearance      =   0  'Flat
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   5295
      Left            =   0
      ScaleHeight     =   5295
      ScaleWidth      =   7005
      TabIndex        =   23
      Top             =   0
      Width           =   7005
      Begin VB.CommandButton cmdMore_ChurchInfo 
         Caption         =   "..."
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   345
         Left            =   6060
         TabIndex        =   26
         TabStop         =   0   'False
         ToolTipText     =   "Edit Church List"
         Top             =   4740
         Width           =   405
      End
      Begin VB.PictureBox tdbcRefChurch 
         Height          =   360
         Left            =   1800
         ScaleHeight     =   300
         ScaleWidth      =   4125
         TabIndex        =   19
         Top             =   4740
         Width           =   4185
      End
      Begin VB.CommandButton cmdChangeChartNo 
         Caption         =   "Change Chart No"
         Height          =   375
         Left            =   4800
         TabIndex        =   24
         TabStop         =   0   'False
         Top             =   60
         Width           =   2055
      End
      Begin VB.PictureBox tdbtFirstName 
         Height          =   315
         Left            =   90
         ScaleHeight     =   255
         ScaleWidth      =   3945
         TabIndex        =   1
         Top             =   510
         Width           =   4005
      End
      Begin VB.PictureBox tdbtMI 
         Height          =   315
         Left            =   4080
         ScaleHeight     =   255
         ScaleWidth      =   315
         TabIndex        =   2
         Top             =   510
         Width           =   375
      End
      Begin VB.PictureBox tdbtLastName 
         Height          =   315
         Left            =   4440
         ScaleHeight     =   255
         ScaleWidth      =   2385
         TabIndex        =   3
         Top             =   510
         Width           =   2445
      End
      Begin VB.PictureBox tdbtHomeAddr1 
         Height          =   315
         Left            =   90
         ScaleHeight     =   255
         ScaleWidth      =   6735
         TabIndex        =   4
         Top             =   930
         Width           =   6795
      End
      Begin VB.PictureBox tdbtHomeAddr2 
         Height          =   315
         Left            =   90
         ScaleHeight     =   255
         ScaleWidth      =   6735
         TabIndex        =   5
         Top             =   1230
         Width           =   6795
      End
      Begin VB.PictureBox tdbtHomeCity 
         Height          =   315
         Left            =   1140
         ScaleHeight     =   255
         ScaleWidth      =   2595
         TabIndex        =   6
         Top             =   1530
         Width           =   2655
      End
      Begin VB.PictureBox tdbtHomeState 
         Height          =   315
         Left            =   3960
         ScaleHeight     =   255
         ScaleWidth      =   975
         TabIndex        =   7
         Top             =   1530
         Width           =   1035
      End
      Begin VB.PictureBox tdbmHomeZip 
         Height          =   315
         Left            =   5130
         ScaleHeight     =   255
         ScaleWidth      =   1695
         TabIndex        =   8
         Top             =   1530
         Width           =   1755
      End
      Begin VB.PictureBox tdbmHomePhone 
         Height          =   315
         Left            =   240
         ScaleHeight     =   255
         ScaleWidth      =   2895
         TabIndex        =   11
         Top             =   2400
         Width           =   2955
      End
      Begin VB.PictureBox tdbmWorkPhone 
         Height          =   315
         Left            =   240
         ScaleHeight     =   255
         ScaleWidth      =   2895
         TabIndex        =   12
         Top             =   2760
         Width           =   2955
      End
      Begin VB.PictureBox tdbmCellPhone 
         Height          =   315
         Left            =   240
         ScaleHeight     =   255
         ScaleWidth      =   2895
         TabIndex        =   14
         Top             =   3120
         Width           =   2955
      End
      Begin VB.PictureBox tdbmOtherPhone 
         Height          =   315
         Left            =   240
         ScaleHeight     =   255
         ScaleWidth      =   2895
         TabIndex        =   15
         Top             =   3480
         Width           =   2955
      End
      Begin VB.PictureBox tdbtWorkExt 
         Height          =   315
         Left            =   3360
         ScaleHeight     =   255
         ScaleWidth      =   1365
         TabIndex        =   13
         Top             =   2760
         Width           =   1425
      End
      Begin VB.PictureBox tdbtOtherPhoneInfo 
         Height          =   315
         Left            =   3360
         ScaleHeight     =   255
         ScaleWidth      =   3495
         TabIndex        =   16
         Top             =   3480
         Width           =   3555
      End
      Begin VB.PictureBox tdbmChartNo 
         Height          =   315
         Left            =   90
         ScaleHeight     =   255
         ScaleWidth      =   3015
         TabIndex        =   0
         Top             =   90
         Width           =   3075
      End
      Begin VB.PictureBox tdbtSInsName 
         Height          =   315
         Left            =   90
         ScaleHeight     =   255
         ScaleWidth      =   5235
         TabIndex        =   18
         Top             =   4290
         Width           =   5295
      End
      Begin VB.PictureBox tdbtPInsName 
         Height          =   315
         Left            =   90
         ScaleHeight     =   255
         ScaleWidth      =   5235
         TabIndex        =   17
         Top             =   3930
         Width           =   5295
      End
      Begin VB.PictureBox tdbmSSN 
         Height          =   315
         Left            =   1050
         ScaleHeight     =   255
         ScaleWidth      =   2085
         TabIndex        =   9
         Top             =   1920
         Width           =   2145
      End
      Begin VB.PictureBox tdbdDOB 
         Height          =   315
         Left            =   3480
         ScaleHeight     =   255
         ScaleWidth      =   1935
         TabIndex        =   10
         Top             =   1920
         Width           =   1995
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Referring Church"
         Height          =   225
         Left            =   90
         TabIndex        =   25
         Top             =   4800
         Width           =   1410
      End
   End
   Begin VB.CommandButton cmdEdit 
      Caption         =   "&Edit"
      Height          =   375
      Left            =   902
      TabIndex        =   20
      Top             =   5370
      Width           =   1725
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   4424
      TabIndex        =   22
      Top             =   5370
      Width           =   1725
   End
   Begin VB.CommandButton cmdSave 
      Caption         =   "&Save"
      Height          =   375
      Left            =   2654
      TabIndex        =   21
      Top             =   5370
      Width           =   1725
   End
End
Attribute VB_Name = "frmClient"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

