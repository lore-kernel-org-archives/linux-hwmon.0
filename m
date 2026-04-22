Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED59839891F
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 17:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776879828; cv=none; b=RInYKXGHE39lb7yqbOqPifdyseCEu9xJUWIEwtC7QH90PJ3hqtO3wb9JPyC+9ZviWdBPCf7h31LSk3J4ePSToJN/XpDVK9zYxtsO2C5y8aIhrucvsAzMPnX39jr1r2vXDdjH+QURQPCgaS7EzregpX7HoxJEClkVNMHyLTSyibs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776879828; c=relaxed/simple;
	bh=GRJKqETTYD+0iUNaGVQk7QmrjeC7H3mzki0OTwX5WSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jEQyqX3Ya15x9gcKrMYjw0roBT+bTE4wrYHenRCvS3vs2cQThkJh061etdbupWn12+zAB3wYOOQMEj/f36h6fEu6nntmTga3kGzeY8SsSwGK2uLXj7/hIpLdAkswaaF3Taz8Z56gFjAzbUZFdaIIxF1VjvVB14IKyCIqCFaWnqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ep8igiT9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=THqyT0kG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ep8igiT9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="THqyT0kG"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MG3vLa122634
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 17:43:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ycCp+qg3sPA
	C9R8065KdU0CXnIWLAlFwlYKj3ZnmuC4=; b=ep8igiT9pgcI1N+wLuV175BWocv
	wfHemshB4+0SRwLYHsSSM5tTISeFWjipJFjc4QSRHlu0+kTqE7u4v4tLbQFHaSCI
	cVW3Su2fuw5EN3C5XwXjKJnQBnjY9cLEU9Lu76egrng9fJJrP88ZgMWt2dtxWfd+
	NuAQHIJaolrTLbL7aFFdIDtgQ1lcxyx1FVYkcHJlCrrX7nFciRWxyJg7Ay7jWa5a
	IGcTyJfbvcPPrN63uLixdTA4wVCif0RCL/hl3mJPsZP8qcRIFZ7nHq+30vjom5Qp
	KE2X7MN5oUP2DIhOSh8xZTqQnEOXGoYT22ANRiEPOu7hsrQQ0nVmb6HckNQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1h80b7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 17:43:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e5ca8ffe7so63849291cf.2
        for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 10:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776879825; x=1777484625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ycCp+qg3sPAC9R8065KdU0CXnIWLAlFwlYKj3ZnmuC4=;
        b=THqyT0kGIVj+1naxjnjTPFtw2JeWpRDxvafgA5GK81UCgYa+7T3cpCjZeA1ExmfDUL
         iXRYegDAfDPJ4Ul3PltJxUusiNRNZBRWm47onOXty0an/SiPPWOUM922ZpDtMSdPZYwM
         a8dlTD4aRjz70FXSB3xdtfJ+QtyiUpUVPY3dHU/LUWq1aVh9wVfIkOZJJlUOYBk8+/3O
         dZpgdclyisYvbJXm4Ua5hqFKbB34d3H4IgSNI8RIQITf2U8efB6mbJQbyJc0F2lHgqS+
         o5oIxNZG9DSrKLiQD1BHOyw3Uiw0lEoG657AQIAp8c+J4bxAZ8JRU3YA0hECnxcVAgxM
         tZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776879825; x=1777484625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ycCp+qg3sPAC9R8065KdU0CXnIWLAlFwlYKj3ZnmuC4=;
        b=Yi4eG5alHUkCgEuclXfinWM0cWgLP/6aiPcUL9x3H+366k0ZeQDKH6fb4UjZlXXw3m
         bApnYdAPwEVs3BMVHTAVmKL8ocYxSdcOV6G173pNxNzfqvzc0zBj7qw1UclsLVbqJQ6V
         7IL5Zcr5G0Hmena68tLXX3eq+Z6W6GBqTNJPSfHGrGnTXBrxWJ4H2ayZWNUBVSCpzddo
         +IBr2K4NC1eyPRfcGvmbO/LYSlnv1M3d2lgHCe/oMf79/QfA5QvH3VNLynwK8AgKfvAO
         g7Ww7qI6tfsdtS9kUlZCovuDNjUSENkv6z70GYQYzTkWtT4fGjz1zcTM72ITuNfR2S8E
         muSg==
X-Forwarded-Encrypted: i=1; AFNElJ+mGdgj/iyRU9WLWXPQ1+WTsyNilOO/G/IsELZLAKHiS7oxs8zegP9g9QZa8bdUB33Hl1xrm9D9Brrz0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/IScHAy0BzpcB4xRP/lihPI6MOkfhaYGETKcAdjC1rotWf/lQ
	Hdc8Ssv3DmbU5XzCaROdAwV/G2qX/O3uE1/UUea3dFL/LUJWEPOYm2hYgwQ6e69gtirR+KpTvqF
	dwOzRbkEbhkj5ug0Hgdj80fq0mtRWkyHxJAb36xuDSNQ9XFupevZNG6TtaS7Pn53mdQ==
X-Gm-Gg: AeBDievuaDtmsIAGQ3QhHClMyhyZGEKQDsyp5r+5MQfqP1yDnhsr0WCVDH13A6qedye
	w8wnmKpKsfOrRj4c9V4r+qmxCcXbi5mJfsvC5eTVJdqi6eNXaa5KsdxV9QFS4Gzc61NU1Zwsmcm
	wuwi8DdthMAfMTz7vqr2f29pGXW15ilnm1ni7XAZC/yZcu5q9x30p4vJHTo7J5EDqypoGqs7zl9
	NX9EycxLBzJw5nxVW1ZyhOeipfvhFTpgw72U2X3chmjRCHz8E8O0FezWANb73v2jaNTGkbPcFEv
	pcQgMvN+iEiGh39OnBc3D28A2RW35L0TjR+YeNqBSnYZaP8HwNCjx3F347oG0kk0NMQT5NIb//Q
	8x6PM69jawKOwMN3/PJo5Esiw/Gfppf+NPiIlNjeHJi5tOx5G7bURaszqJ2/+
X-Received: by 2002:a05:622a:7281:b0:50e:601a:217f with SMTP id d75a77b69052e-50e601a2509mr134414391cf.25.1776879825060;
        Wed, 22 Apr 2026 10:43:45 -0700 (PDT)
X-Received: by 2002:a05:622a:7281:b0:50e:601a:217f with SMTP id d75a77b69052e-50e601a2509mr134414041cf.25.1776879824631;
        Wed, 22 Apr 2026 10:43:44 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7a051dsm142511965e9.18.2026.04.22.10.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 10:43:43 -0700 (PDT)
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
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: [PATCH v2 11/12] thermal/of: Process cooling device index in cooling-spec
Date: Wed, 22 Apr 2026 19:43:00 +0200
Message-ID: <20260422174305.2899095-12-daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE3MSBTYWx0ZWRfX5QUJ9Dhpxryq
 skxQ2NttfapNRDXRjByRZT6xF2rbeTHswlGVlKGgg6ZOtxJL7h9AX7CLBow/CGyOVkNVj9i0kuL
 Y9W0ECGYzoCZptDKRD2XjZCFYE9AGuy6BeBfu0aTmg1VK6EEMGp/rC8AQmmGxekUIHFZfEN/pd+
 JFwa0gLw4Qxuc7AitIulyYe6MW66BeREPjsZqdNNnPqdDWep+5s/epco2jGrhkS+EG3232RJq18
 n1e2FAak6A8/QSO4lH6knxB3Avs+UpMmRZGsLNF4bL0MTb/cEM/Y3M0xMqAu0p/RZ5AXUzJrUXE
 LpvugW+J0vMV/abJ0VKwW6x11zBHoaKasrsl7hvIoVapzt1ZRi8MKKqCnlEtFTazf4i2z9iHCZW
 srjjAGEu4S7hMtAnpd7nkwBZe+/a8Fc9zlpoXUyaM2/Zv5PfYq49mI5S+6g91zP39IYhg/pRnUf
 mm0g1T3aZUT4OaU/Wgg==
X-Proofpoint-GUID: fEP53XxkbuaxprhIQOPPpaJsYh2qoGvc
X-Authority-Analysis: v=2.4 cv=RaKgzVtv c=1 sm=1 tr=0 ts=69e908d2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=s4Kp2nOrnj-iCWvMcIQA:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: fEP53XxkbuaxprhIQOPPpaJsYh2qoGvc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220171

The new DT bindings format describes a cooling device spec with the
cooling device node, the id and the mitigation limits.

Depending on the version of the DT bindings, in order to bind, check
with the device node pointer only or, in addition, the cooling device
id.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/thermal/thermal_of.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index d0d6d6b82d5a..f4628300972e 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -259,16 +259,34 @@ static bool thermal_of_get_cooling_spec(struct device_node *map_np, int index,
 
 	of_node_put(cooling_spec.np);
 
-	if (cooling_spec.args_count < 2) {
-		pr_err("wrong reference to cooling device, missing limits\n");
+	/*
+	 * There are two formats:
+	 * - Legacy format :	<&cdev lower upper>
+	 * - New format    :	<&cdev of_index lower upper>
+	 *
+	 * With the new format, along with the device node pointer,
+	 * the of_index must match with the cooling device of_index in
+	 * order to bind
+	 */
+	if (cooling_spec.args_count < 2 || cooling_spec.args_count > 3) {
+		pr_err("Invalid number of cooling device parameters\n");
 		return false;
 	}
 
+	if (cooling_spec.args_count == 3 &&
+	    cooling_spec.args[0] != cdev->of_index)
+		return false;
+
 	if (cooling_spec.np != cdev->np)
 		return false;
 
-	c->lower = cooling_spec.args[0];
-	c->upper = cooling_spec.args[1];
+	if (cooling_spec.args_count != 3) {
+		c->lower = cooling_spec.args[0];
+		c->upper = cooling_spec.args[1];
+	} else {
+		c->lower = cooling_spec.args[1];
+		c->upper = cooling_spec.args[2];
+	}
 	c->weight = weight;
 
 	return true;
-- 
2.43.0

