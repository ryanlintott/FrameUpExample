//
//  WidgetFrameWidget.swift
//  WidgetFrameWidget
//
//  Created by Ryan Lintott on 2021-11-23.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct WidgetFrameWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        WidgetRelativeShapeExample()
    }
}

@main
struct WidgetFrameWidget: Widget {
    let kind: String = "WidgetFrameWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            WidgetFrameWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("WidgetFrame Example")
        .description("Example of WidgetFrame.")
    }
}

struct WidgetFrameWidget_Previews: PreviewProvider {
    static var previews: some View {
        WidgetFrameWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
