---
layout: post
title: "How setup power monitoring virtual machine"
date: 2025-04-04
categories: 
author: Norris
author_avatar: /assets/img/team/Norris-avatar.png
image: /assets/img/blog/11-monitoring-VM.png
excerpt: 
---
Monitoring power consumption is essential for making smarter decisions, reducing costs, and promoting sustainability—whether you're managing a data center, a smart home, or a renewable energy project. A power monitoring virtual machine (VM) simplifies this process by offering a centralized platform to collect, analyze, and visualize energy data.

In this blog, we'll walk you through setting up a power monitoring VM, covering essential tools, software, and configurations to streamline your energy management. Let’s get started and optimize your setup!

**Prerequisites**
  - Virtual Machine Host
  You’ll need either VMware ESXi or Proxmox Virtual Environment installed on your server.

  - UPS (Uninterruptible Power Supply)
  Your UPS should have either a USB or Ethernet port for communication.

<div style="text-align: center;">
  <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/1-UPS.png" alt="UPS" width="100">
</div>

  - Virtual Machine Image
  Typically downloadable from the manufacturer’s website, usually in .VMDK format.

**System Overview**

<div style="text-align: center;">
  <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/2-overview.png" alt="System Overview" width="500" style="padding: 10px;">
</div>

In this example setup:

  - We have a physical server connected to the UPS using both power and data via USB.

  - A hypervisor (ESXi or Proxmox) is already installed.  

  - We’ll use the manufacturer’s utility image to deploy the power monitoring VM.
  
    ⚠️ Note: The monitoring system used in this guide supports VMware ESXi only.

**Step-by-Step Setup Guide**

<div style="text-align: center;">
  <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/3-esxi.png" alt="ESXI" width="500" style="padding: 10px;">
</div>

<ol>
  <li>
    <strong>Verify UPS Detection via SSH</strong><br>
    - Login to your VMware host through SSH.<br>
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/4-ssh.png" alt="We logged in as root" width="500" style="padding: 10px;">
    </div>
  </li>

  <li>
    <strong>At the prompt, type <code>lsusb</code></strong>. This command will list all USB devices connected to your physical server.
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/5-lsusb.png" alt="Success, VMware is able to detect the UPS" width="500" style="padding: 10px;">
    </div>
  </li>

  <li>
    <strong>Download the VMDK image from the manufacturer’s website</strong><br>
    For this example, the UPS manufacturer is Cyber Power Systems.<br>
    - If your UPS is connected via USB, download the first option.<br>
    - If your UPS is connected via the network, download the second (remote) option.
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/6-power-panel.png" alt="Power Panel" width="500" style="padding: 10px;">
    </div>
  </li>

  <li>After downloading<br>Unzip the file to extract the necessary image files.</li>

  <li>
    Login to the VMware web GUI and create a virtual machine.<br>
    Select <em>Deploy a virtual machine from an OVF or OVA file</em>, then click <strong>Next</strong>.
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/7-Virtual-machine.png" alt="Select Creation Type" width="500" style="padding: 10px;">
    </div>
  </li>

  <li>
    Enter the name of the virtual machine (e.g., <strong>MonitorVM</strong>).<br>
    - Drag and drop the <code>.ovf</code> and <code>.vmdk</code> files into the box.<br>
    - Click <strong>Next</strong> once they are loaded.
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/8-monitor-vm.png" width="500" style="padding: 10px;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/8-monitor-vm-2.png" width="500" style="padding: 10px;">
    </div>
  </li>

  <li>
    Choose the storage location.<br>
    For this example, we only have one option. Click <strong>Next</strong>.
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/8-monitor-vm-3.png" width="500" style="padding: 10px;">
    </div>
  </li>

  <li>
    Select Thin Provisioning.<br>
    - Untick <strong>Power on automatically</strong>.<br>
    - Click <strong>Next</strong>.
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/8-monitor-vm-4.png" width="500" style="padding: 10px;">
    </div>
  </li>

  <li>
    Review the configuration and click <strong>Finish</strong>.
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/8-monitor-vm-5.png" width="500" style="padding: 10px;">
    </div>
  </li>

  <li>
    Wait for the virtual machine to finish creating.
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/9-creation.png" width="500" style="padding: 10px;">
    </div>
  </li>

  <li>
    Configure the power monitoring VM.<br>
    - Add a USB device to the VM.<br>
    - Choose your UPS from the list.<br>
    - Click <strong>Save</strong>.
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/10-configure.png" width="500" style="padding: 10px;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/11-usb.png" width="500" style="padding: 10px;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/12-save.png" width="500" style="padding: 10px;">
    </div>
  </li>

  <li>
    Turn on the virtual machine.<br>
    Take note of the IP address automatically assigned by ESXi.
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/13-IP.png" width="500" style="padding: 10px;">
    </div>
  </li>

  <li>
    Access the web GUI.<br>
    Open a browser and enter the IP address with the correct port (e.g., <code>http://10.11.0.124:3052</code>).<br>
    Refer to the manufacturer’s manual to determine the correct port.
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/14-web-gui.png" width="500" style="padding: 10px;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/14-web-gui-2.png" width="500" style="padding: 10px;">
    </div>
  </li>

  <li>
    Change the default password (mandatory).<br>
    After clicking <strong>Save</strong>, you will be logged out and must log in again with your new password.
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/15-save.png" width="500" style="padding: 10px;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/16-complete-info.png" width="500" style="padding: 10px;">
    </div>
  </li>

  <li>
    After logging in, you'll see complete UPS information on the left-hand side.
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/16-complete-info.png" width="500" style="padding: 10px;">
    </div>
  </li>

  <li>
    Configure shutdown settings.<br>
    Navigate to <strong>Settings &gt; Shutdown Events</strong>.<br>
    - Verify connectivity to your ESXi server.<br>
    - Set your preferred shutdown duration and delay.
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/18-shutdown-delays.png" width="500" style="padding: 10px;">
    </div>
  </li>

  <li>
    Click <strong>Apply</strong> to save your shutdown configurations.
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/19-apply.png" width="500" style="padding: 10px;">
    </div>
  </li>
</ol>
