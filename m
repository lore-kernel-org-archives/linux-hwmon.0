Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9516C433EF
	for <linux-hwmon@archiver.kernel.org>; Wed, 22 Dec 2021 02:01:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230307AbhLVCBx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 21 Dec 2021 21:01:53 -0500
Received: from out0.migadu.com ([94.23.1.103]:11913 "EHLO out0.migadu.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230006AbhLVCBw (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 21 Dec 2021 21:01:52 -0500
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1640138509;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=9WFarIFkb46zPyfv7s5glVYigR5K6Gijq2u+akslseU=;
        b=ulO9S+vzV2Yk5GwtibUBBldWOgZbdpNcL1//xXdZG2/FBAxI/bomBEb4ZQOwWeUIkh+LLV
        FzoFJBqUcKKHy5dGzTKOonIdJlNX8Rne52hZiIcAwy+0LTpIsF1TpWP2z/RBjkPads/uJI
        ggBICvmPmuu6GTJvAwE/lZPK8zL+F28=
From:   Jackie Liu <liu.yun@linux.dev>
To:     linux@roeck-us.net
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org, liu.yun@linux.dev
Subject: [PATCH 1/5] hwmon: (corsair-cpro) Use devres function
Date:   Wed, 22 Dec 2021 10:01:10 +0800
Message-Id: <20211222020114.3524736-1-liu.yun@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Jackie Liu <liuyun01@kylinos.cn>

Use devm_hwmon_device_register_with_info() and remove hwmon_dev
from ccp_device struct as it is not needed anymore.

Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
---
 drivers/hwmon/corsair-cpro.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/corsair-cpro.c b/drivers/hwmon/corsair-cpro.c
index fa6aa4fc8b52..f476367ba6cf 100644
--- a/drivers/hwmon/corsair-cpro.c
+++ b/drivers/hwmon/corsair-cpro.c
@@ -76,7 +76,6 @@
 
 struct ccp_device {
 	struct hid_device *hdev;
-	struct device *hwmon_dev;
 	struct completion wait_input_report;
 	struct mutex mutex; /* whenever buffer is used, lock before send_usb_cmd */
 	u8 *buffer;
@@ -486,6 +485,7 @@ static int get_temp_cnct(struct ccp_device *ccp)
 static int ccp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
 	struct ccp_device *ccp;
+	struct device *hwmon_dev;
 	int ret;
 
 	ccp = devm_kzalloc(&hdev->dev, sizeof(*ccp), GFP_KERNEL);
@@ -523,12 +523,12 @@ static int ccp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	ret = get_fan_cnct(ccp);
 	if (ret)
 		goto out_hw_close;
-	ccp->hwmon_dev = hwmon_device_register_with_info(&hdev->dev, "corsaircpro",
-							 ccp, &ccp_chip_info, 0);
-	if (IS_ERR(ccp->hwmon_dev)) {
-		ret = PTR_ERR(ccp->hwmon_dev);
+	hwmon_dev =
+		devm_hwmon_device_register_with_info(&hdev->dev, "corsaircpro",
+						     ccp, &ccp_chip_info, 0);
+	ret = PTR_ERR_OR_ZERO(hwmon_dev);
+	if (ret)
 		goto out_hw_close;
-	}
 
 	return 0;
 
@@ -541,9 +541,6 @@ static int ccp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
 static void ccp_remove(struct hid_device *hdev)
 {
-	struct ccp_device *ccp = hid_get_drvdata(hdev);
-
-	hwmon_device_unregister(ccp->hwmon_dev);
 	hid_hw_close(hdev);
 	hid_hw_stop(hdev);
 }
-- 
2.25.1

