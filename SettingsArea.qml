import QtQuick 2.2
import QtQuick.Controls 1.3
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.3

Window {
    id: settingDialog
    onClosing: {
        //gridColor.positionViewAtBeginning()
        //lineEdit.clearTextField()
    }
    title: qsTr("Ustawienia dodatkowe")
    minimumHeight: height
    maximumHeight: height
    minimumWidth: width
    maximumWidth: width

    Rectangle {
        id: rectangle
        width: settingDialog.width
        height: settingDialog.height

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

            Text {
                id: notesText
                text: "Uwagi:"
                width: column.width
                height: column.height * .2
                color: "gray"
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                font { family: "Arial"; pointSize: 17 }
            }

            NotesArea {
                id: notesArea
                width: column.width
                height: column.height * .6 - column.spacing
            }

        } // Columns

    } // Rectangle

} // Window
