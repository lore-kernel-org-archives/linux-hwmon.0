Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7183EC433FE
	for <linux-hwmon@archiver.kernel.org>; Wed, 22 Dec 2021 02:01:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230521AbhLVCB5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 21 Dec 2021 21:01:57 -0500
Received: from out0.migadu.com ([94.23.1.103]:11976 "EHLO out0.migadu.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230210AbhLVCB4 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 21 Dec 2021 21:01:56 -0500
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1640138514;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2crd4ul8M6HtLGkJ4P0+5pjVRxPcMa0/m2xzUSNcKN8=;
        b=AhkQmDgUhJr2k/LgO8Nrek/M2FK0cRRLiJig7JyLQ0S//zr3KaYCkIRm97W/jGKqGZvd2V
        cedL8vBiQo45cXqFx4wOHYl4sBz0zRgN/Al92Nlqfa9quo3gxwiuIx7gIaM/9Ww0Fpo7rL
        av4WDEQ16BNe1R9fkou7/HHwuJiNGTA=
From:   Jackie Liu <liu.yun@linux.dev>
To:     linux@roeck-us.net
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org, liu.yun@linux.dev
Subject: [PATCH 4/5] hwmon: (d5next) Use devres function
Date:   Wed, 22 Dec 2021 10:01:13 +0800
Message-Id: <20211222020114.3524736-4-liu.yun@linux.dev>
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
from d5next_data struct as it is not needed anymore.

Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
---
 drivers/hwmon/aquacomputer_d5next.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/aquacomputer_d5next.c b/drivers/hwmon/aquacomputer_d5next.c
index fb9341a53051..4f6f11169a53 100644
--- a/drivers/hwmon/aquacomputer_d5next.c
+++ b/drivers/hwmon/aquacomputer_d5next.c
@@ -84,7 +84,6 @@ static const char *const label_current[] = {
 
 struct d5next_data {
 	struct hid_device *hdev;
-	struct device *hwmon_dev;
 	struct dentry *debugfs;
 	s32 temp_input;
 	u16 speed_input[2];
@@ -275,6 +274,7 @@ static void d5next_debugfs_init(struct d5next_data *priv)
 static int d5next_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
 	struct d5next_data *priv;
+	struct device *hwmon_dev;
 	int ret;
 
 	priv = devm_kzalloc(&hdev->dev, sizeof(*priv), GFP_KERNEL);
@@ -298,13 +298,12 @@ static int d5next_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	if (ret)
 		goto fail_and_stop;
 
-	priv->hwmon_dev = hwmon_device_register_with_info(&hdev->dev, "d5next", priv,
-							  &d5next_chip_info, NULL);
-
-	if (IS_ERR(priv->hwmon_dev)) {
-		ret = PTR_ERR(priv->hwmon_dev);
+	hwmon_dev =
+		devm_hwmon_device_register_with_info(&hdev->dev, "d5next", priv,
+						     &d5next_chip_info, NULL);
+	ret = PTR_ERR_OR_ZERO(hwmon_dev);
+	if (ret)
 		goto fail_and_close;
-	}
 
 	d5next_debugfs_init(priv);
 
@@ -322,7 +321,6 @@ static void d5next_remove(struct hid_device *hdev)
 	struct d5next_data *priv = hid_get_drvdata(hdev);
 
 	debugfs_remove_recursive(priv->debugfs);
-	hwmon_device_unregister(priv->hwmon_dev);
 
 	hid_hw_close(hdev);
 	hid_hw_stop(hdev);
-- 
2.25.1

