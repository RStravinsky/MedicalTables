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
    signal clicked(string sState)


    Rectangle {

                id: rectangle
                color: "#e4d8d8"
                border.color: "transparent"
                border.width: 3
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
                        scaleAnimation.start()
                        numberAnim.start()

                       if(rectangle.state == "ENTERED")
                            container.clicked("UNCHECKED");
                       else
                           container.clicked("CHECKED");
                    }
                    onReleased: {
                        if (containsMouse)
                            rectangle.state="HOVERING";
                        else
                            rectangle.state="EXITED";
                        }
                }

                PropertyAnimation{
                    id:scaleAnimation
                    target: rectangle
                    property: "scale"
                    from: 0
                    to: 1
                    duration: 500
                    easing.type: Easing.OutCirc
                }

                NumberAnimation {
                    id:numberAnim
                    target: rectangle
                    property: "opacity"
                    from: 0
                    to: 1
                    duration: 500
                    easing.type: Easing.OutSine
                }

                states: [
                    State {
                         name: "HOVERING"
                         PropertyChanges {
                         target: rectangle
                         border.color: "lightgray"
                         opacity: 1.0
                         }
                    },
                    State {
                        name: "ENTERED"
                        PropertyChanges {
                            target: rectangle
                            border.color: "lightgray"
                            opacity: 1.0
                        }
                    },
                    State {
                        name: "EXITED"
                        PropertyChanges {
                            target: rectangle
                            border.color: "transparent"

                        }
                    }
                ]

                transitions: [
                    Transition {
                         from: "EXITED";
                         to: "HOVERING"
                          ColorAnimation {
                              target: rectangle
                              duration: 200
                          }
                    },
                    Transition {
                        from: "EXITED"
                        to: "ENTERED"
                        ColorAnimation {
                            target: rectangle
                            duration: 800
                        }
                    },
                    Transition {
                        from: "ENTERED"
                        to: "EXITED"
                        ColorAnimation {
                            target: rectangle
                            duration: 800
                        }
                    }
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
