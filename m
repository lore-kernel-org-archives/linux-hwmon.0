Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250C73B14D5
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 08:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081661; cv=none; b=kpoLIsGEdJ4WnYMbUj8V5JzbCnqscPPoahziaxR/wl4I+YQ8u4Wel1u4FCUuzHOrw+KAXcgHd7r6JsEbXQi/F6UsitNe8+8c2aBzY4Pp05c2q8k3yhHTNZ+Rxiu8mslek+Acy739k/FPg13bNoJK1mmzHDhUDnY7ZQQopenMkuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081661; c=relaxed/simple;
	bh=+Xxv2iMVAb9T+aphjK66OgMMwBlWTragL+FjrC9B7yI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=he/QPAFlnYDqj/vOFJ/sHBWRsNHbPJk7rSAw+jS6yFctlR3nCIsqVYbuHmestx9ho5xFrvy1I8PZHHmAAvFxv3qLjQDEP1R38Dnj2glfWJ1KxuUJFAfUbO4gAFZHW5xXfws8t36leXqBFeMqg9OKmimIP4YU1jgliphKqxZOYTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hJP9iZHW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AkcBNvbI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hJP9iZHW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AkcBNvbI"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7iWlp904046
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 08:54:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0voObAuVX8sMCu0eQenacXHJUxKc0dgwt+rySh55wjk=; b=hJP9iZHW9ePXHXOO
	iu8Uw1cwKZd3tZXTvQoIsGzaybsZmhr8X7bPmPZCtbIe/L5Sshp9yji2VkFGU7xI
	5iXz/YWnqlpuOaWBJZKxbWdFuH0PcqIUPS06iWtusxJKL64K7Luu0veDngGu8Uer
	lEomhNfVZsnn0xGyhUWib2sxwc65T5V2X9v+JIeIWPzjpIOZWzCqJGM67KxfCfH1
	4Be2c+zrS7C4hJ/kNcAms9YYcmHMd7kbnA23lqA/zBqnnS9pvEdyRFj72QN7rCNi
	kgVAw9l7nrI+jqHTG59kj0ca0aH3xY1LoMPZslExNexBV6PakjQycgmwIKxEoDlA
	LUQbSQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epuket4un-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 08:54:18 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ccd1c3b9caso15092976d6.3
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 01:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781081657; x=1781686457; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0voObAuVX8sMCu0eQenacXHJUxKc0dgwt+rySh55wjk=;
        b=AkcBNvbIIOw8duPTeYxs7p3+BccTVbxaHrOZWy9btlDsGZ6OEfpHE1zEgULznuUzUj
         ngLYOSISSXDVnW9ejV+Q5J7olCX7hNMrs9hTCNZGCM5/lMG2o2gzDp/L9lw1lkpsEw6d
         YZWAdhWxz9ARfYENQIhvUI/iwWJWaxlVnsmlwZbXmyxFpUIKXnU0R6yTkpGlopqeZQ30
         zCFflSGFqzmoD9Qi1yQWJGhISrgBvljxLPQ4z4fXdnOgzcbz9/0rAmigk9yDBUK3PmBx
         5sEq4W8RaUWXnwDCXNQiAh3Y1aXgF+Yf/pgOx6G/qm3fzG1vUGgMVE9ADDtxsY+rZWDq
         FXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081657; x=1781686457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0voObAuVX8sMCu0eQenacXHJUxKc0dgwt+rySh55wjk=;
        b=LZfYkjOihpOBYTLtCURh+l6uNS7WBasaa3OzshqUJYZdZ7t8/Ff91qSZsoBsBxfAPW
         PTLZKulA7l1JmJytha/kVmIyY8utd4V238RWBbbLUflI0PlCtAzmx094cjHm4K8ZPWwD
         ev/HObwkq0vtz+KP6e3yEtDNrKqJlk+K8zSJKAgqy6mDhKclOt0Tpm40HfoAjGssPVwi
         KPB8SMdEn/Ae9LF1uLNonWKF9mGod2bXrYWBrttHAC4cDxDqhQDftYz0p00Zl5IazK0W
         BL9E2ax9zyH+GChONuEZzkw4b6rZweLF525miK9OIdwnJ0KDdh50EAApYCDUoK5DX4/c
         QBRw==
X-Forwarded-Encrypted: i=1; AFNElJ9e20dez48dQ37blH7E5k6sUU3gcQmH1EhkUKpmIPZPA6Q0YOwzYoacgGpLLL/jLahW50yAmIZUwoQixA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5gPSUU44GGshVyHtQe6BmCEiWY+kfSNF2eq3160736lTg4O5q
	0CKT9uDq2XAbrl6Ptoqg9LKt3wHahSy8X/oPPo2oqAIz4nBCqORplt//9h2hbG78ciA+AAaxwtS
	3ZNwCjen6mD+xqL99ScqHIIo590desiVVNtAv/VBgi03C6X9LbZT0jtYy1qJiQLEgBel8aZsvqA
	==
X-Gm-Gg: Acq92OEqlbWFGSGgZpoAPlzuS3hCDsDdqcHibc+rDVcKP3wJUsIEYwr19bl3/e4Z2uZ
	shVFAJOSUoZOI9tZTpCz0gqnXORjNrlOvgGorNgM84JWg83FZed+tuhk7SmZzvxOZMq9UJyNTVp
	L5xLcx2JpFUKLmyIGSWfwy9fpPzAuREXLtwcWYt8gUteP/5yIMTJ8xn0vsIW3ADedb+ozBq3gQb
	oTbxiE4YnkWuUamgkxKg6Pr7QQo+NZbtspM0NYobMqSIWSn/mHFXJU2tyFdnqstRlS9xNgchQZP
	kZPNj++UYKQfiiSGDtlcrTPJ5Neq5nf6P10sTa29pMjqnDflAnRP8O/aOJQkENd6KQoLe0jGHDq
	nQ483dux3KmzI6A0M49nIIlJJSM4EcYf1uAmCff5HDbZiLNRcACgErAqC
X-Received: by 2002:a05:620a:2892:b0:8ee:f43a:bb63 with SMTP id af79cd13be357-915e6baf76cmr725470085a.0.1781081657434;
        Wed, 10 Jun 2026 01:54:17 -0700 (PDT)
X-Received: by 2002:a05:620a:2892:b0:8ee:f43a:bb63 with SMTP id af79cd13be357-915e6baf76cmr725468185a.0.1781081656950;
        Wed, 10 Jun 2026 01:54:16 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e086fesm1183744866b.32.2026.06.10.01.54.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 01:54:15 -0700 (PDT)
Message-ID: <49a0e51b-a0be-486e-acf3-5725551d1715@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 10:54:12 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: monaco-arduino-monza: add ina232
 power sensor
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260610-monza-ina232-v1-0-925b0d12771b@oss.qualcomm.com>
 <20260610-monza-ina232-v1-3-925b0d12771b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260610-monza-ina232-v1-3-925b0d12771b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4MyBTYWx0ZWRfX9sSRfp0pn5k3
 IGTCEUA/hWeHZK+SNf/bjuWCmerxYkLImC4LgrPky0duvgCGPgiLUJD20il9O4hPS03Qj5LNavW
 RE33Fxkqeqs42YOJ0zRS7mtmVHDnO28d1Qe9HsNDrQH7OlM+63Fdu2s0D0kTevtf/fv+Lf/DQGN
 xNAoQ5DVFc07zFfHD9rmPI0tJNoO4ZFWnS0iU1G/KVRJ+Bvsn02VTsHUi++VaNMlTtH6DRmGF5T
 ONTJIqXjySyYE4RSQBJ/U6Ck8rh4DlgAm9kI7rywL9EolnO1mC6AatsTBnWYRXUy/XLaEsEYa5h
 yqUaQXBRw1Ez242ruuLhbgEu85g4fmWqT15tDS87AkRSHcV8gXWEqVm1UEjVFbbNIFmMkwP6sTX
 ZhW8YXXVZijKpwxwxQygag+6FYTIK4wDUoEnktXz+1Xao5qwnnM1ZgxPoIlcpleir/ghayBdZDE
 DzpTqWKtE7/JCw2bMiw==
X-Proofpoint-ORIG-GUID: koUf2WKjsohZnMwnUpo1fR1ee0LBTL0v
X-Proofpoint-GUID: koUf2WKjsohZnMwnUpo1fR1ee0LBTL0v
X-Authority-Analysis: v=2.4 cv=DNG/JSNb c=1 sm=1 tr=0 ts=6a29263a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=STQ2a8oQ04ts6E9hehUA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1011 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100083

On 6/10/26 10:32 AM, Loic Poulain wrote:
> The Arduino Monza board has a TI INA232 current/power monitor connected
> on I2C12 at address 0x40. It is used to measure the board supply current
> through a 2Mohm shunt resistor.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> index 379b796f261f4c8f6b7712c5d340b20be1b9217c..a526c8a07b30c22820f54b54644916b268496209 100644
> --- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
> @@ -291,6 +291,12 @@ adv7535_out: endpoint {
>  			};
>  		};
>  	};
> +
> +	power-sensor@40 {
> +		compatible = "ti,ina232";
> +		reg = <0x40>;
> +		shunt-resistor = <2000>;

The commit message says:

"through a 2Mohm shunt resistor"

and the bindings say:

"Shunt resistor value in micro-Ohm"

Konrad
