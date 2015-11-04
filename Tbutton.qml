import QtQuick 2.2
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
//import QtGraphicalEffects 1.0

Item {
    id: container
    property string bName
    property alias titleImg: title.source
    property alias tableImg: table.source
    property alias bWidth: container.width
    property alias bHeight: container.height



    Rectangle {
                id: mainRectangle
                anchors.fill: parent
                color: "lightblue"
                radius: 30
                border.width: 5
                border.color: "lightblue"

                Rectangle {
                    id: rectangle
                    anchors.centerIn: mainRectangle
                    color: "lightblue"
                    width: mainRectangle.width - 10
                    height: mainRectangle.height - 10
                    radius: mainRectangle.radius - mainRectangle.border.width/2

                    gradient: Gradient {
                        GradientStop { position: 0;    color: "#88FFFFFF" }
                        GradientStop { position: .1;   color: "#55FFFFFF" }
                        GradientStop { position: .5;   color: "#33FFFFFF" }
                        GradientStop { position: .501; color: "#11000000" }
                        GradientStop { position: .8;   color: "#11FFFFFF" }
                        GradientStop { position: 1;    color: "#55FFFFFF" }
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
                        scheduleItem.activeMainButton(container.bName)
                        optList.setItemsList(bName)
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
                        mainImageRectangle.visible = true
                        initAnimation.visible = false
                        colorArea.visible = true
                        acceptButton.visible = true
                    }
                }

                ParallelAnimation {

                    id: clickedAnimation
                    NumberAnimation{
                        id:scaleAnimation
                        target: mainRectangle
                        property: "scale"
                        from: 0
                        to: 1
                        duration: 300
                        easing.type: Easing.InCirc
                    }

                    NumberAnimation {
                        id:numberAnim
                        target: mainRectangle
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
                            target: mainRectangle
                            border.color: "white"
                            opacity: 1.0
                        }
                    },
                    State {
                        name: "EXITED"
                        PropertyChanges {
                            target: mainRectangle
                            border.color: "lightblue"
                            opacity: 1.0
                        }
                    }
                ]

                transitions: [
                    Transition {
                        from: "EXITED"
                        to: "ENTERED"
                        ColorAnimation {
                            target: mainRectangle
                            duration: 600
                        }
                    },
                    Transition {
                        from: "ENTERED"
                        to: "EXITED"
                        ColorAnimation {
                            target: mainRectangle
                            duration: 600
                        }
                    }
                ]
             }
        }

    }


