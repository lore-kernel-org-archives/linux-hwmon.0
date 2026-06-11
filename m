Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147AF40BCCD
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 14:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781186739; cv=none; b=GotHG0VIYIgkYSq5I+Y9cEtY7MO1hGPXC23nSsOYZTPS1by4nYzwYGs0JmoJ1xkwg/2sSqIzSO8Po9/q1nq8jlAk+0i5qtK3gmOIMXC8BIdEUxzUzAF9ILnKTARKRVwt14nq7NXMRogWDXfznQUjTX3j5eCWa392SG/ZOTaRm4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781186739; c=relaxed/simple;
	bh=6T0vT8ns73GyAYOqdvKVFt6Kkovh5R/AEwLiJpspPNw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S3lcZreVOYV4uZZNjc721tZOgAOwVgx6JcfgYKM7GyH+XALljPZrIdP2NttPgVBRUkcWhFz+A1+Rnj40GgOi37fQ34z9+IrY4fY14IfipSFoqwxoh45CP5IiRILk2E1OnE11RkTutFbc74JPGBcNlGCkEvKyrfXUD0EeTwFJXAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KbBUePmB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z/bvUqDJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KbBUePmB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z/bvUqDJ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BCTE2j496970
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 14:05:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uwOZ8TEedBeQG/0JLrZLUHUec20rih8wIjEdZL6yjZw=; b=KbBUePmBhAxz9/S9
	NP5KFQuImqdu0GhxAo3pHqE9g6gTLtzXQK5kTRNwHv/FVMZ8PvbeXHYiTFRcZ9L9
	RM/C8ce7yLqozl4cioJ/hMRvhhxLQHIjJw7Kgp1QYXad3PuWbF6simLqbjqXUT9J
	+GsP8xkFlmjWZH5gaUR1mJ8ebILlRPZKiXh6inCKmpQuF7O/lSwWKPtISt5ixrp3
	kAF/iGWHfFB0eyFtz7+HDqmGMJtzFpJb6gxedqeaMVrtyOZw2KytNU7gHzYEGGac
	HpfpZStZboifJeWClnDFZNLZurjoZdAQ3zXpgal9AfCUExFaQRFaoFuLVjdPe6zD
	iHsKKQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6ubse7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 14:05:36 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36bc380fbf9so7934540a91.3
        for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 07:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781186736; x=1781791536; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uwOZ8TEedBeQG/0JLrZLUHUec20rih8wIjEdZL6yjZw=;
        b=Z/bvUqDJRvqdebLey3uHszpgxq44/7+UalGKUvXueEFmuBYip26gO47PHSQgdfKc2O
         xckbBACViL+rkiZ7l3kYOB7URpdPklT73fxU5ce80rwdZdpm6H2PFODCyW+kqzA6SYcu
         Ui4NnZunUUMsx1BPO1HRXCqlwRPNEhWh5SDcIlRKxIlHAksFuTZaqqulxmaPM8Q5rEyq
         Gk8ofjwfHUrVT3fmIXZ3gwSLx7ovPMzJjfeG/ExtwxW8CbVqHe5YrhuYM6Velt+0rfQu
         IVNmc+ym7iMGkr/n100P81CXxiHwlOeub0T77tDHNQoMkl5S3yuVE9dXqjuuCWxZgNx5
         485g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781186736; x=1781791536;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uwOZ8TEedBeQG/0JLrZLUHUec20rih8wIjEdZL6yjZw=;
        b=sTCKMQcqZFt9jkV8230uokfbNzZCYS6kZqhCbocKJ9MXmrw5ZxMRgFb5jG8pr53KcM
         UYEr2l2Vk5u7ZYXxwgRwcb5zVTRk08YrfpZeoZt7El6RI/0K32fiKrBssPjV7+oiQnBf
         hKaWlRGjQhtdCMDk9z80txoKL7+dj33g/wi5fm6rFaFUdkMOFxu/a5S0hyV2GxSLWAyo
         a2dpxPHYQgtKsMPPLlIreasHVgQiXrr7t1dG/C9nijSyYqfi+LCHlnN/li0ztR4QYLwL
         uVNdwCInkB9g50/xKmni7gZwkzTszOGXxhLmFL4oo8GlQ2HgouxmrzhTZ0nJwzLmLYtG
         6yCg==
X-Forwarded-Encrypted: i=1; AFNElJ9D5RyjmpAt4Ce9+S3prEtwrWx/GbfXHlDnRBDEfn5oPSpyz3MoTXNeeeBkZj51xuIyma83tPphpjMtCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxO8mnL4eVWG8eQ1C2XM9C629EmJmO1wCzC3p+O6V5DzI+PKn55
	VojX2durGee3f+t4fkcTJQUNXm70EBMjXCFY9iSjrPrYMXWdZL7IszQD/5STCGbqRi8l0n2l//m
	FwgQTWsFN3wRaOWdHbH/EBDx3Z5drWxsDerP4tZO5ijTah7XQxgcCLRnhSDn/m8xcfQ==
X-Gm-Gg: Acq92OEKTwZYZyXE1NNSt/ie8cl+soUWgPjZQEgFhsGN448U397KkYw3W160dermmfJ
	0W8dT0EdSOiYTv7jJpLm9ZdGHj9qxsjEi9ulRlGhEErPUqDfUUCCdUmkgTF/S1zq5OYRijhZ5t5
	QzwdfUg4xsQ1ejA65aQ8dpRedkbk0kYEfl5uXglj8kgioN8XRDS5ohnOrZg1jPbFuacbtUveLkx
	008o+x8nmGPEqewhm2MNkPJvaDKGePpSSWd+1o780HAJ6XbbxEDmuBzGOHtFA/iMHTumdChq4/1
	oQiJpDd/6BEw4TYG/OxsKomNfWMe/XctT7bGJFHdkcW0+dq7/ZEYll62s0JIJCsJzZSLsTbO2gi
	OyuORxeUuxDGER2MHJhqrmEzhuh3SnOIB4b+20nJf0OMJnnrJtEsT6b7TyE6/9/8T7+b90sSElU
	UByJeMMPHnCWhzscvLIqcvokPQ/cJz7tMNgwEyuAXUjMenmmYCFSXy+09KaWjmB2/Mo9s/N21kD
	oDW1+vSoZcC
X-Received: by 2002:a17:90b:5708:b0:368:9da3:c496 with SMTP id 98e67ed59e1d1-377a9289941mr2997859a91.24.1781186735493;
        Thu, 11 Jun 2026 07:05:35 -0700 (PDT)
X-Received: by 2002:a17:90b:5708:b0:368:9da3:c496 with SMTP id 98e67ed59e1d1-377a9289941mr2997809a91.24.1781186734930;
        Thu, 11 Jun 2026 07:05:34 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64e2c810sm11133831a12.9.2026.06.11.07.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 07:05:33 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 16:05:25 +0200
Subject: [PATCH v2 2/3] hwmon: ina2xx: support ina232
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-monza-ina232-v2-2-e4375ce652d0@oss.qualcomm.com>
References: <20260611-monza-ina232-v2-0-e4375ce652d0@oss.qualcomm.com>
In-Reply-To: <20260611-monza-ina232-v2-0-e4375ce652d0@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Martino Facchin <m.facchin@arduino.cc>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE0MSBTYWx0ZWRfX7AmV3D1JbrBc
 4B0BgWO86boo5w/WS/2lo6os7rB3dVKvoxa4i0yGRB7tgtDn2O9Ks4+wsAMc+J1JxWfSR12UUHd
 4HTNSC9qmbQ/8U/iolN5eCyRhdJFfbo=
X-Authority-Analysis: v=2.4 cv=atOCzyZV c=1 sm=1 tr=0 ts=6a2ac0b0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=4d72ej-57Oz9oLBfKlAA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE0MSBTYWx0ZWRfX5+PcO/F9n7bZ
 PycN7M/gKSG5y/NCeIrlTCVW8FfezlaPbjJWqW5XRVGrd/1bhxB8G9CLxSNYheUrihcMOJD0bKi
 homnAuONfNg0HzLZfvPuuoQHcA0tZIwhnlGhCOuu23ZudAIrTw7yM8DPABEm1SkOP5QnU3LdNIO
 jskbJ4NzJT65AgLnSFzugjX2gjU7sflROts/L8ZqBBkZxVu798QR0s6j2SkAbkSN9jACleH9601
 ctqWSihcAYa1fyLG5Yol8cMB2NMhBKdukB9dV5zplfldg+nezOSAKY0GlBygF+qIHST0BP/gic7
 UR+1xlRETtcm7AbJ6G2R6ZUVkxfQ3yzqjXyYUeB6lmD7Gvg4LzM29JfUqZrWG10Yr7Tqmt8Pr4I
 6ElpuEC91/KnFAm3UVFmR1lnop92MgmFAB5tWgIi/lUrFU/o2BmdbGNuVzicrhlxPNJKjeRzWIa
 JLYelycvwDzNOftfMXQ==
X-Proofpoint-GUID: 0Cu7pAYsLh4k07fuYdGq1MSWKL268PGr
X-Proofpoint-ORIG-GUID: 0Cu7pAYsLh4k07fuYdGq1MSWKL268PGr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110141

From: Martino Facchin <m.facchin@arduino.cc>

The INA232 is a current/power monitor. It shares the same register
layout as the INA2xx and uses the INA226 default configuration, but
differs in its electrical characteristics:

Signed-off-by: Martino Facchin <m.facchin@arduino.cc>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/hwmon/ina2xx.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index 613ffb622b7c42b8b6090d3b4ec7b2fa412e24a4..fc2319ad99fc398a50e97ee617f67255bd0b3038 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -122,6 +122,7 @@ static const struct regmap_config ina2xx_regmap_config = {
 enum ina2xx_ids {
 	ina219,
 	ina226,
+	ina232,
 	ina234,
 	ina260,
 	sy24655
@@ -196,6 +197,20 @@ static const struct ina2xx_config ina2xx_config[] = {
 		.current_shift = 4,
 		.has_update_interval = true,
 	},
+	[ina232] = {
+		.config_default = INA226_CONFIG_DEFAULT,
+		.calibration_value = 2048,
+		.shunt_div = 400,
+		.shunt_voltage_shift = 0,
+		.bus_voltage_shift = 0,
+		.bus_voltage_lsb = 1600,
+		.power_lsb_factor = 32,
+		.has_alerts = true,
+		.has_ishunt = false,
+		.has_power_average = false,
+		.current_shift = 0,
+		.has_update_interval = true,
+	},
 	[ina260] = {
 		.config_default = INA260_CONFIG_DEFAULT,
 		.shunt_div = 400,
@@ -1005,6 +1020,7 @@ static const struct i2c_device_id ina2xx_id[] = {
 	{ "ina226", ina226 },
 	{ "ina230", ina226 },
 	{ "ina231", ina226 },
+	{ "ina232", ina232 },
 	{ "ina234", ina234 },
 	{ "ina260", ina260 },
 	{ "sy24655", sy24655 },
@@ -1037,6 +1053,10 @@ static const struct of_device_id __maybe_unused ina2xx_of_match[] = {
 		.compatible = "ti,ina231",
 		.data = (void *)ina226
 	},
+	{
+		.compatible = "ti,ina232",
+		.data = (void *)ina232
+	},
 	{
 		.compatible = "ti,ina234",
 		.data = (void *)ina234

-- 
2.34.1

