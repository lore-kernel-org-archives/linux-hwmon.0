Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D6D3FE651
	for <linux-hwmon@vger.kernel.org>; Tue, 26 May 2026 14:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779804545; cv=none; b=cAbbFTS/9v7CyinwSsXL1Af58+1SgB9qstqIsuxsQ3oqY0No3ZK8woHoCDQAjR5/SGZTJg8oZStqK/t/w5O1zsnVDkahHNe44BPc51RiYdhCG8JFKz1GhLMgpjb86xGHcfY51NyYkSWgYbaxkaJ8KBSUpV1tCP5cn382Teetgb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779804545; c=relaxed/simple;
	bh=Lm7Ldwf/nd8XlZJk6dU2XO047n9DUPbJMPLUwvjO530=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=giRLJHaibwD4ux5cGeec3DVGE2vI79XezxTJaZgmQ+vmr2WldezVxXMbfzhtpNHSBsdqUfC93qfjjvSO7QglbKfgmZ+Rlp8pab7MUsgasAYRJxJp1lT6WR2/6UOgkfzoeDJ3Mz0Ugkj3RYMnDnN5a9Vo63hYYxiIPkzzUgjH0ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VZaNSrmM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iHqSFUxm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VZaNSrmM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iHqSFUxm"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsX6L2496610
	for <linux-hwmon@vger.kernel.org>; Tue, 26 May 2026 14:09:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4MjVSksU8JG
	qo/H1NTajdTHFfOaQ/jhmT1nmEKa1hd8=; b=VZaNSrmMUNZKOSp7UY52TVYNlp9
	1TY7ZcTrCTKZtOxhc+EAWJ6TGNQ0mDDvuKHP/Aw8lxIGBePorDdeztng5Jn7Ni+U
	gqjXbYo8beT7M7YiNV7+TchZePII9MDr+ymNysINik6yZhSbOV7/blYTGSMARteq
	zbRUmF3x4Wq1x69x7FrLMhcZ3v7NHKLpX/LURUOCtiwEbCCNviImsU5ei8l1qYTt
	Dsno1zlvD0gLoRJbV0DXiTlZ1N8GTadpKpIFl2OiEe2Cff/h4R4jhQg9NmWCQcQT
	suPxuqK29pi/NTc9gc6jLktanpdAa8s2aOzCqhlnoUZObsCRaSszYZFW87w==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpyqmrv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 26 May 2026 14:09:03 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95d5e1bcb8eso5236696241.0
        for <linux-hwmon@vger.kernel.org>; Tue, 26 May 2026 07:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779804542; x=1780409342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4MjVSksU8JGqo/H1NTajdTHFfOaQ/jhmT1nmEKa1hd8=;
        b=iHqSFUxmTZHHygeZ1oSr+9N4Oar1INAiZRs5fk6d7W5mTla2ngj+nhOASVsf82gNd5
         Kxte6oU+c76HC8iqCAb+GyjKYudDQSEpS7q14L/zP0KLAGZwGQfLIZxgECPbKj1sU6Jz
         W3ESj4NpujIlRbzRsUXPqCS/gZMEN5ivfn/mZMypnWMxOE6NTpMpRJrJu6xD2JX7Apn9
         QGt6CER8JEemscepN+5/HbruX3nWLj1yasdiXN9E09KOODxV5+v5c4cP7FI0B8sm+Rwh
         K65v4XimcHMZ8VxBphFKEwH+jZzUNqrkfOc67vS1tPuGe34g726S4MRTCSfE65sYo1j0
         pVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779804542; x=1780409342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4MjVSksU8JGqo/H1NTajdTHFfOaQ/jhmT1nmEKa1hd8=;
        b=fv79joVNP3sKgmEbOoe9y36gfpGvT8smcDF+/6kvJr+uqOlHC1ncJiekIAjW2OH9LH
         31hlS66vrpxiuXgPYZ5hBvK1p7Gtz5ymAjvwPtR0tKFjbbs5Jk97zIRdvuyNnh1S1MCk
         WB43k6hm+mbKDiKXuKcSnYMnMLB796Gpm1mghoMjJsKuUBbIieJ0YglSzLY1CyF/WxLC
         tbPi/F8StgqjAzGk7eKaFBk9Pkk9p+DYuik7Woy/VDAaxXQgP4SUqL1eF88OqBRGlonm
         SOr/LEnZFxCTWjnPLlBnRZzkLID/YYxj20BossyBPQNNSDT16sRInr5oNSJvLp2GQ+EP
         jULg==
X-Forwarded-Encrypted: i=1; AFNElJ8Fo+XY/cmDtwJIpUcFsjZcmsdAaubrRnQ4V6Y6Dnd9TeukY9obKWzeLTLn1cshCVZFluF6lCpOayjpWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWh96jXPjjKbk3KYhPt+4eScMWI+h0gN9n8oRvOqmy7tZo2dwr
	ElEzN6LpwkiQLNIu4wsDXAwY3oXEh1KeKXAtB5GZm5U7mDtYqMul7FQ17KYTuz2y8ZfGaSTmwlJ
	yUY05hmUlZXh7+RdtZSj425NT/goH2DjgdkA569i+4uGastXyuVETkhxAy+oksSd6Ow==
X-Gm-Gg: Acq92OEoBCIw+34GNzx4WZlLGIx5nCoshMXNVq30OHF+2USVG7Elv5Dv5RNe3JIucGR
	akD2CBseg8kUijAz1Kn+FupTrT6MpeQ6rBudeYX7FvS6gP5WYcsHooJu2KQNwA3ZlabguKRNbCe
	rhqx67ln39trJQ0svXCz2/mATQECcdHebHRcrhWanZTpMIEevauJRfY7ju7A4JPxM5AK5ADQahu
	cuPYk44vkjsKpSJtLOXV1elhcdXMa0NeJ3VediIeJoG75nOhyr32itINqE98uzhLiTr4AhoSHNT
	wgfc1FUQj2OUD0h7tiWL4DLdWGJgkySFlYgtPs/hzIQ4lEMDk8O/PZan0UboY/AZQnEtQRLvued
	e291ogfYY7x9HvA84xXlrGNsqCMKBeXXzSocnTvSMRfzIYFZm
X-Received: by 2002:a05:6102:5114:b0:605:4ff8:fc21 with SMTP id ada2fe7eead31-67c76f882d4mr8306004137.8.1779804542282;
        Tue, 26 May 2026 07:09:02 -0700 (PDT)
X-Received: by 2002:a05:6102:5114:b0:605:4ff8:fc21 with SMTP id ada2fe7eead31-67c76f882d4mr8305928137.8.1779804541681;
        Tue, 26 May 2026 07:09:01 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:9e9:6f8d:9f1c:61e1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490424aa561sm156266605e9.5.2026.05.26.07.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:09:00 -0700 (PDT)
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
Subject: [PATCH v4 09/10] thermal/of: Support cooling device ID in cooling-spec
Date: Tue, 26 May 2026 16:08:10 +0200
Message-ID: <20260526140802.1059293-21-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526140802.1059293-12-daniel.lezcano@oss.qualcomm.com>
References: <20260526140802.1059293-12-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2370; i=daniel.lezcano@oss.qualcomm.com; h=from:subject; bh=Lm7Ldwf/nd8XlZJk6dU2XO047n9DUPbJMPLUwvjO530=; b=owEBbQGS/pANAwAIAagyI4oqT+hPAcsmYgBqFalSAy26ags4zeco9TS/S8+d7c7yS3AE8cy1w uT5a5iZ0+yJATMEAAEIAB0WIQQafc3hhXPRY1XIeySoMiOKKk/oTwUCahWpUgAKCRCoMiOKKk/o T9euB/9CrH+i79j/ckyjOltsSD1hwCzGBunUDyYta0BswdB+k31TFcee724V85VvSI72vdEFm8E JQTfpXTmZoH7euonXVWo26IvTZ0xZoHSVTFlg155xVVRXgdto6YQ7JbS4LfO5iKFcnC9VYzVxz7 QfbWLHro2RBj8wGRgRbFbD1be0QzlMwb2cwYTM9PpkaiMT7WKzZBrcXxUw5LeHY1SBMxjDolCsP b4Is/h7D28xamNMTQTpt6xRfhJv6fpltLJySwho7cc6q1aKr+G5wD0rInES7F/JlVf+UEYadLeP s7I+YNssC4LMkBrxlv7qedr+/zbRuVBG/0h3wp+ixVeVC19z
X-Developer-Key: i=daniel.lezcano@oss.qualcomm.com; a=openpgp; fpr=24D626F253BE9E87E6CE5BF48FF4B8D271675527
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dtfrzVg4 c=1 sm=1 tr=0 ts=6a15a97f cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=C9wMHiVflMXd_DM0zvkA:9
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: BDxzLYSUaJQ3QxbEbK_JOmQXSVvUPo_e
X-Proofpoint-ORIG-GUID: BDxzLYSUaJQ3QxbEbK_JOmQXSVvUPo_e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEyMSBTYWx0ZWRfXx3fBiQPAuxy2
 AjP9suTeYQASycm20zPfbcltXKxkQ2u2/i8Q+GIPEmdEuHhjxhVhWkHF1BNcFDC6K+dXBbj1jvo
 7/shO5hxN36IS3L5Wb+ov1dt/V/cBcAUnmvaLS+m7tVUtMLHHxHFKuEjYWXRyhUJ8V/wTOAwQsi
 8ppBofUh5QX8ugf6KC8I3fwuE/c3xpP2RRA3bCNtFVSg1MQYYWIsl/idgbb0rwqd5jgxLPHVMgt
 K+gnYhBB28NrRq2XL4ADxyfHABy2ev6yXnQxprJRdu4qh+x5oA989/WoLk4ncYAzCPt1m3VtAOY
 jttQJEM6gfbCVJc81IzuqllmGEzpCBufIxMezuADe1W00+FywzDY7kLP+Pmz8rDPN2yY93i+uWf
 9ASo3N3P0BRWft1TXaBgJZ5/ra75YaPnnqwtZizDHM928IJ4hBbvtmUUwgfar/tNX/xMr9mI2ot
 u+2oDetFkjl/FplzXMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260121

Extend the cooling device specifier parsing to support an optional
cooling device identifier (cdev_id).

Two formats are now supported:

  - Legacy format:
        <&cdev lower upper>

  - Indexed format:
        <&cdev cdev_id lower upper>

When the indexed format is used, both the device node and the
cdev_id must match in order to bind a cooling device to a thermal
zone. The legacy format continues to match on the device node only,
preserving backward compatibility.

Update the parsing logic accordingly to handle both formats and
extract the mitigation limits from the appropriate arguments.

This is a preparatory step for upcoming DT bindings describing
cooling devices using (device node, id) tuples instead of child
nodes.

No functional change for existing device trees.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/thermal/thermal_of.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index 3584024b76f5..100fd8a0c8ce 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -259,16 +259,34 @@ static bool thermal_of_get_cooling_spec(struct device_node *map_np, int index,
 
 	of_node_put(cooling_spec.np);
 
-	if (cooling_spec.args_count < 2) {
-		pr_err("wrong reference to cooling device, missing limits\n");
+	/*
+	 * There are two formats:
+	 * - Legacy format :	<&cdev lower upper>
+	 * - New format    :	<&cdev cdev_id lower upper>
+	 *
+	 * With the new format, along with the device node pointer,
+	 * the cdev_id must match with the cooling device cdev_id in
+	 * order to bind
+	 */
+	if (cooling_spec.args_count < 2 || cooling_spec.args_count > 3) {
+		pr_err("Invalid number of cooling device parameters\n");
 		return false;
 	}
 
 	if (cooling_spec.np != cdev->np)
 		return false;
 
-	c->lower = cooling_spec.args[0];
-	c->upper = cooling_spec.args[1];
+	if (cooling_spec.args_count == 3 &&
+	    cooling_spec.args[0] != cdev->cdev_id)
+		return false;
+
+	if (cooling_spec.args_count != 3) {
+		c->lower = cooling_spec.args[0];
+		c->upper = cooling_spec.args[1];
+	} else {
+		c->lower = cooling_spec.args[1];
+		c->upper = cooling_spec.args[2];
+	}
 	c->weight = weight;
 
 	return true;
-- 
2.43.0

