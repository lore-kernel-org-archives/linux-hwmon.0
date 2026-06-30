Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3381A43D4F8
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 14:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782831219; cv=none; b=QOoGFN9LM6k3FY0gQ0xAFGumTCU2gRQ8NUQ9NjVqYpk32Lb3ZCPBBxeJgVC75cbw7Wg3EGQLpK0Q5Lfd5nvc3+R9GfY8cSh4JRGICRO8kgrNWbNCOveqV1fDL3Q1VV4ouofN3688v13ErJo+/mMg68JD4OUvrHn5P/WSN1qWixM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782831219; c=relaxed/simple;
	bh=C8blcHMIMkUn8SxjVlVqBB/iskindoTdj+2JO6WJc0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k4W+mm7ZLiXtGTGSV7UQpMUH/FCseY76BMFwxazl93OOYXs2BFiCh58XybmlZGnYIr2cVdT/dW+gBm7dK2dW4UhEu8zyQ16DdVAWGi9VsFMhc/cVMSHg8lmIcqPD43ZtzCnRVKUm7AM+rS40eDJwhsJUOhTnLDZ040q/DRvYqMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ndNCcwjH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WrKZVce5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ndNCcwjH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WrKZVce5"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDFQQ2185857
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 14:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kPPkjSCNo09
	SDo/Pz7px6sAVk8X5RZ6B8/0fd1li7qE=; b=ndNCcwjHg7Teba2kMIrd7YLPjER
	SLcRRQAhlHXRxXlm+8+/ClO00MCeGLopp26Mpn9ApnMH0jpgwU2lD/x+SWVLgBFE
	kYnaT2PBdDOC684WY9zpj5NUSu4CbcAlf5ws7T/p/Fh6sI+0CRjLHJBO2u7NuRsN
	u0ZNfDj2ximNGT9aCRN1+83dVZ1XncY47IHjCOECCT8epqO2lNQaq8/5UNQ6nZRx
	iHpsBL6123UFk3k0shETgMTFhh/a0fFoplz4jfaUq0OqxD3ipi/BGG4fMHoQb+8z
	25YwrVJxBq85F378lhdmNdnRsSU3sPE2CdODnNvkqijQmFf+YXbI8Bm0SQw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f46862tk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 14:53:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e55f0613cso353175785a.3
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 07:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782831213; x=1783436013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kPPkjSCNo09SDo/Pz7px6sAVk8X5RZ6B8/0fd1li7qE=;
        b=WrKZVce5erS8+zUyI8F2VTRvVarJdBNpHG9uVXdm8K2QrRDVc9wjnWdC1dKACGXYkM
         CtKa3CWihpoHQlrlMkHDFNNNIuYCGseDTorLrPojSrSrbVMma5ki3tZw4T9ZtYtGg5Oz
         3ZK8iEerFrdQgFgc1ALa5rzpBvSmEQSiBo7HijlaFc2JaH3Au0d9rD2nLk9j7yPWYOps
         Q5fSctSlOGxiAU352J8C0UD5MQb7dBPwkSqiTCYbOpkBDujdlMqzdBKMbOXfRIKtLPIh
         sNiz1MdZagBeRJ6KF17ZtZJsS3+ZOZAwDoLIOg36hN3FWcW+zeePOnkn3sPM6lpxU/4J
         xp+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782831213; x=1783436013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kPPkjSCNo09SDo/Pz7px6sAVk8X5RZ6B8/0fd1li7qE=;
        b=lR8ukQzCYlVdOUJvl3q2zCwZJmUnaj2krQw0eSjcntIMzYBvUe1FUTBDrJyxCw+G5h
         FePIMU3St5r5ml0dFK2I0mxlPu/ylfJBgAvbYrUjmmprXyS77uWcZ79lkfbK0AsQVznb
         E5q1mQhxq2GYQXtMD9KePW3hKeNG0VmjgFkE/+OHi6ZINijwbmAa63lXbM3UKC+gCM+/
         VNXN5/ySMDxuHnvc7Nkjx4Gm7bg6hh9J3vVT+hZ9YoER/paISo1I8Pb/1iHhYjrZLW7f
         y8nh4lgdEnrPtRc3pIa9n+1xz6jNOp2bl8PGsVfQC3X1IBu1Pjxg378/r+dGlQNJ9Rta
         47EQ==
X-Forwarded-Encrypted: i=1; AFNElJ/GL4/apD5o69Uh5ksL2lpfrZ2yQLZ/KHPRcZhn7eaN3xp/T/3fqTj0CrVoq2J8/Qc2J/xipdNhZMrhjg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwjr+1LyZ30SLHhijTsqmEyRMgfzF8z396sT4E15OcFyGWKXbq
	fKsROKqvkfoATHYC75lwOifpNoYpILCXFvfR+WoZ6SuMdvoB49lOIOdRBNDK9pg+Uw1zNkmlr8L
	PXEqTdQkUp1iebXY775toogYYLaJuYH7435ynlcCLDYV3kI+wLtlcsY10hAKVKMAGuA==
X-Gm-Gg: AfdE7cmmR3M1TtNTtdI+twj60N3w08Wmtp1J/42nQWG52Z598rhlj7dKcX3XT34ttuk
	TxlIW9UPj70VE93Q8mfREPpXYhEr3qyp6D6x8zOtpNVNkSrjWFD9vKNV45w87bbM7rq0tSnxlwN
	7hbL14yLxgASGSVfhMy5knCaeWYwtzpEiYbU3gFlnD3k3sihc/G+f9yl1NOyHr4ARYzW8yturXM
	JYLu2PS3Uv0ZdUeVEMCZK8NDTDbP3SXYUHv89bLGiARYPwaGMJ18mWECMqIlHQBsGinhPy2C3Iq
	QWUqHeoIHR7leqQ5iOFIUFQlbZWRskj8qbFnyGxI8VVm5jMMsJcZHyI8caUSfTLvPgeGJYWYwp3
	S7lVp/1eZGrY+7311vDvUr4I41NPIhcELJUvbGgX0CwiqzQ==
X-Received: by 2002:a05:620a:489b:b0:92b:8a7c:f72a with SMTP id af79cd13be357-92e6279dfa2mr679862985a.47.1782831213397;
        Tue, 30 Jun 2026 07:53:33 -0700 (PDT)
X-Received: by 2002:a05:620a:489b:b0:92b:8a7c:f72a with SMTP id af79cd13be357-92e6279dfa2mr679857685a.47.1782831212865;
        Tue, 30 Jun 2026 07:53:32 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:5c75:21f9:a642:c358])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4d15ddsm720295e9.6.2026.06.30.07.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 07:53:31 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin and charging sensors
Date: Tue, 30 Jun 2026 16:53:07 +0200
Message-ID: <20260630145307.10745-4-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260630145307.10745-1-daniel.lezcano@oss.qualcomm.com>
References: <20260630145307.10745-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: exU306jP-2Rt3a_snWPWlBuVx8o23FFM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE0MCBTYWx0ZWRfX+vMWmlKfVoGS
 Z8NZra7ND4XaY1EKYcO1b/HXbnf8/kn6P9TiK4niSCQR7vOy0V37zEXIhLsmKuVZzmuxA8dzIOw
 7fMltGN1xO+xJ1HdyBAX2vDq4ecLj99iornMi31P2WfdL6lSrqBrLyl1EXwU7I2RHR0s+0t0+bj
 r83o9rzAsjqzeDzD3la/7/M6NU/+JkIE+bf0TnNixokMGbxgS5759jAJWIEu/tPI9X8302wc9Qz
 dhofD7Bp+DlT8Q1jb2Ju9snb0RVX+t2Mw1XUNVuxetTERQ5/XZngYcEisVdAjMDinCJHc5E3XdJ
 JdKdvEah43icWMktAfAgY6qJm+ogGe5T1v5S5yHLl2+MzJOZrj1t7iKCc7FxNj3CYg07TTDfi70
 ZS9wZkTZ2Cndn9ZmBpjh3lNX3se+CH8UQnZbQ3KVvTloFwf/aa+Ht7JT13vPQcszF94PsiKpu4o
 Rjcyw5/WNHi6Ly5zFeQ==
X-Proofpoint-GUID: exU306jP-2Rt3a_snWPWlBuVx8o23FFM
X-Authority-Analysis: v=2.4 cv=FbcHAp+6 c=1 sm=1 tr=0 ts=6a43d86e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=8S540zSUgs8tgqG0LUMA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE0MCBTYWx0ZWRfX9sCJbczd+5vn
 xi09JjGjRNC2Bfs5JQDomkus8JedKycuFVUXTg/3/t91Emr12eVbIKGOjDFJPRva9r42xvb+09O
 IsW5Y4/Oa6+JSckEar2Dmmr4W8NPtRQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300140

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

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 68 ++++++++++++++++++-
 1 file changed, 67 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 5d49df41be02..a19a363da9ed 100644
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
@@ -1729,3 +1731,67 @@ &usb_mp_qmpphy1 {
 
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
+
+	};
+};
-- 
2.53.0

