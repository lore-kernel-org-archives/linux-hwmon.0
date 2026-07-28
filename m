Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07DB41F342;
	Tue, 28 Jul 2026 10:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785233848; cv=none; b=cpZ3yI8S52KF4j0ZPZ5WrvGRUAh/zOYEkp/HNNqJyBFxbX5PpOlZhyWnZA0tlOSNbISejx23j4MAiBVtfj+PKGoPX6wMn5/vlm/3zdxIT60Hwx+2AXH6JB9XnkGBDBhcHMA0hpGBRoXt/0trAXZwWbPos65qXlDp/M8MrFJ0V8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785233848; c=relaxed/simple;
	bh=9/2rVeQC5fyFBKz4jOwZnWDl1PA6CM9AG3UezhyCyCY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DWzVybbcHiMgThLdV9UFccZeZMdjOyvQa4k20y0Yd4OSrZlX2UfcTVoqCDHzGkDD6hy1y2b/sRMBrNwJ5e8Sre66X/z1sRkBEDNT9QnqipT29ziIGHkNWcLB9eI5LNaJ8QDyJ/v2VVfIh2no4bOGsY/V5r3GCAdiPrn8QtKaEso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=j3j1HsDA; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="j3j1HsDA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1785233836;
	bh=9/2rVeQC5fyFBKz4jOwZnWDl1PA6CM9AG3UezhyCyCY=;
	h=From:Date:Subject:To:Cc:From;
	b=j3j1HsDA7JTmaPhcZ8plZxISkZ6vV4amWCuqes8jCuZWzirfdPyInyl7c06Y5u614
	 eE7gGYLIwI/RxyaVptdLQM6iQtXOAkAgNs2emhSoyj0Vwjq6KCC+vc2RM2KlsRk/Am
	 VkAozox5Yh2ZQYNYip4qVPEaldXXtIbaQBMNMMsY=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 28 Jul 2026 12:17:14 +0200
Subject: [PATCH v2] hwmon: (cros_ec) Handle temperature conversion
 overflows
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260728-cros_ec-hwmon-overflow-v2-1-d24e24d0792b@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WOSw7CIBRFt9IwFkMhNtWR+zCNsfAQjILygGqa7
 l1aTRw6PDf3NxKEYAHJrhpJgGzReleAryoizcmdgVpVmHDGG9YIRmXweARJzXDzjvoMQV/9QJl
 oa9lu2FZpQUr4HkDb51J86D6Mqb+AjHPb1xHgkcpi/NmMxejDa7mT61n9u5xryqhQHKQS0DPN9
 wNYRJQmmbWDSLppmt6HtSJ56AAAAA==
X-Change-ID: 20260630-cros_ec-hwmon-overflow-0381c8509df3
To: Guenter Roeck <linux@roeck-us.net>, Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785233836; l=3418;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=9/2rVeQC5fyFBKz4jOwZnWDl1PA6CM9AG3UezhyCyCY=;
 b=jr2hndbVUhqSPNioMcNWYlN6AnmL4v9tW77H4zBReSCb7jKm3oa7miWLuuFKF/Yf47/nK9oZx
 rNNkX+wMYTOBzn2WV2XffQmMsnyns9V2muXThHQ8RiHAH5VVEktfOL7
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The calculations converting between the different temperature units can
overflow on 32-bit systems, resulting in incorrect data.

Detect these overflows and handle them.

The code is written in a way that there is a single conversion function
and the compiler can recognize when overflows are impossible (on 64-bit
and in cros_ec_hwmon_temp_to_millicelsius()). If the compiler detects
this, it will optimize away the overflow checks.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v2:
- Drop already applied patch 1.
- Also handle overflow of u32 -> long.
- Clarify commit message wrt compiler optimizations.
- Use __always_inline over __flatten to allow the compiler to optimize
  away more unnecessary overflow checks.
- Link to v1: https://patch.msgid.link/20260630-cros_ec-hwmon-overflow-v1-0-3d2ecd3eb0f2@weissschuh.net
---
 drivers/hwmon/cros_ec_hwmon.c | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
index 1337b646e022..004a8180b665 100644
--- a/drivers/hwmon/cros_ec_hwmon.c
+++ b/drivers/hwmon/cros_ec_hwmon.c
@@ -5,11 +5,13 @@
  *  Copyright (C) 2024 Thomas Weißschuh <linux@weissschuh.net>
  */
 
+#include <linux/build_bug.h>
 #include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/hwmon.h>
 #include <linux/math.h>
 #include <linux/module.h>
+#include <linux/overflow.h>
 #include <linux/platform_device.h>
 #include <linux/platform_data/cros_ec_commands.h>
 #include <linux/platform_data/cros_ec_proto.h>
@@ -151,14 +153,28 @@ static bool cros_ec_hwmon_is_error_temp(u8 temp)
 /* This differs slightly from the variant in units.h to avoid rounding inconsistencies. */
 #define CROS_EC_HWMON_ABSOLUTE_ZERO_MILLICELSIUS (-273000)
 
-static long cros_ec_hwmon_kelvin_to_millicelsius(long t)
+static __always_inline bool cros_ec_hwmon_kelvin_to_millicelsius_overflow(long t, long *ret)
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
 
 static long cros_ec_hwmon_temp_to_millicelsius(u8 temp)
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
@@ -236,8 +252,13 @@ static int cros_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 			ret = cros_ec_hwmon_read_temp_threshold(priv->cros_ec, channel,
 								cros_ec_hwmon_attr_to_thres(attr),
 								&threshold);
-			if (ret == 0)
-				*val = cros_ec_hwmon_kelvin_to_millicelsius(threshold);
+			if (ret == 0) {
+				if (overflows_type(threshold, long))
+					*val = LONG_MAX;
+
+				if (cros_ec_hwmon_kelvin_to_millicelsius_overflow(threshold, val))
+					*val = LONG_MAX;
+			}
 		}
 	}
 

---
base-commit: 0109905cfdf4b64da014596f31c2ee5029ef0870
change-id: 20260630-cros_ec-hwmon-overflow-0381c8509df3

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

