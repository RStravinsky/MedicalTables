import QtQuick 2.2
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0

Item {

    id: mainButton
    property string bName    

    Rectangle {
        id: rectangle
        anchors.fill: mainButton
        border.width: 5
        border.color: "#787878"
        radius: 15
        gradient: Gradient {
            GradientStop { position: 0;    color: "lightgray" }
            GradientStop { position: .1;   color: "#838383" }
            GradientStop { position: .5;   color: "#464646" }
            GradientStop { position: 1.0; color: "#464646" }
        }

        /* Button text */
        Text {
            id: mainButtonText
            text: bName
            anchors.centerIn: rectangle
            font.pixelSize: rectangle.height * .3
            font.family: "Lato Black"
            color: "#00CED1"
            styleColor: "#4f000000"
            style: Text.Sunken
        }

        DropShadow {
            anchors.fill: mainButtonText
            horizontalOffset: 3
            verticalOffset: 4
            radius: 3
            samples: 16
            color: "#80000000"
            source: mainButtonText
        }

        MouseArea {
            id: mouseArea;
            anchors.fill: rectangle
            hoverEnabled: true
            onEntered: rectangle.state = "ENTERED"
            onExited: rectangle.state = "EXITED"
            onClicked: {
                clickedAnimation.start()
                optList.onMainButtonClicked(mainButton.bName)
                settingsArea.clear()
                imageState.setColor()
                initRectangle.visible = false
                mainImageRectangle.visible = true
                gridRectangle.visible = true
                acceptButton.visible = true
                previewButton.visible = true
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




