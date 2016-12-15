Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33176 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753614AbcLOSK1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 15 Dec 2016 13:10:27 -0500
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
        Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: [PATCH] hwmon: sch56xx: Remove unneeded linux/miscdevice.h include
Date: Thu, 15 Dec 2016 19:08:14 +0100
Message-Id: <20161215180814.24060-1-clabbe.montjoie@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

drivers/hwmon/sch56xx-common.c does not contain any miscdevice so the
inclusion of linux/miscdevice.h is uncessary.

Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
---
 drivers/hwmon/sch56xx-common.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwmon/sch56xx-common.c b/drivers/hwmon/sch56xx-common.c
index 68c350c..bda3d52 100644
--- a/drivers/hwmon/sch56xx-common.c
+++ b/drivers/hwmon/sch56xx-common.c
@@ -28,7 +28,6 @@
 #include <linux/delay.h>
 #include <linux/fs.h>
 #include <linux/watchdog.h>
-#include <linux/miscdevice.h>
 #include <linux/uaccess.h>
 #include <linux/slab.h>
 #include "sch56xx-common.h"
-- 
2.10.2

