Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717CF3B42E7
	for <linux-hwmon@vger.kernel.org>; Mon,  6 Jul 2026 18:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783363655; cv=none; b=TwAMNT/0c+24p77VcfQz5+3pXA2oP44ArCeqgPV10lGZDaEaV8u+BhGPbcvVGmC0jfgRE/f+UNE6MSrkHe5A6LmlFD3VLg9AvZ2QjjdwqBwh780v0FNS/zRkJkesTDmL+phln9E5Exe31EUUUefdZuvOl3ZavCCy4OMbL/ikbws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783363655; c=relaxed/simple;
	bh=DslgyWQhqoS3FgUQ0SixGQYUc2U8QPcs7eGUdXnZmfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uBXUyc6UAHRME0mJSJZTGxuALqhfG8xyDqEdHwZUr4I1W10yy/75nzWDLpWtdHSz92u/9EBR8R0mhywjty0gJoejy5rjqlFSr68ukxyKX9e0gCmgokS9IltGi3NY0V3/CjpQVRdO1hL2NpyDapgZpxUkL9MHcxLw+h65QP1thyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UIlPtDE2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XTyqaurE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UIlPtDE2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XTyqaurE"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFHlC958770
	for <linux-hwmon@vger.kernel.org>; Mon, 6 Jul 2026 18:47:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mzAnK24B5Og
	zyCTXlJoJUUix70FZiSCDjrespS3gvYI=; b=UIlPtDE2b4OtCjevzArJ+AkWgpk
	7SNhYKWX4SLQiyHvmNPxjo+NXBfaWUOiNnhWFOKGANAw6pHY6lqkjbPVOsjMkp22
	W8dRyw+DeuayeIp+L4vJ6l4+eOqJU1ArLG+CE1rgLDAcvSh8otBl8pKCndxxLhwG
	yFFK3kC5/w5xUc/5On5BGHkZRnyVxa0YIk1vzxDX8jM6UOHFEbyUW/8YmpT4Bc+j
	NZ1T7OqtGp5Hk3AmDhNULODVBOVwOMbIIwxdAGV8ynrjJFPKLxWS53pas+jT2aZA
	A8IraQvZn0QxoLKt4IYDHED5tIGWp1v7n/tvKNhBb62ac8pGDNmWqWwXM/Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h9aw23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Mon, 06 Jul 2026 18:47:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e6a2f5995so554242385a.3
        for <linux-hwmon@vger.kernel.org>; Mon, 06 Jul 2026 11:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783363643; x=1783968443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzAnK24B5OgzyCTXlJoJUUix70FZiSCDjrespS3gvYI=;
        b=XTyqaurESl5VMG47+KncyjrF2j65E7l7fBoCbr0fhbMiRE9qZl0fWNcTEofCOn5Oob
         eYmAhJ8WjQeXnJmIh0ePMo8pCJUrbZ3WgYXSVdqF5ZAxeaa9SmbjzCJbmyWcyEStAamG
         cKdtOKwOJ9gHCSWuE3+9hVTDxCgZ+3tEPT7ECwvsBi11PaxZMN453Zx5rQEik/ATppXH
         LbdaemDpPgJ96qme2sDqnobX1RQOkUx/zWNHNOnoR94gu23MVEwmcXwKAqqpMkAHO5NV
         4bIPLWZYVl8QHrcGevgR8TrTT6tMZWpoYr3ha2No7eD/jOFbvbaLWZFWdtwgLh69T3if
         tcoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783363643; x=1783968443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mzAnK24B5OgzyCTXlJoJUUix70FZiSCDjrespS3gvYI=;
        b=pNAJNCqFtwUKzR01esM9hRqGLWyq+pJNAuHSY5SxHgKrmuF8flbfSqSosS9hifhTHl
         se8m4H9WVMPgeVLM0jCx+kntZCnKgxVi60mCNiV9lVlQFL4zuBwbjfo2wwcKS91zNhI9
         eSXumhT4ca24z7fVG9b892l4nrMeZ08Nu3CFnjMR9x1/EZVIvtk80D0OKI2h3dxW0JTI
         iX2vwNnTxo4BiwAMsNJq9XQlX9db8AQrKYzypSku5Ow7N8jOaHEccVkvmlIAHz/Irv5v
         hFp4xxj4DRzHKA/CTWMuNDMrYVeyHRHtXgkaBAPTFVfvhPITCUVFkf3el98AsvjKO1mM
         Hgvw==
X-Forwarded-Encrypted: i=1; AHgh+Ro25P3dGL28HqO6Vf8bDPkM95tErN2+Yrwu4gvMej+wDykjFYoqNcSVJLC9+Oc0+DHYD7/8NT9VJWk70g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy45CTjOqUJM/QJmfyOxTrxlY0XR5PQdebeUUifEjwcSgE+a3QT
	AV2v0MabJGMsuQf9j9bxETbsBfvRbLS9MH3GwVcM9mPhXdP0nCMlxkECYCDwwH3gLqMPf6/l2Rm
	GIDLsBSQhSBUbHJM0bxqz1DUMNcw6gn2NP34PFph23OnHg/iwCOAoIq5yErc7LmzjcQ==
X-Gm-Gg: AfdE7cmVR85xvRlSWL7aP8IoKnjE7S9Q1fwWwu+YAfjntF5oUeSX5/xk7eSa14I71iE
	Px9btSYPinoeNokDWDb6sj4UAERtnNV/SdeRAg5AJ6eyJ06MU5k+txCAMfDEbFhFbXpO6Wad5OQ
	bBeC1gF1hh0sTBEUNzgF4WayPTYrwSKKrkappKsOkJWYFJUMRiQaYKOEIxTjM7jwjztBKb20kl4
	TtMdCAn48RH83jlJXDY+Mzmv8Yli5i2F3dzGxSMeGDtB6p3DKkDmo7gM20Js0dQ0Pq4B2DwHZha
	RRmsd6bqkep6yNObg+DyLLNo0CH0ndRO1RclvxeO9AWeOZbj0NVvGGfq1lSLkQDAvUC+cmbmdz0
	c9AP6ncqFKhqRvRtSPiNp0oTqD6Toakqldkosm/AU0U1Z+g==
X-Received: by 2002:a05:620a:31a3:b0:923:8612:f15 with SMTP id af79cd13be357-92ebb4e39damr248196785a.18.1783363637927;
        Mon, 06 Jul 2026 11:47:17 -0700 (PDT)
X-Received: by 2002:a05:620a:31a3:b0:923:8612:f15 with SMTP id af79cd13be357-92ebb4e39damr248191485a.18.1783363637451;
        Mon, 06 Jul 2026 11:47:17 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:b077:843a:5587:be05])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0078d56sm3858625e9.8.2026.07.06.11.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:47:15 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
Subject: [PATCH v5 3/3] arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin and charging sensors
Date: Mon,  6 Jul 2026 20:46:48 +0200
Message-ID: <20260706184648.35613-4-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706184648.35613-1-daniel.lezcano@oss.qualcomm.com>
References: <20260706184648.35613-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: FGQRBjmpSD8Th850ewCsFmw86ylEuARg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4OSBTYWx0ZWRfX4dm1QvddYu9I
 uPxcOT0jv6zZhfpeuPDpwPa0xataFAOoHXJXnhiGOj6X+lejSlT6cL60xhA6ggN1pRhKv+X7xI9
 LUji1oMffaJ6CoUNmaEX0fw9v0UflVs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4OSBTYWx0ZWRfX70Mz/MqkL9FX
 O1G2f/5UNd2ihXDpFjZVH3iHgYd/1hbVNms/Whd4UtA7xBj1u8xpjU7thcDyYipIzjjl0yQoias
 BdtGMWJQipSD5bwxeS1TUQjjM6739Rz4w8ZS/z99OpSzKmuQo31UmcUF7eavz88ACVKQ8aC91CH
 Ayhp+/lPsghQIV5uCf1EvxFtxEvrdb3d5CaAKBDJGmYMnPj95yffMk6K/FSoh6ybI9mGVcGmLMK
 WnnFLLf9Q/rpSJMvD45id6Iq/yYZ69dum/iTDk98t7JNhOsSY/w+PtJC60oJZaQ69OzCNKSGY/7
 za3Qplyj+OkOPq+FBZ/Fgrrrw2ZlvHnALIAsI2rpv/oJ9tTkmWNikhhaZ9tkX3P52kXuxNlnJKn
 ZsVG45pOfD6hUHuWmOJVtUNu1dOASFDtS8IT5/A9TRvc5vzR7YPbOB+qeznF1XIoO+CBhhUmarb
 lF4XU3kxWeaNnTCtIxg==
X-Proofpoint-GUID: FGQRBjmpSD8Th850ewCsFmw86ylEuARg
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4bf83b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=8S540zSUgs8tgqG0LUMA:9 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060189

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

