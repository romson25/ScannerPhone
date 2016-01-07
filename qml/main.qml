import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.2
import QtMultimedia 5.5

import com.company.scannerphone 1.0

ApplicationWindow {
    visible: true
    width: 1200
    height: 800

    statusBar: StatusBar {
        id: statusBar

        Timer {
            id: timer
            interval: 3000
            repeat: false
            running: false
            onTriggered: statusBarLine.text = ""
        }

        RowLayout {
            anchors.fill: parent
            Label {
                id: statusBarLine
                text: "Read only"
                onTextChanged: timer.start()
            }
        }
    }

    Server  {
        id: server
        connectionStatus:   CppConnector.connectionStatus
        onConnectionStatusChanged:  {
            if( connectionStatus ) {
                gui.state = "Preview"
                statusBarLine.text = "Połączono z aplikacją ScannerPC"
            }
            else {
                statusBarLine.text = "Nieudana próba połączenia"
                gui.state = "Login"
            }
        }
        isWaitingForPhoto:  CppConnector.isWaitingForPhoto
        onIsWaitingForPhotoChanged: {
            if(isWaitingForPhoto && camera.imageCapture.ready)
                camera.imageCapture.capture()
        }
        isEndScanning:      CppConnector.isEndScanning
        onIsEndScanningChanged:     {
            console.log("ojojoj chyba to już koniec skanowania")
        }
    }
    Gui     {
        id: gui
        anchors.fill: parent

        function openConnection()   {
            if(loginPanel.ip =="" || loginPanel.port == "")
                statusBarLine.text = "Wprowadź prawidłowy adres IP oraz numer PORTu "
            else
                CppConnector.openConnection(loginPanel.ip, loginPanel.port)
        }

        state: "Login"
        onStateChanged: console.log("Ustawiony state: "+state.toString())
        states: [
              State { //--Login Panel
                  name: "Login"
                  PropertyChanges {
                      target: gui.loginPanel
                      active: true
                  }
                  PropertyChanges {
                      target: gui.previewPanel
                      active: false
                  }
                  PropertyChanges {
                      target: gui
                      menuBar {
                          buttonQuit.active:        true
                          buttonSearchFocus.active: false
                      }
                  }
              },
              State { //--Preview
                  name: "Preview"
                  PropertyChanges {
                      target: gui.loginPanel
                      active: false
                  }
                  PropertyChanges {
                      target: gui.previewPanel
                      active: true
                  }
                  PropertyChanges {
                      target: gui
                      menuBar {
                          buttonQuit.active:        true
                          buttonSearchFocus.active: true
                      }
                  }
              }
          ]

        previewPanel    {
            videoSource: camera
        }
        loginPanel      {
            buttonConnect {
                onClicked: openConnection()
            }
        }
        menuBar         {
            buttonSearchFocus.onClicked:    searchAndLockFocus()
        }
    }
    Camera  {
        id: camera
        captureMode: Camera.CaptureStillImage
        imageCapture {
            onImageSaved: {
                CppConnector.imageCaptured(camera.imageCapture.capturedImagePath)
            }
        }
        imageProcessing {
            denoisingLevel: 1.0
            sharpeningLevel: 0.5
        }
        focus.focusMode: Camera.FocusAuto
    }

    function searchAndLockFocus()   {
        gui.state = "Preview"
        console.log("Uruchomiono funkcję searchAndLockFocus")
        camera.unlock()
        camera.searchAndLock()
    }

}

