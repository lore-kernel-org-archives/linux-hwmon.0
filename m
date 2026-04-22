Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C00339281E
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 17:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776879825; cv=none; b=QMS4utjwQz8NfkzYlXsVWcFpx6zj0dqQLGQJg5a6F/YYT+1E0Q0eO7xkXlcxjyUDt18TVXKXWrbLqjS27QzxEiOXfsI4n4H3w4nqzsW0QO90Tayg8Jp94O7i7Stfb4DI1+IvPX6WnJqa11Axtw6moNLtZJA1/H+wt33aEOfoL5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776879825; c=relaxed/simple;
	bh=6+530nQoabfGsWxkvdlmkp9P7mXbKYm1O5XyUmoNaFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fygl2a1ksug6Zw5MrUTO9BxbyD1QD5BJ/Dkqut361SHo8Sj/ciJnQ2uBLEhaVeRkDqZxRDgLX7t9b1vHfdWm2AiQyhHDBPW4fv6T9oq1Ik2E71vrLVHUQz036fK15VBxrlPKJXhe9dHUfA68NVOOjYTUkY2Budcad4P+sGhfRPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k/j+CFGN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YGE4huVa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k/j+CFGN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YGE4huVa"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MG3f2j1230196
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 17:43:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OGUq4M68SCq
	WoWQHmrCQ+DNNSG+TG8OoiJ0JYglko4Q=; b=k/j+CFGNA7kZLpa1+mRgLljNIst
	yVTQMKMhmezqp/uJHXa4Bs0y0rj/9+l5DxQ8sODnZpOCqUgurmUgiXrlP8mJtwVb
	/F4xFUmgVFfif/cydI2nzgs6BCmBQeASdK/egVQU+4RtsjRHr9wpjOEQopqnjaE0
	B726DjxQy2kAao7Ox9EaCScLRWSsGnESTqZZKycE3G0/9FGvJEgC8UyUmoZvhse7
	69azajL/rsUHWZT8nBs9N/XFN3CftsoUPFycWvBaLINAqcZKyUGzf3+pUzhwAiXD
	Q7W477U2C93S+KoxVzWccKPzhFlrn7qhQgzXxzUhwPGFCeTft8SU5NLqtAw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1h68bv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 17:43:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50edf01172bso80355471cf.2
        for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 10:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776879823; x=1777484623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGUq4M68SCqWoWQHmrCQ+DNNSG+TG8OoiJ0JYglko4Q=;
        b=YGE4huVaqx0e44OCYojxDjFQd/Efi6jfAU/RfbcnLrPfrPrU4guWEeaJj7ygnNqHfG
         BUrLMHC21qFgAiPfuPMRrqx4UHoyKdtwPY0HcwQkwxVXeZTBJ8ToC+hg8Aw43tfFPNcG
         sbqI7VJFAdaoJk7TuOoIMYI6Fua2sZqmU4xRhJL/xWOpeWgccwIim4OHNIhOKdJXF69i
         zheVTu4tlfZ/wSBbfbqxZg5Ez24rvVaUDKkpgqZGty27j7ipS5co/5M6721DlTB4KucW
         SViMeRO14MNMRnx4NraZR2iFXlOQaKO2dQGMtaDWOeHz0Ntn5Dnx6PssE35lQQuu+tA9
         COnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776879823; x=1777484623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OGUq4M68SCqWoWQHmrCQ+DNNSG+TG8OoiJ0JYglko4Q=;
        b=OXn6yZPwYztJomq2YSMy7x+Ij8eopFmriOH7ruz1IVP5pX0iD5i39TXoMhUdPQbPvS
         1gVYbSBH1HcYdWHkBMfY59fRx2hO1yPdSH6VyYaRJjuDfQuKHKua9OJEUlStUi214IY8
         lh5Aa4SIHee4/ww67MW2K985Jl7HnUOVzei7m3aIxhghqbwMjX4kjjkSesHj8Gxmt5T4
         bn3RZekOB5XQ32N00Rk+LgfhC1DYo0Wyaf9Rn+zwYt7+xgwMuEywHmMpC+EoaSYHSc8O
         D8cr2Lr1INQ7GCYZ6x+Nifuf6bt4Sirl+dEpXGK0u/J+GKEUjXdu7iVFrXRhGszM9Nmp
         uTcA==
X-Forwarded-Encrypted: i=1; AFNElJ9pYSPT4xaV2FnkVJtyW7TtscynqAfIw54+eaoXLZr0HEZp5yJWuLswyuGYCkEFVnBbSRQZMY1YesnNWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVn1v1pMq4/jdEme9uaxmB0898+uu2bm3xKrZNtgstrR2auhon
	7YGb7+DaXLtj6CHOCocvXlgEATzcsCPTreWNKv6HX8u7XSPgYToVwnYm8xmfaeasYmp7Umjq5ME
	oFcaJ5wTTTqUd8dm1QshJPyXwSd8dpcLqE3bqA4zuqyZyN6PIVUUQuDi72SeQ1lbZ6A==
X-Gm-Gg: AeBDieuw8cb3DExk0xx4AcNrr59SwEHcim/xNNnUVknH0Q5AL1icyeWYyDSOSdNysx5
	4HGLLM4CENDbudyC3q4Mo8C6m0kOt2UjnJsAfTnsWy/7kf/W7MHaSxhicP9pC8K8jjhrTEVi2EI
	l80wYapcvjQ+mOJZ/Dqbqi3/RGhRa3Sfp+keBdSLQ89GUhTFGUdvZdMrw+bNRYtNI4OQna8xMCw
	n8X98JpIRT8qmPBnJzLB6Aa63zQHTNI1jsekWdfGgWE2nQehwXUV/pv1Qj7+Aasvo0FxGqNz+AP
	h4Gj7hiESjCqLWbO0AJkluBWKjpJ/n+R9DyKgi/DvMHtu8EhQwDWDXg9EBj8kv6yqRXzSTFy9eo
	71ix/6kfcGEDBpqcVHw6zKPCvXvmhdtPp5Zalo6CAYlKS+tYp7zLqpXzixOX2
X-Received: by 2002:a05:622a:5914:b0:509:f36:496d with SMTP id d75a77b69052e-50e36c0cdf3mr348540161cf.33.1776879822542;
        Wed, 22 Apr 2026 10:43:42 -0700 (PDT)
X-Received: by 2002:a05:622a:5914:b0:509:f36:496d with SMTP id d75a77b69052e-50e36c0cdf3mr348539321cf.33.1776879821892;
        Wed, 22 Apr 2026 10:43:41 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7a051dsm142511965e9.18.2026.04.22.10.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 10:43:39 -0700 (PDT)
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
Subject: [PATCH v2 10/12] thermal/of: Pass the of_index and add a function to register with an index
Date: Wed, 22 Apr 2026 19:42:59 +0200
Message-ID: <20260422174305.2899095-11-daniel.lezcano@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=f4Z4wuyM c=1 sm=1 tr=0 ts=69e908cf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=V4iKOSeYOELjiAWC:21 a=xqWC_Br6kY4A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=KHKEB8RYcew9Qe18FDUA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE3MSBTYWx0ZWRfXwvh4lZ/u93fs
 zzluWrO2bTagTfaLtE28hLkWEvNw4Bgh8qoGml+FvuT+cu/nTywslWO9pnPK/YK7HrVDajFZNNt
 rEUvFjI/Yx+kIj0CbGG429+9VYf8NzKxxNiphY7ucs11L3W3KYzuH6HMkJM43lp6fssiQWxejEe
 KYzKkKW19f7eb+p3DXSz88MYLItBMbRJeiThmyg3H2iOaRspR56QslP9aEm+wfB6Zz0VfJHaaYr
 W9wq7U3ots4NV/28rLetRNEgr8ZTC3pZ6xZ6OiEB+e91OG7YVpe7FtqzOKtSBF+glnrIiNtuN6+
 qNRcIze6UtDcWxj/rFU3nS3y7SJZys3Y0CclUlC8le0IF5cb2aa4t39vsvl1QsWUrX5EkxrqT09
 37o9rLZLoJFAah1gdxeifY23LlnoPp00UzL70pXaTaZU8HUYlNff6R7lDKHg5MvziFRNK9et8h0
 PlvDx7grQ/iNokcwVSA==
X-Proofpoint-GUID: TfQWtLxd1h7ZpIAHkwETXHUcvHEwjyAO
X-Proofpoint-ORIG-GUID: TfQWtLxd1h7ZpIAHkwETXHUcvHEwjyAO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220171

Introduce a new function devm_thermal_of_cooling_device_register()
which will register a cooling device and its id.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/thermal/thermal_of.c | 70 ++++++++++++++++++++++++++----------
 include/linux/thermal.h      | 13 +++++++
 2 files changed, 64 insertions(+), 19 deletions(-)

diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index a9319ff81d1d..d0d6d6b82d5a 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -551,6 +551,56 @@ static void thermal_cooling_device_release(struct device *dev, void *res)
 	thermal_cooling_device_unregister(*(struct thermal_cooling_device **)res);
 }
 
+static struct thermal_cooling_device *
+__devm_thermal_of_cooling_device_register(struct device *dev, struct device_node *np,
+					  int of_index, const char *type, void *devdata,
+					  const struct thermal_cooling_device_ops *ops)
+{
+	struct thermal_cooling_device **ptr, *tcd;
+
+	ptr = devres_alloc(thermal_cooling_device_release, sizeof(*ptr),
+			   GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	tcd = thermal_of_cooling_device_register(np, of_index, type, devdata, ops);
+	if (IS_ERR(tcd)) {
+		devres_free(ptr);
+		return tcd;
+	}
+
+	*ptr = tcd;
+	devres_add(dev, ptr);
+
+	return tcd;
+}
+
+/**
+ * devm_thermal_of_cooling_device_register() - register an OF thermal cooling device
+ * @dev:	a valid struct device pointer of a sensor device.
+ * @of_index:	a cooling device index in the cooling controller
+ * @type:	the thermal cooling device type.
+ * @devdata:	device private data.
+ * @ops:	standard thermal cooling devices callbacks.
+ *
+ * This function will register a cooling device with device tree node reference.
+ * This interface function adds a new thermal cooling device (fan/processor/...)
+ * to /sys/class/thermal/ folder as cooling_device[0-*]. It tries to bind itself
+ * to all the thermal zone devices registered at the same time.
+ *
+ * Return: a pointer to the created struct thermal_cooling_device or an
+ * ERR_PTR. Caller must check return value with IS_ERR*() helpers.
+ */
+struct thermal_cooling_device *
+devm_thermal_of_cooling_device_register(struct device *dev, int of_index,
+					const char *type, void *devdata,
+					const struct thermal_cooling_device_ops *ops)
+{
+	return __devm_thermal_of_cooling_device_register(dev, dev->of_node, of_index,
+							 type, devdata, ops);
+}
+EXPORT_SYMBOL_GPL(devm_thermal_of_cooling_device_register);
+
 /**
  * devm_thermal_of_child_cooling_device_register() - register an OF thermal cooling
  *					       device
@@ -577,24 +627,6 @@ devm_thermal_of_child_cooling_device_register(struct device *dev,
 					      const char *type, void *devdata,
 					      const struct thermal_cooling_device_ops *ops)
 {
-	struct thermal_cooling_device **ptr, *tcd;
-
-	ptr = devres_alloc(thermal_cooling_device_release, sizeof(*ptr),
-			   GFP_KERNEL);
-	if (!ptr)
-		return ERR_PTR(-ENOMEM);
-
-	tcd = thermal_of_cooling_device_register(np, 0, type, devdata, ops);
-	if (IS_ERR(tcd)) {
-		devres_free(ptr);
-		return tcd;
-	}
-
-	*ptr = tcd;
-	devres_add(dev, ptr);
-
-	thermal_cooling_device_init_complete(tcd);
-
-	return tcd;
+	return __devm_thermal_of_cooling_device_register(dev, np, 0, type, devdata, ops);
 }
 EXPORT_SYMBOL_GPL(devm_thermal_of_child_cooling_device_register);
diff --git a/include/linux/thermal.h b/include/linux/thermal.h
index 070dcf7f77b6..55ac0390da8d 100644
--- a/include/linux/thermal.h
+++ b/include/linux/thermal.h
@@ -206,6 +206,11 @@ thermal_of_cooling_device_register(struct device_node *np, int of_index,
 				   const char *type, void *data,
 				   const struct thermal_cooling_device_ops *ops);
 
+struct thermal_cooling_device *
+devm_thermal_of_cooling_device_register(struct device *dev, int of_index,
+					const char *type, void *devdata,
+					const struct thermal_cooling_device_ops *ops);
+
 struct thermal_cooling_device *
 devm_thermal_of_child_cooling_device_register(struct device *dev,
 					      struct device_node *np,
@@ -233,6 +238,14 @@ thermal_of_cooling_device_register(struct device_node *np, int of_index,
 	return ERR_PTR(-ENODEV);
 }
 
+static inline struct thermal_cooling_device *
+devm_thermal_of_cooling_device_register(struct device *dev, int of_index,
+					const char *type, void *devdata,
+					const struct thermal_cooling_device_ops *ops)
+{
+	return ERR_PTR(-ENODEV);
+}
+
 static inline struct thermal_cooling_device *
 devm_thermal_of_child_cooling_device_register(struct device *dev,
 					      struct device_node *np,
-- 
2.43.0

