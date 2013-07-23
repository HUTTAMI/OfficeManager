VERSION 5.00
Begin VB.Form frmChurchList 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   " Church List"
   ClientHeight    =   6120
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8295
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
   ScaleHeight     =   6120
   ScaleWidth      =   8295
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.PictureBox picDataEntry 
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2385
      Left            =   90
      ScaleHeight     =   2385
      ScaleWidth      =   8205
      TabIndex        =   18
      Top             =   3210
      Width           =   8205
      Begin VB.PictureBox tdbtAddr1 
         Height          =   345
         Left            =   30
         ScaleHeight     =   285
         ScaleWidth      =   4335
         TabIndex        =   2
         Top             =   390
         Width           =   4395
      End
      Begin VB.PictureBox tdbtAddr2 
         Height          =   345
         Left            =   4395
         ScaleHeight     =   285
         ScaleWidth      =   3660
         TabIndex        =   3
         Top             =   390
         Width           =   3720
      End
      Begin VB.PictureBox tdbtCity 
         Height          =   345
         Left            =   30
         ScaleHeight     =   285
         ScaleWidth      =   3435
         TabIndex        =   4
         Top             =   720
         Width           =   3495
      End
      Begin VB.PictureBox tdbtState 
         Height          =   345
         Left            =   3690
         ScaleHeight     =   285
         ScaleWidth      =   975
         TabIndex        =   5
         Top             =   720
         Width           =   1035
      End
      Begin VB.PictureBox tdbmZipcode 
         Height          =   345
         Left            =   4890
         ScaleHeight     =   285
         ScaleWidth      =   1425
         TabIndex        =   6
         Top             =   720
         Width           =   1485
      End
      Begin VB.PictureBox tdbtChurchName 
         Height          =   345
         Left            =   30
         ScaleHeight     =   285
         ScaleWidth      =   8025
         TabIndex        =   1
         Top             =   60
         Width           =   8085
      End
      Begin VB.PictureBox tdbmPhone1 
         Height          =   345
         Left            =   630
         ScaleHeight     =   285
         ScaleWidth      =   2385
         TabIndex        =   7
         Top             =   1290
         Width           =   2445
      End
      Begin VB.PictureBox tdbmPhone2 
         Height          =   345
         Left            =   630
         ScaleHeight     =   285
         ScaleWidth      =   2385
         TabIndex        =   8
         Top             =   1620
         Width           =   2445
      End
      Begin VB.PictureBox tdbmFax 
         Height          =   345
         Left            =   630
         ScaleHeight     =   285
         ScaleWidth      =   2385
         TabIndex        =   9
         Top             =   1950
         Width           =   2445
      End
      Begin VB.PictureBox tdbtContact1 
         Height          =   345
         Left            =   3720
         ScaleHeight     =   285
         ScaleWidth      =   4335
         TabIndex        =   10
         Top             =   1290
         Width           =   4395
      End
      Begin VB.PictureBox tdbtContact2 
         Height          =   345
         Left            =   3720
         ScaleHeight     =   285
         ScaleWidth      =   4335
         TabIndex        =   11
         Top             =   1620
         Width           =   4395
      End
   End
   Begin VB.CommandButton cmdEdit 
      Caption         =   "&Edit Church"
      Height          =   375
      Left            =   1530
      TabIndex        =   13
      TabStop         =   0   'False
      ToolTipText     =   "Edit Address Book Entry"
      Top             =   5670
      Width           =   1335
   End
   Begin VB.CommandButton cmdSave 
      Caption         =   "&Save"
      Height          =   375
      Left            =   4470
      TabIndex        =   15
      ToolTipText     =   "Save Changes to Address Book Entry"
      Top             =   5670
      Width           =   1275
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   5790
      TabIndex        =   16
      ToolTipText     =   "Cancel Changes to Address Book Entry"
      Top             =   5670
      Width           =   1395
   End
   Begin VB.CommandButton cmdDelete 
      Caption         =   "&Delete Church"
      Height          =   375
      Left            =   2910
      TabIndex        =   14
      TabStop         =   0   'False
      Top             =   5670
      Width           =   1515
   End
   Begin VB.CommandButton cmdNew 
      Caption         =   "&Add Church"
      Height          =   375
      Left            =   90
      TabIndex        =   12
      TabStop         =   0   'False
      Top             =   5670
      Width           =   1395
   End
   Begin VB.PictureBox tdbgChurchList 
      Height          =   2835
      Left            =   120
      ScaleHeight     =   2775
      ScaleWidth      =   8025
      TabIndex        =   0
      Top             =   300
      Width           =   8085
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Quick Search"
      Height          =   225
      Left            =   120
      TabIndex        =   17
      Top             =   30
      Width           =   4455
   End
End
Attribute VB_Name = "frmChurchList"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

