import QtQuick 2.2
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1

Item {

    property alias bColor: acceptButton.color
    property string bText

    Rectangle {
        id: acceptButton
        anchors.fill: parent
        color: bColor
        radius: 30
        border.width: 5
        border.color: "lightgray"

        Rectangle {
            id: acceptArea
            anchors.centerIn: acceptButton
            width: acceptButton.width - 10
            height: acceptButton.height - 10
            radius: acceptButton.radius - acceptButton.border.width/2

            gradient: Gradient {
                GradientStop { position: 0;    color: "#88FFFFFF" }
                GradientStop { position: .1;   color: "#55FFFFFF" }
                GradientStop { position: .5;   color: "#33FFFFFF" }
                GradientStop { position: .501; color: "#11000000" }
                GradientStop { position: .8;   color: "#11FFFFFF" }
                GradientStop { position: 1;    color: "#55FFFFFF" }
            }

            MouseArea {
                anchors.fill: acceptArea
                hoverEnabled: true
                onEntered: acceptArea.state = "ENTERED"
                onExited: acceptArea.state = "EXITED"
                onClicked: {
                    clickedAnimation.start()
                    scheduleItem.generateSchedule()
                    optList.readItemsState()

                }
            }

            ParallelAnimation {
                id: clickedAnimation
                NumberAnimation{
                    id:scaleAnimation
                    target: acceptButton
                    property: "scale"
                    from: 0
                    to: 1
                    duration: 300
                    easing.type: Easing.InCirc
                }

                NumberAnimation {
                    id:numberAnim
                    target: acceptButton
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
                        target: acceptButton
                        border.color: "gray"
                        opacity: 1.0
                    }
                },
                State {
                    name: "EXITED"
                    PropertyChanges {
                        target: acceptButton
                        border.color: "lightgray"
                        opacity: 1.0
                    }
                }
            ]

            transitions: [
                Transition {
                    from: "EXITED"
                    to: "ENTERED"
                    ColorAnimation {
                        target: acceptButton
                        duration: 600
                    }
                },
                Transition {
                    from: "ENTERED"
                    to: "EXITED"
                    ColorAnimation {
                        target: acceptButton
                        duration: 600
                    }
                }
            ]

            Text {
                anchors.centerIn: parent
                text: bText
                font.family: "Arial Bold"
                font.pixelSize: acceptButton.height/3
                color: "white"
            }
        }
    }
 }

