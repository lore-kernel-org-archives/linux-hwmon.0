Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB9C388862
	for <linux-hwmon@vger.kernel.org>; Tue,  7 Jul 2026 19:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783452159; cv=none; b=YtJ6HjCa3Cx5uI/qEUpj3BK7+EssvBgCgxVMfmISPwtBvI13JI2qOqdVKsjtly68QKHKTXnKCodU8TltJdmv8UXqEHff93ycMG1NoX0CHfgzbxGgZxziY5l/k8i3BjqVYctPZztfph+t3Kdg4PZ91A/T02doY72hrm62W4iY6Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783452159; c=relaxed/simple;
	bh=OLMI44Lp6GoBRY1rHghq6n1Fah+DXzoEhLtqQBP7V2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y5Al91A7t5oSaFSxImemKr6cRL/L7tt5Vlm+I69A5AsJ17AzRyYGUfnspgFc0JBndYJ1pomHS6dPSclpeVNaTd099tCe5MyV1c2R3pXWtyh2DAXVi0JwXkuB++OBgyHK6T7ype9cPL5ZSK4nG2/A79sEj14HtGrDoRv3uR7mmtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gNq83lrR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CatylR4S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gNq83lrR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CatylR4S"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5G0U542074
	for <linux-hwmon@vger.kernel.org>; Tue, 7 Jul 2026 19:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PH9kSE6ElCx
	Spv01qD+dgcHkXgkXzbxHF+kJhTdzTJ0=; b=gNq83lrRtsUMcnMImKB7p9xnCO7
	ItfQyJ5pFR5inaiQEXi4axYHT0o3yVyyRj+RikIWjT0x12HXA//QpRsNwAjUM4PU
	Ow9pU/rtA0+35z+UkKzx9KMQhuAWzuI+/SbGv79A5gJFWJ2GL+LXtVC7EKqr+lyG
	vqXQsadcGUuA17B+bdiR1LROdt5xt78DbMohiIwWXVY3taPBZFncWfLWtJpiADq1
	6/CX5ysCPvoP5dz4sWNpz4M2NnpSFECX+ijZJWE6YHkX789m9qJhQHtDxLq2Qsi6
	RttaXrM+1dNQlsHD2acnFiEEO09ACefkB2r0Nep4FUUsBJrWMTD8kFYYBzg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w11u1y7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 07 Jul 2026 19:22:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bec738909so34552121cf.1
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Jul 2026 12:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783452156; x=1784056956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PH9kSE6ElCxSpv01qD+dgcHkXgkXzbxHF+kJhTdzTJ0=;
        b=CatylR4SPptGQqVBGwyVCMn4l+6c1CccsNWFsIXnASGeuxsKciO2yZn/RNE7xDOvg6
         kVyWIi1trNb2VGczzDBSklRkhFX4scCmNK5snr9VFfcr79EzBc1TXt9cJblNX4Rym2qo
         n08OYOXTKVwh3TBU2zcwC5Bvq2VE05ZuT9VoKlEyvyMiRIarC5vjva2LU/IuT//GsAKa
         mk0WD7hsIwdk1LwM1Mb6lmavGTRRnbKcK43N5EuLkH+t+PF82Mb+eJN/+uWK6vXjMGEO
         a65JdwktC8WSSce4PqFf1rCzvWle8vyFEqDlmHpz/cS648h4Cz2etM1Iox3B0YsqPTcC
         Z/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783452156; x=1784056956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PH9kSE6ElCxSpv01qD+dgcHkXgkXzbxHF+kJhTdzTJ0=;
        b=hMoglqxeFsBDbk7O/8E9Y+sPh65vObBSbsiptTS7+z/y2SAguDcgNLqSmcmYm1Sagu
         XuyFrNJBbET2z8zDUsS7xysYZt0Mvl4dvcFXuRL2X9UZRR52QQTk8vobYwJHwNichtlA
         0U/RM1QJXW3Cbl9JruyFdcnzRRA6SseJlZna7ogZy8VRncoVd5CZRUTbnSrEsSBrI1FI
         6Onwzk2mjv7WwxG43qSQN8mhjow3FswPlsgEv1LuhAr2wI9mz31xxz3zyOmMsVV5Oo70
         IfdOgv+bMM6zMGVa6BT4x0R5lRQNGzfBY5LlI/i//0Q4n2H1iDvfAqCv/3FmLoF24bXI
         BfkA==
X-Forwarded-Encrypted: i=1; AHgh+RokhN+sxJzDR5nY7NvKMJTzim3cxJJgIBPED5B48q3L4nFFC+NkEWkt4Ng8+kJmAziP6FDyogCasjE6Zg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywoe1tpFyp09sCP58Uy8xaRp1d830LfgX32Miup0xu9IuxoZKp1
	2O6dPlG+WOHbTboK4bfyamkVLcxbj5D+pqEGIfXSWqj2snzIWgFlfQxmAZVtcxaZYSJ+kXENPn5
	mx5sjTV4cHgaRQ6lfwPZpTPAopZ4Jcz0N3Bi5dM622AiKlUELhYRbFd8EwJ4+nVesDg==
X-Gm-Gg: AfdE7cn8GMb0RSQbzUEV9XHHQaa6IY04PRdRpnTKym3L2ZQeLtK9ByPUXnfEU87LKr5
	47gNOlvKuaLTe31hn1hjkfyWvtCZtQqUdIQC7m5XL7h3k9cNvq3HY5pwq+UGZGkp/s3IrVhuLvO
	1yG3VlR1RufBqqBzPd5XylIJUnbbMqE5fj5xqA9/yv13Og5yN9pyG6SfGFPZnUoD/JeHbcpHzzQ
	MVyLy1Jkp2hta3PZyzFqWHJmYW7UuwUUAJOHbEDXfkR2O5PAFJFerPHEY+d3swBWditLTUaPyet
	9GBs7bGX/tX3YaIQugUW0Hj6F146LFP8OFSaXFSbvPz3f7FNKF5Rt8iO3MkCnkM43O+CqvgLgCD
	6W9dljM1LzioUK5w3M1fqQosYhwq7dsKUmI3X75262HE=
X-Received: by 2002:ac8:5989:0:b0:51c:7bd:2c6f with SMTP id d75a77b69052e-51c7477d221mr85363201cf.8.1783452156490;
        Tue, 07 Jul 2026 12:22:36 -0700 (PDT)
X-Received: by 2002:ac8:5989:0:b0:51c:7bd:2c6f with SMTP id d75a77b69052e-51c7477d221mr85362591cf.8.1783452155901;
        Tue, 07 Jul 2026 12:22:35 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:8029:bbc1:63:ed84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f3677asm70025515e9.4.2026.07.07.12.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 12:22:35 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
Subject: [PATCH v6 3/3] arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin and charging sensors
Date: Tue,  7 Jul 2026 21:22:28 +0200
Message-ID: <20260707192228.14647-4-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260707192228.14647-1-daniel.lezcano@oss.qualcomm.com>
References: <20260707192228.14647-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DMe/JSNb c=1 sm=1 tr=0 ts=6a4d51fd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=8S540zSUgs8tgqG0LUMA:9 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 9UGGrYMx5i4lDinHu87o7AA15c0_8EIu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE4OSBTYWx0ZWRfX21ATa26FQ2z5
 gb2tS63Fhhssvxzlzrlbc1Gyq24U1pd8nMvEaEEWQayY9xlbZw1f+btG9Do320hDIn2O06hKKkH
 zU/XCtzaZtlVb2MDgG8iwTMLUr/VT2I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE4OSBTYWx0ZWRfX9l3A7zTHCwzl
 kMpJWD/vuMXtjfMy+mUjDoDuz5GERkPYP3bcGhCH8/L3SCv3BqAiDHBlsVQd6XNDRVG9YqzpjaU
 uC9kcNHR1eYgSKuSOBbi8IDzeePpgDTXklxLy6YjeqlqIxFCxwxH1mfbikmLk/NJJKjQWcWAfYk
 ypWwtEGRrql+TZ/dkwQyPWCEZex4+dGKNDv5aMxzWSJ94yjDJecHSNOXpbFivBYLmug9GPM4HQk
 wb1coheqKq+BBaB7pE3tDHY9MgBFva1iijh5B8Q2QQCwm84kwgp56GpLMwZ7G9irVz9Rc2tNlrk
 Oy//OKl5qp4h6jSXYCiYwfQ0QUUtzfAXLD01fcn1Ggk2yHGkP8UgTMeeQgWjNHd3Jg1Gy5Llupy
 FCCoeDGn3CParPA/m25STx7wlNQQgnBa85fHTPQX2rIX6i9KjNQfmnh7CW/pyWtw4BRAmIe36/7
 TyfiKb8Fz13COUI6rwA==
X-Proofpoint-ORIG-GUID: 9UGGrYMx5i4lDinHu87o7AA15c0_8EIu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070189

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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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

