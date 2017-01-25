Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:55767 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751372AbdAYJ2H (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 Jan 2017 04:28:07 -0500
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2] hwmon: Update documentation to clarify rules for the 'name' attribute
Date: Wed, 25 Jan 2017 01:28:02 -0800
Message-Id: <1485336482-14381-1-git-send-email-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Clarify that the name attribute must report a valid name, and the rules
for valid names. Also clarify that the name parameter must be provided
for all supported API functions.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: '.' is an acceptable character in the 'name' attribute.

 Documentation/hwmon/hwmon-kernel-api.txt | 4 ++++
 Documentation/hwmon/sysfs-interface      | 5 +++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/hwmon-kernel-api.txt b/Documentation/hwmon/hwmon-kernel-api.txt
index 2505ae67e2b6..53a806696c64 100644
--- a/Documentation/hwmon/hwmon-kernel-api.txt
+++ b/Documentation/hwmon/hwmon-kernel-api.txt
@@ -89,6 +89,10 @@ the call to devm_hwmon_device_register_with_groups or
 hwmon_device_register_with_info and if the automatic (device managed)
 removal would be too late.
 
+All supported hwmon device registration functions only accept valid device
+names. Device names including invalid characters (whitespace, '*', or '-')
+will be rejected. The 'name' parameter is mandatory.
+
 Using devm_hwmon_device_register_with_info()
 --------------------------------------------
 
diff --git a/Documentation/hwmon/sysfs-interface b/Documentation/hwmon/sysfs-interface
index 2cc95ad46604..fc337c317c67 100644
--- a/Documentation/hwmon/sysfs-interface
+++ b/Documentation/hwmon/sysfs-interface
@@ -86,8 +86,9 @@ given driver if the chip has the feature.
 
 name		The chip name.
 		This should be a short, lowercase string, not containing
-		spaces nor dashes, representing the chip name. This is
-		the only mandatory attribute.
+		whitespace, dashes, or the wildcard character '*'.
+		This attribute represents the chip name. It is the only
+		mandatory attribute.
 		I2C devices get this attribute created automatically.
 		RO
 
-- 
2.7.4

