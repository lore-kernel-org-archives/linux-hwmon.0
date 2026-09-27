Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3022F6920
	for <linux-hwmon@vger.kernel.org>; Sun, 27 Sep 2026 18:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790534264; cv=none; b=ta9V/Lyiz1hudPGDgiPxHElMYshm62dJbTFMo43MWwPknUouM6EkHUZbUpRSXwytnJh6uQ1v0RxbKPO0es6Ek3zMkwAwNWx7ihYNWLILZ8S8p8+uxK+GTQkXecXFXlPmGfdhP2x/ocGdmynpL51QPw54eOiKR1ULYhsKrWtVijI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790534264; c=relaxed/simple;
	bh=str+IzB7+ZV9AWNEOK0MZK1cCyqHDNn2MtqBWJMAGy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R5KkQve+4M7xxMCKsDKHpqtadU7XN9V10z9IwU8KQo0AfxvyRe2Bad10O4K9c8XNYe660BA3gzc5Eh1JTZgN8TU9WQjbW6NTLT3Te3AaaVr/rBALYNkYaTALddmg3TdXVZdKfjQgcXiyz/GZZFlKLihy3ll5R2fvibz3yq4/58g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vasily.cc; spf=pass smtp.mailfrom=vasily.cc; dkim=pass (2048-bit key) header.d=vasily.cc header.i=@vasily.cc header.b=Dwj96AU4; arc=none smtp.client-ip=185.70.43.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vasily.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vasily.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vasily.cc header.i=@vasily.cc header.b="Dwj96AU4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vasily.cc;
	s=protonmail2; t=1790534253; x=1790793453;
	bh=UX0Az93aOiMiSsg5rJGPHILoif/98iDiUx46W2+0Dr0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Dwj96AU4na+E7EGZqnC4MdAHXI6+C3WKw9AmUu0PWC7JbFVxNMxNssaTu27QD5Q+R
	 ceRANzMXeMzWjbxs3XEIaaLYA5PeJDZORNPGVd4TTkj6bF839iCcOm52AsSaekPfa1
	 zYd308idXmV/u15jGU/zV1ToO+iYWXhvZECVr20jRIipwmtXpAjAUyJXJ6DQGbyRON
	 hZFpjRKBgZWcHUFlyV9yVqmDWf7YLihBwxOFk1FpEJIhrJ8ViqfSNF26Jq+dLN9RHm
	 AgTLSUqqc9FwttFmvmeDX1rIGAEowax3kvPvI9UF8X2Pe+otbnh7cXBLQkuhS0Ff01
	 MoLvtTyrUv/SQ==
X-Pm-Submission-Id: 4htCpz02SRz1DF4w
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
Subject: [PATCH v4 1/5] hwmon: (aquacomputer_d5next) Avoid truncating scaled sensor readings
Date: Sun, 27 Sep 2026 21:37:19 +0300
Message-ID: <20260927183723.4078226-2-contact@vasily.cc>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260927183723.4078226-1-contact@vasily.cc>
References: <20260927183723.4078226-1-contact@vasily.cc>
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

Widen the shared current cache to u32. The Aquastream XT conversion to
milliamperes can exceed 65535 mA; clamp its negative conversion results
to zero before assigning to the unsigned cache. This also permits devices
with scaled aggregate currents to store milliamperes directly.

Assisted-by: LLM sparse
Signed-off-by: Vas Zayarskiy <contact@vasily.cc>
---
 drivers/hwmon/aquacomputer_d5next.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/aquacomputer_d5next.c b/drivers/hwmon/aquacomputer_d5next.c
index 1ca70e726..9178ac4cb 100644
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
@@ -1070,6 +1071,8 @@ static int aqc_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 		}
 		break;
 	case hwmon_power:
+		if (priv->power_input[channel] == -ENODATA)
+			return -ENODATA;
 		*val = priv->power_input[channel];
 		break;
 	case hwmon_pwm:
@@ -1426,7 +1429,8 @@ static int aqc_raw_event(struct hid_device *hdev, struct hid_report *report, u8
 			priv->power_input[0] = -ENODATA;
 		else
 			priv->power_input[0] =
-			    get_unaligned_be16(data + HIGHFLOWNEXT_POWER) * 1000000;
+			    min_t(u64, get_unaligned_be16(data + HIGHFLOWNEXT_POWER) * 1000000ULL,
+				  LONG_MAX);
 
 		priv->voltage_input[0] = get_unaligned_be16(data + HIGHFLOWNEXT_5V_VOLTAGE) * 10;
 		priv->voltage_input[1] =
