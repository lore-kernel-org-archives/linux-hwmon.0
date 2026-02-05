Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4856032AAC7
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Feb 2026 21:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770326116; cv=none; b=oiKy5383GxqLQCFuC/XIuzQQtVbHDpcQQzs9kF74jYxBxmwtsJOto2GycyUyPUe8a+Bo5W6JOIXgZQGuI2LxMPcTqmV/6Cna3plpvc+alKDBI/WXS3zk7VbdRtDwB2KjAlK7UPf/ICpf6wQ9rUNiyfpk/3EyIrHI1uygC2GtI1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770326116; c=relaxed/simple;
	bh=1tvSpc5JPZvyNRVgbUHPktqMgKRmetSeLRgTJz3+7QQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kXjG1WOpI5+gjpnOcBZoFpwvN36Rkh3O0cep/ispcsvs7AoCKxFR2EPoI5pZhF1iNA2QseEP1mOMAH0inZNM/dfGbL9+0XdlTCRvwTfZG05kAu93Z/IvjqiOX6eZHlck43D9oPD2Ytdg4IvLEIs9dUa/o7P7yIoWIDrUgU87dxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MY0BMy9b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kxh8tJQD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MY0BMy9b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kxh8tJQD"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615JUOrd4125673
	for <linux-hwmon@vger.kernel.org>; Thu, 5 Feb 2026 21:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XwrANBGWztn37K1P4H+NEO5rWUi5n7BuQoNrf00BBa4=; b=MY0BMy9b0+tSjHKK
	u7I5K5f1fN/SPI3iqwQ1twgTMT/miiI6Fa5xuwljiFQYOax177Nud4mBbNj+IP3x
	CUcF0WBTil2F5qBMDqNGyTSc7pHUHNYRIM5LnawFFyZ2eJr0Tk9honcd8yRg2I4t
	ThscxW+JqoA9dBlKVhKfbYQcj0A4diB71iGMVwPxfrdascODKSjtRv5nY4+PpXCy
	LXS5nb9N7NW2ZXQiTRP2VLMUrZLXwY62arvKdtuvaKbldgw1w05yE/AC+EmOHtsb
	gzzTTDjzI8DUAMaeP5pUCkpKP+FS/Lru/3muamIJ8nq7ZsCkvvT8wM3vbvZQ8XXk
	S/9gGg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4tm8stu2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Thu, 05 Feb 2026 21:15:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-354b30fd7e7so10277a91.2
        for <linux-hwmon@vger.kernel.org>; Thu, 05 Feb 2026 13:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770326114; x=1770930914; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XwrANBGWztn37K1P4H+NEO5rWUi5n7BuQoNrf00BBa4=;
        b=kxh8tJQDHWB3lR1IOmyzTXU9qNdkGahCyWfo2838a2hmM+eMw4wYvQNhJjIWQjjGCf
         3H1+u7J4clSgEUpdAhjLoDN4HxLnKcrAiEYs1nXMOH386Va0Oo0Rk/crzBV4pUrk3T5c
         ce1QIPc9HM8MXiTrJLn9DqQVrhp8mxN5LRVBE6YCQeBWVA48nMtmKIaQaIrpRRnuaQDi
         BZBnGA0qfRjzKmeL0mHp0FxoEEL02CijiI3/MQsvmnTVGOAoJXm/x59cApr6+PUvrT9P
         JF7b5gms6gSiy7fN7T1vCnjEcQ+bQMw7BfCLPDlwcIHdqYKHkDOYBZxK74yM8q0UTnAh
         awdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770326114; x=1770930914;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XwrANBGWztn37K1P4H+NEO5rWUi5n7BuQoNrf00BBa4=;
        b=umIkhqvmQYo5LVQ/u8odcyv8PcVk3+ftoC8Aw6+YO958LaiZx9A1v0URcxTiRCApfD
         +gpWXSGfT5nQeQOn+fgeUykTg/2V8s3ZJmTzHK1kqnZj4KJ382og9PQySfaXhKCaY96Q
         ixAS1hMaB85M91lG2T9brilZur9+VEIM9AMUBJMPLlhzQjFsURvh9rpcNshKUa+H1YDM
         ZaQTBQxkceMKrZHtdIK1fdrw83Y8YNoG9dq7304dKaxhePkiKSIyhqCkeVWg1l5Mvtpw
         L++AkC+k9cG59mTcCB9yw2/JlaJXtst+zNL8DSORxuT+zRB50GM94YRah2Vf8MefEZZB
         XH+w==
X-Gm-Message-State: AOJu0YzvhXx0JFhsTjhDNlM3Mnyao4jQxeFSqyqYoPoiqsHpxJhMw4Ax
	srGZlqKrlFjcWAg6k0ts7fQepaYrRaDzT1ucdZBmiw+sCzzO/ZGIudJO7xsCM0osgw9d09/u7ex
	C5XNNTyREUG27WbXcsq/W//+NddAOQZQt88A6NHHg88sxB2ZHss4ZdlSP6TS3seCiIQ==
X-Gm-Gg: AZuq6aIit/6W0HH4KiMTPy74jMAVYo9qlbYR5zP2QpuQF4tGp/kwpayZiwTrjJDO5M8
	aWE5oC0m3oShzJJiUaDklDO0ScHzVNcqPHXe/azRthaGiZ6tUX+LAV8SjClm2Vt0xVjcYTK3NeW
	A4uqYEzQuyevAd9fLU6sBgQz6Eijb1OWrxWu/paM/pEeuFOorWnihYNxhqul7pSB5BaXZRJ5rOa
	deIdmNiMqHSzn/72nFtnO4QbYmaV2GNPRGGj6MCtDyDV30VmUDgQQ+OwpSMmmFi/ipzpiFj8iSj
	744SrgZpY6tsgUdpS48fwWw2m4V898QokoA16CYV2mdjg9/db2gFHqCd5G8YXUtJiIk5PmPXAH0
	hSV5IfrZBMwvWaX45R05AFaCP35oDw2XquLZcn3rKyQ9j
X-Received: by 2002:a17:90a:f945:b0:34f:454f:69a9 with SMTP id 98e67ed59e1d1-354b3e46feemr255310a91.28.1770326113915;
        Thu, 05 Feb 2026 13:15:13 -0800 (PST)
X-Received: by 2002:a17:90a:f945:b0:34f:454f:69a9 with SMTP id 98e67ed59e1d1-354b3e46feemr255264a91.28.1770326113350;
        Thu, 05 Feb 2026 13:15:13 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354b4575897sm74536a91.3.2026.02.05.13.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:15:13 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Fri, 06 Feb 2026 02:44:08 +0530
Subject: [PATCH 4/4] arm64: dts: qcom: pm8350c: Enable Qualcomm BCL device
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-qcom-bcl-hwmon-v1-4-7b426f0b77a1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770326090; l=871;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=1tvSpc5JPZvyNRVgbUHPktqMgKRmetSeLRgTJz3+7QQ=;
 b=ZLtdBH6KzLE2JKpy9Gwy3DghjGSmiBqTkJCj6JS6vhDDkWmKM+EukQnWc1YQTKUgEbfEgeT5C
 jcGcjLoy7QQCENQol5X6xiyoqZK2YS+RnZH+Df75/oSn/wYZCcAI99k
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Authority-Analysis: v=2.4 cv=Vd76/Vp9 c=1 sm=1 tr=0 ts=69850862 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=d1WuY26MuSUb2FOOun8A:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDE2MSBTYWx0ZWRfX+4gYXN1Fc07q
 015aDxLnZZM/X01zA65oKXLZaxKuqtqk+QfeaQTu7JDp9XGj5Nd1s1dyN3ZKQVK/emxdi7Wv8ar
 WTYnXNa09jHU6bHWbJoykiGUH1gfquq1K+mB7A7b+SDw10YJHaRu8HSHfC/6nb7t+DCTpCRh1i8
 2lzUETD2C3vL56wQwUJKzuGX2dsyXtBOR521wLxGh8CHQmHREBADHWYYZfKn1h5cUc42dJiy8Mg
 zr4GNQ6ags+7AJtadf19kIWm4x4qFU76qZZlZ1NLqIPo1QTJGedmUTq2NyObAz6g8CrxDYA54ym
 O2FA/spUSI8rWUKpSSE9hN8WOfz5wnK+QyKRwBzcAh/sB6CPKOw7SNhorUSGWGUiwFRAws4erXH
 gaztsjFJlN52Qyq39Z8Rx6IIBeg5Ex0oaID+3MqxogbQ0dWZM1002vI1lRLYPQJ98keyzRFVn9F
 y/JKHsvdnMx6Z3GFRtw==
X-Proofpoint-ORIG-GUID: wi-8czPsU9gS3F-JHNCbegBsnlz2YGHQ
X-Proofpoint-GUID: wi-8czPsU9gS3F-JHNCbegBsnlz2YGHQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050161

Enable Qualcomm BCL hardware devicetree binding configuration
for pm8350c.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8350c.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
index 1a24e6439e36..151a02d325c1 100644
--- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
@@ -41,6 +41,15 @@ pm8350c_pwm: pwm {
 			#pwm-cells = <2>;
 			status = "disabled";
 		};
+
+		bcl@4700 {
+			compatible = "qcom,pm8350c-bcl", "qcom,bcl-v2";
+			reg = <0x4700>;
+			interrupts = <0x2 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x47 0x1 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "bcl-max-min",
+					  "bcl-critical";
+		};
 	};
 };
 

-- 
2.43.0

