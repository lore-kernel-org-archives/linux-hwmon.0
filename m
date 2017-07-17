Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f45.google.com ([74.125.83.45]:33366 "EHLO
        mail-pg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751557AbdGQXJN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 17 Jul 2017 19:09:13 -0400
Received: by mail-pg0-f45.google.com with SMTP id k14so2134478pgr.0
        for <linux-hwmon@vger.kernel.org>; Mon, 17 Jul 2017 16:09:13 -0700 (PDT)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: zbr@ioremap.net, linux-kernel@vger.kernel.org, linux@roeck-us.net,
        jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        gregkh@linuxfoundation.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v5 1/3] drivers: w1: add hwmon support structures
Date: Mon, 17 Jul 2017 16:09:04 -0700
Message-Id: <20170717230906.4084-2-jaghu@google.com>
In-Reply-To: <20170717230906.4084-1-jaghu@google.com>
References: <20170717230906.4084-1-jaghu@google.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This patch has changes to w1.h/w1.c/w1_family.h generic files to
add (optional) hwmon support structures.

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

 drivers/w1/w1.c        | 18 +++++++++++++++++-
 drivers/w1/w1.h        |  2 ++
 drivers/w1/w1_family.h |  2 ++
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/w1/w1.c b/drivers/w1/w1.c
index e213c678bbfe..6485603131e8 100644
--- a/drivers/w1/w1.c
+++ b/drivers/w1/w1.c
@@ -32,6 +32,7 @@
 #include <linux/sched.h>
 #include <linux/kthread.h>
 #include <linux/freezer.h>
+#include <linux/hwmon.h>

 #include <linux/atomic.h>

@@ -659,9 +660,24 @@ static int w1_family_notify(unsigned long action, struct w1_slave *sl)
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
diff --git a/drivers/w1/w1.h b/drivers/w1/w1.h
index 129895f562b0..74ef1a543856 100644
--- a/drivers/w1/w1.h
+++ b/drivers/w1/w1.h
@@ -83,6 +83,7 @@ struct w1_reg_num
  * @family: module for device family type
  * @family_data: pointer for use by the family module
  * @dev: kernel device identifier
+ * @hwmon: pointer to hwmon device
  *
  */
 struct w1_slave
@@ -99,6 +100,7 @@ struct w1_slave
 	struct w1_family	*family;
 	void			*family_data;
 	struct device		dev;
+	struct device		*hwmon;
 };

 typedef void (*w1_slave_found_callback)(struct w1_master *, u64);
diff --git a/drivers/w1/w1_family.h b/drivers/w1/w1_family.h
index 10a7a0767187..9001851e1316 100644
--- a/drivers/w1/w1_family.h
+++ b/drivers/w1/w1_family.h
@@ -55,12 +55,14 @@ struct w1_slave;
  * @add_slave: add_slave
  * @remove_slave: remove_slave
  * @groups: sysfs group
+ * @chip_info: pointer to struct hwmon_chip_info
  */
 struct w1_family_ops
 {
 	int  (* add_slave)(struct w1_slave *);
 	void (* remove_slave)(struct w1_slave *);
 	const struct attribute_group **groups;
+	const struct hwmon_chip_info *chip_info;
 };

 /**
--
2.13.2.932.g7449e964c-goog

