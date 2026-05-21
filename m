Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0E154654;
	Thu, 21 May 2026 03:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779335567; cv=none; b=GuEtk384MMwf9ECxHMWkpYaselmFfmpOQVn5SSccLnWsW4mS3F9NARRoUAFc6FXTixtMulqctlDEVX9f7m9jjpI5DM+CBmdMmP4TYGQaG+KAS1En0s7nCWDjhxa1fH4drRcba8goaPD3fCFLr6+/RNdYLL5W5r5PCKmdeD1yf84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779335567; c=relaxed/simple;
	bh=bUK2ho+j5toFRnjRQWI28+5pwi4bUAMybKGDmA4lTD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m7e6P7NJo3R0U2TXhTMkP2zyB6j5VgiuvL4LjQGK5PvLoD/1jzlV5gnQOdaExJdwc1niKfhid6nKRyZMEsTYV1b5iF2TM5lnlhwq5vshGrSpgsMr3emSHgmtSzqBSL68D2P/as1fTyzj1rfpO4ObEwkbm9AwWO2XeCfWyGfqgJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=lnbDvau9; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="lnbDvau9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=hI
	KMTgwdfCd2LgtR+i3HDZWojkJBdv53ri/ogj5zX4I=; b=lnbDvau9xhR9r3NVTg
	Rn+u+irQi5i1j14CA2+NczbDEA8i2YFgXtYTW5y7nsfsIe2h4cITl50D+yxK3tSO
	AeSFu24i0FRbOc14TZFHiIfYD3JuAR4o3vGCAKle0XW9fU4xvsAKnbbL4Vqd7wHO
	DqIzKAh8/ncHeNN42ZThpm4i0=
Received: from debian.lenovo.com (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3Xx5ngQ5qPDdQCg--.18159S3;
	Thu, 21 May 2026 11:52:12 +0800 (CST)
From: Kean Ren <rh_king@163.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kean Ren <rh_king@163.com>
Subject: [PATCH v3 1/2] hwmon: (lenovo-ec-sensors): Convert to  devm_request_region()
Date: Thu, 21 May 2026 11:52:27 +0800
Message-ID: <20260521035228.533317-2-rh_king@163.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260521035228.533317-1-rh_king@163.com>
References: <20260514011411.4167069-1-rh_king@163.com>
 <20260521035228.533317-1-rh_king@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3Xx5ngQ5qPDdQCg--.18159S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxAFy8KFy8AryruF47KrW8Xrb_yoW5ZFyfp3
	yrJFW5ur95GFyj934DAas7ZFn3Aws3t3y0kryYgws3u3ZrJryDWrWkAFn29FW2yFW8J3Wr
	X34DtrWS9F4DXr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pMVby-UUUUU=
X-CM-SenderInfo: 5ukbyxlqj6il2tof0z/xtbC+wyZSGoOgWyMwAAA3j

Replace manual request_region()/release_region() with
devm_request_region().  This lets the device-managed framework
handle I/O region lifetime automatically and fixes:

- A double release_region() when probe fails after acquiring the
  I/O region: the probe error path releases it, and then
  lenovo_ec_init() releases it again on the same error path.

- A release-after-use window in lenovo_ec_exit() where
  release_region() was called before platform_device_unregister(),
  leaving the hwmon device active with a released I/O region.

- Missing release_region() in lenovo_ec_probe() if
  devm_hwmon_device_register_with_info() fails.

Remove all four manual release_region() calls that are now handled
automatically and replace request_region with
devm_request_region, use dev_err replace pr_err.

Also remove the now-unnecessary braces around the single-statement
if body.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Kean Ren <rh_king@163.com>
---
Changes in v3: Corrected bug description.

 drivers/hwmon/lenovo-ec-sensors.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/lenovo-ec-sensors.c b/drivers/hwmon/lenovo-ec-sensors.c
index 8681bbf6665b..a16cc5e4053a 100644
--- a/drivers/hwmon/lenovo-ec-sensors.c
+++ b/drivers/hwmon/lenovo-ec-sensors.c
@@ -519,8 +519,8 @@ static int lenovo_ec_probe(struct platform_device *pdev)
 	if (!ec_data)
 		return -ENOMEM;
 
-	if (!request_region(IO_REGION_START, IO_REGION_LENGTH, "LNV-WKS")) {
-		pr_err(":request fail\n");
+	if (!devm_request_region(dev, IO_REGION_START, IO_REGION_LENGTH, "LNV-WKS")) {
+		dev_err(dev, "Failed to request I/O region\n");
 		return -EIO;
 	}
 
@@ -540,10 +540,8 @@ static int lenovo_ec_probe(struct platform_device *pdev)
 	if ((inb_p(MCHP_EMI0_EC_DATA_BYTE0) != 'M') &&
 	    (inb_p(MCHP_EMI0_EC_DATA_BYTE1) != 'C') &&
 	    (inb_p(MCHP_EMI0_EC_DATA_BYTE2) != 'H') &&
-	    (inb_p(MCHP_EMI0_EC_DATA_BYTE3) != 'P')) {
-		release_region(IO_REGION_START, IO_REGION_LENGTH);
+	    (inb_p(MCHP_EMI0_EC_DATA_BYTE3) != 'P'))
 		return -ENODEV;
-	}
 
 	dmi_id = dmi_first_match(thinkstation_dmi_table);
 
@@ -577,7 +575,6 @@ static int lenovo_ec_probe(struct platform_device *pdev)
 		lenovo_ec_chip_info.info = lenovo_ec_hwmon_info_p8;
 		break;
 	default:
-		release_region(IO_REGION_START, IO_REGION_LENGTH);
 		return -ENODEV;
 	}
 
@@ -606,10 +603,8 @@ static int __init lenovo_ec_init(void)
 		platform_create_bundle(&lenovo_ec_sensors_platform_driver,
 				       lenovo_ec_probe, NULL, 0, NULL, 0);
 
-	if (IS_ERR(lenovo_ec_sensors_platform_device)) {
-		release_region(IO_REGION_START, IO_REGION_LENGTH);
+	if (IS_ERR(lenovo_ec_sensors_platform_device))
 		return PTR_ERR(lenovo_ec_sensors_platform_device);
-	}
 
 	return 0;
 }
@@ -617,7 +612,6 @@ module_init(lenovo_ec_init);
 
 static void __exit lenovo_ec_exit(void)
 {
-	release_region(IO_REGION_START, IO_REGION_LENGTH);
 	platform_device_unregister(lenovo_ec_sensors_platform_device);
 	platform_driver_unregister(&lenovo_ec_sensors_platform_driver);
 }
-- 
2.53.0

