Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFA62ECD3A
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Apr 2026 18:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776622982; cv=none; b=Ow+mS4GgvkbLpU23Yj2SatY9Et8doTnCv543tnWFku0aVzJGdTJ0u1oRzs0IBBJUfOI7CgL5GS1nA8+SrPeZu9a7bx6xhnkyq5DTBKomLztZHCY0q6EDcd7XUuD6/pIw8oA61x5C4j6AbV6FFt8GxCT/GDcjdAn1GI9CbyzxkxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776622982; c=relaxed/simple;
	bh=6SNqA+4nv4xjK696sb7FWsbUSU8CWbNmGGK/ldEvX/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hgNQesnJZ9Nkj04lpalJwfGehUS7LraT5QNlHShqZKAZVpkfTWAdj0JhEzCGfYEFzZG+dzsiGyHYLXxJK2OOTFmzhfntnOIv+YSi5FEWYCzGqxJI6AxXeeDPpgLpPOPjwcF0o1vIJrSEWLsiSd2djezb0N64bERo0LOFkvGWUk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lPMUfnKy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AJw0LU4D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lPMUfnKy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AJw0LU4D"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63JBJkpf3177776
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Apr 2026 18:22:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZF7ss7dJWTH
	LLa9FNsnYJO3c6WZwqwMms+ionVBB/Og=; b=lPMUfnKyI4Rmj7JW2Kfyzqa0RoR
	aR4llScmm5hr4aGW8Mi9risNnK/doXnZ3P4gprZ7Rx9GWfjwaF77oNiSO9Fu3xYh
	wKkf2O1Qv61mbWgN2Ve15zIoFbf8GirZS8R28YESGRguoPYD67jeypknJhhAlIT4
	q4OCXlBTNzP97pejWBC7DzbBbbxonDDNP8uymKyiHyewruuDvc6ipku/DMZrLhBi
	+/eEdP8S9D7s5UpUk4lT3bNmLlpCaKlbY/GR6F2RTISI4mFur6kycIeKv1qFRhRR
	WXEcqjUEknRLeWhgKqQyhlhnHvdgbbi020+Wu66AxWuSfBy4gTILh7DCsvg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm261u11f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Apr 2026 18:22:59 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8acd145817dso62778806d6.3
        for <linux-hwmon@vger.kernel.org>; Sun, 19 Apr 2026 11:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776622978; x=1777227778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZF7ss7dJWTHLLa9FNsnYJO3c6WZwqwMms+ionVBB/Og=;
        b=AJw0LU4D0ehK9ZQoqTuvii1Ph9kTREIrcPw3Dd3w07225WclCzsnetAuGRnB2VSoxg
         OTYCg3wPC6gK4883KOQboprZ590KTZvJTyehNA0JaRnTo9H/twJ9/Tr7tx+nJAysV7v/
         ++zf5thj7LFi7zapNn99HpcwgrQ4sScQhvcNgWk2LV8nAwex8YX3TjSnu6X+6ibLgDI8
         7SsN1/86ol0NfHbsqNopZhGxnIna18pon6PHXllLRPc/kBW9Rq3ECCOwZSWIRe0Z/uzG
         x3kU9r/9OIWepkNqXHV9UxleLtvcrtIw2PfFxG7zC6UvLaX6mNKOntfEwP+kVcXMcztU
         gtAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776622978; x=1777227778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZF7ss7dJWTHLLa9FNsnYJO3c6WZwqwMms+ionVBB/Og=;
        b=YRoKn8ptD6GKjEpsxscakeHYSMqSQotnWRVQ9JwSHbg88x3iEPHIVnF80ZIxrKJq+D
         /C5RH3uX7Suu6zGpqWlVlLiiwmf6T6J8ql8H8etwSpxTsWEuIrRG9uNciqQvrAJYcxsv
         RHJiHcVPuEPlXyVUQ7kho1f2d68EydLqHILoG87VOqIVB+Qb8fuvx7ur5b3gmSM6urF6
         gIwSwSn8U8pY98TeT2vcUpsU14QV+RsS53HfnzqkwZwVBpZzWDjtMKkcW57D7mfhdS1q
         vZr2830dcXmZyzR/h8Thrcg4mYyxz+ilPWl5nfQi+TOEwX5Aaa/2NPYAgM5GUfzqk9Tc
         FNCg==
X-Forwarded-Encrypted: i=1; AFNElJ/xN00BhwsUJRKYnHnd+L78sEANilJ0xObs7855Sip5oVURkWmEbH8VgpAk5QAHC540u1S6lJPSSIv8/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFj/u0u8zJBNastnPeszYonx0jsdPT6vqflzlvK2SkPtgIhyqJ
	uofECg/+UWUN7Dj9yKjcCmfbjI/GITNScpLKaJxPhlpll65eNsbTrETu5nDRwClkrQJ6QH/AS4p
	7qVLfyEYS4g4sW0nOVA+fn+22dEoJgMW49Yi53fH5sh58RkpnPg5wn55yf8HDYQUwwA==
X-Gm-Gg: AeBDieskhzXa8NhLCGmkKG/wJXnFUrYCwTMJHKO5jQNYugLtQJDMYmIrKOr7wY/HoQJ
	nvN/ZVHaDlJJC4AuRotkRz4kwyumAsdN7SqeWElt3svbdlVdOtCkSUlaUV912JKn8euPSjQmmld
	yee4cczXfk3uYXuiOHA5LboGt1mqGPAmzcptPGaeFTsCk1jHWbJz93sV5WjXvOr6dXur5C+WoYe
	iEGaVc4w+PewEzxOZpfIuPj8z4+TQO0CoK+9eQ8tOak1nrWUSV/WMDF8xMVNk6rPHO27wh54CnD
	4noZmp0LPKlYr+PFwCqAmGxBebCytM1WmMVrtYQRC0hNtXhtJPX34eu5JtumlODjdJnM6fWXZc4
	5s5CIlGWIjqEqIiBIgrzL2qzflGxzf8pJoY980hFdhw+wuBN297rKbmBzXYQT
X-Received: by 2002:ac8:7fd2:0:b0:50d:66b6:1564 with SMTP id d75a77b69052e-50e36943bf8mr171663581cf.14.1776622978539;
        Sun, 19 Apr 2026 11:22:58 -0700 (PDT)
X-Received: by 2002:ac8:7fd2:0:b0:50d:66b6:1564 with SMTP id d75a77b69052e-50e36943bf8mr171663341cf.14.1776622978074;
        Sun, 19 Apr 2026 11:22:58 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e59f97sm25723070f8f.37.2026.04.19.11.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 11:22:57 -0700 (PDT)
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
        Daniel Lezcano <daniel.lezcano@kernel.org>
Subject: [PATCH v1 13/14] thermal/of: Process cooling device index in cooling-spec
Date: Sun, 19 Apr 2026 20:21:57 +0200
Message-ID: <20260419182203.4083985-14-daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE5MDE5NyBTYWx0ZWRfXw02lcrG1H6qE
 pF8ojS/sUdC1bavllCj6ZmKiYMpnM6xDU0TAOpBlVVj4C9FAa2JlgYzRj+9JTt3qT5OR0h2EksA
 3TP5B+Uq3qDXePfWlHGbN9bdci7XvnDLq2veZarAS9jT4seFpNYEVachp3Cuo+PQDdrSzeYbrdq
 4n5UUwDyYCXU6T/4Apu5TMbYqA45WHJifwN/2NopnH7DKzD4bbwr+TQcd/vRYODy3ok+RYAw1tv
 ildVCQN7jmDBcxrg71gOvRGwZhGN+UQ20jU298KomGYnA1nNmFhguWEiboitO2UQM7lBZrVIGtY
 CtVdROW35DBGrhot6KaLz3sLcKUnaWHng4wcFEIA+qbyxWDtF9LY2Zf42Y0S+KtdQsO5xu7OF2l
 eLWrtrJ6V59Eo10hcd3qfPdbRzDsL9PEiSAPzeMvSAQxIuHGN4wGZIV6X+GuSs+6sgC8W611Vnv
 eZ13pIq+f00NrCpBm+A==
X-Authority-Analysis: v=2.4 cv=dcywG3Xe c=1 sm=1 tr=0 ts=69e51d83 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=S3gQTLpqa8hfpVGigeQA:9
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: nzWmfNRLsDcFfmr7XpNgtQ9nV4C_am8u
X-Proofpoint-GUID: nzWmfNRLsDcFfmr7XpNgtQ9nV4C_am8u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_05,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604190197

The new DT bindings format describes a cooling device spec with the
cooling device node, the id and the mitigation limits.

Depending on the version of the DT bindings, in order to bind, check
with the device node pointer only or, in addition, the cooling device
id.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/thermal/thermal_of.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index d9bd7dc01e19..e9b39d625b0c 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -264,11 +264,29 @@ static bool thermal_of_get_cooling_spec(struct device_node *map_np, int index,
 		return false;
 	}
 
+	/*
+	 * There are two formats:
+	 * - Legacy format :	<&cdev lower upper>
+	 * - New format    :	<&cdev of_index lower upper>
+	 *
+	 * With the new format, along with the device node pointer,
+	 * the of_index must match with the cooling device of_index in
+	 * order to bind
+	 */
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

