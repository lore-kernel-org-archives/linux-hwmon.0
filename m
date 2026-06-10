Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467A53AEF47
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 08:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080345; cv=none; b=HlyykG6Gvlf0UMQpFjvX1zCjtaY+8Xum5J6bZB9IM1OpoTe39bqx/iUmCweGCzEKzXe0EqeBZPV3UJq5/tUWWU5fT/7DN+VpYQEOTT+dFuxjSMBP6h9szkR+wRRfM9Nzzfn6gHBwZkzfXIclcH6l4F+vQ69ONeZD+Ghxz+mgUnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080345; c=relaxed/simple;
	bh=XhmDLNuuYry/M43FbU/9q+6ANPyk2l06+Hus0cO7W9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Al5tZcFX+yQa5ffeZIXF/NAeas6eZQUVF99J2+zq65n701bcrV8RCO857sudzbATz9CkCIerlbEV1HsolE6TgamOsHl+k+5AV095nqYt4FwaisOJanRV0LWjYFU1a3S1AUNXk4GAw761cmuUcpFt/p/uDc9nqrpu+esRjHQNQSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V1vSnDJ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WwqwguhA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V1vSnDJ8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WwqwguhA"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7imxL997513
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 08:32:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZTswalinyg8iD6/jNxsdZSH9Oe1xTUexU/vQjRnAFyg=; b=V1vSnDJ8cSAvRv6T
	oiYtwkhRxgKUlRQnz28ac9jf13kcrb+aEJxf79zyWfHzzegu1NAniXqH09E1KxUo
	lsNnL3ypnib42I/+8VYN3kxnYV6ODsYPZwDQzU5b2dWcInfZGTSA7Ypjj+TFT4O1
	DL3IsziC+rI/oBR/O1sYc0PaJicWuWlCYKK6GVIoLeRlQjzB7H/iF6OFarnw2p+w
	RgTAHRqtXwKWDRrMNa3c18OMRvS4672uVOpj04nds9DMldALQLRFsamrMpBr7iDs
	6/cm7uJxHXueENta86QP3vtNABm1Bi5nlIUh3zGrbNGM9Cld3ivenZlvxVpcFDqW
	S5BRcA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq10a8uje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 08:32:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51787404d3eso118034331cf.1
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 01:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781080343; x=1781685143; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZTswalinyg8iD6/jNxsdZSH9Oe1xTUexU/vQjRnAFyg=;
        b=WwqwguhAbUHrLNSV6vh0KLM9s1h6j7KAiqqpl3vpfsVN2R72fIMdqucc3XLP2hEEQt
         kQ6a/Et42amENGIPSfP5K6QqvcFvIoDRVmlih/uzSx8zsiXOgE22TUtnhk6aAyGsC+cY
         ft1IbZerWzSA93mMwdT16aRSghdu6amkvRmnsfFQ9eEip4xjcL12aZENF60FVan8FZ6X
         +K4OHqf2SN94CsBMEQHV/3XaTQalLz5ME/peEMGNMN8/fHFNk/v//56DCuKsCakV29KA
         eRbnDL1S4Yjecqq+85HGCzq8KZfzdDDj9DCJ+WQsKLIes7Ct38cHeuGNfdpZMOfrXbyr
         MA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080343; x=1781685143;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZTswalinyg8iD6/jNxsdZSH9Oe1xTUexU/vQjRnAFyg=;
        b=MfyetbgBdDHqG/sOnzHF4PvvAC0X/7ooxtgFyCb4TmZJRHyfprVwFA2vnRI+XbzWa5
         k3fZxck9WUGMy2k9EQeTNQrHTv12T3scimWMxnyDgPLhVsPoWkoVwCiQe2LceHYpipmV
         LRdmSddqtVOAaD5Jt1wjx25l9SrTspQuXmhR/+uydGkiITN8GXLBB7yVxTTb9oxaFUSD
         tGmzcB7HziCWn6jCLC28FlcIg++F/zcTjfQZfVYPHna+mexLHbd0ME/bWtVmhyAz0kO2
         +XiX/xNHgBKxI/8WqR4sncCMSNZHlaroNDr0ryXxazUIGISk2ceJcweyXj+UN9Na84DU
         o12Q==
X-Forwarded-Encrypted: i=1; AFNElJ/Nzr8gRH2eQizIdZfaesg60u9VE7KeN4iVVC21BJCxIUVUwU+MqRyGuxavqWAk2kQWDbmdslI8jo7YrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw17rvjxWo6LyLfFuI7pt2K73lblnFD4JMhFkt+hSaU2/gYE+PK
	+2zR9UilWiHEk0lISHESPX/w4GqhBrpCnxiyY2nDup1xWVzxVdEJyWo/nzBTInkAEYgkpkubux3
	dCZmrD1s4iS8kPIm/Vl7h6wvb+mTQduXFBvGuzWCRjp8fGwtuSXRQu2qLP6vuNyRJOA==
X-Gm-Gg: Acq92OHrUN0xESEe+Rtl0oe5cVTSAIux1/ecQE/+1bimTxeFTPEp+UA4qhDC/9LniMO
	8uciL3wRH1KPlhAEng9Wh3a6oaCx/b1WXUBmb5v3077TCHyIOjkC0rPFgfhAfljS/1M6QvCz2bU
	7FFBiHUfYH4Uo23WrPf1SGgTOJ7EwM/iPRO6883HCZ6gk+q5b5oW1y301XhbBWWSMrzHfCJGWaw
	CQnEd54V85pnsRe6IYfHCRGsWoJLIPUyfnuhHMh7JhMyQQowoY2sh5g5qGlnheaq2SuDgZ9fjzj
	c7oCv4WnpbbK0m9slFWaqZ35eQU4khRMxBx8B5M+Q7phtB8kwVhYrg6Zih/eecguyAzPjwPydfH
	YOrb0mtd2rDHcm2IlZwcOXxygPN4v5yxoqkpKLtKF1F3FF1lsdUspqdGS7SJEM5YkhPdRc8bbti
	/4jbI3S9Zs7jgRea4RhzdPcspCK67zO89dFaTntDQ2RyoP8j4Unjz5JOUGxH7cw0JuSjIL6/+zK
	teXsjos7dzZ
X-Received: by 2002:ac8:5dc7:0:b0:50f:c2f8:406f with SMTP id d75a77b69052e-51795a256d0mr345053021cf.25.1781080342627;
        Wed, 10 Jun 2026 01:32:22 -0700 (PDT)
X-Received: by 2002:ac8:5dc7:0:b0:50f:c2f8:406f with SMTP id d75a77b69052e-51795a256d0mr345052721cf.25.1781080342160;
        Wed, 10 Jun 2026 01:32:22 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e6585154dsm9516218a12.15.2026.06.10.01.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:32:21 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 10:32:15 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: monaco-arduino-monza: add ina232
 power sensor
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-monza-ina232-v1-3-925b0d12771b@oss.qualcomm.com>
References: <20260610-monza-ina232-v1-0-925b0d12771b@oss.qualcomm.com>
In-Reply-To: <20260610-monza-ina232-v1-0-925b0d12771b@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=GoFyPE1C c=1 sm=1 tr=0 ts=6a292117 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=w5cLSrw8bnM9wMX07V0A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: oRU3fdzyU7LL9fe-s2q5cCgCQQTJb4n9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA3OCBTYWx0ZWRfX0e2PTEXHtsAZ
 H/OglEqHlnJuYfXxOT1Jv2yJHPVaweH6hz66W+uNPVAdtuG29DEa39M1zTKjz3zU5PRUdaLkWuH
 nrI9HYRuNe9hzFSTse0PS9HnQsIha+LVGKpB0W3XqyKaavC+8PpN7cvm5I4o5N60TrnGmAJ/h5A
 9WVQSrA0QF0rks1MKlO7YKtAeyiJNAXWNogNIxGuJC4jcQIN0bGyzcBSo6egCq9Iki8V6UROFl2
 0snClUXbjE5VP0csbHH8Tld5a6gVVOax/jLzHC40a/YB9sD8L2rvmXcn+I3g5ip7KN0Q9OKqsJe
 sbh/mudenFxMxbeF087dSv1lde2PRV4n5aSNt5fdZci1Ol5zP0RpoWz9TryYdjpzEoZG0nS080K
 E3Hl4J6vKzjRJNztFRbhYEJ4PhS4WgrNvvdZhmb/9apgf2O53Kdg0+BNubhCmG7JCpUswRZaf6x
 2WxIp2Co4vS+bdfrsCA==
X-Proofpoint-GUID: oRU3fdzyU7LL9fe-s2q5cCgCQQTJb4n9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 clxscore=1011 spamscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100078

The Arduino Monza board has a TI INA232 current/power monitor connected
on I2C12 at address 0x40. It is used to measure the board supply current
through a 2Mohm shunt resistor.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index 379b796f261f4c8f6b7712c5d340b20be1b9217c..a526c8a07b30c22820f54b54644916b268496209 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -291,6 +291,12 @@ adv7535_out: endpoint {
 			};
 		};
 	};
+
+	power-sensor@40 {
+		compatible = "ti,ina232";
+		reg = <0x40>;
+		shunt-resistor = <2000>;
+	};
 };
 
 &mdss {

-- 
2.34.1

