Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74B92DEA9B
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Apr 2026 18:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776622955; cv=none; b=G1LloDX9Q2Zl+9wExKRJJGzYztmSRxdLngGMUBVOmmxcKNCq93nx+MdSeHlFiB62pO016YaWj/r1truJ68f5DE2KMpy5rIsM7bjNTI5h61Zr8vuvODFgBjQ5jPcqaPGEwrgEUCmGY/1C+QInN3fCW4byazmC8zhg2JeH9tRg+iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776622955; c=relaxed/simple;
	bh=Y5QeZARN7N3l8TrjUL9gkwuxX1udIH2jTgvXmLkTbGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TCfX3tvZ73oHHoIomVTnSioW3/A3IG1GVlKybLEagLoShnO9l7ojhqb27qv4JYRPvkWyRbEoMP8Xg8jx1hXRgC9+gUJg3mqs/TD+bqElQP6J1LepiLrebBbQJXfYHY4Fh8J6SDLyTrq4LEw3i2cD1bV5KXI1aHHf1ageAVSKvdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fR/kbv6y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aeBl6nVL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fR/kbv6y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aeBl6nVL"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63JAQPH61414426
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Apr 2026 18:22:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Id99JuSnTtg
	UpQfz1lcAgo+qRwxEaTN/a4aEv+mMZ7g=; b=fR/kbv6yuw2Javw4aiZzls9kvWP
	hXh6FMerTskNuujJ63dhQ5iFe5WuXxavHWJ2M289iDfcxA49kMs/oBu+fBk7qCHK
	8VoDOC4w7JlGlDrV0rNUxsbBAWPzdylTabsD+63TaBGM8enIJp+DRmIlpymWVr/A
	PZaJ0hjZ3ljXtixb3hj3Ot6e58BIOMcUYG0bhFbK14LqgrV4ycrcByrN3pDhEgdR
	QFvBGev9r3DkyyoYp5wucigwl5JRjsIGgNhM4I8SfsUOulx9y+3NQm+/Rlgi00vX
	NM9HGZo9OIaOav6hQ9RZdjqN4/63eXyyZOqhrscjhZ2TeivoyV+s9xU6IcA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm0y634xr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Apr 2026 18:22:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d9d52ad9aso44900181cf.0
        for <linux-hwmon@vger.kernel.org>; Sun, 19 Apr 2026 11:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776622952; x=1777227752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Id99JuSnTtgUpQfz1lcAgo+qRwxEaTN/a4aEv+mMZ7g=;
        b=aeBl6nVL4tKd2pbSNhMyxLP7zRUiYJ/PiZVkpx+bztWv4WxNxIqbT5D1GaRUc1bTc6
         uWo1AuW/81XjQfMsgQUBnXIIl3IEXiS1u9LiE1sfcegHoQpdmmXms5B7DIySUMKLuZlW
         3sgoSg2TMBI9q1HRLUoFfs38ZGFUBKjuybODsyG4ymBsMBEQKfNGMj5RjEmJfnAi3Enz
         IXKp2pdpxfrnUHye8FfL+HTmopsVw7z82k/r/s+B2fVKu9//ijHQ203uFlJEK62wwxj4
         Be0C3L/C4pKA0sFTe1MQ+cVzA3+tY9KHsVJJMFF9mo7ulApPkSiZh5r6VhXoYeRVA86w
         DFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776622952; x=1777227752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Id99JuSnTtgUpQfz1lcAgo+qRwxEaTN/a4aEv+mMZ7g=;
        b=lSc0fub5wle7UZ8NseuBpGmHj7CziutV/S/olT1HCM9VArk0Fa6ft6uKOKzBbqZ1eF
         DpnGJ6V+g3Iz1YFia1wdx/mXcIOFywOAgQ/hiMkZMX0oGktrWB00e475ffvr2KNQHoKy
         V6jQ1gwpWY52gV2dD+ozXLeVkFKKKd9OeOaXIgMThkb+wZOzWvXAq14SgIS3Of+7zlj5
         S9KgdMp4JpqoSG4z9dJTWvw8nTueGRCebshA1gOnMclxhAAEQL/6glt6iipbAZkdl+RC
         7Bu66VTkzLwVSAvTlfjptASpjrXjIAoXaMizDSuaB2I5J/CEU9bwK3tZ2RCjR+YICgls
         jhaA==
X-Forwarded-Encrypted: i=1; AFNElJ8I/FeDcGIcyaRBVc2fn8Rw6XmedKa7H/8zbMSUZCz4HOdMS5HZDs0XIuOc3YMJEjXk3iS2/tni5Ea5qg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3z6HkG6OwxMVLUL/tKVfFsCqBYp+Gf5oDWHEJ/5xmwolREgh3
	GgCzeymSFyDhYItg8d6q0DsSljU+Kie3yqINRB9n9hpZjY71r8WtX8UjVCXjYV6yI+LlbB53OI1
	9ArqDi51tRIzToaxXef4CpXr/8Z1T1fSR4H7CRoBG8+sGNzm3IZBFHzN6rK5yyD49sg==
X-Gm-Gg: AeBDies9ZphjlOy0FeL/acfbKkg6ACyMB7UYO4WEbKl9LC3H4GXjWyc3qELu/8OFJKb
	LlEjQVmtYJt88Sd3ydFCa4MZWd5gxiZF5KU8DFkhjB9FfwkexyNKkvpfDUxDDHothBV3VnDLblV
	jOsk0/kO3XZnLfmV8FoMMBWwwcmkIRD/XfP/8Q3Fx8ZxAMK9z2oCrQ2u7n+Fcp0Qf6AoucvZGsU
	cAjixE7sBLFgUA3n9isG6ZryF6VMpdvSjot+08GZ4HagBER7r6KGvORlcZUuocj9esSI42yyKSM
	sRvaNgt7tWloN0gdWOLe3gCO93QpiykyE++37b5BkoCVMeiFHfui4y4nZqEc9VPD0r1Px94fz3m
	6ED5ym/3wmamost6hk5mWVfrzuic79eo7Ht4hbLxNIzJrq1vXRIdiqxayzVMH
X-Received: by 2002:a05:622a:5148:b0:50d:8bf2:45cd with SMTP id d75a77b69052e-50e36c124f4mr172055331cf.34.1776622952280;
        Sun, 19 Apr 2026 11:22:32 -0700 (PDT)
X-Received: by 2002:a05:622a:5148:b0:50d:8bf2:45cd with SMTP id d75a77b69052e-50e36c124f4mr172054861cf.34.1776622951738;
        Sun, 19 Apr 2026 11:22:31 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e59f97sm25723070f8f.37.2026.04.19.11.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 11:22:30 -0700 (PDT)
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
Subject: [PATCH v1 01/14] thermal/of: Move OF code where it belongs to
Date: Sun, 19 Apr 2026 20:21:45 +0200
Message-ID: <20260419182203.4083985-2-daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: qKEkYm6A0UHiRRQUbejUzfLbqY9RWl8V
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=69e51d68 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=9vQL-81oGOs3f0jwIh4A:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: qKEkYm6A0UHiRRQUbejUzfLbqY9RWl8V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE5MDE5NyBTYWx0ZWRfX4Hx0tH3uz6Cb
 V3q6NGy6ngoh/6ZRbrBwumqPWibEDWWeVX4mz9SJRccxyKQidCESVprlJCPfid9iIRkTkTMYIIr
 f53RpFnIHDWZMC6XDjeH3mns0DInYakcfXodBeMuVOxDneo+vaLDOcDufLk1X4pKxjNOQDovUxq
 07cg/7sfHVmSaSmILsNcu+mX3RhCOk0/YKpjjkEhaKxOyx3L+9bqF550QmMHowxqcJZfSlzTHsD
 wSwFeENEQah3laLE9cksj40ijmJG++q1Jnn5CJs12QaO7Mo8nsTz6/KDRglS7GevLTs1o5Bzkkl
 y5tq5EjOOthgaZuxufr0SkMcnK5/Eb+l/ZlnaHfIUYhwC8JtiHAe8OZfSnwMTExc/4F6hDGdWFM
 8N4kH0sxlizHmZLvTbOoaE92dSrQsdZfxWeBYn2Kgf0ZKhYnwXbU0HA6dh3QRYfLRTL3EnD8hr7
 AR4r0L/VrRxOCC2I/cQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_05,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604190197

The functions:
 - thermal_of_cooling_device_register()
 - devm_thermal_of_cooling_device_register()

 are related to thermal-of but they are implemented in
 thermal-core. Move these functions to the right file.

Pure move patch.

No functional change intended.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/thermal/thermal_core.c | 75 +---------------------------------
 drivers/thermal/thermal_core.h |  5 +++
 drivers/thermal/thermal_of.c   | 72 ++++++++++++++++++++++++++++++++
 3 files changed, 78 insertions(+), 74 deletions(-)

diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
index 2f4e2dc46b8f..8a70768b46dd 100644
--- a/drivers/thermal/thermal_core.c
+++ b/drivers/thermal/thermal_core.c
@@ -1056,7 +1056,7 @@ static void thermal_cooling_device_init_complete(struct thermal_cooling_device *
  * Return: a pointer to the created struct thermal_cooling_device or an
  * ERR_PTR. Caller must check return value with IS_ERR*() helpers.
  */
-static struct thermal_cooling_device *
+struct thermal_cooling_device *
 __thermal_cooling_device_register(struct device_node *np,
 				  const char *type, void *devdata,
 				  const struct thermal_cooling_device_ops *ops)
@@ -1163,79 +1163,6 @@ thermal_cooling_device_register(const char *type, void *devdata,
 }
 EXPORT_SYMBOL_GPL(thermal_cooling_device_register);
 
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
-	return __thermal_cooling_device_register(np, type, devdata, ops);
-}
-EXPORT_SYMBOL_GPL(thermal_of_cooling_device_register);
-
-static void thermal_cooling_device_release(struct device *dev, void *res)
-{
-	thermal_cooling_device_unregister(
-				*(struct thermal_cooling_device **)res);
-}
-
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
-	struct thermal_cooling_device **ptr, *tcd;
-
-	ptr = devres_alloc(thermal_cooling_device_release, sizeof(*ptr),
-			   GFP_KERNEL);
-	if (!ptr)
-		return ERR_PTR(-ENOMEM);
-
-	tcd = __thermal_cooling_device_register(np, type, devdata, ops);
-	if (IS_ERR(tcd)) {
-		devres_free(ptr);
-		return tcd;
-	}
-
-	*ptr = tcd;
-	devres_add(dev, ptr);
-
-	return tcd;
-}
-EXPORT_SYMBOL_GPL(devm_thermal_of_cooling_device_register);
-
 static bool thermal_cooling_device_present(struct thermal_cooling_device *cdev)
 {
 	struct thermal_cooling_device *pos = NULL;
diff --git a/drivers/thermal/thermal_core.h b/drivers/thermal/thermal_core.h
index d3acff602f9c..bdd59947b24f 100644
--- a/drivers/thermal/thermal_core.h
+++ b/drivers/thermal/thermal_core.h
@@ -269,6 +269,11 @@ void thermal_zone_device_critical_shutdown(struct thermal_zone_device *tz);
 void thermal_governor_update_tz(struct thermal_zone_device *tz,
 				enum thermal_notify_event reason);
 
+struct thermal_cooling_device *
+__thermal_cooling_device_register(struct device_node *np,
+				  const char *type, void *devdata,
+				  const struct thermal_cooling_device_ops *ops);
+
 /* Helpers */
 #define for_each_trip_desc(__tz, __td)	\
 	for (__td = __tz->trips; __td - __tz->trips < __tz->num_trips; __td++)
diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index 99085c806a1f..398157e740fc 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -510,3 +510,75 @@ void devm_thermal_of_zone_unregister(struct device *dev, struct thermal_zone_dev
 			       devm_thermal_of_zone_match, tz));
 }
 EXPORT_SYMBOL_GPL(devm_thermal_of_zone_unregister);
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
+	return __thermal_cooling_device_register(np, type, devdata, ops);
+}
+EXPORT_SYMBOL_GPL(thermal_of_cooling_device_register);
+
+static void thermal_cooling_device_release(struct device *dev, void *res)
+{
+	thermal_cooling_device_unregister(*(struct thermal_cooling_device **)res);
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
+	struct thermal_cooling_device **ptr, *tcd;
+
+	ptr = devres_alloc(thermal_cooling_device_release, sizeof(*ptr),
+			   GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	tcd = __thermal_cooling_device_register(np, type, devdata, ops);
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
+EXPORT_SYMBOL_GPL(devm_thermal_of_cooling_device_register);
-- 
2.43.0

