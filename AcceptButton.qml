import QtQuick 2.2
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0

Item {

    id: acceptButton

    Rectangle {
        id: rectangle
        anchors.fill: acceptButton
        radius: width*0.5
        color: "transparent"

        Image {
            id: acceptImage;
            source:"/images/images/accept.png"
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
            onClicked: {
                clickedAnimation.start()
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


//Item {

//    Rectangle {
//        id: acceptButton
//        anchors.fill: parent
//        color: "white"
//        radius: 10

//        Text {
//            id: text
//            width: acceptButton.width * .7
//            height: acceptButton.height
//            text: "Generuj"
//            anchors.centerIn: acceptButton
//            font.pixelSize: acceptButton.height * .5
//            font.family: "Lato Black"
//            color: "#00CED1"
//            styleColor: "#4f000000"
//            style: Text.Sunken
//        }

////        Image {
////            id: title;
////            source:"/images/images/accept.png"
////            width: 100
////            height: acceptButton.height
////            anchors.left: text.right
////            anchors.verticalCenter: acceptButton.verticalCenter
////            antialiasing: true
////            smooth: true
////        }

//        MouseArea {
//            id: mouseArea
//            anchors.fill: acceptButton
//            hoverEnabled: true
//            onClicked: {
//                numberAnimation.start()
//                optList.generateSchedule()
//            }
//        }


//        NumberAnimation {
//            id:numberAnimation
//            target: acceptButton
//            property: "opacity"
//            from: 0.2
//            to: 1
//            duration: 2000
//            easing.type: Easing.OutSine
//        }
//    }
//}


