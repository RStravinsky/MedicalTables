import QtQuick 2.2
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0

Item {
    id: container
    property string bName
    // property alias titleImg: title.source
    // property alias tableImg: table.source
    property alias bWidth: container.width
    property alias bHeight: container.height
    property string bText

    Rectangle {
                property bool pressed: mouseArea.pressed

                id: rectangle
                anchors.fill: parent
                border.width: 5
                border.color: "black"
                radius: 30
                color: "#69C0D9"

                gradient: Gradient {
                    GradientStop { position: 0;    color: "lightgray" }
                    GradientStop { position: .1;   color: "#838383" }
                    GradientStop { position: .5;   color: "#464646" }
                    GradientStop { position: 1.0; color: "#464646" }

                }


//                Rectangle {
//                    id: rectangle
//                    anchors.centerIn: mainRectangle
//                    width: mainRectangle.width - 10
//                    height: mainRectangle.height - 10
//                    radius: mainRectangle.radius - mainRectangle.border.width/2

//                    gradient: Gradient {
//                        GradientStop { position: 0;    color: "#88FFFFFF" }
//                        GradientStop { position: .1;   color: "#55FFFFFF" }
//                        GradientStop { position: .5;   color: "#33FFFFFF" }
//                        GradientStop { position: .501; color: "#11000000" }
//                        GradientStop { position: .8;   color: "#11FFFFFF" }
//                        GradientStop { position: 1;    color: "#55FFFFFF" }
//                    }

//                    Text {
//                        anchors.centerIn: parent
//                        text: bText
//                        font.family: "Arial Bold"
//                        font.pixelSize: rectangle.height/3
//                        color: "white"
//                    }

                    Text {
                        id: buttonText
                        text: bText
                        anchors.centerIn: parent
                        anchors.verticalCenterOffset: mouseArea.pressed ? -2 : -3
                        font.pixelSize: parent.height * .3
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
//                Row {
//                    spacing: 2
//                    anchors.fill: rectangle
//                    anchors.margins: 5

//                    Image {
//                        id: title;
//                        anchors.centerIn: parent
//                        width: (mainRectangle.width - 150);
//                        height: (mainRectangle.height - 20);
//                    }
//                    Image {
//                        id: table;
//                        width: (rectangle.width/2 - 10);
//                        height: (rectangle.height - 10);
//                        opacity: 1
//                        antialiasing: true
//                    }
//                }

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
//                        if ( bName == "T2")
//                        {
//                            imageT2.visible = true
//                            imageT3.visible = false
//                            imageT7.visible = false
//                       }

//                        if ( bName == "T3")
//                        {
//                            imageT2.visible = false
//                            imageT3.visible = true
//                            imageT7.visible = false
//                        }

//                        if ( bName == "T7")
//                        {
//                            imageT2.visible = false
//                            imageT3.visible = false
//                            imageT7.visible = true
//                        }
                        mainImageRectangle.visible = true
                        sampleListView.visible = true
                        grid.visible = true
                        initAnimation.visible = false
                        acceptButton.visible = true
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
                        duration: 300
                        easing.type: Easing.InCirc
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
             }
        }




