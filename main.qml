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
