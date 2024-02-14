Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1733556762
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Feb 2024 14:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707921235; cv=none; b=RnFU3FWn2BTV1Swg7MVLSn+9fJTQmWJZYC8vp/8elgLw2Ad+bcON+k73qdwW9KsC/td7O0VeHiDsF6lVHx+RHe6VpS7In2WC8i65Wddljcu8rGwSCOplQkk2TXhK8eP9XPEWtLR/ab8zvRvvUJItiGUEz/OHDe6Y0ntMRei64I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707921235; c=relaxed/simple;
	bh=TDLKnlqgzdAJtOO0ShEHMeTqJtxDQcOeKmSlYXwguls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=mkrzDYBPgIepcrceB3Hab6wmwOf1Unll68Ecbu1a5TGjOMLA/kEsbPGmHKDbWk4ZZbhln3Stb0g2Ga6xDoI4prAQMyi0O7ftLBGUEHrhnFwlKHNaOLkXJSGUhiEofcERowASyBzgG3RAp8sbJloGEB4MlBaRpCZk9XbLZusyv/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=0MzlXEnj; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="0MzlXEnj"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41EEURfW029829;
	Wed, 14 Feb 2024 09:33:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=DKIM; bh=+XSWmumf+6nTIJRq5ZBYYG+3vXAfjgmOpCHseUaCVd4=; b=
	0MzlXEnjM7TQtkcFV/Y5SvnKDp0si8FSv5Cc0f1L76GDSjMOeFh7mTWq5CuNmg+s
	VusPWMdmLrc87YYPsFXKy0vlj2+fcyuqDXwZZL1nYkMmaWps7IAONdoXGe4qTS/t
	lAjF7akKrLnuxvoXSuNl2sQCUKVusKV9cmO0BfzF4nYBNNxEkXDUxtBhG4IRl9cz
	pMcSPuayZSU57w0cWLFTjniWQWtMev3BWkV8gNObpWq4G10MEKXAvzaozdRv1hlb
	/LIYAxbHwzq/UpnZJleLxjbn70WxIvCEd0S2Qf9e06OqWCMVdVNTuaVo/dSUUDWB
	R4kh/ezXDMOKB93wcXpYig==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3w8ybcg0fy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Feb 2024 09:33:41 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 41EEXeiN018594
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 Feb 2024 09:33:40 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Wed, 14 Feb
 2024 09:33:39 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Wed, 14 Feb 2024 09:33:39 -0500
Received: from [127.0.0.1] ([10.44.3.56])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 41EEXStG008866;
	Wed, 14 Feb 2024 09:33:34 -0500
From: Nuno Sa <nuno.sa@analog.com>
Date: Wed, 14 Feb 2024 15:36:45 +0100
Subject: [PATCH 3/3] hwmon: (axi-fan-control) Make use of dev_err_probe()
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240214-axi-fan-control-no-of-v1-3-43ca656fe2e3@analog.com>
References: <20240214-axi-fan-control-no-of-v1-0-43ca656fe2e3@analog.com>
In-Reply-To: <20240214-axi-fan-control-no-of-v1-0-43ca656fe2e3@analog.com>
To: <linux-hwmon@vger.kernel.org>
CC: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707921408; l=2688;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=TDLKnlqgzdAJtOO0ShEHMeTqJtxDQcOeKmSlYXwguls=;
 b=qH/W/xJdtz7HLsJ8j4zJ9iylMYx664mbxXc/TrFuPWDuMCLUfYG0iM6W9KMsRIw+eTv0UNnrE
 IKYw45rfqQfBuMw+CMpoL1iRkXBIZdXKCXNgsat5TC2JmSHosKkgPGB
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: gG0dNLtM32hkE-OxsPylpbRlxOxJQDFF
X-Proofpoint-ORIG-GUID: gG0dNLtM32hkE-OxsPylpbRlxOxJQDFF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-14_07,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 malwarescore=0 spamscore=0
 clxscore=1015 mlxlogscore=750 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402140111

Use dev_err_probe() to slightly simplify printing errors during probe.
No functional changes intended.

Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 drivers/hwmon/axi-fan-control.c | 40 ++++++++++++++++++----------------------
 1 file changed, 18 insertions(+), 22 deletions(-)

diff --git a/drivers/hwmon/axi-fan-control.c b/drivers/hwmon/axi-fan-control.c
index efd42a4f5951..35c862eb158b 100644
--- a/drivers/hwmon/axi-fan-control.c
+++ b/drivers/hwmon/axi-fan-control.c
@@ -466,10 +466,9 @@ static int axi_fan_control_probe(struct platform_device *pdev)
 		return PTR_ERR(ctl->base);
 
 	clk = devm_clk_get_enabled(&pdev->dev, NULL);
-	if (IS_ERR(clk)) {
-		dev_err(&pdev->dev, "clk_get failed with %ld\n", PTR_ERR(clk));
-		return PTR_ERR(clk);
-	}
+	if (IS_ERR(clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(clk),
+				     "clk_get failed\n");
 
 	ctl->clk_rate = clk_get_rate(clk);
 	if (!ctl->clk_rate)
@@ -477,22 +476,20 @@ static int axi_fan_control_probe(struct platform_device *pdev)
 
 	version = axi_ioread(ADI_AXI_REG_VERSION, ctl);
 	if (ADI_AXI_PCORE_VER_MAJOR(version) !=
-	    ADI_AXI_PCORE_VER_MAJOR((*id))) {
-		dev_err(&pdev->dev, "Major version mismatch. Expected %d.%.2d.%c, Reported %d.%.2d.%c\n",
-			ADI_AXI_PCORE_VER_MAJOR(*id),
-			ADI_AXI_PCORE_VER_MINOR(*id),
-			ADI_AXI_PCORE_VER_PATCH(*id),
-			ADI_AXI_PCORE_VER_MAJOR(version),
-			ADI_AXI_PCORE_VER_MINOR(version),
-			ADI_AXI_PCORE_VER_PATCH(version));
-		return -ENODEV;
-	}
+	    ADI_AXI_PCORE_VER_MAJOR((*id)))
+		return dev_err_probe(&pdev->dev, -ENODEV,
+				     "Major version mismatch. Expected %d.%.2d.%c, Reported %d.%.2d.%c\n",
+				     ADI_AXI_PCORE_VER_MAJOR(*id),
+				     ADI_AXI_PCORE_VER_MINOR(*id),
+				     ADI_AXI_PCORE_VER_PATCH(*id),
+				     ADI_AXI_PCORE_VER_MAJOR(version),
+				     ADI_AXI_PCORE_VER_MINOR(version),
+				     ADI_AXI_PCORE_VER_PATCH(version));
 
 	ret = axi_fan_control_init(ctl, &pdev->dev);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to initialize device\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to initialize device\n");
 
 	ctl->hdev = devm_hwmon_device_register_with_info(&pdev->dev,
 							 name,
@@ -511,10 +508,9 @@ static int axi_fan_control_probe(struct platform_device *pdev)
 					axi_fan_control_irq_handler,
 					IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
 					pdev->driver_override, ctl);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to request an irq, %d", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to request an irq\n");
 
 	return 0;
 }

-- 
2.43.0

