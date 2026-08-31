pragma Singleton
import QtQuick

QtObject {
    // Primary Colors
    readonly property color primary: "{{colors.primary.default.hex}}"
    readonly property color primaryText: "{{colors.on_primary.default.hex}}"
    readonly property color primaryContainer: "{{colors.primary_container.default.hex}}"
    readonly property color primaryContainerText: "{{colors.on_primary_container.default.hex}}"

    // Surface & Background
    readonly property color surface: "{{colors.surface.default.hex}}"
    readonly property color surfaceText: "{{colors.on_surface.default.hex}}"
    readonly property color surfaceVariant: "{{colors.surface_variant.default.hex}}"
    readonly property color surfaceVariantText: "{{colors.on_surface_variant.default.hex}}"
    
    readonly property color background: "{{colors.background.default.hex}}"
    readonly property color backgroundText: "{{colors.on_background.default.hex}}"

    // Accents & Outlines
    readonly property color outline: "{{colors.outline.default.hex}}"
}
