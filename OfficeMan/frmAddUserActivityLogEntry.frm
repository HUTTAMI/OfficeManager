VERSION 5.00
Begin VB.Form frmAddUserActivityLogEntry 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   " Add Entry to User Activity Log"
   ClientHeight    =   4425
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   10440
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
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4425
   ScaleWidth      =   10440
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton cmdPatientLookup 
      Cancel          =   -1  'True
      Caption         =   "..."
      BeginProperty Font 
         Name            =   "Arial Black"
         Size            =   11.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2370
      TabIndex        =   2
      TabStop         =   0   'False
      Top             =   3210
      Width           =   585
   End
   Begin VB.PictureBox picAlarm 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      ForeColor       =   &H80000008&
      Height          =   3975
      Left            =   8670
      Picture         =   "frmAddUserActivityLogEntry.frx":0000
      ScaleHeight     =   3945
      ScaleWidth      =   1695
      TabIndex        =   7
      Top             =   360
      Width           =   1725
   End
   Begin VB.PictureBox tdbtLogEnteredBy 
      Height          =   675
      Left            =   60
      ScaleHeight     =   615
      ScaleWidth      =   8475
      TabIndex        =   6
      Top             =   3660
      Width           =   8535
   End
   Begin VB.CommandButton cmdOk 
      Caption         =   "&Save Log"
      Height          =   375
      Left            =   6000
      TabIndex        =   4
      Top             =   3210
      Width           =   1365
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   7410
      TabIndex        =   5
      Top             =   3210
      Width           =   1185
   End
   Begin VB.PictureBox tdbtLogEntry 
      Height          =   3105
      Left            =   60
      ScaleHeight     =   3045
      ScaleWidth      =   8475
      TabIndex        =   0
      Top             =   30
      Width           =   8535
   End
   Begin VB.PictureBox tdbmChartNo 
      Height          =   315
      Left            =   60
      ScaleHeight     =   255
      ScaleWidth      =   2175
      TabIndex        =   1
      Top             =   3240
      Width           =   2235
   End
   Begin VB.PictureBox tdbnDuration 
      Height          =   315
      Left            =   3450
      ScaleHeight     =   255
      ScaleWidth      =   2385
      TabIndex        =   3
      Top             =   3240
      Width           =   2445
   End
End
Attribute VB_Name = "frmAddUserActivityLogEntry"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

