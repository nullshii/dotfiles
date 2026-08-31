pragma Singleton
import QtQuick

QtObject {
    // Material You dynamic palette mapped to QML colors
    property color primary: "{{colors.primary.default.hex}}"
    property color onPrimary: "{{colors.on_primary.default.hex}}"
    property color primaryContainer: "{{colors.primary_container.default.hex}}"
    property color onPrimaryContainer: "{{colors.on_primary_container.default.hex}}"
    
    property color surface: "{{colors.surface.default.hex}}"
    property color onSurface: "{{colors.on_surface.default.hex}}"
    property color surfaceVariant: "{{colors.surface_variant.default.hex}}"
    property color onSurfaceVariant: "{{colors.on_surface_variant.default.hex}}"
    
    property color background: "{{colors.background.default.hex}}"
    property color onBackground: "{{colors.on_background.default.hex}}"
    
    property color outline: "{{colors.outline.default.hex}}"
}
