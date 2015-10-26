import QtQuick 2.2
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1

ApplicationWindow {

    title: qsTr("NoxiMove Schedule")
    visibility: "Maximized"
    visible: true


    MainForm {

            anchors.fill: parent

            /* TOP FRAME */
            Rectangle
            {
                id: frame
                width: parent.width
                height: parent.height/5
                visible: true

                Behavior on scale {
                    NumberAnimation {
                        duration: 2000
                        easing.type: Easing.OutBack
                    }
                }


                Row {
                    id: row
                    spacing: 10
                    width:  frame.width
                    height: frame.height
                    anchors.fill: frame
                    anchors.margins: 10


                    property real itemWidth : ((width + spacing) / 3) - spacing;

                    Tbutton { bWidth: parent.itemWidth; bHeight: parent.height; titleImg: "/images/images/t2logo.png"; tableImg: "/images/images/t2izo.png" }
                    Tbutton { bWidth: parent.itemWidth; bHeight: parent.height; titleImg: "/images/images/t3logo.png"; tableImg: "/images/images/t3izo.png" }
                    Tbutton { bWidth: parent.itemWidth; bHeight: parent.height; titleImg: "/images/images/t7logo.png"; tableImg: "/images/images/t7izo.png" }

                    visible: true
                }
            }
            /*************/

            GridView {
                id: dndGrid
                height: parent.height - frame.height - 150
                width: parent.width/3
                anchors.top: frame.bottom
                anchors.right: parent.right
                anchors.margins: 20
                cellWidth: dndGrid.width/4
                cellHeight: dndGrid.height/4
                model: dndModel
                delegate: dndDelegate
            }

            Component {

                id: dndDelegate

                Item {
                    id: wrapper
                    width: dndGrid.cellWidth-10
                    height: dndGrid.cellHeight-10


                    Image {

                        property bool active: false
                        id: itemImage
                        source: imagePath
                        anchors.centerIn: parent
                        width: parent.width-10
                        height: parent.width-10
                        smooth: true
                        opacity: 0.4
                        state: "UNCHECKED"

                        MouseArea {
                            id: mouseArea;
                            anchors.fill: parent
                            hoverEnabled: true
                            onClicked: {
                                checkedAnimation.start()
                                parent.state == "CHECKED" ? parent.state = "UNCHECKED" : parent.state = "CHECKED"
                            }
                            onEntered: enteringAnimation.start()
                            onExited:  exitingAnimation.start()

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

            ListModel {
                id: dndModel
                ListElement { imagePath: "/images/images/zaglowek.png" }
                ListElement { imagePath: "/images/images/pilot.png" }
                ListElement { imagePath: "/images/images/uklad_jezdny.png" }
                ListElement { imagePath: "/images/images/nozne_sterowanie.png" }
                ListElement { imagePath: "/images/images/zaglowek.png" }
                ListElement { imagePath: "/images/images/pilot.png" }
                ListElement { imagePath: "/images/images/uklad_jezdny.png" }
                ListElement { imagePath: "/images/images/nozne_sterowanie.png" }
                ListElement { imagePath: "/images/images/zaglowek.png" }
                ListElement { imagePath: "/images/images/pilot.png" }
                ListElement { imagePath: "/images/images/uklad_jezdny.png" }
                ListElement { imagePath: "/images/images/nozne_sterowanie.png" }
                ListElement { imagePath: "/images/images/zaglowek.png" }
                ListElement { imagePath: "/images/images/pilot.png" }
                ListElement { imagePath: "/images/images/uklad_jezdny.png" }
                ListElement { imagePath: "/images/images/nozne_sterowanie.png" }
            }




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
