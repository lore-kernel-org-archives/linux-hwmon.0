Return-Path: <SRS0=3Vjf=VI=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E2CC74A54
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Jul 2019 12:54:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5D06221019
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 Jul 2019 12:54:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbfGKMy1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 11 Jul 2019 08:54:27 -0400
Received: from mail.bugwerft.de ([46.23.86.59]:35064 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728182AbfGKMy1 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 11 Jul 2019 08:54:27 -0400
Received: from localhost.localdomain (pD95EF75A.dip0.t-ipconnect.de [217.94.247.90])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 66A78292161;
        Thu, 11 Jul 2019 12:41:53 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     linux-hwmon@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux@roeck-us.net, jdelvare@suse.com,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH 2/2] drivers: hwmon: lm75: add support for PCT2075
Date:   Thu, 11 Jul 2019 14:45:04 +0200
Message-Id: <20190711124504.7580-2-daniel@zonque.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190711124504.7580-1-daniel@zonque.org>
References: <20190711124504.7580-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The NXP PCT2075 is largely compatible with other chips already supported
by the LM75 driver. It uses an 11-bit resolution and defaults to 100 ms
sampling period. The datasheet is here:

  https://www.nxp.com/docs/en/data-sheet/PCT2075.pdf

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/hwmon/lm75.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 447af07450f1..a8aba628468e 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -49,6 +49,7 @@ enum lm75_type {		/* keep sorted in alphabetical order */
 	max6626,
 	max31725,
 	mcp980x,
+	pct2075,
 	stds75,
 	stlm75,
 	tcn75,
@@ -353,6 +354,10 @@ lm75_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		data->resolution = 9;
 		data->sample_time = MSEC_PER_SEC / 8;
 		break;
+	case pct2075:
+		data->resolution = 11;
+		data->sample_time = MSEC_PER_SEC / 10;
+		break;
 	case mcp980x:
 		data->resolution_limits = 9;
 		/* fall through */
@@ -428,6 +433,7 @@ static const struct i2c_device_id lm75_ids[] = {
 	{ "max31725", max31725, },
 	{ "max31726", max31725, },
 	{ "mcp980x", mcp980x, },
+	{ "pct2075", pct2075, },
 	{ "stds75", stds75, },
 	{ "stlm75", stlm75, },
 	{ "tcn75", tcn75, },
@@ -496,6 +502,10 @@ static const struct of_device_id lm75_of_match[] = {
 		.compatible = "maxim,mcp980x",
 		.data = (void *)mcp980x
 	},
+	{
+		.compatible = "nxp,pct2075",
+		.data = (void *)pct2075
+	},
 	{
 		.compatible = "st,stds75",
 		.data = (void *)stds75
-- 
2.21.0

