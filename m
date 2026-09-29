Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FCB526AA0
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687415; cv=none; b=BXCmO3KWaSU2q5ULuHa5wWnRm8CXVH0un4rvBSW9aJWdlz1Ihr96eaZtO2xgkwYOVYDjbmvaUqgW8wfFsGxOdBLH6bZf8Giy4uX1g0phRNf0DQf2DrnuKMZ1ikoGJnjdly+GreKYVVBvpJ0OOnn2FqJCI+5u4ddBg8pkrDgfUZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687415; c=relaxed/simple;
	bh=HUjdAdMyX4HianRlVJjD9t9AGOnfEbovarS2zVv7VO8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DOBNqkCimguReJDDkg3wt1ILoat15gonL3KDziNcKS1JAP9d68LSzmuZyV8KHUJDpsfPsORgHbxa2KTBO6CIkwtMbpsl9MU4b5zV8Pc2+jAOiubgLo0e2kss488J96VECQz8VpW2xnjr/JBSgEwqEcFbPQHZyk29pxrPFKKt4q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A0EUNj1c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iHKDVKev; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A0EUNj1c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iHKDVKev"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqrjI612070
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:10:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fZ+609EzwT7gePHndxnlvqJGJ7nUcvojVdbl7Yru7DU=; b=A0EUNj1cJzFa+RDo
	IpRdKRRR8Oxs6cLZRyaFeMAOtHA00I35yPF+e0zQN0qIGhRtFYpRtklfS9Tp7sY0
	mJ1WxpZW/IrKlhyPFL55PT7nP4+OgQIk+fIiVWOn1IZDSr9Xl3J/knMY7LhILNyN
	nXwMOFbcI3HdWy86jE2v9jyKgB9bIcNRhazZeXRMkNidOnB3js8UhhDsf5URsM60
	dKIWbChW9XSBQntw0H4Ayt7x3ZXJC1Xn6tXWgYHjzvMAtP0ydQx6JEPX44AydqDY
	Q6EC6Mt0ebg817qmunLakhvsRVnomrYP1XuzVK07gF8Mujf55ID4a2MVim2jOqkH
	BmRtdg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4u6p5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:10:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53323d5b9ffso56526501cf.2
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 06:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687412; x=1791292212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fZ+609EzwT7gePHndxnlvqJGJ7nUcvojVdbl7Yru7DU=;
        b=iHKDVKevomDHkeLOpilXJzmm4lGL2hl3KWrmdhLq7FcHzwtrkxvaOrsbiMTx/FU6xJ
         B07wBEwz9mRbOplmk2lseTbdshFWAVZGM8Ph63CTDWMN5/oZ+0BixklUA/D0UIGUkCNS
         V8ZjZktItEMh3CDJ4JBGDZ9hc3I2FD0AuTvyXFZA5CVxh+9nURenr1d8iJtBr9ayhdwN
         m+SNO1gObYqDVKXVZXINBhS3fWER1n1rrR5VJ8Zd5a4TCWSus+Dt1ox0vbh4xbqjovww
         /DbCZBLojMmg7uGdMUPeazJMZdx1utNndQMR9f/OdN9UbR/044diQXtWq8wh0ifLwB1Q
         7sEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687412; x=1791292212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fZ+609EzwT7gePHndxnlvqJGJ7nUcvojVdbl7Yru7DU=;
        b=128Yr7KwruXKMegNBPkFkqHE35x6UVrzqHaaeAN02Dc2ekyEq8PV9QTQkhcjBrSv/t
         KZfH8U8zUw1+1kFMnVrT7qPzdUqgy9hXdLSPpvsbbZeMVIVmqpemp+4GplN2nVq0jLuM
         fPD8RW+2e8N+Rat85/xK4TmuxeSaHZax6G+NlZyyG0IivFeyAsODbqvj6oGrD0mbM8Qj
         /a+hKtpamNrttd7+9h9ddP7dhjjhyYp46afKtbNy1JNRdLLqzCS9Pc/X6TOMThMm6QDm
         CDg3r0HdnC75NHegbb6aZPOLDSarILhPtvnBRyi3ECs3kTARQcQIRSUU1JL/UKfbwRVH
         7mtg==
X-Gm-Message-State: AFuF++n/i553KzhDf5zUqMK6MnfSE7p+mdEBfKiaaE4I1ijZCqgTqvaW
	OkgBLWma9/16CX9cOLE3uyjVZ65rg+BdUk6g2uKqjjOkIk6kqS9JDwkSu+ZRO8w0DsYfXFxj8JV
	IubIxJhKP9fQ9wOcI8V2b1hMRi6NVfjDTbq7cVHNiUUopmXhNiL7LpAYInEGgLOXqFA==
X-Gm-Gg: AYBFou0EJW/5XHLzNs99isGyEhGZ8MiRgnxcjNzTCrrlyGoPYki+lUjQDS/q7drKS/5
	ZPAizunJEXPwUoIBoOkb24LMRDHfXa2PleBC8GzhU5i8bZVaCXK+BIolgv0VPS2zFC38t3cQzay
	2hyKha4+yev9g6A/xrEB+isfkNOk1tqCPNDZS53+I8iaR3VE02K+FFzd9B//wO2BWjgPZYzwGda
	TG3WZcgpVGG6+FvFAElm7cgV1+g4OJGLkV5yw8dDHQmR6csJdQ4Tu89ebMbcg2NTeE5fQh6UcQB
	AVWuCUN2aJMTh6nN2SG+KqQ/Mnb/ELl0tWVscKmR8EmVv7tire6uesDXBHHxx2x6AndkEe+vgXK
	LoE7nBwks7GD2iWMlS+QM9BBW/R3jrTyDAus=
X-Received: by 2002:a05:622a:e444:20b0:533:240e:4e0 with SMTP id d75a77b69052e-533240e06c7mr147826851cf.55.1790687412098;
        Tue, 29 Sep 2026 06:10:12 -0700 (PDT)
X-Received: by 2002:a05:622a:e444:20b0:533:240e:4e0 with SMTP id d75a77b69052e-533240e06c7mr147826071cf.55.1790687411438;
        Tue, 29 Sep 2026 06:10:11 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d013e8bsm10225326d6.0.2026.09.29.06.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:10:11 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:39:36 +0530
Subject: [PATCH v3 04/12] arm64: dts: qcom: pm7250b: Enable BCL sensor node
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-qcom-bcl-hwmon-v3-4-f5ca00889cf7@oss.qualcomm.com>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790687377; l=1143;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=HUjdAdMyX4HianRlVJjD9t9AGOnfEbovarS2zVv7VO8=;
 b=QlLfdI7YXA1+K4D2l6LRWs5qFqG4cOCEg/DSNuV42QJEPHppAncaje0H9D2uQje3ob1+q0FUv
 EaBYCO0bhHHBNQk5IXUHjpdz5sTFR0fxjvdK4Neg90kMKthi4vY353F
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX/c37rtjWxJaj
 NGGVUIoc1MFav8kHNAIrUPV6B5AUOL6KkYEQHzlhvTmeAJn8X5BJof7fHb4Cq+A1zIIQzSb0Xmy
 fODLSVixIGYJk5zjsS6gSg9jAZ5OJ9s=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abbb8b5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=8YuGtcdev8JQwI9EQfsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX9K8YYoAvq6/I
 TQ+8p1HYYRcOfGL3G4ZkXTsQ8ssXDjrH2fEhdmin89N0elYtk7wPxXfTrY10F41ySPrf4qyw13x
 CoVaBbWAz3Y/7ea8TYgDKaGy623p859JTSgjDiGd7YdlKeHJQUQyHRXqn/j9xvAmEa0LGJu9m6c
 PHwax6XF1X/WttO/x0+9mkIWMVr7SbA/bE8d2oK8Nu/OvktRsfEVuDO9Egm+k24cB43KO9oAXym
 r5uwO6/AWG6ScefjKzSCaI1zS+cHTk2dxbm79PmVLZHCT+JDGeI0TYgqxXlmWpJJscg/os8MxAj
 Fnuvr1l/Itv7cxeV4nERSXq1BDbK5woaaJHdCZgIO8IQyootaWdIC0qc6bAQ35xxtynFjQyi48Z
 /MamtW8jWVNQw/tUbzCK2edK0/m4EcCwMSNTOV+HmgM3P+r3deM4uqHLmrmVAJQjWTWNcqAUDVr
 clQF5/tjI5eQ9+duORQ==
X-Proofpoint-GUID: vBsrNosEtE7zNI-eOWgnjf4JIyrP-fMG
X-Proofpoint-ORIG-GUID: vBsrNosEtE7zNI-eOWgnjf4JIyrP-fMG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290052

Add Battery Current Limiting (BCL) hardware monitor node for pm7250b
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm7250b.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
index 43cab07126c5..76d0481914e4 100644
--- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
@@ -89,6 +89,17 @@ pm7250b_typec: typec@1500 {
 			status = "disabled";
 		};
 
+		sensor@1d00 {
+			compatible = "qcom,pm7250b-bcl";
+			reg = <0x1d00>;
+			interrupts = <PM7250B_SID 0x1d 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x1d 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x1d 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm7250b_temp: temp-alarm@2400 {
 			compatible = "qcom,spmi-temp-alarm";
 			reg = <0x2400>;

-- 
2.43.0

