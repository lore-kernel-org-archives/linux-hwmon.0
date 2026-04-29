Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683E34014A0
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 16:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777479297; cv=none; b=WTe2koLKY2Sj4nN2OSF5wvyCWA1HeT+OLvVM7VOtUqkjiHbfqbWaPImtcWuMyeXMKP1lkvzVh1I19o0T+oVrZme95FCd9ILrwELX3vgTizTFy9QVfzrbGmd8Yd7hOngrsrbcS4KcowJXP2gHEa1S/pWwLEa7T1M5Z+0V6d2372I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777479297; c=relaxed/simple;
	bh=Ex6Mp6yHP3NfKWI4Djrm33G8n0aBYcaYmApLwhOBJeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Up7NPRhX9elb+XqBVDsEHnRoV8FvE+eOCFbun21QmAa71O2xQHs6rTP7ck2d/JLDf38W+SH8Lw9dRVt1wZIs9bTASGDlI/lFKXN2ohRlBVNmBFVhIMd3d1UqEAdWVRFKPIEGIadDS2nWqI9IPNmTTgHX8CKiytpzkDcj/SrL+lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iCEQz41S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BDTC019U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iCEQz41S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BDTC019U"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TFYCNT1729375
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 16:14:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=E3jiCPQeEhU
	GxNHVRP3aV2Dn9BaGTadLWJf5AW9mXkk=; b=iCEQz41SuHPbf+wrx8gm8zZ3rsM
	RjH2VXgjy/3nwYBmYsNy5JpoSBcr3lgALB9Nu/U520RTA2eb9JYKaLX1tjpCn7TL
	O1C0LW2mXsD+ph5eMh85ahC3SbNHbZzEwLfvBhMmuaEMxCbI1U+k5BS2d3+N7+SO
	ULBn+6aGZqygTOV0yGWaJ+sIDPnOUkFe/WRI7HZ5vsUn6o4auKAiY9+K8n32kfZ0
	iO15qowVXk8r76iJomqo8tUoVlWy7ko2YJfGk2BB7xSMogJqGF7bDc4/1XJG3g9g
	KJQwcpGm9G2YMkgjREt/E2XHWmLP27LWjwSQFeAONACIQdaMH/8reuIuh7A==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4due5ksw3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 16:14:51 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56f66493ef1so6872106e0c.0
        for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 09:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777479290; x=1778084090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E3jiCPQeEhUGxNHVRP3aV2Dn9BaGTadLWJf5AW9mXkk=;
        b=BDTC019UrDHxlyG1tUdtCX26u6AtVAOqzkFdZ8dHQI7i1jaOsRRZ1DjwgqUGtrEw4S
         r8AG+Y76dZQgLIOvieAmbdPKa4iKX9MJJZROA/8sd2JiVyYceiAB9NQBxqc9BtUz6UC9
         M+kiN4PdhBP109lziMZy2PCF6iSKLkKX5ovCMwSoeh7L6mHtO+eHCc3diV3XRHBDw6K0
         d/orL7YDcYAhUC+DEMSwwZ3tIt/rcMOgPasl2gF+Y+725dwRSrgIOcbtW5Mb94EX/zb4
         PJVJdXQicSXf9wK9/HL0/8onirf+Rzd2geulFG1d81O7pTfCuiJ2FfxFQXl/A7bBULkh
         mBNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777479291; x=1778084091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E3jiCPQeEhUGxNHVRP3aV2Dn9BaGTadLWJf5AW9mXkk=;
        b=j99I7m02iAuMxK92SaMRfEoZUy7tss5i5KHi9vsLb1V279oudf7ozFerXRNCkEUYxn
         1g2IxPsuSfNdWG2ru+y/DGJTIaKjThjEkGgncSzGGyRm9oZQkIRwEckXuypFsanC8tXU
         AuRj7bivSjZTQsofeyvIvuKqH7SF74PNU96qTV3fhgB9PCPMoJVmCQHekeJ0Gl+YQ6V3
         jcGp+H/nOFlCVCoZGn/9JqYy70MRPeoAyEOz09pYQJZ6sajOfQ+fXUeyZyT3n2h/zTG/
         /VZGphnBXw7NBygDvHUPFHXPpeRo9vlfhUgpJlDf8+ryc7f04DnWut8Uz42KQ5aS9KwS
         9nzQ==
X-Forwarded-Encrypted: i=1; AFNElJ+vnE90KIInxU0cZxSYJKpOHMLz8WzBx7cpyIJcnS7T9vOHFsrRb/y5psKfm91GU8L9syF7LvyJcgbK8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlD/mb7SR4DmU7rFvEqkxJS5AxHBbbGUf3v7D6tI0+LO6m5+89
	m33GlzRY8foBHV+lHfRabkM0D3Sah+fNaTE1ZM7hancqd86kKcnJj5Rrajmynkayel/F0Fzj8bR
	zwtgbyIpRK+qLLQnJZlUMA4gqs4QK/TMK6v1Mx40Wm7TSxUqwHHBcMF35oFqVuRiRpQ==
X-Gm-Gg: AeBDies2hHkCnL76FkzFgcrRNyZpFrDrWiO3PdXO/mtzd0N0bplCbXxXGL6bDckGCPl
	EqwlUdQ7ycQUoRkiATIsT6p+TlX9NiLEIcF5xJBaEwTkDIZVQVSJA4m2P/6Zdqi/NwYEhHoc9zA
	vFIWVbfOVt5kmWMesjnSEbdtySHwqcuI5wl2p8SMVfwTfUvJhkDgM6FMql2dSGOm+K6N9snV9yZ
	YmYxFVhuhI+i6EWjAjJVv+NrmZklov8z3NV94rWYLbVL2pEJkhk3wO3lReMoyOSCBIIOeOKOnn7
	H69i/g7v7wZ1y+Hve+apuVzvHUIN4xw/2hmwx7kU14v68Tw5va2kOZaWRr4sbpQnjlbH75mh7yk
	ZXbuBNkAPGZ4vxiTBGpQOmqEA+04qqnImf1WQHqbF9mmmlRUEL2eIk34GbtJn
X-Received: by 2002:a05:6122:83c3:b0:56e:f262:9113 with SMTP id 71dfb90a1353d-573a574bd4emr4901037e0c.14.1777479290528;
        Wed, 29 Apr 2026 09:14:50 -0700 (PDT)
X-Received: by 2002:a05:6122:83c3:b0:56e:f262:9113 with SMTP id 71dfb90a1353d-573a574bd4emr4900974e0c.14.1777479290066;
        Wed, 29 Apr 2026 09:14:50 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed659dsm2438525e9.2.2026.04.29.09.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 09:14:49 -0700 (PDT)
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
Subject: [PATCH v3 06/11] thermal/of: Move OF code where it belongs to
Date: Wed, 29 Apr 2026 18:14:19 +0200
Message-ID: <20260429161430.3802970-7-daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE2MiBTYWx0ZWRfX3SlsngDU66hn
 D97GvYiEgEzxTh9WYB4BIrcVPZ+rSgxKXxtudkpvDHLXmzTkrJDlT8Vamp2IcX8g3IE9b0APMk/
 Jk6aeLlEPDw8UfyAWCaFkKfRBSw5D7URHj//LDbLMHdQj0r7fe1ENOOxZMURLqDLvz9q/g/0zyh
 3RGLgy5ymtFaIFrCnJFgN2WYR77h5nwukovRzx8vSWVzSh2JN5TcZZ0kDjy6Gp0ug4KfTv+NPf6
 gTwT+uWKNwEzWnVnCiM6o2PhbaCqr87gbWz8/WpD3sG4WFJj5Quu92D4YVQxURoqMYHJIjOzdo8
 FcfAuAMNVUwAQdyK9lxE+Y5/kggUQs4LkN0qdF3hPD3Nv8yI6r3XAYSYcNzXPoG27U2Mwl2efGJ
 GmMLBtWZFkbkXzLkdlwUJsfGAnRt3Ia3nHG8O098ImEYIfuWN3qIymd6y6sytEgcfxcDDiLyDxq
 qtAmcwxVeU8d/PGdIYA==
X-Proofpoint-GUID: wBWZdgIry1MFizKP-gjh9XYsBWzBIio5
X-Proofpoint-ORIG-GUID: wBWZdgIry1MFizKP-gjh9XYsBWzBIio5
X-Authority-Analysis: v=2.4 cv=CL4amxrD c=1 sm=1 tr=0 ts=69f22e7b cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=jLM6qsj88INzSaGZquIA:9
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290162

The functions:
 - thermal_of_cooling_device_register()
 - devm_thermal_of_cooling_device_register()

 are related to thermal-of but they are implemented in
 thermal-core. Move these functions to the right file.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/thermal/thermal_core.c | 78 +-------------------------------
 drivers/thermal/thermal_core.h |  6 +++
 drivers/thermal/thermal_of.c   | 83 ++++++++++++++++++++++++++++++++++
 include/linux/thermal.h        | 48 ++++++++++++--------
 4 files changed, 118 insertions(+), 97 deletions(-)

diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
index 7867e6bc0a6c..f779fd393323 100644
--- a/drivers/thermal/thermal_core.c
+++ b/drivers/thermal/thermal_core.c
@@ -1040,7 +1040,7 @@ static void thermal_cooling_device_init_complete(struct thermal_cooling_device *
 		thermal_zone_cdev_bind(tz, cdev);
 }
 
-static struct thermal_cooling_device *
+struct thermal_cooling_device *
 __thermal_cooling_device_register(const char *type, void *devdata,
 				  const struct thermal_cooling_device_ops *ops,
 				  void (*initcb)(struct thermal_cooling_device *,
@@ -1150,44 +1150,6 @@ thermal_cooling_device_register(const char *type, void *devdata,
 }
 EXPORT_SYMBOL_GPL(thermal_cooling_device_register);
 
-static void thermal_of_cooling_device_init(struct thermal_cooling_device *cdev, void *data)
-{
-	struct device_node *np = data;
-
-	cdev->np = np;
-}
-
-/**
- * thermal_of_cooling_device_register() - register an OF thermal cooling device
- * @np:		a pointer to a device tree node.
- * @type:	the thermal cooling device type.
- * @devdata:	device private data.
- * @ops:		standard thermal cooling devices callbacks.
- *
- * This function will register a cooling device with device tree node reference.
- * This interface function adds a new thermal cooling device (fan/processor/...)
- * to /sys/class/thermal/ folder as cooling_device[0-*]. It tries to bind itself
- * to all the thermal zone devices registered at the same time.
- *
- * Return: a pointer to the created struct thermal_cooling_device or an
- * ERR_PTR. Caller must check return value with IS_ERR*() helpers.
- */
-struct thermal_cooling_device *
-thermal_of_cooling_device_register(struct device_node *np,
-				   const char *type, void *devdata,
-				   const struct thermal_cooling_device_ops *ops)
-{
-	struct thermal_cooling_device *cdev;
-
-	cdev = __thermal_cooling_device_register(type, devdata, ops,
-						 thermal_of_cooling_device_init, np);
-	if (IS_ERR(cdev))
-		return cdev;
-
-	return cdev;
-}
-EXPORT_SYMBOL_GPL(thermal_of_cooling_device_register);
-
 static void thermal_cooling_device_release(void *data)
 {
 	struct thermal_cooling_device *cdev = data;
@@ -1230,44 +1192,6 @@ devm_thermal_cooling_device_register(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_thermal_cooling_device_register);
 
-/**
- * devm_thermal_of_cooling_device_register() - register an OF thermal cooling
- *					       device
- * @dev:	a valid struct device pointer of a sensor device.
- * @np:		a pointer to a device tree node.
- * @type:	the thermal cooling device type.
- * @devdata:	device private data.
- * @ops:	standard thermal cooling devices callbacks.
- *
- * This function will register a cooling device with device tree node reference.
- * This interface function adds a new thermal cooling device (fan/processor/...)
- * to /sys/class/thermal/ folder as cooling_device[0-*]. It tries to bind itself
- * to all the thermal zone devices registered at the same time.
- *
- * Return: a pointer to the created struct thermal_cooling_device or an
- * ERR_PTR. Caller must check return value with IS_ERR*() helpers.
- */
-struct thermal_cooling_device *
-devm_thermal_of_cooling_device_register(struct device *dev,
-				struct device_node *np,
-				const char *type, void *devdata,
-				const struct thermal_cooling_device_ops *ops)
-{
-	struct thermal_cooling_device *cdev;
-	int ret;
-
-	cdev = thermal_of_cooling_device_register(np, type, devdata, ops);
-	if (IS_ERR(cdev))
-		return cdev;
-
-	ret = devm_add_action_or_reset(dev, thermal_cooling_device_release, cdev);
-	if (ret)
-		return ERR_PTR(ret);
-
-	return cdev;
-}
-EXPORT_SYMBOL_GPL(devm_thermal_of_cooling_device_register);
-
 static bool thermal_cooling_device_present(struct thermal_cooling_device *cdev)
 {
 	struct thermal_cooling_device *pos = NULL;
diff --git a/drivers/thermal/thermal_core.h b/drivers/thermal/thermal_core.h
index d3acff602f9c..6935b09b9978 100644
--- a/drivers/thermal/thermal_core.h
+++ b/drivers/thermal/thermal_core.h
@@ -269,6 +269,12 @@ void thermal_zone_device_critical_shutdown(struct thermal_zone_device *tz);
 void thermal_governor_update_tz(struct thermal_zone_device *tz,
 				enum thermal_notify_event reason);
 
+struct thermal_cooling_device *
+__thermal_cooling_device_register(const char *type, void *devdata,
+				  const struct thermal_cooling_device_ops *ops,
+				  void (*initcb)(struct thermal_cooling_device *,
+						 void *), void *data);
+
 /* Helpers */
 #define for_each_trip_desc(__tz, __td)	\
 	for (__td = __tz->trips; __td - __tz->trips < __tz->num_trips; __td++)
diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index 99085c806a1f..ba6f246ddef0 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -510,3 +510,86 @@ void devm_thermal_of_zone_unregister(struct device *dev, struct thermal_zone_dev
 			       devm_thermal_of_zone_match, tz));
 }
 EXPORT_SYMBOL_GPL(devm_thermal_of_zone_unregister);
+
+static void thermal_of_cooling_device_init(struct thermal_cooling_device *cdev, void *data)
+{
+	struct device_node *np = data;
+
+	cdev->np = np;
+}
+
+/**
+ * thermal_of_cooling_device_register() - register an OF thermal cooling device
+ * @np:		a pointer to a device tree node.
+ * @type:	the thermal cooling device type.
+ * @devdata:	device private data.
+ * @ops:		standard thermal cooling devices callbacks.
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
+thermal_of_cooling_device_register(struct device_node *np,
+				   const char *type, void *devdata,
+				   const struct thermal_cooling_device_ops *ops)
+{
+	struct thermal_cooling_device *cdev;
+
+	cdev = __thermal_cooling_device_register(type, devdata, ops,
+						 thermal_of_cooling_device_init, np);
+	if (IS_ERR(cdev))
+		return cdev;
+
+	return cdev;
+}
+EXPORT_SYMBOL_GPL(thermal_of_cooling_device_register);
+
+static void thermal_of_cooling_device_release(void *data)
+{
+	struct thermal_cooling_device *cdev = data;
+
+	thermal_cooling_device_unregister(cdev);
+}
+
+/**
+ * devm_thermal_of_cooling_device_register() - register an OF thermal cooling
+ *					       device
+ * @dev:	a valid struct device pointer of a sensor device.
+ * @np:		a pointer to a device tree node.
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
+devm_thermal_of_cooling_device_register(struct device *dev,
+					struct device_node *np,
+					const char *type, void *devdata,
+					const struct thermal_cooling_device_ops *ops)
+{
+	struct thermal_cooling_device *cdev;
+	int ret;
+
+	cdev = thermal_of_cooling_device_register(np, type, devdata, ops);
+	if (IS_ERR(cdev))
+		return cdev;
+
+	ret = devm_add_action_or_reset(dev, thermal_of_cooling_device_release, cdev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return cdev;
+}
+EXPORT_SYMBOL_GPL(devm_thermal_of_cooling_device_register);
diff --git a/include/linux/thermal.h b/include/linux/thermal.h
index eff01fba0c81..f207ca6b63ae 100644
--- a/include/linux/thermal.h
+++ b/include/linux/thermal.h
@@ -200,6 +200,15 @@ struct thermal_zone_device *devm_thermal_of_zone_register(struct device *dev, in
 
 void devm_thermal_of_zone_unregister(struct device *dev, struct thermal_zone_device *tz);
 
+struct thermal_cooling_device *
+thermal_of_cooling_device_register(struct device_node *np, const char *type, void *devdata,
+				   const struct thermal_cooling_device_ops *ops);
+
+struct thermal_cooling_device *
+devm_thermal_of_cooling_device_register(struct device *dev,
+					struct device_node *np,
+					const char *type, void *devdata,
+					const struct thermal_cooling_device_ops *ops);
 #else
 
 static inline
@@ -213,6 +222,23 @@ static inline void devm_thermal_of_zone_unregister(struct device *dev,
 						   struct thermal_zone_device *tz)
 {
 }
+
+static inline struct thermal_cooling_device *
+thermal_of_cooling_device_register(struct device_node *np,
+				   const char *type, void *devdata,
+				   const struct thermal_cooling_device_ops *ops)
+{
+	return ERR_PTR(-ENODEV);
+}
+
+static inline struct thermal_cooling_device *
+devm_thermal_of_cooling_device_register(struct device *dev,
+					struct device_node *np,
+					const char *type, void *devdata,
+					const struct thermal_cooling_device_ops *ops)
+{
+	return ERR_PTR(-ENODEV);
+}
 #endif
 
 int for_each_thermal_trip(struct thermal_zone_device *tz,
@@ -254,18 +280,11 @@ void thermal_zone_device_update(struct thermal_zone_device *,
 
 struct thermal_cooling_device *thermal_cooling_device_register(const char *,
 		void *, const struct thermal_cooling_device_ops *);
+
 struct thermal_cooling_device *
 devm_thermal_cooling_device_register(struct device *dev, const char *type,
 				     void *devdata, const struct thermal_cooling_device_ops *ops);
 
-struct thermal_cooling_device *
-thermal_of_cooling_device_register(struct device_node *np, const char *type,
-				   void *devdata, const struct thermal_cooling_device_ops *ops);
-struct thermal_cooling_device *
-devm_thermal_of_cooling_device_register(struct device *dev,
-				struct device_node *np,
-				const char *type, void *devdata,
-				const struct thermal_cooling_device_ops *ops);
 void thermal_cooling_device_update(struct thermal_cooling_device *);
 void thermal_cooling_device_unregister(struct thermal_cooling_device *);
 struct thermal_zone_device *thermal_zone_get_zone_by_name(const char *name);
@@ -319,18 +338,7 @@ devm_thermal_cooling_device_register(struct device *dev, const char *type,
 }
 
 static inline struct thermal_cooling_device *
-thermal_of_cooling_device_register(struct device_node *np,
-	const char *type, void *devdata,
-	const struct thermal_cooling_device_ops *ops)
-{ return ERR_PTR(-ENODEV); }
-static inline struct thermal_cooling_device *
-devm_thermal_of_cooling_device_register(struct device *dev,
-				struct device_node *np,
-				const char *type, void *devdata,
-				const struct thermal_cooling_device_ops *ops)
-{
-	return ERR_PTR(-ENODEV);
-}
+
 static inline void thermal_cooling_device_unregister(
 	struct thermal_cooling_device *cdev)
 { }
-- 
2.43.0

