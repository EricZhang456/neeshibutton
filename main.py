# SPDX-License-Identifier: GPL-3.0-or-later
# 
#    neeshibutton - Generate a nee shi-style message
#    Copyright (C) 2022 Eric Zhang
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.

import sys
import random

from PyQt6 import QtCore, QtGui, QtWidgets

from mainWindow import Ui_mainWindow

def generateMsg():
    with open("msgs.txt", "r") as file:
        msgs = file.read().splitlines()
    if random.randint(0,9) < 6:
        predefMsg = "install NetBSD"
    else:
        predefMsg = random.choice(msgs)
    return predefMsg

class mainWindow(QtWidgets.QMainWindow, Ui_mainWindow):
    def __init__(self, *args, obj=None, **kwargs):
        super(mainWindow, self).__init__(*args, **kwargs)
        self.setupUi(self)
        self.neeshiButton.clicked.connect(self.displayText)
    def displayText(self):
        self.neeshiMsg.insertPlainText (generateMsg() + "\n")

app = QtWidgets.QApplication(sys.argv)

window = mainWindow()
window.show()
app.exec()
