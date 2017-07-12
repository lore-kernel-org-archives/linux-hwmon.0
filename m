Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f176.google.com ([209.85.192.176]:36201 "EHLO
        mail-pf0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754484AbdGLVlY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 12 Jul 2017 17:41:24 -0400
Received: by mail-pf0-f176.google.com with SMTP id q86so18962805pfl.3
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Jul 2017 14:41:24 -0700 (PDT)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: zbr@ioremap.net, linux-kernel@vger.kernel.org, linux@roeck-us.net,
        jdelvare@suse.com, linux-hwmon@vger.kernel.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v2 1/3] drivers: w1: add hwmon support structures
Date: Wed, 12 Jul 2017 14:41:16 -0700
Message-Id: <20170712214118.4306-2-jaghu@google.com>
In-Reply-To: <20170712214118.4306-1-jaghu@google.com>
References: <20170712214118.4306-1-jaghu@google.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This patch has changes to w1.h/w1.c/w1_family.h generic files to
add (optional) hwmon support structures.

Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Acked-by: Evgeniy Polyakov <zbr@ioremap.net>
---
v2
- made changes to support hwmon_device_register_with_info mentioned by Guenter.

 drivers/w1/w1.c        | 21 ++++++++++++++++++++-
 drivers/w1/w1.h        |  2 ++
 drivers/w1/w1_family.h |  2 ++
 3 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/w1/w1.c b/drivers/w1/w1.c
index e213c678bbfe..c37e21597c5c 100644
--- a/drivers/w1/w1.c
+++ b/drivers/w1/w1.c
@@ -32,6 +32,7 @@
 #include <linux/sched.h>
 #include <linux/kthread.h>
 #include <linux/freezer.h>
+#include <linux/hwmon.h>

 #include <linux/atomic.h>

@@ -659,13 +660,31 @@ static int w1_family_notify(unsigned long action, struct w1_slave *sl)
 				return err;
 			}
 		}
-
+#ifdef CONFIG_HWMON
+		if (fops->chip_info) {
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
+#endif
 		break;
 	case BUS_NOTIFY_DEL_DEVICE:
 		if (fops->remove_slave)
 			sl->family->fops->remove_slave(sl);
 		if (fops->groups)
 			sysfs_remove_groups(&sl->dev.kobj, fops->groups);
+#ifdef CONFIG_HWMON
+		if (fops->chip_info && sl->hwmon)
+			hwmon_device_unregister(sl->hwmon);
+#endif
 		break;
 	}
 	return 0;
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

