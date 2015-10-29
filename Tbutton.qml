import QtQuick 2.2
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1

Item {
    id: container
    property string bName
    property alias titleImg: title.source
    property alias tableImg: table.source
    property alias bWidth: container.width
    property alias bHeight: container.height

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

                MouseArea {
                    id: mouseArea;
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: rectangle.state = "ENTERED"
                    onExited: rectangle.state = "EXITED"
                    onClicked: {
                        clickedAnimation.start()
                        optList.mainButtonClicked(container.bName)
                        optList.setItemsList(bName)
                        mainImageRectangle.visible = true
                        if ( bName == "T2")
                        {
                            imageT2.visible = true
                            imageT3.visible = false
                            imageT7.visible = false
                        }

                        if ( bName == "T3")
                        {
                            imageT2.visible = false
                            imageT3.visible = true
                            imageT7.visible = false
                        }

                        if ( bName == "T7")
                        {
                            imageT2.visible = false
                            imageT3.visible = false
                            imageT7.visible = true
                        }
                        grid.visible = true
                    }
                }

                ParallelAnimation {

                    id: clickedAnimation
                    NumberAnimation{
                        id:scaleAnimation
                        target: rectangle
                        property: "scale"
                        from: 0
                        to: 1
                        duration: 200
                        easing.type: Easing.InBack
                    }

                    NumberAnimation {
                        id:numberAnim
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
                            border.color: "lightgray"
                            opacity: 1.0
                        }
                    },
                    State {
                        name: "EXITED"
                        PropertyChanges {
                            target: rectangle
                            border.color: "transparent"
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
    }

}
