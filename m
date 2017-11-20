Return-Path: <eajames@linux.vnet.ibm.com>
Return-path: <eajames@linux.vnet.ibm.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux@roeck-us.net, jdelvare@suse.com,
        corbet@lwn.net, mark.rutland@arm.com, robh+dt@kernel.org,
        joel@jms.id.au, eajames@linux.vnet.ibm.com,
        "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH v3 01/12] Documentation: hwmon: Add OCC documentation
Date: Mon, 20 Nov 2017 17:53:30 -0600
In-Reply-To: <1511222021-562-1-git-send-email-eajames@linux.vnet.ibm.com>
References: <1511222021-562-1-git-send-email-eajames@linux.vnet.ibm.com>
Message-Id: <1511222021-562-2-git-send-email-eajames@linux.vnet.ibm.com>
List-ID: <linux-hwmon@vger.kernel.org>

From: "Edward A. James" <eajames@us.ibm.com>

Document the hwmon interface for the OCC.

Signed-off-by: Edward A. James <eajames@us.ibm.com>
---
 Documentation/hwmon/occ | 75 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 Documentation/hwmon/occ

diff --git a/Documentation/hwmon/occ b/Documentation/hwmon/occ
new file mode 100644
index 0000000..c88d0f5
--- /dev/null
+++ b/Documentation/hwmon/occ
@@ -0,0 +1,75 @@
+Kernel driver occ-hwmon
+=======================
+
+Supported chips:
+  * POWER8
+  * POWER9
+
+Author: Eddie James <eajames@us.ibm.com>
+
+Description
+-----------
+
+This driver supports hardware monitoring for the On-Chip Controller (OCC)
+embedded on POWER processors. The OCC is a device that collects and aggregates
+sensor data from the processor and the system. The OCC can provide the raw
+sensor data as well as perform thermal and power management on the system.
+
+The P8 version of this driver is a client driver of I2C. It may be probed
+manually if an "ibm,p8-occ-hwmon" compatible device is found under the
+appropriate I2C bus node in the device-tree.
+
+The P9 version of this driver is a client driver of the FSI-based OCC driver.
+It will be probed automatically by the FSI-based OCC driver. Please see the
+device-tree bindings documentation for that driver for details on probing
+an OCC device (Documentation/devicetree/bindings/fsi/ibm,p9-occ.txt).
+
+Sysfs entries
+-------------
+
+The following attributes are supported. All attributes are read-only unless
+specified.
+
+temp[1-n]_label		OCC sensor id.
+temp[1-n]_input		Measured temperature in millidegrees C.
+[with temperature sensor version 2+]
+    temp[1-n]_fru_type		Given FRU (Field Replaceable Unit) type.
+    temp[1-n]_fault		Temperature sensor fault.
+
+freq[1-n]_label		OCC sensor id.
+freq[1-n]_input		Measured frequency.
+
+power[1-n]_label	OCC sensor id.
+power[1-n]_input	Measured power in microwatts.
+power[1-n]_update_tag	Number of 250us samples represented in accumulator.
+power[1-n]_accumulator	Accumulation of 250us power readings.
+[with power sensor version 2+]
+    power[1-n]_function_id	Identifies what the power reading is for.
+    power[1-n]_apss_channel	Indicates APSS channel.
+
+[power version 0xa0 only]
+power1_id			OCC sensor id.
+power[1-n]_label		Sensor type, "system", "proc", "vdd", or "vdn".
+power[1-n]_input		Most recent power reading in microwatts.
+power[1-n]_update_tag		Number of samples in the accumulator.
+power[1-n]_accumulator		Accumulation of power readings.
+[with sensor type "system" and "proc" only]
+    power[1-n]_update_time	Time in us that the power value is read.
+
+caps1_current		Current OCC power cap in watts.
+caps1_reading		Current system output power in watts.
+caps1_norm		Power cap without redundant power.
+caps1_max		Maximum power cap.
+[caps version 1 and 2 only]
+    caps1_min		Minimum power cap.
+[caps version 3+]
+    caps1_min_hard		Hard minimum cap that can be set and held.
+    caps1_min_soft		Soft minimum cap below hard, not guaranteed.
+caps1_user		The powercap specified by the user. Will be 0 if no
+			user powercap exists. This attribute is read-write.
+[caps version 1+]
+    caps1_user_source	Indicates how the user power limit was set.
+
+extn[1-n]_label		ASCII id or sensor id.
+extn[1-n]_flags		Indicates type of label attribute.
+extn[1-n]_input		Data.
-- 
1.8.3.1
