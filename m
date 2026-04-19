Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCE02EB874
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Apr 2026 18:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776622965; cv=none; b=uAxIIQ8Uu2G+naipap0Ubei25JadmrMj39mWCV17Bp5h+nUgJ6jKPqsPFjOaY+GQOFR+T8RC0cxLRVc4g421rwt0d0O3Xyg/WsrnjoIo3k0Pie/RisWMP7SvH/JzPhohQSd2VL4tt+OZCK642yUrSaS4v3E5AHG7RXjjjK4EBRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776622965; c=relaxed/simple;
	bh=QFEKU97eqvDA0QMBKvkfQSYoQ7Mbh0z7Y4dUY+CpPEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dHSI6hUPwWxCZwU8SBUTlKJStsK4WD9a0uzdq8bvbo1RWp9c8vil1oYjoSTRy88EkAdqDuQ/7oafY29CLGFmuqF3yHlbLhDcRwTOrgns3IP7N1rFT+R7KF5KjquPd0lHJA5ZevuRMULlNwllqrKiyQmqv91+WQ3JEPcL9d5JYrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HY++AqGA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PcBZ2F8J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HY++AqGA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PcBZ2F8J"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63JBH53E915482
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Apr 2026 18:22:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8SJc8Ox6w4Z
	ygU6cO3C5yCKbel/yP+52HnTiIJQrGqw=; b=HY++AqGAu74IXd8c8x1L+F7ZUqR
	lSjqC6zchyrO75jh2vj5B0BDFA3hUtW8HeUBr5WYz304QyHcwWy4d0e2C0QbXWsb
	hZc5qNoJTXpvgjvrAIA7XBiPlpKm2ZSNREJ6jefmfD2CnIXm9ZKjHhAUB7ko2Pzo
	fJxACJn3JlGs7md2/McoajKWFq6r3HZTS9jB+HvCcOwt8sr0SdTspnSXEncnuG2C
	HfjgWZltexqh5UreiST4+FSyDloBAtZhTZPCQljgBX6o5r05dGjC4Nxp1whnFs8s
	z/gLn8qA/tzx/dyAz4uRiiu31feEDXP3uZGUTukZs2Wi7/CVsS4NS9btXGw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm21ujyrj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Apr 2026 18:22:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50e423a05c8so32063011cf.0
        for <linux-hwmon@vger.kernel.org>; Sun, 19 Apr 2026 11:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776622963; x=1777227763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8SJc8Ox6w4ZygU6cO3C5yCKbel/yP+52HnTiIJQrGqw=;
        b=PcBZ2F8JSu++3vfOirU6VjiJJtwQVI+vnh6da3EA+/q+ZpSdAHHZB9PlxQTGJ4uvmD
         wR1S7bf4Z1+Ldet3DS9F9RNwwSXS8eDj2djKIVXSh209u1LXgCAccmPnw+WFX3WqnS8j
         EzzWEBy4XW9iSwwQ6ocdC6QkwUT9R8Sc3eMyD/fgOTFcVmTTGnXDELNADBckz0a88yWH
         fh/nLqFsnCoDAfGztIZ0Jdl1ebPyXtGMPokvH+Wqwy+fhlZsDy4wiQ+ykfgUXCOp0sSJ
         B71tK673lPfkjXFyptEZtVadRtXxMgJmK4pp1risJ8Iig3sX41SYP7vBCx1zN12SEZQI
         5KiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776622963; x=1777227763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8SJc8Ox6w4ZygU6cO3C5yCKbel/yP+52HnTiIJQrGqw=;
        b=CIotOmvBKPSOmdD68v8j59AKduM2U/614Zy2kMNKpbzQcv76w5Po30YCQ/0ssszuAH
         3H5i099nyXS9d9FjBereHkrZepC+1FgNtDLbr91o8QtTo+9JLoDtxhq+vA0F5Eh9Wafv
         YVz66JM7MSqoO9nCxrhTLdTjDn5U/PtEMPbPR/7/8Ymq0izb7aGlVLNF8bc43bOcFKbU
         raULLVR8iNy95HbtDM7rv3J+vA2aHTxnab4DG6IG/d4fDQAD7iiNqINsSHbLH3KoQAF5
         qbU29gEBTVl7gw2fql3d/CCqQ386RiXm0gmcN7axB7q/81/3hVjBwlmn9WFYr2is5QcU
         Agmw==
X-Forwarded-Encrypted: i=1; AFNElJ8fJgoMcMbKn1vAGYjEWTUluY3yUgMuoZv5rEgwVeYY0C5HLSAgtQ7Gk3xTwc2ZNLUPd/8PEYF3TkbDFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCGnTuZjKMZdld3ul2lGUIkcpBrs1d88DDylCuBjsabkaB6AzI
	GZVcOUwa2OQmzvTrajeW+NsFSanNgyKllxfwRwQhvP+uwoYUjqcMQmfyPjwjMg2ZBItCZxtX6D8
	DQKt/hH79ott4vA0XybY7zNThObc0lw4EvHVHfKTvgY7XA1U9dejy38CP5//pePF53g==
X-Gm-Gg: AeBDieveaT4jTL/kXDkQUCoQZIzV0xoivMti2WVBBB7ZGlHB8RtG4HJP/XN3VT/HIl9
	ZrS+C0kFJEv+Br+8VLx5fe4fppSiI8eT9E9hKjurhvN/3T5WrYOg4+QGoyU1rvOuqPIbLUIvg99
	5+n8jJ5BJGehZPA1MjwBrhCn5MrhS7Nn+xllCsz8cxXsViOGqxfg5SpRCrYwI76XLTPYoLXTYug
	V2lzVGwppYG5W+f/p0Sgmv+tMcnTSBc4A/W3Fupn+0Z4OwCZkq4GFyXuYrq09Xtdt7zSg4KDvML
	clposanEM4PKW74TBDeP0Yd84QZAbS448v07qPjHtb+kli8vz7GLzUbD8TNUT8cPOIEiKar1jdZ
	66vW4xnN5J5dE50D4kQHktN+Jcb+uao9GMnseoEr+/JVLeu2G6gcK8tKNvuNk
X-Received: by 2002:ac8:7fcf:0:b0:50e:32cd:52fa with SMTP id d75a77b69052e-50e3661d434mr140438681cf.3.1776622962819;
        Sun, 19 Apr 2026 11:22:42 -0700 (PDT)
X-Received: by 2002:ac8:7fcf:0:b0:50e:32cd:52fa with SMTP id d75a77b69052e-50e3661d434mr140438211cf.3.1776622962349;
        Sun, 19 Apr 2026 11:22:42 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e59f97sm25723070f8f.37.2026.04.19.11.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 11:22:41 -0700 (PDT)
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
Subject: [PATCH v1 06/14] thermal/core: Register cooling device non-OF drivers
Date: Sun, 19 Apr 2026 20:21:50 +0200
Message-ID: <20260419182203.4083985-7-daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE5MDE5NyBTYWx0ZWRfX1tM85U2mmRqD
 EK6dTQj7mGJ/dnWngCmsJJ/JIkRdd8TN512LIWwtV4yY24X5yXYTtd59EnCeDYQmmhqj+INNQ1m
 rvxdpb/1R38bFvs3vctSOt/Npfi9pVxGxMDb7ptMaq4IWGfYW7j9gHjip+tYQRklvS8vowYY/2H
 FVN4E0VTpVlXcjR9GQWS6eQnNuYIdhQw0gTif/r5ApQMuzm5lfPZCbGhN+V437kPScBha62II+8
 qjfCs6b8RRsKzXLq76jb4GVr7WfWsBKxJw38z1b8ZYX+hWOy7VzQCjbo9xUQ73Tx0Q7LY0eRny3
 /cnzXspwpY8/5QxavlRMkLXALwsQsMEO49lZGNg4ocvlbNtOhCtO+jv4qirBX09k5rb6sSOP0FZ
 tGx1ecn27T/3NrfjzBEcdI25lVm+oKlE7W1obqG8iNUGtdOfx6dKSYvX+WQZtdCWlRwYmEIIbLL
 xJ+xk5HabDEok0WwA6A==
X-Proofpoint-GUID: f1FmyTulsUCMPI_9RsE_OIGsr-yVquVX
X-Proofpoint-ORIG-GUID: f1FmyTulsUCMPI_9RsE_OIGsr-yVquVX
X-Authority-Analysis: v=2.4 cv=WK1PmHsR c=1 sm=1 tr=0 ts=69e51d73 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=axTsjYC8yfnw0r5e9iIA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_05,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604190197

Provide a non-OF functions to register a cooling device in order to
have a clear separation between OF and non-OF code. Drivers not using
a devicetree can then migrate to this function.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/thermal/thermal_core.c | 44 ++++++++++++++++++++++++++++++++++
 include/linux/thermal.h        | 13 ++++++++++
 2 files changed, 57 insertions(+)

diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
index 2f5d214d51a1..356a49e541fd 100644
--- a/drivers/thermal/thermal_core.c
+++ b/drivers/thermal/thermal_core.c
@@ -1164,6 +1164,50 @@ thermal_cooling_device_register(const char *type, void *devdata,
 }
 EXPORT_SYMBOL_GPL(thermal_cooling_device_register);
 
+static void thermal_cooling_device_release(struct device *dev, void *res)
+{
+	thermal_cooling_device_unregister(*(struct thermal_cooling_device **)res);
+}
+
+/**
+ * devm_thermal_cooling_device_register() - register a thermal cooling device
+ * @dev:	a valid struct device pointer of a sensor device.
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
+devm_thermal_cooling_device_register(struct device *dev, const char *type,
+				     void *devdata, const struct thermal_cooling_device_ops *ops)
+{
+	struct thermal_cooling_device **ptr, *tcd;
+
+	ptr = devres_alloc(thermal_cooling_device_release, sizeof(*ptr),
+			   GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	tcd = thermal_cooling_device_register(type, devdata, ops);
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
+EXPORT_SYMBOL_GPL(devm_thermal_cooling_device_register);
+
 static bool thermal_cooling_device_present(struct thermal_cooling_device *cdev)
 {
 	struct thermal_cooling_device *pos = NULL;
diff --git a/include/linux/thermal.h b/include/linux/thermal.h
index 0ddc77aeeca2..d9332b037188 100644
--- a/include/linux/thermal.h
+++ b/include/linux/thermal.h
@@ -260,6 +260,11 @@ devm_thermal_of_cooling_device_register(struct device *dev,
 				struct device_node *np,
 				const char *type, void *devdata,
 				const struct thermal_cooling_device_ops *ops);
+
+struct thermal_cooling_device *
+devm_thermal_cooling_device_register(struct device *dev, const char *type,
+				     void *devdata, const struct thermal_cooling_device_ops *ops);
+
 void thermal_cooling_device_update(struct thermal_cooling_device *);
 void thermal_cooling_device_unregister(struct thermal_cooling_device *);
 struct thermal_zone_device *thermal_zone_get_zone_by_name(const char *name);
@@ -317,6 +322,14 @@ devm_thermal_of_cooling_device_register(struct device *dev,
 {
 	return ERR_PTR(-ENODEV);
 }
+
+struct thermal_cooling_device *
+devm_thermal_cooling_device_register(struct device *dev, const char *type,
+				     void *devdata, const struct thermal_cooling_device_ops *ops)
+{
+	return ERR_PTR(-ENODEV);
+}
+
 static inline void thermal_cooling_device_unregister(
 	struct thermal_cooling_device *cdev)
 { }
-- 
2.43.0

