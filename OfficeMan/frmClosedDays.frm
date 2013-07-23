VERSION 5.00
Begin VB.Form frmClosedDays 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   " Closed Days"
   ClientHeight    =   5610
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   7230
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
   ScaleHeight     =   5610
   ScaleWidth      =   7230
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.PictureBox picDataEntry 
      Appearance      =   0  'Flat
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   855
      Left            =   60
      ScaleHeight     =   855
      ScaleWidth      =   7095
      TabIndex        =   10
      Top             =   4260
      Width           =   7095
      Begin VB.PictureBox tdbtStartTime 
         Height          =   345
         Left            =   3930
         ScaleHeight     =   285
         ScaleWidth      =   1545
         TabIndex        =   2
         Top             =   30
         Width           =   1605
      End
      Begin VB.PictureBox tdbdClosureDate 
         Height          =   345
         Left            =   30
         ScaleHeight     =   285
         ScaleWidth      =   3615
         TabIndex        =   1
         Top             =   30
         Width           =   3675
      End
      Begin VB.PictureBox tdbtClosureReason 
         Height          =   345
         Left            =   30
         ScaleHeight     =   285
         ScaleWidth      =   7005
         TabIndex        =   4
         Top             =   450
         Width           =   7065
      End
      Begin VB.PictureBox tdbtEndTime 
         Height          =   345
         Left            =   5730
         ScaleHeight     =   285
         ScaleWidth      =   1305
         TabIndex        =   3
         Top             =   30
         Width           =   1365
      End
   End
   Begin VB.CommandButton cmdNew 
      Caption         =   "&Add Closure"
      Height          =   375
      Left            =   60
      TabIndex        =   5
      TabStop         =   0   'False
      Top             =   5160
      Width           =   1395
   End
   Begin VB.CommandButton cmdDelete 
      Caption         =   "&Delete Closure"
      Height          =   375
      Left            =   2880
      TabIndex        =   7
      TabStop         =   0   'False
      Top             =   5160
      Width           =   1515
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   5760
      TabIndex        =   9
      Top             =   5160
      Width           =   1395
   End
   Begin VB.CommandButton cmdSave 
      Caption         =   "&Save"
      Height          =   375
      Left            =   4440
      TabIndex        =   8
      Top             =   5160
      Width           =   1275
   End
   Begin VB.CommandButton cmdEdit 
      Caption         =   "&Edit Closure"
      Height          =   375
      Left            =   1500
      TabIndex        =   6
      TabStop         =   0   'False
      Top             =   5160
      Width           =   1335
   End
   Begin VB.PictureBox tdbgClosureDates 
      Height          =   4155
      Left            =   60
      ScaleHeight     =   4095
      ScaleWidth      =   7035
      TabIndex        =   0
      Top             =   60
      Width           =   7095
   End
End
Attribute VB_Name = "frmClosedDays"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

