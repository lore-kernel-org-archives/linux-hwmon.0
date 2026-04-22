Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEB939182A
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 17:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776879804; cv=none; b=nRU51Jzlq2bbrBKED2nuRD7BKngNhCQuPHooq8a/9QSkesVJ+APE+kXlBifgfm5zHvJjJXzCjpo5u5jFvZL16mUpXU4qR3qbNTg8UqZSub5lvUlSJJMsfpcos98Jpq1/ej+tugVW0YzSswx+H9JflncLjgQNARO8fQKRlqWEaMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776879804; c=relaxed/simple;
	bh=+Rhz6zZjd9HYPGnCJeEP5+oKE5R8Tr8IDN6zjN+2ED8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jLxFS/OwFScbbCIXjP+SN0VRWSoaHlXoP3enmg5WyKPxz0fLA4D250TRLlnMibfEUqgFE5eIQW7AEQKfISd6ukpAGIu3fgpxBAMhRpD7Y7+HecYWNI4HGXoy4aHI/pxQl9fUaPykZTn5OjjlqudTZxaXb8hx5kCY3o9m4LjRLho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LV6BA9D6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RdwEWaOQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LV6BA9D6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RdwEWaOQ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MG9pGY3172948
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 17:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CqcNV2iehbX
	zaUc/4R568E4Zx3AugzvURR9OMc5Xhd0=; b=LV6BA9D6MtDIIsG/TiHi/HHEMG3
	7UPbmB6s/lUzrVVW8Bo2nGkUC3APdBRO/iN6VVj+hdFM8VodJDToNCwGZIKXmkm3
	4yqhBCHBurCtV/E65jeR77y5Kq1ROVV5Qibo0tivHIucthMDDbckkcIjQ7mz4LE+
	I+hK8OjE8FNxuZTHZ8P63JrnjVj0kkzh0jnBdSwLx/O4U5RZbBTmlhc3NoY99PXm
	QENVIfoidnDYtivcJCHLleL9/IMylDjXa/43Vh6AirM9n3e/Pju33djW6l+HO+0e
	pI3eN5gtT8/ZcCFqMc42hte41jND8M3OgQTx/nt0gVSrFPYoBdt0RWb/uew==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1m30anb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 17:43:22 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6056351129bso8023937137.2
        for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 10:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776879801; x=1777484601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CqcNV2iehbXzaUc/4R568E4Zx3AugzvURR9OMc5Xhd0=;
        b=RdwEWaOQCLTlxb5TECIMMbfqMh9pEuRvSZR4u/MAh5O/P5rEn9ljMVz0ubvgzjUzZE
         7XCzjVW6QC2w2ik6Gzow+x6juRpvoz3AccX59BVuVhlYW0Di8yuwDNW7au6uVGGT4TG2
         FxqErog2Atket+Zqkfw6xgDog8xH31hzfYJiOHpJe1yc3fwsxuX5Fyps9cKqJQ6VN/vD
         zWat9uhzAxF+u6hI48QzUkbEDlH3WMSYZrup9g74ODq+lNnY0e93qbHnJtrHUk3zofPP
         i9WEfkFoyVd9TUND2uhLzBaR78W8W4fMeTFoddZYy6JdvKBMsRQ2oYCywrDJ/gX4LzjW
         I/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776879801; x=1777484601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CqcNV2iehbXzaUc/4R568E4Zx3AugzvURR9OMc5Xhd0=;
        b=PQV6PwZIVmrcOzLdE8DFgnrf464Geqpmdqd1ssipy5jledzp3s1hO9OrxMe7nCsPQ1
         BuY3nQTs9O8zB9dOJ/WrLnI1Y5EHe6ztCzgRSRtYHdAF3J0UbsskiYJGnhfnc2s8kLd2
         pHe4PLxwCzwKz43ya5x5kDb6cC23n63OhprLTJZDFbOdzkDMV0ToNd55HjPeVOlS5VbC
         LKT4fSpxd3CBmcg/1J5tHdl7Iz5MYUQVxggXf4qU/kLvY/gkeVlGkr6C5SNNQX1I3qEK
         EDCShKL2jtfda6awQtZNc9oLdMWhkDq+H49t1s+EPF8kDLNHX+PVijiJXLcvCuqWftAl
         /RCg==
X-Forwarded-Encrypted: i=1; AFNElJ9P2jrqVM4InUQd4mEXAyyzYFsyqf+uQtPKojLS83G8WMoHUXDQNPtWgJvZqFoWv1oH8q97u6yIfWyz1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYriOEV6t4y/jjIzqKbn+DEbq/XALj6QdZNj26OXZSIALrf0Vt
	RONjjPlMyDCKIbVqxcVe9Mmghj+C+WrjVPopTEXNwSq/EU17jlKcl9rJiBM119oKZ/p/Di08MpC
	p9za1pYInotAa8ko9maeRmiKPokTvqPQWtEYhZxwoCZS0Z6NQOQvOz0MxKVD6wylrEQ==
X-Gm-Gg: AeBDieslSnoQbyiBz9CFz6FJOwQnsAU52EZfdQ/To3jbqxqVQYfUHJqX8xHKT1ZiDSI
	thOpyPHjOkLbZ8WjcYwVK04Hc/7o1LiXxXjhCQMcq8+yDHktixFE0k04AWXN9RGDCwKWbshhRFV
	9amrSzp9V7J8OVz+f6k76sFeoFAb2WljfD3JzXICZHwyodfguNSpjWj/yBZEgFwg5BmDLguAFFM
	T//PauVhW5HEoCHfshjb3eXq0Cx1yBuHFn7ZDdyfjg2jklNwtVSVunFafQeaHi4VpNLtZQGDNnl
	94zD4TWK5lb9vmjclV8R1kGZiIS2GgT9zf1bm67sTEk4hyM9YAcFP1+v3k4EHXg0Q05OQ55u3jX
	jcYRNf41Jb4zrBO+JuoQdgf5V7xwggUnGilvcFaJzVWoDbVekXtQr/aBuVBeS
X-Received: by 2002:a05:6102:109e:b0:61c:5310:e9d3 with SMTP id ada2fe7eead31-61c5310ec4emr4276282137.24.1776879801149;
        Wed, 22 Apr 2026 10:43:21 -0700 (PDT)
X-Received: by 2002:a05:6102:109e:b0:61c:5310:e9d3 with SMTP id ada2fe7eead31-61c5310ec4emr4276254137.24.1776879800699;
        Wed, 22 Apr 2026 10:43:20 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7a051dsm142511965e9.18.2026.04.22.10.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 10:43:19 -0700 (PDT)
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
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: [PATCH v2 03/12] thermal/core: Make thermal_cooling_device_init_complete() non static
Date: Wed, 22 Apr 2026 19:42:52 +0200
Message-ID: <20260422174305.2899095-4-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260422174305.2899095-1-daniel.lezcano@oss.qualcomm.com>
References: <20260422174305.2899095-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: m16MkRQM1VDJ0luTvhPasYrDFJVozdou
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE3MSBTYWx0ZWRfX1UG8F9wrMf9k
 JxCnV+ba04n26qaE6HT+0p/lZJAFCCgMc1gyio3i54inf3CXiMN2GzzyCAXhxyDjEx6rm/7Q3BE
 u45BcWgjZPU223Aqc/3YPp1Yw++f2d90NLAb5dYzz40PtzM73RleOcwXOKjh9EWuOJBybI2WkaG
 ZBCZfN/tO6vZrLRSEsaSpcwouyqqO1OqvNnLb9kzfuxkE/P2LPhoCuL4PpPFXBh50PxdS84njpo
 AQ3SmXk469gt9gbs6W6J1MSimKnk/bjnULY8OIO1qRkxfjTenM4mG0hhdlMOYD1T1ZYDAbw8JJp
 Wncy+kLNzBAQsRueKT5Gy17hqd5V0U9VvJkj35Urol4gmeg/iKSZP41bZ1+7EloqEbsGc8XDcGf
 YzvaX2kp/yV6Kj0NIczjnAxaYc9iG94XZt7U3TBfAV8XgKwAvceU+DQZCk5/QKLfj4+HKfQfnK6
 6NoXjuzwkUbPLIOf7sw==
X-Authority-Analysis: v=2.4 cv=PsOjqQM3 c=1 sm=1 tr=0 ts=69e908ba cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=XCaTwWLIzJkqVeeR-uYA:9
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: m16MkRQM1VDJ0luTvhPasYrDFJVozdou
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220171

In the process of separating clearly the OF code and the thermal core
code, let's split and export the
thermal_cooling_device_init_complete() function so it can be used by
an implementation inside the thermal OF code.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/thermal/thermal_core.c | 12 ++++++++----
 drivers/thermal/thermal_core.h |  2 ++
 drivers/thermal/thermal_of.c   | 12 +++++++++++-
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
index 8a70768b46dd..35cf170f3fa1 100644
--- a/drivers/thermal/thermal_core.c
+++ b/drivers/thermal/thermal_core.c
@@ -1028,7 +1028,7 @@ static void thermal_zone_cdev_bind(struct thermal_zone_device *tz,
 		__thermal_zone_device_update(tz, THERMAL_EVENT_UNSPECIFIED);
 }
 
-static void thermal_cooling_device_init_complete(struct thermal_cooling_device *cdev)
+void thermal_cooling_device_init_complete(struct thermal_cooling_device *cdev)
 {
 	struct thermal_zone_device *tz;
 
@@ -1127,8 +1127,6 @@ __thermal_cooling_device_register(struct device_node *np,
 	if (current_state <= cdev->max_state)
 		thermal_debug_cdev_add(cdev, current_state);
 
-	thermal_cooling_device_init_complete(cdev);
-
 	return cdev;
 
 out_cooling_dev:
@@ -1159,7 +1157,13 @@ struct thermal_cooling_device *
 thermal_cooling_device_register(const char *type, void *devdata,
 				const struct thermal_cooling_device_ops *ops)
 {
-	return __thermal_cooling_device_register(NULL, type, devdata, ops);
+	struct thermal_cooling_device *cdev;
+
+	cdev = __thermal_cooling_device_register(NULL, type, devdata, ops);
+	if (!IS_ERR(cdev))
+		thermal_cooling_device_init_complete(cdev);
+
+	return cdev;
 }
 EXPORT_SYMBOL_GPL(thermal_cooling_device_register);
 
diff --git a/drivers/thermal/thermal_core.h b/drivers/thermal/thermal_core.h
index bdd59947b24f..6e44bcf37b00 100644
--- a/drivers/thermal/thermal_core.h
+++ b/drivers/thermal/thermal_core.h
@@ -269,6 +269,8 @@ void thermal_zone_device_critical_shutdown(struct thermal_zone_device *tz);
 void thermal_governor_update_tz(struct thermal_zone_device *tz,
 				enum thermal_notify_event reason);
 
+void thermal_cooling_device_init_complete(struct thermal_cooling_device *cdev);
+
 struct thermal_cooling_device *
 __thermal_cooling_device_register(struct device_node *np,
 				  const char *type, void *devdata,
diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index 398157e740fc..c4b67554df44 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -531,7 +531,15 @@ thermal_of_cooling_device_register(struct device_node *np,
 				   const char *type, void *devdata,
 				   const struct thermal_cooling_device_ops *ops)
 {
-	return __thermal_cooling_device_register(np, type, devdata, ops);
+	struct thermal_cooling_device *cdev;
+
+	cdev = __thermal_cooling_device_register(np, type, devdata, ops);
+	if (IS_ERR(cdev))
+		return cdev;
+
+	thermal_cooling_device_init_complete(cdev);
+
+	return cdev;
 }
 EXPORT_SYMBOL_GPL(thermal_of_cooling_device_register);
 
@@ -579,6 +587,8 @@ devm_thermal_of_cooling_device_register(struct device *dev,
 	*ptr = tcd;
 	devres_add(dev, ptr);
 
+	thermal_cooling_device_init_complete(tcd);
+
 	return tcd;
 }
 EXPORT_SYMBOL_GPL(devm_thermal_of_cooling_device_register);
-- 
2.43.0

