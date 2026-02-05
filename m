Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B57330313
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Feb 2026 21:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770326101; cv=none; b=TX1kBw7uj76Y0rtQ7bKaN+5Rc/Eu1N5Pywh5pnaJPUH4jxozHwj6FMuPw7HsE+wifQeYkI7fu2l+7FgkTYSDkEiQoIb1QBC678/CvI2rdc0/fz8rHwAoK+9FqdnjMx7TR4DKtW7Y/zt4IJ3fOy231PMR6Pv2CZ91zzT1/QXplGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770326101; c=relaxed/simple;
	bh=18R0qSSv07h1ngKxwt+H3ZLCr9zg7hRw+iZuIcr5Ibk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cOptey4DGKGHH29PoHfTGH8lVHlQpzPE7oJZOJcsWJKkU0sw2cDzTCm8HO2eCe66ChgQ43KrslooVWU769j2QBc7c1V2qa1RIjfpyGHXxg89uPXFzsCbM9sFpASsKnjaDY810Nuuxbkmqy89V1C0UpVG8bQ3NFFEuUf3zIvomuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JtrnWW7Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vfy/Ch/H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JtrnWW7Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vfy/Ch/H"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615KqrE91785568
	for <linux-hwmon@vger.kernel.org>; Thu, 5 Feb 2026 21:15:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UQOtBM57MmbHKjqpxUnky/tx6UI1uoodjbjNK5Q954A=; b=JtrnWW7Q9J3r7gWi
	R1LtMDcJTD0gMBH+7TBCv99FlO4j6sNKFyY83T+vUfXhNHWG/0qtXG3LoucScBzc
	7IUdswZ9vdUwJGBkl9brcIxWP/MidGAZdcxuafqj5xIi7oJBd5+yOcDMsZCARTNM
	MMPIA181npNTYsblVrkRunBHyKHGqG+UzpF+YTVQJ/AmDL0KInXeXC2WcQ0l62OJ
	qjHZd6CWxm+gL+d+DWACbZO8QjZuvR8o1/6TkuOzcusqD5Ug5M/2v5JJU7MsWXN+
	6rs8NTsqgOuW1xvIy6wfUcHa+EvDEQIHYIpsBkeiaQ4Xbmm6SZoQ8ctorr4bcn2c
	BWnMFQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c52mrg1sy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Thu, 05 Feb 2026 21:15:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34e70e2e363so1318989a91.1
        for <linux-hwmon@vger.kernel.org>; Thu, 05 Feb 2026 13:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770326100; x=1770930900; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UQOtBM57MmbHKjqpxUnky/tx6UI1uoodjbjNK5Q954A=;
        b=Vfy/Ch/HSldUADnxLfEfjr7M84tULJqDaarRsPcPcSZlEeqIJdAlORB+KPDk1ibqOX
         vjaHVN+dpIELLAzLPElHBF5x0I0MVfwKFA6qkjAklwL5CwVFbxBjn5SFri+1aQ+ED9IB
         rfxNUVc79LTqyN49q1vBl0JBRbCbvaJtQ3kbSOSBltteW2WEW1wCz1xXU8QLiItCDjGD
         gQBX55/RQ5ctX3jInmBXumz79ncNhToux7bDjwOt7mgs/1yWX2N10r8HerkTbbnk1zhi
         ve4wsuWOe4qWADF6Yrkw9MpzlsKopA9GzQNtUoGPouUCWLxFwz6PctQVddYkdVIM3UIZ
         KFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770326100; x=1770930900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UQOtBM57MmbHKjqpxUnky/tx6UI1uoodjbjNK5Q954A=;
        b=MctiNqQBIeL4a0RdjIzMES4Zes8Oe2fVH7Dk/ngBiOsMUysjWBdijjCHVxrejc9Gm0
         /iORv1SibdulRO0u+cr4In/qQF48Rm34W46CfqSP4h1kNld0CI5JRa6noh3pmU9WHPEW
         2wuNT1kayMBrXNzjnMOmFKdSSNejDLLKfdJkdCKUw1vgBM4/oxLfQb3siz2c4ylX0Fql
         uxLhzKn/FYJGotThPGw+YC9oiXCtB4BuhMY/zVDyIQ1wbY+cxfbQAFi6ycGewTHC8uqc
         X8NbKavp+QxJ4d/zxLXPDzFk1A272CrWLVVH0YzTUyobDB6VQxMhaHVunDfrDTBvB5RH
         XiDw==
X-Gm-Message-State: AOJu0YzFHR0yrV4R3ODQQk+m9WQ9c55ItyT4ya7CHqeMaRQti8zsYwDe
	8+rjOaBEhkpzNbQTbFR+Vs4Q7SOVT7mleiUwrlOHvGWM2msuzX7ytYvi6VYTT/GcMQm6OsAEffU
	0yK+ugQSgA4/a6TP7rYFca1pmy6W6n8dsUz6QpbSPl1wBpmtYayUN5E8t3oSVBGr90A==
X-Gm-Gg: AZuq6aKpOoGPylWehlTOxtKom1mYkMiuKB/cEO7j+hfYEmykmbaz6NKlcrEXI/HGhKR
	Sx8xBkNOUa0qTPxhs16wPgxWEOKRVij9RRJMRNE4pguU9R0J+gU2mEES/v2yzTsVDJJkFQOadv/
	WeaQGRDYZ6aRzM8wEhckTv2pvPBWtpR2etQq4ZVs8SUBq0mHsb8dm1Q/Qj1tcTi8jvhIT6ooN/r
	UCAKHZPlSmidaCymGlU9efzdBvYpZB6wKsifhxjk5LWR+IFRa2zurzSBMG1BHrI+apobFDeY2ah
	+3bqXc9vo61dAhS9ZaR9U12PaRnHJewB13hs1gIaQ3p1b69z6dT/cSReCi67+GbtZuw9kij225l
	9sm/xUNHKsZ9lafqn4J8xTvVK3idrTI3a9A0xatr90MyA
X-Received: by 2002:a17:90b:2d90:b0:353:3f04:1b78 with SMTP id 98e67ed59e1d1-354b3b9231bmr322385a91.4.1770326100099;
        Thu, 05 Feb 2026 13:15:00 -0800 (PST)
X-Received: by 2002:a17:90b:2d90:b0:353:3f04:1b78 with SMTP id 98e67ed59e1d1-354b3b9231bmr322356a91.4.1770326099555;
        Thu, 05 Feb 2026 13:14:59 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354b4575897sm74536a91.3.2026.02.05.13.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:14:59 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Fri, 06 Feb 2026 02:44:05 +0530
Subject: [PATCH 1/4] dt-bindings: hwmon: Add qcom,bcl-hwmon yaml bindings
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-qcom-bcl-hwmon-v1-1-7b426f0b77a1@oss.qualcomm.com>
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
In-Reply-To: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, amit.kucheria@oss.qualcomm.com,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770326090; l=4403;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=18R0qSSv07h1ngKxwt+H3ZLCr9zg7hRw+iZuIcr5Ibk=;
 b=ct2Lcman2D0ijp3O2OBhtI+OgvAyZBiLSBSefKZ8v49MDF28mLbLlJVF12iQxzg9g4BFKiJZv
 koTFoi0akIxCPTJhN0EQjFLTlTtDwIWl9bnXxb4j2kKcU4WPdG71E6k
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDE2MSBTYWx0ZWRfX2GuIivrDLBgA
 8m+ItoGdSIn2I8mWeAJO9+UNE+mbnKbYKjuqO7cXhz8uXZIBkorOA+MI88sEE6eVyukaGSq+1Jx
 H1mjwgbpw3Q/T8wg0BbcfB/duH/EFsOjOO5rNt0XcBbU2TvI/YGKhAk+G5R1LYfIP564pAZQmAy
 2G9uJUJ9K4c6snnVEI5LREh0Ov6zZmmkY0nzdKycBzlIIz5XLnRYCjdmR0iIm7WhmmDdu9RyvhT
 1jibjpxuIFdW4c2ObFQZJxzCHUzCEWqfOwbPLynN5E56SY7EhF5160JBkvExX82VCcoJWwKaeOv
 1ObNn5BygXkJS8sIGcej0lwmwtpBDCUrNkzbTRUJW7x5xclJjv7ZLLOHNX3j9yc3uxKqIQSuvjW
 0y4HLXgzvly2bBbGuHq/kst00gqy3TzbWmtHOVsgloWF0MICzPJBTeSE5jBtN0AJ4XBrF+WwVa7
 PQLJALpKw5WzmpEGKlg==
X-Proofpoint-GUID: N6NrcJvnp7IW5zaGmy_tYfaIaObaXbPC
X-Authority-Analysis: v=2.4 cv=e4kLiKp/ c=1 sm=1 tr=0 ts=69850854 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=cA4Dq2qPJpiW46iHo-AA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: N6NrcJvnp7IW5zaGmy_tYfaIaObaXbPC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1011 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050161

Add devicetree binding documentation for Qualcomm PMIC Battery Current
Limiting (BCL) hardware monitor. The BCL hardware provides monitoring
and alarm functionality for battery overcurrent and battery/system
under voltage conditions.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 .../devicetree/bindings/hwmon/qcom,bcl-hwmon.yaml  | 128 +++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/qcom,bcl-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/qcom,bcl-hwmon.yaml
new file mode 100644
index 000000000000..a0e8eaf13eec
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/qcom,bcl-hwmon.yaml
@@ -0,0 +1,128 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/qcom,bcl-hwmon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SPMI PMIC Battery Current Limiting (BCL) Hardware Monitor
+
+maintainers:
+  - Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
+
+description: |
+  SPMI PMIC Battery Current Limiting (BCL) hardware provides monitoring and
+  alarm functionality for battery overcurrent and battery or system under
+  voltage conditions. It monitors battery voltage and current, and
+  can trigger interrupts when configurable thresholds are exceeded.
+
+properties:
+  compatible:
+    oneOf:
+      - description: v1 based BCL
+        items:
+          - enum:
+              - qcom,pm7250b-bcl
+              - qcom,pm8250b-bcl
+          - const: qcom,bcl-v1
+
+      - description: v2 based BCL
+        items:
+          - enum:
+              - qcom,pm8350b-bcl
+              - qcom,pm8350c-bcl
+          - const: qcom,bcl-v2
+
+      - description: v3 bmx based BCL
+        items:
+          - enum:
+              - qcom,pm8550b-bcl
+              - qcom,pm7550ba-bcl
+          - const: qcom,bcl-v3-bmx
+
+      - description: v3 core based BCL
+        items:
+          - enum:
+              - qcom,pm8550-bc0l
+              - qcom,pm7550-bcl
+          - const: qcom,bcl-v3-core
+
+      - description: v3 wb based BCL
+        items:
+          - enum:
+              - qcom,pmw5100-bcl
+          - const: qcom,bcl-v3-wb
+
+      - description: v4 bmx based BCL
+        items:
+          - enum:
+              - qcom,pmih010-bcl
+          - const: qcom,bcl-v4-bmx
+
+      - description: v4 bmx with different scale based BCL
+        items:
+          - enum:
+              - qcom,pmv010-bcl
+          - const: qcom,bcl-v4-pmv010
+
+      - description: v4 core based BCL
+        items:
+          - enum:
+              - qcom,pmh010-bcl
+          - const: qcom,bcl-v4-core
+
+      - description: v4 wb based BCL
+        items:
+          - enum:
+              - qcom,pmw6100-bcl
+          - const: qcom,bcl-v4-wb
+
+  reg:
+    maxItems: 1
+    description: BCL base address in the SPMI PMIC register map
+
+  interrupts:
+    minItems: 2
+    maxItems: 2
+    description:
+      BCL alarm interrupts for different threshold levels
+
+  interrupt-names:
+    items:
+      - const: bcl-max-min
+      - const: bcl-critical
+
+  overcurrent-thresholds-milliamp:
+    description:
+      Current thresholds in milliamperes for the two configurable current
+      alarm levels (max and critical). These values are used to override
+      default thresholds if a platform has different battery ocp specification.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 2
+    maxItems: 2
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pmic {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        bcl@1d00 {
+            compatible = "qcom,pm7250b-bcl", "qcom,bcl-v1";
+            reg = <0x1d00>;
+            interrupts = <0x2 0x1d 0x0 IRQ_TYPE_EDGE_RISING>,
+                         <0x2 0x1d 0x1 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "bcl-max-min",
+                              "bcl-critical";
+            overcurrent-thresholds-milliamp = <5500 6000>;
+        };
+    };

-- 
2.43.0

