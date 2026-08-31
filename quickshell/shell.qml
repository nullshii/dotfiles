import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.UPower 

ShellRoot {
    Variants {
        model: Quickshell.screens

        delegate: PanelWindow {
            id: topBar
            
            anchors.top: true
            anchors.left: true
            anchors.right: true
            
            margins.top: 5
            margins.left: 5
            margins.right: 5

            implicitHeight: 40
            color: "transparent"

	    RowLayout {
                anchors.fill: parent
                anchors.leftMargin: 16
                anchors.rightMargin: 16
		
		Item {
                    Layout.fillWidth: true
	        }

                Rectangle {
	    	    color: Theme.surfaceContainer
		    border.color: Theme.outline
		    border.width: 2
		    radius: Math.min(width, height) * 0.42
	    	    implicitWidth: batteryLayout.width + 20  
	    	    implicitHeight: batteryLayout.height + 10
	    	    
	    	    RowLayout {
                        id: batteryLayout
                        spacing: 4
	    	        anchors.centerIn : parent

                        property var bat: UPower.displayDevice

                        Text {
	                    text: Math.round(batteryLayout.bat.percentage * 100)
                            color: Theme.onSurface
	    	    	    font.pixelSize: 14
	    	    	    Layout.alignment: Qt.AlignCenter
	    	    	    // anchors.verticalCenter: parent.verticalCenter
	                }

	    	        Text {
	                    text: batteryLayout.bat.state === UPowerDeviceState.Charging ? "󰂄" : "󰁹"
                            color: Theme.onSurface
	    	            font.pixelSize: 18
	    	            Layout.alignment: Qt.AlignCenter
	    	            // anchors.verticalCenter: parent.verticalCenter
                        }
                    }
                }
            }
        }
    }
}

