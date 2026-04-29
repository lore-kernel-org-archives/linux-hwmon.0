Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99726347506
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 16:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777479289; cv=none; b=YoOguSYe71eRE+z0X4tkUYyE9ggmuoFcnmS6u1s5IqbRRkrdA61jtTN7LE4DO1kyBwwIzkUvp7E1pXagOdrgPHAuuGn3VGFXKzd80RHc+nMOzLz956f7IS44lpq5uhBKq11xyp5UFep885S9oXcYB6F6vzlx9Mc/I3oy70WIuKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777479289; c=relaxed/simple;
	bh=GMW15JQKvh68RISGmBmQhQtahGk5c0uHc5SrSpqibxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i1TOT+bKOmE1bQ++FOY9uZuz9JZk9+LFDdyGRx+IH4Nb8wn2kjaeUd6iaOUEMNs3O/6RgdGb0ipr7kLNJf3s2hD7CVPN+j+KqOee3yYA3pVOSexIUBDggHKlDE2WcBJu5s9ZFeX50QG1p1L59O/P7SpvKFXOT/1AJZUGhawajEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hu62zZRs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XhSfUpDT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hu62zZRs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XhSfUpDT"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TF5QTv1641530
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 16:14:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=knJvi0AtUY/
	Bcp4iZX+go0eWYlAuBgaLg+IAzj9hl5U=; b=Hu62zZRsSuI5mdtp2s46mby9gS2
	KSAkAKoaRT+bhvxTxekRT4klxPG4w4RTrvp78ZNOT2uir2IodOtTKpcZgK/zAtwJ
	+/IKmMvAnfrwBEu/GQKqVbA9zrz/iRvSjPGEB3dHGv7fr6dWMm/NG5E1uT1oOisc
	a3nQYQCoQBiRhvhkJk8b7zUi0/eVKw/LVmAWrZ6Yp2ln3RFtGmyFRh1OTLcjW6d6
	EsFlMSuwrC8XA2Q9MOAKR29nyw8LP7AOMOnVQ56ZiiSAzkRhm+NI8RRLqbyyPK2S
	qYXeFo/MkL5o4CswHlOZEmonv/x1nKIGIS3/zrwHV4B/wzs7xvdAyzj41NQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ducj82dcc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 16:14:43 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56eeff9a41bso23331725e0c.0
        for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 09:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777479283; x=1778084083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=knJvi0AtUY/Bcp4iZX+go0eWYlAuBgaLg+IAzj9hl5U=;
        b=XhSfUpDThCaO7LgdkyZ+juE15I+ZXKSmabJM9FUOw6ELfC+Zg9NeVZJjDPEOydeaxV
         x12H80crWANaD4bJgxSGnGbX6NfyZStzy9pfbysiOj71qaUvmIIo1IBl8s43s04JwTym
         phDZ9U41uSPxdYttxfrKR23NQ90Rtu/AFc+I11GeoiF8pAR0cimuB5GESGOVnn8w9dOr
         ZuGrqmHHiM3KrYCyB1ceBZkn0XjvpSsjoqMJ0rUUEipDFLinuIugCMGp7nYF3PmeqRbo
         IJxnuOKMZCvn1b0U+ze0LG+p3Dc0GeopKTBeKfxDI+1qTribe/x0ujx8mr8E7kGE9Xwi
         WZ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777479283; x=1778084083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=knJvi0AtUY/Bcp4iZX+go0eWYlAuBgaLg+IAzj9hl5U=;
        b=jFwJTeOde8zXccKRLC5dyMf7mlgo3pIYjz2szS+7UQDuAgpTlpZ9xxFQxZngUEAbbs
         mCcV5HnI4GZJXmZjJDqJgPahAB7FM/G5MIMgp1Qm3n9EAjWTIk1x9HJVZpG0kNk45DVg
         bZPEPgFRT55mr7ugVTNL+n6SftwXm8ePQNIlMqVKsr+s6wThn+biF9eMIFrfdAhkX82t
         /rqJrnVEktTF+5MvDRc4u2dPx20G5+DKddt05iQU3ZChPb5N0g+y8OxJrby4JXvTb4Kw
         C5yRHCVkhWXCRjAOVbe9d/3pXHW6SgsK6CSunG0esZu7IlNaPSVQrtmzT4Xq+P2RzEuR
         QQng==
X-Forwarded-Encrypted: i=1; AFNElJ/JC5F77WWq4KfgMIv0ZZLSuh/ZCWyTL/AAA2hk6upAHXjpGW1n8VdxU5aMJCdL3QL4HYNeH+kLoquNrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxOfuTe708S6nvSd+45HvBB+USzaz2eb9QVX6WPgQFbImuUw+4
	KuzYr3eRzzFvQBb99b1gW55XPS1rU83wbN/AQohTZ5spguszH8K5dTSM5d827MVF9M2wTQTraCw
	M51T0QT8/Df7gghUiv5rG2sOcRUfPBRifn93JwSXW9plFXfCpwShC38GuxBQNLVIhmQ==
X-Gm-Gg: AeBDiev3eBtPRJaEq+IrzMInXUTBg94oRnS15X+5dDwMtBHGB5KCqMukGhRng/lDMAL
	Hq4NhYKqWV4q5JJ9kmwsMBQtw5Z/vA3sB9KZwJMnLZNtbws+6jeRjxfBX0UhIyhuhJSSCbhOXZ2
	tZWzs00oDXSGWZR2dh59p0tB4Y/aDmM+5XnMbsd7Unl7FZK4MpFwax61UDmpveXAxIeiOEQyypk
	0z099Z3PO1TRAg5u2N/FSku/02RHkMXZR8Fw8j4++tO2Gvq1QIhWFyc+mq7f1gM3fPDHoa21jNu
	Sg0poGYzKo2zaUz8WcyLO+Ao+Mtn+7+YNBDhzCrFq314ZWWJylt9naoP3vcw76uZTjtlz0Awe1e
	BUZAR2t+YIBPD3hzma33K9MJikbds4wXhyVExtUEPKSLesJ/Y2BV9yzp4aZ4y
X-Received: by 2002:a05:6122:179b:b0:56a:ef51:4cae with SMTP id 71dfb90a1353d-573b348ac72mr2720504e0c.4.1777479282923;
        Wed, 29 Apr 2026 09:14:42 -0700 (PDT)
X-Received: by 2002:a05:6122:179b:b0:56a:ef51:4cae with SMTP id 71dfb90a1353d-573b348ac72mr2720438e0c.4.1777479282359;
        Wed, 29 Apr 2026 09:14:42 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed659dsm2438525e9.2.2026.04.29.09.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 09:14:41 -0700 (PDT)
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
Subject: [PATCH v3 02/11] thermal/core: Add a non-OF registering function
Date: Wed, 29 Apr 2026 18:14:15 +0200
Message-ID: <20260429161430.3802970-3-daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: hm0vy9_Hj2mKtzFIb-Ylgfq94jdMyZPQ
X-Authority-Analysis: v=2.4 cv=RI6D2Yi+ c=1 sm=1 tr=0 ts=69f22e73 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=AEQiIq00j7-0rvc0-mQA:9
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: hm0vy9_Hj2mKtzFIb-Ylgfq94jdMyZPQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE2MiBTYWx0ZWRfXxovGFWgDuamj
 8oH7edNjINfdfJqSBKw1GsbtOATIL90pOk+UrSjlNGz+RJBKWa4y/xzw7vAhjUBuiHX/VaPf2Hr
 qvCoiutEFpAPwxU9jU8jgdx3fOD4poEZ+4ssLIGRU9Oaw8FNebQTFJ/dqOzku670n+TDO6KSR79
 E2o6vowibrw4kFZj5esgFnfUs0GZG5mi5BW/Mpk43RMzXRBO4wfFu91YnwGxpHyZ3VPLuHOWipU
 Q7X+AaJiXjU/iKyOnFf3ZrWrlGQWnUHR8uXJzjx7YefxleJKDu0m+RsrNst6X9CdXn6ZaVX7a6N
 Mvmn5GsQZ+fRai2Ctvci8QeirFdBCemDbWxyNeoMZLSE3gC0jHbDze7EgkGogx2m82EZa69LQV9
 dcrmOHZI7NRq6pKVY+1ZLucbIIpuOuFqnUxxeT4ha0IduVgt7qw1DuEsJO9raPrTjbfVULWQmIJ
 V6sT6aVnig7/HETXh+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290162

In order to propose an alternative to non OF code registering a
cooling device, provide functions which are not for OF code. That sets
the scene for OF and non-OF code split.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/thermal/thermal_core.c | 35 ++++++++++++++++++++++++++++++++++
 include/linux/thermal.h        | 16 ++++++++++++++--
 2 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
index 664a4cc95199..5c954bcae4a4 100644
--- a/drivers/thermal/thermal_core.c
+++ b/drivers/thermal/thermal_core.c
@@ -1194,6 +1194,41 @@ static void thermal_cooling_device_release(void *data)
 	thermal_cooling_device_unregister(cdev);
 }
 
+/**
+ * devm_thermal_cooling_device_register() - register a thermal cooling device
+ * @dev:       a valid struct device pointer of a sensor device.
+ * @type:      the thermal cooling device type.
+ * @devdata:   device private data.
+ * @ops:       standard thermal cooling devices callbacks.
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
+devm_thermal_cooling_device_register(struct device *dev,
+				     const char *type, void *devdata,
+				     const struct thermal_cooling_device_ops *ops)
+{
+	struct thermal_cooling_device *cdev;
+	int ret;
+
+	cdev = __thermal_cooling_device_register(NULL, type, devdata, ops);
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
 /**
  * devm_thermal_of_cooling_device_register() - register an OF thermal cooling
  *					       device
diff --git a/include/linux/thermal.h b/include/linux/thermal.h
index 0ddc77aeeca2..50b43e328ab9 100644
--- a/include/linux/thermal.h
+++ b/include/linux/thermal.h
@@ -253,8 +253,12 @@ void thermal_zone_device_update(struct thermal_zone_device *,
 struct thermal_cooling_device *thermal_cooling_device_register(const char *,
 		void *, const struct thermal_cooling_device_ops *);
 struct thermal_cooling_device *
-thermal_of_cooling_device_register(struct device_node *np, const char *, void *,
-				   const struct thermal_cooling_device_ops *);
+devm_thermal_cooling_device_register(struct device *dev, const char *type,
+				     void *devdata, const struct thermal_cooling_device_ops *ops);
+
+struct thermal_cooling_device *
+thermal_of_cooling_device_register(struct device_node *np, const char *type,
+				   void *devdata, const struct thermal_cooling_device_ops *ops);
 struct thermal_cooling_device *
 devm_thermal_of_cooling_device_register(struct device *dev,
 				struct device_node *np,
@@ -304,6 +308,14 @@ static inline struct thermal_cooling_device *
 thermal_cooling_device_register(const char *type, void *devdata,
 	const struct thermal_cooling_device_ops *ops)
 { return ERR_PTR(-ENODEV); }
+
+static inline struct thermal_cooling_device *
+devm_thermal_cooling_device_register(struct device *dev, const char *type,
+				     void *devdata, const struct thermal_cooling_device_ops *ops)
+{
+	return ERR_PTR(-ENODEV);
+}
+
 static inline struct thermal_cooling_device *
 thermal_of_cooling_device_register(struct device_node *np,
 	const char *type, void *devdata,
-- 
2.43.0

