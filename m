Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA6730498E;
	Wed, 10 Jun 2026 01:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781056166; cv=none; b=I1G+WdC64OnaGrvHKCeg+jHfeIhaM6fORhbuZt8b/mmx/73ekCwUp2igqWT/rizZGyQQXcEC3WoUXb68Nj4CWkwEBBuK0AsyQRgYOXXn6AgQjQUT6+QoayznKBcrDyL762mhB6833dljQdlPjJR17BLwL+vK1PIY/FlMcaVMw4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781056166; c=relaxed/simple;
	bh=y1MWajtQHSqQDF7SSEa84yc+lLM53hC6IdiAXzXolyg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I4KuqH14CsmSvjU2K2yr/3DM1+5fSuvtUSx8RaJvB86dQAqLo/1VX/GlBMG8T2HN/EMGOI7iMesmSLKy4plm4DdXVPCs0gP6xySYXb0sqHKknyYeQkl5LjTjbcB+6J8gu6GJO3jfDm3Qil9s3kdz2tJVgEzM21DULSgCRy6bl48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 97ae461c646e11f1aa26b74ffac11d73-20260610
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:f60f99ca-9c51-4aab-8234-8d9e321e0a92,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:589b620ea6047ad3368b3eb7941c3aa0,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|136|850|865|898,TC:nil,Content
	:0|15|50,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 97ae461c646e11f1aa26b74ffac11d73-20260610
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1127309952; Wed, 10 Jun 2026 09:49:17 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: cryolitia@uniontech.com,
	Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH v4 3/4] hwmon: (gpd-fan): upgrade log level from warn to err for platform device creation failure
Date: Wed, 10 Jun 2026 09:49:11 +0800
Message-Id: <aeb2eaa6df90178b18057a8022a0eccde7bbc82c.1781055639.git.xiaopei01@kylinos.cn>
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

When platform_create_bundle() fails, the error is fatal and prevents the
driver from loading. Use pr_err() instead of pr_warn() to clearly indicate
a critical failure.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
changes in v4:
No changes.

changes in v3:
1.Add v3 tag.

changes in v2:
1.No changes.
---
 drivers/hwmon/gpd-fan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
index 745b3fb9e3a4..1b57a5add934 100644
--- a/drivers/hwmon/gpd-fan.c
+++ b/drivers/hwmon/gpd-fan.c
@@ -712,7 +712,7 @@ static int __init gpd_fan_init(void)
 							 match, sizeof(*match));
 
 	if (IS_ERR(gpd_fan_platform_device)) {
-		pr_warn("Failed to create platform device\n");
+		pr_err("Failed to create platform device\n");
 		return PTR_ERR(gpd_fan_platform_device);
 	}
 
-- 
2.25.1

