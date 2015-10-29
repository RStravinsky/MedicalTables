import QtQuick 2.2
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import ItemsListComponent 1.0

ApplicationWindow {

    title: qsTr("NoxiMove Schedule")
    visibility: "Maximized"
    visible: true



    MainForm {

            id: mForm
            anchors.fill: parent

            ItemsList { id: optList }

            /* TOP FRAME */
            Rectangle
            {
                id: frame
                width: parent.width
                height: parent.height/5
                visible: true

                Row {
                    id: row
                    spacing: 10
                    width:  frame.width
                    height: frame.height
                    anchors.fill: frame
                    anchors.margins: 10

                    property real itemWidth : ((width + spacing) / 3) - spacing;

                    Tbutton {
                        bName: "T2";
                        bWidth: row.itemWidth;
                        bHeight: row.height;
                        titleImg: "/images/images/t2logo.png";
                        tableImg: "/images/images/t2izo.png";
                        onClicked: {
                            optList.setItemsList(bName)
                            mainImage.source = "/images/images/t2main.png";
                        }
                    }
                    Tbutton {
                        bName: "T3";
                        bWidth: row.itemWidth;
                        bHeight: row.height;
                        titleImg: "/images/images/t3logo.png";
                        tableImg: "/images/images/t3izo.png"
                        onClicked: {
                            optList.setItemsList(bName)
                            mainImage.source = "/images/images/t3main.png";
                        }
                    }
                    Tbutton {
                        bName: "T7";
                        bWidth: row.itemWidth;
                        bHeight: row.height;
                        titleImg: "/images/images/t7logo.png";
                        tableImg: "/images/images/t7izo.png"
                        onClicked: {
                            optList.setItemsList(bName)
                            mainImage.source = "/images/images/t7main.png";
                            yAnimation.start()
                            opacityAnimation.start()

                        }
                    }

                    visible: true
                }
            }
            /*************/


            PropertyAnimation {
                id: yAnimation
                target: mainImageRectangle
                properties: "y"
                to: grid.y
                duration: 200
                easing.type: Easing.OutBack
            }

            PropertyAnimation {
                id: opacityAnimation
                target: mainImageRectangle
                properties: "opacity"
                to: 1.0
                duration: 1000
            }



            Rectangle {
                id: mainImageRectangle
                //color: "lightblue"
                visible: true
                width: parent.width - grid.width - row.anchors.margins
                height: grid.height
                opacity: 0.0
                z: -1
                //anchors.top: frame.bottom
                anchors.left: parent.left
                anchors.right: grid.left
                anchors.rightMargin: 20
                y: mForm.y
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

                Image {
                    id: mainImage
                    anchors.fill: parent
                    opacity: 1.0
                    visible: true
                }


            }

            GridView {
                property bool cond:true;

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
                            duration: 150
                            easing.type: Easing.Linear
                        }

                        NumberAnimation {
                            id: exitingAnimation
                            target: itemImage
                            property: "scale"
                            from: 1.3
                            to: 1
                            duration: 150
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
