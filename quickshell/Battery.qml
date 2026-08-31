import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.UPower
import "."

Rectangle {
    id: root

    // Access the primary display battery device via UPower
    property var device: UPower.displayDevice

    visible: device !== null && device.isPresent
    implicitWidth: layout.implicitWidth + 24
    implicitHeight: 36
    radius: 10
    color: Theme.primaryContainer

    RowLayout {
        id: layout
        anchors.centerIn: parent
        spacing: 8

        Text {
            // Set font family to any Nerd Font installed on your system
            font.family: "Nerd Font"
            font.pixelSize: 16
            color: (root.device && root.device.percentage <= 0.2 && root.device.state !== UPowerDeviceState.Charging) 
                   ? "#ff5555" 
                   : Theme.primaryContainerText

            text: {
                if (!root.device) return ""

                // Charging states
                if (root.device.state === UPowerDeviceState.Charging) return ""
                if (root.device.state === UPowerDeviceState.FullyCharged) return ""

                // Percentage level icons (Font Awesome battery icons)
                var pct = root.device.percentage * 100
                if (pct >= 90) return ""
                if (pct >= 70) return ""
                if (pct >= 40) return ""
                if (pct >= 15) return ""
                return ""
            }
        }

        // Percentage Text
        Text {
            text: root.device ? Math.round(root.device.percentage * 100) + "%" : "N/A"
            font.pixelSize: 13
            font.bold: true
            color: Theme.primaryContainerText
        }
    }
}
