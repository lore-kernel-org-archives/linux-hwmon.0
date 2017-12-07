Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from casa.marquesmota.pt ([163.172.49.138]:42890 "EHLO
        casa.marquesmota.pt" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750919AbdLGVl2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 7 Dec 2017 16:41:28 -0500
Date: Thu, 7 Dec 2017 21:32:01 +0000
From: Paul Marques Mota <paul@marquesmota.pt>
To: linux-hwmon@vger.kernel.org
Message-ID: <20171207213201.rorchhbd63gzlekb@marquesmota.pt>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: Paul Marques Mota <paul@marquesmota.pt>
To: HARDWARE MONITORING <linux-hwmon@vger.kernel.org>
Date: Thu, 7 Dec 2017 20:04:22 +0000
Subject: [PATCH] add stack trace to deprecated hwmon_device_register()

Hi,

hwmon_device_register() in drivers/hwmon/hwmon.c prints the unhelpful
message below on my machine:

(NULL device *): hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().

Therefore, this patch dumps the stack at that point. In my case it is
then obvious in the resulting dmesg, available at

http://www.marquesmota.pt/dmesg.txt

that thermal_add_hwmon_sysfs() in drivers/thermal/thermal_hwmon.c needs
to be converted to the new API.

This patch is against 4.15.0-rc2
I believe it is also needed in Bugzilla bug #195843
https://bugzilla.kernel.org/show_bug.cgi?id=195843

Signed-off-by: Paul Marques Mota<paul@marquesmota.pt>

---
 drivers/hwmon/hwmon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index c9790e2c3440..31719ce4a681 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -702,6 +702,7 @@ struct device *hwmon_device_register(struct device *dev)
 {
 	dev_warn(dev,
 		 "hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().\n");
+	dump_stack();
 
 	return __hwmon_device_register(dev, NULL, NULL, NULL, NULL);
 }
-- 
2.15.1

