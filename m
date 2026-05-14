Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2E33093DF;
	Thu, 14 May 2026 01:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778721250; cv=none; b=FERJJ9FMe4lxwRuN7r9CEm39lrmCnHUmpRm1TbqtaRyTD4OXajwtkAu8NWK83ayHiA6kXRfZp77agxTvdRAU3XvVWsStPPmlhmKdGS539hC6P8GfOISJHQ2E6sKSOpVGiqe7W4HqEz1LAX7txYsgprtAXtESOcNVgNvYxdshmBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778721250; c=relaxed/simple;
	bh=206ZJi52YVqCPsmcE8rNx3mGgWx0LmTRdSIDdbqLAr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tO6bl+aJB7C/11Ogq0QXsXVdnk9eISJXJl9DBwvJjOsz2hCwyg/I/H3YCHcLzf+NDgf4YYYlIxEX1fOJxIkPRE9ErN8kD0IMii4viMBsGPkLqZH0osWQAt+AiHauxxNg/GKvEZ9xljtnVz3BcjwxcvVJDjbf3kvZlbAn1vyL7mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=HizGYsDb; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="HizGYsDb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=x+
	tjZgJ/1ED50GWoMRrtTY0DZaXuGmFDlBwH0MLLdtk=; b=HizGYsDbzQZFhJITTa
	4ssHc8Yv1QQTyaSAI2XVgUV1taCfNtz5OOwrnbrIgbM+aI5Pvg95d2x4e2PdaQn4
	Klgxv/kAoVdxvI/LTwJKDJ4aljjtCaxnES3q27iBB2+k8fBxdrunKK/mk/YFX5nk
	9eX/CewRoVJPgNAonDinA2srw=
Received: from debian.lenovo.com (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3Hy+1IQVqnFYFBQ--.27803S5;
	Thu, 14 May 2026 09:13:42 +0800 (CST)
From: Kean <rh_king@163.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kean <rh_king@163.com>
Subject: [PATCH 3/3] hwmon: lenovo-ec-sensors: Use devm_request_region for automatic cleanup
Date: Thu, 14 May 2026 09:14:11 +0800
Message-ID: <20260514011411.4167069-4-rh_king@163.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260514011411.4167069-1-rh_king@163.com>
References: <20260514011411.4167069-1-rh_king@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3Hy+1IQVqnFYFBQ--.27803S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxAFy5Kr48JFW3uFy3ur45Wrg_yoW5AF4kp3
	yrJFW5Wr95GFyj934kA3Z7ZFn3Aws3taySkry5Kwn3u3ZrJr98GrZ5A3Z29FW2yFW8J3Wf
	Xw15trWS9F4DXrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UPfHbUUUUU=
X-CM-SenderInfo: 5ukbyxlqj6il2tof0z/xtbC+wZVBGoFIcYMDQAA3l

Replace manual request_region()/release_region() with
devm_request_region(). This lets the device-managed framework
handle I/O region lifetime automatically and fixes:

- A double release_region() when probe fails after acquiring the
  I/O region: the probe error path releases it, and then
  lenovo_ec_init() releases it again on the same error path.

- A release-after-free in lenovo_ec_exit() where release_region()
  was called after platform_device_unregister(), which has already
  released the I/O region via the platform device removal path.

- Missing release_region() in lenovo_ec_probe() on the DMI match
  failure path, which leaked the I/O region.

Remove all manual release_region() calls that are now handled
automatically by the devm framework.

Signed-off-by: Kean <rh_king@163.com>

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
 drivers/hwmon/lenovo-ec-sensors.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/lenovo-ec-sensors.c b/drivers/hwmon/lenovo-ec-sensors.c
index b0f2a04ce679..ea74bddbad5a 100644
--- a/drivers/hwmon/lenovo-ec-sensors.c
+++ b/drivers/hwmon/lenovo-ec-sensors.c
@@ -519,8 +519,8 @@ static int lenovo_ec_probe(struct platform_device *pdev)
 	if (!ec_data)
 		return -ENOMEM;
 
-	if (!request_region(IO_REGION_START, IO_REGION_LENGTH, "LNV-WKS")) {
-		pr_err(":request fail\n");
+	if (!devm_request_region(dev, IO_REGION_START, IO_REGION_LENGTH, "LNV-WKS")) {
+		dev_err(dev, "Failed to request I/O region.\n");
 		return -EIO;
 	}
 
@@ -541,7 +541,6 @@ static int lenovo_ec_probe(struct platform_device *pdev)
 	    (inb_p(MCHP_EMI0_EC_DATA_BYTE1) != 'C') || 
 	    (inb_p(MCHP_EMI0_EC_DATA_BYTE2) != 'H') ||
 	    (inb_p(MCHP_EMI0_EC_DATA_BYTE3) != 'P')) {
-		release_region(IO_REGION_START, IO_REGION_LENGTH);
 		return -ENODEV;
 	}
 
@@ -579,7 +578,8 @@ static int lenovo_ec_probe(struct platform_device *pdev)
 		lenovo_ec_chip_info.info = lenovo_ec_hwmon_info_p8;
 		break;
 	default:
-		release_region(IO_REGION_START, IO_REGION_LENGTH);
+		dev_err(dev, "Unsupported platform type %ld\n",
+			(long)dmi_id->driver_data);
 		return -ENODEV;
 	}
 
@@ -608,10 +608,8 @@ static int __init lenovo_ec_init(void)
 		platform_create_bundle(&lenovo_ec_sensors_platform_driver,
 				       lenovo_ec_probe, NULL, 0, NULL, 0);
 
-	if (IS_ERR(lenovo_ec_sensors_platform_device)) {
-		release_region(IO_REGION_START, IO_REGION_LENGTH);
+	if (IS_ERR(lenovo_ec_sensors_platform_device)) 
 		return PTR_ERR(lenovo_ec_sensors_platform_device);
-	}
 
 	return 0;
 }
@@ -619,7 +617,6 @@ module_init(lenovo_ec_init);
 
 static void __exit lenovo_ec_exit(void)
 {
-	release_region(IO_REGION_START, IO_REGION_LENGTH);
 	platform_device_unregister(lenovo_ec_sensors_platform_device);
 	platform_driver_unregister(&lenovo_ec_sensors_platform_driver);
 }
-- 
2.47.3

