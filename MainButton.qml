import QtQuick 2.2
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1

BorderImage {

        id: buttonbase

        signal clicked

        property alias text : label.text
        property bool pressed: hitbox.pressed && hitbox.containsMouse

        source: pressed ? "button_down.png" : "button_up.png"

        border.left: 50;
        border.right: 50;

        MouseArea {
            id: hitbox
            anchors.fill: parent
            onClicked: parent.clicked()
        }

        Text {
            id: label
            anchors.centerIn: parent
            anchors.verticalCenterOffset: pressed ? -2 : -3
            font.family: "Lato Black"
            font.pixelSize: 26

            color: "#ffffff"
            styleColor: "#4f000000"
            style: Text.Sunken
        }
    }








