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
        Image{ anchors.fill: parent; source: "/images/images/background1.jpg"}

        /* INIT ANIMATION */
        Rectangle
        {
            id: initAnimation
            width: parent.width
            height: parent.height - topFrame.height
            anchors.top: topFrame.bottom
            Image {
               id: logoTable
               width: (4*parent.width)/3
               height: parent.height/2
               anchors.horizontalCenter: parent.horizontalCenter
               anchors.bottom: parent.bottom
               source: "/images/images/back.png"
               opacity: 0.3
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
            height: parent.height - topFrame.height - 200
            width: parent.width/2.5
            anchors.top: topFrame.bottom
            anchors.right: parent.right
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
            }
        }

        /* TABLE COLOR */
        ColorArea {
            id: colorArea
            width: mainImageRectangle.width
            height:  mainform.height - mainImageRectangle.height - topFrame.height - 3*anchors.margins
            anchors {
                top: mainImageRectangle.bottom
                left: parent.left
                right: gridRectangle.left
                margins: 20
            }
            visible: false
        }

        /* ACCEPT BUTTON */
        AcceptButton {
            id: acceptButton
            width: gridRectangle.width - 2*anchors.margins
            height: mainform.height - mainImageRectangle.height - topFrame.height - 4*anchors.margins
            anchors.top: gridRectangle.bottom
            anchors.left: gridRectangle.left
            anchors.margins: 20
            bColor: "green"
            bText: "GENERUJ"
            visible: false
        }

        /* MAIN IMAGE */
        Rectangle {
            id: mainImageRectangle
            color: "white"
            visible: false
            width: parent.width - gridRectangle.width - 10
            height: grid.height
            anchors.top: topFrame.bottom
            anchors.left: parent.left
            anchors.right: gridRectangle.left
            anchors.rightMargin: 20
            anchors.topMargin: 20
            anchors.leftMargin: 20

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
