Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5FB3019A9;
	Wed, 20 May 2026 02:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779244240; cv=none; b=fT7JGOyOc2AQzSUwNpgbQtNsD1hH5RjfX0ATUB7mIolcBnLzfOnJcFwCDv+A0GD1aw+ddh+pf+Ao3zSGvNF1bm5wIV9DY+3/7JpCiPBRYXZtmAZ0RWt9VvOLq0cfae39AHbk+Ft2R73XSW7/BxJW6AH5tlYCuVekOJELttC17cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779244240; c=relaxed/simple;
	bh=7hsrC4mU+Vd1CYhB/cOLhnIob/AA5OunNE9DgaHsniM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KPe/LdgOh9Vwm8BaL9pb1sm/eTHknBBVFeW675/qkOTLsQeJYDl66xDG2yX+sBJYibWSMC2/1oSpfCF5/HVSu/R7J4HXsJtyUckCpXCjI3etmgcIQrx0hGEeTDBSwzJ4RCl8DidAF27uSpftxcXTUgASPFFfpGJdvuE73yYTUBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=GZ8u5nz2; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="GZ8u5nz2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=wb
	OR+Um3EBSBW9xROm14bteOm8bcza8Ax6vhcc4xm2w=; b=GZ8u5nz2P2CVgmwbpm
	2o0m9lV0VfzfV7sruahAV6CweW7Mt9EUcBrXPHIbXPlhpg37laU1BBNpaXAd33eg
	J4rh6Q0t6FNifq+i5+QiHV2Doml+yBP0xrrbRpBMKP/tKL1LesyrSKAaFjtOSsxz
	YgQh5NhUh8a5UwmWVK45FmJ4A=
Received: from debian.lenovo.com (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wCH7QulHA1qB42DCQ--.11360S3;
	Wed, 20 May 2026 10:30:11 +0800 (CST)
From: Kean Ren <rh_king@163.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kean Ren <rh_king@163.com>
Subject: [PATCH v2 1/2] hwmon: (lenovo-ec-sensors): Convert to devm_request_region()
Date: Wed, 20 May 2026 10:29:45 +0800
Message-ID: <20260520022946.17335-2-rh_king@163.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520022946.17335-1-rh_king@163.com>
References: <20260514011411.4167069-1-rh_king@163.com>
 <20260520022946.17335-1-rh_king@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCH7QulHA1qB42DCQ--.11360S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxAFy8KFy8AryruF47KrW8Xrb_yoW5WFy7p3
	yrJFZ8urykGFyUu34DAF1kZFn5Aws3t3ySkry5Kw4fu3ZrJryDGrs5AFn29FZrtay8J3Wr
	X34UtrWS9F4DXw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pMVby-UUUUU=
X-CM-SenderInfo: 5ukbyxlqj6il2tof0z/xtbC4BUSwGoNHLXg8wAA36

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

Remove all five manual release_region() calls that are now handled
automatically, and drop the unnecessary braces on the single-statement
blocks that previously contained them.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Kean Ren <rh_king@163.com>
---
Changes in v2: Removed unnecessary error messages

 drivers/hwmon/lenovo-ec-sensors.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/lenovo-ec-sensors.c b/drivers/hwmon/lenovo-ec-sensors.c
index 8681bbf6665b..45db49e189d3 100644
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
 
@@ -541,7 +541,6 @@ static int lenovo_ec_probe(struct platform_device *pdev)
 	    (inb_p(MCHP_EMI0_EC_DATA_BYTE1) != 'C') &&
 	    (inb_p(MCHP_EMI0_EC_DATA_BYTE2) != 'H') &&
 	    (inb_p(MCHP_EMI0_EC_DATA_BYTE3) != 'P')) {
-		release_region(IO_REGION_START, IO_REGION_LENGTH);
 		return -ENODEV;
 	}
 
@@ -577,7 +576,6 @@ static int lenovo_ec_probe(struct platform_device *pdev)
 		lenovo_ec_chip_info.info = lenovo_ec_hwmon_info_p8;
 		break;
 	default:
-		release_region(IO_REGION_START, IO_REGION_LENGTH);
 		return -ENODEV;
 	}
 
@@ -607,7 +605,6 @@ static int __init lenovo_ec_init(void)
 				       lenovo_ec_probe, NULL, 0, NULL, 0);
 
 	if (IS_ERR(lenovo_ec_sensors_platform_device)) {
-		release_region(IO_REGION_START, IO_REGION_LENGTH);
 		return PTR_ERR(lenovo_ec_sensors_platform_device);
 	}
 
@@ -617,7 +614,6 @@ module_init(lenovo_ec_init);
 
 static void __exit lenovo_ec_exit(void)
 {
-	release_region(IO_REGION_START, IO_REGION_LENGTH);
 	platform_device_unregister(lenovo_ec_sensors_platform_device);
 	platform_driver_unregister(&lenovo_ec_sensors_platform_driver);
 }
-- 
2.53.0

