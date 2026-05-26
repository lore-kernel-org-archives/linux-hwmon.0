Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25163FE661
	for <linux-hwmon@vger.kernel.org>; Tue, 26 May 2026 14:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779804531; cv=none; b=RAwknitM2c99nwWjEc+r/iLujeu/Yc47su45VHHWzaH9U6lat8zaP/a0F4RTaHPjljCdIZYPpQVurHRkPZxmWpCv09gg9z4hbsZ2uykjPpVoh7FcDEsk+XfQX9bokhMHWb2uCGc6VrhXkI6cJ7pJ/Is/e2gs1EG2NuJUEGuQr30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779804531; c=relaxed/simple;
	bh=k8cNf6pQ9FgDrZOTphnMGI85hDwnR2f4A1GS/R7x154=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M5w89rddYLNdgWiwwx3RPKWuoFS2j0UyYeiEyUvkgu2PcC8k/xMuemzdxVYi6kdXeWRtIUa/z5PAamwAvcYbexWRD4jYvRZt7OSbeZSRM6lhG2W9VZcH4lQgBVyBz9pv4Z9VoBChtBhq7jZLNr0qUCA3+N408Xv72Wrw8kekB48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wn1vNEZE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ge0X9H6z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wn1vNEZE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ge0X9H6z"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsXW41430501
	for <linux-hwmon@vger.kernel.org>; Tue, 26 May 2026 14:08:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gNIUoFMWInZ
	GWGk42JVKNlbIGQZZPpc24UB5yZQypFY=; b=Wn1vNEZEsjdL+v5SX9/0N8w70QV
	3rBavCADHitOhm9o5L9FKHfsLkLQvR5E17kwgFHeEbUSYjVp4IYdYSsK1Ujhv39U
	vIa0hGw1628hHNr51guhV5hO/X2iCt9NP2i2MnuPztSZFp8qg/WvsaLAyVjx3llC
	oVkSZp/NuAhH1j+oOBJi4QeGnt6oi8tVf2N+DNqxwI57s6e09KAIzWjBUw/u2zKS
	rtAVwZbhKeI7PlZeU39hFIiqUikHHDilsIhLImrFzQN26LXA195ma55jrSNcUAVM
	IyfUuoc7582g8mYjFGZRys29hQv9nKjAq3yalzVIoveVuJPE0INWaejWTKg==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecmbv5dye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 26 May 2026 14:08:45 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-69d94704126so3642838eaf.0
        for <linux-hwmon@vger.kernel.org>; Tue, 26 May 2026 07:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779804524; x=1780409324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gNIUoFMWInZGWGk42JVKNlbIGQZZPpc24UB5yZQypFY=;
        b=ge0X9H6z/5B9I/Bv6r5zPfDHCYZXmYpTzd7Wo79N0YXD1qAdfDZQtN8MHDfdWxql8P
         9nA8fhCnmyJuZU1+D1olwG+6cAncbzp3YxFS0navb0u5+M41gOtsl36f22gOLCqaH9Qx
         HOyUSc2sl1l6f/C8J42EG3dCEgDGUaThvn/edAKUNOXDWZy0usRmw9e9YBuBAt9Vo9tG
         zAxf4njDv1If4pm1pqzFcburUbDx3sdhan5UPKsSJbERhrhoyvM+LD8fCelfLaWmIIwt
         iqMasWf2x69paEInZkzMg1TR7GWA8WmTVRoanXfcjRgfVa1BnCOIXJJezdZ33IrangEF
         Jq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779804524; x=1780409324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gNIUoFMWInZGWGk42JVKNlbIGQZZPpc24UB5yZQypFY=;
        b=DgZ/b7co2b01xisY9J4Eo+6gW99ovPOKm+UV1KqJEIR+Dd45nQtkhwz5bNCrO2xU53
         LY3jD+Je6JG9ZLK/wUnllgFMkhAKLC2r7nR910niD+N3YqfhEc1mGccSpswc/N7j0Awn
         MQcbrJJZptGNCJ0W+fS7U7fXBf47niOAygnT56STZy/lsdo7D+HJX9EZUGUSb/1AhCnn
         7ON6vuUXxlhqJfjgChQc1ISWmj8BwykMgkvDii/bGFZDn5Wcqa8s1ppaBqEpeI29PX2x
         LiKxO2n+PNFb5TcFcXcMgSHX8CqLFAkD8DGFZGIOLeJnaJ2oID3f8RTZPpcIuLyS+k0y
         bHCg==
X-Forwarded-Encrypted: i=1; AFNElJ/Ydph4xfXqJT01HiJqHSiPwvXYN7FS593RJmFgv+kZDgU+iYsy9LaNpaLKaeOZvf6roEIx4a1lfODnGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf9UARAP6ixknB1xJKtjexKC6T5eb+vJ+8ogCxW3uXOPXF72t4
	HB9OlI8hYWKwArVKMiPcCog/IwfnaPzNS4eaVs9LJ67nN5ZpL9DzXyYdJGondOZlxumEtuT1BaK
	latYzKeqUDd+wsWurlzwYEcrh9Fhm8ovz3TrXC39DaMjq3Br5VGoasdWh5WInsS/sdg==
X-Gm-Gg: Acq92OGdzbKkbtW2L5Y+HkLDQ9EbZzJQnGj/WH1m0uLOPcoUjXbCsxCNgu1uFZDoSgI
	a0owp+3SwBC4eVGMukou5r9XS0y9SbgQQEwZgIVgkZrbmzOaBhwL++eaOEbRUyUo3Uy1k4YnPEe
	OiTYqux19epHcJbbHGySvVYX01zgXH0DPadAs7NIZfL+bNEEeur69CwezDk1dKYjuM7+u8aw6JO
	mwNoEjQqgawDlQIcFB3HIcwSBC0y6LaUFS3I8O9Rq8UW0Rmq8ICPrdfzb+WrkWOEhtuKZWLDFPA
	6QqkBB2Wh4S8ujtI0VJvRSDQtkwUo8p+F5ivvRmwocMgK39vIOxVa5KvPg+7axfK86Xmsm5ZbEA
	jI3YIwx9WQ0p26EHEbQ1E9YuUwHGSdGCvtQIaOZ/mTwg89ODH
X-Received: by 2002:a05:6820:4dc4:b0:69d:d95e:773e with SMTP id 006d021491bc7-69dd95ee464mr765737eaf.8.1779804524108;
        Tue, 26 May 2026 07:08:44 -0700 (PDT)
X-Received: by 2002:a05:6820:4dc4:b0:69d:d95e:773e with SMTP id 006d021491bc7-69dd95ee464mr765671eaf.8.1779804523504;
        Tue, 26 May 2026 07:08:43 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:9e9:6f8d:9f1c:61e1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490424aa561sm156266605e9.5.2026.05.26.07.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:08:42 -0700 (PDT)
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
Subject: [PATCH v4 02/10] thermal/core: Add devm_thermal_cooling_device_register()
Date: Tue, 26 May 2026 16:08:03 +0200
Message-ID: <20260526140802.1059293-14-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526140802.1059293-12-daniel.lezcano@oss.qualcomm.com>
References: <20260526140802.1059293-12-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3551; i=daniel.lezcano@oss.qualcomm.com; h=from:subject; bh=k8cNf6pQ9FgDrZOTphnMGI85hDwnR2f4A1GS/R7x154=; b=owEBbQGS/pANAwAIAagyI4oqT+hPAcsmYgBqFalFjOu/Eupq0yeBqZgLiBN5RiMieKlkrkVaa mvJy6hAKNCJATMEAAEIAB0WIQQafc3hhXPRY1XIeySoMiOKKk/oTwUCahWpRQAKCRCoMiOKKk/o T2beB/0Skz8U9R4RpW/ZwuLg1Msk6E/CpxJVCNrxGtGCA1yAUTVsrxnGSwTJNdKTK9GQteR9xJn wfFhAJsjSemve5Zv2+JenlljY99q8+Lj6e5Z+pRg+lGAkKY4RXt8T+OLui3+L+moEU6nYqMpKFX 37XcK36B3TOST1QIPD+whdavFLB/obSCz+EcmjevyxXYy9D9Yvdyr6i9iKzvsSfyy2jxAPOFues k8geiSjPdDUA4Vj7o5nf51lgZ3Y/AqZpn2qD4JWU1JvUgu4dwVHY3e/OYoNAveqr4+y0c6ldSwZ 4n0l0fPWHGTVYZ/7yRgbNblviqnGVyRiBhB2Rauoifw7S1zV
X-Developer-Key: i=daniel.lezcano@oss.qualcomm.com; a=openpgp; fpr=24D626F253BE9E87E6CE5BF48FF4B8D271675527
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEyMSBTYWx0ZWRfX91kUJRt0ObMM
 2NF4AZXqnasQU0HR73ws4ouwp/wx3erUkYEiYQyky9pl5VNcxl9ixHjW0e8WWOFlejXNqYHyLMA
 Mso/QeZzuHx9EMzxkv/wBlAgB7o4sEvH+bKYKLrQOEFjhYVBXNVMeqHofsJ6UHUkfj45LlcKbnH
 RBTzmiUtuAlzGDLgAsMAas1wccKX4P8vf69ixNxSuFAu3DE/H+YDnr4ifUOuZ4Y6Uq7k7K/mosS
 TlA8ABxv0MPsl/vAhmbadV06eKQRh5eWNFcwgRJyczT7eQ76PCuXG+hsi3MTMiL+DuOqfIk+N5g
 q2j3HXhk1zYcvhi8Wa/YN0bDDUZdvlZ0B2jkwtXnO9Nkkj+//LTFfj2rtRDUw5SzYVz6nqaF/Wz
 dbmPS51KtuuaO+JaJJheDZ9/SyOH3aZ3dsEJen/kja8oyBNcx5p9JVSPPcCz+OCjCZMjGedQTbe
 R5kFpEb47U2MS1h/Jgw==
X-Proofpoint-GUID: Wmbr-CN78GeXIi9E3Gmh53tk8fCFhAjV
X-Proofpoint-ORIG-GUID: Wmbr-CN78GeXIi9E3Gmh53tk8fCFhAjV
X-Authority-Analysis: v=2.4 cv=XqTK/1F9 c=1 sm=1 tr=0 ts=6a15a96d cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=SnQRsxpfvtI8DkFpaL8A:9
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260121

Introduce a device-managed variant of the non-OF cooling device
registration API.

This complements devm_thermal_of_cooling_device_register() and allows
non-device-tree users to register cooling devices with automatic
cleanup tied to the device lifecycle.

The helper relies on devm_add_action_or_reset() to release the cooling
device via thermal_cooling_device_release() on driver detach or probe
failure.

This keeps the API consistent across OF and non-OF users and avoids
manual cleanup in error paths.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/thermal/thermal_core.c | 35 ++++++++++++++++++++++++++++++++++
 include/linux/thermal.h        |  7 +++++--
 2 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
index 0b3db889d60d..bb4fc3ff2ad5 100644
--- a/drivers/thermal/thermal_core.c
+++ b/drivers/thermal/thermal_core.c
@@ -1173,6 +1173,41 @@ devm_thermal_of_cooling_device_register(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_thermal_of_cooling_device_register);
 
+/**
+ * devm_thermal_cooling_device_register() - register a thermal cooling device
+ *
+ * @dev:	a valid struct device pointer of a sensor device.
+ * @type:	the thermal cooling device type.
+ * @devdata:	device private data.
+ * @ops:	standard thermal cooling devices callbacks.
+ *
+ * This function will register a cooling device. This interface
+ * function adds a new thermal cooling device (fan/processor/...)  to
+ * /sys/class/thermal/ folder as cooling_device[0-*]. It tries to bind
+ * itself to all the thermal zone devices registered at the same time.
+ *
+ * Return: a pointer to the created struct thermal_cooling_device or an
+ * ERR_PTR. Caller must check return value with IS_ERR*() helpers.
+ */
+struct thermal_cooling_device *
+devm_thermal_cooling_device_register(struct device *dev, const char *type, void *devdata,
+				     const struct thermal_cooling_device_ops *ops)
+{
+	struct thermal_cooling_device *cdev;
+	int ret;
+
+	cdev = thermal_cooling_device_register(type, devdata, ops);
+	if (IS_ERR(cdev))
+		return cdev;
+
+	ret = devm_add_action_or_reset(dev, thermal_cooling_device_release, cdev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return cdev;
+}
+EXPORT_SYMBOL_GPL(devm_thermal_cooling_device_register);
+
 static bool thermal_cooling_device_present(struct thermal_cooling_device *cdev)
 {
 	struct thermal_cooling_device *pos = NULL;
diff --git a/include/linux/thermal.h b/include/linux/thermal.h
index 0ddc77aeeca2..fc3f4a098370 100644
--- a/include/linux/thermal.h
+++ b/include/linux/thermal.h
@@ -253,8 +253,11 @@ void thermal_zone_device_update(struct thermal_zone_device *,
 struct thermal_cooling_device *thermal_cooling_device_register(const char *,
 		void *, const struct thermal_cooling_device_ops *);
 struct thermal_cooling_device *
-thermal_of_cooling_device_register(struct device_node *np, const char *, void *,
-				   const struct thermal_cooling_device_ops *);
+devm_thermal_cooling_device_register(struct device *dev, const char *type, void *devdata,
+				     const struct thermal_cooling_device_ops *ops);
+struct thermal_cooling_device *
+thermal_of_cooling_device_register(struct device_node *np, const char *type, void *devdata,
+				   const struct thermal_cooling_device_ops *ops);
 struct thermal_cooling_device *
 devm_thermal_of_cooling_device_register(struct device *dev,
 				struct device_node *np,
-- 
2.43.0

