Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FC8430CEA
	for <linux-hwmon@vger.kernel.org>; Mon,  6 Jul 2026 16:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783354124; cv=none; b=tCk2zwNwI5TLM4uDmyV5S+dzxSR5ExdtWdJaEfPWRxcTp6PQOAwhWW85qUBrqG9AssyFRmBfY+MtgYepEonjI0ffZFw/R5yZnaEkpglmzoHOe4QkI6AdfRnvFJG9ls0zoKnC548SYPOnPCwgYmoB+eb4vekxZmBMGW/ZHCg8AnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783354124; c=relaxed/simple;
	bh=DslgyWQhqoS3FgUQ0SixGQYUc2U8QPcs7eGUdXnZmfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EBnZOOT0uJnNrCYncZYO4yXmHG52kZKmbHOzgwViiABiDEVaPhIcrSWBiLioCYASIT5QCM0YlRGRiY5G0SkMP800Ve/sbnHtxmbDhHzDImWwi0JuWjqS+dRuY+nK0x/cVIXbPB0hje2HedTGd89M/6w6UC3f5dtmnUs+OGF2sRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=luuWWHrD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ml7Gv8+C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="luuWWHrD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ml7Gv8+C"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFN0x972706
	for <linux-hwmon@vger.kernel.org>; Mon, 6 Jul 2026 16:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mzAnK24B5Og
	zyCTXlJoJUUix70FZiSCDjrespS3gvYI=; b=luuWWHrDauXffYrXZz+3PTl5Oo5
	b7BJjiZC0nvv9fiRSF1FWrI0sQAQMxpaVwjcFNDhAKnEgPTDwB/x+IHoNioOLxao
	m4zN/K/QSoEhVrVLheLEfCXx8epxa7zOngYk67ZNIn6b4KRJDRFrXyjH6icqVfli
	z8/msNB6vD3qotRRIkX3GOa6NTa15IqUlC9jOo99cOrE+aka1E9J1sPGImQWpVFm
	+j2lBB6kXozaFD5Iz2V23mBfiqzkhj2XXiPd7t94L3UbIrpmHuLmxFe2C7Erwrk1
	/iRRavwKzSor+H9REBO4dST4JQ6c+6EiUz8ZIpuzmghDUiK35Lku55+6swg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r1nqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Mon, 06 Jul 2026 16:08:42 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bd9b850342so4012708e0c.0
        for <linux-hwmon@vger.kernel.org>; Mon, 06 Jul 2026 09:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783354121; x=1783958921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzAnK24B5OgzyCTXlJoJUUix70FZiSCDjrespS3gvYI=;
        b=Ml7Gv8+CpZb5sFBXAp/sa9VVQmRaovchYJKBImtGZNga39DVqNxwiGAXkvpeZB0aPh
         OD40DixdEOcGGKmhvdpJfXDFfVemPwbNgbj2/PUcQMSigmOsvAcdWSl1lqH040161x0q
         JJn1dyNuToXUbHzZNzgFmnmyFb4u+oRyygODydYjm+5ZLQCXK/uPN+ihrR7ZVD0UOSRH
         ah4wGYN81ttk4dmnsN9jZUxNMw8g61RkDMS5fhG4IgUbsxs9BggMbLot0HA1yywoje3J
         TKBmhPtEAEf9V09D3NlNex3qDV8k+l9ipkBpLaKsTpnMjdLXua84+LAyHmsVylTkH36n
         ISCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783354121; x=1783958921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mzAnK24B5OgzyCTXlJoJUUix70FZiSCDjrespS3gvYI=;
        b=mp5D1ITecg98CsRVLu660kFRH68N2XGXXwkYLghfj0pm3WD/Wl/b6pUNTLUzw5DsiA
         +cQfEc0TwaihB1KSkoCCskGhiYGFZnWacVZ6Y0xIoXzvODH8OaO7Atq4V/+L7Ad1VSyS
         J/ehjz8qEqVXx8k0N6FBkZUVg44mXKgovRkCpnR6725DeK9TUPuv8Wr3/2uWsDOjmRTo
         x9cPwNJ/jyLIUVbDMAtoZDOeVKKh2p1KSdzMOlcvYE6YbgI3s8kX/gzxqqbPswj8Gt0+
         a8hglhitD4LjHfhSBQGgio+2SAnIDh/WbTQ/2Bhyz7kw0Xm953vwqsLbWq4iwbBFCYH0
         rUJw==
X-Forwarded-Encrypted: i=1; AHgh+Rr4UMvP3enNpe4ss5zOezCJL4wXt2uktkhi/1TEEIc/IgsvsHxl32sFTf6WVA1bWrl+LfzQBbNfnx4UEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTX/jBS3dwlYi1Dz+ERCDXu1AWwnsaE0XaDZmzCSaPgfCOKSS+
	+NI0zNwrBdXKD+jLdggnFsU/1TMbL0uSTNsw8uSKrOptDxRL9KH21qrm/NzLAd0SnOq53mK+zqf
	6s3g30A6PGCWBPQVQT+V2XuTQfaflLcR6hBu/Z0nHHcaWQnLIVBSKT6KpPNfR6vufGQ==
X-Gm-Gg: AfdE7clQSuWgefnTFilvkCpfXw0u02vJ4AJU0Kc4fnYrfecfTP5kD9IzOVzvlHu4ph0
	ZMMMDSM+WEYaTH5GauOC0HKpQrCKlxi1XkRdxHXyopcz0WBh/kAyRFYMl94HJoAeHhrR42Ubc7t
	OTbmxSvmzdFWAFkgIJrVpipUY8YkIdqFFgRpJxxCigODsmPt5u0X/Mj7S5Yzz2pjkpEAdLYsT/l
	M7LR0S9PluJ9YUgiTXZv3xC0D2qzElpLBHu/f0GPvp5W4a4DsUqx0cz20uIVYD5ls9dN30yYEqx
	ntiLt++cJQ1o2BoF+C2sSkT/31XmJSJ+/RLIuCkQNoq92a1MO7SrXn1DAMion1n5pSJpTmsBbSV
	t4eiMZmqCaQDd5dEqdiVH5KD20iS2Sz3r1W9Cinwq3o1yZg==
X-Received: by 2002:a05:6122:d15:b0:5bd:8dd8:146e with SMTP id 71dfb90a1353d-5be908f8d78mr583407e0c.4.1783354121438;
        Mon, 06 Jul 2026 09:08:41 -0700 (PDT)
X-Received: by 2002:a05:6122:d15:b0:5bd:8dd8:146e with SMTP id 71dfb90a1353d-5be908f8d78mr583381e0c.4.1783354120941;
        Mon, 06 Jul 2026 09:08:40 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:8405:4a9c:95fc:4b8f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e3e2702sm26071966f8f.9.2026.07.06.09.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 09:08:40 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
Subject: [PATCH v4 2/2] arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin and charging sensors
Date: Mon,  6 Jul 2026 18:08:29 +0200
Message-ID: <20260706160830.17698-3-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706160830.17698-1-daniel.lezcano@oss.qualcomm.com>
References: <20260706160830.17698-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2NCBTYWx0ZWRfX0sV060DLwMn4
 NrVteVn769eYlfVOGpmYdVnQtydSeNbWPQI7aMO4eXfYTM5XN5W5tVTjNToTMABacrkb4aweBtu
 NTYEFSR7svwG21Z8ZGzjynFsl0TmLICiTw6rWBabchh1EuFJlMCsi5asy4Phnm70IvpJeWC8zpK
 /D/LBoWWTYknHKREFPHTdmdZBzWE4T0E4mz38qfLgSRII8nmjWAAtSTD+m42rEzOIJwrMgFLffc
 I1ygi/O743+h9ElRPIwqAuIRRDIDHzHT8IpKjrkwJmHBstLbK4RMoJIFUEuPT6zV/EComl+DaJt
 H61XiUV0kmtFlqSoS8SvoK9KTcWeDr3vzJltt9SAy1w1kxm275KCAgEqt4YkZ06kZqjKdSl7qcH
 NKZSUCXM+84xlDfOjKdulfutwZ4ONXn/Qs3YBn7lBpqtUAzOpidJv502EVzm18wBdV57okDaX+g
 74UZX3JJEbOixyRpEag==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2NCBTYWx0ZWRfX7oZAxmCmnltM
 o7uAJJCbc7K8lG7qSfAKknji3TWj59sVBsn6cs4bVtb64gb/mVqry61VaS5HoeJmX+50zQ9m8H7
 KCTy8PNru4PCvHQPqfW3DBQc8oeQ94M=
X-Proofpoint-GUID: b2OVTuOaeP0YkO4bJpfj6N486o3QmPG_
X-Proofpoint-ORIG-GUID: b2OVTuOaeP0YkO4bJpfj6N486o3QmPG_
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4bd30a cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=8S540zSUgs8tgqG0LUMA:9 a=vmgOmaN-Xu0dpDh8OwbV:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060164

The Lenovo ThinkPad T14s embedded controller exposes several platform
temperature sensors that are already used by the firmware for thermal
management.

Expose the EC as a thermal sensor provider and describe the keyboard
skin and charging circuitry sensors as thermal zones in the device
tree.

The keyboard thermal zone defines passive and hot trip points, while
the charging thermal zone also associates a cooling map with the CPU
clusters, allowing the generic thermal framework to apply CPU
throttling when the charging circuitry temperature exceeds the passive
threshold.

This integrates the EC temperature sensors with the Linux thermal
framework and enables platform thermal management using standard
thermal zone definitions.

The EC protocol currently does not provide a mechanism to program trip
points from Linux. Consequently, the thermal zones rely on periodic
polling to detect threshold crossings.

Using the charging circuitry temperature for thermal mitigation provides
a conservative approximation of the platform thermal state and prevents
the platform from reaching critical temperatures under sustained heavy
CPU load.

Without this change the platform reaches a critical thermal condition
and resets under heavy load.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on T14s OLED
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 67 ++++++++++++++++++-
 1 file changed, 66 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 5d49df41be02..ed5ba3a428a8 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -979,7 +979,7 @@ &i2c6 {
 
 	status = "okay";
 
-	embedded-controller@28 {
+	ec: embedded-controller@28 {
 		compatible = "lenovo,thinkpad-t14s-ec";
 		reg = <0x28>;
 
@@ -988,6 +988,8 @@ embedded-controller@28 {
 		pinctrl-0 = <&ec_int_n_default>;
 		pinctrl-names = "default";
 
+		#thermal-sensor-cells = <1>;
+
 		wakeup-source;
 	};
 };
@@ -1729,3 +1731,66 @@ &usb_mp_qmpphy1 {
 
 	status = "okay";
 };
+
+&thermal_zones {
+	ec-keyboard-thermal {
+		polling-delay = <5000>;
+		polling-delay-passive = <1000>;
+
+		thermal-sensors = <&ec 1>;
+
+		trips {
+			trip-point0 {
+				temperature = <55000>;
+				hysteresis = <2000>;
+				type = "passive";
+			};
+
+			trip-point1 {
+				temperature = <62000>;
+				hysteresis = <0>;
+				type = "hot";
+			};
+		};
+	};
+
+	ec-charging-thermal {
+		/* EC trip points cannot yet be programmed. */
+		polling-delay = <5000>;
+		polling-delay-passive = <2000>;
+
+		thermal-sensors = <&ec 3>;
+
+		trips {
+			ec_charging_psv0: trip-point0 {
+				temperature = <55000>;
+				hysteresis = <0>;
+				type = "passive";
+			};
+
+			ec_charging_alrt0: trip-point1 {
+				temperature = <63000>;
+				hysteresis = <0>;
+				type = "hot";
+			};
+		};
+
+		cooling-maps {
+			map0 {
+				trip = <&ec_charging_psv0>;
+				cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+			};
+		};
+	};
+};
-- 
2.53.0

