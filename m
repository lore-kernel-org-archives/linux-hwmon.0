Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB0D394788;
	Sun, 27 Sep 2026 19:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790536434; cv=none; b=C4LTob+JytsKm87n1G8uvkPohVNcXVAGYimimRs4Dx6gia3yZgoYLv7pAisKE0is85YsT8WYGyxhRYZJq9q6DPWRfRiHP8PEXaj6i8lVtHQY85J/zztd+lfRGizwTuCTeY+akqtdGAmABUQuXiT/bZDZFYd+HH6LklixpdWuPcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790536434; c=relaxed/simple;
	bh=+L0AKjiSKQJpnScFEG+7DmLRTGFbLMz8ineYWl3bjfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RGzb0t/2Y+e1LxJLT/3iXyzgm9cVdInr8lRnkvC9kGbPg/q1W4ysomVlmpNvKIs6QbXq2GjYD5G7NAJPmTscLYo6UdhEwVpUd5c4NjoRXBHLJz6nCF1fTu37P3yJfz1IMwSI+iqNEKU4jg5kj0dISD0XYOZVD5s3u777QhK4Kj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vasily.cc; spf=pass smtp.mailfrom=vasily.cc; dkim=pass (2048-bit key) header.d=vasily.cc header.i=@vasily.cc header.b=J4u/94Xc; arc=none smtp.client-ip=109.224.244.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vasily.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vasily.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vasily.cc header.i=@vasily.cc header.b="J4u/94Xc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vasily.cc;
	s=protonmail2; t=1790536427; x=1790795627;
	bh=JTMxIGnWVyKR9R/fpQTCDypmeYP/X/RtaA9/QUpCGcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=J4u/94XciFTOiKq25cw7DfxwFEMcoACSyVUIVToe99mUiMotP5nKZa6DEVqP7Tibm
	 ambycIEwZE/vPeJKu5Mid9rDXm6tbP60sePIV1Yf1AHnkYj+PyAAHjCxLnv145Znxy
	 1+v8t6XqPlEW5+BR+Fps57O3nv+8XTgB5Oa8gsQUvGTeOuUP3qLtAVLOnk54tLuA6o
	 O3NDD5wzbCBB8Li4MSc0ifnO45ckm4rjyl/kvWtTX3WFr5CpzRe27mtQ2n3hxId8CT
	 vRpAveoRk9vsr+ZykvPCcsgL1CN0x21IbOuDiMc4eyZ0iFeajY+mhsA0rNIiQLTsza
	 0MEpVrTD91WoQ==
X-Pm-Submission-Id: 4htDcp28hnz2ScPL
From: Vas Zayarskiy <contact@vasily.cc>
To: linux@roeck-us.net,
	Aleksa Savic <savicaleksa83@gmail.com>,
	Jack Doan <me@jackdoan.com>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v5 1/5] hwmon: (aquacomputer_d5next) Avoid truncating scaled sensor readings
Date: Sun, 27 Sep 2026 22:13:12 +0300
Message-ID: <20260927191316.4137752-2-contact@vasily.cc>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260927191316.4137752-1-contact@vasily.cc>
References: <20260927191316.4137752-1-contact@vasily.cc>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

High Flow Next power is reported in watts. Multiplying the 16-bit value
by one million can overflow both the signed intermediate and the u32
cache. Store power in long, perform the conversion in u64, and clamp to
LONG_MAX. The other existing power conversions fit in a signed 32-bit
value. Return -ENODATA for unavailable power instead of exposing the
stored error as a reading.

The power cache is updated by HID reports without the hwmon read mutex.
Read it once with READ_ONCE() and use that snapshot for both the
availability check and the returned value. Mark the corresponding
updates with WRITE_ONCE() so that the shared accesses are explicit.

Widen the shared current cache to u32. The Aquastream XT conversion to
milliamperes can exceed 65535 mA; clamp its negative conversion results
to zero before assigning to the unsigned cache. This also permits devices
with scaled aggregate currents to store milliamperes directly.

Assisted-by: LLM sparse
Signed-off-by: Vas Zayarskiy <contact@vasily.cc>
---
Changes in v5: Snapshot the power cache once for validation and output,
and mark power-cache writes with WRITE_ONCE().

 drivers/hwmon/aquacomputer_d5next.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/aquacomputer_d5next.c b/drivers/hwmon/aquacomputer_d5next.c
index 1ca70e726..33d292228 100644
--- a/drivers/hwmon/aquacomputer_d5next.c
+++ b/drivers/hwmon/aquacomputer_d5next.c
@@ -19,6 +19,7 @@
 #include <linux/hwmon.h>
 #include <linux/jiffies.h>
 #include <linux/ktime.h>
+#include <linux/limits.h>
 #include <linux/module.h>
 #include <linux/seq_file.h>
 #include <linux/unaligned.h>
@@ -599,9 +600,9 @@ struct aqc_data {
 	u32 speed_input_min[1];
 	u32 speed_input_target[1];
 	u32 speed_input_max[1];
-	u32 power_input[8];
+	long power_input[8];
 	u16 voltage_input[8];
-	u16 current_input[8];
+	u32 current_input[8];
 
 	/* Label values */
 	const char *const *temp_label;
@@ -976,7 +977,7 @@ static int aqc_legacy_read(struct aqc_data *priv)
 
 		/* Calculation derived from linear regression */
 		sensor_value = get_unaligned_le16(priv->buffer + AQUASTREAMXT_PUMP_CURR_OFFSET);
-		priv->current_input[0] = DIV_ROUND_CLOSEST(sensor_value * 176, 100) - 52;
+		priv->current_input[0] = max(DIV_ROUND_CLOSEST(sensor_value * 176, 100) - 52, 0);
 
 		sensor_value = get_unaligned_le16(priv->buffer + AQUASTREAMXT_PUMP_VOLTAGE_OFFSET);
 		priv->voltage_input[0] = DIV_ROUND_CLOSEST(sensor_value * 1000, 61);
@@ -1006,6 +1007,7 @@ static int aqc_legacy_read(struct aqc_data *priv)
 static int aqc_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 		    int channel, long *val)
 {
+	long power;
 	int ret;
 	struct aqc_data *priv = dev_get_drvdata(dev);
 
@@ -1070,7 +1072,10 @@ static int aqc_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 		}
 		break;
 	case hwmon_power:
-		*val = priv->power_input[channel];
+		power = READ_ONCE(priv->power_input[channel]);
+		if (power == -ENODATA)
+			return -ENODATA;
+		*val = power;
 		break;
 	case hwmon_pwm:
 		switch (priv->kind) {
@@ -1368,9 +1373,9 @@ static int aqc_raw_event(struct hid_device *hdev, struct hid_report *report, u8
 		priv->speed_input[i] =
 		    get_unaligned_be16(data + priv->fan_sensor_offsets[i] +
 				       priv->fan_structure->speed);
-		priv->power_input[i] =
-		    get_unaligned_be16(data + priv->fan_sensor_offsets[i] +
-				       priv->fan_structure->power) * 10000;
+		WRITE_ONCE(priv->power_input[i],
+			   get_unaligned_be16(data + priv->fan_sensor_offsets[i] +
+					      priv->fan_structure->power) * 10000);
 		priv->voltage_input[i] =
 		    get_unaligned_be16(data + priv->fan_sensor_offsets[i] +
 				       priv->fan_structure->voltage) * 10;
@@ -1410,7 +1415,8 @@ static int aqc_raw_event(struct hid_device *hdev, struct hid_report *report, u8
 		priv->speed_input[2] = get_unaligned_be16(data + AQUASTREAMULT_PRESSURE_OFFSET);
 		priv->speed_input[3] = get_unaligned_be16(data + AQUASTREAMULT_FLOW_SENSOR_OFFSET);
 
-		priv->power_input[1] = get_unaligned_be16(data + AQUASTREAMULT_PUMP_POWER) * 10000;
+		WRITE_ONCE(priv->power_input[1],
+			   get_unaligned_be16(data + AQUASTREAMULT_PUMP_POWER) * 10000);
 
 		priv->voltage_input[1] = get_unaligned_be16(data + AQUASTREAMULT_PUMP_VOLTAGE) * 10;
 
@@ -1423,10 +1429,11 @@ static int aqc_raw_event(struct hid_device *hdev, struct hid_report *report, u8
 	case highflownext:
 		/* If external temp sensor is not connected, its power reading is also N/A */
 		if (priv->temp_input[1] == -ENODATA)
-			priv->power_input[0] = -ENODATA;
+			WRITE_ONCE(priv->power_input[0], -ENODATA);
 		else
-			priv->power_input[0] =
-			    get_unaligned_be16(data + HIGHFLOWNEXT_POWER) * 1000000;
+			WRITE_ONCE(priv->power_input[0],
+				   min_t(u64, get_unaligned_be16(data + HIGHFLOWNEXT_POWER) *
+					 1000000ULL, LONG_MAX));
 
 		priv->voltage_input[0] = get_unaligned_be16(data + HIGHFLOWNEXT_5V_VOLTAGE) * 10;
 		priv->voltage_input[1] =
