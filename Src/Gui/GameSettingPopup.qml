import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import Qt.labs.platform 1.1
import QtGraphicalEffects 1.0
import TelemetryDataCapture 1.0

Popup {
    id: popup
//    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
//                            contentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding)
    implicitWidth: 560
//    implicitHeight: 268
    parent: ApplicationWindow.window ? ApplicationWindow.window.contentItem : null
    x: parent ? Math.round((parent.width - width) / 2) : 0
    y: parent ? Math.round((parent.height - height) / 2) : 0
    visible: false
    modal: true
    clip: false
    closePolicy: Popup.NoAutoClose
    padding: 48

    property Game game
    property GameWithUdp udpGame: game && (game.captureMethod === Game.NetWorkUDP || game.captureMethod === Game.UDPAndSM) ?
                                      game : null

    contentItem: Item {
        ColumnLayout {
            width: parent.width
            spacing: 20
            Label {
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter
                horizontalAlignment: Text.AlignHCenter
                text: qsTranslate("", "%1设置").arg(game ? game.name : qsTranslate("", "游戏"))
            }
            RowLayout {
                Button {
                    Layout.preferredHeight: 44
                    //Layout.preferredWidth: cancelButtonWidth
                    Layout.alignment: Qt.AlignRight
                    text: qsTranslate("", "确定")
                    //onClicked: popup.close()
                }
                Item { Layout.fillWidth: true }
                Button {
                    Layout.preferredHeight: 44
                    //Layout.preferredWidth: cancelButtonWidth
                    Layout.alignment: Qt.AlignLeft
                    text: qsTranslate("","取消")
                    onClicked: popup.close()
                }
            }

        }
    }// contentItem

    background: Item {
        Rectangle {
            id: blank
            anchors.fill: parent
            color: "#FFFFFFFF"
            radius: 4
        }
        DropShadow {
            anchors.fill: parent
            source: blank
            verticalOffset: 8
            horizontalOffset: 8
            radius: 28
            samples: 20
            color: "#24565759"
        }
    }// background
}
