import QtQuick 2.5
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2

Rectangle {

    property alias menuBar:      menuBar
    property alias loginPanel:   loginPanel
    property alias previewPanel: previewPanel

    width: 1200
    height: 800

    Image {
        id: background
        anchors.fill: parent
        fillMode: Image.Stretch
        source: "/graphics/background.jpg"

        PanelLogin      {
            id: loginPanel
            anchors.verticalCenterOffset: -50
            anchors.horizontalCenterOffset: -210
            transformOrigin: Item.Bottom
            anchors.centerIn: parent
        }
        PanelPreview    {
            id:previewPanel
            anchors.fill: parent
        }
        PanelMenuBar    {
            id: menuBar
            height: parent.height
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
        }

    }
}
