Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74E45C433F5
	for <linux-hwmon@archiver.kernel.org>; Wed, 22 Dec 2021 02:01:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbhLVCBy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 21 Dec 2021 21:01:54 -0500
Received: from out0.migadu.com ([94.23.1.103]:11933 "EHLO out0.migadu.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230210AbhLVCBx (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 21 Dec 2021 21:01:53 -0500
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1640138511;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LRuXKFWkjL8j3gFDR44WSaWloFd3Q/uJeWSrVnXQS0I=;
        b=BfMHboCO6Qf6aSnfPxl6BAzNWPZmwKg/p1bi8oDsNOBFPiscNTBimY2Mds1zmIQAXFYlY9
        sHIx5Fe5dntqvoMPM+A/jp21osoyPYUoesbNbsW8G+xqHA9UErB5LJx7nKUALiW7Qt8Iu1
        ug4TTzSX5gOb22RsbUSgJzX0qoqhFBE=
From:   Jackie Liu <liu.yun@linux.dev>
To:     linux@roeck-us.net
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org, liu.yun@linux.dev
Subject: [PATCH 2/5] hwmon: (nzxt-kraken2) Use devres function
Date:   Wed, 22 Dec 2021 10:01:11 +0800
Message-Id: <20211222020114.3524736-2-liu.yun@linux.dev>
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
from kraken2_priv_data struct as it is not needed anymore.

Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
---
 drivers/hwmon/nzxt-kraken2.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/nzxt-kraken2.c b/drivers/hwmon/nzxt-kraken2.c
index 89f7ea4f42d4..cd644ca12fb4 100644
--- a/drivers/hwmon/nzxt-kraken2.c
+++ b/drivers/hwmon/nzxt-kraken2.c
@@ -29,7 +29,6 @@ static const char *const kraken2_fan_label[] = {
 
 struct kraken2_priv_data {
 	struct hid_device *hid_dev;
-	struct device *hwmon_dev;
 	s32 temp_input[1];
 	u16 fan_input[2];
 	unsigned long updated; /* jiffies */
@@ -133,6 +132,7 @@ static int kraken2_probe(struct hid_device *hdev,
 			 const struct hid_device_id *id)
 {
 	struct kraken2_priv_data *priv;
+	struct device *hwmon_dev;
 	int ret;
 
 	priv = devm_kzalloc(&hdev->dev, sizeof(*priv), GFP_KERNEL);
@@ -170,11 +170,12 @@ static int kraken2_probe(struct hid_device *hdev,
 		goto fail_and_close;
 	}
 
-	priv->hwmon_dev = hwmon_device_register_with_info(&hdev->dev, "kraken2",
-							  priv, &kraken2_chip_info,
-							  NULL);
-	if (IS_ERR(priv->hwmon_dev)) {
-		ret = PTR_ERR(priv->hwmon_dev);
+	hwmon_dev =
+		devm_hwmon_device_register_with_info(&hdev->dev, "kraken2",
+						     priv, &kraken2_chip_info,
+						     NULL);
+	ret = PTR_ERR_OR_ZERO(hwmon_dev);
+	if (ret) {
 		hid_err(hdev, "hwmon registration failed with %d\n", ret);
 		goto fail_and_close;
 	}
@@ -190,10 +191,6 @@ static int kraken2_probe(struct hid_device *hdev,
 
 static void kraken2_remove(struct hid_device *hdev)
 {
-	struct kraken2_priv_data *priv = hid_get_drvdata(hdev);
-
-	hwmon_device_unregister(priv->hwmon_dev);
-
 	hid_hw_close(hdev);
 	hid_hw_stop(hdev);
 }
-- 
2.25.1

