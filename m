Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4472EC54C;
	Wed, 10 Jun 2026 01:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781056169; cv=none; b=DqMXkXz3/gFyfqkfAkNixh6IL23WMCxFABqrh0MVrE+BlNlwILI8ZZDlaLvbVwzev2uPpmd5+NIYH1d7QUvInj6Ip8Iv40EFDBxSBgH3gRB8kZuSQTu83ayGOL/7msk0v8G0COOGjc/fkqFFbOOBguzwXDdsuuRumyTNXByesfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781056169; c=relaxed/simple;
	bh=cVXQlRjygCDxAOwydV9uY5a/QLQC+hzXzqe89qZudig=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jil3ebI9jLx4KCSgFgcNOn2lPv6OERA7s6QQsiFpZShMeSt30PIJb+o/BAPNYxf7PQbIUVh5T/AnaGP9X9+4Xwnc1RKbE6CLZuH58t0MXZcy+dmVIOO9WjR3XAdFT+TtmT3DZT1S0/n/MPTixZymTN+CN9adBI4ouqP8N4xHQI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 97d333aa646e11f1aa26b74ffac11d73-20260610
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:49705e76-6389-4b32-bf89-d084d9a00e80,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:c834a6ad2cd66ce09ef2683dbc640129,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|865|898,TC:nil,Content:0|1
	5|50,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:
	0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 97d333aa646e11f1aa26b74ffac11d73-20260610
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2027105824; Wed, 10 Jun 2026 09:49:18 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: cryolitia@uniontech.com,
	Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH v4 4/4] hwmon: (gpd-fan): fix race condition between device removal and sysfs access
Date: Wed, 10 Jun 2026 09:49:12 +0800
Message-Id: <4400828422cf3a88adad4db224d9efccdb1049d2.1781055639.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1781055639.git.xiaopei01@kylinos.cn>
References: <cover.1781055639.git.xiaopei01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
changes in v4:
No changes.

changes in v3:
1.Add v3 tag

changes in v2:
1.Fix a race condition between device removal and sysfs access report by
sashiko-bot
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

