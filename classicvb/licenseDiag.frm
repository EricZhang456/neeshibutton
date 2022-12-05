VERSION 5.00
Object = "{3050F1C5-98B5-11CF-BB82-00AA00BDCE0B}#4.0#0"; "mshtml.tlb"
Begin VB.Form licenseDiag 
   Caption         =   "License"
   ClientHeight    =   3060
   ClientLeft      =   120
   ClientTop       =   420
   ClientWidth     =   4560
   LinkTopic       =   "Form1"
   ScaleHeight     =   3060
   ScaleWidth      =   4560
   StartUpPosition =   3  'Windows Default
   Begin MSHTMLCtl.Scriptlet license 
      Height          =   2775
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   4215
      Scrollbar       =   -1  'True
      URL             =   "https://www.gnu.org/licenses/gpl-3.0-standalone.html"
   End
End
Attribute VB_Name = "licenseDiag"
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
    If licenseDiag.Width < 465 Then
        licenseDiag.Width = 465
    End If
    If licenseDiag.Height < 825 Then
        licenseDiag.Height = 825
    End If
    license.Height = licenseDiag.Height - 825
    license.Width = licenseDiag.Width - 465
End Function

Private Sub Form_Resize()
    redrawWindow
End Sub
