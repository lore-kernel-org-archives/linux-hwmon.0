Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AC930EF95
	for <linux-hwmon@vger.kernel.org>; Fri, 22 May 2026 05:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779427440; cv=none; b=O8zv43poqb0159SZ0sb7CHrRRtjx3CZZq3cgGMiQLXjf/qIwVxCX7m83+zTjaLZv23rv3Ju3eRIPIe19Ha6Ew7OWNG9zvht/fyrA+be6/0oRKiuLTeN76SB0cmOyOGPvN7Z72B3fcHbte5WXLhdGxFjDNVvGqEMZBL8ZTvJl9aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779427440; c=relaxed/simple;
	bh=QtLscrNctFEMBOiD/p98DaeG+snCE4imcyoY+0YEz8A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OHlVm8xDTpcgKWDuDw5Phn2q5UlULFaQEMJ7T/Z1E2G84txTmmjFFSXeTS1/5KtQYlMwlGUABMc7abpADJMibUHCHBt4n3+YWKvvu+dka6OAh5cwT4YEXcpajOfQSLSNTmm38k8as0xsRZwBhA5+xM1C76eLUrCTk8bBZRSC+Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SiW5l0DG; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SiW5l0DG"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4904127c32cso3698175e9.2
        for <linux-hwmon@vger.kernel.org>; Thu, 21 May 2026 22:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779427438; x=1780032238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=heyV/AaVil5ZiHMLsN9JqyvQILoFWojkLpzQ2tLwG6I=;
        b=SiW5l0DGIliNaUtucmCQ5LtO5jYh8PSPoblMKH3pxLSktooZSV3J4G7+JOiOYHbm/9
         0Xua/ce6nOrPgqIja2pRYWrgz78Ob2O6qLVH9i1xrs0eNa90KTGV616tSvfyTBMKr8A9
         aFncujHa1tE3/mxzTn/IPgas9My5hh/g1yEEvLMUKoOf+vybrKxEKg1iY1WGAIMmc5wp
         cq/1KLI8ahR9x1+GxA3bZsbzQZzDdlP3z1YTR8dgtYgnyQcTgwyY9EGhsEmvrQzNwtDV
         +loz8IHeTtOOBJCMZOE4V267iyDWTeJ9sd2O+kNQMm5i5kYZ4AAbMW6rYJt/KAXQ6MBP
         utYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779427438; x=1780032238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=heyV/AaVil5ZiHMLsN9JqyvQILoFWojkLpzQ2tLwG6I=;
        b=U6G/C0dFLdFCS/Eax+Glwwo84z51haCyV+uGRf+0BZ8WfBunvms1he8oio80Fr7Tyy
         VPVSX+fgvleSS6iBRdIlDRgafjqPiJlh+L+7Y/INeE2RUp6xmu3XNZ2QN+gzPsbwgZ5e
         iPwHBw7aDeNIiQBUXX7AJor1AezDbh3HvINV21GoEs3+nuxuHtP0m9FVjCLIo90zpuJT
         wgxB/l67yXsjbGFPJN8mSLgkU1l55U4EF5VtUgbRnPdPA7OCU5/UYftuiUtWOtq/ew1Y
         w4jf9J0fCSMvdMzn1Wksqn+Sk/1CgdmJ0mulU0X0q/hjiU3oNeIKeWI45XXo+0d4Sr+Q
         3mTw==
X-Forwarded-Encrypted: i=1; AFNElJ+tfv9YiITGchD6ZGLgIqNVCEKTjwM4mGwKw9VN5yfNAoAFLX0XBZNCAVBYVwPS90Vb4vNaOHnFyVMKwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVnnmCdfJpywZ/Ug2nezs2uBVorHAYOD6+XWx0TQnBKrBzYpC8
	NaKibD/OqKeRhqsl1mYLcY8Y+oWQM4x8pye+1z7S7CtQKrrY6zDsvudQ
X-Gm-Gg: Acq92OFQAjcMIcEd2kmD/4SaRJTrgbCCGSPJ9C8wIGBL4SJTHz0Ryc/vYI8PI9C4mNl
	Zv8K2VQW55E1sln07XNimuBmguy6t9icWXX2boJyTZgpU+ZEfDupi52iadUDgDF+BzxdCGLl9z7
	PoxS8wCgPMHTnYJL/Ci4etDEaxtaLsGIBSDi/ik806aPy1hmhkRAw/SvIz/6zwCneTjt1fGt8bg
	WdqsU3LxAMaFyl3KVKFqw9XoZHfgk/t16iiT98AUn9bwPdyNMQBy5+p1xbduqK3Kq2wFEAVbIb1
	3bSeQ6JTAaFvXslmrs9fYBki/PbWZSUn5R2bI+4ZEq4GYH38JbQW4+neNixdYvVt1hdfx60Af3R
	T3uGL9T8D7O3AGdGvLUqFuxJ4P5WTUsR2oRSNPvnHaR7fpbKUxyviI+pKyIDE5gGL3hbSCy/EbY
	w/TTdjrA7u06qTghwFAfCk0B8PWG1Ljtu42FGZix9lEMGTINP1eFpq/sGS632veOICUPTG+p7p
X-Received: by 2002:a05:600d:6413:20b0:488:78f2:6b0 with SMTP id 5b1f17b1804b1-490428ed552mr15159935e9.29.1779427437741;
        Thu, 21 May 2026 22:23:57 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.232.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490428d44f6sm10624515e9.8.2026.05.21.22.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 22:23:57 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (adt7475) Add explicit header include
Date: Fri, 22 May 2026 08:23:52 +0300
Message-ID: <20260522052352.12139-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since device_property_read_string() and similar functions defined in
linux/property.h are used in the driver add explicit include for
linux/mod_devicetable.h and linux/property.h rather than having
implicit inclusions.
Removed of_match_ptr() improving non-Device Tree compatibility of the
driver and drop unnecessary __maybe_unused.
Header linux/of.h can't be removed yet since macro is_of_node() is used.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
 drivers/hwmon/adt7475.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
index 7fb96f5395fa..7241fc73d21a 100644
--- a/drivers/hwmon/adt7475.c
+++ b/drivers/hwmon/adt7475.c
@@ -19,6 +19,8 @@
 #include <linux/err.h>
 #include <linux/jiffies.h>
 #include <linux/of.h>
+#include <linux/mod_devicetable.h>
+#include <linux/property.h>
 #include <linux/util_macros.h>
 
 #include <dt-bindings/pwm/pwm.h>
@@ -173,7 +175,7 @@ static const struct i2c_device_id adt7475_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, adt7475_id);
 
-static const struct of_device_id __maybe_unused adt7475_of_match[] = {
+static const struct of_device_id adt7475_of_match[] = {
 	{
 		.compatible = "adi,adt7473",
 		.data = (void *)adt7473
@@ -1995,7 +1997,7 @@ static struct i2c_driver adt7475_driver = {
 	.class		= I2C_CLASS_HWMON,
 	.driver = {
 		.name	= "adt7475",
-		.of_match_table = of_match_ptr(adt7475_of_match),
+		.of_match_table = adt7475_of_match,
 	},
 	.probe		= adt7475_probe,
 	.id_table	= adt7475_id,
-- 
2.34.1

