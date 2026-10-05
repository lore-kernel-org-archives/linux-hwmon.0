Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CD647D935
	for <linux-hwmon@vger.kernel.org>; Mon,  5 Oct 2026 12:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203117; cv=none; b=qFkRRzXLTvf6P/iO0LD72Mdbt/0Vym+9o5QNbdrJZ4JO5Dk9LvXikpXfAufnrMzUNZ0YchB7EORug0J9yP2f+k3WmI9MaRvbOgSMANfVXCtjvmcBz//5FXaINwLCphk2fkPAbswSVLz51gjMNVyfAw+ly2UQcLgChaspYzT6yZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203117; c=relaxed/simple;
	bh=HKyqwTUYTExMJhmb1+RP4eW5jgd4a5EGVzR+sCfaZAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c3der8JsGNA2t/cLdH4LImYpKAioqUuZmuOY9k/RLbZ/YtriuuiRjG71kRVfzsL6LML25F7sVjlSb4Fl/lwv6qylPQZ52XWGF8RjlVcPoMfvWfQuxp+fKw5Gu3FZGnVV0AuKNqesVf9FHdnG7jbK5ydulzdQEZp4aJVeTjyqMMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WSHRR5Wy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W/1aNW1B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WSHRR5Wy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W/1aNW1B"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFpk42897930
	for <linux-hwmon@vger.kernel.org>; Mon, 5 Oct 2026 12:25:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PybEl0v/KkqFumtq+RK4a1+HLZwxI43+u9l2njCMD+A=; b=WSHRR5WyGVM/02jv
	D+7OKhUrpytHOPGM25We0HWsnQ+1JXi5Txk5ggn0l8+iz8EtlcsPE1GeacpcS4jA
	Et2dreGyPozErH0FajkxLm+2oIqnEmzb2hreTFbgnPWmO8PtmDndL1nrnWpWq5jS
	U9VFvqyXZkMFljeTapEvd5A9yOhQsRWyp5CzCjdsdzNWVDOd1G6dCq5v0vizd5AT
	REj6gIYvGXEDG7Vrr1I1++ZWZC5R+fxELIuUSUiVtVQU0SCfy1zKss95/LwF/TK6
	uJidpBpL8UPCC9F1B/hF61L3wgXzZqWB03rq/W+2/oD2KOSLAsGxLfJvoHpxygX9
	cKDaXw==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2sssnrr0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Mon, 05 Oct 2026 12:25:14 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6d278014371so1400893eaf.2
        for <linux-hwmon@vger.kernel.org>; Mon, 05 Oct 2026 05:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791203113; x=1791807913; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PybEl0v/KkqFumtq+RK4a1+HLZwxI43+u9l2njCMD+A=;
        b=W/1aNW1BhUGUDN9le6eOI8P49a7NpCpnLDlBHZZUOsb8pFsTbCVwOwxaAN/AhefbwB
         PriT//LojDy+tbDj69HsPmcSv5AAUFqdbwWQdoCZz7I3UaA3U1HGdzf9GNIaRc7B5fUW
         mBeMt1/hcRosVT9PZVw3fpRTXqvVcuevmDTUAgtSGvYFj9QuXyqaTeW7F8F2wusdeEjT
         Y2mYeQH62zpzTipOuNNRrBukF4abBYKnhnHKu7rPApKoOvwIueFais5rVkK+WRCR5Brl
         8JI0hywWaPUr7rr/mI7Cgh0/qCX2NHjNSAIEJdeb3/tabXocnDu6OBWXAf8RfStfKbH1
         dMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791203113; x=1791807913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PybEl0v/KkqFumtq+RK4a1+HLZwxI43+u9l2njCMD+A=;
        b=o6347tmQu1+8nczV6fVpzt1YZmufx4kGjQmdg4eqHmiLQu0X8LNEaynyqdBC2ut/9H
         p3o5g5Qv8mpAf7TBnvAuwWAkDSqh+sedc1xKC6lSj0ae1E5iNXiRhiYkPqlGnN0EfkOw
         BWMM7YE02l389qavqgd6zL07i/a5cZuqUQMF4550U8W/+UuWicBNf0Evm1sK17TEh1+Z
         ZBMqsXv4LjASw3b8GoDEOfCcdZtlAz+E/j2Ou7BK8Su59XYrn1V+jDqbsnjJ6+iuynj8
         NTV9eKeFn4cp5W+AWIiNEM5yAAK6XT17ecwOJbr0T6K89gUXw+xmZCLW29bOb1nRYo6M
         /kNA==
X-Gm-Message-State: AFuF++lv0KLI2UtXfsSffrmrmApAI1GVOUro1NuKbadB39zht/EacmbQ
	3eIUiWuQUohIlhAxSvkn+VttBCZlaULAtuGL7emmcyMzDHMFCAmt7nchZwtQlk7pu4OKdrRDxaW
	M2aaKCZcSL1JoZ3jguVWkiwSgcOo4S9sDuZXq/YRUcwq50kKYs4Yj3R69FE+bsUVgag==
X-Gm-Gg: AYBFou1UoCWp4Acaar7sirLMvmbgGal1TjUpTqOkqeMbANs/4GxZgo3FrRDBasH/5uM
	EWr/lrKgSuqkjYHw7ssvgWIX7bdOuk8ejcTSDUm/iTyTy41jNk+gF8Tsr/B+1grThezd4wDx7Cb
	JWArS4FQ4OwMAJTwUa22qIvZegEUCgUGMHDWXH+qvgWt5xu1+nblHhy0y+GN53ODOWYqPQAogcv
	a5nOMRwZQAND091vRjJwTx7ZpCnDBMKY/eDewo8gZUmN8+/NDlLe1xeAqStTQ3muzC5/KDIkmWf
	qEC8VWKSUA1qFOmwUlHLkUHHOw9nePlF7H82R4VqFWEIqVwxolDuBp1nttq9CgnPXx5Ifx+W8HX
	vrkk68pwBwcpKlUuMC0DrIhChFhimcp+Fxw==
X-Received: by 2002:a05:6820:81d8:b0:6dc:beeb:34bb with SMTP id 006d021491bc7-6df35e2d88emr8799348eaf.84.1791203113563;
        Mon, 05 Oct 2026 05:25:13 -0700 (PDT)
X-Received: by 2002:a05:6820:81d8:b0:6dc:beeb:34bb with SMTP id 006d021491bc7-6df35e2d88emr8799333eaf.84.1791203113089;
        Mon, 05 Oct 2026 05:25:13 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82273e27adesm10896314a34.0.2026.10.05.05.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:25:12 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 17:54:05 +0530
Subject: [PATCH v4 04/12] arm64: dts: qcom: pm7250b: Enable BCL sensor node
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-qcom-bcl-hwmon-v4-4-50b9a8c730b7@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
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
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791203081; l=1196;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=HKyqwTUYTExMJhmb1+RP4eW5jgd4a5EGVzR+sCfaZAs=;
 b=5HSQzgqUR4kSrS3ESJ/jApz0unKlc2PE0bH2wC6xqh12aE4FFMmz+UJx3J3MQ6MoV2dHLRxy6
 zz8vcraCfp3DVDVCg1Tx9PsXWbwGPS6mFvDfMvonDm2QOpe1Azw1GUE
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfXy17t5iEMNkDn
 oVChzJyct0rcFOpXQIL65jnBnthV9W6Y9qKrIqtjUipf9dKJ4oYtKSAC0vqA9SHi1QwCGoE/HGq
 DwEVSGaDVfyxIwlaHu6thec6qBMwyRE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX/qmbDVf4sfRX
 ogaY6wSqoZO/8J0UqKspImHXsxQDTEry2CPYohJa2YM/7aUfWFVzyG2dyoTUeR7g3LvvB0kDhbC
 vBhGg804WFuRVDefG/d9Y+I3R6WnKCM87TmlV5NH4KQkM0XBqcW824dLdbI70kS7J86a7+Cr/zz
 MGZFZ1ooYWmLt0uacFCbB8NptZcM0YcZ4IToSeGE0pLMHgTw43RW4zv5p1yJ4Yq/ILXCEuWjkvl
 2w5ffhPqNyPoL9DSDkOKega/IIxvVpW/4W1seSoyt1avSMyD4jPLrUCv8zK8ITjiphS4qpZfqCn
 wDlUTcujnvgZbObXRbAm7P3+D8/03byCQ+ABQ81Fep9VBO6lU8VfgvMi5GzAVBORh5EpW5UAMSB
 0i9c6G0NLinORF1yzNYqapg/MENS+9XY7pQTetU7PQdC+PS56EKFTq6Ks52XCmyTOYzyvvWz5rV
 KnT7oMe1yOiGvizr5jA==
X-Proofpoint-GUID: 8W0150qfGAoEt97m3izl9AgR2mbMJn12
X-Authority-Analysis: v=2.4 cv=HqjjiETS c=1 sm=1 tr=0 ts=6ac3972a cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=8YuGtcdev8JQwI9EQfsA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-ORIG-GUID: 8W0150qfGAoEt97m3izl9AgR2mbMJn12
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050048

Add Battery Current Limiting (BCL) hardware monitor node for pm7250b
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
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

