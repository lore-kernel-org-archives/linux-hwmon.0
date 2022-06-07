Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 860DAC43334
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Jun 2022 06:35:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbiFGGfc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Jun 2022 02:35:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230388AbiFGGfb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 7 Jun 2022 02:35:31 -0400
Received: from smtpo62.interia.pl (smtpo62.interia.pl [217.74.67.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40AC24D279
        for <linux-hwmon@vger.kernel.org>; Mon,  6 Jun 2022 23:35:29 -0700 (PDT)
Received: from localhost (unknown [80.68.225.159])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by www.poczta.fm (INTERIA.PL) with ESMTPSA;
        Tue,  7 Jun 2022 08:35:26 +0200 (CEST)
From:   Slawomir Stepien <sst@poczta.fm>
To:     linux-hwmon@vger.kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net,
        przemyslaw.cencner@nokia.com, krzysztof.adamski@nokia.com,
        alexander.sverdlin@nokia.com, sst@poczta.fm,
        slawomir.stepien@nokia.com
Subject: [PATCH 1/2] hwmon: (lm90) Add support for 2nd remote channel's offset register
Date:   Tue,  7 Jun 2022 08:35:03 +0200
Message-Id: <20220607063504.1287855-2-sst@poczta.fm>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220607063504.1287855-1-sst@poczta.fm>
References: <20220607063504.1287855-1-sst@poczta.fm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl;
        s=biztos; t=1654583727;
        bh=Ag9Ju94HTToEuqPuBADGEdIIytAPiI6GWA1WNGe4+yY=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=TtpGPc4ONhkmXr26ubfo5nUh9+04mZm6lZlJ+NSzKFWGNqHtk82O8QckxrKmEU2DD
         L6ND8jD9qqn6dbkZlhKc0B8k9vSQBhwJyKKqFszHj9zvns6zMXpJOpPe9wwWxe2z+6
         i+XBqFbC1YRMDwkW4AKon3i5R8YTARdUXl7QhLaM=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Slawomir Stepien <slawomir.stepien@nokia.com>

The ADT7481 have LM90_HAVE_TEMP3 and LM90_HAVE_OFFSET flags, but the
support of second remote channel's offset is missing. Add that
implementation.

Signed-off-by: Slawomir Stepien <slawomir.stepien@nokia.com>
---
Changes since v1:
* New functions lm90_get_temp_offset and lm90_set_temp_offset.
* Use the same addresses to access remote channel 1 and 2 registers.
* Use new lm90_temp_offset_index translation table.

 drivers/hwmon/lm90.c | 58 +++++++++++++++++++++++++++++++++++++-------
 1 file changed, 49 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index a18aed5f96d1..ec885cb3ab92 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -672,6 +672,7 @@ enum lm90_temp_reg_index {
 	REMOTE2_TEMP,	/* max6695/96 only */
 	REMOTE2_LOW,	/* max6695/96 only */
 	REMOTE2_HIGH,	/* max6695/96 only */
+	REMOTE2_OFFSET,
 
 	TEMP_REG_NUM
 };
@@ -1028,6 +1029,14 @@ static int lm90_update_limits(struct device *dev)
 			return val;
 		data->temp[REMOTE2_HIGH] = val << 8;
 
+		if (data->flags & LM90_HAVE_OFFSET) {
+			val = lm90_read16(client, LM90_REG_REMOTE_OFFSH,
+					  LM90_REG_REMOTE_OFFSL, false);
+			if (val < 0)
+				return val;
+			data->temp[REMOTE2_OFFSET] = val;
+		}
+
 		lm90_select_remote_channel(data, false);
 	}
 
@@ -1298,6 +1307,7 @@ static int lm90_temp_get_resolution(struct lm90_data *data, int index)
 			return data->resolution;
 		return 8;
 	case REMOTE_OFFSET:
+	case REMOTE2_OFFSET:
 	case REMOTE2_TEMP:
 		return data->resolution;
 	case LOCAL_TEMP:
@@ -1428,6 +1438,36 @@ static int lm90_set_temphyst(struct lm90_data *data, long val)
 	return lm90_write_reg(data->client, LM90_REG_TCRIT_HYST, data->temp_hyst);
 }
 
+static int lm90_get_temp_offset(struct lm90_data *data, int index)
+{
+	int res = lm90_temp_get_resolution(data, index);
+
+	return lm90_temp_from_reg(0, data->temp[index], res);
+}
+
+static int lm90_set_temp_offset(struct lm90_data *data, int index, int channel, long val)
+{
+	int err;
+
+	val = lm90_temp_to_reg(0, val, lm90_temp_get_resolution(data, index));
+
+	/* For ADT7481 we can use the same registers for remote channel 1 and 2 */
+	if (channel > 1)
+		lm90_select_remote_channel(data, true);
+
+	err = lm90_write16(data->client, LM90_REG_REMOTE_OFFSH, LM90_REG_REMOTE_OFFSL, val);
+
+	if (channel > 1)
+		lm90_select_remote_channel(data, false);
+
+	if (err)
+		return err;
+
+	data->temp[index] = val;
+
+	return 0;
+}
+
 static const u8 lm90_temp_index[MAX_CHANNELS] = {
 	LOCAL_TEMP, REMOTE_TEMP, REMOTE2_TEMP
 };
@@ -1448,6 +1488,10 @@ static const u8 lm90_temp_emerg_index[MAX_CHANNELS] = {
 	LOCAL_EMERG, REMOTE_EMERG, REMOTE2_EMERG
 };
 
+static const s8 lm90_temp_offset_index[MAX_CHANNELS] = {
+	-1, REMOTE_OFFSET, REMOTE2_OFFSET
+};
+
 static const u16 lm90_min_alarm_bits[MAX_CHANNELS] = { BIT(5), BIT(3), BIT(11) };
 static const u16 lm90_max_alarm_bits[MAX_CHANNELS] = { BIT(6), BIT(4), BIT(12) };
 static const u16 lm90_crit_alarm_bits[MAX_CHANNELS] = { BIT(0), BIT(1), BIT(9) };
@@ -1519,8 +1563,7 @@ static int lm90_temp_read(struct device *dev, u32 attr, int channel, long *val)
 		*val = lm90_get_temphyst(data, lm90_temp_emerg_index[channel], channel);
 		break;
 	case hwmon_temp_offset:
-		*val = lm90_temp_from_reg(0, data->temp[REMOTE_OFFSET],
-					  lm90_temp_get_resolution(data, REMOTE_OFFSET));
+		*val = lm90_get_temp_offset(data, lm90_temp_offset_index[channel]);
 		break;
 	default:
 		return -EOPNOTSUPP;
@@ -1560,13 +1603,8 @@ static int lm90_temp_write(struct device *dev, u32 attr, int channel, long val)
 				    channel, val);
 		break;
 	case hwmon_temp_offset:
-		val = lm90_temp_to_reg(0, val,
-				       lm90_temp_get_resolution(data, REMOTE_OFFSET));
-		err = lm90_write16(data->client, LM90_REG_REMOTE_OFFSH,
-				   LM90_REG_REMOTE_OFFSL, val);
-		if (err)
-			break;
-		data->temp[REMOTE_OFFSET] = val;
+		err = lm90_set_temp_offset(data, lm90_temp_offset_index[channel],
+					   channel, val);
 		break;
 	default:
 		err = -EOPNOTSUPP;
@@ -2803,6 +2841,8 @@ static int lm90_probe(struct i2c_client *client)
 		}
 		if (data->flags & LM90_HAVE_EMERGENCY_ALARM)
 			data->channel_config[2] |= HWMON_T_EMERGENCY_ALARM;
+		if (data->flags & LM90_HAVE_OFFSET)
+			data->channel_config[2] |= HWMON_T_OFFSET;
 	}
 
 	data->faultqueue_mask = lm90_params[data->kind].faultqueue_mask;
-- 
2.36.1

