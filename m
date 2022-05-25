Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4774C433F5
	for <linux-hwmon@archiver.kernel.org>; Wed, 25 May 2022 07:37:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243415AbiEYHhi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 May 2022 03:37:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243612AbiEYHh1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 May 2022 03:37:27 -0400
Received: from smtpo52.interia.pl (smtpo52.interia.pl [217.74.67.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A7D6606CD
        for <linux-hwmon@vger.kernel.org>; Wed, 25 May 2022 00:37:24 -0700 (PDT)
X-Interia-R: Interia
X-Interia-R-IP: 80.68.225.159
X-Interia-R-Helo: <localhost>
Received: from localhost (unknown [80.68.225.159])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by www.poczta.fm (INTERIA.PL) with ESMTPSA;
        Wed, 25 May 2022 09:37:21 +0200 (CEST)
From:   Slawomir Stepien <sst@poczta.fm>
To:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com,
        sst@poczta.fm, slawomir.stepien@nokia.com
Subject: [PATCH 7/7] hwmon: (lm90) Read the channel's temperature offset from device-tree
Date:   Wed, 25 May 2022 09:36:57 +0200
Message-Id: <20220525073657.573327-8-sst@poczta.fm>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525073657.573327-1-sst@poczta.fm>
References: <20220525073657.573327-1-sst@poczta.fm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Interia-Antivirus: OK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl;
        s=biztos; t=1653464242;
        bh=WPeFse8j/Tn4aLsNvbD6wQT1rqQuT88dj0zMJFSIR/w=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=lpk9BnTKhcfeu6Srcb8OPYGsTKMo+3rKz/ykPBYTzY0ioyKMbRTkSX3WaJFEh4jz9
         EzavTxhtiw5hJeEeDEfNrHHKUTjziRqYzggFMoy05qr9o+U0/aAz02WhOs/Pkb1ol0
         txQLs7Ic4Czr6Yng6f/JOgFX+/spr0c94Tw12tiQ=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Slawomir Stepien <slawomir.stepien@nokia.com>

Try to read the channel's temperature offset from device-tree. Having
offset in device-tree node is not mandatory. The offset can only be set
for remote channels.

Signed-off-by: Slawomir Stepien <slawomir.stepien@nokia.com>
---
 drivers/hwmon/lm90.c | 48 ++++++++++++++++++++++++++++++++------------
 1 file changed, 35 insertions(+), 13 deletions(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 3837c4ab5833..12e8e874f1b9 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -1440,6 +1440,24 @@ static int lm90_set_temphyst(struct lm90_data *data, long val)
 	return lm90_write_reg(data->client, LM90_REG_TCRIT_HYST, data->temp_hyst);
 }
 
+static int lm90_set_temp_offset(struct lm90_data *data, int channel, long val)
+{
+	/* Both offset registers have the same resolution */
+	int res = lm90_temp_get_resolution(data, REMOTE_OFFSET);
+
+	val = lm90_temp_to_reg(0, val, res);
+
+	if (channel == 1) {
+		data->temp[REMOTE_OFFSET] = val;
+		return lm90_write16(data->client, LM90_REG_REMOTE_OFFSH,
+				    LM90_REG_REMOTE_OFFSL, val);
+	}
+
+	data->temp[REMOTE2_OFFSET] = val;
+	return lm90_write16(data->client, LM90_REG_REMOTE2_OFFSH,
+			    LM90_REG_REMOTE2_OFFSL, val);
+}
+
 static const u8 lm90_temp_index[MAX_CHANNELS] = {
 	LOCAL_TEMP, REMOTE_TEMP, REMOTE2_TEMP
 };
@@ -1577,19 +1595,7 @@ static int lm90_temp_write(struct device *dev, u32 attr, int channel, long val)
 				    channel, val);
 		break;
 	case hwmon_temp_offset:
-		/* Both offset registers have the same resolution */
-		val = lm90_temp_to_reg(0, val,
-				       lm90_temp_get_resolution(data, REMOTE_OFFSET));
-
-		if (channel == 1) {
-			data->temp[REMOTE_OFFSET] = val;
-			err = lm90_write16(data->client, LM90_REG_REMOTE_OFFSH,
-					   LM90_REG_REMOTE_OFFSL, val);
-		} else {
-			data->temp[REMOTE2_OFFSET] = val;
-			err = lm90_write16(data->client, LM90_REG_REMOTE2_OFFSH,
-					   LM90_REG_REMOTE2_OFFSL, val);
-		}
+		err = lm90_set_temp_offset(data, channel, val);
 		break;
 	default:
 		err = -EOPNOTSUPP;
@@ -2651,6 +2657,7 @@ static int lm90_probe_channel_from_dt(struct i2c_client *client,
 				      struct lm90_data *data)
 {
 	u32 id;
+	s32 val;
 	int err;
 	struct device *dev = &client->dev;
 
@@ -2674,6 +2681,21 @@ static int lm90_probe_channel_from_dt(struct i2c_client *client,
 	if (data->channel_label[id])
 		data->channel_config[id] |= HWMON_T_LABEL;
 
+	err = of_property_read_s32(child, "temperature-offset-millicelsius", &val);
+	if (!err) {
+		if (id == 0) {
+			dev_err(dev, "offset can't be set for internal channel\n");
+			return -EINVAL;
+		}
+
+		err = lm90_set_temp_offset(data, id, val);
+		if (err) {
+			dev_err(dev, "can't set offset %d for channel %d (%d)\n",
+				val, id, err);
+			return err;
+		}
+	}
+
 	return 0;
 }
 
-- 
2.36.1

