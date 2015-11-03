import QtQuick 2.2
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0

Item {

    property string bText

    Rectangle {
        id: acceptButton
        anchors.fill: parent
        radius: 30
        border.width: 5
        border.color: "lightgray"

        gradient: Gradient {
            GradientStop { position: 0;    color: "lightgray" }
            GradientStop { position: .1;   color: "#838383" }
            GradientStop { position: .5;   color: "#464646" }
            GradientStop { position: 1.0; color: "#464646" }
        }


        Image {
            id: title;
            source: "/images/images/add_list.png"
            anchors.left: acceptButton.left
            anchors.verticalCenter: acceptButton.verticalCenter
            anchors.topMargin: 10
            anchors.leftMargin: 30
            width: ((acceptButton.width * .2)- 10);
            height: (acceptButton.height - 30);
        }

        Text {
            id: buttonText
            anchors.left: title.right
            anchors.top: acceptButton.top
            anchors.leftMargin: 30
            anchors.topMargin: height/2 - 30
            width: ((acceptButton.width * .5) - 10);
            height: (acceptButton.height - 10);
            text: bText
            font.pixelSize: acceptButton.height * .3
            font.family: "Lato Black"
            color: "#00CED1"
            styleColor: "#4f000000"
            style: Text.Sunken
        }

        DropShadow {
               anchors.fill: buttonText
               horizontalOffset: 3
               verticalOffset: 4
               radius: 3
               samples: 16
               color: "#80000000"
               source: buttonText
           }




        MouseArea {
            anchors.fill: acceptButton
            hoverEnabled: true
            onEntered: acceptButton.state = "ENTERED"
            onExited: acceptButton.state = "EXITED"
            onClicked: {
                clickedAnimation.start()
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

        }
    }


