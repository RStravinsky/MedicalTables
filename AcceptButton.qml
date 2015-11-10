import QtQuick 2.2
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0

Item {

    //property string bText

    Rectangle {
        id: acceptButton
        anchors.fill: parent
        radius: 15
        border.width: 5
        border.color: "#919191"

        gradient: Gradient {
            GradientStop { position: 0;    color: "lightgray" }
            GradientStop { position: .1;   color: "#838383" }
            GradientStop { position: .5;   color: "#464646" }
            GradientStop { position: 1.0; color: "#464646" }
        }


        Image {
            id: title;
            source: "/images/images/accept.png"
            anchors.fill: parent
            anchors.margins: 30
            antialiasing: true
            smooth: true
        }


        MouseArea {
            anchors.fill: acceptButton
            hoverEnabled: true
            onEntered: acceptButton.state = "ENTERED"
            onExited: acceptButton.state = "EXITED"
            onClicked: {
                clickedAnimation.start()
                scheduleItem.generateSchedule()
                //optList.loadItemsState()
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
                    border.color: "#00CED1"
                    opacity: 1.0
                }
            },
            State {
                name: "EXITED"
                PropertyChanges {
                    target: acceptButton
                    border.color: "#919191"
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

        }
    }

