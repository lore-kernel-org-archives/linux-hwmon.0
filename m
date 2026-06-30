Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1CF3E44ED
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 14:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782831218; cv=none; b=jDURDJMmzYUKQqaSJjRswSAUQFMQ4UHq1nsKxJOKuVWLOb4tIQF4IQYm74JkakQ4QF0bv4XvnugUTndg0aW922c9AbLXR0FjutDF5C6D2rKhTJyVONRRyMSizmCrQ0xaGVOwT/d61uEpeOD3i2Dw5YaoGplMcgSNqwprXBWTThU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782831218; c=relaxed/simple;
	bh=KSct5FWBTf11Ab+Fi4g9IVWXDzyF9yFCEg3JICKOCMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XSpeUN02Odtx+sChUnqWx5kLLzPB5O/NslUDE3F0Qff64hcucbD4Se2RaXBPI801PHh1VOQn5V33UG5YgYjHFltrXNemFFWA0JXKw+hy4CCcDv1Dx6a51EyskI1lyaCTC1LKHgJYWVJqHcJcdJEhA/NlN75ltG66UYHrzwXJU4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dqpbLbsy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jxM4TrF5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dqpbLbsy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jxM4TrF5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDKKM2128901
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 14:53:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LWbNQLPYU8q
	OuCVpbCpKA3/AQJOMBJ3i0+zgckIy/yU=; b=dqpbLbsysCeP5iv7sOSjfLPDsux
	GttqwCmBy8N7MZ91MVsce/hzeumrERSXqSkXm4uG7eDy04DKqE8hpJFGA8yXH0wB
	sTL5n1WfNvlXxIxbF2ZYYlbsbT/XtwP4dfuEqjEPYDFHaINVmwEjtr0vhPjqGPcM
	GmPcpjPKV0nLXnyqHt7XBFWJvxMWok6gTvwydhnW19cMi6EIkA8GujSswICRD2mz
	y6iF44JUS77BfbZ71pHzGaaKj2+t3Gz8id4mz8RSg6C9yDxw079CBG7Jsc/QlrIz
	sVSEkDX082Ao3kSzU1Icsa8zlBzf5H50FQtG4Ye8zmXJJKU9S5zk2SapGWg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3yw93yav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 14:53:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e66f9e2baso122092485a.0
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 07:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782831211; x=1783436011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LWbNQLPYU8qOuCVpbCpKA3/AQJOMBJ3i0+zgckIy/yU=;
        b=jxM4TrF5GHlgWho3pUa6NLk+gUn473nKl+JsTHYseTXObYvUgemr1sg8ksmeqoHKga
         TBlqEVowZzmJAZ1Ad4yzymMpxf2Z+PchyI+SJgks+iW7pjavU5KrmnhmyFeJlSMuSgG9
         2Lz9jBI3qXzExX4b2MCohK6+1e4TVe4sJEV8OCyZDV/gHAvZVWn6cvPH4Fy61Nekw1NL
         OpA0+5XZxLFPzH5zai5NSoi72HC9xTKn8X/x0ytV+WHn7bNCo4OUVBwN25ZW95/R8Lqb
         cOQIiIfOgkY5g6BfNqV1WcUJJgqL1E2a1mkkNoNJ49RR8N3FMPgIGwWrKefWwisEtQXS
         H1eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782831211; x=1783436011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LWbNQLPYU8qOuCVpbCpKA3/AQJOMBJ3i0+zgckIy/yU=;
        b=cn28Iwb0jfJ9EFcHwz9kG0q73Wa3V6FwU8mfj3ZaxrtQo2kwY2opZM81tsN5EMaqZS
         NZxjXzQof9Xg9hbFwPrAKb2xp9pN33r6ZTN4/e40aQCil3zeAPQJcdVmdcOILg9PcRXV
         fYsM8lwZzEqEuTod7blVs6AqUjwZE9oKsS2VvA1QWHQW/qS4YqecN2ntikJhtuvG2QRp
         y6qsku5aqyHpnRAasOMg7Vm4BXmehxhF55mVo/hdkGqrUDSoCo36tz1/BKV82eGZbhHe
         tJimm6K6IQR9u+3bRkwU3Sgdn4/KIBpU4bqnJaP6TYLVUfeLQuzLxm4reMkFXwg3COLP
         SR8g==
X-Forwarded-Encrypted: i=1; AFNElJ/X7tHGmdPsjeQA7+3QbMZV8t7KHY5xsaPbUIQro3tcY4k2H8yyMvk0XNbkDt8nCxqWX/bwIIZPCmL9PQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWjuyJkgVte+2dZoA7CTj0YRhG+4jK02Vds1/wu/qLzRHxFwUc
	67OO2Zx/SHKeMRXbuHvDkkcd820n9/ZmPx79jS8KMbZkxwpvL94/gVUaPaaoVOGZUn66Czrha2x
	RtRQsGIoBI485o9VfaR414LQT8fw9D4Pwe+M2kHFA+D/eBqho/kut1wtiR7qPcOrMvw==
X-Gm-Gg: AfdE7ckZBZT+8r6xnFzaXhmtZNY2nWXgJ2ok3VX+sOuydCULUOPq7HaQpgDgHhU1mKx
	VYrogPKFB4sHYprPp2UaZGAmFEpPCHCd0wkvraZjawy/n+NQz13ztgTjof8j4lOzkIKYzdR2iWr
	zYhqSlCCZC+AiTYbiVKLR5GC6tWmsFOrGlcQvBx2vD+ohhOJyUUM117j0rmxvE7zk3+icVkxiJw
	W1XTELhLDpgf+IXm1k6zCAVYvCD8HO8JwixjoLqJk+MMAoIXXoFkcbOcxfng/1eOmitobaYMk4y
	J95oJahvm1gbVM6EE+JRNfl/yOn450zT9PWirD6EEZ9//TK+uGkJ8RgXMXCRVyntsOzDZqOCt2o
	dKkwmzg+kryvVDeAS6eHj4TuCHBUbTlI67Y76y2OxnygGzg==
X-Received: by 2002:a05:620a:370c:b0:915:a811:1707 with SMTP id af79cd13be357-92e6249d7bfmr627840385a.5.1782831211410;
        Tue, 30 Jun 2026 07:53:31 -0700 (PDT)
X-Received: by 2002:a05:620a:370c:b0:915:a811:1707 with SMTP id af79cd13be357-92e6249d7bfmr627830285a.5.1782831210336;
        Tue, 30 Jun 2026 07:53:30 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:5c75:21f9:a642:c358])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4d15ddsm720295e9.6.2026.06.30.07.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 07:53:29 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 2/3] platform: arm64: lenovo-thinkpad-t14s: Wire EC thermal events to hwmon
Date: Tue, 30 Jun 2026 16:53:06 +0200
Message-ID: <20260630145307.10745-3-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260630145307.10745-1-daniel.lezcano@oss.qualcomm.com>
References: <20260630145307.10745-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE0MCBTYWx0ZWRfX+yu6RNCCwrsC
 QC1wuAK8Dp/pImulpOIf8Y0k8sI+vlQmlaz9UynolA6bXh4C7VgXptSvys+FL+T39ggPc84LEDM
 fwIxH51DAwux49Tylj/XcXhaGwdXjIQ=
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a43d86c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=Or7PZLYpvbLXL6tJY5wA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: EGxjJi5twAwX6lo1mosSMpRcmX6RzYsq
X-Proofpoint-ORIG-GUID: EGxjJi5twAwX6lo1mosSMpRcmX6RzYsq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE0MCBTYWx0ZWRfX1egCg4hMzQ8X
 6oKaroKboTtB5QaXzvsi/TkxfzSTjPYQl1Mhox2kiHugcVLWKxseUiCenHb8i8niELy3GJimED7
 2b1TYewjUemlnFy5bXnoyfCv0Dx7UEQaBYRInz3kVKw3C9DQV2plsDgfPjhSlAyvsCc/qZeZzzQ
 IBLofPyORl2qKb2cPZB77ZnMSEkW+omLKRyjmSZAd8xX4jn2XpByekB30FihQ3xymkc65b7gWGq
 aSP5Hezao3p/zxY6dzNDo+iFFMrVtPVQDk6s77hCQJYb86zuCN+QZAS51uWKN1CoF+CFrvc5zNx
 p7cWY4P7LYZ3U8gn+jpVUDd4rE7mXr7NzKmfua2fCxALH4a8Z8EeuvXm3oORH5Qv8hd6ujfWeWR
 LfYfkrT+0PzqKOCXBuTJQErCZzZT45qgJGzGecW6mK8LFMkPl4/Vf4FWZhvn7LntYReewpoCR6+
 v3n7SZyyvAjsgzpYbfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300140

The EC generates thermal zone status change notifications for a subset
of the exposed temperature sensors. Wire these EC events to the hwmon
notification framework so userspace can be informed when a thermal alarm
state changes.

Associate each hwmon temperature channel with its corresponding EC
thermal event and emit hwmon_temp_alarm notifications through
hwmon_notify_event() when the EC reports a thermal zone status change.

Also register thermal zones in the hwmon chip capabilities and keep a
reference to the hwmon device to allow event propagation from the IRQ
handler.

This allows userspace monitoring tools to receive thermal alarm
updates without polling the sensors and gives the opportuniy to the
kernel to cool them down.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 78 ++++++++++++++-----
 1 file changed, 57 insertions(+), 21 deletions(-)

diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
index 35a6f8b0cb6b..5fafb01a2b33 100644
--- a/drivers/platform/arm64/lenovo-thinkpad-t14s.c
+++ b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
@@ -104,10 +104,13 @@ struct t14s_ec_led_classdev {
 struct t14s_ec_hwmon_sys_thermx {
 	const char *label;
 	int reg;
+	u8 event;
 };
 
 struct t14s_ec_hwmon {
+	struct device *dev;
 	struct t14s_ec_hwmon_sys_thermx *sys_thermx;
+	size_t num_sys_thermx;
 };
 
 struct t14s_ec {
@@ -490,6 +493,20 @@ static int t14s_input_probe(struct t14s_ec *ec)
 	return input_register_device(ec->inputdev);
 }
 
+static void t14s_ec_hwmon_notify_event(struct t14s_ec *ec, u8 event)
+{
+	for (int i = 0; i < ec->ec_hwmon.num_sys_thermx; i++) {
+		if (ec->ec_hwmon.sys_thermx[i].event != event)
+			continue;
+
+		hwmon_notify_event(ec->ec_hwmon.dev, hwmon_temp,
+				   hwmon_temp_alarm, i);
+
+		dev_dbg(ec->dev, "Thermal Zone (%s) Status Change Event\n",
+			ec->ec_hwmon.sys_thermx[i].label);
+	}
+}
+
 static irqreturn_t t14s_ec_irq_handler(int irq, void *data)
 {
 	struct t14s_ec *ec = data;
@@ -539,13 +556,9 @@ static irqreturn_t t14s_ec_irq_handler(int irq, void *data)
 		dev_dbg(ec->dev, "LID closed\n");
 		break;
 	case T14S_EC_EVT_THERMAL_TZ40:
-		dev_dbg(ec->dev, "Thermal Zone 40 Status Change Event (CPU/GPU)\n");
-		break;
 	case T14S_EC_EVT_THERMAL_TZ42:
-		dev_dbg(ec->dev, "Thermal Zone 42 Status Change Event (Battery)\n");
-		break;
 	case T14S_EC_EVT_THERMAL_TZ39:
-		dev_dbg(ec->dev, "Thermal Zone 39 Status Change Event (CPU/GPU)\n");
+		t14s_ec_hwmon_notify_event(ec, val);
 		break;
 	case T14S_EC_EVT_KEY_FN_G:
 		dev_dbg(ec->dev, "FN + G - toggle double-tapping\n");
@@ -640,13 +653,14 @@ static const struct hwmon_ops t14s_ec_hwmon_ops = {
 };
 
 static const struct hwmon_channel_info *t14s_ec_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(temp,
-			   HWMON_T_INPUT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_LABEL,
-			   HWMON_T_INPUT | HWMON_T_LABEL),
+			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_ALARM,
+			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_ALARM,
+			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_ALARM,
+			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_ALARM,
+			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_ALARM,
+			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_ALARM),
 	NULL
 };
 
@@ -657,14 +671,34 @@ static const struct hwmon_chip_info t14s_ec_chip_info = {
 
 static int t14s_ec_hwmon_probe(struct t14s_ec *ec)
 {
-	struct device *dev;
 	struct t14s_ec_hwmon_sys_thermx sys_thermx[] = {
-		{ .label = "soc",	.reg = T14S_EC_SYS_THERM0 },
-		{ .label = "keyboard",	.reg = T14S_EC_SYS_THERM1 },
-		{ .label = "base",	.reg = T14S_EC_SYS_THERM2 },
-		{ .label = "charging",	.reg = T14S_EC_SYS_THERM3 },
-		{ .label = "qtm",	.reg = T14S_EC_SYS_THERM6 },
-		{ .label = "ssd",	.reg = T14S_EC_SYS_THERM7 },
+		{
+			.label = "soc",
+			.reg = T14S_EC_SYS_THERM0,
+			.event = T14S_EC_EVT_THERMAL_TZ39
+		},
+		{
+			.label = "keyboard",
+			.reg = T14S_EC_SYS_THERM1,
+			.event = T14S_EC_EVT_THERMAL_TZ40
+		},
+		{
+			.label = "base",
+			.reg = T14S_EC_SYS_THERM2,
+		},
+		{
+			.label = "charging",
+			.reg = T14S_EC_SYS_THERM3,
+			.event = T14S_EC_EVT_THERMAL_TZ42
+		},
+		{
+			.label = "qtm",
+			.reg = T14S_EC_SYS_THERM6
+		},
+		{
+			.label = "ssd",
+			.reg = T14S_EC_SYS_THERM7
+		},
 	};
 
 	ec->ec_hwmon.sys_thermx = devm_kmemdup_array(ec->dev, sys_thermx,
@@ -673,10 +707,12 @@ static int t14s_ec_hwmon_probe(struct t14s_ec *ec)
 	if (!ec->ec_hwmon.sys_thermx)
 		return -ENOMEM;
 
-	dev = devm_hwmon_device_register_with_info(ec->dev, "t14s_ec", ec,
-						   &t14s_ec_chip_info, NULL);
+	ec->ec_hwmon.num_sys_thermx = ARRAY_SIZE(sys_thermx);
+
+	ec->ec_hwmon.dev = devm_hwmon_device_register_with_info(ec->dev, "t14s_ec", ec,
+								&t14s_ec_chip_info, NULL);
 
-	return PTR_ERR_OR_ZERO(dev);
+	return PTR_ERR_OR_ZERO(ec->ec_hwmon.dev);
 }
 
 static int t14s_ec_probe(struct i2c_client *client)
-- 
2.53.0

