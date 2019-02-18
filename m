Return-Path: <SRS0=HSB5=QZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 740DAC43381
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Feb 2019 19:54:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 46EB2217F5
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Feb 2019 19:54:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbfBRTys (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Feb 2019 14:54:48 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:37045 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725535AbfBRTyr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Feb 2019 14:54:47 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 18 Feb 2019 21:54:41 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id x1IJsfAg025628;
        Mon, 18 Feb 2019 21:54:41 +0200
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org, Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH v2 hwmon] hwmon: (pmbus) Fix driver info initialization in probe routine
Date:   Mon, 18 Feb 2019 19:54:40 +0000
Message-Id: <20190218195440.19680-1-vadimp@mellanox.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Fix tps53679_probe() by using dynamically allocated "pmbus_driver_info"
structure instead of static. Usage of static structures causes
overwritten of the field "vrm_version", in case the system is equipped
with several tps53679 devices with the different "vrm_version".
In such case the last probed device overwrites this field for all
others.

Fixes: 610526527a13 ("hwmon: (pmbus) Add support for Texas Instruments tps53679 device")
Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
v1->v2:
 Comments pointed out by Guenter:
 - Use devm_kmemdup().
---
 drivers/hwmon/pmbus/tps53679.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.c
index 85b515cd9df0..2bc352c5357f 100644
--- a/drivers/hwmon/pmbus/tps53679.c
+++ b/drivers/hwmon/pmbus/tps53679.c
@@ -80,7 +80,14 @@ static struct pmbus_driver_info tps53679_info = {
 static int tps53679_probe(struct i2c_client *client,
 			  const struct i2c_device_id *id)
 {
-	return pmbus_do_probe(client, id, &tps53679_info);
+	struct pmbus_driver_info *info;
+
+	info = devm_kmemdup(&client->dev, &tps53679_info, sizeof(*info),
+			    GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	return pmbus_do_probe(client, id, info);
 }
 
 static const struct i2c_device_id tps53679_id[] = {
-- 
2.11.0

