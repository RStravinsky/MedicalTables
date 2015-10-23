import QtQuick 2.0

Item {
    id: container
    property alias titleImg: title.source
    property alias tableImg: table.source
    property alias bWidth: container.width
    property alias bHeight: container.height


    Rectangle {
                id: rectangle
                border.color: "orange"
                border.width: 4
                radius: 8
                anchors.fill: parent

                Row {
                    spacing: 2
                    anchors.margins: 10
                    anchors.fill: rectangle

                    Image { id: title; width: parent.width/2; height: parent.height }
                    Image { id: table; width: parent.width/2; height: parent.height }

                }
    }

}
