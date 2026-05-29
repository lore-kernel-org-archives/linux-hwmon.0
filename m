Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84B54218A0;
	Fri, 29 May 2026 20:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780086730; cv=none; b=VevTBqRPllDmHD8Hw9PxamgbyeWMRNrJi5gIwvxM1KG603lfCQwjXBhTglV2qRBFTREer1QgAFA56PlUjcv0/xZrOfakhOO3mSU1tlaeXMsuoz3egp9gokpEyrT7GLVqLJ9ScNCCzNqBcqxN+6TxhKDPaqFV3ny8H9EvNX8nFa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780086730; c=relaxed/simple;
	bh=9dhz5D1a0Ksv2nfOCHB6O5HOpDxXY+m49njNGjn9knQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OFHx1/bMHgkLJtS60OH3YBa5HdIoxyutQlO6Hl8w9366cSLAf+BwqkUbvsFkPB28/gACqep6nJV1VDzaqn4phZBrY/qblErpXvaAgekBVB2w+I2ycJ8M6xo630Cf0kvvIfL1I7qSUeGCuEM/je/wg/IS836ubd/kOk4R8Mv2yzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=jET+S+XO; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="jET+S+XO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1780086726;
	bh=9dhz5D1a0Ksv2nfOCHB6O5HOpDxXY+m49njNGjn9knQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jET+S+XOKIwlGDn3p9uF4Bqxygg9yWYu2JyjNw1ktmSRfMVJvFWd7RT9rRILEwCZE
	 44P/Yq9s0HQf0zc5raGKh5NggeTjL5Up9o6zAthO656A1V4mso484LoCy5QSwD4ocb
	 SYMif3iZodMf/t0LPi4dD0dj/Ye7Mbtdt5N0RXno=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Fri, 29 May 2026 22:31:52 +0200
Subject: [PATCH 1/5] hwmon: (cros_ec) Implement custom kelvin to celsius
 conversions
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260529-cros_ec-hwmon-fan-curve-v1-1-da6792b3830f@weissschuh.net>
References: <20260529-cros_ec-hwmon-fan-curve-v1-0-da6792b3830f@weissschuh.net>
In-Reply-To: <20260529-cros_ec-hwmon-fan-curve-v1-0-da6792b3830f@weissschuh.net>
To: Guenter Roeck <linux@roeck-us.net>, Benson Leung <bleung@chromium.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780086726; l=2067;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=9dhz5D1a0Ksv2nfOCHB6O5HOpDxXY+m49njNGjn9knQ=;
 b=t6zV1I7u0qOz71i5ZZNII8yQZZHNU+cgLiLNE+o04Ee69DBaUNYOQ/vMHLWC8AMxOdmizsz97
 lG/f6RXJBFRCddiP8rAfUPMyuI2M70uKcsdngpqgfwp6YXbRxo1m70+
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The ChromeOS EC APIs use integers representing degrees kelvin for
temperatures. The default conversions from linux/units.h will then
always convert these integer degrees celsius with a 150 millidegree
offset. This is a bit confusing, as it also differs from other CrOS EC
tooling. Internally the EC uses a kelvin to celsius offset of a round
273, so the current conversion is also not entirely accurate.

Implement a custom conversion which preserves round values.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hwmon/cros_ec_hwmon.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
index 7c308b0a4b9e..f1b6c9c2d2a3 100644
--- a/drivers/hwmon/cros_ec_hwmon.c
+++ b/drivers/hwmon/cros_ec_hwmon.c
@@ -147,9 +147,23 @@ static bool cros_ec_hwmon_is_error_temp(u8 temp)
 	       temp == EC_TEMP_SENSOR_NOT_CALIBRATED;
 }
 
+/* This differs slightly from the variant in units.h to avoid rounding inconsistencies. */
+#define CROS_EC_HWMON_ABSOLUTE_ZERO_MILLICELSIUS (-273000)
+
+static long cros_ec_hwmon_kelvin_to_millicelsius(long t)
+{
+	return t * MILLIDEGREE_PER_DEGREE + CROS_EC_HWMON_ABSOLUTE_ZERO_MILLICELSIUS;
+}
+
+static long cros_ec_hwmon_millicelsius_to_kelvin(long t)
+{
+	return DIV_ROUND_CLOSEST(t - CROS_EC_HWMON_ABSOLUTE_ZERO_MILLICELSIUS,
+				 MILLIDEGREE_PER_DEGREE);
+}
+
 static long cros_ec_hwmon_temp_to_millicelsius(u8 temp)
 {
-	return kelvin_to_millicelsius((((long)temp) + EC_TEMP_SENSOR_OFFSET));
+	return cros_ec_hwmon_kelvin_to_millicelsius((((long)temp) + EC_TEMP_SENSOR_OFFSET));
 }
 
 static bool cros_ec_hwmon_attr_is_temp_threshold(u32 attr)
@@ -228,7 +242,7 @@ static int cros_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 								cros_ec_hwmon_attr_to_thres(attr),
 								&threshold);
 			if (ret == 0)
-				*val = kelvin_to_millicelsius(threshold);
+				*val = cros_ec_hwmon_kelvin_to_millicelsius(threshold);
 		}
 	}
 

-- 
2.54.0

