Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46991 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725979AbeJXLZZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 24 Oct 2018 07:25:25 -0400
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: jdelvare@suse.com, linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] hwmon: (core) Inherit power properties to hdev
Date: Tue, 23 Oct 2018 19:36:19 -0700
Message-Id: <20181024023623.4231-2-nicoleotsuka@gmail.com>
In-Reply-To: <20181024023623.4231-1-nicoleotsuka@gmail.com>
References: <20181024023623.4231-1-nicoleotsuka@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The new hdev is a child device related to the original parent
hwmon driver and its device. However, it doesn't support the
power features, typically being defined in the parent driver.

So this patch inherits three necessary power properties from
the parent dev to hdev: power, pm_domain and driver pointers.

Note that the dev->driver pointer is the place that contains
a dev_pm_ops pointer defined in the parent device driver and
the pm runtime core also checks this pointer:
       if (!cb && dev->driver && dev->driver->pm)

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
Changelog
v1->v2:
 * Added device pointer check

 drivers/hwmon/hwmon.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 975c95169884..14cfab64649f 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -625,7 +625,12 @@ __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
 	hwdev->name = name;
 	hdev->class = &hwmon_class;
 	hdev->parent = dev;
-	hdev->of_node = dev ? dev->of_node : NULL;
+	if (dev) {
+		hdev->driver = dev->driver;
+		hdev->power = dev->power;
+		hdev->pm_domain = dev->pm_domain;
+		hdev->of_node = dev->of_node;
+	}
 	hwdev->chip = chip;
 	dev_set_drvdata(hdev, drvdata);
 	dev_set_name(hdev, HWMON_ID_FORMAT, id);
-- 
2.17.1
