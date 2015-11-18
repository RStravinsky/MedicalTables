import QtQuick 2.2
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0

Item {

    id: generateButton

    Rectangle {
        id: rectangle
        anchors.fill: generateButton
        border.width: 5
        border.color: "#787878"
        radius: 15
        gradient: Gradient {
            GradientStop { position: 0;    color: "lightgray" }
            GradientStop { position: .1;   color: "#838383" }
            GradientStop { position: .5;   color: "#464646" }
            GradientStop { position: 1.0; color: "#464646" }
        }

        Image {
            id: generateImage;
            source:"/images/images/accept.png"
            width: height
            height: rectangle.height
            anchors.centerIn: rectangle
            antialiasing: true
            smooth: true
        }


        MouseArea {
            id: mouseArea;
            anchors.fill: rectangle
            hoverEnabled: true
            onEntered: rectangle.state = "ENTERED"
            onExited: rectangle.state = "EXITED"
            onClicked: {
                clickedAnimation.start()
                if( optList.generateSchedule() === true ) {
                    order.clearText()
                    order.visible = true
                    initRectangle.visible = true

                    topFrame.visible = false
                    mainImageRectangle.visible = false
                    gridRectangle.visible = false
                    acceptButton.visible = false
                    previewButton.visible = false
                }
            }
        }

        ParallelAnimation {

            id: clickedAnimation
            NumberAnimation{
                target: rectangle
                property: "scale"
                from: 0
                to: 1
                duration: 300
                easing.type: Easing.InCirc
            }

            NumberAnimation {
                target: rectangle
                property: "opacity"
                from: 0
                to: 1
                duration: 300
                easing.type: Easing.OutSine
            }
        }

        states: [
            State {
                name: "ENTERED"
                PropertyChanges {
                    target: rectangle
                    border.color: "#69C0D9"
                    opacity: 1.0
                }
            },
            State {
                name: "EXITED"
                PropertyChanges {
                    target: rectangle
                    border.color: "#787878"
                    opacity: 1.0
                }
            }
        ]

        transitions: [
            Transition {
                from: "EXITED"
                to: "ENTERED"
                ColorAnimation {
                    target: rectangle
                    duration: 600
                }
            },
            Transition {
                from: "ENTERED"
                to: "EXITED"
                ColorAnimation {
                    target: rectangle
                    duration: 600
                }
            }
        ]

     } // Rectangle

} // Item




