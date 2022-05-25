Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD60C433FE
	for <linux-hwmon@archiver.kernel.org>; Wed, 25 May 2022 07:37:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231802AbiEYHhX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 May 2022 03:37:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243538AbiEYHhW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 May 2022 03:37:22 -0400
Received: from smtpo49.interia.pl (smtpo49.interia.pl [217.74.67.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8DE75EDF0
        for <linux-hwmon@vger.kernel.org>; Wed, 25 May 2022 00:37:20 -0700 (PDT)
X-Interia-R: Interia
X-Interia-R-IP: 80.68.225.159
X-Interia-R-Helo: <localhost>
Received: from localhost (unknown [80.68.225.159])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by www.poczta.fm (INTERIA.PL) with ESMTPSA;
        Wed, 25 May 2022 09:37:18 +0200 (CEST)
From:   Slawomir Stepien <sst@poczta.fm>
To:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com,
        sst@poczta.fm, slawomir.stepien@nokia.com
Subject: [PATCH 4/7] hwmon: (lm90) Add support for 2nd remote channel's offset register
Date:   Wed, 25 May 2022 09:36:54 +0200
Message-Id: <20220525073657.573327-5-sst@poczta.fm>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525073657.573327-1-sst@poczta.fm>
References: <20220525073657.573327-1-sst@poczta.fm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Interia-Antivirus: OK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl;
        s=biztos; t=1653464239;
        bh=lIUoqrfFVuyZ61m0GdcFyykewfYCp1VxxxRrxNV3G24=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=thW2OJutq3+oROWBXzf0uMUbezYSCdUnRaQmAsH3+MnW6L0p9YBB/oBQ8k/mrg5YE
         ERHKFBwP6uO+1sOST9rS26KCTCF/O/rHFdxJBVGP+tc5vlcCoIJAo0dsaKmiwOXRFV
         M6rcR714mMZ99wX2NV5IR2RRVUsz3SVfNfozTg3w=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Slawomir Stepien <slawomir.stepien@nokia.com>

The ADT7461 supports offset register for both remote channels it has.
Both registers have the same bit width (resolution).

In the code, this device has LM90_HAVE_TEMP3 and LM90_HAVE_OFFSET flags,
but the support of second remote channel's offset is missing. Add that
implementation.

Signed-off-by: Slawomir Stepien <slawomir.stepien@nokia.com>
---
 drivers/hwmon/lm90.c | 37 ++++++++++++++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 02b211a4e571..d226f1dea2ba 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -153,6 +153,8 @@ enum chips { adm1023, adm1032, adt7461, adt7461a, adt7481,
 #define LM90_REG_REMOTE_TEMPL		0x10
 #define LM90_REG_REMOTE_OFFSH		0x11
 #define LM90_REG_REMOTE_OFFSL		0x12
+#define LM90_REG_REMOTE2_OFFSH		0x34
+#define LM90_REG_REMOTE2_OFFSL		0x35
 #define LM90_REG_REMOTE_HIGHH		0x07
 #define LM90_REG_REMOTE_HIGHL		0x13
 #define LM90_REG_REMOTE_LOWH		0x08
@@ -669,6 +671,7 @@ enum lm90_temp_reg_index {
 	REMOTE2_TEMP,	/* max6695/96 only */
 	REMOTE2_LOW,	/* max6695/96 only */
 	REMOTE2_HIGH,	/* max6695/96 only */
+	REMOTE2_OFFSET,
 
 	TEMP_REG_NUM
 };
@@ -1024,6 +1027,14 @@ static int lm90_update_limits(struct device *dev)
 			return val;
 		data->temp[REMOTE2_HIGH] = val << 8;
 
+		if (data->flags & LM90_HAVE_OFFSET) {
+			val = lm90_read16(client, LM90_REG_REMOTE2_OFFSH,
+					  LM90_REG_REMOTE2_OFFSL, false);
+			if (val < 0)
+				return val;
+			data->temp[REMOTE2_OFFSET] = val;
+		}
+
 		lm90_select_remote_channel(data, false);
 	}
 
@@ -1294,6 +1305,7 @@ static int lm90_temp_get_resolution(struct lm90_data *data, int index)
 			return data->resolution;
 		return 8;
 	case REMOTE_OFFSET:
+	case REMOTE2_OFFSET:
 	case REMOTE2_TEMP:
 		return data->resolution;
 	case LOCAL_TEMP:
@@ -1515,8 +1527,13 @@ static int lm90_temp_read(struct device *dev, u32 attr, int channel, long *val)
 		*val = lm90_get_temphyst(data, lm90_temp_emerg_index[channel], channel);
 		break;
 	case hwmon_temp_offset:
-		*val = lm90_temp_from_reg(0, data->temp[REMOTE_OFFSET],
-					  lm90_temp_get_resolution(data, REMOTE_OFFSET));
+		/* Both offset registers have the same resolution */
+		int res = lm90_temp_get_resolution(data, REMOTE_OFFSET);
+
+		if (channel == 1)
+			*val = lm90_temp_from_reg(0, data->temp[REMOTE_OFFSET], res);
+		else
+			*val = lm90_temp_from_reg(0, data->temp[REMOTE2_OFFSET], res);
 		break;
 	default:
 		return -EOPNOTSUPP;
@@ -1556,11 +1573,19 @@ static int lm90_temp_write(struct device *dev, u32 attr, int channel, long val)
 				    channel, val);
 		break;
 	case hwmon_temp_offset:
+		/* Both offset registers have the same resolution */
 		val = lm90_temp_to_reg(0, val,
 				       lm90_temp_get_resolution(data, REMOTE_OFFSET));
-		data->temp[REMOTE_OFFSET] = val;
-		err = lm90_write16(data->client, LM90_REG_REMOTE_OFFSH,
-				   LM90_REG_REMOTE_OFFSL, val);
+
+		if (channel == 1) {
+			data->temp[REMOTE_OFFSET] = val;
+			err = lm90_write16(data->client, LM90_REG_REMOTE_OFFSH,
+					   LM90_REG_REMOTE_OFFSL, val);
+		} else {
+			data->temp[REMOTE2_OFFSET] = val;
+			err = lm90_write16(data->client, LM90_REG_REMOTE2_OFFSH,
+					   LM90_REG_REMOTE2_OFFSL, val);
+		}
 		break;
 	default:
 		err = -EOPNOTSUPP;
@@ -2733,6 +2758,8 @@ static int lm90_probe(struct i2c_client *client)
 		}
 		if (data->flags & LM90_HAVE_EMERGENCY_ALARM)
 			data->channel_config[2] |= HWMON_T_EMERGENCY_ALARM;
+		if (data->flags & LM90_HAVE_OFFSET)
+			data->channel_config[2] |= HWMON_T_OFFSET;
 	}
 
 	data->faultqueue_mask = lm90_params[data->kind].faultqueue_mask;
-- 
2.36.1

