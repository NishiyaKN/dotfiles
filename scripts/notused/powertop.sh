#!/bin/bash

# VM writeback timeout
echo '1500' | sudo tee /proc/sys/vm/dirty_writeback_centisecs

# NMI Watchdog
#echo '0' | sudo tee /proc/sys/kernel/nmi_watchdog

# Enable Audio codec power management
echo '1' | sudo tee /sys/module/snd_hda_intel/parameters/power_save

# SATA Link power management for host0
echo 'med_power_with_dipm' | sudo tee /sys/class/scsi_host/host0/link_power_management_policy

# SATA Link power management for host1
echo 'med_power_with_dipm' | sudo tee /sys/class/scsi_host/host1/link_power_management_policy

# SATA Link power management for host2
echo 'med_power_with_dipm' | sudo tee /sys/class/scsi_host/host2/link_power_management_policy

# port ata 1: Intel Corporation 82801 Mobile SATA Controller [RAID mode]
echo 'auto' | sudo tee /sys/bus/pci/devices/0000:00:17.0/ata1/power/control

# port ata2: Intel Corporation 82801 Mobile SATA Controller [RAID mode]
echo 'auto' | sudo tee /sys/bus/pci/devices/0000:00:17.0/ata2/power/control

# port ata3: Intel Corporation 82801 Mobile SATA Controller [RAID mode]
echo 'auto' | sudo tee /sys/bus/pci/devices/0000:00:17.0/ata3/power/control

# disk sda
echo 'auto' | sudo tee /sys/block/sda/device/power/control

# Intel Corporation 82801 Mobile SATA Controller [RAID mode]
echo 'auto' | sudo tee /sys/bus/pci/devices/0000:00:17.0/power/control

# Intel Corporation Sunrise Point LPC Controller/eSPI Controller
echo 'auto' | sudo tee /sys/bus/pci/devices/0000:00:1f.0/power/control

# Intel Corporation Ethernet Connection (4) I219-LM
echo 'auto' | sudo tee /sys/bus/pci/devices/0000:00:1f.6/power/control

# Intel Corporation Sunrise Point-LP SMBus
echo 'auto' | sudo tee /sys/bus/pci/devices/0000:00:1f.4/power/control

# Intel Corporation HD Graphics 620
echo 'auto' | sudo tee /sys/bus/pci/devices/0000:00:02.0/power/control

# Intel Corporation Sunrise Point-LP USB 3.0 xHCI Controller
echo 'auto' | sudo tee /sys/bus/pci/devices/0000:00:14.0/power/control

# Intel Corporation Sunrise Point-LP PCI Express Root Port 3
echo 'auto' | sudo tee /sys/bus/pci/devices/0000:00:1c.2/power/control

# Intel Corporation Sunrise Point-LP Serial IO I2C Controller 0
echo 'auto' | sudo tee /sys/bus/pci/devices/0000:00:15.0/power/control

# Intel Corporation Sunrise Point-LP HD Audio
echo 'auto' | sudo tee /sys/bus/pci/devices/0000:00:1f.3/power/control

# Realtek Semiconductor Co., LTD. RTS525A PCI Express Card Reader
echo 'auto' | sudo tee /sys/bus/pci/devices/0000:01:00.0/power/control

# Intel Corporation Sunrise Point-LP PMC
echo 'auto' | sudo tee /sys/bus/pci/devices/0000:00:1f.2/power/control

# Intel Corporation Sunrise Point-LP PCI Express Root Port 1
echo 'auto' | sudo tee /sys/bus/pci/devices/0000:00:1c.0/power/control

# Intel Corporation Sunrise Point-LP Serial IO I2C Controller 1
echo 'auto' | sudo tee /sys/bus/pci/devices/0000:00:15.1/power/control

# Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th Gen Core Processor Thermal Subsystem
echo 'auto' | sudo tee /sys/bus/pci/devices/0000:00:04.0/power/control

# Intel Corporation Sunrise Point-LP Thermal subsystem
echo 'auto' | sudo tee /sys/bus/pci/devices/0000:00:14.2/power/control

# Qualcomm Atheros QCA6174 802.11ac Wireless Network Adapter
echo 'auto' | sudo tee /sys/bus/pci/devices/0000:02:00.0/power/control

# Intel Corporation Xeon E3-1200 v6/7th Gen Core Processor Host Bridge/DRAM Registers
echo 'auto' | sudo tee /sys/bus/pci/devices/0000:00:00.0/power/control

# Intel Corporation Sunrise Point-LP CSME HECI 1
echo 'auto' | sudo tee /sys/bus/pci/devices/0000:00:16.0/power/control

# Autosuspend for USB device USB2.0 HUB [1-9]
echo 'on' | sudo tee /sys/bus/usb/devices/1-9/power/control

# Autosuspend for USB device Integrated_Webcam_HD
echo 'auto' | sudo tee /sys/bus/usb/devices/1-5/power/control

# Autosuspend for USB device 5880 [Broadcom Corp]
echo 'auto' | sudo tee /sys/bus/usb/devices/1-10/power/control

