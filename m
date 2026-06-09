Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18912BDC2A;
	Tue,  9 Jun 2026 07:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780990909; cv=none; b=ZJ2npgvRdnZ+vtWHgRSHlbISy9yc1FtCcz2mfvht/N8HK10engKtR6SDqlmndXSSyg/TjcE2ajRq94b5cvmj5BoH/ku3QwMo68BU1gjWzj3QGs8L5YGeh7Alz3rYyLdsaqRsjavShwAsbtqLNAa1QkEmkAyjIcDW4T+j+aw8ciI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780990909; c=relaxed/simple;
	bh=a0TlZLYUGvxlDhpq0IRTNK/Qmu508H/v2uERW3SblrA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=h6P0wcjPaESN352ejUerNf+dBOyt7UcL+QtQs79hb1Bf1te7p4fU4L1eK6ugupdFDdnZ0Xxp+SMIX1eck2F1wVUMHJ2FByW4mDbQWYpSND/ZAc26psfYdrEZ7+XLsTShlhT/nhy8PsdjGCWpsx/ZR/YAU941BdzzJDXUhZZBpwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: a624b7c863d611f1aa26b74ffac11d73-20260609
X-CID-CACHE: Type:Local,Time:202606091539+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:9999ec4f-b0b5-4617-bf13-c3b26935d26e,IP:0,U
	RL:0,TC:0,Content:41,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:66
X-CID-META: VersionHash:e7bac3a,CLOUDID:bf3a64d8831227134dc6f5bbfef26f94,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:4|15|50,E
	DM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a624b7c863d611f1aa26b74ffac11d73-20260609
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 46303761; Tue, 09 Jun 2026 15:41:38 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: cryolitia@uniontech.com,
	Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH] hwmon: (gpd-fan) Reject EC PWM value 0 as invalid
Date: Tue,  9 Jun 2026 15:41:35 +0800
Message-Id: <cbdc1df2ed3443b08cbd1fc2652638deaf798c4b.1780990542.git.xiaopei01@kylinos.cn>
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
 drivers/hwmon/gpd-fan.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
index d1993cd645cb..decb61936b95 100644
--- a/drivers/hwmon/gpd-fan.c
+++ b/drivers/hwmon/gpd-fan.c
@@ -341,7 +341,11 @@ static int gpd_wm2_read_pwm(struct gpd_fan_data *data)
 
 	gpd_ecram_read(drvdata, drvdata->pwm_write, &var);
 
-	// Match gpd_generic_write_pwm(u8) below
+	/* EC PWM register valid range is 1 ~ pwm_max; 0 is an invalid state */
+	if (unlikely(!var))
+		return -EIO;
+
+	/* Match gpd_generic_write_pwm() below */
 	return DIV_ROUND_CLOSEST((var - 1) * 255, (drvdata->pwm_max - 1));
 }
 
-- 
2.25.1

