Return-Path: <shilpa.bhat@linux.vnet.ibm.com>
Return-path: <shilpa.bhat@linux.vnet.ibm.com>
From: Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
To: linux@roeck-us.net, mpe@ellerman.id.au
Cc: linuxppc-dev@lists.ozlabs.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, ego@linux.vnet.ibm.com,
        Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
Subject: [PATCH v4 3/3] hwmon: Document the sensor enable attribute
Date: Fri,  6 Jul 2018 17:26:06 +0530
In-Reply-To: <1530878166-12589-1-git-send-email-shilpa.bhat@linux.vnet.ibm.com>
References: <1530878166-12589-1-git-send-email-shilpa.bhat@linux.vnet.ibm.com>
Message-Id: <1530878166-12589-4-git-send-email-shilpa.bhat@linux.vnet.ibm.com>
List-ID: <linux-hwmon@vger.kernel.org>

Signed-off-by: Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
---
 Documentation/hwmon/sysfs-interface | 62 +++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/Documentation/hwmon/sysfs-interface b/Documentation/hwmon/sysfs-interface
index fc337c3..f865dd7 100644
--- a/Documentation/hwmon/sysfs-interface
+++ b/Documentation/hwmon/sysfs-interface
@@ -171,6 +171,15 @@ in[0-*]_label	Suggested voltage channel label.
 		user-space.
 		RO
 
+in[0-*]_enable
+		Enable or disable the sensors.
+		When disabled the sensor read will return -ENODATA. This
+		attribute can be used as per-sensor or per-sub-group attribute
+		depending on what is supported by the hardware.
+		1: Enable
+		0: Disable
+		RW
+
 cpu[0-*]_vid	CPU core reference voltage.
 		Unit: millivolt
 		RO
@@ -236,6 +245,15 @@ fan[1-*]_label	Suggested fan channel label.
 		In all other cases, the label is provided by user-space.
 		RO
 
+fan[1-*]_enable
+		Enable or disable the sensors.
+		When disabled the sensor read will return -ENODATA. This
+		attribute can be used as per-sensor or per-sub-group attribute
+		depending on what is supported by the hardware.
+		1: Enable
+		0: Disable
+		RW
+
 Also see the Alarms section for status flags associated with fans.
 
 
@@ -409,6 +427,15 @@ temp_reset_history
 		Reset temp_lowest and temp_highest for all sensors
 		WO
 
+temp[1-*]_enable
+		Enable or disable the sensors.
+		When disabled the sensor read will return -ENODATA. This
+		attribute can be used as per-sensor or per-sub-group attribute
+		depending on what is supported by the hardware.
+		1: Enable
+		0: Disable
+		RW
+
 Some chips measure temperature using external thermistors and an ADC, and
 report the temperature measurement as a voltage. Converting this voltage
 back to a temperature (or the other way around for limits) requires
@@ -468,6 +495,15 @@ curr_reset_history
 		Reset currX_lowest and currX_highest for all sensors
 		WO
 
+curr[1-*]_enable
+		Enable or disable the sensors.
+		When disabled the sensor read will return -ENODATA. This
+		attribute can be used as per-sensor or per-sub-group attribute
+		depending on what is supported by the hardware.
+		1: Enable
+		0: Disable
+		RW
+
 Also see the Alarms section for status flags associated with currents.
 
 *********
@@ -566,6 +602,15 @@ power[1-*]_crit			Critical maximum power.
 				Unit: microWatt
 				RW
 
+power[1-*]_enable		Enable or disable the sensors.
+				When disabled the sensor read will return
+				-ENODATA. This attribute can be used as
+				per-sensor or per-sub-group attribute depending
+				on what is supported by the hardware.
+				1: Enable
+				0: Disable
+				RW
+
 Also see the Alarms section for status flags associated with power readings.
 
 **********
@@ -576,6 +621,14 @@ energy[1-*]_input		Cumulative energy use
 				Unit: microJoule
 				RO
 
+energy[1-*]_enable		Enable or disable the sensors.
+				When disabled the sensor read will return
+				-ENODATA. This attribute can be used as
+				per-sensor or per-sub-group attribute depending
+				on what is supported by the hardware.
+				1: Enable
+				0: Disable
+				RW
 
 ************
 * Humidity *
@@ -586,6 +639,15 @@ humidity[1-*]_input		Humidity
 				RO
 
 
+humidity[1-*]_enable		Enable or disable the sensors
+				When disabled the sensor read will return
+				-ENODATA. This attribute can be used as
+				per-sensor or per-sub-group attribute depending
+				on what is supported by the hardware.
+				1: Enable
+				0: Disable
+				RW
+
 **********
 * Alarms *
 **********
-- 
1.8.3.1
