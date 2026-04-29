Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88C3402B9D
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 16:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777479308; cv=none; b=FM0s6qSC+gE9sdMnzPWPMzmL9096ptEiGDBIzdo1xKD71kBNGRN4xcRnq8Y6av1dbkcTmWkBCwyMoEma3cXma5KavlfMwM8w8SIoyGpZ37CfCqliPb6dH8H5mCmAakyjNfWCZOtakXC89Vv1bFu47WlZdxURUXgvsmwtG8uDDr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777479308; c=relaxed/simple;
	bh=0hqwleN+hGYWOPBNiXuqMAKygpx6yIPIDHS/duN9w3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tc7vzwA/zr+ybOq5nwqhn7d35mC2YZ/bGBYQB8J7y6GeNxWsBue/uHNP6/wKF2CQl2oVlGl0XiSMQvI1PZcHHmXd37fsdCb4cK8VyksHpWgat5VcebSljprm0yE5wNxey5R3oaZXTMxSybPWo3c77OVrD4cH/Sydzk6wvxZIDco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R9WDmL0b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a4oYuKGB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R9WDmL0b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a4oYuKGB"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TF7UOm1641654
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 16:15:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WKIGIXDHh9X
	0RP427er22w6scCsGhci8yorv+QWR6Ao=; b=R9WDmL0b7l2UUA9WUXk12qBecj3
	Zqzn+0RElZ5Wr2DDnRGDSVg7WZ/D0T0tBvW05yY+/1G7bW+nP6HEg7Tta+T7T/lq
	6McZmPRf48leve06DYPIE2OaM3JmoXwQPIA+pHUdmryKfzwp4Oje3h+7XKirv5lw
	oVShu2SuQfkbDkJMqyquhBl6oIjzbPydjdiLvQJ5iXNJRUD1OaxyPF5wARasplPL
	g6LLTicWm2HLI/MiPkJW0sErqbOdPhFAJlq9ATiWkRmKVGXyH56LjHgvWSentj7g
	vQmvnLSwworO/R5eFrnmfwxbKM/jbssDzQi2NOtMJ/xzz0BqvzD7uDMUdpQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ducj82df2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 16:15:02 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56f6e1969c8so17084172e0c.1
        for <linux-hwmon@vger.kernel.org>; Wed, 29 Apr 2026 09:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777479302; x=1778084102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WKIGIXDHh9X0RP427er22w6scCsGhci8yorv+QWR6Ao=;
        b=a4oYuKGBmXF1uRqqrstJNCP3emZgqeJxncTiG0qs1UCRLswj2TCvgvyLVxGn/Tfz8f
         XEAZMdHNigfzpH7Sbhpz+DAjZjXcVXDURViIIIcmvvXm3LjGX3Yb5PHUC4mZ87XQKF88
         y8vml3uSZzyNW9qLpFVhicpVfCAsCVz7DM/7U/IKeIahoT6Y0mK1Oyqf1uAhw5equ6np
         CpnaqOWx8I98ybEqXEZea+zvGaheiCNqhBCyfgz9XQYPiHViSX4L+3EgzHpxfyTTdTzt
         +bKolGP24ZbBXL5ovK3N/N/VWKAFxIFigpUU2CqDaubg2q05cZXvwCIq0qkMkr1md22x
         ekjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777479302; x=1778084102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WKIGIXDHh9X0RP427er22w6scCsGhci8yorv+QWR6Ao=;
        b=OnkwIzXKdXJ3SZNEdnpVKwuSGmDXJMwYYnBCioUzZuqQHN2DbXKFfN31kjJs3LAuNP
         LxmXOncPSMjcJuin8nFtjBW5/OxTo0xcN0W71zBEx7Undun1HYweOTjSoHmGfPWp3ZuO
         8q7rwlck+KingOEZoVImF8UTpDbFXFFrggktV2FfbiNyMClhF1jJzwx6+KMNIpOgoRLm
         iTpVBX3xGcKJyeMUrklg+PUQ67p2ha6j8bbNOdP0QSVYt7T5Rs/iXgY60C2brpuR1Sxi
         FTkwxqmCstm5aaAzEtbkmPptZ1raSSl7L59jXSyiXOv/gyh6uyognhD5okCB8WMKXBMI
         dVJg==
X-Forwarded-Encrypted: i=1; AFNElJ8vJyAHTXefDHLgmU2EzRY7dh0gMWRnbqM0hTpVEMUFBckfW/xuvM/8Mv7jcGuLx0LWBYi82T/WDr3NIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMdRq38+VJwGU8vCdiF/uomFqkyLc0fIdW2itn17KQYVSRqcw4
	1Nta8nx95Qm0mvsfKO6DDW5spCATzYCTpMXBREiunqdMeWtd8/Aj//eet9yiGAMZTzzuO2FJ3bc
	8uYYl/KRUlXav0c2JAdH2/Zp4IarBTNOo8aCEwSHb9KS0RQAfqqegKTu0bOcSssQJTQ==
X-Gm-Gg: AeBDieujLKh1R/VntSgAy2amYJB25BWPj+UJlwKnKwdBtJEUFmV3KJfDRE2xy/qfvR8
	A4IlUYddS4n/d2++pihKW+udhec0g977OBiIBxmqkhp3YXfaq6xZFnema6+noTRFg51mRveeBbc
	JH3NLMkjjgApUGxdqwsZRbkUoiLnJs5HlPgvYBDdVOJ1LGdFc6M+e3jKOa1c8VDBN6H5lkrcO4O
	cbbM9qkdDT7veZruHASUH0cfogm76P5OFqw58CaBZmPz8iHNyaoy6xG+ghDAkQrHxDExESp2KdI
	cVRUGmVhCDRGuuK1yqkf6sLanvFde5MUmASyVSo8+rXaHSPEdl9W0rCe9urPLC4ZjF5xL8vbCc7
	V+/t+WZ9LBfg9AbfaaE3St6lIOSBAtyVrdlaijLJdsoF2H8XunL9XbjvZKMXC
X-Received: by 2002:a05:6122:45a5:b0:56b:815c:961d with SMTP id 71dfb90a1353d-573a5580601mr4806227e0c.5.1777479301571;
        Wed, 29 Apr 2026 09:15:01 -0700 (PDT)
X-Received: by 2002:a05:6122:45a5:b0:56b:815c:961d with SMTP id 71dfb90a1353d-573a5580601mr4806128e0c.5.1777479301015;
        Wed, 29 Apr 2026 09:15:01 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed659dsm2438525e9.2.2026.04.29.09.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 09:15:00 -0700 (PDT)
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Subject: [PATCH v3 11/11] dt-bindings: thermal: cooling-devices: Update support for 3 cells cooling device
Date: Wed, 29 Apr 2026 18:14:24 +0200
Message-ID: <20260429161430.3802970-12-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429161430.3802970-1-daniel.lezcano@oss.qualcomm.com>
References: <20260429161430.3802970-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 78Kl6ZTi5T5kXO_lzbFqIbPnKR8rTpV2
X-Authority-Analysis: v=2.4 cv=RI6D2Yi+ c=1 sm=1 tr=0 ts=69f22e86 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=WD-cMf_r4H3F8z8mj00A:9
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: 78Kl6ZTi5T5kXO_lzbFqIbPnKR8rTpV2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE2MiBTYWx0ZWRfX7Etu6uAxTtqO
 zxHRmDavcg7tCsWLhrEadl4SEiUf7GV7JIIz++PXhIiRROS8PW2E5BF9w4sSx+iwb99DyyPX1TV
 xb0UlUXpAsn0eeATyZLYnsOyNMNXhnCwwUCGnIFUiN8B3oDfcwwV46YkAKm1dXt+IKhgwFgTC03
 Z4um97eFDSS7T6dvWgDl9RMTphpUgHPdpNKeqFRdYoKyIKZ/aw6i59N8iAkpPx2HdrgOV87q8A3
 2MVu+NO1NAOgcPYPazXfuqC0GwI+IHSfiFweY4cg+Qw/5Jo4iBC/LJdMYgVVBZxtC0Bf2/BiUt5
 hF05mUwI6pyAOSKfQzM2cLtzMBj0TCDOLrjD10t+p4PVS0X2e6hfPchoVpAXFcWVZJhImxrXNM7
 kMmDI86GoLNRq5CGZL4pDCLoj+1kGmRiTP6aR7R/Byu2O8ZBD+QsfT2MVc8zkHFoge6qg2JWwdm
 dZ+VNtfU+7vYlbGvaYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290162

From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

Extend the thermal cooling device binding to support a 3 cells specifier
along with the 2 cells format.

Update #cooling-cells property to enum to support both 2 and 3 arguments.

Fix pwm-fan.yaml to restrict the number of cells to 'const: 2'

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

