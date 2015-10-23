import QtQuick 2.0
import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1


Item {
    id: container
    property alias titleImg: title.source
    property alias tableImg: table.source
    property alias bWidth: container.width
    property alias bHeight: container.height

    Rectangle {
                id: rectangle
                border.color: "transparent"
                border.width: 10
                color: "lightgrey"
                radius: 10
                anchors.fill: parent

                MouseArea {
                    id: mouseArea;
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: rectangle.state = "ENTERED"
                    onExited: rectangle.state = "EXITED"
                    onClicked: {
                        //rectangle.state = "pressed"
                        //pressedTimer.start()
                        scaleAnimation.start()
                        numberAnim.start()
                    }
                }


                PropertyAnimation{
                    id:scaleAnimation
                    target: rectangle
                    property: "scale"
                    from: 0
                    to: 1
                    duration: 1200
                    easing.type: Easing.OutBack
                }


                NumberAnimation {
                    id:numberAnim
                    target: rectangle
                    property: "opacity"
                    from: 0
                    to: 1
                    duration: 1200
                    easing.type: Easing.OutSine
                }



                states: [
                    State {
                        name: "ENTERED"
                        PropertyChanges {
                            target: rectangle
                            border.color: "orange"
                        }
                    },
                    State {
                        name: "EXITED"
                        PropertyChanges {
                            target: rectangle
                            border.color: "transparent"

                        }
                    }//,
//                    State {
//                            name: "pressed"
//                            PropertyChanges { target: rectangle; scale: 0.9 }
//                    }
                ]

//                Timer {
//                    id: pressedTimer
//                    interval: 500;
//                    repeat: false
//                    onTriggered: rectangle.state = 'State0'
//                }

                transitions: [
                    Transition {
                        from: "EXITED"
                        to: "ENTERED"
                        ColorAnimation {
                            target: rectangle
                            duration: 800
                        }
                    },
                    Transition {
                        from: "EXITED"
                        to: "ENTERED"
                        ColorAnimation {
                            target: rectangle
                            duration: 800
                        }
                    }//,
//                    Transition {
//                        NumberAnimation {
//                            properties: "scale";
//                            duration: 500;
//                            easing.type: Easing.OutBounce }
//                    }
                ]


                Row {
                    spacing: 2
                    anchors.fill: rectangle
                    anchors.margins: 10

                    Image { id: title; width: rectangle.width/2; height: rectangle.height }
                    Image { id: table; width: rectangle.width/2; height: rectangle.height }
                }



    }

}
