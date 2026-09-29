Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6742A51DE02
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687470; cv=none; b=YASEod7zXVxZS0NdMZyDej2PI07LLcIVcZMxNsFSRbk/QI9bl8BkCkEiAdOaJDyQbEUlz5umfsCmTCoZSCWd543OXZ4z4QzBcj6wv1huAXgndnMOmFXHru3cNS+dMBPxDi5Ya7UW811lfF2Mbo8uFyquLARa0RXhGQB4wvzqYuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687470; c=relaxed/simple;
	bh=J4s4pOTQjWXUwVz43SBEvG4NYaHslCDIsjRbJbh+Ee4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VrJBU4z62latxdDT1CWYg9fd2b2Iz0+MdHd2Soyu0iaNgFwjvixcFZMVd9CF/R1FgfVFD7NsHsdMuyvbdIJW1wHLa8g+3a6t8xdIdr1d3fI2VHcXBAydd5CxfWHMOIV8Bm2yx15Jt+nVh6yrPkeB8+NTFcDIyXj/+EP7AJyS4WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UhjpGHvH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aWVEfbBF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UhjpGHvH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aWVEfbBF"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqqhb350695
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EmygDUXPSGIpxFLAEuYPtaVT/4A31FpzDpTcdw0ekrs=; b=UhjpGHvHufpMHFq5
	ftjDy/iEPRKD/LqaDlqNggm807xKA0JKnSyGMg8OiXCxMCapx8qxxTBs2lLA2bfT
	/tijdpjzABLT//fcENZQ5/l5u80uqM9SFkFS+jSN9dnc5f8GoO7shVNGKqUJolb5
	IjoGWDjBU22Q0/Y6Uxp0XSHqYnQyf0O8jzUI7YFAe0qmkI4boaXTHLLGFe/TDifi
	/g3L6jRfOjrfvzh1x3UI5INltYbFUYuoBgHr3C5wrvX6xUD/Y1Gyp/W7N24zBaWH
	ev5UUwzV7R0e5MF1O+rO7ued+W8f2Gxu13NWfOcMWJRDqQdiTSzUITWi0+rGWwcD
	1AXH9Q==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h01vkjxtt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:11:07 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8ab4b1c09e3so4252277b3.3
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 06:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687467; x=1791292267; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EmygDUXPSGIpxFLAEuYPtaVT/4A31FpzDpTcdw0ekrs=;
        b=aWVEfbBFccwocTMNNOfDIeXTBBeRQbK4Gb3A84dIzuXZ5WPIIJvUbAnf/22ITF75xQ
         ouLXCmlD6Ge6YRDwe42nyY4girVh7BsIyS4qeQF9XJvmVQicADrKUrAZN6gLf4cuGLeW
         bfOBecMjVcb0S3o/UlqZdmUurYHpsgqNnP6OgQvrlDjavh8GdaHfUW7HjcnbmwtF6wPC
         GUL3o//i0NLNeNaJoZiNQUW995+7l5h9aTl/6oLUUlFuh0mkedJBfb5VsknJYmE4ESoZ
         9PJDio9r1SvDwHG/BpE34WY4D1guAALLXAMeLvPi+QBf+xEbb90giWKSlKO04LSsJwvK
         S/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687467; x=1791292267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EmygDUXPSGIpxFLAEuYPtaVT/4A31FpzDpTcdw0ekrs=;
        b=MA5sNb0LpHbofB749PnbgsiskGGqW3gBd1RhKCuhalb7fQnIvK6C8bVRQLwyOhlY96
         oi0BDz81heRxKEQaM686sOZeRlLyUtfz94ZB4LMZof1R4wlYfQ6HHmdhbV/KCJmSbiDg
         6LF9gx7huLmRF0nTysoU8UxhtLxd9OM9jZfezepEJqRd7MsG2e9x28nXXbYRlUi4uZSU
         eiCHCzDHzN127HJlXZx6QMCiSu4fMOfy0kAamX70uLDNCp0D8NMMeyXSVEk+esyixVzS
         OexC03EeVsGP8slvO0ajWpf9c6t0TSamqENitFbq0SRjL/ombmwy7tYvP/4N3kBqALqi
         vw2g==
X-Gm-Message-State: AFq9FYLJk50T+XOnc1cvXP3YY++QXfDI7KQhkP5dqvFCTlmhWcXILPrV
	wRlNDx/W0EGitYtuFTWkGWpnoiSoToAYDjIP6SPrpaQ/xmQEz3LulxA9g5U8f3SHbhfzuRqGUuQ
	1g1Fdvuu1sKhMtRSBZcgNHhu/O3dNIQtz0XXotn3RFieW7CdDkgyPcEk1p3C/12umxQ==
X-Gm-Gg: AYBFou36A2BiG24GAvHDO+RVDfDKLjfIl1imv6LVx04xOzZyVjI+FR2Oi3adiyUsdxZ
	3IFdHWP7/Svsz2lN/lM2qK5m8nr3a5owockku7M1cJP7a8bjAVA4SR/6gmcpz/w2WfPP5yEoDtK
	9f2vK42YBxvGifHR+eS1kS7QJfbOZvyp7wJm4GCiLGzSSpekYTOajHfKwRVvQYSvdHyxoZjymNX
	WKmPg8YrMh9WPk9rQDm9DmkpATnAx+7zlCDH2qAhSkUq2b2jgZIPrMiwFzVgchDsbtNM4+IHV5e
	gt1nZ3EAHYma3aU9bKzHLYrpRoC5NYNaNZ/DGTZ+qWvBUFh/iGjn79F8iaOnAVW5dTwYCUwFo6N
	/38r8fcT/3+J9eX6uiJtpcib5gD7xqAOW/C4=
X-Received: by 2002:a05:690c:6e83:b0:8ab:447c:b143 with SMTP id 00721157ae682-8ab447cd6a0mr4905037b3.3.1790687466477;
        Tue, 29 Sep 2026 06:11:06 -0700 (PDT)
X-Received: by 2002:a05:690c:6e83:b0:8ab:447c:b143 with SMTP id 00721157ae682-8ab447cd6a0mr4904807b3.3.1790687465845;
        Tue, 29 Sep 2026 06:11:05 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d013e8bsm10225326d6.0.2026.09.29.06.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:11:05 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:39:43 +0530
Subject: [PATCH v3 11/12] arm64: dts: qcom: pmih0108: Enable BCL sensor
 node
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-qcom-bcl-hwmon-v3-11-f5ca00889cf7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790687377; l=1156;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=J4s4pOTQjWXUwVz43SBEvG4NYaHslCDIsjRbJbh+Ee4=;
 b=N9asyPEV5SAQjN6BZDkKDJAlJsk1cdLTDMCRKqhxEfOX3INA/f2qijBseQsvyuNTsHUs2s82X
 pzlf5i+gxKLBbLsyH5g4Fo+v6SkPB2N6y2MQgFj59r9k/9z0iOwJheh
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfXyBts18bplVbo
 2iaWb5KH1+XWHYdBL943qD9L3651MVohLwSR3ZMGoud7nmhhB+foRPys8NTKS12WIWQphfNFlWj
 5PzrDeG06AV8tl15wEbRfd6y6IBD7wlX0BwKNU2CXnJiuPLEydHPx3WK2TwgNDdDCqOsp8IoJg0
 1gVz5x2QmCgHR054CIMpuJuGZO2fdnqKpv94ZxGT9xmtCxkVkQI8mvNSbiyopINPik7H5gXRf/i
 V9p1ufp6TlQs96rmnoDh+52jJRA87OXPpM5kDzme5YE3r4qaFNpYnj5ErtO31xXNiMf9dtLhm13
 quNG0g4ie0FWfJn6ZRsYs5EYmTDzUH+VNz78/+KKPZrKuBbEVWR504dTOEaWZ9ThvDttNVbjBmK
 4+0xR+ThiAWGgGC1rUODgyvqO9FDpxroov7Zp0ZYP4ZooVRd7W/Cgki8XoT4cJxSfofrxBhIlq8
 mfONBCeXjj+O0Hisesg==
X-Proofpoint-GUID: tS07WFHdGLniedX3U3cUt4pozmoRvMMa
X-Authority-Analysis: v=2.4 cv=VcVir1p9 c=1 sm=1 tr=0 ts=6abbb8eb cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=09zRouN1k7u6xsjrD3kA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-ORIG-GUID: tS07WFHdGLniedX3U3cUt4pozmoRvMMa
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX/aMGVJvdORV/
 pwh1+7NG74JMIug5ZhEMpN32dX/kFp+iFBGUQbuP93A2yxQ+wUHbEe/kQox9zUxdwWTTM2x3U6a
 CGVFzw4omTB8OmzkRNGa5UDDgHZd0Kc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290052

Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmih0108.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmih0108.dtsi b/arch/arm64/boot/dts/qcom/pmih0108.dtsi
index 1c875995d881..e8af3e5d583c 100644
--- a/arch/arm64/boot/dts/qcom/pmih0108.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmih0108.dtsi
@@ -49,6 +49,17 @@ pmih0108_temp_alarm: temp-alarm@a00 {
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
 		pmih0108_gpios: gpio@8800 {
 			compatible = "qcom,pmih0108-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

