import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Button {

    property string tekst

    x:270
    height: 50
    width: 150

    style: ButtonStyle  {
        label: Text {
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.family: "Arial"
            font.pointSize: 12
            color: "black"
            text: qsTr(tekst)
        }
    }
}
