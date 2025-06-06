---
layout: post
title: "How to setup power monitoring virtual machine"
date: 2025-04-04
categories: 
author: Norris
author_avatar: /assets/img/team/Norris-avatar.png
image: /assets/img/blog/11-monitoring-VM.png
excerpt: 
---
Monitoring power consumption is crucial for making smarter decisions, reducing costs, and promoting sustainability—whether in a data center, smart home, or renewable energy project. A power monitoring virtual machine (VM) simplifies this process by providing a centralized platform to collect, analyze, and visualize energy data.

In this blog, we'll walk you through setting up a power monitoring VM, covering essential tools, software, and configurations to streamline your energy management. Let’s get started and optimize your power monitoring setup!

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

#### Procedures for VMWare

<div style="text-align: center;">
  <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/3-esxi.png" alt="ESXI" width="700" style="padding: 10px;">
</div>

<ol>
  <li>
    <strong>Verify UPS Detection via SSH</strong><br>
    - Login to your VMware host through SSH.<br>
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/4-ssh.png" alt="We logged in as root" width="700" style="padding: 10px;">
    </div>
  </li>

  <li>
    <strong>At the prompt, type <code>lsusb</code></strong>. This command will list all USB devices connected to your physical server.
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/5-lsusb.png" alt="Success, VMware is able to detect the UPS" width="700" style="padding: 10px;">
    </div>
  </li>

  <li>
    <strong>Download the VMDK image from the manufacturer’s website</strong><br>
    For this example, the UPS manufacturer is Cyber Power Systems.<br>
    - If your UPS is connected via USB, download the first option.<br>
    - If your UPS is connected via the network, download the second (remote) option.
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/6-power-panel.png" alt="Power Panel" width="700" style="padding: 10px;">
    </div>
  </li>

  <li>After downloading<br>Unzip the file to extract the necessary image files.</li>

  <li>
    Login to the VMware web GUI and create a virtual machine.<br>
    Select <em>Deploy a virtual machine from an OVF or OVA file</em>, then click <strong>Next</strong>.
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/7-Virtual-machine.png" alt="Select Creation Type" width="700" style="padding: 10px;">
    </div>
  </li>

  <li>
    Enter the name of the virtual machine (e.g., <strong>MonitorVM</strong>).<br>
    - Drag and drop the <code>.ovf</code> and <code>.vmdk</code> files into the box.<br>
    - Click <strong>Next</strong> once they are loaded.
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/8-monitor-vm.png" width="700" style="padding: 10px;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/8-monitor-vm-2.png" width="700" style="padding: 10px;">
    </div>
  </li>

  <li>
    Choose the storage location.<br>
    For this example, we only have one option. Click <strong>Next</strong>.
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/8-monitor-vm-3.png" width="700" style="padding: 10px;">
    </div>
  </li>

  <li>
    Select Thin Provisioning.<br>
    - Untick <strong>Power on automatically</strong>.<br>
    - Click <strong>Next</strong>.
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/8-monitor-vm-4.png" width="700" style="padding: 10px;">
    </div>
  </li>

  <li>
    Review the configuration and click <strong>Finish</strong>.
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/8-monitor-vm-5.png" width="700" style="padding: 10px;">
    </div>
  </li>

  <li>
    Wait for the virtual machine to finish creating.
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/9-creation.png" width="700" style="padding: 10px;">
    </div>
  </li>

  <li>
    Configure the power monitoring VM.<br>
    - Add a USB device to the VM.<br>
    - Choose your UPS from the list.<br>
    - Click <strong>Save</strong>.
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/10-configure.png" width="700" style="padding: 10px;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/11-usb.png" width="700" style="padding: 10px;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/12-save.png" width="700" style="padding: 10px;">
    </div>
  </li>

  <li>
    Turn on the virtual machine.<br>
    Take note of the IP address automatically assigned by ESXi.
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/13-IP.png" width="700" style="padding: 10px;">
    </div>
  </li>

  <li>
    Access the web GUI.<br>
    Open a browser and enter the IP address with the correct port (e.g., <code>http://10.11.0.124:3052</code>).<br>
    Refer to the manufacturer’s manual to determine the correct port.
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/14-web-gui.png" width="700" style="padding: 10px;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/14-web-gui-2.png" width="700" style="padding: 10px;">
    </div>
  </li>

  <li>
    Change the default password (mandatory).<br>
    After clicking <strong>Save</strong>, you will be logged out and must log in again with your new password.
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/15-save.png" width="700" style="padding: 10px;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/16-complete-info.png" width="700" style="padding: 10px;">
    </div>
  </li>

  <li>
    After logging in, you'll see complete UPS information on the left-hand side.
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/16-complete-info.png" width="700" style="padding: 10px;">
    </div>
  </li>

  <li>
    Configure shutdown settings.<br>
    Navigate to <strong>Settings &gt; Shutdown Events</strong>.<br>
    - Verify connectivity to your ESXi server.<br>
    - Set your preferred shutdown duration and delay.
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/18-shutdown-delays.png" width="700" style="padding: 10px;">
    </div>
  </li>

  <li>
    Click <strong>Apply</strong> to save your shutdown configurations.
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/19-apply.png" width="700" style="padding: 10px;">
    </div>
  </li>
</ol>

#### Procedures for Proxmox

<ol>
  <li>
    In Proxmox, select your <strong>PVE node → Shell.</strong>
     Or use your favorite remote connection tool to connect to your proxmox server. List all USB ports by typing <code>lsusb</code>
    <br>
      Note the <strong>Bus</strong> and <strong>Device</strong> of your UPS device. 
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/20-proxmox-shell.png" width="700" style="padding: 10px;">
    </div>

  List the USB port details:<br>
   <code>lsusb -v -s [bus]:[device]</code><br>
   in my case<br>
   <code>lsusb -v -s 1:16</code><br>
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/21-lsusb.png" width="700" style="padding: 10px;">
    </div>
  </li>

  <li>
    We have to download <a href="https://www.cyberpowersystems.com/products/software/power-panel-business/" target="_blank" rel="noopener noreferrer">PowerPanel Business</a>
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/22-powerpanel-business.png" width="700" style="padding: 10px;">
    </div>
    We are going to download PowerPanel Business – Virtual Machine (Local) since the UPS is connected directly to our bare-metal server.   
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/23-download.png" width="700" style="padding: 10px;">
    </div>
    Extract the zipped file to reveal its contents.<br>
    We will need the .OVF and .VMDK files later.
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/24-extracted-files.png" width="700" style="padding: 10px;">
    </div>
  </li>

  <li>
    We are going to upload the .OVF and .VMDK files to our Proxmox server using SFTP or FTP software such as FileZilla, WinSCP, etc. In our case, we will use <a href="https://winscp.net/eng/index.php" target="_blank" rel="noopener noreferrer">WinSCP.</a> Once downloaded, install it to your device.
  </li>

  <li>
Upload the .OVF and .VMDK files to the Proxmox server.<br>
Using WinSCP, log in to your Proxmox server and proceed with the upload.
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/26-login.png" width="700" style="padding: 10px;">
    </div>
        <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/27-logged-in.png" width="700" style="padding: 10px;">
    </div>
  </li>

  <li>
Create the virtual machine for CyberPower PowerPanel.<br>
In the Proxmox shell, navigate to the directory where you uploaded the .OVF and .VMDK files.
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/29-proxmox-console.png" width="700" style="padding: 10px;">
    </div>
We are now ready to create the virtual machine using the following command format:

<code>qm importovf &lt;proxmox ID&gt; &lt;ovf source&gt; &lt;storage&gt; --format &lt;format&gt;</code>

<ul>
  <li><strong>qm</strong> – Command that creates/restores a VM</li>
  <li><strong>importovf</strong> – Imports virtual machines from an OVF (Open Virtualization Format) or OVA (Open Virtual Appliance) package into a hypervisor or virtualization platform</li>
  <li><strong>proxmox ID</strong> – Assigns a unique Proxmox ID for the virtual machine</li>
  <li><strong>ovf source</strong> – The path to the OVF source file</li>
  <li><strong>storage</strong> – Specifies the storage where the virtual machine will reside</li>
  <li><strong>--format</strong> – Sets the disk format (e.g., raw, qcow2, vmdk)</li>
</ul>

For our case, <code>qm importovf 106 ppb4113-local.ovf local-lvm --format raw</code>
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/30-proxmox-console.png" width="700" style="padding: 10px;">
    </div>
Upon entering the command, the system will display the progress of the VM creation. Wait until it reaches 100%.
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/31-progress.png" width="700" style="padding: 10px;">
    </div>
  </li>

  <li>
Add a virtual network card and connect the UPS to the VM<br>
The virtual machine is not complete yet—we need to add a virtual network card so we can assign it an IP address later.
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/32-add.png" width="700" style="padding: 10px;">
    </div>
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/33-network-device.png" width="700" style="padding: 10px;">
    </div>
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/34-usb-device.png" width="700" style="padding: 10px;">
    </div>
Check the Manufacturer and Product ID, then select Add.
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/35-product-id.png" width="700" style="padding: 10px;">
    </div>
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/36-memory.png" width="700" style="padding: 10px;">
    </div>
  </li>

  <li>
Assign an IP address to PowerPanel<br>
Turn on the newly created virtual machine.
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/37-ubuntu.png" width="700" style="padding: 10px;">
    </div>
Since we don't have a working IP address yet, we will assign one using DHCP.<br>
First, type ip add to identify the label of the attached network card.
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/38-ip-add.png" width="700" style="padding: 10px;">
    </div>
Next, we will activate <code>ens18</code> by typing the following command:<br>
<code>sudo ip link set dev ens18 up</code>
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/39-admin.png" width="700" style="padding: 10px;">
    </div>
We will assign an IP address automatically using the following command:<br>
<code>sudo dhclient -v ens18</code><br>
Upon entering this command, the system will display the assigned IP address.
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/40-ip.png" width="700" style="padding: 10px;">
    </div>
</li>

  <li>
 Access PowerPanel using the assigned IP address and port <strong>3052</strong><br>
Using a browser, we can now access PowerPanel by entering the assigned IP address followed by the port number.<br>
In our case, it should be:
<code>192.168.5.102:3052</code>
        <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/41-powerpanel.png" width="700" style="padding: 10px;">
    </div>
  </li>

  <li>
Upon logging in, the system will prompt you to change the password.
Changing the password is mandatory.
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/42-login.png" width="700" style="padding: 10px;">
    </div>
    <div style="text-align: center;">
      <img src="{{ site.baseurl }}/assets/img/blog/monitoring-vm/43-done.png" width="700" style="padding: 10px;">
    </div>
  </li>
</ol>