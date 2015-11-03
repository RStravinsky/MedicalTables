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
            height: 3*(parent.height - topFrame.height)/4
            width: parent.width/2.5
            anchors.top: topFrame.bottom
            anchors.left: parent.left
            anchors.topMargin: 20
            color: "transparent"
            radius: 20

            GridView {
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
                interactive: false
            }
        }

//        Rectangle{
//            height: grid.cellHeight
//            width: gridRectangle.width
//            anchors.left: gridRectangle.left
//            anchors.top: gridRectangle.bottom
//            visible: true
//            color: "white"
//        Row {
//            id: row
//            anchors.fill: parent
//            anchors.leftMargin: 15
//            spacing: 10
//            Rectangle { color: "red"; width: grid.cellWidth-10; height: optionsDelegate.height;}
//            Rectangle { color: "green"; width: grid.cellWidth-10; height:  optionsDelegate.height;}
//            Rectangle { color: "blue"; width: grid.cellWidth-10; height:  optionsDelegate.height;}
//            Rectangle { color: "gray"; width: grid.cellWidth-10; height:  optionsDelegate.height;}
//        }
//        }



//        /* TABLE COLOR */
//        ColorArea {
//            id: colorArea
//            width: gridRectangle.width
//            height:  mainform.height - mainImageRectangle.height - topFrame.height - 3*anchors.margins
//            anchors {
//                top: gridRectangle.bottom
//                left: parent.left
//                right: mainImageRectangle.left
//                margins: 20
//            }
//            visible: false
//        }

        /* ACCEPT BUTTON */
        AcceptButton {
            id: acceptButton
            width: mainImageRectangle.width/2
            height: mainform.height - mainImageRectangle.height - topFrame.height - 4*anchors.margins
            anchors.top: mainImageRectangle.bottom
            anchors.horizontalCenter:  mainImageRectangle.horizontalCenter
            anchors.margins: 20
            bText: "Harmonogram"
            visible: false
        }

        /* MAIN IMAGE */
        Rectangle {
            id: mainImageRectangle
            color: "lightgray"
            visible: false
            width: parent.width - gridRectangle.width - 10
            height: grid.height
            anchors.top: topFrame.bottom
            anchors.right: parent.right
            anchors.left: gridRectangle.right
            anchors.bottom: gridRectangle.bottom
            anchors.rightMargin: 20
            anchors.topMargin: 40
            anchors.leftMargin: 20
            anchors.bottomMargin: 15

            Image {
                id: imageT2
                anchors.fill: mainImageRectangle
                opacity: 1.0
                visible: false
                sourceSize.width: parent.width
                sourceSize.height: parent.height
                source: "/images/images/t2.png"
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
                source: "/images/images/t3.png"
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
                source: "/images/images/t7.png"
                smooth: true
                asynchronous: true
            }
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
