Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911703FFADB
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 16:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777479306; cv=none; b=eFeBQ3mYJIS+rXQlXqPdykfEzIa2dyz8692T54EpbE3/TKqnTpIwH2Xl+5w1z3H0ikuBedjkTMZIsaosTOvLDbrF0RHb5PosofWTrZje4ZO5ha2f4b2zDD/oGjyb+ONGEe1ZepIEAAp5gE1Yvr7phBm/1cOUulwHT1x2EjYBpWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777479306; c=relaxed/simple;
	bh=W/DA7KZaSHERCdjZ7882n6PYIAmCOm8xM23/+2wKGcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R/tgEuTsb5s83Y2Z0dN/R7Q7lnCZUkspbXiwTW+qIXBa0pbqS8Uy6w4scjpa5X6OneebLxWzw++wsAK9fp5ftGs8+J9neVkBOQmQav57QioOljkbTTYrx8WeSz9ZFAwthYfOddgu8AQiqzdDMcDL3ilu4/5fuTLHavV4+5RpS8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=foDga1mj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gm1v7X5b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="foDga1mj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gm1v7X5b"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TFZGkM3067007
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 16:14:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PdrQctDCz1u
	Wf9yrg/YenTJPvqTEqEJU5WiItR+z2bc=; b=foDga1mjOzOQkMlobyazC6MANnO
	Pay10GstU7ntOvRj0gCfl0TQ4ligxn7IYEVZftyfFGH+oDcSu5RgkJPd3oct3DvF
	ZYWlOARKL3Vfc4dBNjK+/j7xLVKhQmyBw1ZZyJIpxGU0aaOH7rz+HDydlVzRp/2U
	7yr3ZNhQT0XcS/LKe5NsO9XhePt/9bXgSSEpWB8VxXV0AWT/tPzu45mqlXPatrv0
	PlitsHUbfUH40rO3D2SBuGczj+Tv33cUd/7NhP1bTmmN8sjZX8qFDBVJlOakFP5d
	UVvU+/xgJPb038GdVTooJZN02BciqBHjAgzNIFMOiztwcVjoX+wutjGarQQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du7sxbe0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 16:14:58 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56fab6d9242so23592432e0c.0
        for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 09:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777479298; x=1778084098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PdrQctDCz1uWf9yrg/YenTJPvqTEqEJU5WiItR+z2bc=;
        b=Gm1v7X5b+I5ZQ8tgaMqtOivIilIwFcrBn296LYLvXnh2Rgw/NQy2tRd0XVywxdAC1e
         gm3ynmL2Aw9Hnfsg1svQD6JTmigB0vCxjtOcYWIG5VHKoe6Ph/jDhQfpHAefEavcsORc
         FX+y0OozZ+MxtOnPvN0weRcK7Nz4RBYKqn9zJu/SZXFgUopAAeuBj4ozB0EUU4RotrbV
         T/Y9VK89l7Gs86kvYz7c694d5GJjifFk4X9zKmjO2Z6iIc0kl7iX0RN6efQLZXu0Zmqk
         h+eKAd5xNs295z6K43CbWG2PvUyEMdPB2FbO2z9f7hykYaafA+B6doQt0dFYtLyTvZox
         lvTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777479298; x=1778084098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PdrQctDCz1uWf9yrg/YenTJPvqTEqEJU5WiItR+z2bc=;
        b=mn+mz+a8irYmNlUnAIK7iXeVLvqMcxsZq05+U5X39rG9VG0sCUoqL9MYxBYn4JTz+l
         0pTH6lDHh0j/IpWblkNeY181WteCqDKREY3A0KNEiIUCYY2W5NiUBTGevWY83yQp9lJB
         KamwoC0e2PaWrrnYkTehZsymveEIRV4fO4ajj9zFCwqExUwvRUIhtNySJSQiFtfZOh3m
         nH4yOmc1sCHxpKnBHWwuBxPW7aAsJ7OLvDz9KJdO0V3OACtwgBAod/06tKS6jcnnU9aI
         g0LU+2R9LjfZnA2a1kgU36x5hi/1wLjci8bBhX9445tznmjxWVm05bPRFQx4mbX43Sn4
         qgWA==
X-Forwarded-Encrypted: i=1; AFNElJ+XH3E8Q4Omjo7KEq0bek8p8JjKOs8JlHbxa40mAdcxBUmLPrJqxCnxZ3Q6PwqkC4TcVWLpRJoSQXxX2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyA2xodflbOmYVY4x5bQboqcPCF/0cBlfQOqM/Cnpq+gVR8Xq3q
	CoafJrbHMF6LICBdBdL6YFOLwWFW765Nc5o7Ik+T6uae3O7Yi1auW0FQOOTD4AQ++aPtSJTIJow
	4OPyuLrGCkCn7nVDIrBUjqTKmaTbWF8jQRrXnCoS1a7djxLTvhQZl4jjaJYKQ5qglCQ==
X-Gm-Gg: AeBDiesXkJwG+EDDlZX/OkEvUi9LkP1oEn8/PPo2ILEXdFgk1FTUk/8ByO3SSextt9j
	MJjgRUpFCMXKfuBJc3B00PbJrjFbaWhNw7t3krNWhTWKmEFbodoeqCu/jDlMUj1RLLqhnueLI9i
	bZBHYUSa78cjXsQmMKyDDZ9VJ9d4k10+hESDEHICB+6aNPwA+dPREGw6VyPKHjgkVDf72VM4rso
	j3aIXl73fSjuo3I/4gTpOyd3U0K789vYnJi6XrZAw7jpUblIIKp6ZeMrPPV56HTVoDBNv2GEJQL
	BA75ZkU/Z0Xjv1LmGqBzVh3tTjWZ47iR2mYfZX1gA04VkfTHQBCfjhKMJW6mlurSaipA6WzBhu7
	qO1rz29vX/W5ui4S4+nLn+1aWDazATHJ3KTuFupwxH1Scb7MUnLFWO93briS/
X-Received: by 2002:a05:6122:e202:b0:56f:317a:65d9 with SMTP id 71dfb90a1353d-573b34b118cmr2667178e0c.1.1777479297635;
        Wed, 29 Apr 2026 09:14:57 -0700 (PDT)
X-Received: by 2002:a05:6122:e202:b0:56f:317a:65d9 with SMTP id 71dfb90a1353d-573b34b118cmr2667099e0c.1.1777479297210;
        Wed, 29 Apr 2026 09:14:57 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed659dsm2438525e9.2.2026.04.29.09.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 09:14:56 -0700 (PDT)
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
Subject: [PATCH v3 09/11] thermal/of: Pass the of_index and add a function to register with an index
Date: Wed, 29 Apr 2026 18:14:22 +0200
Message-ID: <20260429161430.3802970-10-daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-GUID: HVzw7_cJVXFL2XyomEkdyCEp8ER0-uIg
X-Authority-Analysis: v=2.4 cv=eeANubEH c=1 sm=1 tr=0 ts=69f22e82 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=V4iKOSeYOELjiAWC:21 a=xqWC_Br6kY4A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=KHKEB8RYcew9Qe18FDUA:9 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE2MiBTYWx0ZWRfX2k6sZtTZqino
 iWXFplRVxrUcUvElENp9aWBKmUm6ZjIydIkBhZ3tOkSl0FHD8S3uf+UQWDcRXnG0b6CHcj5k05t
 b8hzLUqSAA+fHi6gg2QfQVgslyEAdkepv08XjUfk/eIyJwo1EtnA6NrF/ko8WpeWkRwUXYmAUGN
 7m9Pl35dsptvliMa3ja/irEo4RfjWUJg+fKlsC7YLjBfUA1NrUmkaRMZH+ZxhE6BVUy0QFaAaxN
 rA5iGBmK9ZAAYjkw+3B4JGpTMKUpeVYV6o6U1F2Ir6FxhER+LDlQ4HbnWwfN8Rn3RRu6pWfZY/g
 /XiF3XQxS738VX5KjeJQfTRdtWSUL4RkGG41RpS8l26z+8nJqbC/cMPaQ//ZQpFr/yPf3zJJxKu
 fbilGPmSa8N/l+wAu68414S0HQc1SBz7tLksP4zvAqhQmUWXGM/+stqt0zGKF9uWbDPTfHS0igL
 ad/IsTWfQgSX5Lh/XEw==
X-Proofpoint-ORIG-GUID: HVzw7_cJVXFL2XyomEkdyCEp8ER0-uIg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290162

Introduce a new function devm_thermal_of_cooling_device_register()
which will register a cooling device and its id.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/thermal/thermal_of.c | 58 ++++++++++++++++++++++++++++--------
 include/linux/thermal.h      | 13 ++++++++
 2 files changed, 59 insertions(+), 12 deletions(-)

diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index b38623f6b89f..c9190a03993f 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -567,6 +567,51 @@ static void thermal_of_cooling_device_release(void *data)
 	thermal_cooling_device_unregister(cdev);
 }
 
+static struct thermal_cooling_device *
+__devm_thermal_of_cooling_device_register(struct device *dev, struct device_node *np,
+					  int of_index, const char *type, void *devdata,
+					  const struct thermal_cooling_device_ops *ops)
+{
+	struct thermal_cooling_device *cdev;
+	int ret;
+
+	cdev = thermal_of_cooling_device_register(np, of_index, type, devdata, ops);
+	if (IS_ERR(cdev))
+		return cdev;
+
+	ret = devm_add_action_or_reset(dev, thermal_of_cooling_device_release, cdev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return cdev;
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
@@ -593,17 +638,6 @@ devm_thermal_of_child_cooling_device_register(struct device *dev,
 					      const char *type, void *devdata,
 					      const struct thermal_cooling_device_ops *ops)
 {
-	struct thermal_cooling_device *cdev;
-	int ret;
-
-	cdev = thermal_of_cooling_device_register(np, 0, type, devdata, ops);
-	if (IS_ERR(cdev))
-		return cdev;
-
-	ret = devm_add_action_or_reset(dev, thermal_of_cooling_device_release, cdev);
-	if (ret)
-		return ERR_PTR(ret);
-
-	return cdev;
+	return __devm_thermal_of_cooling_device_register(dev, np, 0, type, devdata, ops);
 }
 EXPORT_SYMBOL_GPL(devm_thermal_of_child_cooling_device_register);
diff --git a/include/linux/thermal.h b/include/linux/thermal.h
index 26e33c0236c4..3b21b47de7c9 100644
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

