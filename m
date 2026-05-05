Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6085333F38A
	for <linux-hwmon@vger.kernel.org>; Tue,  5 May 2026 10:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976972; cv=none; b=mDwXK9SzKGICxzSqdUNZETK7hZmV8xNrHiWGZLVFJ/UgJTtG9IU0fYuxj3ZXzQ/J1EZ5uuasidj3CDfI+HZEjPsvtwV7ZgQl4J0j8mjY44Q8OeTG1TTRXX5Wwrph87j/wqSl+h5mYbqpNrr1eudRFi1bQ9CU0QhNilNYo1Qg6Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976972; c=relaxed/simple;
	bh=zCyo07L65HwNB6muH5H13cleK8Fb5SwMFs/ZyrpkI5M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TomN2bc8Q5Xd56CbPyYmwFaa+RXBDIIJBN0dZgMQOvOGzbH3+NA6wgwzVZpz0EFz7/e07IDbdKdsx5e/0KT3ZIAnPMj7kGkIi1bYnEVkyJyhvrwnypRSLiJWtDtVJZNRAfsVvXzAIa/uWkYs43rbJiJpGSu83lqANKBWbUif9WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T5WpPObe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gNNnpYj0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T5WpPObe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gNNnpYj0"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6456HHmv331125
	for <linux-hwmon@vger.kernel.org>; Tue, 5 May 2026 10:29:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7l7tNpO2G5dlj05KfsjIUR
	AfyhSgrNckwDk+IV7Bm1s=; b=T5WpPObesiMR921TcLmjYkM810VwtgzVByO0m8
	ns5ekchwYWZLLYzogBz9oiklA1hU8z14Q2wQvRmf02OlxoEZN1nJkNVV51ZGgfKf
	w76zQEza8jjTZFeQIiZn1ktCBsgI53d/J+m/ZgQUl6d+TikXUgohFSnL4BeNowoh
	NPdbHoHTGKRRCM8omm8yTY0KS9mJWZuqSDqFuyDzmjyGHwjOvikPT8gNKHdxXWml
	zNo0zayZ7URs/6v4Yp+PcDDKoVKpzfgleTp3aPpsEnyfV85e51AVYN/6E+zOBv26
	s4l5zFmWiSK84MjJjFR+lU1FE44c+5vQ4LXT2kx7aQTkGpTw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvr1c0ug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 05 May 2026 10:29:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e423a05c8so131649271cf.0
        for <linux-hwmon@vger.kernel.org>; Tue, 05 May 2026 03:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777976970; x=1778581770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7l7tNpO2G5dlj05KfsjIURAfyhSgrNckwDk+IV7Bm1s=;
        b=gNNnpYj0OmZJy1iDlu/AXq4gVs7s489iWp1Ut+rGPszuijVE9Ac6d9ov7BI6MmyUt0
         HfkJA0khaKnsD2vw213+iwj0Kdq+3hIASw0I8psR/HSaP8K62sFJmYfSBlsqEn0mdPke
         Nv7We9x4n3NprecRpmjwEN5Dr5ZJDVkniH74r0WBmFVbHtYkkbNAngRKZNC7rbMuRaqX
         dqDO8SujdRsjte/Y2XolmOiHlQl/dVMcBrZE8Mez+zMzLUg0VBdpNuqkA9FJHkipO7hy
         q1Lml7svPg/kgoVkTi1DtJraYL9TqObo+ZQdehV7s81X+Tw6Wer5RFp5UNEAtp0Qfcfe
         w+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976970; x=1778581770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7l7tNpO2G5dlj05KfsjIURAfyhSgrNckwDk+IV7Bm1s=;
        b=JYP93SFWVb3cNlOX4v8cAq8/36rS3WnZcOMEdlRY+/wOcgYA/jX0GWXClukANmDEz8
         LwzVUF59EVr6BAeOnZqd0hALtHps8LawTXV2GMqN4gqNLGwzD3YnkaHtUwkx9DtHQjSl
         Mz8JpPEGq3daICVB/+mDflt02Zpmf7q7HCteXzOqWtGbRi08cqWbjz75CGmrh5HaquXS
         6kFBw/7kYUNg1E/11+yI/zfa2qWTIq9zazY5CgqGNBdWiQEPe9ubt4/PQ2PfJWYuKA3X
         k236vSJ+iW0YIvuA0QW7GlfdUxrzDZx/0S/M0GCGUgRhP3ZAU/tZP3jIycmxqhHiySvG
         xc7g==
X-Forwarded-Encrypted: i=1; AFNElJ/XsEvx4QS9x6G0R0uh5xrerOhk/VymeB9vadlttX7zUrxQptLIp2ZZu/c+7Kbaboq4uITre9u8/rWghw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yynez0iZv8os19W+8jBUomqnKZm9IFBZekSa51PBjWIerRt9AZJ
	lwEubI0mRrUek0KNzEb4r25ucu5L2mJ8XPe2qoiaa3656wqkrT7WrYyS4DRWe/ls3cClCvUqorO
	k2bfCDdJg+JcivOxsQrKp6dVnUPVKUXPIzE2Yi5TQOHVRZ+JYSXh9AbqjYixmOITMRw==
X-Gm-Gg: AeBDievhmQEX+1thxOJV6XpvIY+Xk02hBFh/sk+5gCx77NxpYnVvcaALzUpOkuGuCm0
	fVstoafjw1DLOfC07XliuPA1vnvfi4uFydqEX2V8+nDpPawZGkSjeGDeBo4rHY7CrsmsMHpM5p2
	tMo6sLJND5+maI+obT+rCXa5y/GzPdWNH7M2uz9fqvQvi42sWnjU5GMoJPOLvGH0NHVnzVRzObD
	fKa5Fg6PD8DxHf7hE1LbwSOOa/zNT2WlY8opBfsHD7fP41fDOpHi7r6gBOr81I9SvRHz+AwU3ND
	noad+iEXA0B+srmltXYaimqwR/2KWNxB82lhLHX2Hqffwi+5hBWgOQalb7YLkCB/lOQsWt4DQLF
	z6OrLZ+Bo+o6QhkPhqrRe1x04e+bSHVsB4eimDzF5F6zVRZ4=
X-Received: by 2002:ac8:5fc4:0:b0:50e:5eac:cf7d with SMTP id d75a77b69052e-513052ffae9mr39216481cf.25.1777976969368;
        Tue, 05 May 2026 03:29:29 -0700 (PDT)
X-Received: by 2002:ac8:5fc4:0:b0:50e:5eac:cf7d with SMTP id d75a77b69052e-513052ffae9mr39216291cf.25.1777976968900;
        Tue, 05 May 2026 03:29:28 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48d14a16187sm15574155e9.9.2026.05.05.03.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:29:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Henrik Rydberg <rydberg@bitmath.org>, Guenter Roeck <linux@roeck-us.net>,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Benson Leung <bleung@chromium.org>, Xu Yilun <yilun.xu@intel.com>,
        Tom Rix <trix@redhat.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] hwmon: Move MODULE_DEVICE_TABLE next to the table itself
Date: Tue,  5 May 2026 12:29:22 +0200
Message-ID: <20260505102923.189289-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3598; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=zCyo07L65HwNB6muH5H13cleK8Fb5SwMFs/ZyrpkI5M=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp+caDA3BfWuY4jSAsoW5fReFWDLe0iMlhpnuUH
 UbSTzeP1BGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafnGgwAKCRDBN2bmhouD
 10hTD/9mXnng3HqsLaHI2Xnn8p6kvi/x7zOS0McdVPyD8R4baLHVxiQX38e/nAxNEH5N0xLXtd+
 /jdBY1beYoa18+yrGBTKQo6Z1NUHwHCQYXufIbA2MuL+jt9FuV7eQ8PRRflQCR8TkFhnn/zb33i
 pgd+BzjWhcyN5I8CbUDCCDE6Q9DQRkrs85078OgTkEZLSGqfo9ACSl/dY2/y5MHIrzGHeiqYrHx
 ujhQDM6Sj7d6hz8p/SDPhEgf+UP35DzM02ENO9ZEDngtXD5XX2L6lf4kCubj4cQs12mWYdhVfaZ
 FGnBnnSR2aNa7rPoGTai5tb/BHlOsC2iXZJkb51y9Et4HYPPTZW6EOympeff4FP07yPSEddZktL
 QgnC0yNUGhRUPmbDIquVXEU2gyVAPvXM5gEnb7m2bOVR9KKlk54OSiXaT+X76GZ4xWqYPJFCYW2
 DnFb/mlT5JjKxti7dLszO1IclfOUrg6Fq4Cxskg1qAuDIQNW8XACUTY5rrcTMZwAZWgsSE3k2EU
 kI0gs7DiripqD0wqHRZooTWvU+mghv4Pyyc/l+C8OzKzwNN58fXgZ4lBoDXcNeRJbChGO8imQMg
 xBH2J+ubvdk5a1B5tmUcQ1kB8c5cwbOM9AcpNOU0U2PV6aeeh5DXv1IoOxBz8gPRbbWx/PFR7Oa CLOJm29CKgkUaVQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WxFwF8YHgCBrJ97kiXO1QMhkK1r_fYyk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA5NyBTYWx0ZWRfX4/eLlqRfcCeO
 lNFBiflCaY4pRNAz29/2+FM/bwVweTfF7E+tt0mgsJNr5rFhwzO8QbJTWse6ETazyUv6rHuzPk/
 gzgkJtTE+uHe7C+s4e1k4xlzocpGvRT5yPutgLua9VhJulPFbsbrjR8pgBVc0SsFHA9zKsu4Czd
 NeVyeZBYr+F81Nnb0EjQgGCAOcAKwuIDH4BWJYqDkEGGDtWtp484kJSxMLANIH4IILtsZn+V5fT
 JBn9kr4dKYDFLW4jzk2C/fvxcCv3B3TzfEuyK/rUkjigkJBqh5oaGj690tggPeQyv/+lZi4KqCv
 cjhBJ2F4YwBv+g9Z81Blx1GSZA4v/GQsFQnPl/q0m5MtItamf22ylxqF08j311HeKypsNoDTXo9
 AS2g65OMMs3R7IT7UKAiVrankzm21pqwI+G6XA/oe/v8ve3KOHt7p4o/3/gNW36D1NsW5jBAa5e
 d6s8PQWDd7J3qLOu8XQ==
X-Proofpoint-GUID: WxFwF8YHgCBrJ97kiXO1QMhkK1r_fYyk
X-Authority-Analysis: v=2.4 cv=RvL16imK c=1 sm=1 tr=0 ts=69f9c68a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VTue-mJiAAAA:8 a=aNednkirAAAA:8 a=gJibsqi4AAAA:8
 a=awhO3CD32pMT8nx_-7YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=S9YjYK_EKPFYWS37g-LV:22 a=gLgUVZKxZxeu9VMYFXkK:22
 a=CK4FZ12xAG-41qC6GJUs:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1011 priorityscore=1501 bulkscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050097

By convention MODULE_DEVICE_TABLE() immediately follows the ID table it
exports, because this is easier to read and verify.  It also makes more
sense since #ifdef for ACPI or OF could hide both of them.

Most of the privers already have this correctly placed, so adjust
the missing ones.  No functional impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/hwmon/applesmc.c            | 2 +-
 drivers/hwmon/cros_ec_hwmon.c       | 2 +-
 drivers/hwmon/intel-m10-bmc-hwmon.c | 2 +-
 drivers/hwmon/nsa320-hwmon.c        | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
index 24f3e86d0ebf..90a14a7f2c4c 100644
--- a/drivers/hwmon/applesmc.c
+++ b/drivers/hwmon/applesmc.c
@@ -1305,6 +1305,7 @@ static const struct dmi_system_id applesmc_whitelist[] __initconst = {
 	},
 	{ .ident = NULL }
 };
+MODULE_DEVICE_TABLE(dmi, applesmc_whitelist);
 
 static int __init applesmc_init(void)
 {
@@ -1416,4 +1417,3 @@ module_exit(applesmc_exit);
 MODULE_AUTHOR("Nicolas Boichat");
 MODULE_DESCRIPTION("Apple SMC");
 MODULE_LICENSE("GPL v2");
-MODULE_DEVICE_TABLE(dmi, applesmc_whitelist);
diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
index 6cf5ab0f4b73..7c308b0a4b9e 100644
--- a/drivers/hwmon/cros_ec_hwmon.c
+++ b/drivers/hwmon/cros_ec_hwmon.c
@@ -657,6 +657,7 @@ static const struct platform_device_id cros_ec_hwmon_id[] = {
 	{ DRV_NAME, 0 },
 	{}
 };
+MODULE_DEVICE_TABLE(platform, cros_ec_hwmon_id);
 
 static struct platform_driver cros_ec_hwmon_driver = {
 	.driver.name	= DRV_NAME,
@@ -667,7 +668,6 @@ static struct platform_driver cros_ec_hwmon_driver = {
 };
 module_platform_driver(cros_ec_hwmon_driver);
 
-MODULE_DEVICE_TABLE(platform, cros_ec_hwmon_id);
 MODULE_DESCRIPTION("ChromeOS EC Hardware Monitoring Driver");
 MODULE_AUTHOR("Thomas Weißschuh <linux@weissschuh.net");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hwmon/intel-m10-bmc-hwmon.c b/drivers/hwmon/intel-m10-bmc-hwmon.c
index aa01a4bedc21..e85d42a45113 100644
--- a/drivers/hwmon/intel-m10-bmc-hwmon.c
+++ b/drivers/hwmon/intel-m10-bmc-hwmon.c
@@ -773,6 +773,7 @@ static const struct platform_device_id intel_m10bmc_hwmon_ids[] = {
 	},
 	{ }
 };
+MODULE_DEVICE_TABLE(platform, intel_m10bmc_hwmon_ids);
 
 static struct platform_driver intel_m10bmc_hwmon_driver = {
 	.probe = m10bmc_hwmon_probe,
@@ -783,7 +784,6 @@ static struct platform_driver intel_m10bmc_hwmon_driver = {
 };
 module_platform_driver(intel_m10bmc_hwmon_driver);
 
-MODULE_DEVICE_TABLE(platform, intel_m10bmc_hwmon_ids);
 MODULE_AUTHOR("Intel Corporation");
 MODULE_DESCRIPTION("Intel MAX 10 BMC hardware monitor");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hwmon/nsa320-hwmon.c b/drivers/hwmon/nsa320-hwmon.c
index 18076ba7fc14..5c99acc09677 100644
--- a/drivers/hwmon/nsa320-hwmon.c
+++ b/drivers/hwmon/nsa320-hwmon.c
@@ -153,6 +153,7 @@ static const struct of_device_id of_nsa320_hwmon_match[] = {
 	{ .compatible = "zyxel,nsa320-mcu", },
 	{ },
 };
+MODULE_DEVICE_TABLE(of, of_nsa320_hwmon_match);
 
 static int nsa320_hwmon_probe(struct platform_device *pdev)
 {
@@ -197,7 +198,6 @@ static struct platform_driver nsa320_hwmon_driver = {
 
 module_platform_driver(nsa320_hwmon_driver);
 
-MODULE_DEVICE_TABLE(of, of_nsa320_hwmon_match);
 MODULE_AUTHOR("Peter Schildmann <linux@schildmann.info>");
 MODULE_AUTHOR("Adam Baker <linux@baker-net.org.uk>");
 MODULE_DESCRIPTION("NSA320 Hardware Monitoring");
-- 
2.51.0

