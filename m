Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEDC38E5DF
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 17:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776879830; cv=none; b=UkMGRsp46h1GCcgxWFxtOxF6nH8TggMAfvtbMY3jhZTaztoIBo7Rkt7milldgbhmyWunMS+jYsv+/QkpjftmtIhe17NUtgxLPGadVjZJWI120B6wpwxYFYOp8sMBDrDegfd7MR0Rkw/F4TbBwUP9u1pdsRcPEMGKO5tsRMl+PN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776879830; c=relaxed/simple;
	bh=dm5uSfZjDOFedpZSNeguOS6u06pJ3ye7oJgRqKLiuCU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L0XbLOVQjdt50RVtBpNw3Q6y73MHu4E3yJFbhNyfVKAxqXspuQ40vhOSLcgVOxxqJgDUEieMOGaPtuKjpdeBM01ADaz/SS7kDaorWs7Q3v8mP5qtnS6oXFPuHhT4SMTiBk83FJhxnnZCsTwxgTfOTO+s4jSXt5J99hrKx5na8Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TU01v89I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XGiY2FSN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TU01v89I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XGiY2FSN"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MGqYf21218418
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 17:43:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Fwn1gPn1dWg
	exJELw0pYUIt7mZC6V4jRPi84i0yHT1w=; b=TU01v89IQIabdiSY5iA1uoB9Czk
	tZs1gHp7BPuNH27VG1i95qUUPrmNi5byDdwajUk7Y7gX0Y/DWC9XtGFlQ2w8B6l9
	9FAPzABojzxLEGVACSfNPAY3lNRLQM717cKNkAJS111fYH3Dj/kH/nxJle0rcwoA
	FJV3xP4E7oy65WdxhkCCwEr8CbOf2x6ae58LZoNk+t96T/iCIxmIweZrDHUxffFG
	WyC0MU5UucslyL+EqconSBCeBLoIOxK3rWhTIXIHWMxJW9r/IXNl0EQqUfAXu+uZ
	IpA/azVOeqZ9yc8R0XIK9R5anVm/A1oSs7kcpRjcZXPqgzv6aQXRPye3MqQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq282r5v3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 17:43:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fbc70cfbdso43689351cf.2
        for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 10:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776879828; x=1777484628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fwn1gPn1dWgexJELw0pYUIt7mZC6V4jRPi84i0yHT1w=;
        b=XGiY2FSNuIC6E8H0rmVyEL9VkCaAyx0jExDFHT2sKP1WGp4S2P87HEwDNqUEaiGgbz
         z+8Kezcm7oC8j0P0KhHg8CWJyM15jHST0J3W61hXXtEB2bQZ/fNpLxtPxBnD2LxYGtmF
         oVQjwFKO076KPCsBexTQ3JjFQ53jjrvk+/DVDYzXrahl6EMPW7bFpx/XM7lZVzcKvDoZ
         bLnU7GFid9PlUHmuNzwTOSCwcqtULRkC1kyH1iCxp1RKsSr5AGp4kW8nGG1yP+NJBiLF
         uqequShoi2LfzdQtnp8Zn1pNilU/hT5CoMCUu4oquEolkKZDAcNFqH2RTIkLi27ztAWb
         o7+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776879828; x=1777484628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fwn1gPn1dWgexJELw0pYUIt7mZC6V4jRPi84i0yHT1w=;
        b=HRQBPMikbXMo/NHXMIPzzjyxZz9Jae6mtptGOoD4nKlJAd+qCSoQFSBmLlWynszubn
         QQpPcmAGHeMqqObR6cL3UKY7zA4Lgc3q9CqVrtp/M47Br2ersOdyJ2pgK/5B2gKP+L+w
         4RJ0FJLb8QGmxmtDidy297uUq5XQa8LZOowfxMcNLq7jYUWXW6tBk/IgCN5Dpq/S9PGv
         /0J7rB7Y5c1+JXk3dhS9cQna/xI6++dxkvqxEGvvySdbOm+pjbG/pv1F8P1qS/vAKg3R
         54AJYWlEI1PGjraH4ASG/RO3KYb3EXrpODctGFp6iZ/63b7TWE4lcJEwqqtVa8Df+k5f
         BIZg==
X-Forwarded-Encrypted: i=1; AFNElJ86jACEQiRVO1g8n4qYrs5NFwGEVsV4zhhg03ih6vhvYxyEozkqkc0V7gV/P/EMtBakx2KNK3kLWnv/4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1+5hrioBtlQ/aQZ5sQMcJ8ZGw/v4h2yf2aKObdcyEe5ZXOo0m
	V0VTl1BCwf8quQUGfabE8qlB5h7AoYoQac7Gyl7jOJxMoD0NrsaDfUQNJdu5BMPgSN8CoKr6tfq
	5lsr+I9i0PHh01KZQG9fNps2+1AE0WuwHSuXaMY1k8fa1cxRRqWFA+q7+GgdVgA5qlA==
X-Gm-Gg: AeBDieuftfJ8ZzfFemJAn3kF0URz9xmj8/Hcpq0E5ODmFuNw0Um+Bqqc7FQrOpT/9Zz
	3fVlqTwkNrUCixkRaiAmYlX3wTlyE4u/+Dc9gcJ7WC46ePPt2gKrs33WZrHAEdL92451gT5BZjl
	FVEphcmApju+4T5MlTxUVFrCDNqbQFv+0LShuPeyggwf7GgrcwHsp6e5iaWBeL6QPzVPF1mHceH
	Al0lZtYUpG+WARu30pspbOe/uzQCVf0syhJ0H2f6RbTQQRb2VmqAr/Nd3C1UTx39nfftQERkvHU
	PtH00ErjStrRfVEPB1Ca19NRRjQgsfRizFB27l075TZgtMSs+K4fJQBYmeDTXSkI1Ql0EJ9kEa2
	P2ekWcct9JYS4WGcVn224Ctdcmta4Vj5SDC8v6QbdsigfWc4pq4xqbarD4fs4
X-Received: by 2002:ac8:7f4e:0:b0:50f:9c32:509d with SMTP id d75a77b69052e-50f9c3258b7mr167402071cf.60.1776879827746;
        Wed, 22 Apr 2026 10:43:47 -0700 (PDT)
X-Received: by 2002:ac8:7f4e:0:b0:50f:9c32:509d with SMTP id d75a77b69052e-50f9c3258b7mr167401231cf.60.1776879827142;
        Wed, 22 Apr 2026 10:43:47 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7a051dsm142511965e9.18.2026.04.22.10.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 10:43:46 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org, daniel.lezcano@kernel.org
Cc: gaurav.kohli@oss.qualcomm.com, Zhang Rui <rui.zhang@intel.com>,
        Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Benson Leung <bleung@chromium.org>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Amit Daniel Kachhap <amit.kachhap@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Amit Kucheria <amitk@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Subject: [PATCH v2 12/12] dt-bindings: thermal: cooling-devices: Update support for 3 cells cooling device
Date: Wed, 22 Apr 2026 19:43:01 +0200
Message-ID: <20260422174305.2899095-13-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260422174305.2899095-1-daniel.lezcano@oss.qualcomm.com>
References: <20260422174305.2899095-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE3MSBTYWx0ZWRfX00Xwf9K0tEBv
 LQhjZSxOxXiiXARWEIBD8b83itK52eOuRMuPsYzppYaCLLrGnt6Rxe4eD+cZvzYxIW7MlMVy8G1
 W00RxlKVdl269P6xrGQTiy7HBgIVMnEPgzNbFRa0rdelM+J5EjTs+oJrHNL3C+8vOUSD5Je2+a7
 OV6zqzcmEzLh+XOTvCyMvwHKWiPNOA8/jjJ5DZmp8vCqLwdLXNO6vtZ2w2ljKiV4oLlAQwr3rfg
 9daT+c8da+sNXq4p1/8TNewgPDMXm5PT2ZihHapQIB30yy7q1HzTSIOKPU3/hLxXzZP1e3o1Bgq
 v6B3rSMmJ89ig0mx9IjX+JKt1gfEiBV0av4XKI2i9qFF1QgaxupUEiaS9unrtofeWbdqYNYDohn
 uW+G6mXSt6FDrZghfX629yFqCx4x63zmaSRSpdDxi2uX41VJaaX+jxYeuB+6GPDS6rJ7tZXs+r+
 KhvD1gum9uEJ5z83MeA==
X-Authority-Analysis: v=2.4 cv=Zond7d7G c=1 sm=1 tr=0 ts=69e908d4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=WTFSsL86A86x8GNmHn4A:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: hG7oeF8UaDW2m5ZAM7QJjnCoc-d0EmTt
X-Proofpoint-ORIG-GUID: hG7oeF8UaDW2m5ZAM7QJjnCoc-d0EmTt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220171

From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

Extend the thermal cooling device binding to support a 3 cells specifier
along with the 2 cells format.

Update #cooling-cells property to enum to support both 2 and 3 arguments.

Fix pwm-fan.yaml to restrict the number of cells to 'const: 2'

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/hwmon/pwm-fan.yaml      | 3 ++-
 .../bindings/thermal/thermal-cooling-devices.yaml         | 8 ++++++--
 .../devicetree/bindings/thermal/thermal-zones.yaml        | 3 ++-
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
index a84cc3a4cfdc..6a24851fd80d 100644
--- a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
@@ -63,7 +63,8 @@ properties:
     description: The PWM that is used to control the fan.
     maxItems: 1
 
-  "#cooling-cells": true
+  "#cooling-cells":
+    const: 2
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml b/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml
index b9022f1613d8..28f5818f1e60 100644
--- a/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml
+++ b/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml
@@ -44,10 +44,14 @@ select: true
 properties:
   "#cooling-cells":
     description:
-      Must be 2, in order to specify minimum and maximum cooling state used in
+      Must be 2 or 3. If 2, specifies minimum and maximum cooling state used in
       the cooling-maps reference. The first cell is the minimum cooling state
       and the second cell is the maximum cooling state requested.
-    const: 2
+      If 3, the first cell specifies the thermal mitigation device specifier
+      index for devices that support multiple thermal mitigation mechanisms.
+      The two other cells are respectively the minimum cooling state and the
+      maximum cooling state.
+    enum: [2, 3]
 
 additionalProperties: true
 
diff --git a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
index 0de0a9757ccc..1261ba0e802e 100644
--- a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
+++ b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
@@ -214,7 +214,8 @@ patternProperties:
                   device. Using the THERMAL_NO_LIMIT (-1UL) constant in the
                   cooling-device phandle limit specifier lets the framework
                   use the minimum and maximum cooling state for that cooling
-                  device automatically.
+                  device automatically. If three arguments are specified,
+                  the first argument is the cooling device specifier.
 
               contribution:
                 $ref: /schemas/types.yaml#/definitions/uint32
-- 
2.43.0

