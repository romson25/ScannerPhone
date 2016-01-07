import QtQuick 2.5

Rectangle {
    property alias buttonConnect: connect
    property string ip: textInput_ip.input.text
    property string port: textInput_port.input.text
    property bool active: false

    enabled: active
    visible: active
    anchors.centerIn: parent

    ControlButtonLogin{    //__Button połącz z komputerem
        id: connect
        y:0
        focus: true
        tekst: "Connect"
    }
    ControlButtonLogin{    //__Button_zamknij program
        id: exit
        y: 60
        tekst: "Quit"
        onClicked: Qt.quit()
    }
    ControlLabel{     //__Etykieta IP
        id:label_ip
        y: 0
        tekst: "Ip"
    }
    ControlLabel{     //__Etykieta Port
        id: label_port
        y: 60
        tekst: "Port"
    }
    ControlTextInput{ //__TextInput dla numeru IP wraz z tłem
        id:textInput_ip
        y:0
        input.text: "192.168.1.100"
    }
    ControlTextInput{ //__TextInput dla numeru Portu wraz z tłem
        id:textInput_port
        y:60
        input.text: "6850"
    }
}

