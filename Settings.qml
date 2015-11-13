import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.3

Item {

    id: settings

    Rectangle {
        id: rectangle
        width: settings.width
        height: settings.height

        Image {
            id: clearText
            anchors.fill: rectangle
            source: "/images/images/settings.png"
            smooth: true
            antialiasing: true
        }

        Text {
            id: infoText
            width: rectangle.width
            height: rectangle.height * 0.01
            anchors.top: rectangle.top
            anchors.topMargin: rectangle.height * 0.15
            horizontalAlignment: Text.AlignHCenter
            text: "Opcje dodatkowe:"
            color: "gray"
            font { family: "Arial"; pixelSize: rectangle.height * .1 }
        }
    }
}
