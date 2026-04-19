Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C872F99BD
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Apr 2026 18:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776622984; cv=none; b=ocdo1sNsRsvyAdTihliW5axNlP6P69NxKLdOhk+NAHLxQGc5Ad/3DXVmSQZ1FUkStvubHg9LsXp4qgpSCoCkEJnN/LrUNjdjxcPCDziJLuTpw1oz1i/ZNASH9H23VdTmblITx2rRyBrbYxCWFXKEOz9+LsW/e6qBhDrqktPVDcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776622984; c=relaxed/simple;
	bh=WzntAKrn3SE/S0P6q3sFoaSPnkduyAfvojxfo8h0D/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F0mbB2MwsHYVONBf3nJ0dt7huxXwtB/0mSdrswZ8sLqv41VQwyvIs33s81TtlKzVmBLPEtzLVKM6v9o9N4EtJoJ1bT6tJBMP/5cxjNsXeQaso6xdq1BWL9FoTZjijOVmA85IuU98kb1S3HdPP2XpENckkYTXc5qzk9hlOEQmIB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hgkh6xag; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FBIiOPLQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hgkh6xag";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FBIiOPLQ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63ILj2nV413193
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Apr 2026 18:23:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/O0gxmkDAI9
	OIMx5SPRWuVmH2AlYc/ZdPsgTg3SpEAo=; b=Hgkh6xagQ7VuzMo95XqD7wXM8EW
	RmfJQJnGYCg+zIr14mvfwXRiofcPUgBcJT1x3V2T1HuMu1bZ/9I4psqEwzlv9cPz
	k5lF9nwyVVIpQhownNXkMiTWDzeQh6OfHpte3eXiJ70mLmQZG39C0pfE/Ymj/DnA
	qCk+m/SiN2hpb1hrNRE6hV4JIyPgQzBT0ZPLZmIgH9emvNkFE3sGnYKqxKEz8u21
	7r9/TVICyhptUNTv/Hq7X8CG7gkufNdf/lP6iP7XlctZY+yzuYNg1ic3OQc6ekf4
	FeN9Fk+jGAl0p3nJor4Lm0lpa3KAQJy7Iw20yoya2PbXgkVNJkYkwLT+LuA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm388jxgw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Apr 2026 18:23:01 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8aca4660827so64323866d6.3
        for <linux-hwmon@vger.kernel.org>; Sun, 19 Apr 2026 11:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776622981; x=1777227781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/O0gxmkDAI9OIMx5SPRWuVmH2AlYc/ZdPsgTg3SpEAo=;
        b=FBIiOPLQgi5yes2HNb1jWDTIKobog21NM8sHUkCbU7eSTmpC/9EI60/9TlJJ0VySe2
         73ckEce4FTQlAeImvzJElBiz+zjLvIHUrdosRPVc4MFFG9Bi8hR8kbLmVKqJKwp0ZCzV
         9WW0req9/iKZ+JYqPQQfHMYDhynNIkMq76+rFCId9/FnC+IeDUn+7Ob7Sd22w/6c/tQM
         mQI9fFlLq6u1qXF7fHvqVHrbdvpcA9gZcF3qghq4OjcktL+qUt7Dlbcg26hTKM7CZhOr
         EafDkrvOv7oSjjbehtVTW7YgaZB2zatd2YWbaDa5cRDOhMq2saMFGci5Rws9wBk5pyvK
         J9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776622981; x=1777227781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/O0gxmkDAI9OIMx5SPRWuVmH2AlYc/ZdPsgTg3SpEAo=;
        b=rM6zJ2zlxeS/khe3zMXk1wziB4LTNbAV5II1E5PJZ0QCCwsVW9wrR5+pAdUwXdWdi2
         g+KeVWUaiScH0Gl2N0PFGuckY65qVldO3iCwA4yaoEhB+bPR2Rl7lHezpjmDMWXsghyk
         /ZXgJkibFPpHRB59MMJLKXnsdEUBSk5I9w5CKCN3RQGbr8vwAB+N65dP8UoESBp238de
         4SWTj5YD1QM7dv2veLjocw14fmRKL+F1JgYaciGJqIBInPXfy9uVTvB1ZhwGvBg/DelE
         b8fOGPn48/5nhY0revVueQ29b6UDCr1C0Jyo0nCW3I/qLmacil9sypbaog/fJdGxLhdl
         oj4w==
X-Forwarded-Encrypted: i=1; AFNElJ9rCkvnT5vHxjfXoCedgehfMRhuFRPFqDZLNxxJfIynwK6hxBIiNxz25itc0WdUwmxjI/2Bdre2MTJgDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/lrugRC4D3j5tZlViNzK0Mjp4mSFv9KrKFpOomGBdK+Rw3SB6
	/iNmHJ+uDNv7peE0SH9RkxovK1lhRcFyQ9SldSEUyHJYaZiMH1RHxbpiLKdB/TuVrsXeII2y65G
	KVvO4gFlg3IEm7eBYG2QqrWalYO46Dsxi9Ocr444NlF6R5v92nmv15l7aJMDwFt7lZg==
X-Gm-Gg: AeBDieuahUH4iRitKL6TW6D3Wbk8R9LqQVP0HpLsWaTxKAIZA1dFdXlwcEoR9/l2HbD
	KcGSQ0tYivqneqfSCbneshT4SP1bTEwBAlTelKljYSgibK5iauzuUYkLRRRZ3Qpqiq2QojCp6GN
	BUfVmUBdOjvw/1TRyi7NZ/C0I0X5htEusqpl3YtOdKHSv0ipr8HgXtS4hHM2kWHqLjh6TA9Yil8
	P/hUVGOcV/7RNG1VHExYDMeLN4e9GJeNoBcT0ZmaAa2I92v95aOpEEtbjNGbVgYFsPp4kxDJ+FY
	5I/HNPnPEUaHDY2lvuKcXBLiDV+gQc14vGzJqhAA8HpSUeE6MLfURaSwTInGornt5ZK7Wz2SZL4
	7CH9o664c9iolUlPsRXpRIcIww+fihi/IE4CNW3AfAspo43OUxJx2AS5FL5u0
X-Received: by 2002:a05:622a:a05:b0:50d:dd3a:73b4 with SMTP id d75a77b69052e-50e36c49454mr168590751cf.37.1776622980447;
        Sun, 19 Apr 2026 11:23:00 -0700 (PDT)
X-Received: by 2002:a05:622a:a05:b0:50d:dd3a:73b4 with SMTP id d75a77b69052e-50e36c49454mr168590301cf.37.1776622980036;
        Sun, 19 Apr 2026 11:23:00 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e59f97sm25723070f8f.37.2026.04.19.11.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 11:22:59 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
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
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Subject: [PATCH v1 14/14] dt-bindings: thermal: cooling-devices: Update support for 3 cells cooling device
Date: Sun, 19 Apr 2026 20:21:58 +0200
Message-ID: <20260419182203.4083985-15-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260419182203.4083985-1-daniel.lezcano@oss.qualcomm.com>
References: <20260419182203.4083985-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GthyPE1C c=1 sm=1 tr=0 ts=69e51d85 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=GhBi0EG2tKjOyko4s0MA:9
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: gU8I4y4wiixikmsfb7oOq3ZNlLFs4K79
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE5MDE5NyBTYWx0ZWRfX3SivwaLDxXMT
 q6zTd0caQ3u1oIUEasO1de2Sz2TLJQWWIF12cgLUNO9kzAmno3mCIC9VK0+Y2NzWrb8HmsTG5G9
 C0ZvtnyCQs4l2AdO1sV5YGc93S/LlvCO6FnV/eoapDPs7wxIykBAHW5gYtW8O/PWTh8RASULXjy
 CVe/jWKf+CLLL6yeoro8jQEQNoSBDEfZGHgXQ2RmmFJx5yRNLxsypTHwgspnLTzwiQtWcRaILpY
 en1T6fYH6EecX7kNmjFCArBedkWPzll7ztl4NDMapNLK87CFuYfPVzIcBXcL8A2COaFgpMDn9Dk
 uIeXzn8Y9TjGsHj3pZbDskE18JLto73l4E4eaIR9vvEu/cQHrfcyCtlJdQEpfjS5qU5wJMbCX9w
 uhehaTy1YWsoT34rwNCgBa+Zo4pTqVb6o72r6Fhcdn/aBGfdVSHqXJEPayHAtwy8cx1myvuIAGT
 ulsws0Pz2M7SLLwHk8g==
X-Proofpoint-ORIG-GUID: gU8I4y4wiixikmsfb7oOq3ZNlLFs4K79
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_05,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604190197

From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

Extend the thermal cooling device binding to support a 3 cells specifier
along with tje 2 cells format.

Update #cooling-cells property to enum to support both 2 and 3 arguments.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 .../bindings/thermal/thermal-cooling-devices.yaml         | 8 ++++++--
 .../devicetree/bindings/thermal/thermal-zones.yaml        | 3 ++-
 2 files changed, 8 insertions(+), 3 deletions(-)

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

