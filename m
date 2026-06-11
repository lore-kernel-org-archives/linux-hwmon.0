Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381F6411689
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 14:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781186740; cv=none; b=h7ha9vU/i0dX5mXiOca8eKgBFzN2wXiY69t0MVuUiKmJHfpw5h4KGpHOOxsxtnQlOFlzO5/nt+5Zy9esxSPFucPI6s4cvJN4dP5rN3FiL821W3852ilaiXiz1NyE6EFMSNGb113pTubFlRYmFiSHK8TvW9/5btJ60qTkfvlHISQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781186740; c=relaxed/simple;
	bh=jvQBnPqQDDUlETRre5szjLW99tq0I86jzYAKTdMMgvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LcRuZpXlDcfeJICyVLBd6YBbqq4Dzig6oTXGKkarAzKB5HVE8LuWmZj7dSPiHAH7gkFzJ5nT/AZR7vqjIG56nEAPrPkdQKkVdfm1OViK8wodbhnnOsLJA2EYn54qf+itk7W3kVmdrhmUvMoqCAG9u1con1pStxLY4525KqOj7eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RYRNf5vL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cxPXFEfj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RYRNf5vL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cxPXFEfj"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BCSonC506350
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 14:05:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V0tGNL7h9K2ue+T6NUx1Za/e4fIV2S72cYMFlFmr6TU=; b=RYRNf5vLR5GIUpzs
	SaasccBBvMEuhQKxF/Q8D+UJEZeP+97mD/KzQ+b2DiOmNkhxDA3m5aVD3CWCQwjJ
	cJpsXzEd+n2v2BlaMYh7RpdVIbT+qo2S8z8d7io75t8lofnXDPBUN1CTI+tenhmk
	5ahYPvnYFgY5Qz+fNNnJXfgsw8K56NyicS+1CVjXcDMVBE2ukE9Os0Y2cG4DgBVw
	dDtgOZYUSecReQx9CgMwr3XyRkwWuurirR4lMBahebJ0uVS3h+owWMpjLXsetmBO
	H3JmB7yt6XgiSL27jZXOn0q+ocKESQ8Qs6e/9bWdNZwoM0ZSqJIREeyTFt+rfqMs
	kUmN4Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6vbq4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 14:05:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36bc5e97950so8943016a91.1
        for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 07:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781186738; x=1781791538; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V0tGNL7h9K2ue+T6NUx1Za/e4fIV2S72cYMFlFmr6TU=;
        b=cxPXFEfjpeiUb9UcQ2QFCSzZ6y1uSds7ALEzkW/S8gW6QdPOzuiAc2EbuRWCmuePEC
         oY2xueJN9ScMGN4Vyv2LV/7r7P0tnQn/9ix74WbfJWflKkLQQmA4BOX3KZoub8lrJ3V0
         ftWUnndDBc0jei2I1qVZcFQG72U5Hk3yp63HyPrB2YokNIX2VWhm/ueF1joJ2NwNiFis
         HJPsEpy7mAIClmxz8Ng2CPdUpQMILCJIYHe1dlDjIX15DKOGdBa8eVYgrrRaA1hqK9md
         DVvtI2XWFtBWeJlJUde+Wv/v5vBVKH6CVZhxQgrdYQwL/j/Q8Yny0RgY1qJ1jwlonp6Q
         72ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781186738; x=1781791538;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V0tGNL7h9K2ue+T6NUx1Za/e4fIV2S72cYMFlFmr6TU=;
        b=bEckOW3g25Csx0Pw8gpgtloGT1Bc7uNPnn+0X6aIVch3wfz9iqHIcjGdemgI/chK4w
         IEJ9ragFHkzLF5HtAZ1dEfSH3KDifVvOVJneS5fhQjeRUl32vUDtoSay/tbZ9pkgcNFm
         4OzyUKk3oAEycB9IupZIiBARm2U/s4PNAQG4LyHXbbeu3bKcyODl3es4JJqYDTUDFXIa
         KCr9ARhMVGdb6wHJ+9oT+SjJcILzfXIHX0yiWy1k/2BA+uFQ+da1KelcUoMH8/vwAA5W
         ntOTzC5mxmGX8L2aMqtxm6cWA8vADpoftHVsx3Jz5+jgjVzXZde3XQ+vDRK66Y77Tgsi
         EvIg==
X-Forwarded-Encrypted: i=1; AFNElJ9zPCDPQXFCdGD3XN5BdQav9dOsFKRxUxhYgm+8HpBrfB6MKNQxDt7BM/gKMugkqWB2kbptVPVYNp3prg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/z0TeFIUGgTNuMF1jWNaW3wrifAQghh8p24ttIRPoAVJP5nPU
	ly4goLoFrIW1cmTxlmPsNX5MnA8BiLZF6oUH3QKFJtG9ZSLPT/VV4J/mpJ+PiUaadEU9vWr+Fmn
	H6TPwAUU/7tm1gxz8YHCvNrTVhKxdID8TVYkW9bgiBB1/5HPhrU6EFWuM1FEEYg0Odg==
X-Gm-Gg: Acq92OHwsW9tNioroTQ9U7EBP3rZPziG/wxZq6ag+B+qWNbDdOJU4AQeA6FGeNlit4J
	xlmh+D9RE5zLzYR895YfmWPe3ixyMtvpQiAGIowY5UXHO3sUIklOa1qQxRG6JOPh1GgIgnMDWRb
	/KaPC08lew53GAB4/8MzdG59ZhWJBYaEJkShdJPBQstAkXbEC0SR921Mrb8CltVWgmfBnNFgPRP
	nepo1UWIn8CvgAlcXVkDOFfhqbcyD7JgIrJ6RgIind5Aqr/jW8szfA+W+5yOU+bPYo/VNxbyNQw
	Gih1EAOUH84jq7+HEa5eq7MAQwd6shJTYDuk7siGh9N7qoDg9hMLbQrTu1JA3/GUhZ63NhX3ZNp
	ceZObH5Tqm0LKSgxzG417ufDJ5IsuCBoi3nxOPgZfpmquXXtXzpZP7d7Y3I4NeB0npJIaKQgFAs
	idpasgQOPQMaH7gYcwHWhPMXZt1DS91lQHg/tZtvi7+FX2B/wehQxLHPCNe25NALctcXySGKb8l
	Oit+PdZFd5Q
X-Received: by 2002:a17:90b:1c85:b0:36b:9daf:1504 with SMTP id 98e67ed59e1d1-377a76c0b9emr3324688a91.14.1781186737832;
        Thu, 11 Jun 2026 07:05:37 -0700 (PDT)
X-Received: by 2002:a17:90b:1c85:b0:36b:9daf:1504 with SMTP id 98e67ed59e1d1-377a76c0b9emr3324554a91.14.1781186736789;
        Thu, 11 Jun 2026 07:05:36 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e64e2c810sm11133831a12.9.2026.06.11.07.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 07:05:35 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 16:05:26 +0200
Subject: [PATCH v2 3/3] arm64: dts: qcom: monaco-arduino-monza: add ina232
 power sensor
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-monza-ina232-v2-3-e4375ce652d0@oss.qualcomm.com>
References: <20260611-monza-ina232-v2-0-e4375ce652d0@oss.qualcomm.com>
In-Reply-To: <20260611-monza-ina232-v2-0-e4375ce652d0@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: Gca48Xpy1cjAmck2XTH-DdYnxpVDUH6r
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE0MSBTYWx0ZWRfXwtq0BFqUAG6a
 40biDS97pOUDOBengtAuA2asHhNHew8xpDDLfw6/Do4/0ePtdD133eRAI+jJi2qSA9zX6e8BoEE
 dbcefQ3S19mBl0H68yi2Ieh6dQ2irSc=
X-Proofpoint-GUID: Gca48Xpy1cjAmck2XTH-DdYnxpVDUH6r
X-Authority-Analysis: v=2.4 cv=UsRT8ewB c=1 sm=1 tr=0 ts=6a2ac0b2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=w5cLSrw8bnM9wMX07V0A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE0MSBTYWx0ZWRfX4Ps1Ft0jD84g
 Wmo1vJp1BxMcBWjxGQL4dUwRCxryaKYtGBaQ4ewtRX6hiz2aFeGw+vWWu2IGBpfSAVXFilF69L8
 uShYdST+kJ+JTCmtg2hbYv1U3a4Gy8UHx2ljDTIMlFVrKWqZFUkoDXBGaJeEa41WtIAVj4pna4o
 B5c/OgjRIwIP4EBcbgrSq+xPkZpUm2xk08hwP2QFsQgknCXd4Wad8AlgBnTm1+FFllR/a///tW4
 CEZROCsruTYj8Sm0EpeR/2nZPrh1yrtzh6AjWtLjCZk/LYAHsWSh5PYIKJ1wQhTscr4+2he8mLp
 u25IYYXBo1Bk4Cr9w997jlW13UFkf9pHsPLII33BqgHQibnoc1lum+s/AtX8516zhX4KGwB7c0B
 GcvbbPJiqPT3Ww/wInn3uV6HMLQ/C2nGJWX+OAFV26hrWVy259NNKubr9jRqu6VH7jCIxZ3khP0
 EneSPWXFTFdWMJMm5PA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110141

The Arduino Monza board has a TI INA232 current/power monitor connected
on I2C12 at address 0x40. It is used to measure the board supply current
through a 2 milliohms shunt resistor.

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

