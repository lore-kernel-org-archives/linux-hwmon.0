Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail1.bemta3.messagelabs.com ([195.245.230.168]:15774 "EHLO
        mail1.bemta3.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751950AbdHCJn5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 3 Aug 2017 05:43:57 -0400
Received: from abgdgate60u.abg.fsc.net ([172.25.138.90])
        by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id v739ht0S018846
        for <linux-hwmon@vger.kernel.org>; Thu, 3 Aug 2017 10:43:55 +0100
From: Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com>
To: linux-hwmon@vger.kernel.org
Cc: Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com>
Subject: [PATCH] ftsteutates: fix clear alarm sysfs entries
Date: Thu,  3 Aug 2017 11:43:51 +0200
Message-Id: <20170803094351.10325-1-thilo.cestonaro@ts.fujitsu.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

sysfs store functions should return the "written" bytes.
Returning zero ends in an endless loop, so fix this by
returning the count of bytes got.

Signed-off-by: Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com>
---
 Documentation/hwmon/ftsteutates | 4 ++++
 drivers/hwmon/ftsteutates.c     | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/hwmon/ftsteutates b/Documentation/hwmon/ftsteutates
index 8c10a916de20..6b5992f6072a 100644
--- a/Documentation/hwmon/ftsteutates
+++ b/Documentation/hwmon/ftsteutates
@@ -21,3 +21,7 @@ implemented in this driver.
 Specification of the chip can be found here:
 ftp://ftp.ts.fujitsu.com/pub/Mainboard-OEM-Sales/Services/Software&Tools/Linux_SystemMonitoring&Watchdog&GPIO/BMC-Teutates_Specification_V1.21.pdf
 ftp://ftp.ts.fujitsu.com/pub/Mainboard-OEM-Sales/Services/Software&Tools/Linux_SystemMonitoring&Watchdog&GPIO/Fujitsu_mainboards-1-Sensors_HowTo-en-US.pdf
+
+to clear a temprature or fan alarm execute the following command with the
+correct path to the alarm file:
+echo 0 >XXXX_alarm
diff --git a/drivers/hwmon/ftsteutates.c b/drivers/hwmon/ftsteutates.c
index 0f0277e7aae5..a0fb9e9291f0 100644
--- a/drivers/hwmon/ftsteutates.c
+++ b/drivers/hwmon/ftsteutates.c
@@ -435,6 +435,7 @@ clear_temp_alarm(struct device *dev, struct device_attribute *devattr,
 		goto error;
 
 	data->valid = false;
+	ret = count;
 error:
 	mutex_unlock(&data->update_lock);
 	return ret;
@@ -508,6 +509,7 @@ clear_fan_alarm(struct device *dev, struct device_attribute *devattr,
 		goto error;
 
 	data->valid = false;
+	ret = count;
 error:
 	mutex_unlock(&data->update_lock);
 	return ret;
-- 
2.11.0

