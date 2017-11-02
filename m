Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:57114 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750753AbdKBGhN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 2 Nov 2017 02:37:13 -0400
From: Lei YU <mine260309@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc: Lei YU <mine260309@gmail.com>, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 2/2] hwmon: (w83773g) Add documentation
Date: Thu,  2 Nov 2017 14:36:48 +0800
Message-Id: <1509604608-20049-1-git-send-email-mine260309@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Add documentation for the w83773g driver.

Signed-off-by: Lei YU <mine260309@gmail.com>
---
 Documentation/hwmon/w83773g | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/hwmon/w83773g

diff --git a/Documentation/hwmon/w83773g b/Documentation/hwmon/w83773g
new file mode 100644
index 0000000..da28731
--- /dev/null
+++ b/Documentation/hwmon/w83773g
@@ -0,0 +1,28 @@
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
-- 
1.9.1

