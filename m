Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4BE402430
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 16:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777479308; cv=none; b=igmzM9pAdIgHBpE+Jl3OrxaNpH4k+SqdZ3yiSghoyf9T0fyRtFqVooNiT/cVzffcic20a5JkzysFRil7y3zdvIO8RjRYMB38vizJRUUYTO98EqoHTQj4pgPj3/mxaWRvQ8775gRqOVjH4fhOezPJPGyPKQMZnOJQCrNysm8dtQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777479308; c=relaxed/simple;
	bh=+DRR6FZB+Ld5aamPPfnWIhChpMSGE/UzOJvDixuYT8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BfQ3eJ0crzfbJazIZETBF6zu8RP/W9uig5UQHwDkKLhllH6AHgLs1ga637HwpwF7RNRC1SS4Z+DU9RSF65PBcCjfFGq9Wixjk+ca1y+FVUc9XwxT8t6zKaqwrh0+/4WrfwUBskOSioI/bmR3rf1coYXMegfrA5c2RNO+BZOvCNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=adwaPxQN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TIXy+KVR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="adwaPxQN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TIXy+KVR"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TFAg3D3067082
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 16:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QlIuh8BM0Sa
	SyTeAREDnPHaWMXvZjHEGYrSurFk/U6c=; b=adwaPxQN1ZFLAoj5evhUxLj8Dub
	gQzwmrMQs6MKYZhkYAg85k5YXLDNXCttNlXn+hKBLMJdI9GgMACVPujLb+6/1Izp
	UW0vdfGT5a5liZ9LTWnwFm5rbs7wmB3j7jv3Uhvb3llXqB0CSLXuP4D9Q19ZsoxA
	GDC8cksxVQv5T/jW04qUiJKBV9/WU0CLRqI2uko3JP1CsnDtRynkT95VczHZ54wr
	mtnQXkq4PowTF1OVbQkCE3U5xpZPhIVPidMLdA2eAVDzTUWI1W4uh4xEf8TEfce1
	gB47Dua0eYb6FNxWDUI/DhbNawh24OfStpfOCdoxge/dwBEqFyuAvXKLoAw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du7sxbe02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 16:14:56 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5662a21d35bso26113183e0c.2
        for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 09:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777479296; x=1778084096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QlIuh8BM0SaSyTeAREDnPHaWMXvZjHEGYrSurFk/U6c=;
        b=TIXy+KVRjGLiV7RHrZxDALkPPaHMCGYkGAKnxwLYmObOKMCEu7JjTLf3HtYUV6YI4l
         Vff8qYz3W4pBL2J4sQ65sNpz4Jg5yTZ2x3QpIROR5EnD5iODk9MGpnh7hZxtLSHOXN0a
         DibBHZyGYDDY40BetRosIEmpg2Ylto7RhVW5Jg9GxU4DWlgktTvWsj5O9Pw/fqrbYERJ
         ZiZddlKXvVlTvWLRuPjGo+Mq3QMTKe63h+ShMiIeMbKTFKGVLuL+gBjLUz5KFdTZ1vKQ
         oJyVOeKxyfYviKmMefsTY7mXAXFwqGAZRWWPdPjoDxqGGI9GT6XXPD9C6RuneRqJWder
         J5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777479296; x=1778084096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QlIuh8BM0SaSyTeAREDnPHaWMXvZjHEGYrSurFk/U6c=;
        b=YJbhAX1E+RGm7c37cW4wGxGfh0/Y/J6lZTAYq3Ux0skd51WDk5Ss67jn6dB+qMXRig
         Z25SB50LPsk3RNiPM46Cmtew5tLqZIBlGJlvCReNa4NmCBNcBhTTMHKF677zYfqe32RU
         zmzPVygwBxy+H+NOlXAJGKwBkuMo7TlXTRuddp6Utpa0uCHCeUIXh2UXtuv4Y9qdRsUE
         d9RjxE1tRkAzGcPjqoioslI3Im1SsazIgoves+DaeWlSuZvKWQidhtGBMotzVlKlVEia
         UUvO0FYI1tYWt+/PyKBPGbPprlHIOEoL1UX4WlDxVBV8ASDV4LWlTFdnvhnLvzf+untC
         9asQ==
X-Forwarded-Encrypted: i=1; AFNElJ8QZyX//8P1yqeEFGhaz0Yri60Rhi7Alu4a+jmTZFKuB0btcuy7xdl4XG8jQnBf4Ihjwaz7AisyaHQVkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxL4wK748YowvNLRk3AoXAixN4L0ccSE3lxM7VbayXtykjklGsR
	0iGqbreqXsR/8yQojt24W2MHLykjyrSXJ3q0pK0g4ZJYeMjka2YDoC63hjg1iwZe2SbakszuIU8
	7fPvlEphtbu3K3oCwV+m4AazdcbYwPB4JJKUpxa41GVel9y90/NsPwoqgJWAL59tLFQ==
X-Gm-Gg: AeBDies3cNvCfdB5g6fCId3Tg1sgxyZ72MIakbWSpfoehHRdg7bO64EEWOwYCwnwrwa
	bDbzaapsWvtUbHlItzRfnpE+qSZlrLV3qHgUD5ilmMYK5JZ/nH3ADnpwREyWN1dShtc1/K6uHKz
	oDCoEcVkLVPkpgNKgcJh/mZl1e5IKm6Kt5AJc04jTwAZZYoxuJGI+mcCjB5+soGuJ0D+PaKibVA
	myAs+tvke47GXbF8qto+bTOqwGqPBI5mvFNQLRo0Qw9Af6yJYMIj4KOfDpxjgR+vs/hvMxlvwOB
	oD01xIE93AReUcKOpx1kI6QbruLPAkOEI1XmtTujrcPHal7wqWi1ga1Bov4m+U+F4yLnO8D+iJL
	Or85bR0EBuyW1Mk/itpCsdvCBoE4MKQUcZFuQ3YWo9MIWTRdZk0yegO74fwPo
X-Received: by 2002:a05:6122:24c:b0:56f:7c7e:f33a with SMTP id 71dfb90a1353d-573a52eea5dmr5244078e0c.0.1777479295798;
        Wed, 29 Apr 2026 09:14:55 -0700 (PDT)
X-Received: by 2002:a05:6122:24c:b0:56f:7c7e:f33a with SMTP id 71dfb90a1353d-573a52eea5dmr5244024e0c.0.1777479295316;
        Wed, 29 Apr 2026 09:14:55 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed659dsm2438525e9.2.2026.04.29.09.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 09:14:54 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org, daniel.lezcano@kernel.org
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
        etnaviv@lists.freedesktop.org (moderated list:DRM DRIVERS FOR VIVANTE GPU IP),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR VIVANTE GPU IP)
Subject: [PATCH v3 08/11] thermal/of: Introduce cooling device of_index
Date: Wed, 29 Apr 2026 18:14:21 +0200
Message-ID: <20260429161430.3802970-9-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429161430.3802970-1-daniel.lezcano@oss.qualcomm.com>
References: <20260429161430.3802970-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bkyGCiYVGYHYjUE4gE-NxLneC6vdaNfz
X-Authority-Analysis: v=2.4 cv=eeANubEH c=1 sm=1 tr=0 ts=69f22e80 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=kkni0TwwaAke5k-tc94A:9
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE2MiBTYWx0ZWRfX7ceKdGgJIWk+
 uk8FPdS0kF91EVB8K2l1CapVmoggEhe+G1hvCPJDDd99xPvv00VydL2m8zz0ndYHcdu2etThdTP
 f5oSkwuHQsd+3Bc4Q5+WapNgw7JcvWkFL2mFSrDo/+rNSex6UXwOTtA5TfBg6xxhIiriGxT4ZoD
 hQHH1WvfxsLVt/cd08rRZnSTj6SRycEspBEDaxggxngXoBUb8Et67+eIOG35Z9olzx9vCgrZFX6
 dok3HJr89fbF54tHN4J9CZscqf2QjQEDjweQ2YWyPJYvjW1QN8ppqme8c9VJ059ndQgfWIMCSUA
 6SSqlCUkq65AS6KQ1cvD+eQMpcccWrQ1RixFuqfAyFAWBAyUrfvTeV1rS0oU5mSPwVW2Stg/ePb
 gmlIFZ2KOPZUR12MNHHeSPLEC4XkYQYaKfw9jZ6wUmrnN4Jux4OQ/uzVcCRlw1tjTdt46+1yM0u
 bxiF0SXmsSmRuH0wYkw==
X-Proofpoint-ORIG-GUID: bkyGCiYVGYHYjUE4gE-NxLneC6vdaNfz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290162

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
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c |  5 +++--
 drivers/thermal/cpufreq_cooling.c     |  2 +-
 drivers/thermal/cpuidle_cooling.c     |  2 +-
 drivers/thermal/devfreq_cooling.c     |  2 +-
 drivers/thermal/thermal_of.c          | 21 ++++++++++++++++-----
 include/linux/thermal.h               |  6 ++++--
 6 files changed, 26 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index a891d4f1f843..552631c3554a 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1791,8 +1791,9 @@ static int etnaviv_gpu_bind(struct device *dev, struct device *master,
 	int ret;
 
 	if (IS_ENABLED(CONFIG_DRM_ETNAVIV_THERMAL)) {
-		gpu->cooling = thermal_of_cooling_device_register(dev->of_node,
-				(char *)dev_name(dev), gpu, &cooling_ops);
+		gpu->cooling = thermal_of_cooling_device_register(dev->of_node, 0,
+								  dev_name(dev),
+								  gpu, &cooling_ops);
 		if (IS_ERR(gpu->cooling))
 			return PTR_ERR(gpu->cooling);
 	}
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
index cf60ac64db54..b38623f6b89f 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -511,16 +511,23 @@ void devm_thermal_of_zone_unregister(struct device *dev, struct thermal_zone_dev
 }
 EXPORT_SYMBOL_GPL(devm_thermal_of_zone_unregister);
 
+struct thermal_of_cdev_init {
+	struct device_node *np;
+	int of_index;
+};
+
 static void thermal_of_cooling_device_init(struct thermal_cooling_device *cdev, void *data)
 {
-	struct device_node *np = data;
+	struct thermal_of_cdev_init *of_cdev = data;
 
-	cdev->np = np;
+	cdev->np = of_cdev->np;
+	cdev->of_index = of_cdev->of_index;
 }
 
 /**
  * thermal_of_cooling_device_register() - register an OF thermal cooling device
  * @np:		a pointer to a device tree node.
+ * @of_index:	a cooling device index in the cooling controller
  * @type:	the thermal cooling device type.
  * @devdata:	device private data.
  * @ops:		standard thermal cooling devices callbacks.
@@ -534,14 +541,18 @@ static void thermal_of_cooling_device_init(struct thermal_cooling_device *cdev,
  * ERR_PTR. Caller must check return value with IS_ERR*() helpers.
  */
 struct thermal_cooling_device *
-thermal_of_cooling_device_register(struct device_node *np,
+thermal_of_cooling_device_register(struct device_node *np, int of_index,
 				   const char *type, void *devdata,
 				   const struct thermal_cooling_device_ops *ops)
 {
 	struct thermal_cooling_device *cdev;
+	struct thermal_of_cdev_init of_cdev = {
+		.np = np,
+		.of_index = of_index,
+	};
 
 	cdev = __thermal_cooling_device_register(type, devdata, ops,
-						 thermal_of_cooling_device_init, np);
+						 thermal_of_cooling_device_init, &of_cdev);
 	if (IS_ERR(cdev))
 		return cdev;
 
@@ -585,7 +596,7 @@ devm_thermal_of_child_cooling_device_register(struct device *dev,
 	struct thermal_cooling_device *cdev;
 	int ret;
 
-	cdev = thermal_of_cooling_device_register(np, type, devdata, ops);
+	cdev = thermal_of_cooling_device_register(np, 0, type, devdata, ops);
 	if (IS_ERR(cdev))
 		return cdev;
 
diff --git a/include/linux/thermal.h b/include/linux/thermal.h
index e39bec84b2b6..26e33c0236c4 100644
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
@@ -201,7 +202,8 @@ struct thermal_zone_device *devm_thermal_of_zone_register(struct device *dev, in
 void devm_thermal_of_zone_unregister(struct device *dev, struct thermal_zone_device *tz);
 
 struct thermal_cooling_device *
-thermal_of_cooling_device_register(struct device_node *np, const char *type, void *devdata,
+thermal_of_cooling_device_register(struct device_node *np, int of_index,
+				   const char *type, void *data,
 				   const struct thermal_cooling_device_ops *ops);
 
 struct thermal_cooling_device *
@@ -224,7 +226,7 @@ static inline void devm_thermal_of_zone_unregister(struct device *dev,
 }
 
 static inline struct thermal_cooling_device *
-thermal_of_cooling_device_register(struct device_node *np,
+thermal_of_cooling_device_register(struct device_node *np, int of_index,
 				   const char *type, void *devdata,
 				   const struct thermal_cooling_device_ops *ops)
 {
-- 
2.43.0

