import QtQuick 2.2
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0

Item {

    id: previewButton

    Rectangle {
        id: rectangle
        anchors.fill: previewButton
        radius: width*0.5
        color: "transparent"

        Image {
            id: acceptImage;
            source:"/images/images/preview.png"
            width: height
            height: rectangle.height
            anchors.centerIn: rectangle
            antialiasing: true
            smooth: true
        }

        MouseArea {
            anchors.fill: rectangle
            hoverEnabled: true
            onEntered: rectangle.state = "ENTERED"
            onExited: rectangle.state = "EXITED"
            onReleased: {
                clickedAnimation.start()
                optList.showTable()
            }
        }

        ParallelAnimation {
            id: clickedAnimation
            NumberAnimation{
                target: rectangle
                property: "scale"
                from: 1.15
                to: 0.7
                duration: 50
                easing.type: Easing.Linear
            }

            NumberAnimation {
                target: rectangle
                property: "scale"
                from: 0.7
                to: 1.15
                duration: 50
                easing.type: Easing.Linear
            }
        }

        states: [
            State {
                name: "ENTERED"
                PropertyChanges {
                    target: rectangle
                    scale: 1.15
                }
            },
            State {
                name: "EXITED"
                PropertyChanges {
                    target: rectangle
                    scale: 1
                }
            }
        ]

        transitions: [
            Transition {
                from: "EXITED"
                to: "ENTERED"
                ColorAnimation {
                    target: rectangle
                    duration: 1000
                }
            },
            Transition {
                from: "ENTERED"
                to: "EXITED"
                ColorAnimation {
                    target: rectangle
                    duration: 1000
                }
            }
        ]

     } // Rectangle

} // Item


