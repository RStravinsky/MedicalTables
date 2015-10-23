import QtQuick 2.0
import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1


Item {
    id: container
    property alias titleImg: title.source
    property alias tableImg: table.source
    property alias bWidth: rectangle.width
    property alias bHeight: rectangle.height

    Rectangle {
                id: rectangle
                border.color: "orange"
                border.width: 4
                radius: 8
                anchors.fill: parent

                Row {
                    spacing: 2
                    anchors.fill: rectangle
                    //anchors.margins: 10

                    Image { id: title; width: rectangle.width/2; height: rectangle.height; anchors.fill: parent }
                    Image { id: table; width: rectangle.width/2; height: rectangle.height; anchors.fill: parent }
                }
    }

}
