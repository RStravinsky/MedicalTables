import QtQuick 2.2
import QtQuick.Controls 1.3
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.3

Window {
    id: settingDialog
    title: qsTr("Ustawienia")
    minimumHeight: height
    maximumHeight: height
    minimumWidth: width
    maximumWidth: width
    modality: Qt.ApplicationModal

    function clear() {
        quantityArea.clearQuantity()
        notesArea.clearNotes()
    }
    property bool acceptDone: false

    onClosing: { if(!settingDialog.acceptDone) clear() }

    Image{
        anchors.fill: parent;
        source: "/images/images/background.jpg"
    }

    Rectangle {
        id: rectangle
        width: settingDialog.width
        height: settingDialog.height
        color: "transparent"

        Column {
            id: column
            spacing: 5
            anchors.fill: rectangle
            width: rectangle.width
            height: rectangle.height
            anchors.margins: 10

            QuantityArea {
                id: quantityArea
                width: column.width
                height: column.height * .2
            }


            NotesArea {
                id: notesArea
                width: column.width
                height: column.height * .6 - column.spacing
            }

            Rectangle {
                id: acceptButton
                height:  column.height * .2
                width: column.width
                radius: 20
                color: "#67C100"
                scale: mouseArea.pressed ? 0.8 : 1

                Text {
                    text: "ZATWIERDŹ"
                    color: "white"
                    anchors.centerIn: acceptButton
                    font { family: "Arial"; pixelSize: settingsArea.width * 0.1 }
                }


                MouseArea {
                    id: mouseArea
                    hoverEnabled: true
                    anchors.fill: acceptButton
                    onClicked: {
                        //if( quantityArea.text == "" ) quantityArea.text = "1"
                        optList.setAdditionalSettings( quantityArea.text, notesArea.text )
                        settingDialog.acceptDone  = true
                        settingDialog.close()
                    }
                }
            }

        } // Columns

    } // Rectangle

} // Window
