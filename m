Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502DA2F3C13
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Apr 2026 18:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776622978; cv=none; b=pohnQ4rSUE+/x/Y6q6vgayuoUKkGRoPX8EXNNR2HsvyplPlTAsv5eLiuynLOXfw79wq5inOTnDTcmB0jENuM27a0V2fU47K7sspFX1PmkmJ2jkShQp9cezDoVNPTfMBwukVGxc1W/ESRZPPcYasOIzKTw+Y0foMM621/lgalo84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776622978; c=relaxed/simple;
	bh=povEAdOX2hGXcdSaXed4zJHRaXYtqJTTyhdfcFG83BI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JxE5HHz1Bk7G+fmDtV9GvbwTLqVrWz70sDSk3KdnejiQiuz7oXQVL8TH51xyZlV7IZ0W36waDRKq+H5YbaYQnAZrSKpqGuD55KIo730zwS2nmZ9CHdso0i4AgH3GR96DdSNkvvV3t0rWWq782XwAy3m0sSoN41vZuI/Ewdj0Di4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TtI/BbYq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eql5bx7j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TtI/BbYq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Eql5bx7j"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63J6bh1x2470400
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Apr 2026 18:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mBAk+Sm+mnO
	5DTzI9lKqPEUkJ5P/e03TPLtapt4NgHw=; b=TtI/BbYqpUab5NfqgQhMFLclp+1
	vB8QQKaUZdB3IKVwvUETKTX7BPZaM0leoiaXakCLo+BH3SBzBCFmCiehpHxoXYZM
	pM+ImQCuUPJdNay9rYSFyPJMflKv5KATqG+qDw2CnQof6stTseqGtop+jqw3YtnZ
	2gi3MuZITOPyCcC6+OKw8mhoS4FlFGH01J9J1DJWArEuDb1xPztJyEWE3Q4x2X0r
	uopJsMioEiWd4ImnyLchni5JQEAxGVeXYiVpiEMMAhVIKdWvyR+OscjBxdOoR6Yn
	CBQVZ3tVV3rJ20/nTm6ZzQzaW2GNfuEN9zMxaA5rJKuFOGUAEkWSM1c3rtA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkyank9db-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Apr 2026 18:22:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e575a50bcso4684221cf.0
        for <linux-hwmon@vger.kernel.org>; Sun, 19 Apr 2026 11:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776622975; x=1777227775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mBAk+Sm+mnO5DTzI9lKqPEUkJ5P/e03TPLtapt4NgHw=;
        b=Eql5bx7ji7v6RkxiDr9jn/dgXaqxyBXiFNl708/q108tqFTOgizdp2ZpkJ2UQpdqpL
         MR000OGUdo13lL5+YNs1xAjGdSZQ0IewxuzjRrjm5UgyiGnnu4m1ocOj6iK6RL0PSnue
         CqR6OIhKOvMZwrheP7vG+DMIARcFHaquz3A0BUBGX7qbThOqlIcFT2AHI+8eveH749zi
         k+X6E6AYShbhku0Dj5tcJAPHbMpTVAUEgvYoP4y6LTZ5xCH0H3aDyrVMo16F7u9ZD8Mz
         JthSnE7L/dL3LBNjv58hpPSJjzdO3lBC+UUopZ4PjcoNRLVnrqve75YgEPBQcxVruOg7
         5Pmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776622975; x=1777227775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mBAk+Sm+mnO5DTzI9lKqPEUkJ5P/e03TPLtapt4NgHw=;
        b=K0B0nI6upkMmTti+3j0FzSjezQ4kKqZPsBcasadN4QwEToo5qgA2hA4pmDBMBxCjc0
         UWa16OtLz5LH1JkhDOsgwo8IKdatoMgESWLEBzQ5pgApc466kURMAYfOLwoHrUDl8Ujp
         NFU/seU4X5o4pyyx34cTsJI6QYhaQAEhW+VH4yYMbHnrH4m74zLIr8mgwGO0PMtRdR1P
         e+E1C5WJvsB/vPii9M2ybEIuqdeWr4XRktbBlFdKckFDX+JQLiGuCZgCSWPxHMf2gI7u
         Gz6FCYPuAyXjuaZK9YU1c3HASj10fOxc9jsYi2Vd5Td9P+FH08t/hcoBtUDFo1M9zOR+
         Az4Q==
X-Forwarded-Encrypted: i=1; AFNElJ+vikDbPguO5msC4CbvYhLP0DCCHerFliT/hnjivqQbe6Z9rcyCxrfWaVmtY+PRV6l1gAxcCZYRDowOGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YweGNSNAUbE4CXfSWRAYeJyWlDAz4iuTER4dl/PViBjlrI9XHMT
	YYEbiBIEUVdYsqrvcghz4CTCHc0G5JeIlsQAxD+V5YxJ0KDzxtz4UTu75m39mKrfzNX7XYc8CAt
	ZDcQq6ndFtOm0u25kZIhco+IzUjX3m+OtfiV5sd3oDHY8Q2g6eAIH1W8FsVdocG1dUQ==
X-Gm-Gg: AeBDieuJHV+GFaPIjXjXNtNsAz2iNUUUmw36WFRLA75DKIyvqZJszfoKw/asO/zV8We
	8m+FCrGIjlTzxhvi/nE533o5FPt0YxqBDOg/GU4XisIRdCimAjMSHgOfUWNRujc1zp+/dKYjbln
	sEKA9tCOLdYGW3ptFdzyd+hAqN7H1sKkqFFC0IVebeeFQOFSkVymqLhXz30qc6Y7CHlQgT3m2tV
	sk+0jElbLSJfU8kaEI6tv+5UgnEki3fnGem7RH8ooHFq/h/JhA03Gsq0fFx5YdbzZVrv6agg2zB
	9VuN10DNxEdRqknj4uNkHdU3T4Dlqp+SanCjA+TZEwBJ2onDthu5BDuDhoWgw/B1XR4sUR/j2Jb
	L1E8MhBaWNQ81pa3J2FjvXSAsZQClJ65uz8KMIDLTBrZ3YjFkFZdKkA68W9+w
X-Received: by 2002:a05:622a:5c05:b0:50b:4755:94b9 with SMTP id d75a77b69052e-50e36c77202mr167950521cf.56.1776622974634;
        Sun, 19 Apr 2026 11:22:54 -0700 (PDT)
X-Received: by 2002:a05:622a:5c05:b0:50b:4755:94b9 with SMTP id d75a77b69052e-50e36c77202mr167950031cf.56.1776622974124;
        Sun, 19 Apr 2026 11:22:54 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e59f97sm25723070f8f.37.2026.04.19.11.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 11:22:52 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: gaurav.kohli@oss.qualcomm.com, Zhang Rui <rui.zhang@intel.com>,
        Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Benson Leung <bleung@chromium.org>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Amit Daniel Kachhap <amit.kachhap@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Amit Kucheria <amitk@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        etnaviv@lists.freedesktop.org (moderated list:DRM DRIVERS FOR VIVANTE GPU IP),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR VIVANTE GPU IP)
Subject: [PATCH v1 11/14] thermal/of: Introduce cooling device of_index
Date: Sun, 19 Apr 2026 20:21:55 +0200
Message-ID: <20260419182203.4083985-12-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260419182203.4083985-1-daniel.lezcano@oss.qualcomm.com>
References: <20260419182203.4083985-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: P8Tt2fv-stGi2vQFPhhupvFaGTfc271K
X-Proofpoint-ORIG-GUID: P8Tt2fv-stGi2vQFPhhupvFaGTfc271K
X-Authority-Analysis: v=2.4 cv=SNFykuvH c=1 sm=1 tr=0 ts=69e51d7f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=UUaV7nkyxFtcjw1PROYA:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE5MDE5NyBTYWx0ZWRfX3CEI1fFeLMdP
 toaqb0JhUAYdyceDxMd+S3TALGoYUHVqi2WZsUvbda0tJSRHMWGGhfMTmS893H3znMlIxaIfsGk
 rbabnaQ7a1fqJR99YNuvkl4yy08URPm/z2GgGlsIKIoPwAtzCaTDdixTEm9ojIJM9bHDawQ0yKj
 9zjS4ctotxUiF9pykb2ENifQEQ44sna48JkBEE9A87DPhc12Bwqhl8DA8efzCLMYsWGgKuFuzWp
 j8mpDtgBLghcx7l8QeCagoqpC1MJsBvMMiU/SIDPmZjLP3oATPRy5be34MTEkDE4VBV08dn1hPe
 SX/wvl9qceElpDbopV8HmqzLjN+SV8pZHQiaCE85BTiR+WQlHZ9q1Sx6zYJ+bKZ10J2Y7Rx6zBj
 Oof4nrPZ8qtid0x1Qqt9G8u0WB59lXongYiwLqu/4dhiTNV78SFi25hNX8qYLQRuXKtSXdXZ5uq
 2NNrYW9+tf1kVJbr26w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_05,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604190197

As described in the previous change, the new incoming DT binding will
describe a tuple device_node + cooling device id, instead of child
nodes.

Let's augment thermal_of_cooling_device_register() to receive the
cooling device id and propagate the changes to the four remaining
drivers using the non-devm version of the cooling device registering
function.

Add the id in the cooling device structure and store the value when
registering it.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 2 +-
 drivers/thermal/cpufreq_cooling.c     | 2 +-
 drivers/thermal/cpuidle_cooling.c     | 2 +-
 drivers/thermal/devfreq_cooling.c     | 2 +-
 drivers/thermal/thermal_of.c          | 6 ++++--
 include/linux/thermal.h               | 5 +++--
 6 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index a891d4f1f843..a965cc0633fc 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1791,7 +1791,7 @@ static int etnaviv_gpu_bind(struct device *dev, struct device *master,
 	int ret;
 
 	if (IS_ENABLED(CONFIG_DRM_ETNAVIV_THERMAL)) {
-		gpu->cooling = thermal_of_cooling_device_register(dev->of_node,
+		gpu->cooling = thermal_of_cooling_device_register(dev->of_node, 0,
 				(char *)dev_name(dev), gpu, &cooling_ops);
 		if (IS_ERR(gpu->cooling))
 			return PTR_ERR(gpu->cooling);
diff --git a/drivers/thermal/cpufreq_cooling.c b/drivers/thermal/cpufreq_cooling.c
index 32bf5ab44f4a..768859a7aed0 100644
--- a/drivers/thermal/cpufreq_cooling.c
+++ b/drivers/thermal/cpufreq_cooling.c
@@ -592,7 +592,7 @@ __cpufreq_cooling_register(struct device_node *np,
 	if (!name)
 		goto remove_qos_req;
 
-	cdev = thermal_of_cooling_device_register(np, name, cpufreq_cdev,
+	cdev = thermal_of_cooling_device_register(np, 0, name, cpufreq_cdev,
 						  cooling_ops);
 	kfree(name);
 
diff --git a/drivers/thermal/cpuidle_cooling.c b/drivers/thermal/cpuidle_cooling.c
index 425f596614e8..bbd2e91cf5ab 100644
--- a/drivers/thermal/cpuidle_cooling.c
+++ b/drivers/thermal/cpuidle_cooling.c
@@ -207,7 +207,7 @@ static int __cpuidle_cooling_register(struct device_node *np,
 		goto out_unregister;
 	}
 
-	cdev = thermal_of_cooling_device_register(np, name, idle_cdev,
+	cdev = thermal_of_cooling_device_register(np, 0, name, idle_cdev,
 						  &cpuidle_cooling_ops);
 	if (IS_ERR(cdev)) {
 		ret = PTR_ERR(cdev);
diff --git a/drivers/thermal/devfreq_cooling.c b/drivers/thermal/devfreq_cooling.c
index 1c7dffc8d45f..0330a8112832 100644
--- a/drivers/thermal/devfreq_cooling.c
+++ b/drivers/thermal/devfreq_cooling.c
@@ -454,7 +454,7 @@ of_devfreq_cooling_register_power(struct device_node *np, struct devfreq *df,
 	if (!name)
 		goto remove_qos_req;
 
-	cdev = thermal_of_cooling_device_register(np, name, dfc, ops);
+	cdev = thermal_of_cooling_device_register(np, 0, name, dfc, ops);
 	kfree(name);
 
 	if (IS_ERR(cdev)) {
diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index ba5093f612d0..a728da1f4e56 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -514,6 +514,7 @@ EXPORT_SYMBOL_GPL(devm_thermal_of_zone_unregister);
 /**
  * thermal_of_cooling_device_register() - register an OF thermal cooling device
  * @np:		a pointer to a device tree node.
+ * @of_index:	a cooling device index in the cooling controller
  * @type:	the thermal cooling device type.
  * @devdata:	device private data.
  * @ops:		standard thermal cooling devices callbacks.
@@ -527,7 +528,7 @@ EXPORT_SYMBOL_GPL(devm_thermal_of_zone_unregister);
  * ERR_PTR. Caller must check return value with IS_ERR*() helpers.
  */
 struct thermal_cooling_device *
-thermal_of_cooling_device_register(struct device_node *np,
+thermal_of_cooling_device_register(struct device_node *np, int of_index,
 				   const char *type, void *devdata,
 				   const struct thermal_cooling_device_ops *ops)
 {
@@ -538,6 +539,7 @@ thermal_of_cooling_device_register(struct device_node *np,
 		return cdev;
 
 	cdev->np = np;
+	cdev->of_index = of_index;
 	thermal_cooling_device_init_complete(cdev);
 
 	return cdev;
@@ -579,7 +581,7 @@ devm_thermal_of_child_cooling_device_register(struct device *dev,
 	if (!ptr)
 		return ERR_PTR(-ENOMEM);
 
-	tcd = thermal_of_cooling_device_register(np, type, devdata, ops);
+	tcd = thermal_of_cooling_device_register(np, 0, type, devdata, ops);
 	if (IS_ERR(tcd)) {
 		devres_free(ptr);
 		return tcd;
diff --git a/include/linux/thermal.h b/include/linux/thermal.h
index 6535353ae83c..9813f02db088 100644
--- a/include/linux/thermal.h
+++ b/include/linux/thermal.h
@@ -134,6 +134,7 @@ struct thermal_cooling_device {
 	struct list_head node;
 #ifdef CONFIG_THERMAL_OF
 	struct device_node *np;
+	int of_index;
 #endif
 #ifdef CONFIG_THERMAL_DEBUGFS
 	struct thermal_debugfs *debugfs;
@@ -201,7 +202,7 @@ struct thermal_zone_device *devm_thermal_of_zone_register(struct device *dev, in
 void devm_thermal_of_zone_unregister(struct device *dev, struct thermal_zone_device *tz);
 
 struct thermal_cooling_device *
-thermal_of_cooling_device_register(struct device_node *np,
+thermal_of_cooling_device_register(struct device_node *np, int of_index,
 				   const char *type, void *data,
 				   const struct thermal_cooling_device_ops *ops);
 
@@ -225,7 +226,7 @@ static inline void devm_thermal_of_zone_unregister(struct device *dev,
 }
 
 static inline struct thermal_cooling_device *
-thermal_of_cooling_device_register(struct device_node *np,
+thermal_of_cooling_device_register(struct device_node *np, int of_index,
 				   const char *type, void *devdata,
 				   const struct thermal_cooling_device_ops *ops)
 {
-- 
2.43.0

