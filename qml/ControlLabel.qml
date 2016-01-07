import QtQuick 2.5
import QtQuick.Controls 1.4

Item{
    property string tekst

    x: 0
    height: 50
    width: 50

    Label {
        color: "#ffffff"
        text: qsTr(tekst)
        anchors.fill: parent
        font.pointSize: 12
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }
}


