Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E91B17745;
	Wed, 10 Jun 2026 01:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781056168; cv=none; b=dINPA9LzMjnWZAWiTccXQojeKolOgdZ2AXKy45IfYRanViVoTpPRJI8fX8D2wvD2sRdsTvwH9mODZQAcd6Al0iojccarKk5KraYBexCzqm3dFXl8sxQq3TOCXgmsn4b7bEc4rAkKceDnNz0JvXr011/mvToCH7lHx3ueCtbCsCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781056168; c=relaxed/simple;
	bh=GeNqjlpqTxfWI5MxXPIr8CsB4xa4Ci6lPJIHL6QSk3g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tnxu/q+ETQlDLDtkhXXGUetoGcbIu+bs7n5eZWgLAfda/cIXY3+zZkRQW+JlExvL/ZNmw5Iqd5hkKA46Uvd+E4eaAd7M/246jWbAKY1wfiLExiav+eMMGW/wArW+wJbAMJEyjlS6lxH5tWRJEWVP5OF/jlkL2QQk0TJZZ079W1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 9789a460646e11f1aa26b74ffac11d73-20260610
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:be117e03-ea2f-4271-984e-0c5801c1fd9c,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:cc09ebfcad3fc90b3b6e1ce8a4c9cfa3,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|865|898,TC:nil,Content:0|1
	5|50,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:
	0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9789a460646e11f1aa26b74ffac11d73-20260610
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1053356942; Wed, 10 Jun 2026 09:49:17 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: cryolitia@uniontech.com,
	Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH v4 2/4] hwmon: (gpd-fan): Initialize EC before registering hwmon device
Date: Wed, 10 Jun 2026 09:49:10 +0800
Message-Id: <4be3734b135c8013157979ab5e80c7ee51243ddd.1781055639.git.xiaopei01@kylinos.cn>
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

Move the gpd_init_ec() call to before devm_hwmon_device_register_with_info
in the probe function. With the previous ordering the hwmon device was
registered and exposed to userspace before the EC initialization
completes, creating a window where sysfs reads could return invalid values.

Some buggy firmware won't initialize EC properly on boot. Before its
initialization, reading RPM will always return 0, and writing PWM will have
no effect. So move gpd_init_ec to before hwmon device register.

Fixes: 0ab88e239439 ("hwmon: add GPD devices sensor driver")
Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
changes in v4:
No changes

changes in v3:
1.Add v3 tag

changes in v2:
1.gpd_init_ec needed before hwmon registration, as separate bug fix
---
 drivers/hwmon/gpd-fan.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
index 7284babd4f5c..745b3fb9e3a4 100644
--- a/drivers/hwmon/gpd-fan.c
+++ b/drivers/hwmon/gpd-fan.c
@@ -643,6 +643,7 @@ static int gpd_fan_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(dev, data);
 
+	gpd_init_ec(data);
 	hwdev = devm_hwmon_device_register_with_info(dev,
 						     DRIVER_NAME,
 						     data,
@@ -651,9 +652,6 @@ static int gpd_fan_probe(struct platform_device *pdev)
 	if (IS_ERR(hwdev))
 		return dev_err_probe(dev, PTR_ERR(hwdev),
 				     "Failed to register hwmon device\n");
-
-	gpd_init_ec(data);
-
 	return 0;
 }
 
-- 
2.25.1

