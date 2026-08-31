import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland

ShellRoot {
    id: root

    PanelWindow {
        id: bar

        anchors {
            top: true
            left: true
            right: true
        }

        implicitHeight: 46
        color: "transparent"

        exclusionMode: ExclusionMode.Auto

        RowLayout {
            anchors.fill: parent
            anchors.leftMargin: 10
	    anchors.rightMargin: 10

	    Item {
		implicitWidth: batteryWidget.width
	    }

	    Item {
		Layout.fillWidth: true
	    }

	    Workspaces {}

            Item {
                Layout.fillWidth: true
            }

	    Battery {
		id: batteryWidget
	    }
        }
    }
}
