Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815B737164
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Feb 2024 14:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707921233; cv=none; b=JP9BdAn+lU3OjtNLjVXEH9dpPY+TF7QmORjzXp3PBdEV3uXSnNeWd7rAqvCmB6Rh1mulbYlwK+btvNUrLA6CZDATnu2cdNFrlcH9DkhqVee1tCJDyUBsC8wPLGCPDujh8BqQWc7HS85vDwTGuAQbNPFm1jXxXH9yvOBqNXA08os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707921233; c=relaxed/simple;
	bh=x7OShTw2eoZWfTDmTXjvc6IJ8ZKOJjhW41AkwIQ+FcI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=AktKjdEopRLhC7DVL+8LaeeoEsg7J1oeDo8v7+wDq6mOeYxkljvWpUrv9ZrHjQjsbWytJfyM9o6qus2bXAtpstlV3Dx/LQZDWdyQJOk8E/b1aCs4cBWLLBRiOWwMVabzW9O3wiRELehZMfz6hZe1uw75iiYL1+e4kvgGsRDhDfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=WKK9A6rW; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="WKK9A6rW"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41E8dY2x030737;
	Wed, 14 Feb 2024 09:33:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=DKIM; bh=Cvd7tLXXML7bmmm8ZBtVd/pa3xN6L4fgcsZd9lqusFw=; b=
	WKK9A6rWMokm3Yu5qBD1w73Wg/5nfoA/+63/eOuekMsCVTMIf0dQPBt+/h7LWjNb
	YCWjRnw6UNHdMuYxHW+k/uckypJSc1sd5mPtWG2ro7LDAGlHsK5AzCBmWDX4C6lJ
	FOjWPXj/A89eQAztEf9AsI8iPOpZXDKYinMPDsKviim+YxXUdEoXSk8uFhHds9Pa
	z9TcsqOwwjKa/oQfaD+9WyaznKD5ArGIP6CRv/iMqt78O3ScZ+zP7lXSKjsWdm40
	us7FPVivE9bZRfRyfYiMRgRMMozqs9Gidu8cWvNZ22ekFQHirUYW4k2zviLCDeB0
	8hjq30nPvZoLvndQZGM04g==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3w6purdp6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Feb 2024 09:33:38 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 41EEXaGR018586
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 Feb 2024 09:33:36 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Wed, 14 Feb
 2024 09:33:35 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Wed, 14 Feb 2024 09:33:35 -0500
Received: from [127.0.0.1] ([10.44.3.56])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 41EEXStE008866;
	Wed, 14 Feb 2024 09:33:33 -0500
From: Nuno Sa <nuno.sa@analog.com>
Date: Wed, 14 Feb 2024 15:36:43 +0100
Subject: [PATCH 1/3] hwmon: (axi-fan-control) Use device firmware agnostic
 API
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240214-axi-fan-control-no-of-v1-1-43ca656fe2e3@analog.com>
References: <20240214-axi-fan-control-no-of-v1-0-43ca656fe2e3@analog.com>
In-Reply-To: <20240214-axi-fan-control-no-of-v1-0-43ca656fe2e3@analog.com>
To: <linux-hwmon@vger.kernel.org>
CC: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707921408; l=3704;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=x7OShTw2eoZWfTDmTXjvc6IJ8ZKOJjhW41AkwIQ+FcI=;
 b=8wUaoB6v1q4gxkfNEBwAKF8tEhQeEcPsKrJj/AHsefSeGs7TdEhO6L0Nsvcmcr+0135sFZicS
 fpowCuLgcp/D+P5hwwkgoikErGCZB8Bq18ZVM1N9ImUZ/Z+iKdoFZt/
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: fiwUb2hwZmyGp9_21FGuxUJsaIUOvNb3
X-Proofpoint-ORIG-GUID: fiwUb2hwZmyGp9_21FGuxUJsaIUOvNb3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-14_07,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 phishscore=0 spamscore=0 mlxlogscore=647 suspectscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402140111

Don't directly use OF and use device property APIs. In addition, this
makes the probe() code neater and also allow us to move the
of_device_id table to it's natural place.

While at it, make sure to explicitly include mod_devicetable.h for the
of_device_id table.

Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 drivers/hwmon/axi-fan-control.c | 39 ++++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/hwmon/axi-fan-control.c b/drivers/hwmon/axi-fan-control.c
index 19b9bf3d75ef..8dfe3b6c5a17 100644
--- a/drivers/hwmon/axi-fan-control.c
+++ b/drivers/hwmon/axi-fan-control.c
@@ -13,8 +13,9 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of.h>
+#include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 
 /* register map */
 #define ADI_REG_RSTN		0x0080
@@ -368,12 +369,12 @@ static irqreturn_t axi_fan_control_irq_handler(int irq, void *data)
 }
 
 static int axi_fan_control_init(struct axi_fan_control_data *ctl,
-				const struct device_node *np)
+				const struct device *dev)
 {
 	int ret;
 
 	/* get fan pulses per revolution */
-	ret = of_property_read_u32(np, "pulses-per-revolution", &ctl->ppr);
+	ret = device_property_read_u32(dev, "pulses-per-revolution", &ctl->ppr);
 	if (ret)
 		return ret;
 
@@ -443,25 +444,16 @@ static struct attribute *axi_fan_control_attrs[] = {
 };
 ATTRIBUTE_GROUPS(axi_fan_control);
 
-static const u32 version_1_0_0 = ADI_AXI_PCORE_VER(1, 0, 'a');
-
-static const struct of_device_id axi_fan_control_of_match[] = {
-	{ .compatible = "adi,axi-fan-control-1.00.a",
-		.data = (void *)&version_1_0_0},
-	{},
-};
-MODULE_DEVICE_TABLE(of, axi_fan_control_of_match);
-
 static int axi_fan_control_probe(struct platform_device *pdev)
 {
 	struct axi_fan_control_data *ctl;
 	struct clk *clk;
-	const struct of_device_id *id;
+	const unsigned int *id;
 	const char *name = "axi_fan_control";
 	u32 version;
 	int ret;
 
-	id = of_match_node(axi_fan_control_of_match, pdev->dev.of_node);
+	id = device_get_match_data(&pdev->dev);
 	if (!id)
 		return -EINVAL;
 
@@ -485,18 +477,18 @@ static int axi_fan_control_probe(struct platform_device *pdev)
 
 	version = axi_ioread(ADI_AXI_REG_VERSION, ctl);
 	if (ADI_AXI_PCORE_VER_MAJOR(version) !=
-	    ADI_AXI_PCORE_VER_MAJOR((*(u32 *)id->data))) {
+	    ADI_AXI_PCORE_VER_MAJOR((*id))) {
 		dev_err(&pdev->dev, "Major version mismatch. Expected %d.%.2d.%c, Reported %d.%.2d.%c\n",
-			ADI_AXI_PCORE_VER_MAJOR((*(u32 *)id->data)),
-			ADI_AXI_PCORE_VER_MINOR((*(u32 *)id->data)),
-			ADI_AXI_PCORE_VER_PATCH((*(u32 *)id->data)),
+			ADI_AXI_PCORE_VER_MAJOR(*id),
+			ADI_AXI_PCORE_VER_MINOR(*id),
+			ADI_AXI_PCORE_VER_PATCH(*id),
 			ADI_AXI_PCORE_VER_MAJOR(version),
 			ADI_AXI_PCORE_VER_MINOR(version),
 			ADI_AXI_PCORE_VER_PATCH(version));
 		return -ENODEV;
 	}
 
-	ret = axi_fan_control_init(ctl, pdev->dev.of_node);
+	ret = axi_fan_control_init(ctl, &pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to initialize device\n");
 		return ret;
@@ -527,6 +519,15 @@ static int axi_fan_control_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const u32 version_1_0_0 = ADI_AXI_PCORE_VER(1, 0, 'a');
+
+static const struct of_device_id axi_fan_control_of_match[] = {
+	{ .compatible = "adi,axi-fan-control-1.00.a",
+		.data = (void *)&version_1_0_0},
+	{},
+};
+MODULE_DEVICE_TABLE(of, axi_fan_control_of_match);
+
 static struct platform_driver axi_fan_control_driver = {
 	.driver = {
 		.name = "axi_fan_control_driver",

-- 
2.43.0

