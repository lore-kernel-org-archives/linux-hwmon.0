Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7796A3E5A37
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Jun 2026 21:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782335333; cv=none; b=T5fLyLZZSn8twsQEnYnpT2blJ63WJc8ntWR2hZFH9qeDQTq6lG94bJXu0StED1gB1O2ZRneePxht+4Jxg6R66zK327EoGXKV4fHqYJXE/GiFYajxNLaHciPpwploTtymacUuXEa6Q4PIekBLVIDu9j4AGFrZfJZWzXNMPoLg5b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782335333; c=relaxed/simple;
	bh=WLYdUaTWVpBtZwNr3HlNaZyWKT1SmuJRkQxVpfGW8Zs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VqfN+mC1LKiLeg30aMJbCXoHVzjxIpn3KlKA4lzVWelHgR/xJbhdVTq2i1HYJUakx+0vV3E+EXbAqqrAwXKYciLE7sBaPS3COq57hkYSd0M0AOVLB0AEfdyrIWecuvSoNKPKY98lXCTIIlBcgzX4w5r0vodEB0UmMsFf5gTz6PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JVursoEo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P4LlfEho; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JVursoEo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P4LlfEho"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OJj4KM2395536
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Jun 2026 21:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/4mZazLNplc
	RI7UA2lzg985hqmjiwniHBuU0w4DnhHw=; b=JVursoEorsmNtXPLcrRyPc320K6
	YuCsFBeCRo5KNYdCnDR/YCHW8JIj9IOQV8ABEkfyHoPYJTN/2mc5yovMBAKQ4twC
	C/t3s0MVIVaum3yytrsaxYXdxdvJLroIe5h8j8Ie5oaR7Oyv6W0tcGBmsPbxPqsS
	bh8Il40tqvDFD6WLWGxpwtc8NZO+EI+EVs3PDfDda9fQd5DsPW93P46Nuygob5ce
	gDFHazQQv8taF2VIkYfXXbYeRMeIrudFxGA7ykzSbWn8CBscWNHXfb5sy33umXLT
	uqk52F5V3CWS568yEbEwhc9R2C7Vx0cHCR2ZV1GgTW6R7WNcCcMpI0Eebhg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f06r34289-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Jun 2026 21:08:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-91931144870so275082285a.1
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Jun 2026 14:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782335328; x=1782940128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4mZazLNplcRI7UA2lzg985hqmjiwniHBuU0w4DnhHw=;
        b=P4LlfEhoWqRZFS/UTJqrZnR7yd09R/6WchfUxV7PCiBHOBLNRPlXWaOohjkfYMqYcd
         gET+7h7Z+wX8NUli+w+fKFJH4pmCVGcJBX/lfZAqSX0Xn3mtKAQ/w69nNaUzQ2JDDjua
         dHs+P/xgAwnjWrIf2xL/uaDbnBTDq5Mfki46zIdgXSTZO8XbUZeusszW6Ms3+mEDC+JS
         Hyc3Qf+kOFQ6+M2gvJxOVtPLXDm4HmoJIWOqK2i7NmXV4Eo9DCZ9uxMN4AezTWcsaGnD
         oTIcYzqcODbL5i1cgBXAJN59Uin1JXSfL9lBimpVaAPg3ELn1E7ZNn44eVTknmkVXijC
         zUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782335328; x=1782940128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/4mZazLNplcRI7UA2lzg985hqmjiwniHBuU0w4DnhHw=;
        b=sLROn8C7cgNqyK9OdfDtvvn21pyVUEeOeitWHi9qSA1uSHALfU8LD85/j08D7i+Bek
         xsoR/NPQOPm7/6xe40cJ+1B/p5RYLfvIH6/FHmChGJPigtlQrHSxp9yg6AG4SKLHKwFG
         NeX+ldZor2FgWdCWvepoGLwKl4p7eW06pzlNQXfmXKOHYBsI3l6gkeLe2qkCv9ZBQQ2q
         PUoCoojssPlUwt7eZYJnJzyqCyconcG9t+0F6CcuGj7gjMXCHUr/Sup+eVj1+vfEDfOR
         lzYsQY6QlCdk2umDySvU0ZNtVyqZui6IVBjjkMnZuIzlBJkUletg7stoM2NHMeNUW+Bf
         fD3g==
X-Forwarded-Encrypted: i=1; AFNElJ+ctUVscOqUv5i7bbYw/jM2W3v1Wh6E+wG/UUpwU+jOGW5o633y6eva5qnrVsi5ip9SGqw23Q9y1ssvTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwT8DiC9Is2PUhwhH+Qd4ue+TlledlOV8utzzTS8V44yrUOgkOX
	FlpJ2tcxPt4cGsSqaGmieVtPnYSZWlx23a8zqo43B+DNAe8fCHrTGmqEIZaNlPtnYpvu58frmlH
	X8lsYYqCMzBidzTvsd5xIxlTn0fsZQeT+odZkT4/jKeg39BFqvGGOBL153+1WW+W7yA==
X-Gm-Gg: AfdE7cllI3MWYQ7cGpGqWkqkPaC0ejHJr5CLmuQSnJeWBZjiF5tYL/51ADzO+ZrOC9l
	Sxp+BlkmOrapmGO+9WLmI6FIVh7gJoVeMuvxWytVCcRd2bkzm6BMJ9VuqPMtdv9a/d3kT4P+MWL
	b/bGQ7WEBiZY2p7JijXZxd6xG6KL7hb0U64o0Yw5XZnY/Spny0D18N89N/f954RLaZrMYtW2p3E
	nUbpCguECxETzfZrpYisrEF8SK32V4F8NFqV1kNuYgsXbfTIX5GxTQzY6hkLUUkT2Hfc5Iaze8A
	y2GbnqFg9L/crnQF6N2QmDl9casjJXIbongL/+Xkm+BgOfvPyOIhg1BAf1AMjP2Mqd7gLtwwwPM
	WYXXlp04VS7kOxA1xNSInmlkSAWTOyqjysu2M0Tih4/ODxw==
X-Received: by 2002:a05:620a:4808:b0:915:aad5:e961 with SMTP id af79cd13be357-92644cf4c21mr1431681385a.19.1782335328442;
        Wed, 24 Jun 2026 14:08:48 -0700 (PDT)
X-Received: by 2002:a05:620a:4808:b0:915:aad5:e961 with SMTP id af79cd13be357-92644cf4c21mr1431676085a.19.1782335327986;
        Wed, 24 Jun 2026 14:08:47 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:91ef:5c1f:e854:38f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1e840efdsm9455767f8f.5.2026.06.24.14.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 14:08:47 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v1 3/3] arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin and charging sensors
Date: Wed, 24 Jun 2026 23:08:25 +0200
Message-ID: <20260624210825.264454-4-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
References: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE3NyBTYWx0ZWRfX9HvOJ154srbJ
 rbBgGCww2JBRQdkpjcEqK0sXHOkqoxwVS/cFGQQZ1wySj63jmRd+AVPSJVvC1NciWbTYmxr50L9
 N2rMQqjjpPf8GFvPyRI82WDfrjrqcuN8sXVbYf5VRGzqmH/FS2v9n5Mnkm6FjdVlWO6C06tkl+N
 ZmsD+uUc5bHSvqbV3N87xp1Zi+yaZABDy9uOBiVDAzthRhB7IS0lGwI1fS1bH3IcuwgwWa01fG3
 o87nvmIKBlzCzWnrSJWX9Xk/Wjnu+3oB/VGDVQnNkZqU0Av5sb7+q2K5quXgK48asvRLYFMHylU
 Jv8DayUrfIKQQvqubuGBWXNUxIvk7IAMUTQ0IF5u54GUiHGNM5iCqjDxUKzNmctdCOrZQs979DJ
 TZZxG4ZP6YO5jlSkEtP4rF9Jd889bAeM7PTIhOPjOiC3zaT4JIgYOXu1d+gqXT/cVal3GM2vwci
 8jDML66yGu25dtfOX7w==
X-Proofpoint-ORIG-GUID: OSeo806d2ZfcJv1S1lnaLqNnQBCoMKP9
X-Authority-Analysis: v=2.4 cv=ZM7nX37b c=1 sm=1 tr=0 ts=6a3c4761 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=MYPoBHUstc7QsOuohHEA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: OSeo806d2ZfcJv1S1lnaLqNnQBCoMKP9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE3NyBTYWx0ZWRfX511wJqMbRh6s
 xrUuKw7wL/gddvZjjrLmLUrKHk1mZUsUSBtHh1/KSrBmRbvX3d7z82BCKCzweQJ2X3+BemefJgH
 Z7lsd05qIM2xt9zrSjAE+wBjOGVvkpQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240177

Add thermal zone descriptions for the keyboard skin temperature and
battery charging circuitry sensors exposed by the embedded controller.

Expose the EC as a thermal sensor provider and define two thermal zones
using the temperatures reported by the EC:

  - a keyboard skin temperature zone with passive and hot trip points,
  - a charging circuitry temperature zone with multiple passive trip
    points and CPU frequency mitigation levels.

The charging thermal zone progressively throttles the different CPU
clusters as the charging circuitry temperature rises and triggers a hot
condition at the highest trip point.

This provides thermal framework integration for the EC temperature
sensors and enables platform thermal management through standard thermal
zone definitions.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 68 ++++++++++++++++++-
 1 file changed, 67 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 5d49df41be02..e27533665c8d 100644
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
+		polling-delay = <5000>;
+		polling-delay-passive = <2000>;
+
+		thermal-sensors = <&ec 3>;
+
+		trips {
+			psv0: trip-point0 {
+				temperature = <55000>;
+				hysteresis = <0>;
+				type = "passive";
+			};
+
+			alert0: trip-point1 {
+				temperature = <63000>;
+				hysteresis = <0>;
+				type = "hot";
+			};
+		};
+
+		cooling-maps {
+			map0 {
+				trip = <&psv0>;
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
+
+			};
+		};
+
+	};
+};
-- 
2.53.0

