Return-Path: <SRS0=fIHL=VG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A620DC606D7
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Jul 2019 09:51:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8A1A1214AF
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Jul 2019 09:51:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbfGIJvE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 9 Jul 2019 05:51:04 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:53272 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbfGIJvE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Jul 2019 05:51:04 -0400
Received: from [167.98.27.226] (helo=ct-lt-765.unassigned)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1hkmm2-00066J-EU; Tue, 09 Jul 2019 10:50:58 +0100
Received: from ikerpalomar by ct-lt-765.unassigned with local (Exim 4.89)
        (envelope-from <ikerpalomar@ct-lt-765.unassigned>)
        id 1hkmm1-00025L-NK; Tue, 09 Jul 2019 10:50:57 +0100
From:   Iker Perez <iker.perez@codethink.co.uk>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc:     Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>
Subject: [PATCH v1 2/5] hwmon: (lm75) Include hwmon_chip in the permitted types to be writen
Date:   Tue,  9 Jul 2019 10:50:49 +0100
Message-Id: <20190709095052.7964-3-iker.perez@codethink.co.uk>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190709095052.7964-1-iker.perez@codethink.co.uk>
References: <20190709095052.7964-1-iker.perez@codethink.co.uk>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>

hwmon_chip needs to be allowed to be written because tmp75b's sample time
can be configured. Allowing hwmon_chip to be written will allow to
configure the update_interval from sysfs.

Signed-off-by: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>
---
 drivers/hwmon/lm75.c | 62 ++++++++++++++++++++++++++++++++--------------------
 1 file changed, 38 insertions(+), 24 deletions(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index 0209e0719784..80a11c33db77 100644
--- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -128,34 +128,48 @@ static int lm75_write(struct device *dev, enum hwmon_sensor_types type,
 	u8 resolution;
 	int reg;
 
-	if (type != hwmon_temp)
-		return -EINVAL;
-
-	switch (attr) {
-	case hwmon_temp_max:
-		reg = LM75_REG_MAX;
-		break;
-	case hwmon_temp_max_hyst:
-		reg = LM75_REG_HYST;
-		break;
-	default:
-		return -EINVAL;
+	switch (type) {
+	case hwmon_chip:
+		switch (attr) {
+		case hwmon_chip_update_interval:
+			if (data->kind == tmp75b)
+				pr_info("Iker inside write\n");
+			else
+				return -EINVAL;
+			break;
+		default:
+			return -EINVAL;
+		}
+	case hwmon_temp:
+		switch (attr) {
+		case hwmon_temp_max:
+			reg = LM75_REG_MAX;
+			break;
+		case hwmon_temp_max_hyst:
+			reg = LM75_REG_HYST;
+			break;
+		default:
+			return -EINVAL;
 	}
 
-	/*
-	 * Resolution of limit registers is assumed to be the same as the
-	 * temperature input register resolution unless given explicitly.
-	 */
-	if (data->resolution_limits)
-		resolution = data->resolution_limits;
-	else
-		resolution = data->resolution;
+		/*
+		* Resolution of limit registers is assumed to be the same as the
+		* temperature input register resolution unless given explicitly.
+		*/
+		if (data->resolution_limits)
+			resolution = data->resolution_limits;
+		else
+			resolution = data->resolution;
 
-	temp = clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
-	temp = DIV_ROUND_CLOSEST(temp  << (resolution - 8),
-				 1000) << (16 - resolution);
+		temp = clamp_val(temp, LM75_TEMP_MIN, LM75_TEMP_MAX);
+		temp = DIV_ROUND_CLOSEST(temp  << (resolution - 8),
+					 1000) << (16 - resolution);
 
-	return regmap_write(data->regmap, reg, temp);
+		return regmap_write(data->regmap, reg, temp);
+	default:
+		return -EINVAL;
+	}
+	return 0;
 }
 
 static umode_t lm75_is_visible(const void *data, enum hwmon_sensor_types type,
-- 
2.11.0

