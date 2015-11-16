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
    visible: true
    visibility: "Maximized"
    minimumHeight: 600
    minimumWidth: 800

    MainForm {
        id: mainForm
        anchors.fill: parent

        /* Background image */
        Image{
            anchors.fill: parent;
            source: "/images/images/background.jpg"
        }

        /* Top frame of application */
        TopFrame {
            id: topFrame;
            width: parent.width;
            height: parent.height/5;
            anchors.top: parent.top
            visible: false
        }  

        ColorArea { id: colorArea; width: mainForm.width/4; height: width; visible: false;}

        /* Animation at start of application */
        Rectangle {
            id: initRectangle
            width: parent.width
            height: parent.height - topFrame.height
            anchors.top: topFrame.bottom
            color: "transparent"

            Rectangle {
                id: rect
                width: initRectangle.width/2
                height: initRectangle.height/2
                anchors.horizontalCenter: initRectangle.horizontalCenter
                color: "lightgray"
                border.width: 5
                border.color: "gray"
                radius: 20
                opacity: 0.8
                z: 100

                Button
                {
                    width: height * 2
                    height: parent.height/8
                    anchors.bottom: parent.bottom
                    anchors.right: parent.right
                    anchors.margins: 20
                    onClicked: {
                        topFrame.visible = true
                        rect.visible = false
                    }
                }
            }

            Image {
               id: logoTable
               width: (4*initRectangle.width)/3
               height: initRectangle.height/2
               anchors.horizontalCenter: initRectangle.horizontalCenter
               anchors.bottom: initRectangle.bottom
               source: "/images/images/back.png"
               opacity: 0.6
            }

            InitAnimation {
                id: initAnimation
                width: initRectangle.width/2
                height: initRectangle.height/2
                anchors.horizontalCenter: initRectangle.horizontalCenter
            }


        }

        /* Table options list */
        Rectangle
        {
            id: gridRectangle
            height: parent.height - topFrame.height
            width: parent.width/2.5
            anchors {
                top: topFrame.bottom
                left: parent.left
                bottom: parent.bottom
                leftMargin: 20
                topMargin: 10
                bottomMargin: 10
            }
            color: "transparent"
            radius: 10

            ItemsList { id: optList }
            GridView {
                id: gridView
                anchors.fill: gridRectangle
                cellWidth: gridView.width/4
                cellHeight: gridView.height/4
                model: optList.itemsList
                anchors.margins: 10
                delegate: GridDelegate { }
                interactive: false
            }
        }

        /* Images list */
        Rectangle {
            id: mainImageRectangle
            width: parent.width - gridRectangle.width - 10
            height: gridView.height// * .7
            anchors {
                top: topFrame.bottom
                right: parent.right
                left: gridRectangle.right
                rightMargin: 30
                topMargin: 25
                leftMargin: 20

            }
            border.width: 10
            border.color: "gray"
            color: "white"
            radius: 15
            visible: false

            /* Image state */
            ImageState {
                id: imageState
                width: mainImageRectangle.width/5
                height: mainImageRectangle.height/10
                anchors.horizontalCenter: mainImageRectangle.horizontalCenter
                anchors.bottom: mainImageRectangle.bottom
            }

            /* Image list */
            Rectangle {
                id: insideRectangle
                color: "transparent"
                radius: 5
                anchors {
                    fill: parent
                    margins: mainImageRectangle.border.width
                }

                ImageArrow {
                    anchors.verticalCenter: insideRectangle.verticalCenter
                    anchors.right: insideRectangle.right
                    anchors.rightMargin: 20
                    imagePath: "/images/images/right_arrow.png"
                    arrowDirection: "right"
                }
                ImageArrow {
                    anchors.verticalCenter: insideRectangle.verticalCenter
                    anchors.left: insideRectangle.left
                    anchors.leftMargin: 20
                    imagePath: "/images/images/arrow_left.png"
                    arrowDirection: "left"
                }

                // The view:
                ListView {
                    id: listView
                    anchors.fill: insideRectangle
                    orientation: ListView.Horizontal
                    snapMode: ListView.SnapOneItem
                    highlightRangeMode: ListView.StrictlyEnforceRange
                    boundsBehavior: Flickable.StopAtBounds
                    clip: true
                    highlightMoveVelocity: 2000
                    interactive: false
                    model: optList.imagesList
                    delegate: Component {
                        Item {
                            id: delegateItem
                            width: listView.width
                            height: listView.height
                            Image {
                                id: imageItem
                                anchors.fill: delegateItem
                                source: imageSource
                              }
                        }
                    }
                    Component.onCompleted: positionViewAtBeginning()
                  }

        } // insideRectangle

      } // mainImageRectangle

//        Settings {
//            id: numberOfTables
//            height: imageState.height * 2
//            width: height
//            anchors.margins: 20
//            z: 100
//            anchors.bottom: mainImageRectangle.bottom
//            anchors.left: mainImageRectangle.left
//            visible: false
//        }

        /* ACCEPT BUTTON */
        AcceptButton {
            id: acceptButton
            width: height
            anchors.margins: 20
            z: 100
            height: imageState.height * 2
            anchors.bottom: mainImageRectangle.bottom
            anchors.right: mainImageRectangle.right
            visible: false
        }

    } // MainForm

} // ApplicationWindow
