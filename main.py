#!/usr/bin/env python3
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
from about import Ui_about
from licenseDiag import Ui_licenseDiag

def generateMsg():
    if random.randint(0,9) < 5:
        predefMsg = "install NetBSD"
    else:
        with open("msgs.txt", "r") as file:
            msgs = file.read().splitlines()
        predefMsg = random.choice(msgs)
    return predefMsg

class mainWindow(QtWidgets.QMainWindow, Ui_mainWindow):
    def __init__(self, *args, obj=None, **kwargs):
        super(mainWindow, self).__init__(*args, **kwargs)
        self.setupUi(self)

        self.neeshiButton.clicked.connect(self.displayText)
        self.actionAbout.triggered.connect(self.showAbout)
        self.actionQuit.triggered.connect(self.quit)

    def displayText(self):
        self.neeshiMsg.appendPlainText (generateMsg())
    def quit(self):
        app.quit()
    def showAbout(self):
        about = aboutDialog(self)
        about.exec()

class aboutDialog(QtWidgets.QDialog):
    def __init__(self, parent=None):
        super(aboutDialog, self).__init__(parent)
        self.ui = Ui_about()
        self.ui.setupUi(self)

        self.ui.licenseButton.clicked.connect(self.displayLicense)

    def displayLicense(self):
        license = licenseDialog(self)
        license.exec()

class licenseDialog(QtWidgets.QDialog):
    def __init__(self, parent=None):
        super(licenseDialog, self).__init__(parent)
        self.ui = Ui_licenseDiag()
        self.ui.setupUi(self)

app = QtWidgets.QApplication(sys.argv)

window = mainWindow()
window.show()
app.exec()
