import QtQuick 2.2
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import ItemsListComponent 1.0

ApplicationWindow {

    id: applicationWindow
    title: qsTr("NoxiMove Schedule")
    visible: true
    visibility: "Maximized"
    color: "white"

    Image
    {
        anchors.fill: parent
        source: "/images/images/white-background1.jpg"
    }

    MainForm {
            id: mainform
            anchors.fill: parent
            visible: true

            Image {
                id: logoNoxi
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                source: "/images/images/logoNOXI.png"
                scale: 0
            }

            Glow {
                id: glowNoxi
                anchors.fill: logoNoxi
                radius: 0
                samples: 30
                color: "orange"
                source: logoNoxi
                fast: true
            }


            Image {
                id: logoMove
                anchors.top: logoNoxi.bottom
                anchors.right: logoNoxi.right
                source: "/images/images/logoMOVE.png"
                scale: 0

            }

            Glow {
                id: glowMove
                anchors.fill: logoMove
                radius: 10
                samples: 10
                color: "orange"
                source: logoMove
                fast: true
                visible: false

            }

            SequentialAnimation
            {
                running: true

                NumberAnimation {
                    id: logoAnimation
                    target: glowNoxi
                    property: "scale"
                    from: 0
                    to: 1
                    duration: 3000
                    easing.type: Easing.OutQuart
                }

                NumberAnimation {
                    target: glowNoxi
                    property: "radius"
                    from: 0
                    to: 50
                    duration: 500
                }

                ParallelAnimation
                {
                    NumberAnimation {
                        target: glowMove
                        property: "visible"
                        from: 0
                        to: 1
                        duration: 500
                    }
                    NumberAnimation {
                        target: glowMove
                        property: "scale"
                        from: 0
                        to: 1
                        duration: 1000
                    }
                }

                SequentialAnimation {
                    loops: Animation.Infinite

                    NumberAnimation {
                        target: glowNoxi
                        property: "spread"
                        from: 0
                        to: 0.55
                        duration: 2000
                    }
                    NumberAnimation {
                        target: glowNoxi
                        property: "spread"
                        from: 0.55
                        to: 0
                        duration: 2000
                    }
                }
            }

            ItemsList { id: optList }

            /* TOP FRAME */
            Rectangle
            {
                id: frame
                width: parent.width
                height: parent.height/5
                visible: true
                color: "transparent"

                Row {
                    id: row
                    spacing: 10
                    width:  frame.width
                    height: frame.height
                    anchors.fill: frame
                    anchors.margins: 10

                    property real itemWidth : ((width + spacing) / 3) - spacing;

                    Tbutton {
                        bName: "T2"
                        bWidth: row.itemWidth
                        bHeight: row.height
                        titleImg: "/images/images/t2logo.png"
                        tableImg: "/images/images/t2izo.png"
                    }
                    Tbutton {
                        bName: "T3"
                        bWidth: row.itemWidth
                        bHeight: row.height
                        titleImg: "/images/images/t3logo.png"
                        tableImg: "/images/images/t3izo.png"
                    }
                    Tbutton {
                        bName: "T7"
                        bWidth: row.itemWidth
                        bHeight: row.height
                        titleImg: "/images/images/t7logo.png"
                        tableImg: "/images/images/t7izo.png"
                    }
                    visible: true
                }
            }
            /*************/

            /* MAIN IMAGE */
            Rectangle {
                id: mainImageRectangle
                color: "transparent"
                visible: false
                width: parent.width - grid.width - row.anchors.margins
                height: grid.height
                anchors.top: frame.bottom
                anchors.left: parent.left
                anchors.right: grid.left
                anchors.rightMargin: 20

                Image {
                    id: imageT2
                    anchors.fill: parent

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
                    anchors.centerIn: parent
                    opacity: 1.0
                    visible: false
                    sourceSize.width: parent.width - 20
                    sourceSize.height: parent.height - 20
                    source: "/images/images/t3main.png"
                    smooth: true
                    asynchronous: true
                }

                Image {
                    id: imageT7
                    anchors.fill: parent
                    opacity: 1.0
                    visible: false
                    sourceSize.width: parent.width
                    sourceSize.height: parent.height
                    source: "/images/images/t7main.png"
                    smooth: true
                    asynchronous: true
                }
            }
            /*************/


            /*  OPTIONS LIST */
            GridView {
                id: grid
                height: parent.height - frame.height - 200
                width: parent.width/2.5
                anchors.top: frame.bottom
                anchors.right: parent.right
                anchors.margins: 20
                cellWidth: grid.width/4 - 5
                cellHeight: grid.height/3 - 5
                model: optList.itemsList
                delegate: optionsDelegate
                visible: true

            }


            Component {
                id: optionsDelegate

                Item {
                    id: wrapper
                    width: grid.cellWidth-10
                    height: grid.cellHeight-10

                    Image {
                        id: itemImage
                        source: imagePath
                        anchors.centerIn: wrapper
                        width: wrapper.width-10
                        height: wrapper.width-10
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
            /*************/

            StatusBar{
                    id: statBar
                    anchors.bottom: parent.bottom
                    Label { text: "Read Only" }
            }
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
