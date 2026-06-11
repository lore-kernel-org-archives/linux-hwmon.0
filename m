Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9F43597B;
	Thu, 11 Jun 2026 00:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781138670; cv=none; b=Dd2TrxGenGBSWlgIVub/iWaHx8Zawy1cTOz2t9X3OXcYmcUtWXZ6bcT1IMQay66wcbghEXVS0rRV/pZLl9KV2MnbZYLnqGpNnob6c4aqLpLlQeZik6iTTKSZTPRwHKS408h2JBJGLm1Qj9gL1KhUAx5MFOdNJaK4leg/3zNr9LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781138670; c=relaxed/simple;
	bh=C5kjerUoUSMhtL1FY++9cjG9ruASZOP78AInFfdyY5A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nOr60Cy0Kpeb8qO/YWx+xoPZCF+hA9XX4iba0Xy35jPCJTroSLhaHBhL8x1yuvuoVfX2WsnoNIeJdsiJsjl/sibx0evMfJ1UHoVd1MpMW0NzweVTITJMlkc0OHxtuyWWrvLXVUyN80Dviyy3YkmumDyecLyXTTWChs6FAu2qlY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: ad8e8b0c652e11f1aa26b74ffac11d73-20260611
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:6bc981bc-56f5-47e6-8dd0-6bd50499f766,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:f8b0965145fce219b7961412b396200e,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ad8e8b0c652e11f1aa26b74ffac11d73-20260611
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 969716503; Thu, 11 Jun 2026 08:44:17 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: cryolitia@uniontech.com,
	Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH v2] hwmon: (gpd-fan) Reject EC PWM value 0 as invalid
Date: Thu, 11 Jun 2026 08:44:14 +0800
Message-Id: <1c2ffa0d832ae3a74f6d4ffa7cc7b7e6cced69e3.1781138459.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The EC firmware is expected to return values in [1, pwm_max]. A read of 0
is illegal and would cause underflow in the conversion formula. Explicitly
check for 0 and return -EIO.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
changlogs in v2
1.Use the same comment format as the original driver.
---
 drivers/hwmon/gpd-fan.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
index d1993cd645cb..ed212615b2fe 100644
--- a/drivers/hwmon/gpd-fan.c
+++ b/drivers/hwmon/gpd-fan.c
@@ -341,6 +341,10 @@ static int gpd_wm2_read_pwm(struct gpd_fan_data *data)
 
 	gpd_ecram_read(drvdata, drvdata->pwm_write, &var);
 
+	// EC PWM register valid range is 1 ~ pwm_max; 0 is an invalid state
+	if (unlikely(!var))
+		return -EIO;
+
 	// Match gpd_generic_write_pwm(u8) below
 	return DIV_ROUND_CLOSEST((var - 1) * 255, (drvdata->pwm_max - 1));
 }
-- 
2.25.1

