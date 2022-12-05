VERSION 5.00
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Begin VB.Form mainWindow 
   Caption         =   "Nee shi message generator"
   ClientHeight    =   5955
   ClientLeft      =   225
   ClientTop       =   825
   ClientWidth     =   5235
   LinkTopic       =   "Form1"
   ScaleHeight     =   5955
   ScaleWidth      =   5235
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox neeshiText 
      Height          =   3495
      Left            =   120
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   2
      Top             =   1440
      Width           =   4935
   End
   Begin VB.CommandButton neeshiClear 
      Caption         =   "Clear"
      Height          =   495
      Left            =   2640
      TabIndex        =   1
      Top             =   840
      Width           =   2415
   End
   Begin VB.CommandButton neeshiButton 
      Caption         =   "Generate"
      Height          =   495
      Left            =   120
      TabIndex        =   0
      Top             =   840
      Width           =   2415
   End
   Begin RichTextLib.RichTextBox neeshiLabel 
      Height          =   495
      Left            =   120
      TabIndex        =   4
      Top             =   120
      Width           =   4935
      _ExtentX        =   8705
      _ExtentY        =   873
      _Version        =   393217
      BackColor       =   -2147483644
      BorderStyle     =   0
      Enabled         =   0   'False
      HideSelection   =   0   'False
      MultiLine       =   0   'False
      ReadOnly        =   -1  'True
      Appearance      =   0
      OLEDragMode     =   0
      OLEDropMode     =   0
      TextRTF         =   $"mainWindow.frx":0000
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Label Label1 
      Caption         =   $"mainWindow.frx":009A
      Height          =   615
      Left            =   120
      TabIndex        =   3
      Top             =   5160
      Width           =   4935
   End
   Begin VB.Menu file 
      Caption         =   "File"
      Begin VB.Menu quit 
         Caption         =   "Quit"
      End
   End
   Begin VB.Menu help 
      Caption         =   "Help"
      Begin VB.Menu about 
         Caption         =   "About"
      End
   End
End
Attribute VB_Name = "mainWindow"
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

' hacky hack very wacky
Private Function redrawWindow()
    ' hack: prevent negative value for width and height
    If mainWindow.Height < 3200 Then
        mainWindow.Height = 3200
    End If
    If mainWindow.Width < 540 Then
        mainWindow.Width = 540
    End If
    ' align label
    neeshiLabel.SelAlignment = rtfCenter
    neeshiLabel.Width = mainWindow.Width - 540
    neeshiLabel.Left = 120
    ' align buttons
    neeshiButton.Width = mainWindow.Width / 2 - 350
    neeshiClear.Width = mainWindow.Width / 2 - 320
    neeshiClear.Left = neeshiButton.Width + 225
    ' align text field
    neeshiText.Width = mainWindow.Width - 540
    neeshiText.Height = mainWindow.Height - 3200
    ' align legal text
    Label1.Top = neeshiText.Height + neeshiButton.Height + neeshiLabel.Height + 600
    Label1.Width = mainWindow.Width - 540
End Function

Private Function readFile(sFile As String) As String
    Dim nFile As Integer
    nFile = FreeFile
    Open sFile For Input Access Read As #nFile
    readFile = Input$(LOF(nFile), nFile)
    Close #nFile
End Function

Private Function generateMsg() As String
    Dim predefMsg As String
    Dim randNum As Integer
    Randomize
    randNum = Rnd * 9
    If randNum < 5 Then
        predefMsg = "install NetBSD"
    Else
        Dim msgs As Variant
        msgs = Split(readFile("..\msgs.txt"), vbCrLf)
        predefMsg = msgs(Int((Rnd * (UBound(msgs) - LBound(msgs) + 1) + LBound(msgs))))
    End If
    ' TODO: read msg.txt
    ' import as array
    ' select a random item from the array for Else
    generateMsg = predefMsg
End Function

Private Sub Form_Resize()
    redrawWindow
End Sub

Private Sub neeshiButton_Click()
    neeshiText.Text = neeshiText.Text & vbNewLine & generateMsg()
End Sub

Private Sub neeshiClear_Click()
    neeshiText.Text = ""
End Sub

Private Sub quit_Click()
    End
End Sub

Private Sub about_Click()
    aboutDiag.Show
End Sub
