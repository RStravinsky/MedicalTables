import QtQuick 2.2
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0

Item {

    Rectangle {
        id: acceptButton
        anchors.fill: parent
        color: "transparent"

        Image {
            id: title;
            source: {
                if(mouseArea.containsMouse )"/images/images/accept_hover.png"
                else "/images/images/accept.png"
            }
            anchors.fill: parent
            antialiasing: true
            smooth: true
        }


        MouseArea {
            id: mouseArea
            anchors.fill: acceptButton
            hoverEnabled: true
            onClicked: numberAnimation.start()
        }


        NumberAnimation {
            id:numberAnimation
            target: acceptButton
            property: "opacity"
            from: 0.2
            to: 1
            duration: 2000
            easing.type: Easing.OutSine
        }
    }
}


