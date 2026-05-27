Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F2E3EE1DD;
	Wed, 27 May 2026 10:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779876641; cv=none; b=kmIaPjEpIs9aFLZPcIWKUKXwSixtjQZjEaZLP9Opj6TvDchYT7EFi58viaAixHKHF0WwgYtLUw6uFfVG3+GTA8bbcJSPeFrYcoJ3273/0uVsDC5sJyfcxtgkdDW0242kYQzl3v56Kpo9GRP4jhPG2Z2mVOCErdy8YbHL5GAjKCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779876641; c=relaxed/simple;
	bh=Ol3glDq6H5Br2QeDO7jhgv4EWGxPA2aIhuJTtiASi9I=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=ABkUPRojUDArnIEkJU66i4EWAb8KypFpT2vOQVQbflmDbTt0B3Lzn1xds+f8cJm4SV0KeCr6MrtptyS3f3DrsNqgoYHLHV335d9d+cFUjsad5grcHqRuIMOj/xdyJN/xy3Cmf5VJM/KvlJu15Uetdr0teZzPY7W6eS4M2lI9Cfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=m9G42cOJ; arc=none smtp.client-ip=162.62.57.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="m9G42cOJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1779876627;
	bh=4z1/pgQ8KqDxpTzdwrUunL5u1UbgBCHZPktnK3HpEUU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=m9G42cOJ2180PcFd3V2TiZEM35KLdwdYdDPQUpfJRjjdUmVnAE6YyqgkTlWeDautZ
	 lTA5gOZmDKxuZfj5JcRthpgvFg4ZwWGF6v4splIIhwea0/tlJe1uD6Hjsgki2d1S9d
	 jMR79JKjI7aPAHQ1H6ca+4fCyov0lPLJ7A+Kn1xI=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 29704417; Wed, 27 May 2026 18:10:23 +0800
X-QQ-mid: xmsmtpt1779876626twvv8frjk
Message-ID: <tencent_395A116FDCB95475901B5E5C27237380AE08@qq.com>
X-QQ-XMAILINFO: MRMtjO3A6C9XbL8tSaNaDSJdvqhC7JnbPNOAmpJOjM7tHjMNVWmFlOgdHicH+Q
	 KXY2wEIEMVHQ2YJCpFfig8pDQ50F0JLW9VLjhX+EzifTkMeqIfwu8S2nA97KNdQx5MXxW9KL02Xc
	 8oJisvAq/8yW2cFJtGpNIEbYVwqS1fWw+WYRb071iFlYAwshRKvfaXehbkJJBZ6NzYo3jumIgchR
	 0CDJbV4/7hs6YgH+W+vNX4HF/07MQ6Q8gQ6oyftxHEKJM+TUJVuw8ggLEeqVvtR6iPa03bl2Vooq
	 2v9quwRHxCI+//c/6jv1AgdCusGQZjZKwQCutXshl0C/k+hjh7egkPXp5hCe5Z2v8gAPgWPA8Omt
	 CqPv5SXbmkTetGlUyffx1RNJ9s91Nvd5qDXGID825kMiGWiNs4Sv3tFG1MxLFoC09yBl6TC6r+V3
	 nuY0/oPNlmEeTB2juxXAvfIEYSg3zOv/cZ7DIgVVi8T+9tONFNYt5xk17bpGt2hFzixfifjQxSbm
	 0bvsh3o71VOmr9wQXPGor9Fw63HoGORbM9qXMvC0oAHrQ/Nmowb5+cf6FH5tL16yYYpu/6d7h2M4
	 AwyEKaOtYdnBxT1tT4utg2rhomKn3Q9PLiN0niauvtesF3TzoMl3hcOVDDmk+L9h89q0gdBN4RuX
	 Cp7xAfquDrObBiwVLrb8pB2/vfgnKCw3CxoVkF6DtW4G6aNs8DfbU8HwsuVwH0xDLbSXNT7wJ7nm
	 8X/uO53AMW16mD2kCErPChO9qG2aOn6nvrWrRoY5ryRZcVyNDEEdee85tAJ/GslDlMBeDCk3SM46
	 s2FNUfxkeE2y2DHKHe3r/0kgfF8SfCUuJ/bmFq4TSFpxtsdA7Bkj+E/wzy7lA+ZLr4ZWM+TSKDsQ
	 UAXhQkYLb6rgEKeVPUKt60ofZ23Bp1AwiWhk7qN1GkWHrDdaMQyZADDciIxMm5/QbE7+bew2mqlS
	 d5DlBIuHK1sFEU6TOtRrNwIE0hv1jo2VcMzqT2qeiP4aSsIqFrKZZVqndjW8/bXcPoNs6DcygZhp
	 eUg/YimaAqPpIypzds
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: xiaopeitux@foxmail.com
To: cryolitia@uniontech.com,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH 4/4] hwmon: (gpd-fan): fix race condition between device removal and sysfs access
Date: Wed, 27 May 2026 18:10:21 +0800
X-OQ-MSGID: <17fe1cce7705f8ea79a44541834b7eef101f0e3a.1779876412.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1779876412.git.xiaopei01@kylinos.cn>
References: <cover.1779876412.git.xiaopei01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pei Xiao <xiaopei01@kylinos.cn>

Replace the manual gpd_fan_remove() callback with a devres-managed
action using devm_add_action_or_reset(). The original remove hook
resets the fan to AUTOMATIC mode, but the hwmon sysfs interface
(registered with devm_hwmon_device_register_with_info()) remains
active until after the remove callback completes. This creates a
race window where a concurrent userspace sysfs access can interleave
with the EC I/O sequence, potentially corrupting EC registers.

Using devm_add_action_or_reset() registers the reset function as a
devres action. Due to the LIFO release order of devres, the hwmon
device is unregistered (sysfs removed) before the reset action
executes, eliminating the race condition.

Fixes: 0ab88e239439 ("hwmon: add GPD devices sensor driver")
Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/hwmon/gpd-fan.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
index 1b57a5add934..d1993cd645cb 100644
--- a/drivers/hwmon/gpd-fan.c
+++ b/drivers/hwmon/gpd-fan.c
@@ -609,6 +609,16 @@ static void gpd_init_ec(struct gpd_fan_data *data)
 		gpd_win4_init_ec(data);
 }
 
+static void gpd_fan_reset_hardware(void *pdata)
+{
+	struct gpd_fan_data *data = pdata;
+
+	if (data) {
+		data->pwm_enable = AUTOMATIC;
+		gpd_set_pwm_enable(data, AUTOMATIC);
+	}
+}
+
 static int gpd_fan_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -617,6 +627,7 @@ static int gpd_fan_probe(struct platform_device *pdev)
 	struct device *hwdev;
 	struct gpd_fan_data *data;
 	const struct gpd_fan_drvdata *match;
+	int ret;
 
 	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
 	if (!res)
@@ -644,6 +655,11 @@ static int gpd_fan_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, data);
 
 	gpd_init_ec(data);
+
+	ret = devm_add_action_or_reset(dev, gpd_fan_reset_hardware, data);
+	if (ret)
+		return ret;
+
 	hwdev = devm_hwmon_device_register_with_info(dev,
 						     DRIVER_NAME,
 						     data,
@@ -655,19 +671,8 @@ static int gpd_fan_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static void gpd_fan_remove(struct platform_device *pdev)
-{
-	struct gpd_fan_data *data = dev_get_drvdata(&pdev->dev);
-
-	if (data) {
-		data->pwm_enable = AUTOMATIC;
-		gpd_set_pwm_enable(data, AUTOMATIC);
-	}
-}
-
 static struct platform_driver gpd_fan_driver = {
 	.probe = gpd_fan_probe,
-	.remove = gpd_fan_remove,
 	.driver = {
 		.name = KBUILD_MODNAME,
 	},
-- 
2.25.1

