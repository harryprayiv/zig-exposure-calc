const std = @import("std");
const math = std.math;
const print = std.debug.print;

// Calculate EV from F-stop, ISO, and shutter speed
fn ev(n: f64, i: f64, s: f64) f64 {
    return math.log2(100.0 * ((n * n) / (i * s)));
}

// Calculate F-stop from EV, ISO, and shutter speed
fn stop(e: f64, i: f64, s: f64) f64 {
    return math.sqrt((math.pow(f64, 2.0, e) * (i * s)) / 100.0);
}

// Calculate ISO from EV, F-stop, and shutter speed
fn iso(n: f64, e: f64, s: f64) f64 {
    return 100.0 * (n * n) / (math.pow(f64, 2.0, e)) / s;
}

// Calculate shutter speed from EV, F-stop, and ISO
fn shutter(n: f64, i: f64, e: f64) f64 {
    return (100.0 * (n * n)) / (math.pow(f64, 2.0, e)) / i;
}

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();

    const fstop_val = 6.531972647421807;
    const iso_val = 100.0;
    const shutter_val = 1.0 / 48.0;
    const ev_val = 11.0;

    // Calculate and print EV
    const ev_result = ev(fstop_val, iso_val, shutter_val);
    try stdout.print("EV: {d:.6}\n", .{ev_result});

    // Calculate and print F-stop
    const stop_result = stop(ev_val, iso_val, shutter_val);
    try stdout.print("F-stop: {d:.6}\n", .{stop_result});

    // Calculate and print ISO
    const iso_result = iso(fstop_val, ev_val, shutter_val);
    try stdout.print("ISO: {d:.6}\n", .{iso_result});

    // Calculate and print shutter speed
    const shutter_result = shutter(fstop_val, iso_val, ev_val);
    try stdout.print("Shutter speed: 1/{d:.6}\n", .{1.0 / shutter_result});
}
