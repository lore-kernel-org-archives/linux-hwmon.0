Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:54906 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751732AbdKMD20 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 12 Nov 2017 22:28:26 -0500
From: Lei YU <mine260309@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Jiri Kosina <trivial@kernel.org>
Cc: Lei YU <mine260309@gmail.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v4 3/3] hwmon: (w83773g) Add documentation
Date: Mon, 13 Nov 2017 11:27:34 +0800
Message-Id: <1510543655-27059-4-git-send-email-mine260309@gmail.com>
In-Reply-To: <1510543655-27059-1-git-send-email-mine260309@gmail.com>
References: <1510543655-27059-1-git-send-email-mine260309@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Add documentation for the w83773g driver.

Signed-off-by: Lei YU <mine260309@gmail.com>
---
v2:
 - Add notes for offset and update_interval
---
 Documentation/hwmon/w83773g | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/hwmon/w83773g

diff --git a/Documentation/hwmon/w83773g b/Documentation/hwmon/w83773g
new file mode 100644
index 0000000..4cc6c0b
--- /dev/null
+++ b/Documentation/hwmon/w83773g
@@ -0,0 +1,33 @@
+Kernel driver w83773g
+====================
+
+Supported chips:
+  * Nuvoton W83773G
+    Prefix: 'w83773g'
+    Addresses scanned: I2C 0x4c and 0x4d
+    Datasheet: https://www.nuvoton.com/resource-files/W83773G_SG_DatasheetV1_2.pdf
+
+Authors:
+	Lei YU <mine260309@gmail.com>
+
+Description
+-----------
+
+This driver implements support for Nuvoton W83773G temperature sensor
+chip. This chip implements one local and two remote sensors.
+The chip also features offsets for the two remote sensors which get added to
+the input readings. The chip does all the scaling by itself and the driver
+therefore reports true temperatures that don't need any user-space adjustments.
+Temperature is measured in degrees Celsius.
+The chip is wired over I2C/SMBus and specified over a temperature
+range of -40 to +125 degrees Celsius (for local sensor) and -40 to +127
+degrees Celsius (for remote sensors).
+Resolution for both the local and remote channels is 0.125 degree C.
+
+The chip supports only temperature measurement. The driver exports
+the temperature values via the following sysfs files:
+
+temp[1-3]_input
+temp[2-3]_fault
+temp[2-3]_offset
+update_interval
-- 
1.9.1

