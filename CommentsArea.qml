import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.3

Item {

    id: commentsArea

    Row {
        id: commentsRow
        width: commentsArea.width
        height: commentsArea.height
        spacing: 20

        Image {
            id: addImage
            source: "/images/images/notes.png"
            height: commentsRow.height
            width: height
        }

        Text {
            id: notesText
            text: "Uwagi:"
            height: commentsRow.height
            width: commentsRow.width - addImage.width - commentsRow.spacing
            color: "gray"
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font { family: "Arial"; pixelSize: settingsArea.width * 0.05  }
        }

    } // Row

} // Item

