VERSION 5.00
Begin VB.Form aboutDiag 
   Caption         =   "About"
   ClientHeight    =   4065
   ClientLeft      =   120
   ClientTop       =   405
   ClientWidth     =   3975
   LinkTopic       =   "Form1"
   NegotiateMenus  =   0   'False
   ScaleHeight     =   4065
   ScaleWidth      =   3975
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton licenseButton 
      Caption         =   "License"
      Height          =   495
      Left            =   120
      TabIndex        =   3
      Top             =   3480
      Width           =   3735
   End
   Begin VB.TextBox legal 
      Height          =   2055
      Left            =   120
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   2
      Text            =   "about.frx":0000
      Top             =   1200
      Width           =   3735
   End
   Begin VB.Label desc 
      Alignment       =   2  'Center
      Caption         =   "Generate a nee shi-syle message"
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   720
      Width           =   3735
   End
   Begin VB.Label title 
      Alignment       =   2  'Center
      Caption         =   "neeshibutton"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   3615
   End
End
Attribute VB_Name = "aboutDiag"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' SPDX-License-Identifier: GPL-3.0-or-later
'
'    neeshibutton - Generate a nee shi-style message
'    Copyright (C) 2022 Eric Zhang
'
'    This program is free software: you can redistribute it and/or modify
'    it under the terms of the GNU General Public License as published by
'    the Free Software Foundation, either version 3 of the License, or
'    any later version.
'
'    This program is distributed in the hope that it will be useful,
'    but WITHOUT ANY WARRANTY; without even the implied warranty of
'    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
'    GNU General Public License for more details.
'
'    You should have received a copy of the GNU General Public License
'    along with this program.  If not, see <https://www.gnu.org/licenses/>.

Private Function redrawWindow()
    If aboutDiag.Width < 450 Then
        aboutDiag.Width = 450
    End If
    If aboutDiag.Height < 2590 Then
        aboutDiag.Height = 2590
    End If
    ' common width
    Dim commonWidth As Integer
    commonWidth = aboutDiag.Width - 450
    title.Width = commonWidth
    desc.Width = commonWidth
    licenseButton.Width = commonWidth
    legal.Width = commonWidth
    ' height for legal
    legal.Height = aboutDiag.Height - 2590
    ' top for licenseButton
    licenseButton.Top = title.Height + desc.Height + legal.Height + 795
End Function

Private Sub Form_Resize()
    redrawWindow
End Sub

Private Sub licenseButton_Click()
    licenseDiag.Show
End Sub
