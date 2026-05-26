Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1180F3FE350
	for <linux-hwmon@vger.kernel.org>; Tue, 26 May 2026 14:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779804537; cv=none; b=DBdm3pX5SiFDJ3Iusc0owMmeK5YtlsUGivy2GGRF/8xm9rnafMBGs1gd6AzvFQL4yInILDrQfkEdmFe97xy9RJg+Fy+Or15OgsdDw8PkyBtCT7Rg+69s3CXqytOWw5ukVv6qKaE7oi6hdbDJnRyUmcB+/emPqXsH5TWiCSS2Lpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779804537; c=relaxed/simple;
	bh=xSp8RQ+cRp+iJjemcowCzM0VEBS3QUR7GBBaVegTYX8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QYmuU7SYkHW8TwiEvg09r4taWNqT0Ob0/dso6zMAIqI/HoaOjArr8yIMMSv5PanW21+DSjvCzn25dYeFibHuD0VZkr8vht2BKatuYkjvcWSxj/e5Mbfn+QuGu1kP/XKWX5u4yXwCTI1rqeprht8DuCrJvT/291q44Rz+UFayCug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lJj6yAaX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hDpfsWUw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lJj6yAaX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hDpfsWUw"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsNMP2705414
	for <linux-hwmon@vger.kernel.org>; Tue, 26 May 2026 14:08:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wfbf/NakLt+
	bgZ1wLWlsVbdVA1bK9sH95wexcnT+hv4=; b=lJj6yAaXk8t7LpUb3fMeYSVbLKU
	IAnMGD+FVVIhvTlsqWbz1tyHcy//bmELzuyszvaADBZ9rKwtBAuFH8njcQeedbq7
	4iTTX+/Tx1rG+6epAU2AkLNmtH6JuUyYClcXwiw7GOCCWtyCA9l4Jl3KX8wSnnvV
	n/sVMZptxKjB7DB1DKKesRTICenS8jXhcOhIkwquAKAfcaXnGAWBVXo3JeeHE6x7
	ApATa+OAGHzPn7VGeHoKjN/g7/EDm2C4tEhrodgCDlNR2kie3ON6zGjyiSdXWFKM
	1HFTKskbUsLIPZ4Llm9nL+uUuh4euIo/AggTi5sWXl5990Ap10xJ/Eyv5+g==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5vgj7x5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 26 May 2026 14:08:51 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-95d5e1bcb8eso5236339241.0
        for <linux-hwmon@vger.kernel.org>; Tue, 26 May 2026 07:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779804531; x=1780409331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wfbf/NakLt+bgZ1wLWlsVbdVA1bK9sH95wexcnT+hv4=;
        b=hDpfsWUwyzfDHiyAzSL5g9atdxn1bXrc22BGt3NQuz3Ku4Vr7cDJaZSMG6sy7LMprq
         K+tnec8tt3VY6S8ej7z63VNGOe62HgmMW610sGozgLihGcAimV8XlG6zBGelhHnBYKou
         A04304uTNJzH/BvdztQHFVsp/9DGPZGKO5O4mZOT7LKm7RPCeB4hQJisso8H4P7Om53n
         Dh9YCrZo1KDuuUszcQoTGR48sBLJUdsv6JGqws0+iBmfP2nlC+9WFmj5E2r1mMO5cSAB
         v+UTHYf5swDSIbe7cSP2ECKGGi23hpNS5G490VS2vJrUoVvMG0/QxfJ4iQfzXsw5rpz+
         cSBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779804531; x=1780409331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wfbf/NakLt+bgZ1wLWlsVbdVA1bK9sH95wexcnT+hv4=;
        b=FVNJg30PtPeDrQZAHfW9j5yYuvRnF4ZRNJ9C8NdtnI8CRWer/MW2cwS4yM9Fdw3TJD
         Fecj03X686GnF+UvtaNBaj2itHKS48QGO6QDd8ICPB2IqDrKqhqQRaAnWb9O6KFbY/f0
         yY8XE+06PSsbp83Rwf/Do/zPQNQeGDWGtTKXLq6pCsJYvOo1+X/1k5MeFXct92xPnnvS
         YfvAB39MhN6YomdGcGZxQqb6fckdUmgG42e4J+MB4gzXsnxqb2cEWD4HB3rTTq8MISkF
         rpWGPo4ZvxJVHk8HdSl8fug4tg0jClTCNBiVH+QndlUv657ToeFfjkAuYoMUDPfOghlz
         TsIg==
X-Forwarded-Encrypted: i=1; AFNElJ+eb5LgggPsWmW1QcQEWiyq/XGcB0ik23DoTtXdXmhyvJlrcOlfC0NhWFyz+L5ZgnFS/KSyHdqQJSJG3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyN1lnDABiUJq/1haI3C0UpZ53aRzYZkTUgQ0l/vyBmr1Waulvt
	E5Dx5iKunFiAy1PDEE0KvzA+U6WZQvU6zT/zGqYo0FhnQ2YXI6zg0x/DIa1IA6ULczPQhkx/at2
	tBP8aJV1c2xCJFvdfzyJ3ODNayXEdNOQoDM+aykrPtRKUpClG5hErX4IHmCyBAN9YGQ==
X-Gm-Gg: Acq92OHp52qXzal9zr4xjH8tfpbDMhsoL6XWwSiKHfE3IqcdHt3IxxJ3UqMQt642cWB
	tbDAP/IWCTtSC5k2Jk6OX++YwmYoVZdorLfrqNFBZt6PdeOf/sy+9KQAjvQDoarh45cXcmH3bX8
	aUFWoE0UR8yH09fy7kyxD4y6ZVf/rqkjcXbTV+VSK2FYwnicRZdepOAS+/u2I31NjvIuozUofKp
	pHouIaLvHfMieoisJG5qH8NPPGSu+W+8ZNxnQNysKLSt+ye05RISUCcCNKkjOZKlMd3FmuhLAse
	peJCkXzf91s8DRQrXzxJ1qAJmGHKWHJOiHaQHLJ9Og9Ac9Xn1UKSv3kQ+Ulxvur+m2015h457Dj
	3ScksUnBEbxjojUtKX31TKv5eAc7n/6UzRDfNp8Y2qwegbxSl
X-Received: by 2002:a05:6102:580d:b0:639:3b08:d64c with SMTP id ada2fe7eead31-67c79bd7cabmr9314454137.13.1779804530943;
        Tue, 26 May 2026 07:08:50 -0700 (PDT)
X-Received: by 2002:a05:6102:580d:b0:639:3b08:d64c with SMTP id ada2fe7eead31-67c79bd7cabmr9314345137.13.1779804530289;
        Tue, 26 May 2026 07:08:50 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:9e9:6f8d:9f1c:61e1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490424aa561sm156266605e9.5.2026.05.26.07.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:08:49 -0700 (PDT)
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
Subject: [PATCH v4 05/10] thermal/of: Move cooling device OF helpers out of thermal core
Date: Tue, 26 May 2026 16:08:06 +0200
Message-ID: <20260526140802.1059293-17-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526140802.1059293-12-daniel.lezcano@oss.qualcomm.com>
References: <20260526140802.1059293-12-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=12718; i=daniel.lezcano@oss.qualcomm.com; h=from:subject; bh=xSp8RQ+cRp+iJjemcowCzM0VEBS3QUR7GBBaVegTYX8=; b=owEBbQGS/pANAwAIAagyI4oqT+hPAcsmYgBqFalKucFmTsdrqsXbMLt6REZf5PinEK+Q1QPzc nEW2LqZfdiJATMEAAEIAB0WIQQafc3hhXPRY1XIeySoMiOKKk/oTwUCahWpSgAKCRCoMiOKKk/o T48KB/9HqxDIKZIrwEqzIY7zNJ4ZFWw4A+ifGkIflRahJIdTkDPA5m+T0u4IKVxLaEYBiAaZC2A Adrw8LE6240tVEkAviHleKKHvMC7CnpsTzLVm62pidyZ3HK5QUtYd867HtlDacbMnHew5A/HmNf 0HGSa30L/BLP7l43ievS951O3v5acOZXIiIAzN0BDTkxZ+ONG7hlYEQjthriPQTOJTFtpjA+tzq xv9nfd1uu/zi5QKtd6UlItYB75DzfdwS4aaJtpHMOUZjA8M/xJ7ZfuOvmz2yDdlY8nZBYX+Lh4E Fz/botPArGKIIuJzigjcD2uR6DM5ul4KFweh9G8nF8jziVPw
X-Developer-Key: i=daniel.lezcano@oss.qualcomm.com; a=openpgp; fpr=24D626F253BE9E87E6CE5BF48FF4B8D271675527
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IrYutr/g c=1 sm=1 tr=0 ts=6a15a973 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=TD8Nw1XDtrUtcxPOY9gA:9
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: vCjeQzT8GLyPylEyOBmMeBI3a5Ofyiqh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEyMSBTYWx0ZWRfXwm0hAqH6aV+q
 LtU/3k5uTisKz/FlON6/UzyNOyABHz2ESjwLEABmMl7qbigSsGGoP3CxJa5KWBm4VIO9ge8DxWo
 kceziUpZKw3WUUsC80nTpwJjJdbcoSCGIZhTkD4qhiG6ttk0BpoF5f0m0uWEtwKwlP6xawRpcZC
 YdZ7LvXZV/s2zF3EHZAzod69plOV0m9LtKq1GR36Exfduj3GyKyuuoLgp2i64REm1c13ienyB/G
 h2xfmRRJDzqnQ2m4MfNHgOOZ6xchk+8L9i6wtkh+vsX8Xnyqviam400vSRZhpzjHqTBW7KEuj4x
 iQihdV34nqTfX/Ly8/syPhl2N26MXeWcTV+5tfUJ8aybup18S03dEo/3CZmJ8QtKYDoUYR6140M
 jA7ir4LRapUykdb2r0x/PTqcUoldpa4cccaSzo15O/iHJxOlvJklUSmU5jcwYi8Q/T659uXzSLl
 3bfkHhacPj8yCc9pSbQ==
X-Proofpoint-GUID: vCjeQzT8GLyPylEyOBmMeBI3a5Ofyiqh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260121

The functions:
 - thermal_of_cooling_device_register()
 - devm_thermal_of_cooling_device_register()

are specific to device tree usage but are currently implemented in
thermal_core.c.

Move them to thermal_of.c to better reflect the separation between
generic thermal core code and OF-specific logic.

This change is enabled by the recent split of the cooling device
registration into allocation and addition phases, allowing OF-specific
handling (such as device node assignment) to be isolated from the core.

No functional change intended.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/thermal/thermal_core.c | 80 +-------------------------------
 drivers/thermal/thermal_core.h |  5 ++
 drivers/thermal/thermal_of.c   | 83 ++++++++++++++++++++++++++++++++++
 include/linux/thermal.h        | 49 ++++++++++++--------
 4 files changed, 119 insertions(+), 98 deletions(-)

diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
index bb4fc3ff2ad5..28a20d4b475c 100644
--- a/drivers/thermal/thermal_core.c
+++ b/drivers/thermal/thermal_core.c
@@ -963,7 +963,7 @@ static void thermal_cdev_release(struct device *dev)
 	kfree(cdev);
 }
 
-static struct thermal_cooling_device *
+struct thermal_cooling_device *
 thermal_cooling_device_alloc(const char *type, const struct thermal_cooling_device_ops *ops)
 {
 	struct thermal_cooling_device *cdev;
@@ -1002,7 +1002,7 @@ thermal_cooling_device_alloc(const char *type, const struct thermal_cooling_devi
 	return ERR_PTR(ret);
 }
 
-static int thermal_cooling_device_add(struct thermal_cooling_device *cdev, void *devdata)
+int thermal_cooling_device_add(struct thermal_cooling_device *cdev, void *devdata)
 {
 	unsigned long current_state;
 	int ret;
@@ -1090,44 +1090,6 @@ thermal_cooling_device_register(const char *type, void *devdata,
 }
 EXPORT_SYMBOL_GPL(thermal_cooling_device_register);
 
-/**
- * thermal_of_cooling_device_register() - register an OF thermal cooling device
- * @np:		a pointer to a device tree node.
- * @type:	the thermal cooling device type.
- * @devdata:	device private data.
- * @ops:	standard thermal cooling devices callbacks.
- *
- * This interface function adds a new thermal cooling device (fan/processor/...)
- * to /sys/class/thermal/ folder as cooling_device[0-*]. It tries to bind itself
- * to all the thermal zone devices registered at the same time.
- * It also gives the opportunity to link the cooling device to a device tree
- * node, so that it can be bound to a thermal zone created out of device tree.
- *
- * Return: a pointer to the created struct thermal_cooling_device or an
- * ERR_PTR. Caller must check return value with IS_ERR*() helpers.
- */
-struct thermal_cooling_device *
-thermal_of_cooling_device_register(struct device_node *np,
-				     const char *type, void *devdata,
-				     const struct thermal_cooling_device_ops *ops)
-{
-	struct thermal_cooling_device *cdev;
-	int ret;
-
-	cdev = thermal_cooling_device_alloc(type, ops);
-	if (IS_ERR(cdev))
-		return cdev;
-
-	cdev->np = np;
-
-	ret = thermal_cooling_device_add(cdev, devdata);
-	if (ret)
-		return ERR_PTR(ret);
-
-	return cdev;
-}
-EXPORT_SYMBOL_GPL(thermal_of_cooling_device_register);
-
 static void thermal_cooling_device_release(void *data)
 {
 	struct thermal_cooling_device *cdev = data;
@@ -1135,44 +1097,6 @@ static void thermal_cooling_device_release(void *data)
 	thermal_cooling_device_unregister(cdev);
 }
 
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
 /**
  * devm_thermal_cooling_device_register() - register a thermal cooling device
  *
diff --git a/drivers/thermal/thermal_core.h b/drivers/thermal/thermal_core.h
index 0acb7d9587ca..e98b0aa5aacc 100644
--- a/drivers/thermal/thermal_core.h
+++ b/drivers/thermal/thermal_core.h
@@ -267,6 +267,11 @@ void thermal_zone_device_critical_shutdown(struct thermal_zone_device *tz);
 void thermal_governor_update_tz(struct thermal_zone_device *tz,
 				enum thermal_notify_event reason);
 
+struct thermal_cooling_device *
+thermal_cooling_device_alloc(const char *type, const struct thermal_cooling_device_ops *ops);
+
+int thermal_cooling_device_add(struct thermal_cooling_device *cdev, void *devdata);
+
 /* Helpers */
 #define for_each_trip_desc(__tz, __td)	\
 	for (__td = __tz->trips; __td - __tz->trips < __tz->num_trips; __td++)
diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index 75fb7663c507..8c49d449d43f 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -510,3 +510,86 @@ void devm_thermal_of_zone_unregister(struct device *dev, struct thermal_zone_dev
 			       devm_thermal_of_zone_match, tz));
 }
 EXPORT_SYMBOL_GPL(devm_thermal_of_zone_unregister);
+
+/**
+ * thermal_of_cooling_device_register() - register an OF thermal cooling device
+ * @np:		a pointer to a device tree node.
+ * @type:	the thermal cooling device type.
+ * @devdata:	device private data.
+ * @ops:	standard thermal cooling devices callbacks.
+ *
+ * This interface function adds a new thermal cooling device (fan/processor/...)
+ * to /sys/class/thermal/ folder as cooling_device[0-*]. It tries to bind itself
+ * to all the thermal zone devices registered at the same time.
+ * It also gives the opportunity to link the cooling device to a device tree
+ * node, so that it can be bound to a thermal zone created out of device tree.
+ *
+ * Return: a pointer to the created struct thermal_cooling_device or an
+ * ERR_PTR. Caller must check return value with IS_ERR*() helpers.
+ */
+struct thermal_cooling_device *
+thermal_of_cooling_device_register(struct device_node *np,
+				     const char *type, void *devdata,
+				     const struct thermal_cooling_device_ops *ops)
+{
+	struct thermal_cooling_device *cdev;
+	int ret;
+
+	cdev = thermal_cooling_device_alloc(type, ops);
+	if (IS_ERR(cdev))
+		return cdev;
+
+	cdev->np = np;
+
+	ret = thermal_cooling_device_add(cdev, devdata);
+	if (ret)
+		return ERR_PTR(ret);
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
+ *                                             device
+ * @dev:        a valid struct device pointer of a sensor device.
+ * @np:         a pointer to a device tree node.
+ * @type:       the thermal cooling device type.
+ * @devdata:    device private data.
+ * @ops:        standard thermal cooling devices callbacks.
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
+                                struct device_node *np,
+                                const char *type, void *devdata,
+                                const struct thermal_cooling_device_ops *ops)
+{
+        struct thermal_cooling_device *cdev;
+        int ret;
+
+        cdev = thermal_of_cooling_device_register(np, type, devdata, ops);
+        if (IS_ERR(cdev))
+                return cdev;
+
+        ret = devm_add_action_or_reset(dev, thermal_of_cooling_device_release, cdev);
+        if (ret)
+                return ERR_PTR(ret);
+
+        return cdev;
+}
+EXPORT_SYMBOL_GPL(devm_thermal_of_cooling_device_register);
diff --git a/include/linux/thermal.h b/include/linux/thermal.h
index 60e596e7d7ae..6d1862ac187f 100644
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
@@ -254,17 +280,11 @@ void thermal_zone_device_update(struct thermal_zone_device *,
 
 struct thermal_cooling_device *thermal_cooling_device_register(const char *,
 		void *, const struct thermal_cooling_device_ops *);
+
 struct thermal_cooling_device *
 devm_thermal_cooling_device_register(struct device *dev, const char *type, void *devdata,
 				     const struct thermal_cooling_device_ops *ops);
-struct thermal_cooling_device *
-thermal_of_cooling_device_register(struct device_node *np, const char *type, void *devdata,
-				   const struct thermal_cooling_device_ops *ops);
-struct thermal_cooling_device *
-devm_thermal_of_cooling_device_register(struct device *dev,
-				struct device_node *np,
-				const char *type, void *devdata,
-				const struct thermal_cooling_device_ops *ops);
+
 void thermal_cooling_device_update(struct thermal_cooling_device *);
 void thermal_cooling_device_unregister(struct thermal_cooling_device *);
 struct thermal_zone_device *thermal_zone_get_zone_by_name(const char *name);
@@ -310,18 +330,7 @@ thermal_cooling_device_register(const char *type, void *devdata,
 	const struct thermal_cooling_device_ops *ops)
 { return ERR_PTR(-ENODEV); }
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

