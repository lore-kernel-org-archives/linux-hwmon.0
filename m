Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5CC2F260F
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Apr 2026 18:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776622979; cv=none; b=t/QF7rZRG//zCRFnsmU/RmWgLhcStYI6rAjM9qT2pV7a6aD135x+o1oIh/ObFnqGHGNPvJsKzsOaAh89lzm4mtBBlRV9sBLTSZs91cxePUt5pCaVuhzqP1SWxo6PMAsjeOJUao7/y5dLJCq+4IOvIgCbH9KoZ/iRgct08JxxhYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776622979; c=relaxed/simple;
	bh=qIr2LSO6D+VRNnsB+j6abzVrqDrxn26emwJAxmPi+dk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z1s1gBw2Bn+82t8zK/1Lu5zIN1gZ2YcTr3spjJG6n9iQn5QcH/6bD0qP0ADnv92rFobKqGqK3bmi+R0NsfY5nga437Bxavoi73LTtkE1Y1n86ieFS4RihBI2VO7o4Kwfwaiy42+rnK2Pfyvwce3f+2H0zWIP+cbtC+r11Qjl1j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UN0OqZdZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GK12zBbq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UN0OqZdZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GK12zBbq"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63J7C3Wj3707906
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Apr 2026 18:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lXWSi0Khw8K
	Na6a8CumjpgrQ3+rYxh7RbfMTB8P3ox0=; b=UN0OqZdZPzhM3bB+CXDRgAs+f0y
	OytcYSBqZXuPFbDyJfIHWR5qyEAYVVtDlIgI2tsV9cDK9HgAPpBaxbViwspLetUi
	qM8YxxWtOBnZCMUROzJ9b52XbZNJcToHQiNucQv5Gn0RZmP6+Ohn6+aijGJjNbB9
	aNA5ICJBVJ7sIv+VxMZo7cEQVpPBRscEAsqjR23ciW1u9eLxy88IiaFnQw/gJKCW
	w2iCCmbe/ciaytF57qiIMNUz0L8wYXHscw4QDvzAcvNdp/dS/lc4Tn4fBnjjjnj7
	mcWd17EYK0xPtVn2fIsLncxDulfbyboLoyDROZgDvOL+BZMJo+/knnNIPrA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm2b72y49-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Apr 2026 18:22:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e160d5fd3so53715861cf.1
        for <linux-hwmon@vger.kernel.org>; Sun, 19 Apr 2026 11:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776622976; x=1777227776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXWSi0Khw8KNa6a8CumjpgrQ3+rYxh7RbfMTB8P3ox0=;
        b=GK12zBbqMG0gzu4S503QvJxt7BRYmvD+jINYzYE1nkjcABlj8o8VDJ/wGppXwea6I/
         nQ3mJJg1Nfl1ezfE53PNrLCVTns96Ox5wf41K74Lekah0Ana20sYkcudcFdnJ/bXBIh2
         5MnATebE/N2TUlNDTzxFLsljLomuPpEU7Xm64rJf6k4S220K8Rw0TF2FnaIPaz2VAYyL
         Wn9K1uLzg8nK5D4fauY7x2TgT4O6hVv2Pd/+XTfyBsSJbr9fhyQoTB/6wa6UEpjfA/K6
         VTrOJk9nqS1Lb8hUfs7KbFAYXSP2hCdYP8RhQ4NvNnNq4I9g9si7rgummdSTlaHVyRgC
         POAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776622976; x=1777227776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lXWSi0Khw8KNa6a8CumjpgrQ3+rYxh7RbfMTB8P3ox0=;
        b=oJEeZuIosig7NL0WNuCH/6B3iT03XeAGN85AWpOl0/MTeAA9JdVYI6JWrR93XQx/T+
         qjNcgZSARED52U86F2iyh1BRBz8+kh0Zq94XGuurXtzejW/s47X4pS/9BQKcwIlnHcL9
         G2ciP4kN4pRasaGUNTILrwOfXTeHdtKBsitdbbNyKX4YBigCQtaoNaeQhAok5qzlL5RZ
         TcrXXr/kQQckNFQuxU+NLpgLTMvJ+cKmgkKKtOy+b0xHoNWz20cVcRkI2vp95T4qZAaA
         SbJxMOy7H6PijQSnMQm2nkiyzJPI7Dh6FyJEmr5Zd3T0wMj/Oy0KXXIlAeR9SO0KRgix
         H+/Q==
X-Forwarded-Encrypted: i=1; AFNElJ+6OIL55q5w96qBbcYecMwV9jQhcv8MV1+qfvdnaVLHufWurnh92dyqm2RMz07O64A7XnJO+bNWCLmHKg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8ndBNh6p9zjWvQ8AgGimzwXkMaUud/32GjSzlCNp4lWRSxsZx
	5mOn8nt0Vb+QVsLWrRPNADG/uAcNczxbq/3qytcpu6DPRUDr9ct4jmE5joWNXjb1P9azTi4QLNB
	SaL5kPiAoQLELbEMzX0zu94aRkCjBRtMcNiFPAbjha7T2Q2dagvoNmqU6PT6REFeNNA==
X-Gm-Gg: AeBDiet5VKuhOmnuNP+pLLnE6ERxoIX0CYQqTKQEHJivX+Y7iSrG870JwSASKf2IE5k
	NguVuxG6R2wSxl4IuhZCYnidQuPZEVO9lEz/LsXEF+mqF2/KWjMQRZjx7zo8UPgBSRM4HYa0G+S
	aEw9W20IvvmP5CqoqckGshK879eoBmPvWcAvEkswV/fVjZe/mxA9GAiETZCzz814vGylRRrKfGz
	8Gk7DlfL5f+y6nX40oMwvb9DB/dI3jkkKfwaLlTcRutpSpRTG+qZzXB8qDprkVohKtL+nqXam+q
	oXGSM0V1Py6J9TCig5k1K9ls4uBJvQRdy43db7oRXoleoAlmKpOF97SrF1OqDdwKuxG3EcfyQcj
	sGzpt/MZAVonDwIInUwexZB+CSASLJFU5Kjyy24gVMpNe3VXq2CyHKHzBsBnk
X-Received: by 2002:a05:622a:1e07:b0:50d:9d8a:ebe9 with SMTP id d75a77b69052e-50e36bb058amr164434351cf.27.1776622976599;
        Sun, 19 Apr 2026 11:22:56 -0700 (PDT)
X-Received: by 2002:a05:622a:1e07:b0:50d:9d8a:ebe9 with SMTP id d75a77b69052e-50e36bb058amr164433861cf.27.1776622976136;
        Sun, 19 Apr 2026 11:22:56 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e59f97sm25723070f8f.37.2026.04.19.11.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 11:22:55 -0700 (PDT)
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
        Daniel Lezcano <daniel.lezcano@kernel.org>
Subject: [PATCH v1 12/14] thermal/of: Pass the of_index and add a function to register with an index
Date: Sun, 19 Apr 2026 20:21:56 +0200
Message-ID: <20260419182203.4083985-13-daniel.lezcano@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=KZridwYD c=1 sm=1 tr=0 ts=69e51d81 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=V4iKOSeYOELjiAWC:21 a=xqWC_Br6kY4A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=KHKEB8RYcew9Qe18FDUA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE5MDE5NyBTYWx0ZWRfX1q47ri4c2GKb
 aX7Ye2KUolHsB7QIwfhC4BHzi236KWkA/LwtZQXqUFna/S/mLJR94CSHAHwCmZt/0TtiJffT8QO
 Qx/Z1cLf+OlNlZQ1hngwfjo5VAaLveniUMdGp4njttwWZcD+L3fnZzmkA3nQ0VQsyTZ96FShYhF
 MaqtNRGM8gN/Uu8ZlVkmNmth0Nt6UMgEcMUyxUyg29d7STk82MTmI/aZGAiVmArigGrGMwdb3ln
 h2kVf2EFoFB2uPZkPC1aOY83R1bngJPXLaGBaAaXwqNNGofEMh8Wd//g/ahjUas9Ru32vVgmC9w
 hJSf/VLFq0d0l6qn5Pe/vdCwSew69jjufpN6/uQEAa+IoMOT2dFwgn6iBJN/4db84/GBU46UvGp
 +pjzMz8CyF457uhZMsjQbJQ+lGrSX5ugKfLRCzPlpL0u51FtQYAmbn7MjUuUf/okC+wEeeZLaQs
 dSTxs3T3AwJFfWEia6Q==
X-Proofpoint-GUID: QORzmyAaE2xqg3olpT63xOcZmzLZFG4j
X-Proofpoint-ORIG-GUID: QORzmyAaE2xqg3olpT63xOcZmzLZFG4j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_05,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604190197

Introduce a new function devm_thermal_of_cooling_device_register()
which will register a cooling device and its id.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/thermal/thermal_of.c | 68 +++++++++++++++++++++++++++---------
 include/linux/thermal.h      | 13 +++++++
 2 files changed, 64 insertions(+), 17 deletions(-)

diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index a728da1f4e56..d9bd7dc01e19 100644
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
@@ -574,22 +624,6 @@ devm_thermal_of_child_cooling_device_register(struct device *dev,
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
-	return tcd;
+	return __devm_thermal_of_cooling_device_register(dev, np, 0, type, devdata, ops);
 }
 EXPORT_SYMBOL_GPL(devm_thermal_of_child_cooling_device_register);
diff --git a/include/linux/thermal.h b/include/linux/thermal.h
index 9813f02db088..b7e5496f3e78 100644
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

