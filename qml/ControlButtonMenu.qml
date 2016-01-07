import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Button {
    id:myButton
    property string tekst
    property string myColor
    property bool active: false

    width: 40
    height: parent.height/2
    anchors.bottomMargin: 0

    objectName: tekst

    style: ButtonStyle  {
        label: Text {
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.family: "Arial"
            font.pointSize: 12
            text: qsTr(tekst)
            color: myColor
            rotation:-90
        }
    }

    enabled: active
    myColor: ( active ? "black" : "gray" )
}
