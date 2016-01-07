import QtQuick 2.5

Rectangle {

    property alias input: input

    x:60
    height: 50
    width: 200
    color: "#ffffff"

    TextInput {
        id: input
        anchors.fill: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 12
        inputMethodHints: Qt.ImhDigitsOnly
    }
}
