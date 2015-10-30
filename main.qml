import QtQuick 2.2
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.3
import QtGraphicalEffects 1.0
import ItemsListComponent 1.0

ApplicationWindow {

    id: applicationWindow
    title: qsTr("NoxiMove Schedule")
    visibility: "Maximized"
    visible: true

    MainForm {
        id: mainform
        anchors.fill: parent
        visible: true

        /* BACKGROUND */
        Image{ anchors.fill: parent; source: "/images/images/background1.jpg"}

        /* INIT ANIMATION */
        InitAnimation { id: initAnimation; anchors.fill: parent }

        /* OPTIONS LIST */
        ItemsList { id: optList }

        /* TOP FRAME */
        TopFrame { id: frame; width: parent.width; height: parent.height/5 }

        Rectangle
        {

            id: tableColorArea
            height: applicationWindow.height - mainImageRectangle.height - frame.height - 60
            width: mainImageRectangle
            anchors.top: mainImageRectangle.bottom
            anchors.left: parent.left
            anchors.right: gridRectangle.left
            anchors.leftMargin: 20
            anchors.rightMargin: 20
            anchors.topMargin: 10
            anchors.bottomMargin: 20
            color: "white"
            clip: true
            border.width: 4
            border.color: "lightgray"
            radius: 20

            Rectangle {
                id: tableColor
                height: tableColorArea.height - 30
                width: tableColorArea.width/9
                color: "red"
                border.width: 5
                border.color: "lightgray"
                anchors.left: parent.left
                anchors.leftMargin: 10
                anchors.topMargin: 30
                radius: 20
                visible: true
                gradient: Gradient {
                    GradientStop { position: 0;    color: "#88FFFFFF" }
                    GradientStop { position: .1;   color: "#55FFFFFF" }
                    GradientStop { position: .5;   color: "#33FFFFFF" }
                    GradientStop { position: .501; color: "#11000000" }
                    GradientStop { position: .8;   color: "#11FFFFFF" }
                    GradientStop { position: 1;    color: "#55FFFFFF" }
                }
            }

            Image {
                id: tableTop
                anchors.left: tableColor.right
                anchors.leftMargin: 20
                height: tableColorArea.height
                width: tableColorArea.width/3
                source: "/images/images/tableColor.png"
                visible: true
            }

            Rectangle {
                id: frameColor
                height: tableColorArea.height - 30
                width: tableColorArea.width/9
                color: "blue"
                border.width: 5
                border.color: "lightgray"
                anchors.left: tableTop.right
                anchors.leftMargin: 40
                anchors.topMargin: 30
                radius: 20
                visible: true
                gradient: Gradient {
                    GradientStop { position: 0;    color: "#88FFFFFF" }
                    GradientStop { position: .1;   color: "#55FFFFFF" }
                    GradientStop { position: .5;   color: "#33FFFFFF" }
                    GradientStop { position: .501; color: "#11000000" }
                    GradientStop { position: .8;   color: "#11FFFFFF" }
                    GradientStop { position: 1;    color: "#55FFFFFF" }
                }
            }

            Image {
                id: tableBottom
                anchors.left: frameColor.right
                anchors.leftMargin: 20
                height: tableColorArea.height
                width: tableColorArea.width/3
                source: "/images/images/frameColor.png"
                visible: true
            }


        }

        Rectangle {
                    id: acceptButton
                    width: gridRectangle.width - 10
                    height: applicationWindow.height - mainImageRectangle.height - frame.height - 60
                    anchors.top: gridRectangle.bottom
                    anchors.left: gridRectangle.left
                    anchors.topMargin: 10
                    anchors.bottomMargin: 20

                    color: "green"
                    radius: 30
                    border.width: 5
                    border.color: "green"

                    Rectangle {
                        id: acceptButton2
                        anchors.centerIn: acceptButton
                        color: "green"
                        width: acceptButton.width - 10
                        height: acceptButton.height - 10
                        radius: acceptButton.radius - acceptButton.border.width/2

                        gradient: Gradient {
                            GradientStop { position: 0;    color: "#88FFFFFF" }
                            GradientStop { position: .1;   color: "#55FFFFFF" }
                            GradientStop { position: .5;   color: "#33FFFFFF" }
                            GradientStop { position: .501; color: "#11000000" }
                            GradientStop { position: .8;   color: "#11FFFFFF" }
                            GradientStop { position: 1;    color: "#55FFFFFF" }
                        }

                        Text {
                            anchors.centerIn: parent
                            text: "GENERUJ"
                            font.family: "Arial Bold"
                            font.pointSize: 35
                            color: "white"
                        }
                    }
        }


        /* MAIN IMAGE */
        Rectangle {
            id: mainImageRectangle
            color: "white"
            visible: false
            width: parent.width - gridRectangle.width - 10
            height: grid.height
            anchors.top: frame.bottom
            anchors.left: parent.left
            anchors.right: gridRectangle.left
            anchors.rightMargin: 20
            anchors.topMargin: 20
            anchors.leftMargin: 20
            radius: 20
            clip: true
            border.width: 4
            border.color: "lightgray"

            Image {
                id: imageT2
                anchors.fill: mainImageRectangle
                opacity: 1.0
                visible: false
                sourceSize.width: parent.width
                sourceSize.height: parent.height
                source: "/images/images/t2main.png"
                smooth: true
                asynchronous: true
            }

            Image {
                id: imageT3
                anchors.fill: mainImageRectangle
                opacity: 1.0
                visible: false
                sourceSize.width: parent.width
                sourceSize.height: parent.height
                source: "/images/images/t3main.png"
                smooth: true
                asynchronous: true
            }

            Image {
                id: imageT7
                anchors.fill: mainImageRectangle
                opacity: 1.0
                visible: false
                sourceSize.width: parent.width
                sourceSize.height: parent.height
                source: "/images/images/t7main.png"
                smooth: true
                asynchronous: true
            }
        }

        /*  OPTIONS LIST VIEW */
        Rectangle
        {
            id: gridRectangle
            height: parent.height - frame.height - 200
            width: parent.width/2.5
            anchors.top: frame.bottom
            anchors.right: parent.right
            anchors.topMargin: 20
            color: "transparent"
            radius: 20

            GridView {

                property real itemWidth : ((width + anchors.margins) / 4) - anchors.margins;
                property real itemHeight : ((height + anchors.margins) / 3) - anchors.margins;

                id: grid
                anchors.fill: parent
                width: parent.width
                height: parent.height
                cellWidth: grid.width/4
                cellHeight: grid.height/3
                model: optList.itemsList
                anchors.margins: 10
                delegate: optionsDelegate
                visible: true
            }
        }

        /* OPTION LIST DELEGATE */
        Component {
            id: optionsDelegate

            Item {
                id: wrapper
                width: grid.cellWidth
                height: grid.cellHeight

                Image {
                    id: itemImage
                    source: imagePath
                    anchors.centerIn: wrapper
                    width: wrapper.width - 10
                    height: wrapper.width - 10
                    smooth: true
                    opacity: 0.4
                    state: imageState

                    MouseArea {
                        id: mouseArea;
                        anchors.fill: itemImage
                        hoverEnabled: true
                        onClicked: {
                            if(animationActive == true) {
                                checkedAnimation.start()
                                itemImage.state == "CHECKED" ? itemImage.state = "UNCHECKED" : itemImage.state = "CHECKED"
                                grid.currentIndex = index
                                optList.itemClicked(grid.currentIndex)
                            }
                        }

                        onEntered: if(animationActive == true) enteringAnimation.start()
                        onExited:  if(animationActive == true) exitingAnimation.start()
                    }

                    NumberAnimation {
                        id: checkedAnimation
                        target: itemImage
                        property: "scale"
                        from: 0.4
                        to: 1.3
                        duration: 150
                        easing.type: Easing.OutSine
                    }

                    NumberAnimation {
                        id: enteringAnimation
                        target: itemImage
                        property: "scale"
                        from: 1
                        to: 1.3
                        duration: 100
                        easing.type: Easing.Linear
                    }

                    NumberAnimation {
                        id: exitingAnimation
                        target: itemImage
                        property: "scale"
                        from: 1.3
                        to: 1
                        duration: 100
                        easing.type: Easing.Linear
                    }

                    states: [
                        State {
                            name: "CHECKED"
                            PropertyChanges {
                                target: itemImage
                                opacity: 1.0
                            }
                        },
                        State {
                            name: "UNCHECKED"
                            PropertyChanges {
                                target: itemImage
                                opacity: 0.4
                            }
                        }
                    ]

                } // image

            } // item

        } // component

//        StatusBar{
//                id: statBar
//                anchors.bottom: parent.bottom
//                Label { text: "Read Only" }
//        }
    }

    MessageDialog {
        id: messageDialog
        title: qsTr("May I have your attention, please?")

        function show(caption) {
            messageDialog.text = caption;
            messageDialog.open();
        }

    }
}
