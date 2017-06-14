Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f41.google.com ([74.125.83.41]:34568 "EHLO
        mail-pg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752546AbdFNWAC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 14 Jun 2017 18:00:02 -0400
Received: by mail-pg0-f41.google.com with SMTP id v18so5851068pgb.1
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Jun 2017 15:00:01 -0700 (PDT)
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
To: zbr@ioremap.net, linux-kernel@vger.kernel.org, linux@roeck-us.net,
        jdelvare@suse.com, linux-hwmon@vger.kernel.org
Cc: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Subject: [PATCH linux v1 1/3] drivers: w1: add hwmon support structures
Date: Wed, 14 Jun 2017 14:59:42 -0700
Message-Id: <20170614215944.24984-2-jaghu@google.com>
In-Reply-To: <20170614215944.24984-1-jaghu@google.com>
References: <20170614215944.24984-1-jaghu@google.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This patch has changes to w1.h/w1.c/w1_family.h generic files to
add (optional) hwmon support structures

Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Change-Id: I17f7c670e5cd7a3826add720ffa928c3e1aa0abc
---
 drivers/w1/w1.c        | 20 +++++++++++++++++++-
 drivers/w1/w1.h        |  2 ++
 drivers/w1/w1_family.h |  2 ++
 3 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/w1/w1.c b/drivers/w1/w1.c
index e213c678bbfe..e3efabccd284 100644
--- a/drivers/w1/w1.c
+++ b/drivers/w1/w1.c
@@ -32,6 +32,7 @@
 #include <linux/sched.h>
 #include <linux/kthread.h>
 #include <linux/freezer.h>
+#include <linux/hwmon.h>

 #include <linux/atomic.h>

@@ -659,13 +660,30 @@ static int w1_family_notify(unsigned long action, struct w1_slave *sl)
 				return err;
 			}
 		}
-
+#ifdef CONFIG_HWMON
+		if (fops->hwmon_groups && sl->hwmon) {
+			struct device *hwmon
+				= hwmon_device_register_with_groups(&sl->dev,
+						"w1_slave_temp", sl,
+						fops->hwmon_groups);
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
+		if (fops->hwmon_groups && sl->hwmon)
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
index 10a7a0767187..fc582df5c28e 100644
--- a/drivers/w1/w1_family.h
+++ b/drivers/w1/w1_family.h
@@ -55,12 +55,14 @@ struct w1_slave;
  * @add_slave: add_slave
  * @remove_slave: remove_slave
  * @groups: sysfs group
+ * @hwmon_groups: hwmon sysfs group
  */
 struct w1_family_ops
 {
 	int  (* add_slave)(struct w1_slave *);
 	void (* remove_slave)(struct w1_slave *);
 	const struct attribute_group **groups;
+	const struct attribute_group **hwmon_groups;
 };

 /**
--
2.13.1.508.gb3defc5cc-goog

