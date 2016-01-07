import QtQuick 2.5
import QtMultimedia 5.5

VideoOutput {
    property alias videoSource: videoOutput.source
    property bool active: false

    id: videoOutput
    enabled: active
    visible: active
    anchors.fill: parent
    anchors.leftMargin: 40

}

