Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA37194A48;
	Fri,  8 Nov 2024 12:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731069834; cv=none; b=GQt9OvRdbcmr+XA9zosHgqT0720nwAVOiBgysjt5NF3yjlLATLdfNVVIRqaL1JJU9kDFNJs3h46nchZHkBxlMqqLjn3PsETSrw0Oq0+yfX0YIriDHe9es0Kd1EBwZt6Mo01HKEKnljiFdrNP5LT1GuwGiig/4ivljZZpQMOzil0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731069834; c=relaxed/simple;
	bh=N90AAotmlKrKlejcRMODvnlFEbmTE19h05YvLXSFD3o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hS7wl7lovs7QFCs11CVl4Rm1an9a1aTykl3I03L1NtGenOYwAhslz/GYYV2m5HuuWttYvsnaAqW9qPHVmhfhEhb0mD0xIcmNl85QgSlTS/7SZDoREtXeSaWJ2rf8qD8HMO87KLgEGKN1V5ZUjEOTha2ZC9GkwI0vFi5h7lCPN1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gNrB+4/W; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gNrB+4/W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731069834; x=1762605834;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=N90AAotmlKrKlejcRMODvnlFEbmTE19h05YvLXSFD3o=;
  b=gNrB+4/WDF7IaA+IHXCa+XZvC8VrQA/KXQboU77KT97OE2fq6qo9lmU5
   r+ZVgltlAv9Dn7+CMvlxkrTi7EyN6GTBuBGtMrLrNcurNmVokoUdYEpsK
   fsdeIk/6dtb7rb+lQjHVjLOsk0fxFWBzsCvqp96DDjLwx8OSfaCXH+r6C
   yLrb4bIma9lSrJEGd5Ygf+xNP8pZC7fUKqRo+QwD6uN5vcMgn+IsLDuzW
   oMZ2FqVh3oDITeUVCh70c6MMLshiZe0lmrM+qG/sIySF4uOaWla/YdfMo
   oPABpYa1t0ziM/wQB53+1N2m/psNbleCEspv0p3zp39kOS90vx52+IoU/
   w==;
X-CSE-ConnectionGUID: asqAnoXwTk6/SDPUJZKw4w==
X-CSE-MsgGUID: fyhVjjkETvWF3X70da9Fnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="34737735"
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="34737735"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 04:43:53 -0800
X-CSE-ConnectionGUID: J4ghmk2eSfOht838QVU8gA==
X-CSE-MsgGUID: R7d5HLsaSXmAQdM/runxhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="90189674"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 08 Nov 2024 04:43:50 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id A441B20F; Fri, 08 Nov 2024 14:43:49 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Florian Eckert <fe@dev.tdt.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Konstantin Aladyshev <aladyshev22@gmail.com>
Subject: [PATCH v1 1/1] hwmon: (jc42) Drop of_match_ptr() protection
Date: Fri,  8 Nov 2024 14:43:48 +0200
Message-ID: <20241108124348.1392473-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This prevents use of this driver with ACPI via PRP0001 and
is an example of an anti pattern I'm trying to remove from
the kernel. Hence drop from this driver.

Also switch of.h for mod_devicetable.h include given use of
struct of_device_id which is defined in that header.

Reported-by: Konstantin Aladyshev <aladyshev22@gmail.com>
Closes: https://lore.kernel.org/r/CACSj6VW7WKv5tiAkLCvSujENJvXq1Mc7_7vtkQsRSz3JGY0i3Q@mail.gmail.com
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/hwmon/jc42.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/jc42.c b/drivers/hwmon/jc42.c
index c459dce496a6..06f0ab2f52fa 100644
--- a/drivers/hwmon/jc42.c
+++ b/drivers/hwmon/jc42.c
@@ -11,6 +11,7 @@
 
 #include <linux/bitops.h>
 #include <linux/bitfield.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/slab.h>
@@ -19,7 +20,6 @@
 #include <linux/hwmon.h>
 #include <linux/err.h>
 #include <linux/mutex.h>
-#include <linux/of.h>
 #include <linux/regmap.h>
 
 /* Addresses to scan */
@@ -595,20 +595,18 @@ static const struct i2c_device_id jc42_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, jc42_id);
 
-#ifdef CONFIG_OF
 static const struct of_device_id jc42_of_ids[] = {
 	{ .compatible = "jedec,jc-42.4-temp", },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, jc42_of_ids);
-#endif
 
 static struct i2c_driver jc42_driver = {
 	.class		= I2C_CLASS_HWMON,
 	.driver = {
 		.name	= "jc42",
 		.pm = JC42_DEV_PM_OPS,
-		.of_match_table = of_match_ptr(jc42_of_ids),
+		.of_match_table = jc42_of_ids,
 	},
 	.probe		= jc42_probe,
 	.remove		= jc42_remove,
-- 
2.43.0.rc1.1336.g36b5255a03ac

