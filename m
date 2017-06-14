Return-Path: <jaghu@google.com>
Return-path: <jaghu@google.com>
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: zbr@ioremap.net,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	jdelvare@suse.com,
	linux-hwmon@vger.kernel.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v1 0/3] Export 1-wire thermal sensors as hwmon device
Date: Wed, 14 Jun 2017 14:59:41 -0700
Message-Id: <20170614215944.24984-1-jaghu@google.com>
List-ID: <linux-hwmon@vger.kernel.org>

Our board has 4 DS18B20 1-wire temperature sensors. Each 1-wire bus and the
sensor under it is already configured against the Linux 1-wire driver
(called w1). They have a sysfs file(e.g.
/sys/bus/w1/devices/w1_bus_master1/28-000007704f4c/w1_slave) which, when read,
runs code to read the temperature. We'd like the temperatures to show up in
hwmon, so that the BMC IPMI sensor plumbing can forward those to host.

This patchset is based on linux mainline version v4.10.

Tested:
Yes; On a board with 4 DS18B20 1-wire temperature sensors:
root@zaius:/sys/class/hwmon# ls
hwmon0  hwmon1  hwmon2  hwmon3  hwmon4  hwmon5
root@zaius:/sys/class/hwmon# cd hwmon0
root@zaius:/sys/class/hwmon/hwmon0# ls
device       name         subsystem    temp1_input  uevent
root@zaius:/sys/class/hwmon/hwmon0# cat temp1_input
24500
root@zaius:/sys/class/hwmon/hwmon0# cd ..
root@zaius:/sys/class/hwmon# cd hwmon1
root@zaius:/sys/class/hwmon/hwmon1# cat temp1_input
26562
root@zaius:/sys/class/hwmon/hwmon1# cd ..
root@zaius:/sys/class/hwmon# cd hwmon2
root@zaius:/sys/class/hwmon/hwmon2# cat temp1_input
27250
root@zaius:/sys/class/hwmon/hwmon2# cd ..
root@zaius:/sys/class/hwmon# cd hwmon3
root@zaius:/sys/class/hwmon/hwmon3# cat temp1_input
22250
root@zaius:/sys/class/hwmon/hwmon3#

Jaghathiswari Rankappagounder Natarajan (3):
  drivers: w1: add hwmon support structures
  drivers: w1: refactor w1_slave_show to make the temp reading
    functionality separate
  drivers: w1: add hwmon temp support for w1_therm

 drivers/w1/slaves/w1_therm.c | 124 ++++++++++++++++++++++++++++++++-----------
 drivers/w1/w1.c              |  20 ++++++-
 drivers/w1/w1.h              |   2 +
 drivers/w1/w1_family.h       |   2 +
 4 files changed, 117 insertions(+), 31 deletions(-)

--
2.13.1.508.gb3defc5cc-goog
