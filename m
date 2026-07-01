Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37180410D26
	for <linux-hwmon@vger.kernel.org>; Wed,  1 Jul 2026 10:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782902247; cv=none; b=WhKVy5pyFIs+NZMXNbRzKJPtJ+deDnSUn5RUbazMZhANcK6/i6wNQPsb3Ouob1/ofD7B//024L+kN3t9cLLOq8FMoxJTh9TwkHZYcLHuI0lmiZ1HTrmvz0wudorFQ7qPjVxqpn7h4/QEq8yGcAGvVb+/cozQt4K37lgLbklnzpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782902247; c=relaxed/simple;
	bh=C8blcHMIMkUn8SxjVlVqBB/iskindoTdj+2JO6WJc0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LNWGbVsX2UppiHSzTW3IpjDU7TPBK31J77B2EP2Lm1uC+naNobW9m6aYDPxcWWn+Z3hsJn6dGouAdDiWo2wjrkX6BV8fN/PMzTPKFnHlz3q8UuGElngDszQAQjvGOX4B6eZw8ezW49v70fDwVnNJswObtp7LUb2FyxZje5BRBN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tb8Dtrb6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eZhLaOnu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tb8Dtrb6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eZhLaOnu"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8ija681747
	for <linux-hwmon@vger.kernel.org>; Wed, 1 Jul 2026 10:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kPPkjSCNo09
	SDo/Pz7px6sAVk8X5RZ6B8/0fd1li7qE=; b=Tb8Dtrb6mHmHsu/O4P7ZHbfvIfv
	3H6oPUX9iYO1v+C0s4Qilq1y0kw9OWhssBP1mCJak52VPfUv/2WPmkrhOn8wFdjF
	TclKgtcw2qIsGGHPQYox7ip5gBik9tV1Ewyr/7Yo3Mdb4G9uRdiNLKcK6zfbty82
	fQV3bABk94a3Nc4STZPBuGdA2rlCOBYrkdXQ73MpYEtu3Oq7UbzBLqz66aahoRg0
	4SJOzmECF6wr2JcD53JClb1x55yw8ibYSyynFNMhTu19ZVFqzao+MQ6PYXZhj+jq
	tOw/LqEDBULu2250ICK1X7TLr+/JKZRfXn40Itx4LjJ2mL6QbnE/Nh6t1+g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4k3skq1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 01 Jul 2026 10:37:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e55f0613cso47937585a.3
        for <linux-hwmon@vger.kernel.org>; Wed, 01 Jul 2026 03:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782902241; x=1783507041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kPPkjSCNo09SDo/Pz7px6sAVk8X5RZ6B8/0fd1li7qE=;
        b=eZhLaOnuiXAUZY/x51WXGglACkjKJdbbjqri6Z70RhHi45zUcwaZgNH64Z4bY5cOol
         +y/VRmCfViRRlk/VyicEqjEO2bs0bqVdMsBP4EXJSikA6fwz13g5dq8bNBGClAJFHWch
         HokZD9EQskrJr5Q5aD6kGJQBs9o3aRll65pepvGNgWb4EcYS2/ZrEoaljQrjWcI08Ou/
         NNi0V4bdmUcarkrqGt9nyhP/Q+znDjwwSHq49UNlQ43hOysmoPqZuhFpRGs7mtMul/pz
         58QGx/3S1qXNAEBXiPQ3Ai8ojgoTlzQ1WmqHYDiQPWVr2AF8M7I4E6cUUh2cK50CSDcm
         GGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782902241; x=1783507041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kPPkjSCNo09SDo/Pz7px6sAVk8X5RZ6B8/0fd1li7qE=;
        b=DWJznjlUeEAe3BddNKKmVIPPTSD+XgSl8BOi0AmrQPPviK3Dc2TDwrpdpwjxNfOuOh
         UboqSUyu1c0RsKNEPmpBN5GpFNiyYX7fKVGpyFRDzNlzCjOOobmbfSIThUn5FQm0ja+H
         hgkYr0StzzmEdizc4CdBuSetKXkbQrDvlrouVcknUg3Qu+5d+jbkyBlzjw7GokMrGkqY
         ouW54gZecIhFyJNyxErPX9VM4SnfcKZFLtZnLZyUMkFyfNp7xmUmd7zWbRlxIF3AkMFr
         FJszVkZKWMKkhchaVKOTr1N9B7xwIMRHYHruyBVgoxHAfzPV4BtYAzXeq9a09kyNpOYp
         l9Lw==
X-Forwarded-Encrypted: i=1; AFNElJ+rwscndEZzG5PkTZVvEScUgiZJ+X3+SbxS08hVESFEGO+zlRIeYNa9qFR9R+QaCNhdx978Jj2pKkLdhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlMxCT9fIftqO1NswIiDXpkkRX0V5cwv2r/c5PN8bToK+vjlav
	VastAcHH2fPNctZBJYE1112nvhAFvapyYllTMAnvZ6xzztuJG7tEkvKhcJ1lwBFwRZp32HAcF8H
	LJNO+WZmHY7A+Wf+fb+r3MDDdN/wSU8f9lYWWDMUtokEtQySiaNt/EhDKcVCsp3YhIA==
X-Gm-Gg: AfdE7cmDb2I+2rmSS65l+eJ+Xm9/l/RghRhJBi6mwJCXuhRsQLt3jSDAYC8fXuZAxWs
	+33YhqNN3ajuX7FFeBp5ulK9u8h+P601uosrcUg5u/ngFlHubl7br566wDsnXulOaK47QeOqrOq
	vIU4k8M7T0plCp77FxZs/iWAgpdZEPLX2EpqrEUj2G6TVa/yecH9og9+VMryhZnLvJkzmprHcmy
	c3/agEF+fkJGnvhvX5lkc1IS/CHDNciOtDMJDW/tlgdhPc6eEK2aItDqcJtmvVOFTW/OJ1REm+u
	BpzQmK1MpMZVxYde60PMj7hTSVyNHuqHA+ijQBNUoQos7V1WCaUfp/AiA6s8aDLB2AxIBmfpdYJ
	N6iOd+W0DRo58YeGjOjApMqgG1/yY0y0lvCDyx2MKlUc=
X-Received: by 2002:a05:620a:448b:b0:92e:74a5:c70a with SMTP id af79cd13be357-92e7827188emr126747385a.33.1782902241400;
        Wed, 01 Jul 2026 03:37:21 -0700 (PDT)
X-Received: by 2002:a05:620a:448b:b0:92e:74a5:c70a with SMTP id af79cd13be357-92e7827188emr126743585a.33.1782902240831;
        Wed, 01 Jul 2026 03:37:20 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:cab:bdb4:a76b:614])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4d2bc5sm69130655e9.5.2026.07.01.03.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:37:19 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 2/2] arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin and charging sensors
Date: Wed,  1 Jul 2026 12:37:11 +0200
Message-ID: <20260701103714.22583-3-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260701103714.22583-1-daniel.lezcano@oss.qualcomm.com>
References: <20260701103714.22583-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: YdqRHKAinRGLZymth2mQ_FL05cRZ5_wd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExMCBTYWx0ZWRfXywPNsM0cUp0q
 +/H6w4SMXZOT8hMIzFhWVSgNCRioBJj5JBqj+qkPQYfw//f/GgyQcT5l7hs40dPSO9VqUve84+V
 Tu0wyzJyi86MefPlGh62wYygeMvKYHMuJ3ivdBz7F4ynTHGtWVYzojCbKwg+iZHx+MEY538CJxp
 v9fYWUSLrew4pO03t8QIKsja4EpIhzYMu+AbJnkOvWnhfjgM+pnQhOwitFRqfLb1IKoihoO5n1d
 jJIyfcc95UHOX8mycmSFoVgCkBtKKpxtllIU8gyC6M8XMRv/c+9i+Ef8sCT33T0IDFbMFa/W/+0
 2hniMxwWfvu1l3+h/tWcUqDw47bSkxgEdx0sFn5/wwDFPHMfujIfbRvc36ghm97E4mIHBacQnOy
 i97UNJnZ0N14OnUU6zaHQKOyp2SXel+vz7zn8Qi4gIjXzI2Qv/dAFj3s9ReznwqXd6MAPB4pCB+
 wBMr9in5/aebEYJ1WHg==
X-Proofpoint-ORIG-GUID: YdqRHKAinRGLZymth2mQ_FL05cRZ5_wd
X-Authority-Analysis: v=2.4 cv=Ff4HAp+6 c=1 sm=1 tr=0 ts=6a44ede2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=8S540zSUgs8tgqG0LUMA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExMCBTYWx0ZWRfXx0Zxk/8A/kIP
 5iOkuSVc5rG2OVOgIx3F0KiNvIqr7WjfwNOP4d/dqJAplj8CvP9PF5zMCKvBRvSIPfQbAI35WzB
 hVf+M2ybMWI3UgLHp2n6b3jzd4cd03k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010110

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

