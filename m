Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f174.google.com ([209.85.192.174]:34871 "EHLO
        mail-pf0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751285AbdH3Xek (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 Aug 2017 19:34:40 -0400
Received: by mail-pf0-f174.google.com with SMTP id g13so23410870pfm.2
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Aug 2017 16:34:40 -0700 (PDT)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: zbr@ioremap.net, linux-kernel@vger.kernel.org, linux@roeck-us.net,
        jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        gregkh@linuxfoundation.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v6 1/3] drivers: w1: add hwmon support structures
Date: Wed, 30 Aug 2017 16:34:33 -0700
Message-Id: <20170830233435.16500-2-jaghu@google.com>
In-Reply-To: <20170830233435.16500-1-jaghu@google.com>
References: <20170830233435.16500-1-jaghu@google.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This patch has changes to w1.h/w1.c generic files to add (optional) hwmon
support structures.

Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Acked-by: Evgeniy Polyakov <zbr@ioremap.net>
Acked-by: Guenter Roeck <linux@roeck-us.net>
---
v2
- made changes to support hwmon_device_register_with_info mentioned by Guenter.

v3
- used IS_REACHABLE(CONFIG_HWMON).
- removed hwmon device first before removing slave.

v4
- moved && to be in the previous line.

v5
- no change.

v6
-rebased on top of char-misc-next branch.

 drivers/w1/w1.c    | 18 +++++++++++++++++-
 include/linux/w1.h |  4 ++++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/w1/w1.c b/drivers/w1/w1.c
index 3c76e1ca4b83..0c2a5a8327bd 100644
--- a/drivers/w1/w1.c
+++ b/drivers/w1/w1.c
@@ -25,6 +25,7 @@
 #include <linux/sched.h>
 #include <linux/kthread.h>
 #include <linux/freezer.h>
+#include <linux/hwmon.h>

 #include <linux/atomic.h>

@@ -649,9 +650,24 @@ static int w1_family_notify(unsigned long action, struct w1_slave *sl)
 				return err;
 			}
 		}
-
+		if (IS_REACHABLE(CONFIG_HWMON) && fops->chip_info) {
+			struct device *hwmon
+				= hwmon_device_register_with_info(&sl->dev,
+						"w1_slave_temp", sl,
+						fops->chip_info,
+						NULL);
+			if (IS_ERR(hwmon)) {
+				dev_warn(&sl->dev,
+					 "could not create hwmon device\n");
+			} else {
+				sl->hwmon = hwmon;
+			}
+		}
 		break;
 	case BUS_NOTIFY_DEL_DEVICE:
+		if (IS_REACHABLE(CONFIG_HWMON) && fops->chip_info &&
+			    sl->hwmon)
+			hwmon_device_unregister(sl->hwmon);
 		if (fops->remove_slave)
 			sl->family->fops->remove_slave(sl);
 		if (fops->groups)
diff --git a/include/linux/w1.h b/include/linux/w1.h
index 90cbe7e65059..5b2972946dda 100644
--- a/include/linux/w1.h
+++ b/include/linux/w1.h
@@ -68,6 +68,7 @@ struct w1_reg_num {
  * @family: module for device family type
  * @family_data: pointer for use by the family module
  * @dev: kernel device identifier
+ * @hwmon: pointer to hwmon device
  *
  */
 struct w1_slave {
@@ -83,6 +84,7 @@ struct w1_slave {
 	struct w1_family	*family;
 	void			*family_data;
 	struct device		dev;
+	struct device		*hwmon;
 };

 typedef void (*w1_slave_found_callback)(struct w1_master *, u64);
@@ -250,11 +252,13 @@ void w1_remove_master_device(struct w1_bus_master *master);
  * @add_slave: add_slave
  * @remove_slave: remove_slave
  * @groups: sysfs group
+ * @chip_info: pointer to struct hwmon_chip_info
  */
 struct w1_family_ops {
 	int  (*add_slave)(struct w1_slave *sl);
 	void (*remove_slave)(struct w1_slave *sl);
 	const struct attribute_group **groups;
+	const struct hwmon_chip_info *chip_info;
 };

 /**
--
2.14.1.581.gf28d330327-goog

