Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA9352BE32
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687463; cv=none; b=VULOY6db+0qxZNT3XOUpmSx9yf5+nGo3/fHMYeMgczyloszTEVUVFfw8gNBENO+qJfoSQG130iAJPzEz62sf1L9/8r1UvEdsLx/zTkGhXrCzz147Jh9mroze7wtI1R3ygaF9y4W7c/6b0FfbNoxhOxBnsbfrvF0UYoNe3VXC+D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687463; c=relaxed/simple;
	bh=9ojsiGAObDae06PZ+LjvSvhfUDVVA7+UNRsbvF34TR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h3g2+AtgCHStzbkM06DSsOxMSgj0A8gcGiCbFZXf9MsXz1Bm3pThPRDX/ihllGdp4iiqe4eTXay1rIk75QN13woy/HBVr39PnI1hbJKhUvJopxSlyg0AVJ4H2xfD/R2HrFqtHk8bj2mf76kL6Ag/RPP00Ti0sXWvo2fBJIF9cv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E6hPmdAZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d4uVXGAD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E6hPmdAZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d4uVXGAD"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCql0s205001
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x+2pykG5pP8hDB+fb+ZJcDiRziaoIX/tchorGsycP9I=; b=E6hPmdAZCN3EXaDH
	K3Qn7JF5m/G5mLsVOSSqbimYgm0SWeinMJPYG8unXlQqPY9XO5WszP+GnWjCNt//
	xqRYxBfjIe4FMGmQfzCSlm+OzPgi0B4QZAybLpir9DjIHNlkszbI4xVjvaXVResB
	UnzSlcQwgnZrnwE3arXMNfw4ul7hOQP+p0m0IJoXR0PRm3pRrLR/Egf3+ZSeWK2L
	XW6DgSQDJIgQ0JXgE8UBDv20oPQnok6Z1rj2GDAmIN8DWGRXVWvnHmu9GDyngeiG
	Q50hohQ9wGibmT+52qArm405Ghi7LFTUekdrAnyhgYRne7bcMS/EpFuNbV6og+aX
	Gd5AaA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0144u48a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:10:59 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8a9b387ed7fso49066897b3.0
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 06:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687459; x=1791292259; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x+2pykG5pP8hDB+fb+ZJcDiRziaoIX/tchorGsycP9I=;
        b=d4uVXGADl/wbMBPwOQh6CJHOFbwEMw/k+wjuccHh8roByDVGe6zBMZNEJyHUbSiEhT
         8Lqi8ycsAfx8ssjfp/i2dw+Scc4x+hi8U+1RhL3Vle5pkN/vY61RL5MknFDRoSSJzVoV
         m03HzyF+n1s8nKZu1zMK7kCak0i1G4fv6SpQZV8mEnYk2TbiQdHW2TrifFvFrbWkjoqA
         2LCoUOWuHv8Zn/cCM04P/tLHN+wrHM4MYQyaSg+QBGYPBvubtbBl+52gA44dnf48Wazs
         ti6hVNTrdi2HtH6+I1m8VOdU4bDIb+sj0e27k0W4iQ2EG1F23sGZBFHSwfh+EN6C3tuD
         IM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687459; x=1791292259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x+2pykG5pP8hDB+fb+ZJcDiRziaoIX/tchorGsycP9I=;
        b=Lm8ArdSmXaoT/qXm8JulFc4GnTaetYOHdvbKIqtY+MDEQGISS/KrM8aOoznso6qMWu
         bkj1FE9q+vGTYIJK7V71LnNabhR8PYSOWDoEd1RWwm+vrQKREMrpucDoEbFPlcMEQYrW
         LFbm6Bu9a05LkgrhNu7Eon9DYGWfnticuDCiMcULTpy7zJs1qbYpoWq7SAJRq/LAJxMF
         ZMj1VPdt0lpW0gHtIfygxPo84f+TQfdsay3BaLXAIjjng7uCxpdrZSfMbT96rLfr5Yu5
         S2TkQG50nQLkfMxM0eGtIpiVcpAX9XYfCcT/s7kBtzzP+Ouxdg5sEs4060AKt+AQUvVH
         68MQ==
X-Gm-Message-State: AFq9FYIJ92Ffuizek4uJgG54b63m6rmlzS5j5+wIwB3Ze/2ueUZfyihI
	qYvyeRl+YSDxHNFcVQ79naKxw32gLTtgT2CTzDLT4Taho5/3M+phKjLEyplJWBikhFIZUbdyVuV
	ZaJMUuCDOF2QFXHuzlxxFC3z6bulWvCKRbdjjWFVwQNubboUqoC4unqJhl2gqo7eDbg==
X-Gm-Gg: AYBFou2n/ebvDEtt6glFc6gVMCbsrwaENFL0JyLdDl184832LL1FK2162nWeTuVJS6k
	IuyoHPf5dtN/5ZdFxGD47xDNeLTJppOxcZEPed8lfa35xFHuiZkAW12e0F839QeXSiLiKrqfp4n
	AE6nG6SSHpRYW3+n0ve0FhMM3zkAVknC71zZsh93c0uEWUdWho9kzX2I8pb/Ho6PA3rkYoeRnAR
	0Y2SpZWCaoQB9HJobZGKo0R8iaA7ch0JTjyOMjzRtec1j3bBGJw3dTg+Ubw361c0y/WQcGSvuqQ
	vmze0IasP2VUI9GHzZ26iSui2ar3O49GZi59XI/oI23BypcXV/JpqdmF1DS1qJnKX9zQ+My/Yoq
	ZdgdwD802SX/m+1HTT0FeV1QsSHrs1m79QRI=
X-Received: by 2002:a05:690e:408d:b0:675:5d63:7b26 with SMTP id 956f58d0204a3-6755d637bcemr1907000d50.53.1790687459337;
        Tue, 29 Sep 2026 06:10:59 -0700 (PDT)
X-Received: by 2002:a05:690e:408d:b0:675:5d63:7b26 with SMTP id 956f58d0204a3-6755d637bcemr1906941d50.53.1790687458764;
        Tue, 29 Sep 2026 06:10:58 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d013e8bsm10225326d6.0.2026.09.29.06.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:10:58 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:39:42 +0530
Subject: [PATCH v3 10/12] arm64: dts: qcom: pmih0108-kaanapali: Enable BCL
 sensor node
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-qcom-bcl-hwmon-v3-10-f5ca00889cf7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790687377; l=1212;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=9ojsiGAObDae06PZ+LjvSvhfUDVVA7+UNRsbvF34TR0=;
 b=u4iXrFBZgUFB5iptFcMjRQeUVV5k2ovuNLVXsWXLgTQXraWQ453EYM541qN2VQ5O4pPZBXkcF
 CXW2USgM/CZBNn4CMkNlUCSw2g554xmq0KthIYZfSLLDDIkfPVcYHFp
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX3eW22rOM8PqU
 OMUSvIZzz+8AosNzoiRboFG6s7UwsibU6qoefUpY8ws68FRWzzhp6ZFJkbZLRMR6UcYxzOOaSOU
 d19f+PUWrDIyHFMTNBruR6vhXaSttnFvkgsXirHnY60yH66N+/EhmNH/5kG3phlgyJ0gr9VHdgb
 v1QFv890P3d8VfqFgyik5RWvWe9eHp8XtLFqCeCAfuOx3sbNqyqIYuHMa541+H/RgJoqZyLyXhi
 LPXdvcA/z4lKrRuImR3bpki9ffwbJglVXMs7FOmpYumwUbAaBRdtaD6lC1urtX8S+G/MJxjkizN
 XQPW/OuoXRwuEfEHppuKRFrEjdX98aLl7B8MchmdZIoxhx41K3ynJlZ4YvU05rAJWW/YoYnG4Oh
 cP6AiFnIRU7qnR35zVg1CiFh3/8qUGxTg+xU9hR/nMd/teov9ObVNvDfdZAhMlucQ2iXj5b8k0f
 nvDVKgngPohzpoZCefA==
X-Authority-Analysis: v=2.4 cv=FJSOVOos c=1 sm=1 tr=0 ts=6abbb8e3 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=09zRouN1k7u6xsjrD3kA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-ORIG-GUID: H6TIVwcnGIcmMQWd5pR6uzFcgmKrje9i
X-Proofpoint-GUID: H6TIVwcnGIcmMQWd5pR6uzFcgmKrje9i
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX1fa+7Qyw0oyM
 788Ls91WU5gl6CApiZy6lURSuPUkWTpGyXYa9x8E6mGLnzys5+l4QRZNXtZxXKk/YkSCE5YEIYZ
 toq+BafMJExD/0E2Y2PxCvngpZ6BndI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290052

Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi b/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
index b73b0e82c3d3..9f6bef6087cf 100644
--- a/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
@@ -49,6 +49,17 @@ pmih0108_e1_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pmih0108-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pmih0108_e1_gpios: gpio@8800 {
 			compatible = "qcom,pmih0108-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

