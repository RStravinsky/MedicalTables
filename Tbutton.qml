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
                color: "#e4d8d8"
                border.color: "transparent"
                border.width: 5
                radius: 10
                anchors.fill: parent
                gradient: Gradient {
                    GradientStop {
                        position: 0.00;
                        color: "#e0d9d9";
                    }
                    GradientStop {
                        position: 1.00;
                        color: "#ffffff";
                    }
                }

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
                            border.color: "#e0d9d9"
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
                    anchors.margins: 5

                    Image {
                        id: title;
                        width: (rectangle.width/2 - 10);
                        height: (rectangle.height - 10);
                        opacity: 0.5
                    }
                    Image {
                        id: table;
                        width: (rectangle.width/2 - 10);
                        height: (rectangle.height - 10);
                        opacity: 1
                        antialiasing: true
                    }

                }



    }

}
