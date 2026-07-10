# diceps-host

## Dice Architecture Host Orchestrator

A Rust-based, terminal-native host interface and control utility for communicating with, monitoring, and controlling Dice-based computing architectures.

This application serves as the primary research and evaluation gateway for Dice-based architectures supporting physical hardware-in-the-loop environments. Currently, it targets ESP32-based solutions, for instance, represented by the companion ESP32-C6 emulator [diceps-mock-client](https://github.com/merement/diceps-mock-client). It will also include software-defined simulation backends as well.

------------------------------

## 📌 Project Role & Vision

This host application is planned to be an extensible entry point designed to interface with the Dice architecture across diverse execution backends.

                          +----------------------------+    
                          | Diceps Host Orchestrator   |
                          | (TUI / CLI Control Center) |
                          +----------------------------+
                                        |
             +--------------------------+--------------------------+
             | (Serial Link)            | (UNIX Domain Socket)     | (Wireless Layer)
             v                          v                          v
    +------------------+       +------------------+       +------------------+
    |    ESP32-C6      |       |  Local Software  |       |   Networked /    |
    | Firmware Target  |       |    Simulator     |       | Production Node  |
    +------------------+       +------------------+       +------------------+
    
------------------------------
    
## ⚡ Key Features
    
* Interactive Ratatui Dashboard: Built using the [ratatui](https://crates.io/crates/ratatui) ecosystem to provide real-time terminal telemetry, live auditing, and hardware state visualization.
* Bi-Directional Command Pipeline: Streamlined infrastructure for issuing control sequences, managing state overrides, and retrieving architecture health reports.
* Backend-Agnostic Core: Decoupled protocol abstraction layer ready to transition between physical and virtual endpoints.

------------------------------

## 🚀 Getting Started

Because this is a standard Cargo project, getting the orchestrator running locally requires minimal setup. The build engine handles all crate dependencies automatically.

   1. Clone the repository:
   
    git clone https://github.com/merement/diceps-host.git
    cd diceps-host
   
   2. Execute the application:
   
    cargo run
   
   
------------------------------

## 🔮 Roadmap & Future Research

* Multi-Transport Communication Layer:
* Wired serial communication (/dev/tty / COM ports) for hardware testing.
* Local UNIX-domain sockets (UDS) for low-overhead software simulation loops.
* Wireless communication layers (such as Wi-Fi or Bluetooth LE networks) for remote node management.
* Headless & Micro-TUI Execution.
* Configurable compilation flags to toggle between a lean, scriptable CLI tool and the fully featured interactive TUI dashboard.

------------------------------

## License

This project is licensed under the MIT license ([LICENSE] or <http://opensource.org/licenses/MIT>)

[LICENSE]: ./LICENSE
