import QtQuick 2.5
import QtQuick.Controls 1.4

Item {
    property alias buttonQuit:          buttonQuit
    property alias buttonSearchFocus:   buttonSearchFocus

    y: 0
    width: 40

    ControlButtonMenu{
        id: buttonQuit
        objectName: "Quit"
        tekst: objectName
        onClicked: Qt.quit()
        anchors.bottom: buttonSearchFocus.top
    }
    ControlButtonMenu{
        id: buttonSearchFocus
        objectName: "Search focus"
        tekst: objectName
        anchors.bottom: parent.bottom
    }
}

