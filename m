Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863DD3FE367
	for <linux-hwmon@vger.kernel.org>; Tue, 26 May 2026 14:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779804525; cv=none; b=PBKQGS2LAvrspDtWcbUamFYHtRBqzoyqytnGjmMfW3n1x3qzlum5EcTeQv4n4y9Ur+pTfUqv8K1oE07jV3hIl5dOgfj7mBoKCrBbB4+zw6m6YxoGYIxqXZJAxhcfEZ7UpwGjV8yGyHfGpBFn+feTFRHTs9OeL0ZYi/+IdJaFGI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779804525; c=relaxed/simple;
	bh=WYvFRB7RXFVY9X4Y/k/2HKf4+r9qL4yb6XFh6sGxhAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TteKYd4x1yjyaHmZXx9I7nq0rnP4fu++Tz81uFT2LZPBk0qxPOCERP4sL+JEW34id+OexOSuJWF+0zMIpT0hx45R39NzIIvFwt26sPofIe3kTZRGZL2y2HsC7wHKp6R8kwUAiemfUEJrdmzVi0szWYWbVCDLFTbFzb5vwSIajyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VMDdB/s0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zhk2HThS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VMDdB/s0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zhk2HThS"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsdf71163862
	for <linux-hwmon@vger.kernel.org>; Tue, 26 May 2026 14:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xkm83joPFky
	eHmA0brDErUIUKKatahqYZE1+KReC5Ps=; b=VMDdB/s05dkOsrb4P4P3bZ3Bt6z
	lf7oQkbdUkR/3lzzmapbQDX9Hfw/pKCTBhw0IAhRe70bi6uSXGdJ880u+292n+z1
	GHadZ574JkPg1X8jdDDzaWtdyd95cPUZRQb7X10jxfj/zKBTFvCkVH0c4CZEg+v3
	1tf3QLDvCo7ncA6V1TJBnP71/t2QKt4AqPOCL+KVx1jUFydJBShWf3Q7U3yIJ/UC
	y/jxaJ7LxOD2lNitps5rGCkH2NADZMrnZwhdhJ/aXpu5szA9MywcZ0WkCGGEKEMO
	mqEDoLFvJt+EK3QNYQSvTJVyUdEJ2EY2mo1R57I4u9kH+OLoTyPdLV044ew==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckyqneus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 26 May 2026 14:08:42 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-63136c0b6fbso15645312137.1
        for <linux-hwmon@vger.kernel.org>; Tue, 26 May 2026 07:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779804522; x=1780409322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xkm83joPFkyeHmA0brDErUIUKKatahqYZE1+KReC5Ps=;
        b=Zhk2HThSiwFPZVgBlKt4k24FewJk/MJ8P6y6lep/BMB9nXQxKnSZlrL6Hrcu8Kidw+
         i+3Icf1n63h7m8did7os9HlDHBJZZqYZVEMVpd3LbyMZvKnhDblsqKx4EGMoS0x7WBTo
         iPaXSjq5GKbV0UWmqPCiGOUSEVHFe8NoOzREMCcHXb7IQMoIwbZToRG4OiGq4mpQyRH5
         qCQ0cPILnSB58gIMx2LGBEr98iLWR/QiZagHIHyWVeXJ8Z9Bo2ZbfMFhYh1G1HrWyXR1
         YyNw/G+O5vtkRPlomxxWDMFMCam0A6TXEXQxJq/UG5tdzJ3QQP0W0saZTpXrWmosGlat
         J9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779804522; x=1780409322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xkm83joPFkyeHmA0brDErUIUKKatahqYZE1+KReC5Ps=;
        b=tW674HMUitZZ9xVGQhhxZz/+MPlgmN9STSUzXMgmVUC1MfQnDyIzxz4N4Yt4eNga23
         ORQuqzqCIc+7TU6gHLH5zN8Lr2+lETWoDTifqI9adca98C6YN3OVFct+CRF4n92wINVx
         6Vp6ncE5c8BdBgTcFhbgv80HJxBAOe2NaGfbelvwQjLF019M8fGlObxbHiHBWyomIxpD
         UxFwMLjXGhin49yVWAkdRQ7K5XvtMiu8MH0dPYe1JxkjNYcUOFboixTRm6RNmZEoBnca
         VsLHAlgYbdEnQLSowiNHpC6invnZfH1IF4SlFkQBxMndOXeR481J+Ypv7VXeS7Vbj5t/
         Hf6g==
X-Forwarded-Encrypted: i=1; AFNElJ/iylLTyq1RnjfpzNyXLCN2UKIFc0oYHQtct6pL5WZfviCOmRWHSucVQE5Lf9JRy1VeHq6EpBdaG+bLrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyP0bLibsu2/0w5et24G2ex8k7IdcVAhY6ZeGUX8lVOnudTekaC
	wIds/eVDzcJiVL1YY1OmhSXvVMY9GqtOzTMPm+P2VhrNSl8Hw/L+GlMgc7BJ9vT+lp1+HFC1zI/
	nOhqq8z+2Bh+QCAE2IQP8pSMZh2CFBYuOIeeDse8sUnblpFjj3ksfZ2Tz6a3gU4splQ==
X-Gm-Gg: Acq92OGsiji2NgpCmgxJZ4yUpNk2k1iBpA611Bt+qdsk3C1NI23x5QrUhGtUNF2kyw5
	ICexA9p3viGH/jUI2gWXXuwjbj4hVYHB5q5wM+fcySTaZYs8trrce8air62I3DcDMdN34HaYpsK
	hheFYt2WnkEA4DH+k2MJ9Lcvub2OhoAN+KxJcDsXz/sEIntYJtWQVD6XtFpP+vc0i6LQwKN1CA5
	HdlLt081YfnxqMkg1MHIgEym3Ex0fiGpNLbRBMfcaWBTGJDibpnf1HGhlLlBr/WHz2bgJNCnt5o
	S1BbFQFleqKfZa4Lh+wwSHHES8oMfUDJA5SbJqe4ab4JgRdwAXKuOwGwxfmx/I42rxc5DbNCjrL
	Depy0ylS7qb77lNwynVsNjUCt9NjuBKjwgYJqj7azQvWQf4pC
X-Received: by 2002:a05:6102:2583:10b0:631:a34d:b671 with SMTP id ada2fe7eead31-673bf885fcfmr6877758137.5.1779804521751;
        Tue, 26 May 2026 07:08:41 -0700 (PDT)
X-Received: by 2002:a05:6102:2583:10b0:631:a34d:b671 with SMTP id ada2fe7eead31-673bf885fcfmr6877708137.5.1779804521217;
        Tue, 26 May 2026 07:08:41 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:9e9:6f8d:9f1c:61e1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490424aa561sm156266605e9.5.2026.05.26.07.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:08:40 -0700 (PDT)
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
Subject: [PATCH v4 01/10] thermal/core: Introduce non-OF thermal_cooling_device_register()
Date: Tue, 26 May 2026 16:08:02 +0200
Message-ID: <20260526140802.1059293-13-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526140802.1059293-12-daniel.lezcano@oss.qualcomm.com>
References: <20260526140802.1059293-12-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5434; i=daniel.lezcano@oss.qualcomm.com; h=from:subject; bh=WYvFRB7RXFVY9X4Y/k/2HKf4+r9qL4yb6XFh6sGxhAk=; b=owEBbQGS/pANAwAIAagyI4oqT+hPAcsmYgBqFalEJBSFgdlgxlLAuN5pgLy6KhrIWR41/xFN4 x4LcB48NjmJATMEAAEIAB0WIQQafc3hhXPRY1XIeySoMiOKKk/oTwUCahWpRAAKCRCoMiOKKk/o Ty24B/4hAAAtK8qalgNIMK0i6+JDwBZttgTbe0bbLGfvEFj5wV0bfhkIpH/CkLY9ZB/saeZ6JOj 52J6SEdvIGa8YSrJiYsKf80fm0dwZIrldWd00IYoD49vdlih/VQ18cBO8b4C6J1VBoFRZw3Ghcb 4gdjxAt/Urq4pkPZMYlH5Q9F1Ad4DSHB2l+g2PqYzkpC+vtSEhmzxnZvPbiAFqmUpC7YctUyD+n 5hoObLtf9mp8ZDARSpw2MDAAdl6cQHMFLsegElCBMgxrBBUNkR6WXEtxNP+vnPNPdoPowmGpRZe xblAIsTtJrpQSCn6gzFP2s8C7r4H8nika5FnjuF//9P+886b
X-Developer-Key: i=daniel.lezcano@oss.qualcomm.com; a=openpgp; fpr=24D626F253BE9E87E6CE5BF48FF4B8D271675527
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RMyD2Yi+ c=1 sm=1 tr=0 ts=6a15a96a cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=rJ_lLo3QWLEEr4cb7_EA:9
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: ETYcxb4lWYFmHiOfdwpGaYrHMusddOZC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEyMSBTYWx0ZWRfX3uJzJsbmoAjl
 xuBc4leuhLlJW7wx/zDEBS7oT3DA34a2wjVFfATDB+c9CBYoYOgE3dGVSswDJ5LNiYvktfLLnuG
 4fIN4Y/4D5BjuC2Cvf9AP4wK/BJMLOF3BACLfYMfQKie8MRzygiuxtbn5fKJrY96fwB/YJazipN
 D5wZYyrEhw0Rf7T1PSyEImZp1NhmbDZxyno3/+kOw7nmCx69ymZbS8mK2CfyoeDFvfPlZcO4SJm
 Bl5LH9dFc91BfAVcCDP2WCQQZ4eJBWD6PzNAE735J+TCV97d3GeIQxEYFYVwjwaTI+lecDPMkuI
 B917LilCQBpkTBQbF34wK2iN2YxKezNp3+GMutSo0aK72Z1oZGK4cINeUbXShxy2R12uGYxbsKT
 /BhaXZ2Nr6lA8Qy32qDWzZrtOIjK0k4on05damzCijK5mfNDlwSBtotk3mR0u14HNk1q3jXpdRB
 ipvC+/0Utr0doo3aCoA==
X-Proofpoint-GUID: ETYcxb4lWYFmHiOfdwpGaYrHMusddOZC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260121

Split the cooling device registration API into OF and non-OF variants.

Introduce thermal_cooling_device_register() for non-device-tree users
and rework thermal_of_cooling_device_register() to use the new
alloc/add split.

This removes the need for the internal __thermal_cooling_device_register()
helper and makes the separation between OF and non-OF users explicit.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/thermal/thermal_core.c | 60 ++++++++++++++--------------------
 1 file changed, 24 insertions(+), 36 deletions(-)

diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
index db01361569d7..0b3db889d60d 100644
--- a/drivers/thermal/thermal_core.c
+++ b/drivers/thermal/thermal_core.c
@@ -1059,8 +1059,7 @@ static int thermal_cooling_device_add(struct thermal_cooling_device *cdev, void
 }
 
 /**
- * __thermal_cooling_device_register() - register a new thermal cooling device
- * @np:		a pointer to a device tree node.
+ * thermal_cooling_device_register() - register a new thermal cooling device
  * @type:	the thermal cooling device type.
  * @devdata:	device private data.
  * @ops:	standard thermal cooling devices callbacks.
@@ -1068,16 +1067,13 @@ static int thermal_cooling_device_add(struct thermal_cooling_device *cdev, void
  * This interface function adds a new thermal cooling device (fan/processor/...)
  * to /sys/class/thermal/ folder as cooling_device[0-*]. It tries to bind itself
  * to all the thermal zone devices registered at the same time.
- * It also gives the opportunity to link the cooling device to a device tree
- * node, so that it can be bound to a thermal zone created out of device tree.
  *
  * Return: a pointer to the created struct thermal_cooling_device or an
  * ERR_PTR. Caller must check return value with IS_ERR*() helpers.
  */
-static struct thermal_cooling_device *
-__thermal_cooling_device_register(struct device_node *np,
-				  const char *type, void *devdata,
-				  const struct thermal_cooling_device_ops *ops)
+struct thermal_cooling_device *
+thermal_cooling_device_register(const char *type, void *devdata,
+				const struct thermal_cooling_device_ops *ops)
 {
 	struct thermal_cooling_device *cdev;
 	int ret;
@@ -1086,34 +1082,12 @@ __thermal_cooling_device_register(struct device_node *np,
 	if (IS_ERR(cdev))
 		return cdev;
 
-	cdev->np = np;
-
 	ret = thermal_cooling_device_add(cdev, devdata);
 	if (ret)
 		return ERR_PTR(ret);
 
 	return cdev;
 }
-
-/**
- * thermal_cooling_device_register() - register a new thermal cooling device
- * @type:	the thermal cooling device type.
- * @devdata:	device private data.
- * @ops:		standard thermal cooling devices callbacks.
- *
- * This interface function adds a new thermal cooling device (fan/processor/...)
- * to /sys/class/thermal/ folder as cooling_device[0-*]. It tries to bind itself
- * to all the thermal zone devices registered at the same time.
- *
- * Return: a pointer to the created struct thermal_cooling_device or an
- * ERR_PTR. Caller must check return value with IS_ERR*() helpers.
- */
-struct thermal_cooling_device *
-thermal_cooling_device_register(const char *type, void *devdata,
-				const struct thermal_cooling_device_ops *ops)
-{
-	return __thermal_cooling_device_register(NULL, type, devdata, ops);
-}
 EXPORT_SYMBOL_GPL(thermal_cooling_device_register);
 
 /**
@@ -1121,22 +1095,36 @@ EXPORT_SYMBOL_GPL(thermal_cooling_device_register);
  * @np:		a pointer to a device tree node.
  * @type:	the thermal cooling device type.
  * @devdata:	device private data.
- * @ops:		standard thermal cooling devices callbacks.
+ * @ops:	standard thermal cooling devices callbacks.
  *
- * This function will register a cooling device with device tree node reference.
  * This interface function adds a new thermal cooling device (fan/processor/...)
  * to /sys/class/thermal/ folder as cooling_device[0-*]. It tries to bind itself
  * to all the thermal zone devices registered at the same time.
+ * It also gives the opportunity to link the cooling device to a device tree
+ * node, so that it can be bound to a thermal zone created out of device tree.
  *
  * Return: a pointer to the created struct thermal_cooling_device or an
  * ERR_PTR. Caller must check return value with IS_ERR*() helpers.
  */
 struct thermal_cooling_device *
 thermal_of_cooling_device_register(struct device_node *np,
-				   const char *type, void *devdata,
-				   const struct thermal_cooling_device_ops *ops)
+				     const char *type, void *devdata,
+				     const struct thermal_cooling_device_ops *ops)
 {
-	return __thermal_cooling_device_register(np, type, devdata, ops);
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
 }
 EXPORT_SYMBOL_GPL(thermal_of_cooling_device_register);
 
@@ -1173,7 +1161,7 @@ devm_thermal_of_cooling_device_register(struct device *dev,
 	struct thermal_cooling_device *cdev;
 	int ret;
 
-	cdev = __thermal_cooling_device_register(np, type, devdata, ops);
+	cdev = thermal_of_cooling_device_register(np, type, devdata, ops);
 	if (IS_ERR(cdev))
 		return cdev;
 
-- 
2.43.0

