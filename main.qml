import QtQuick 2.2
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import MedicalTableComponent 1.0

ApplicationWindow {

    title: qsTr("NoxiMove Schedule")
    visibility: "Maximized"
    visible: true



    MainForm {

            anchors.fill: parent

            MedicalTable { id: optList }

            /* TOP FRAME */
            Rectangle
            {
                id: frame
                width: parent.width
                height: parent.height/5
                visible: true

//                Behavior on scale {
//                    NumberAnimation {
//                        duration: 2000
//                        easing.type: Easing.OutBack
//                    }
//                }

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
                        onClicked: optList.setDataList(bName)
                    }
                    Tbutton {
                        bName: "T3";
                        bWidth: row.itemWidth;
                        bHeight: row.height;
                        titleImg: "/images/images/t3logo.png";
                        tableImg: "/images/images/t3izo.png"
                        onClicked: optList.setDataList(bName)
                    }
                    Tbutton {
                        bName: "T7";
                        bWidth: row.itemWidth;
                        bHeight: row.height;
                        titleImg: "/images/images/t7logo.png";
                        tableImg: "/images/images/t7izo.png"
                        onClicked: optList.setDataList(bName)

                    }

                    visible: true
                }
            }
            /*************/

            GridView {
                property bool cond:true;

                id: grid
                height: parent.height - frame.height - 150
                width: parent.width/3
                anchors.top: frame.bottom
                anchors.right: parent.right
                anchors.margins: 20
                cellWidth: grid.width/4
                cellHeight: grid.height/4
                model: optList.dataList
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
                                optList.buttonClicked(grid.currentIndex)
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
