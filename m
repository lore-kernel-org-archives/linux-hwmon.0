Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A51C433EF
	for <linux-hwmon@archiver.kernel.org>; Wed, 22 Dec 2021 02:01:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230343AbhLVCBz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 21 Dec 2021 21:01:55 -0500
Received: from out0.migadu.com ([94.23.1.103]:11951 "EHLO out0.migadu.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230210AbhLVCBz (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 21 Dec 2021 21:01:55 -0500
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1640138512;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZccmkXtnH4aobQEbME8NCoruUadQLPR6pL7VZzHnVGQ=;
        b=QtZia2ll2uM21Xucy6gBd9+jNYlvXoKpiIeec9YnhMMdYscmWpavyCjoYeeOq7mKUzvy63
        z4uUCI/6nWQZTS0EEwH12bOx2ef02Xz2xqXrY3Py4i6tsYL7mHW6K0iwExCNXarrtxax0/
        TZLX2/fJFTTLGRG4thYMvknjKAazLe4=
From:   Jackie Liu <liu.yun@linux.dev>
To:     linux@roeck-us.net
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org, liu.yun@linux.dev
Subject: [PATCH 3/5] hwmon: (corsair-psu) Use devres function
Date:   Wed, 22 Dec 2021 10:01:12 +0800
Message-Id: <20211222020114.3524736-3-liu.yun@linux.dev>
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
from corsairpsu_data struct as it is not needed anymore.

Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
---
 drivers/hwmon/corsair-psu.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
index 14389fd7afb8..1a40cde246aa 100644
--- a/drivers/hwmon/corsair-psu.c
+++ b/drivers/hwmon/corsair-psu.c
@@ -115,7 +115,6 @@ static const char *const label_amps[] = {
 
 struct corsairpsu_data {
 	struct hid_device *hdev;
-	struct device *hwmon_dev;
 	struct dentry *debugfs;
 	struct completion wait_completion;
 	struct mutex lock; /* for locking access to cmd_buffer */
@@ -684,6 +683,7 @@ static void corsairpsu_debugfs_init(struct corsairpsu_data *priv)
 static int corsairpsu_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
 	struct corsairpsu_data *priv;
+	struct device *hwmon_dev;
 	int ret;
 
 	priv = devm_kzalloc(&hdev->dev, sizeof(struct corsairpsu_data), GFP_KERNEL);
@@ -728,13 +728,13 @@ static int corsairpsu_probe(struct hid_device *hdev, const struct hid_device_id
 	corsairpsu_get_criticals(priv);
 	corsairpsu_check_cmd_support(priv);
 
-	priv->hwmon_dev = hwmon_device_register_with_info(&hdev->dev, "corsairpsu", priv,
-							  &corsairpsu_chip_info, NULL);
-
-	if (IS_ERR(priv->hwmon_dev)) {
-		ret = PTR_ERR(priv->hwmon_dev);
+	hwmon_dev =
+		devm_hwmon_device_register_with_info(&hdev->dev, "corsairpsu",
+						     priv, &corsairpsu_chip_info,
+						     NULL);
+	ret = PTR_ERR_OR_ZERO(hwmon_dev);
+	if (ret)
 		goto fail_and_close;
-	}
 
 	corsairpsu_debugfs_init(priv);
 
@@ -752,7 +752,6 @@ static void corsairpsu_remove(struct hid_device *hdev)
 	struct corsairpsu_data *priv = hid_get_drvdata(hdev);
 
 	debugfs_remove_recursive(priv->debugfs);
-	hwmon_device_unregister(priv->hwmon_dev);
 	hid_hw_close(hdev);
 	hid_hw_stop(hdev);
 }
-- 
2.25.1

