Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6032338596
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 16:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776873714; cv=none; b=Jze21szQO4rLlb0RSyaTkoJz4MvdsJQQ7jvt6y6ZTtmynqqCjjxWApyCQY6E8yTxf+oAfOujD/ZkxM4RdWDjvjVf1DClsoZkw51CTUz3ElF2lSNaFM8WYWEji/dq/m0eqc3E6cqifXXv8k7rxSSgpf/qZ2zHZ46h98TzszTzDbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776873714; c=relaxed/simple;
	bh=o6jX84yg2Ct8H9sQ7gKIiIsXGPNUyXKJy8PFaF9vsd8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LBirM0JiXXdevD/u9walbCB2CI4mmAGdJw3xCzvlrBVz5cJuTRaf69SxvPGXRaOvhOE9hp0tKODi+zEEJYuqPVDYEBwkvGKx6szEPxFFMza4oWwrGiOsxy0yKlVeMmJF+JIhriGGo/gRFqKRsYOx3CKVvixiTC6vilnd9sVtNBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hhZF251E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yq/AQWoJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hhZF251E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yq/AQWoJ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MAp5S22123575
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 16:01:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+kcBHMPox19CCVrcCwTnG6bXSCj78ShYnTQf+unKAiE=; b=hhZF251EuVOLvaJo
	ap2nH7ljGJ7/aPEUUqeF3tJwJ9TNMc0zovy6yicrRsOwJftAsSKMP0HsiUkOt2WT
	41VcMgJv3qXHmt9TJKiIdiE7U8i6jbo1CVy0tbq5wIOzgJxzU9evclCJddg5x2x2
	GLTyI+GVfcUhdDPzoRfClJsQBpW3Du6F9U4vgno2HrOWMXKvMZPq7x/PgbUt4oAk
	fqL2K5ijScfJdQF+nw2YuQ88Fb95QsWAgUBBLY/y8nqaZbxPKRIX+TR/B+auuXxr
	QvOjFd99ti3k6SZAYqBsu8KOczKJ9bzpaZIivAPKkKOqifUEqaH/nVTsnr7fVyee
	Kfd+3w==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenfv5t4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 16:01:53 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-46fec31defdso9204124b6e.0
        for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 09:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776873712; x=1777478512; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+kcBHMPox19CCVrcCwTnG6bXSCj78ShYnTQf+unKAiE=;
        b=Yq/AQWoJyN0zVqw3v8DuYcueb5HTvSPbPt3lWVuh61FqqU17OcKEwtxXZr5fOVFdXV
         E6E3tPdkwaks0fPR2gziYBIQnArQ7Fvsq6mQ/IkZlg8M3y2TGSICWSFBQpkHPcDb79WP
         lXKr9bnoKr4Ev9Wuj3RxIlCPJ8l4LOoYMl+3H71toysB1RnBuPtGnqGODmWK7/YlCMGn
         Aw4bRoUkZ4TBpKwOA8A8Iqq9/XhUMC0LBxeZWEW5zb2Z7vZ7uDPfRNCVOOhOFOWLChoF
         gxze0xqLOR0I9a3DQxwPi1Kbb2Lm0Mm5rdh/owSUwXAHmxFcO/XVVD4Y58RDNsKJxfjY
         gKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776873712; x=1777478512;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+kcBHMPox19CCVrcCwTnG6bXSCj78ShYnTQf+unKAiE=;
        b=dhOGuFaVvD3D/Um92A6egiY/c2XDIUzyFJP7h9KEwxyr/7TkQ/Cse/C21KYz+oaEh2
         ZcHB1TRLNeyAm0miYc38D+JETYdv5vipYP0NPpcd8EtXnUrjErGga7mIg80VoNK1JQOA
         J/9qDdcIWQvUvNJtzsDZVTVX+kURYULajud3kpdjZsjPaBL6+v+PNespbn7dxx0g5Pee
         wG0WSSTKnncukoJB05hraJq6Ea+eCpwzlVGNH/obe7dmPjgcYFzjyWgZtmgxwasTkGqp
         ngA02CZtHitQ3t7yycnQRnZqsevEYKJQw1Ii5qKGbuDaOIrV1zhF4vstN2EiEt3rw8tD
         dM7Q==
X-Forwarded-Encrypted: i=1; AFNElJ+HFGVxn6uZDq4IT54tVCLhJSPAIoxBuJ3d+l8WGQy1wDOrYWG4vzINJaLm8SgdcR/j6DBDkCMhAL+9uw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOpUcSGSIpO4mJlyqyzru5H4GLk8NGBgHnQq5ckdX76eLAlMJ0
	Rf3ElHNGSObmciEAjXRiesFk8IaA5ATdcz3jPMOLOqaybjTPQMEKx9yLLaMPStX40NDdRvNMWX5
	2N2OR4eCG0jfkdF7dIvNH8InGk5s72w5RdRx/bpoDxeRlGQEs5TS6Gd/OjxviYF7Duw==
X-Gm-Gg: AeBDiev+T7LIiSax2iaxxT7gWGteVkf5HQ5CP+ddq9aof8oXfo8WqZywELKIdjnN2XT
	ziCQwUK3AzdtEHrMS6nubGQA35Z8iYGhH+fBIX1juvV5ZtFUBxqV6/qcq+cg6Gs1TD/A9tlLU8B
	Xl2qztCdiGKcyAdakKMHwKPaMsZjd2+BLG2wL/fInPp4TNm7C6FpRiS6OkI4ORGk5zj8IpSVK3x
	eWaoLOYeOPF4Fx3p6nT/im265H9TAJmZVUZst6gCZ4ybQNu29rB/p6ugG7qD8NP7C58WujKB7I8
	I69L1K6EAZrPP8JaecfbGye5gFDTM6wWK3v9I5A8+48sWgmzGoXOo+Suiw9JZsKie8AK1NQfIt6
	nmrMF8jE2RPOMTsyydYb9du4hTiry2dXzqmLe9Z7az0FrjzJSkcIiiQcYQYTA3CzOAxApgjyI1a
	rNV8Yh22GFlMwGuGQYNKA=
X-Received: by 2002:a05:6808:e68b:b0:479:e826:ccdd with SMTP id 5614622812f47-479e826d1c3mr3812360b6e.5.1776873711963;
        Wed, 22 Apr 2026 09:01:51 -0700 (PDT)
X-Received: by 2002:a05:6808:e68b:b0:479:e826:ccdd with SMTP id 5614622812f47-479e826d1c3mr3812253b6e.5.1776873710861;
        Wed, 22 Apr 2026 09:01:50 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb74c68asm143199855e9.3.2026.04.22.09.01.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 09:01:49 -0700 (PDT)
Message-ID: <41514250-3da6-41c2-8a33-41a50c0b3602@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 18:01:47 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 14/14] dt-bindings: thermal: cooling-devices: Update
 support for 3 cells cooling device
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: rafael@kernel.org, gaurav.kohli@oss.qualcomm.com,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Benson Leung <bleung@chromium.org>,
        =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>,
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
        Amit Kucheria
 <amitk@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
References: <20260419182203.4083985-1-daniel.lezcano@oss.qualcomm.com>
 <20260419182203.4083985-15-daniel.lezcano@oss.qualcomm.com>
 <20260422-calm-badger-of-courtesy-809761@quoll>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260422-calm-badger-of-courtesy-809761@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OdioyBTY c=1 sm=1 tr=0 ts=69e8f0f1 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=sgfxO1epDbPhlZI4IqgA:9
 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: XoGstcgOOsHu1yTuhdngIM7TCFF6QopW
X-Proofpoint-GUID: XoGstcgOOsHu1yTuhdngIM7TCFF6QopW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE1NSBTYWx0ZWRfX+aLWEvLfPNfN
 BK7X4Nv7fj7l+yqRHirrA/LzXrYmt3n4Tp9ugCUOrl+r/kiSkjC1AUwwOusN+x1bQPtDwgnuulB
 Bl9ot66WxQjenB0/H7T/U+bN5v8VXaOvKsY6/X9iV6uOtFJcpejYALP//86IpL4qfX12A8Qa9hj
 6uMnlfwwPTCSX0Xo+0b5cTrTpUXz0yxZCUjDPAyA9WXbMwl95KhcGjTAttNadyuwYUp78PUgw4H
 b4j3YN9vXEqxMn/fUsEIySPy6SiqAiF8fZOkaSLTvnLsCDW/0jdfiPd3L3cY5z/VgzatY+xwm50
 TKkPsVToyOm+HpI1P9YNilXghXFZiInmV66l7M6iB5cpCVpQlDz6zqpsLjLMQAZ0+AEzWLpiONH
 jZAmIWqYfJWtHybv/2ZE+AP7yM+J5XGq5AN8/BqjzNxJEQd/s87Tku7OGTPoWRaNGlFP0FhYj8J
 bk7XewFWyUQ63/UYM6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220155

On 4/22/26 09:31, Krzysztof Kozlowski wrote:
> On Sun, Apr 19, 2026 at 08:21:58PM +0200, Daniel Lezcano wrote:
>> diff --git a/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml b/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml
>> index b9022f1613d8..28f5818f1e60 100644
>> --- a/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml
>> +++ b/Documentation/devicetree/bindings/thermal/thermal-cooling-devices.yaml
>> @@ -44,10 +44,14 @@ select: true
>>   properties:
>>     "#cooling-cells":
>>       description:
>> -      Must be 2, in order to specify minimum and maximum cooling state used in
>> +      Must be 2 or 3. If 2, specifies minimum and maximum cooling state used in
>>         the cooling-maps reference. The first cell is the minimum cooling state
>>         and the second cell is the maximum cooling state requested.
>> -    const: 2
>> +      If 3, the first cell specifies the thermal mitigation device specifier
>> +      index for devices that support multiple thermal mitigation mechanisms.
>> +      The two other cells are respectively the minimum cooling state and the
>> +      maximum cooling state.
>> +    enum: [2, 3]
> 
> In the same commit you need to narrow
> Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
> so it will keep value of '2' (const: 2, like all other bindings).

Ah yes, thanks !
