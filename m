Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AC747276A;
	Tue, 30 Jun 2026 20:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782853084; cv=none; b=lmQTsKf3lJHkpDXEBKose2LnRg94S7OgyE+1cvEsn67ygEWx1u3VZYqucVMMfe0Sgkku7ncJklQXy1wXBu/Tk9mSSyDrMaYniurhgaQ03c0AcKCpdXOl/sg93SWDtObHly/9jHswFNL/ZYiKGFIcSslv6g1Kpm1pVgPgH1mRfYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782853084; c=relaxed/simple;
	bh=xmZp2eT5MEqMFurQrJ8z//rU9rheqid/iVkJBJ/RdiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hVXDLTTb2/cVZGqABWwZflt30o5SpTCmZDI7dVcHSbAscOcaW67uln53pLXe2DdVihXn4RvaT5yppqAmcD+NhpUA9jWWHBrkHw5x/tBmbK+fzsuXakbiyX9Ic6vhZqvKcUScwAji8uI7SSzmU1iZUxGkIdKjs4mUSh/8vjR7Jhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=PIqTIFBk; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="PIqTIFBk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1782853080;
	bh=xmZp2eT5MEqMFurQrJ8z//rU9rheqid/iVkJBJ/RdiQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PIqTIFBkvnv259PRqKVyZ8J9De0emresTERrdJET5flL3Fz/gnNxMTwM8/N8ZfFha
	 AX1eKhKynFFIL7HIJ4sL0R4NUY/yy56yD7su/a98Zf/D+5+v+pHKZgeV9Ea/I391h8
	 UA47lFI6oMclSXdEmUyHunatwqpc75cPyoWuznmU=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 30 Jun 2026 22:57:52 +0200
Subject: [PATCH 2/2] hwmon: (cros_ec) Handle temperature conversion
 overflows
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260630-cros_ec-hwmon-overflow-v1-2-3d2ecd3eb0f2@weissschuh.net>
References: <20260630-cros_ec-hwmon-overflow-v1-0-3d2ecd3eb0f2@weissschuh.net>
In-Reply-To: <20260630-cros_ec-hwmon-overflow-v1-0-3d2ecd3eb0f2@weissschuh.net>
To: Guenter Roeck <linux@roeck-us.net>, Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782853080; l=2584;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=xmZp2eT5MEqMFurQrJ8z//rU9rheqid/iVkJBJ/RdiQ=;
 b=9xOKTIUrK485PF1rRJS3yum3HXUUwFmOWYgrhpGyBfG9L9hbBIz3ukBmTDgbLCOfz+2WHMy5M
 S/wYg3qt75ABGSU/HYc3Hm/Z5e2a0NsPe5HvZgN+jejIb3RIZmpoIMs
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The calculations converting between the different temperature units can
overflow, resulting in incorrect data.

Detect these overflows and report them.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hwmon/cros_ec_hwmon.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
index 44291799dd8e..4b402142b46f 100644
--- a/drivers/hwmon/cros_ec_hwmon.c
+++ b/drivers/hwmon/cros_ec_hwmon.c
@@ -5,11 +5,13 @@
  *  Copyright (C) 2024 Thomas Weißschuh <linux@weissschuh.net>
  */
 
+#include <linux/build_bug.h>
 #include <linux/device.h>
 #include <linux/hwmon.h>
 #include <linux/math.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/overflow.h>
 #include <linux/platform_device.h>
 #include <linux/platform_data/cros_ec_commands.h>
 #include <linux/platform_data/cros_ec_proto.h>
@@ -150,14 +152,28 @@ static bool cros_ec_hwmon_is_error_temp(u8 temp)
 /* This differs slightly from the variant in units.h to avoid rounding inconsistencies. */
 #define CROS_EC_HWMON_ABSOLUTE_ZERO_MILLICELSIUS (-273000)
 
-static long cros_ec_hwmon_kelvin_to_millicelsius(long t)
+static bool cros_ec_hwmon_kelvin_to_millicelsius_overflow(long t, long *ret)
 {
-	return t * MILLIDEGREE_PER_DEGREE + CROS_EC_HWMON_ABSOLUTE_ZERO_MILLICELSIUS;
+	if (check_mul_overflow(t, MILLIDEGREE_PER_DEGREE, ret))
+		return true;
+
+	if (check_add_overflow(*ret, CROS_EC_HWMON_ABSOLUTE_ZERO_MILLICELSIUS, ret))
+		return true;
+
+	return false;
 }
 
-static long cros_ec_hwmon_temp_to_millicelsius(u8 temp)
+static long __flatten cros_ec_hwmon_temp_to_millicelsius(u8 temp)
 {
-	return cros_ec_hwmon_kelvin_to_millicelsius((((long)temp) + EC_TEMP_SENSOR_OFFSET));
+	long ret;
+
+	if (check_add_overflow(temp, EC_TEMP_SENSOR_OFFSET, &ret))
+		BUILD_BUG();
+
+	if (cros_ec_hwmon_kelvin_to_millicelsius_overflow(ret, &ret))
+		BUILD_BUG();
+
+	return ret;
 }
 
 static bool cros_ec_hwmon_attr_is_temp_threshold(u32 attr)
@@ -235,8 +251,10 @@ static int cros_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 			ret = cros_ec_hwmon_read_temp_threshold(priv->cros_ec, channel,
 								cros_ec_hwmon_attr_to_thres(attr),
 								&threshold);
-			if (ret == 0)
-				*val = cros_ec_hwmon_kelvin_to_millicelsius(threshold);
+			if (ret == 0) {
+				if (cros_ec_hwmon_kelvin_to_millicelsius_overflow(threshold, val))
+					*val = LONG_MAX;
+			}
 		}
 	}
 

-- 
2.55.0

