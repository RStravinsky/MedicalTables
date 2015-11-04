import QtQuick 2.2
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.3
import QtGraphicalEffects 1.0
import ItemsListComponent 1.0
import "ImageLoader.js" as ImageLoader

ApplicationWindow {

    id: applicationWindow
    title: qsTr("NoxiMove Schedule")
    visibility: "Maximized"
    visible: true
    minimumHeight: 600
    minimumWidth: 800

    MainForm {
        id: mainform
        anchors.fill: parent
        visible: true

        /* BACKGROUND */
        Image{ anchors.fill: parent; source: "/images/images/background.jpg"}

        /* INIT ANIMATION */
        Rectangle
        {
            id: initAnimation
            width: parent.width
            height: parent.height - topFrame.height
            anchors.top: topFrame.bottom
            color: "transparent"
            Image {
               id: logoTable
               width: (4*parent.width)/3
               height: parent.height/2
               anchors.horizontalCenter: parent.horizontalCenter
               anchors.bottom: parent.bottom
               source: "/images/images/back.png"
               opacity: 0.6
            }

            InitAnimation {
                width: parent.width/2
                height: parent.height/2
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        /* TOP FRAME */
        TopFrame { id: topFrame; width: parent.width; height: parent.height/5 }

        /* OPTIONS LIST */
        ItemsList { id: optList }

        /* OPTIONS LIST DELEGATE */
        Delegate { id: optionsDelegate }

        /* OPTIONS LIST GRID VIEW */
        Rectangle
        {
            id: gridRectangle
            height: parent.height - topFrame.height
            width: parent.width/2.5
            anchors.top: topFrame.bottom
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.leftMargin: 20
            anchors.topMargin: 10
            anchors.bottomMargin: 10
            color: "transparent"
            radius: 10

            GridView {
                id: grid
                anchors.fill: parent
                width: parent.width
                height: parent.height
                cellWidth: grid.width/4
                cellHeight: grid.height/4
                model: optList.itemsList
                anchors.margins: 10
                delegate: optionsDelegate
                visible: true
                interactive: false
            }
        }

        /* ACCEPT BUTTON */
        AcceptButton {
            id: acceptButton
            width: mainImageRectangle.width/4
            height: mainform.height - mainImageRectangle.height - topFrame.height - 4*anchors.margins
            anchors.top: mainImageRectangle.bottom
            anchors.right: parent.right
            anchors.margins: 20
            visible: false
        }

        ListModel {
          id: sampleModel
          ListElement {
              imagePath: "/images/images/t2.png";
          }
          ListElement {
              imagePath: "/images/images/t3.png";
          }
          ListElement {
              imagePath: "/images/images/t7.png";
          }
          ListElement {
              imagePath: "/images/images/t2.png";
          }
          ListElement {
              imagePath: "/images/images/t3.png";
          }
          ListElement {
              imagePath: "/images/images/t7.png";
          }
        }

        /* MAIN IMAGE */
        Rectangle {
            id: mainImageRectangle
            color: "lightgray"
            radius: 15
            visible: false
            width: parent.width - gridRectangle.width - 10
            height: grid.height * 0.7
            anchors.top: topFrame.bottom
            anchors.right: parent.right
            anchors.left: gridRectangle.right
            anchors.rightMargin: 30
            anchors.topMargin: 25
            anchors.leftMargin: 20


            ListView {
                id: sampleListView
                anchors.fill: parent
                orientation: ListView.Horizontal
                snapMode: ListView.SnapOneItem
                highlightRangeMode: ListView.StrictlyEnforceRange
                boundsBehavior: Flickable.StopAtBounds
                //currentIndex: -3
                clip: true
                flickDeceleration: 100
                visible: false
                cacheBuffer: 700
                preferredHighlightBegin: 0; preferredHighlightEnd: 0  //this line means that the currently highlighted item will be central in the view
                interactive: false
                model: sampleModel
                delegate:Rectangle {
                    id: delegateItem
                    width: mainImageRectangle.width ; height: mainImageRectangle.height
                    radius: 10
                    color: "white"
                    Image {
                      id: imageItem
                      height: parent.height-10; width: parent.width-10
                      anchors.left: parent.left
                      // delegate can directly use ListElement role name
                      source: imagePath
                    }
                  }
                spacing: 4
                Component.onCompleted: positionViewAtIndex(count - 1, ListView.Beginning)

                Rectangle {
                    width: 50
                    height: 50
                    color: "transparent"
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.rightMargin: 20
                    Image {
                        anchors.fill: parent
                        opacity: areaRight.pressed  ? 0.2 : 1
                        source: "/images/images/right_arrow.png"

                        MouseArea {
                            id: areaRight
                            anchors.fill:parent
                            onClicked: {
                                console.log("index = ", sampleListView.currentIndex);
                                sampleListView.incrementCurrentIndex()
                                //if (sampleListView.currentIndex < sampleListView.count) sampleListView.currentIndex = sampleListView.currentIndex+1;

                            }
                        }
                    }
                }

                Rectangle {
                    width: 50
                    height: 50
                    color: "transparent"
                    opacity: areaLeft.pressed  ? 0.2 : 1
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 20

                    Image {
                        anchors.fill: parent
                        source: "/images/images/arrow_left.png"
                        MouseArea {
                            id: areaLeft
                            anchors.fill:parent
                            onClicked: {
                                console.log("index = ", sampleListView.currentIndex);
                                sampleListView.decrementCurrentIndex()
                                //if (sampleListView.currentIndex > 0 ) sampleListView.currentIndex = sampleListView.currentIndex-1;

                            }
                        }
                    }
                }

              }

        }
    }

            //Component.onCompleted: ImageLoader.createImages()

//            ListView {
//             id: view
//             anchors.fill: parent;
//             model: dataModel
//             delegate: contactDelegate
//             currentIndex: -1
//             orientation: ListView.Horizontal
//             snapMode: ListView.NoSnap ;
//             flickDeceleration: 500
//             visible: true
//             cacheBuffer: 100
//             preferredHighlightBegin: 0; preferredHighlightEnd: 0  //this line means that the currently highlighted item will be central in the view
//             highlightRangeMode: ListView.StrictlyEnforceRange  //this means that the currentlyHighlightedItem will not be allowed to leave the view
//             highlightFollowsCurrentItem: true  //updates the current index property to match the currently highlighted item
//             focus: true
//              Keys.onLeftPressed: {
//              if (currentIndex > 0 )
//              currentIndex = currentIndex-1;
//              }
//              Keys.onRightPressed: {
//              if (currentIndex < count)
//              currentIndex = currentIndex+1;
//              }

//            Image {
//                id: imageT2
//                anchors.fill: mainImageRectangle
//                opacity: 1.0
//                visible: false
//                sourceSize.width: parent.width
//                sourceSize.height: parent.height
//                source: "/images/images/t2.png"
//                smooth: true
//                asynchronous: true
//           }

//            Image {
//                id: imageT3
//                anchors.fill: mainImageRectangle
//                opacity: 1.0
//                visible: false
//                sourceSize.width: parent.width
//                sourceSize.height: parent.height
//                source: "/images/images/t3.png"
//                smooth: true
//                asynchronous: true
//            }

//            Image {
//                id: imageT7
//                anchors.fill: mainImageRectangle
//                opacity: 1.0
//                visible: false
//                sourceSize.width: parent.width
//                sourceSize.height: parent.height
//                source: "/images/images/t7.png"
//                smooth: true
//                asynchronous: true
//            }

//                    VisualDataModel {
//                     id: dataModel

//                     model: ListModel{
//                       id:innerModel
//                     }

//                     delegate: Image {
//                       width: parent.width;
//                       height: parent.height;
//                       fillMode: Image.PreserveAspectFit
//                       }
                    // }

//        Component {
//              id: contactDelegate
//              Item {
//                  width: 180; height: 40
//                  Column {
//                      Text { text: '<b>Name:</b> ' + name }
//                  }
//              }
//          }


//        ListModel
//        {
//            id: dataModel
//            ListElement
//            {
//                name: "ONE"
//            }
//            ListElement
//            {
//                name: "TWO"
//            }
//            ListElement
//            {
//                name: "THREE"
//            }
//            ListElement
//            {
//                name: "Four"
//            }
//            ListElement
//            {
//                name: "Five"
//            }
//            ListElement
//            {
//                name: "Six"
//            }

//        }

    MessageDialog {
        id: messageDialog
        title: qsTr("May I have your attention, please?")

        function show(caption) {
            messageDialog.text = caption;
            messageDialog.open();
        }

    }
}
