Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9C0400E0B
	for <linux-hwmon@vger.kernel.org>; Tue, 26 May 2026 14:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779804543; cv=none; b=tgwNHHZX1kCt4rq0i4FG+/xTyxWZJIX+fSNnQRirjyJU/R9pUaky13lVu3K0JoYRMTLG/0zQr5owJGP2Gir/tk9MGfR3rYdZ+ExM9K1CZUsXO4FKkF6KxGsLMkjFf8UkN1DKGiZ+8jF3/Fte+JU56ImYKOWPc/9qmHIChmbIBRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779804543; c=relaxed/simple;
	bh=z8OD6SBz6vhTrneqzDOBO6KmX9eI93f0HTmfNRU10i0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gFr/+TEpAlJD7O2Z7RWpe3gtf0lpIha0XaXpIO6/R0bC+e4GyOIpn/WEm+0tJYbGOZikaopO+5AxbslPwjzse+rPhsLCIvWiLRsy1j2NXDm1NmL2qfiTde8t2s8BCuQ4PY9vgybEiAVGpyMtzCeBkbcrQozSvvZlqaQ30RDrVeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iVgk6FdK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eg9+mvO8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iVgk6FdK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Eg9+mvO8"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsXE01430495
	for <linux-hwmon@vger.kernel.org>; Tue, 26 May 2026 14:09:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dLi4TiEmObo
	hvWqP6xSvpTLLg5OaciNehCFkM4sW88w=; b=iVgk6FdKFOAGKCv+W4aFUi2+3kl
	4T8nOjJHwZZYr4J0EMuJae1EKW2NTabJbeUBd0I52mQaJSLk46LeN2RKZhZ1K+zl
	Q5H06A/fYmbNg+0RMxHfquhj3poXlWssSfyFwaBJF3ERXVApq5nfMxmd4hJbcj9x
	jGUmnFr9Sd/RtOf+821ipMyseXSOIvVIvBZ8wwmFbbpdJuRkMgkblQMU0iepDVWs
	boP7ymY1lJImG95LjuLRtzK+zuadhj8inkDcScCFr0VZssIPjIbhSiV/T1jHaYYs
	dVS68tBRIBfT3utnO0YPdajvsg45akq4kx1+XwCjz8/JnhK8VC+8GmkHZag==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecmbv5e0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 26 May 2026 14:09:01 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95d434f3356so3493927241.0
        for <linux-hwmon@vger.kernel.org>; Tue, 26 May 2026 07:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779804540; x=1780409340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dLi4TiEmObohvWqP6xSvpTLLg5OaciNehCFkM4sW88w=;
        b=Eg9+mvO8TZBDVjyEnepl638ZPxoALHeXnBaRP8nZdEIGesh4raiujn4bnx0tk4Jn69
         Ipm0gUnpcXDeZb1V+w8xRKAOxiJZviPSRDwUHi6obauYvuzthavPHpX5o3fkysZIrTaj
         re0iJnQGu+SL9arbdKn5kzuLxW9mfWMCKR6Q9Ed3iCWmUIif9B4izsmy3wnLC/68ITR2
         ISYeiq9ucpLsVDFmwHf3St3zTO6R88s0tiyX9iXANEzX6JsZyXbrzTFdLHLjMdTn+oJD
         ej8O1PkIrCnz07mo4GHYAUUVd4rnwQEeiefSwwer/KFHHhy6Tg4kFtAwzz2Hcx0G/15k
         lSQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779804540; x=1780409340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dLi4TiEmObohvWqP6xSvpTLLg5OaciNehCFkM4sW88w=;
        b=h5E/SI+oMg93DaLg1E98tu7VVfeYaB4S/8Ei4XWNcyE5mYeGr1GWPFYq59fwlLP1nd
         hVPzsKa13ni3iKaniT8eOOVgACISGwzECmruK4wQRFn1vm5UmtEMlKhkgpJ/3Wz/I/Y0
         +/tbj3xuFvhkTtTUJzVw5u4y/mbAhNEEmyqbUbCVX4W0XkrP0VDkjRTloPjCLtfZt9Vd
         0WyJDz5o4d9oBXBYDiJfC8lLYhcFjfyq9tauruidHn5mpg4y/2gXTxJR0hyUhMzp+ikw
         DM8njg1IsLmy062Bb4+UFCJwlwqt1HRlcNh64tMIMiHO3hkmT7q6hP/lJwMmZ0CFynIX
         KEGg==
X-Forwarded-Encrypted: i=1; AFNElJ/IR8FCB9TfTvRUEJk8uJJJ99MoscXql7jnbScRl8o3dLfOf8ss7Hga0t2cq63M+Kt4vfb9rWhWeMd99w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxYT9VGFR/k3hYwOxULyp6lyi1OuQQ3aPe0CYrcSTHtscVcCtF
	izWzQLyy/EpT6LFshgaFxi8ng16UusuyhcYjTpMtbdg/Gf6GJbdt2b8t9csovKao5GJM6qg4thB
	WXVBn6AYp+cm0MQei/xq7mqHtY5K0NM9U7u/BvQZeU3SlPpAB9at69U6rVvjV1wFqCw==
X-Gm-Gg: Acq92OF5aOoL0FqIkJKZv0tp3ecYpjJL+fahaTyV1vKcZfIGWH7D71ucgAxXrNBd9KN
	9vyJjsoCvshSGktMeRWFHxjbcV9LaxZCVZ81Wl2k7LxhqkXqvxyQD7YD31l/mp7FUHN6RygnlqE
	bHYvfZFQf2hfLGa7uaIDy/zGnnEoN6GZFYQvvGv87AS78k2hcOB8Ksrlt8ZlnKySWE49BBz5AkX
	obXuF+U3WPhq4MLWbtdUdpcWncq2Zr70WxMd664YgaZg/DokxITuSZwPoyOReDVYZFFvBFaJJus
	EUn25roE6CwxbEhVGDfggey6F61v/YBI7UW9wz4OVmWJp0KeFGETKVTjXPtNmTBMsTA7Jlk40P9
	z87QcuxOtKp/k8rrEHWvLQ5F2+Ewnhmy80jR+ER+utWvmN9AmmXEuMk6uYKE=
X-Received: by 2002:a05:6102:3f08:b0:650:aa33:5f2c with SMTP id ada2fe7eead31-67c738b4aefmr8963774137.7.1779804540253;
        Tue, 26 May 2026 07:09:00 -0700 (PDT)
X-Received: by 2002:a05:6102:3f08:b0:650:aa33:5f2c with SMTP id ada2fe7eead31-67c738b4aefmr8963650137.7.1779804539520;
        Tue, 26 May 2026 07:08:59 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:9e9:6f8d:9f1c:61e1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490424aa561sm156266605e9.5.2026.05.26.07.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:08:58 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org, daniel.lezcano@kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
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
Subject: [PATCH v4 08/10] thermal/of: Pass cdev_id and introduce devm registration helper
Date: Tue, 26 May 2026 16:08:09 +0200
Message-ID: <20260526140802.1059293-20-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526140802.1059293-12-daniel.lezcano@oss.qualcomm.com>
References: <20260526140802.1059293-12-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5343; i=daniel.lezcano@oss.qualcomm.com; h=from:subject; bh=z8OD6SBz6vhTrneqzDOBO6KmX9eI93f0HTmfNRU10i0=; b=owEBbQGS/pANAwAIAagyI4oqT+hPAcsmYgBqFalQPzyVx00QyiOmKO+cWxf2EPIsl9f/HZaLW rypI+FhY3mJATMEAAEIAB0WIQQafc3hhXPRY1XIeySoMiOKKk/oTwUCahWpUAAKCRCoMiOKKk/o T9kaB/4/ayPUE2+dEPnc9mPrj17ntlSinzmVQ1dXiNjTxmtqOXhy/8eIGrwlRbI2f7RBwElkAkH fVVjzH1nPpo8366Cz6jjzKevixWsANHo9VL0TnzX5dDbGV60iZwcul8gaaQl3TYogOblqt1F0K/ noodSftrodDY0Pq+xdb1QYzzNTe1r1MePaV3DXdCObjfLJ+OQh/BQ0/Mje2ER4B4Al2P60jl6nN Qh/6S0J/Pe9duBd7eJmDJu/drZWk5afUytqxtp/k2Hf/pVdvLDSoFm6NFs9VHDwBHeeMkv7xYmg FbJmkK7OB3jTcP4PDm0Dw4fSo7UXxi/JTzT9ymdx9Vn5S5HY
X-Developer-Key: i=daniel.lezcano@oss.qualcomm.com; a=openpgp; fpr=24D626F253BE9E87E6CE5BF48FF4B8D271675527
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEyMSBTYWx0ZWRfX4+9mS41cO5Uh
 0kb76X+UYKCApiZgEhyoaJJMUBI3Ji7gVIcnqmmJIzHewPNdJijOBr82yXdVmeeMFTzToqO9oV5
 wN3GmAS+HpNFwieaGtI+nbhskzkcolC61hPf6TrrlDvbEmIt41wLev8u95vi4QYXd4lXByEw1an
 gW3TeQHNaapDmG16a78P9gMi7UZcTGvV+pWoSGkfhuyoaBUdk6aVPxD6TFuFdaszVbW6l4UDBIZ
 r+jprlphGqWNniazbAD5rejxOMoEMdOmaKrUnQJMtLDCWhOECIkjGei+4VYIldl5stKDzSygFV1
 487hY6qDl4gvz2dgjRUnlarUxBV/rI6UPltuIWhEkItWNLNOOofLQHlVwwuZBDRRG61Q/FZDU2P
 EiWLxWtmtMPqudAHDBn25atuwyZlazxMyp1jc4YVtJMSNdrnHNwNhfXRWcIEn4hP4bZPd4Uihpz
 9AxJr+OswPVlApabsWA==
X-Proofpoint-GUID: ucO0TbCYyEZmf0aYrK_7Vhwi1oNDQRAz
X-Proofpoint-ORIG-GUID: ucO0TbCYyEZmf0aYrK_7Vhwi1oNDQRAz
X-Authority-Analysis: v=2.4 cv=XqTK/1F9 c=1 sm=1 tr=0 ts=6a15a97d cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=vPPyk02ySupRDbnf7w4A:9
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260121

Extend the OF cooling device registration to support an explicit
cooling device identifier (cdev_id), preparing for upcoming DT
bindings where cooling devices are identified by a tuple (device node,
id) instead of relying on child nodes.

Introduce a new helper:

  devm_thermal_of_cooling_device_register()

which registers a cooling device using the device's of_node and an
explicit cdev_id. This complements the existing
devm_thermal_of_child_cooling_device_register() helper, which
remains dedicated to the legacy child-node based bindings.

Internally, factorize the devm registration logic into a common
helper to avoid code duplication.

Existing users are unaffected, as the child-based helper continues
to pass a default cdev_id of 0, preserving current behavior.

This change is a preparatory step for supporting indexed cooling
devices in thermal OF bindings.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/thermal/thermal_of.c | 58 ++++++++++++++++++++++++++++--------
 include/linux/thermal.h      | 13 ++++++++
 2 files changed, 59 insertions(+), 12 deletions(-)

diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index 0110b195f7a3..3584024b76f5 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -558,6 +558,51 @@ static void thermal_of_cooling_device_release(void *data)
 	thermal_cooling_device_unregister(cdev);
 }
 
+static struct thermal_cooling_device *
+__devm_thermal_of_cooling_device_register(struct device *dev, struct device_node *np,
+					  u32 cdev_id, const char *type, void *devdata,
+					  const struct thermal_cooling_device_ops *ops)
+{
+	struct thermal_cooling_device *cdev;
+	int ret;
+
+	cdev = thermal_of_cooling_device_register(np, cdev_id, type, devdata, ops);
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
+ * @cdev_id:	a cooling device index in the cooling controller
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
+devm_thermal_of_cooling_device_register(struct device *dev, u32 cdev_id,
+					const char *type, void *devdata,
+					const struct thermal_cooling_device_ops *ops)
+{
+	return __devm_thermal_of_cooling_device_register(dev, dev->of_node, cdev_id,
+							 type, devdata, ops);
+}
+EXPORT_SYMBOL_GPL(devm_thermal_of_cooling_device_register);
+
 /**
  * devm_thermal_of_child_cooling_device_register() - register an OF thermal cooling
  *                                             device
@@ -584,17 +629,6 @@ devm_thermal_of_child_cooling_device_register(struct device *dev,
 					      const char *type, void *devdata,
 					      const struct thermal_cooling_device_ops *ops)
 {
-        struct thermal_cooling_device *cdev;
-        int ret;
-
-	cdev = thermal_of_cooling_device_register(np, 0, type, devdata, ops);
-	if (IS_ERR(cdev))
-		return cdev;
-
-        ret = devm_add_action_or_reset(dev, thermal_of_cooling_device_release, cdev);
-        if (ret)
-                return ERR_PTR(ret);
-
-        return cdev;
+	return __devm_thermal_of_cooling_device_register(dev, np, 0, type, devdata, ops);
 }
 EXPORT_SYMBOL_GPL(devm_thermal_of_child_cooling_device_register);
diff --git a/include/linux/thermal.h b/include/linux/thermal.h
index fb7649439dfa..81be6e6061b3 100644
--- a/include/linux/thermal.h
+++ b/include/linux/thermal.h
@@ -206,6 +206,11 @@ thermal_of_cooling_device_register(struct device_node *np, u32 cdev_id,
 				   const char *type, void *data,
 				   const struct thermal_cooling_device_ops *ops);
 
+struct thermal_cooling_device *
+devm_thermal_of_cooling_device_register(struct device *dev, u32 cdev_id,
+					const char *type, void *devdata,
+					const struct thermal_cooling_device_ops *ops);
+
 struct thermal_cooling_device *
 devm_thermal_of_child_cooling_device_register(struct device *dev,
 					      struct device_node *np,
@@ -233,6 +238,14 @@ thermal_of_cooling_device_register(struct device_node *np, u32 cdev_id,
 	return ERR_PTR(-ENODEV);
 }
 
+static inline struct thermal_cooling_device *
+devm_thermal_of_cooling_device_register(struct device *dev, u32 cdev_id,
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

