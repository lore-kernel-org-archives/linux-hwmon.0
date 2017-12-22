Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl0-f66.google.com ([209.85.160.66]:42248 "EHLO
        mail-pl0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756514AbdLVR0M (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 22 Dec 2017 12:26:12 -0500
Date: Fri, 22 Dec 2017 22:56:04 +0530
From: Aishwarya Pant <aishpant@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Frey <david.frey@sensirion.com>,
        Pascal Sachs <pascal.sachs@sensirion.com>
Cc: julia.lawall@lip6.fr
Subject: [PATCH] hwmon: (sht3x) move sysfs documentation to Documentation/ABI
Message-ID: <20171222172604.GA9918@mordor.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The sysfs documentation for sht3x devices should be with the rest of the
interfaces in Documentation/ABI. The motivation behind this is that
documentation should be where the user expects it to be, rather than
where the developer expects it to be.

ABI documentation requires a specific format and this is how the
information in it was filled-

What:           sht3x is an i2c device so it would be connected to the
                i2c bus
Date:           from the commit date that introduced the attribute
KernelVersion:  from the first stable version git tag that contains the
                commit
Contact:        module author(s)
Description:    from Documentation/hwmon/sht3x

Signed-off-by: Aishwarya Pant <aishpant@gmail.com>
---

There are things that might be wrong here and I am unsure of-
1. Whether this file should be in stable or testing?
2. Contact information, full sysfs path etc

I am doing this is in an exercise to move sysfs documentation to its right
place and identify places where it might be missing. hwmon drivers seem to have
a quite nice documentation, but just not in the ABI format.

Documentation/ABI/stable/sysfs-bus-i2c-hwmon-sht3x | 128 +++++++++++++++++++++
 Documentation/hwmon/sht3x                          |  25 ----
 2 files changed, 128 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/ABI/stable/sysfs-bus-i2c-hwmon-sht3x

diff --git a/Documentation/ABI/stable/sysfs-bus-i2c-hwmon-sht3x b/Documentation/ABI/stable/sysfs-bus-i2c-hwmon-sht3x
new file mode 100644
index 000000000000..0e8355c625f5
--- /dev/null
+++ b/Documentation/ABI/stable/sysfs-bus-i2c-hwmon-sht3x
@@ -0,0 +1,128 @@
+What:		/sys/bus/i2c/devices/.../temp1_input
+Date:		June 2016
+KernelVersion:  4.8
+Contact:	David Frey <david.frey@sensirion.com>,
+		Pascal Sachs <pascal.sachs@sensirion.com>
+Description:    (RO) Temperature input value
+		Unit: millidegree Celsius
+
+What:		/sys/bus/i2c/devices/.../temp1_max
+Date:		June 2016
+KernelVersion:  4.8
+Contact:	David Frey <david.frey@sensirion.com>,
+		Pascal Sachs <pascal.sachs@sensirion.com>
+Description:    (RW) Temperature max value.
+		Unit: millidegree Celsius
+
+What:		/sys/bus/i2c/devices/.../temp1_max_hyst
+Date:		June 2016
+KernelVersion:  4.8
+Contact:	David Frey <david.frey@sensirion.com>,
+		Pascal Sachs <pascal.sachs@sensirion.com>
+Description:    (RW) Temperature hysteresis value for max limit
+		Unit: millidegree Celsius
+
+What:		/sys/bus/i2c/devices/.../temp1_min
+Date:		June 2016
+KernelVersion:  4.8
+Contact:	David Frey <david.frey@sensirion.com>,
+		Pascal Sachs <pascal.sachs@sensirion.com>
+Description:    (RW) Temperature min value
+		Unit: millidegree Celsius
+
+What:		/sys/bus/i2c/devices/.../temp1_min_hyst
+Date:		June 2016
+KernelVersion:  4.8
+Contact:	David Frey <david.frey@sensirion.com>,
+		Pascal Sachs <pascal.sachs@sensirion.com>
+Description:    (RW) Temperature hysteresis value for min limit.
+		Unit: millidegree Celsius
+
+What:		/sys/bus/i2c/devices/.../temp1_alarm
+Date:		June 2016
+KernelVersion:  4.8
+Contact:	David Frey <david.frey@sensirion.com>,
+		Pascal Sachs <pascal.sachs@sensirion.com>
+Description:    (RO) Channel alarm
+		0: no alarm
+		1: alarm is set when the temperature is outside the configured
+		limits.
+		Only works in periodic measure mode
+
+What:		/sys/bus/i2c/devices/.../humidity1_input
+Date:		June 2016
+KernelVersion:  4.8
+Contact:	David Frey <david.frey@sensirion.com>,
+		Pascal Sachs <pascal.sachs@sensirion.com>
+Description:    (RO) humidity input
+		Unit: milli-percent
+
+What:		/sys/bus/i2c/devices/.../humidity1_max
+Date:		June 2016
+KernelVersion:  4.8
+Contact:	David Frey <david.frey@sensirion.com>,
+		Pascal Sachs <pascal.sachs@sensirion.com>
+Description:    (RW) humidity max value
+		Unit: milli-percent
+
+What:		/sys/bus/i2c/devices/.../humidity1_max_hyst
+Date:		June 2016
+KernelVersion:  4.8
+Contact:	David Frey <david.frey@sensirion.com>,
+		Pascal Sachs <pascal.sachs@sensirion.com>
+Description:    (RW) humidity hysteresis value for max limit
+		Unit: milli-percent
+
+What:		/sys/bus/i2c/devices/.../humidity1_min
+Date:		June 2016
+KernelVersion:  4.8
+Contact:	David Frey <david.frey@sensirion.com>,
+		Pascal Sachs <pascal.sachs@sensirion.com>
+Description:    (RW) humidity min value
+		Unit: milli-percent
+
+What:		/sys/bus/i2c/devices/.../humidity1_min_hyst
+Date:		June 2016
+KernelVersion:  4.8
+Contact:	David Frey <david.frey@sensirion.com>,
+		Pascal Sachs <pascal.sachs@sensirion.com>
+Description:    (RW) humidity hysteresis value for min limit
+		Unit: milli-percent
+
+What:		/sys/bus/i2c/devices/.../humidity1_alarm
+Date:		June 2016
+KernelVersion:  4.8
+Contact:	David Frey <david.frey@sensirion.com>,
+		Pascal Sachs <pascal.sachs@sensirion.com>
+Description:    (RO) humidity alarm
+		0: no alarm
+		1: alarm is set when the humidity is outside the configured
+	            limits
+		Only works in periodic measure mode
+
+What:		/sys/bus/i2c/devices/.../heater_enable
+Date:		July 2016
+KernelVersion:  4.8
+Contact:	David Frey <david.frey@sensirion.com>,
+		Pascal Sachs <pascal.sachs@sensirion.com>
+Description:    (RW) Enable on-chip heater to remove excess humidity from sensor
+		0: turned off
+		1: turned on
+
+What:		/sys/bus/i2c/devices/.../update_interval
+Date:		June 2016
+KernelVersion:  4.8
+Contact:	David Frey <david.frey@sensirion.com>,
+		Pascal Sachs <pascal.sachs@sensirion.com>
+Description:    (RW) value is 0 for single shot, otherwise it is interval in
+		msec for periodic measurement.
+		The allowed update_interval in milliseconds are as follows:
+		  *     0   single shot mode
+		  *  2000   0.5 Hz periodic measurement
+		  *  1000   1   Hz periodic measurement
+		  *   500   2   Hz periodic measurement
+		  *   250   4   Hz periodic measurement
+		  *   100  10   Hz periodic measurement
+		If the interval is not supported by the sensor, the next faster
+		interval is chosen.
+		Unit: milliseconds
diff --git a/Documentation/hwmon/sht3x b/Documentation/hwmon/sht3x
index b0d88184f48e..744dc9b00e8b 100644
--- a/Documentation/hwmon/sht3x
+++ b/Documentation/hwmon/sht3x
@@ -49,28 +49,3 @@ the alert pin on the sensor is set to high.
 When the temperature and humidity readings move back between the hysteresis
 values, the alert bit is set to 0 and the alert pin on the sensor is set to
 low.
-
-sysfs-Interface
----------------
-
-temp1_input:        temperature input
-humidity1_input:    humidity input
-temp1_max:          temperature max value
-temp1_max_hyst:     temperature hysteresis value for max limit
-humidity1_max:      humidity max value
-humidity1_max_hyst: humidity hysteresis value for max limit
-temp1_min:          temperature min value
-temp1_min_hyst:     temperature hysteresis value for min limit
-humidity1_min:      humidity min value
-humidity1_min_hyst: humidity hysteresis value for min limit
-temp1_alarm:        alarm flag is set to 1 if the temperature is outside the
-                    configured limits. Alarm only works in periodic measure mode
-humidity1_alarm:    alarm flag is set to 1 if the humidity is outside the
-                    configured limits. Alarm only works in periodic measure mode
-heater_enable:      heater enable, heating element removes excess humidity from
-                    sensor
-                        0: turned off
-                        1: turned on
-update_interval:    update interval, 0 for single shot, interval in msec
-                    for periodic measurement. If the interval is not supported
-                    by the sensor, the next faster interval is chosen
-- 
2.15.1

