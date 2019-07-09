Return-Path: <SRS0=fIHL=VG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67226C606B0
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Jul 2019 09:51:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 47077214AF
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Jul 2019 09:51:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726154AbfGIJvN (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 9 Jul 2019 05:51:13 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:53299 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbfGIJvN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Jul 2019 05:51:13 -0400
Received: from [167.98.27.226] (helo=ct-lt-765.unassigned)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1hkmmB-00067K-Ir; Tue, 09 Jul 2019 10:51:07 +0100
Received: from ikerpalomar by ct-lt-765.unassigned with local (Exim 4.89)
        (envelope-from <ikerpalomar@ct-lt-765.unassigned>)
        id 1hkmmA-00025Z-R2; Tue, 09 Jul 2019 10:51:06 +0100
From:   Iker Perez <iker.perez@codethink.co.uk>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc:     Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>
Subject: [PATCH v1 5/5] First approach to sample time writing method
Date:   Tue,  9 Jul 2019 10:50:52 +0100
Message-Id: <20190709095052.7964-6-iker.perez@codethink.co.uk>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190709095052.7964-1-iker.perez@codethink.co.uk>
References: <20190709095052.7964-1-iker.perez@codethink.co.uk>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>

Switch between the possible update_time values and write into the
configuration register the selected value.

Signed-off-by: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>
---
 drivers/hwmon/lm75.c | 43 ++++++++++++++++++++++++++++++++++---------
 1 file changed, 34 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 5ba7277dac69..9d48a85fd3e5 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -156,21 +156,46 @@ static int lm75_read(struct device *dev, enum hwmon_sensor_types type,
 }
 
 static int lm75_write(struct device *dev, enum hwmon_sensor_types type,
-		      u32 attr, int channel, long temp)
+		      u32 attr, int channel, long val)
 {
 	struct lm75_data *data = dev_get_drvdata(dev);
-	u8 resolution;
-	int reg;
+	u8 resolution, set_mask, clr_mask;
+	int reg, status;
+
+	// This are provisional changes, to be improved in case this approach works
+	set_mask = 0;
+	clr_mask = LM75_SHUTDOWN;
 
 	switch (type) {
 	case hwmon_chip:
 		switch (attr) {
 		case hwmon_chip_update_interval:
-			if (data->kind == tmp75b)
-				pr_info("Iker inside write\n");
+			if (data->kind == tmp75b) {
+				clr_mask |= 1 << 15 | 0x3 << 13;
+				switch (val) {
+				case (27):
+					set_mask |= 0x3 << 13;
+					data->sample_time = MSEC_PER_SEC / 37;
+						break;
+				case (55):
+					set_mask |= 0x2 << 13;
+					data->sample_time = MSEC_PER_SEC / 18;
+						break;
+				case (111):
+					set_mask |= 0x1 << 13;
+					data->sample_time = MSEC_PER_SEC / 9;
+						break;
+				case (250):
+					set_mask |= 0x0 << 13;
+					data->sample_time = MSEC_PER_SEC / 4;
+						break;
+				default:
+						return -EINVAL;
+				status = configure_reg(set_mask, clr_mask, data, client);
+				}
+			}
 			else
 				return -EINVAL;
-			break;
 		default:
 			return -EINVAL;
 		}
@@ -195,11 +220,11 @@ static int lm75_write(struct device *dev, enum hwmon_sensor_types type,
 		else
 			resolution = data->resolution;
 
-		temp = clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
-		temp = DIV_ROUND_CLOSEST(temp  << (resolution - 8),
+		val = clamp_val(val, LM75_TEMP_MIN, LM75_TEMP_MAX);
+		val = DIV_ROUND_CLOSEST(val  << (resolution - 8),
 					 1000) << (16 - resolution);
 
-		return regmap_write(data->regmap, reg, temp);
+		return regmap_write(data->regmap, reg, val);
 	default:
 		return -EINVAL;
 	}
-- 
2.11.0

