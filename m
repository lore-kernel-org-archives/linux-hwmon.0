Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF63B401A21
	for <linux-hwmon@vger.kernel.org>; Tue, 26 May 2026 14:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779804548; cv=none; b=t1kxpa3FXD63nbf82uhkAvO9kirBdnb4UwkhBA6HGuc4vt3Z+5dXcOcGficeSASLUmqWKHq2jVnAxR6ZbotjdnP5KRiDEV554ycushLygp6y3WkoDAT86nMdleTZ42K9mzou2Mj/I/p5rOS22ZpihOwdsOsGFxqtp/enBM6Sdys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779804548; c=relaxed/simple;
	bh=vNBmXUp+qr7T1swL568nvBKihzEO7mn9iQtvdZQjD38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lZ9AAppWnFEpW2SCVnXj7ur+EPhxeORhXRZi3IByazePIWUVnP6suL4UgYbfKoURIaEXVhkSNmIpOz9q4G9fanrdMid9RKMQqqKFhYqa6dz2kNuNliUpFVPYv4D7PxhCp/zmJidvFSQ0Bx0sLCAEqeerEp0GTUv5pnJkhIfGqg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZhqakRQh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eMr6blFe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZhqakRQh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eMr6blFe"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsBGX2554447
	for <linux-hwmon@vger.kernel.org>; Tue, 26 May 2026 14:09:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sRAimFW15YZ
	LFDJYTwa3t/Vg46FcoMMGZciPbr7L3vY=; b=ZhqakRQhVJzpZHKGl6hRcCdCBN4
	jqN9bDL532gO/es5ZfJqGbpVfTTQ11+up4rZ3QUcxWrbMQRm+oP2adaWfOwjwoaD
	LlP+havwX7NM3R94LEqx2h56XjCN9PVzrWQ2uNf+4i62SUvIfbqK0CiG3Bh2orRZ
	4mDDMtGngcPflpTVT3xJJz3QRil+FIYwIJiKDCvn+dRFKGV5SKqUWtHQodOOiCTa
	tKuVIolTsofahIxiR3E8RX6UwMzZP2E2PA+ToaUIQJgcGEv3dUz70z/7Jp2N3U4+
	HPZYaQ4VmF4tMmy1F0GswyQZlvHUA2VxzeS8fdD7Kbpc4MU/knT1pZPrt9g==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5v3t7pa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 26 May 2026 14:09:05 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-69d77736830so8851363eaf.3
        for <linux-hwmon@vger.kernel.org>; Tue, 26 May 2026 07:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779804545; x=1780409345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sRAimFW15YZLFDJYTwa3t/Vg46FcoMMGZciPbr7L3vY=;
        b=eMr6blFes1UPoIeZSNWD13Hc+MXmtJGTYsXXm1g42Nzrlxe1D9BZzhkgpXqztcXio/
         un32IQdLl3/tbtr6KffI2TDTCKQVZL9aqOKjb9FSccCxBvL/y9AZPIKiXQ+EBCTUYmLz
         Z16smRJTqV52Xf4gFzeAgTSt2e+2aWNrq1dDvI/ld+nBkecJQeycNKaizEtJx/48/1x6
         u8jHpgFeJSJ8PXmG4yUWDvHhE1feqnc0+iHCyYxB7xQYsVPurkoR11SV32I4G32dOha0
         3V59uV4q25ogSk9TVuBlDJCIcoS5XCc8ILcdOTwQGoY/sya3CO45//NymGdXsa7O8/bq
         +++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779804545; x=1780409345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sRAimFW15YZLFDJYTwa3t/Vg46FcoMMGZciPbr7L3vY=;
        b=MWLtCIOFbc6Ii7ijlTWPb/1TowIVFHJV2urCNmWlPQvS3IhbRWMk+Knv4FDMHzYyfF
         68nc0KC9IIGje5hmDqTzvjH5z+lRr1LKkRaVRcFGivITesjVWOB4vSYJzki2lbjei0nN
         D6zRqJFGCYuPyQOcKfHDXSuiASXgYXp8wiXGCXqPx7UB7GYLxJ8RpxpPzxAZgmXxprJz
         GXV8IUXBti2iwV40Yga16cweiU6yB9EyhuqrGQK0Fwp06Qir1giYa9lyZcBHmmShBjEw
         7N2Xql793oLJA1CmgjBpGab63ujhSi0cKF8S4Wb5/g2zWaFkggOig8JW9XEDfaBCzntU
         P6Vg==
X-Forwarded-Encrypted: i=1; AFNElJ/8oP+j3qdsiq7uXvh3lSKYNATE4TVgAzV2Hw6k6d9rC+eiffBbNaKU13Ooj4qxbL7xadUMb6zKyAGyVw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo4u59CrRwv1HvTUskFOf6UuqoUyYQ6//+mcOeGimcIXTkIewH
	ltFcZpIWuEGNlHiot+94fFuKJmgTKDuU0nCiz9Dh23ybmvGcDoNGSMTTEgLbFn4l6It3PMiCZp6
	LQ+A5AvgR8UiKolWZ01ApBiLuXy3d0mIEqomGwYnkomnfCbKfkFi6zGW2Rl24yjvZ6Q==
X-Gm-Gg: Acq92OEDIUnM8QgKSTbkCJMLsyMFh0pf/U7dA6RXM0s8zZLUVDH08PqhciPnoXxBjia
	FlUiA0kWspd1nAPzTUgrqRfr03CmLx33baFii7Mb/AH4MlS1Vnsc4xQpHKHueXhDnfNg/230juh
	iPhLq/Lj6Qj2Tug2MIfE0cMJleXlzHJxlqeqhvo3O5UNmsF7vj6zeCh/wiAOiorbWs+qwH4pAP/
	lZj6WckWlj1ZYzegCP21NROACHPbg84W61rW4oRHwVahQHW9whF5FEom72+8Zds1itDpcNoC28/
	EK9S4yYzqd021TF3RSefb9eeZ5u3q0C8nnkAFLls0rccgTt5+8yOHgWUv214B1ptmCmjUScXZMR
	a0ZXUaEGfv+5NPu3DQTM22+IRpPinKAQEVMIki+UCivMFV4fC
X-Received: by 2002:a4a:ec4c:0:b0:69d:7a88:9cde with SMTP id 006d021491bc7-69d7ebd2540mr9712984eaf.26.1779804545082;
        Tue, 26 May 2026 07:09:05 -0700 (PDT)
X-Received: by 2002:a4a:ec4c:0:b0:69d:7a88:9cde with SMTP id 006d021491bc7-69d7ebd2540mr9712950eaf.26.1779804544565;
        Tue, 26 May 2026 07:09:04 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:9e9:6f8d:9f1c:61e1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490424aa561sm156266605e9.5.2026.05.26.07.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:09:03 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org, daniel.lezcano@kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
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
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Subject: [PATCH v4 10/10] dt-bindings: thermal: cooling-devices: Update support for 3 cells cooling device
Date: Tue, 26 May 2026 16:08:11 +0200
Message-ID: <20260526140802.1059293-22-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526140802.1059293-12-daniel.lezcano@oss.qualcomm.com>
References: <20260526140802.1059293-12-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3191; i=daniel.lezcano@oss.qualcomm.com; h=from:subject; bh=5i35tXeB+dh8TrJjTALfDVhxhzQaJ333X0Wv22iwE5E=; b=owEBbQGS/pANAwAIAagyI4oqT+hPAcsmYgBqFalU2waeZFc+uXORaM2nz9oOnxTnFcm8cpWx3 s2FzLBGue2JATMEAAEIAB0WIQQafc3hhXPRY1XIeySoMiOKKk/oTwUCahWpVAAKCRCoMiOKKk/o T5NlB/9QnwbtJvG9goEnxhkDoppxiDPtuCMvxHYkSwAc6LoSwaUAHyacygDloVTTtlYpqGKzaqa /GcKZkZq5pt9AxdsqmYnzP9lj2PMAwiExJuQlFef2O5c54WlnVHLoz/MX+2IrazFsJIui5cVLzD Srr29R4eg5f9IOItjOljWua5gVW5uMxV9NmKNAMt/9sbG9BnW+OixxEiXACIAda9LcAyC1IZqPy VjkIv4vdO7MyYSEBED9wNBF0rcYWoHcrYBZl+EDpC8V9o7Ne34lGP4iC33a1l5Jd3kWPDNfm/8/ TYN+POK8V+qJdA6BNYAXAh/3sq/J0yNtJo+uF5WdN+2gJ18W
X-Developer-Key: i=daniel.lezcano@oss.qualcomm.com; a=openpgp; fpr=24D626F253BE9E87E6CE5BF48FF4B8D271675527
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEyMSBTYWx0ZWRfX5w5uAnm918fk
 CJB5r5gu78p52WuD8dP8vGHUiyK9XFjDJYJYzyXak6JAqi390+dex9oyz/RxcnuhExtIgn2Ybsa
 lWzTJk5KetozPGfrxf9EjfmhA9i9MFfR1zyn7JHIdC5W7/J7yEg32KsBFNalPltVlxWY9Oz70kX
 HMKZRyswO8UJONNxZf7AkUVqCs+EDSe+zA5SCxIIoUBe3fr4TL4P0V5e7PBeg+/AgT8xlNGnNWn
 3okiFigEvC7BnP3MITsp/gejAVM9VTDl/233+KiFT7xs7svSUPneTVMJfX/HPsTxXMQ7esmIvX3
 g0/nTfY6zeLcUlr3P0gOqs4E/iivlNmrDVsLRgKy/AZx2yZ8wUTLoFs1blniXBsV8hqjn/shV9x
 apF53iMP1j3P+5gb6dyCRXLMHJpxz+8GejYxJfCFcdDg02C64TZ/LPlSNt/SXdGOvNzKl0YVh3a
 IV4xux5qKSBekM4bD2g==
X-Authority-Analysis: v=2.4 cv=Zc4t8MVA c=1 sm=1 tr=0 ts=6a15a981 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=WD-cMf_r4H3F8z8mj00A:9
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-ORIG-GUID: GqrJRpHIxPCYVLTdBpzWBAq0FWwzgkaY
X-Proofpoint-GUID: GqrJRpHIxPCYVLTdBpzWBAq0FWwzgkaY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260121

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
index 07d9f576ffe7..999ad40a20d5 100644
--- a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
+++ b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
@@ -211,7 +211,8 @@ patternProperties:
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

