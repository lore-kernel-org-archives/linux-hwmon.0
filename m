Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A5F1C433EF
	for <linux-hwmon@archiver.kernel.org>; Wed, 22 Dec 2021 02:01:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230448AbhLVCB6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 21 Dec 2021 21:01:58 -0500
Received: from out0.migadu.com ([94.23.1.103]:11996 "EHLO out0.migadu.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230210AbhLVCB6 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 21 Dec 2021 21:01:58 -0500
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1640138515;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=e/s8wWMhMoiHtqrhFGwLzdk9R03PTbP91HzXmfk/c4s=;
        b=g/RLt4mBdBwj0gnI6jDGaTuAye+8oxxufxKH/RmFAWfNM9vDqCWGMLCjbYYqwK1Gwh84Vw
        OxLZk/BqLR+b7FNyW08dkI7l1R0nErZZzibKR6nti+3/JXQqpylMcIMmqQJ7CnrpcukeBD
        EYKwr1MKkN39XuElLP5XwRaQL9eqHAg=
From:   Jackie Liu <liu.yun@linux.dev>
To:     linux@roeck-us.net
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org, liu.yun@linux.dev
Subject: [PATCH 5/5] hwmon: (drivetemp) Use devres function
Date:   Wed, 22 Dec 2021 10:01:14 +0800
Message-Id: <20211222020114.3524736-5-liu.yun@linux.dev>
In-Reply-To: <20211222020114.3524736-1-liu.yun@linux.dev>
References: <20211222020114.3524736-1-liu.yun@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Jackie Liu <liuyun01@kylinos.cn>

Use devm_hwmon_device_register_with_info() and remove hwmon_dev
from drivetemp_data struct as it is not needed anymore.

Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
---
 drivers/hwmon/drivetemp.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/drivetemp.c b/drivers/hwmon/drivetemp.c
index 1eb37106a220..1a5a62288c0a 100644
--- a/drivers/hwmon/drivetemp.c
+++ b/drivers/hwmon/drivetemp.c
@@ -113,7 +113,6 @@ struct drivetemp_data {
 	struct mutex lock;		/* protect data buffer accesses */
 	struct scsi_device *sdev;	/* SCSI device */
 	struct device *dev;		/* instantiating device */
-	struct device *hwdev;		/* hardware monitoring device */
 	u8 smartdata[ATA_SECT_SIZE];	/* local buffer */
 	int (*get_temp)(struct drivetemp_data *st, u32 attr, long *val);
 	bool have_temp_lowest;		/* lowest temp in SCT status */
@@ -555,6 +554,7 @@ static int drivetemp_add(struct device *dev, struct class_interface *intf)
 {
 	struct scsi_device *sdev = to_scsi_device(dev->parent);
 	struct drivetemp_data *st;
+	struct device *hwmon_dev;
 	int err;
 
 	st = kzalloc(sizeof(*st), GFP_KERNEL);
@@ -570,13 +570,13 @@ static int drivetemp_add(struct device *dev, struct class_interface *intf)
 		goto abort;
 	}
 
-	st->hwdev = hwmon_device_register_with_info(dev->parent, "drivetemp",
-						    st, &drivetemp_chip_info,
-						    NULL);
-	if (IS_ERR(st->hwdev)) {
-		err = PTR_ERR(st->hwdev);
+	hwmon_dev =
+		devm_hwmon_device_register_with_info(dev->parent, "drivetemp",
+						     st, &drivetemp_chip_info,
+						     NULL);
+	err = PTR_ERR_OR_ZERO(hwmon_dev);
+	if (err)
 		goto abort;
-	}
 
 	list_add(&st->list, &drivetemp_devlist);
 	return 0;
@@ -593,7 +593,6 @@ static void drivetemp_remove(struct device *dev, struct class_interface *intf)
 	list_for_each_entry_safe(st, tmp, &drivetemp_devlist, list) {
 		if (st->dev == dev) {
 			list_del(&st->list);
-			hwmon_device_unregister(st->hwdev);
 			kfree(st);
 			break;
 		}
-- 
2.25.1

