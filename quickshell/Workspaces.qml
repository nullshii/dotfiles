import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import "."

Rectangle {
    id: root

    implicitWidth: row.implicitWidth + 12
    implicitHeight: 36
    radius: 12
    color: Theme.surfaceVariant

    RowLayout {
        id: row
        anchors.centerIn: parent
        spacing: 4

        Repeater {
            model: 10

            delegate: Item {
                id: item
                property int wsId: index + 1

                // Find workspace object in Hyprland service state
                property var hyprWs: Hyprland.workspaces.values.find(w => w.id === wsId)
                
                // Check states
                property bool isActive: Hyprland.focusedWorkspace ? Hyprland.focusedWorkspace.id === wsId : false
                property bool hasWindows: hyprWs ? (hyprWs.toplevels.values ? hyprWs.toplevels.values.length > 0 : false) : false

                implicitWidth: isActive ? 32 : 24
                implicitHeight: 24

                // Smooth animation when active capsule expands
                Behavior on implicitWidth {
                    NumberAnimation { duration: 150 }
                }

                Rectangle {
                    anchors.fill: parent
                    radius: isActive ? 10 : 6

                    // Material You dynamic styling per state
                    color: {
                        if (isActive) return Theme.primary
                        if (hasWindows) return Theme.primaryContainer
                        return "transparent"
                    }

                    // Workspace indicator text / number
                    Text {
                        anchors.centerIn: parent
                        text: wsId
                        font.pixelSize: 12
                        font.bold: isActive || hasWindows
                        color: {
                            if (isActive) return Theme.primaryText
                            if (hasWindows) return Theme.primaryContainerText
                            return Theme.surfaceVariantText
                        }
                    }
                }

                // Click to activate workspace
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        Hyprland.dispatch("workspace " + wsId)
                    }
                }
            }
        }
    }
}
