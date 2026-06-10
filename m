Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416F63AD528
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 08:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080341; cv=none; b=lb/AUL1dyOcpuYJZTh7O+iSX73ZSMBvfeRAm3fLgaYylktibq53Glg0cynulVwopbxg8OU0jmUIAf5EGXu4bq4Z4fHScjQoRJa1BiZ9iE2JgMhFfXKnhJjSYvKHOBFEWyFDHyrU7ZHmr6yhZTmbugB0PX7rvJ828Zq5TG/r2Hok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080341; c=relaxed/simple;
	bh=ZMZ0haLnYHGr9lz2l/xLLeBW3Xp7jlOSPcKxb6XrxfQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KOuANRxG0y4y7I2sy31mH+1EQpfa4VcjaC6yZpNq0MX3YZhju1ta2xWswH1r4nGQrzLhlhvuunTafY3hJUboog7FuNIOcTiQwkrbxOYhDfOlnGF0ABmKQ8XmHAW7MwpQUGytM8e6Jz858NZNhh6P+vySgRIwmXirmNtCmca6Wfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cFcIreQT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jqvqFGXy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cFcIreQT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jqvqFGXy"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7iviV997673
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 08:32:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9NSAT2gPPzQ2leMvOvufErSPbINc5MoKAW/mk4EovYA=; b=cFcIreQTSpc15f9r
	Fh1rWdYgxQO2o+PloPdWhJWVugh6IMzLTOqzRSpOYrzRyuvPEvJhqbcYqQvH10eJ
	wIA8YszVjKD7c+5hrkz6uMtXOJIb8b0cC/AWsHNZrxYrR2XSXhWFb5rEVEL7knO8
	kGGchkimKyBRR1yjtNI2OOGNwdXbdZRV6vkIbQfpIZ/iaOSK0y88s9bS4aUZYqvR
	dgtgcZ/UPFtSp8On9atM1p+iy8rSb/lYR5M/SUts6g10SejZYFID6qLmRinSV5Kq
	Wp8bQnuLsU/5Z0cGlXLndj4fu+PV3wcBVi6nGsdt0hRkU8ybhaHfM2ndl5dyxNnQ
	Hf9xOA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq10a8uj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 08:32:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51768072950so88195361cf.1
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 01:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781080339; x=1781685139; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9NSAT2gPPzQ2leMvOvufErSPbINc5MoKAW/mk4EovYA=;
        b=jqvqFGXyZaD89yTaeSeQlA9wtXON9loqzPj42A5zwm2vAXBD5hqZ/i9GdTOWHpHsXv
         IPMO73iH6+bwDPeRH+YaWpK0OZKfj7HY/bp42tbQC0XZOUlXU5sVEKooaj+KRg2WRveJ
         TnxaJ1h3JwZ2EtQiuVGY6H13EsXkXNfGbiJp7vkuJyM5tkkuuKHZTNYW+e933ABxk34S
         GbP/HfALxdmOGv7EtDVwf/zLGt/WS7iDYYGGt1CP9U+Fb49FjSOBE5evER1Z7uZgjDje
         5Fs8X8gS3KJ5r6vrdVi6IVyVL8/PRqgFAWny9GOdhSivvcPxmaDBFy+7EDj/puOPF8/0
         t33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080339; x=1781685139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9NSAT2gPPzQ2leMvOvufErSPbINc5MoKAW/mk4EovYA=;
        b=ivgjsYvRbIpnYKUdPbb36lnArYiMeJd7kbuM13xpTHmZvzn8TLfHlIGbshv1gfeCSu
         4dd/inw/4O+mHAehdpBO0kgpc6XSwzKLQjwMn+KtnA/6bhPwBnQ1tI/vNX/6TTMKfOs4
         0kbndXv7MVJg6Y1JfWIArbPpOTm25eeuJyuNCBscM0WePofsRFV3LKtEugrvAnSEGUNP
         FPbhV3uhdv59atx4IIGwOJYBE2S4A1fCHKIMgzOFLn1yEraL0yt3rRjPQ5kfVsL/g76x
         pzUTPw7ntJh3S3T8eYBdITuMo4mJJyq9lkb35EHkSl/eHcO/dXuQKyF8F1QvuGlxeRaQ
         BS9A==
X-Forwarded-Encrypted: i=1; AFNElJ84JeIG1WYLlBVzmLKDf4MeGbhWrP2xxIjSnJc+gTUnFSD+Zgj6ou3Ud0kVXKG6pU4Lx3nR58mBffF17A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5E9mV7ibhBb8sZNk6+1KvijqI8fm7dk2y6f01fte4DxnZgBCS
	V50nIXlRqrCxnSYk9hfapBTUkC7+nTkVie9oyXH5YO9x88WdkxCTmZmxCzoMIht76AhPuOQuaBG
	bwK3hqVXdz4infsjHR6xxcncmA9nLY9jNCZa4tMYdJtDWfO0OdyOWEbpcB7R9OHNs1g==
X-Gm-Gg: Acq92OFmcd4RMbKJ8zuifry7HZE6+BzN/L7QF8EeKRoqjdKRypajx3Zh/fvKSUb2iGf
	xhVZ1LIoqJ4PeMbZA+5ltzuFUKCftXtADKs9kkw8n+J6Yd9csYQ88Zw2eDbz/C/H0f/7w7g3eMw
	FlSLcKfmsM1eFEg6EFpOOY5E3gju+bUtmSuDpHMYU9UZ4WQ11HS3j2WmsTlspL1awyfARcaR/qC
	zWAVSVcQWuXYAYPUZy2b0Oqq/381a3duy9qENrtV7mDT9mxQitKOvMb2SdHrVmb2adHpQCFogaD
	F7LQbTE5IToBUiarQzlk11gIwBM2kstBdG1QaiZxgM/JOPWOJ9DXe8YxCCKwcdwaq8gLyc038NQ
	8cpyssbM86rzVobKXVHuRGs1viPzRuoUt9UNwerSrwnlNnsR3N4kQg7zIXpXfLPptpQj1C+ZLe9
	3My5kFYvbK7BCJYv8ei+gNGopXXBE15H1x9/wQnyi0c8+XGf5i9IKfs0QpHkjCgF75WI1/rmw1F
	ujGs9G48bkd
X-Received: by 2002:a05:622a:2d4:b0:517:e192:f896 with SMTP id d75a77b69052e-517e192f9d3mr23136451cf.25.1781080338713;
        Wed, 10 Jun 2026 01:32:18 -0700 (PDT)
X-Received: by 2002:a05:622a:2d4:b0:517:e192:f896 with SMTP id d75a77b69052e-517e192f9d3mr23136011cf.25.1781080338186;
        Wed, 10 Jun 2026 01:32:18 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e6585154dsm9516218a12.15.2026.06.10.01.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:32:17 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 10:32:13 +0200
Subject: [PATCH 1/3] dt-bindings: hwmon: ina2xx: add ina232 compatible
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-monza-ina232-v1-1-925b0d12771b@oss.qualcomm.com>
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Martino Facchin <m.facchin@arduino.cc>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=GoFyPE1C c=1 sm=1 tr=0 ts=6a292113 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=QcpCrrypq3z5zaV8IXQA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: jQaytd8XGnxt8VXA1dHjD2gCJB8jSnx2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA3OCBTYWx0ZWRfX8KrG21O/w7F4
 IdkO8XqsEnfmL1ODZSGZwPhfEzJS96jrLupxHBM1KZBls7FZOUb/1cpMw6Y5ViPvLOjxNc/GaPS
 lrU8JdgrabnmuX04a4FAzvu486/O6QaU1U+iRESuZCpX9uKJ59xPGI3Z/goT+Wyl/vmyBWWAvyW
 fmnN32+mPrxNc134Vxn5yocpGwAxA8mBXX3GLABp/3Y9rWZ6AjuyjoL9WGCKZTW7FHW5ccDhFIA
 jvSnVAessam8KTx525QqoNPU280m8h3nEvK/tmdUOx0uNtBWMKxcIEIkGzk8OorWoKeOR997nlj
 ZjYbwl4xcQo+6I1mUJGop/itwfABdneH0WXvDQHkWvo3WZKhZMYjd/DU/pVBi/bN58EnPe4yCns
 u3l42YAR3fErCK8F25LThGHCrdeU5mkctV1EBmI9DJZlnNh7RVh+tLJfvCQkI608XoukjZAiTRo
 qpOLbGkdg7BUzm4nrAQ==
X-Proofpoint-GUID: jQaytd8XGnxt8VXA1dHjD2gCJB8jSnx2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 clxscore=1011 spamscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100078

From: Martino Facchin <m.facchin@arduino.cc>

The INA232 is a current/power monitor from Texas Instruments sharing
the same register map as the other INA2xx.

Signed-off-by: Martino Facchin <m.facchin@arduino.cc>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
index 009d78b308596ca795bebdd160431bd718b127e0..a30888c9156b977671b3c48937d4ba972406ae91 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
@@ -28,6 +28,7 @@ properties:
       - ti,ina228
       - ti,ina230
       - ti,ina231
+      - ti,ina232
       - ti,ina233
       - ti,ina234
       - ti,ina237

-- 
2.34.1

