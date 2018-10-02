Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:34827 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725951AbeJBQBu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 2 Oct 2018 12:01:50 -0400
From: Cao Van Dong <cv-dong@jinso.co.jp>
To: broonie@kernel.org, geert+renesas@glider.be,
        linux-hwmon@vger.kernel.org
Cc: kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        linux-renesas-soc@vger.kernel.org, h-inayoshi@jinso.co.jp,
        nv-dung@jinso.co.jp, na-hoan@jinso.co.jp, cv-dong@jinso.co.jp
Subject: [PATCH] hwmon: Fix the 'No sensors found' error after replacing the parameter NULL by the actual device
Date: Tue,  2 Oct 2018 17:35:24 +0900
Message-Id: <1538469324-8028-1-git-send-email-cv-dong@jinso.co.jp>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org


In __hwmon_device_register() function of hwmon.c, we have assigned 'dev' directly to 'hdev->parent'. 
Formerly, when registering the hwmon device, we pass NULL as the device. This is not affected.
Recently, the developer has replaced the parameter NULL as the device by the actual device.
This causes the "No sensors found" error. This patch is to fix this error.

This patch is based on the v4.19-rc3 tag.

---
 drivers/hwmon/hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 33d5128..7c8d3cb 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -610,7 +610,7 @@ __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
 
 	hwdev->name = name;
 	hdev->class = &hwmon_class;
-	hdev->parent = dev;
+	hdev->parent = dev->parent;
 	hdev->of_node = dev ? dev->of_node : NULL;
 	hwdev->chip = chip;
 	dev_set_drvdata(hdev, drvdata);
-- 
2.7.4
