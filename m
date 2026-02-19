Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216EA33ADAF
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Feb 2026 13:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771506268; cv=none; b=ET42tdDJfmmVZWjpqpkIf6hjcguMIV/phUOzbT4S3Y9F/S3Oueydv6XgD0jYXc5Kbwsb19N6vzlB418ujDT8vVvfS4wJvZlVmuJ/Zu/6ew2mQ4b07g8EkXFfcN1jb1tTILx1StEzwFJtux671Ue9qxxE8sNU/uWNMlELSwXkwko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771506268; c=relaxed/simple;
	bh=1NeJm8sPIVVg4lGdDswPtIieqlhK9RJ0JG6NPd8z2MI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WGuDKhNVc0Q1CeO4EP6GBXb0WshS5JJnWMlGfrV7lN1MC45FANtWvZ0LraxKus09J1ma418ILUN0vplFEj8LPVsAsZYZ0yuuzX+a/BWJdGn2xV57YZFAqWaf4r+9XiDiR0SEUpvCcpfYdzlTUFgqYheJKav7iP1HuAksJbteMOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g/xLzWYa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hb1k7hsU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g/xLzWYa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hb1k7hsU"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JC1TXb1923760
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Feb 2026 13:04:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tta6p1UfArJB2f1ZLaS24vMXG5SGG6hI3ls4c9vUi0s=; b=g/xLzWYaZAS2bBWg
	JWzT/LveWvegH3N7zrFO6QdRNJTcLZNISsMN/krf3tyC9PLv1D8EtakrRm/X+nUO
	QTiwOgOcHeYp0b7TBQFkyqMuoBSt8ySJQIxK/gY2CIWczSrNWOgaN3sHXNoOVfbg
	1PRjlp5l9CJfTUom8JpT3ILdYazTR/mhBTo5T25pPdChfjWvaahZ9XbmiLMnTVlE
	Yrhuwspltlf7Q/5xFgiD5tqR903bwKKN38k8csF6m/+xbTKATAe4JBoPSlmLTnqt
	CQUf1pv5UaKqCToE/zboS2IO9fJdhZKHCQQClxWTgz2l89s5oin6V5K7O0n08ivJ
	Uq1ygA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdqdg9q10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Feb 2026 13:04:25 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5fd493bc7a2so187907137.0
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Feb 2026 05:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771506264; x=1772111064; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tta6p1UfArJB2f1ZLaS24vMXG5SGG6hI3ls4c9vUi0s=;
        b=hb1k7hsUmcebMIUlmFtPvkIh5d6NiF/OhfBrZCPF/7oAOFE1MhRSxshgRV8PfZyEyt
         5e3A+Gppc8Twp6nXBXkJMawf3pxwXg4PxTw9QfMcJB69u4HdahX8AiOh2sA9M95ZGzec
         CZdsqGAKnCnY7+7JgW9rO9XkQmYIZARsFQbSsDTkTzs4KSm4TbZVXxa3iS1erztOXWJf
         szgSmD4VrFXzPgY0DaF2v0YPvhPymg/8b1/I4ZZP1d2bgOtrK3aln7LfHucutQRKn2ks
         NrDJ3UYLXguUzxQPbQ6g6Kuk1IMWDjw6bbDpS2gPpgXv/s8hJEsl0v9AXGceUCrfcgnn
         fM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771506264; x=1772111064;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tta6p1UfArJB2f1ZLaS24vMXG5SGG6hI3ls4c9vUi0s=;
        b=Q32BFvS0IlN+cSWtahuUjj0xsVak7qyJ3/krI7NrSKOQlwTp+bv8Mo6KQ29uXj8VsF
         AqiHpbqLg0bpI3O05nfppDsQA88/ponNfhJ98l6LC3XH/mPDs1zYw/6kawgEZY4Xeqav
         moZoZqhBhNdSr7nJ+deX3szjHpHeME3QTB4tPq3QX6BOQpCnSko7buWljrB/LJeH492R
         O44pXpoChQJR3jtLHEM7jlPx986Q7XV3NwdbPIrCsFjgbAh0d5Ejxva9225yQAeSuPfv
         vTT0qItufvr6qHP0nwE3hOYVREiXF3BiKGBvnyvMU9BSO+DeqVQcG1QyONN09QFuuvCY
         bLjA==
X-Gm-Message-State: AOJu0Yw5M7ZrDAso/eZSd1Spj/BLfLCQSf8+B/xdESj6ltaYrIaoQhzy
	cyrUbTs0/JoEo3dCBaSNpHLou9a27fTOFt+OpIaCIarxhZ63KzqoclPQFb1dlcXzjKSZy9dcSRV
	3VmuyiFL08/BjVAgdbcW/mz+LyYuAmfCcHVaF+H+/Cu563vmk/fGReyht3EOchHLoOA==
X-Gm-Gg: AZuq6aLP48oKIZBuFNL3c6fKAOVrqHVVaItnLU0WIokm5/5CYRo5e9N5cTKS6+IiVuX
	OuHVyfIA+p1l7TvmSajkLz9tqZqAWY4qOlClfuwqM0flHTxKA+ugEHLTSr/E/JB40HNy83Ck8Jc
	iJdULulgenVXSFhrFyb507wh0a3AVUEeqFczO9Gf1dSDdA0ivs9BLSYOOr1ue6vwTqPZ28HcGZP
	ltFv8qQLPGyqZiQ9Khg+LpXiOQShVsjUZYCObdGH1wJ6VSKigQDkiza9Tdk/h4J57TtHd9LhWTq
	C5UT8zNlkZZGrm5xli0AUaHgRhioHH3if1qIp3j5NM+4EgPT8kqvhhaRGTLPj+L/14TfeLEf1A/
	wiBoqMaNgXDQskWVOQ4evBPM4axgjAfaZPC9T8t2kqA9669IBbfIbV1dA/3rFOE7lvmFa2Fqwm7
	i5uhw=
X-Received: by 2002:a05:6102:3f09:b0:5ec:95a0:6aac with SMTP id ada2fe7eead31-5fe16e93895mr4524649137.4.1771506264143;
        Thu, 19 Feb 2026 05:04:24 -0800 (PST)
X-Received: by 2002:a05:6102:3f09:b0:5ec:95a0:6aac with SMTP id ada2fe7eead31-5fe16e93895mr4524635137.4.1771506263611;
        Thu, 19 Feb 2026 05:04:23 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7627895sm583473766b.31.2026.02.19.05.04.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 05:04:23 -0800 (PST)
Message-ID: <81d31750-f301-4332-84fa-a5c1aa401507@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 14:04:20 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: pm7250b: Enable Qualcomm BCL device
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, amit.kucheria@oss.qualcomm.com,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
 <20260206-qcom-bcl-hwmon-v1-3-7b426f0b77a1@oss.qualcomm.com>
 <98ad13d8-82d0-4def-917d-b99cf455c5f1@oss.qualcomm.com>
 <fa6ce650-42b8-4090-9c80-7f4e4c85a96e@oss.qualcomm.com>
 <91425550-35f6-4941-917c-f639dfadb42d@oss.qualcomm.com>
 <f62c0595-16ce-4af3-b0e1-0ebb84dc4236@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f62c0595-16ce-4af3-b0e1-0ebb84dc4236@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: FvqgDFo-2vFrjRd-oGwA5xl3JLL1451m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDExOSBTYWx0ZWRfX2uUul3rA+g0b
 zo4SBholOaloeV2KEqmkZgaa6YGZxlCU6MLRUn2yY+CAQU0E2Kk/b6801lozScQ+D9O5+eLqnAi
 ftzYAReibiNtoMAmnw5vKNdkcDm49gf02QbHacg6nIA0X0kyJ6YQIQ0C8VF/IXMLYq9Ufgt6p2R
 foO+5IXatC2bIJX3g1CaOB2paERWJ7e+CsY0ArkEKYZXYFn8CGpAsCPFfLqc5FPWy+xJZ+MBlH0
 7Cjts0ju7K51WBOPn/MYea8YraJBJ5o4c3Hohyp2TONw0PZFCniZEFHRMI1+2QWeg35c63dO3MW
 GX0bP59aSBgrzXLEVuavgeDC2h2CCgFiGNRQf2atJu05+Histhf7+ZbYa2orGZTXqHOm8F5al7n
 1wr+TSk+eXJrP2HsBAw6f0MBYZsdYSD3DrgF0GBVv80TXuniynO2uXr2iH5AHGXUagLpQ/HWpZC
 TJEiN8IZEsHvJhBmVEA==
X-Proofpoint-GUID: FvqgDFo-2vFrjRd-oGwA5xl3JLL1451m
X-Authority-Analysis: v=2.4 cv=W/M1lBWk c=1 sm=1 tr=0 ts=69970a59 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=MO18dg7sMrBkYyaxiDMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190119

On 2/19/26 12:34 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Hi Konrad,
> 
> On 2/16/2026 5:18 PM, Konrad Dybcio wrote:
>> On 2/13/26 12:55 PM, Manaf Meethalavalappu Pallikunhi wrote:
>>> Hi Konrad,
>>>
>>> On 2/6/2026 2:41 PM, Konrad Dybcio wrote:
>>>> On 2/5/26 10:14 PM, Manaf Meethalavalappu Pallikunhi wrote:
>>>>> Enable Qualcomm BCL hardware devicetree binding configuration
>>>>> for pm7250b.
>>>>>
>>>>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>>>>> ---
>>>>>    arch/arm64/boot/dts/qcom/pm7250b.dtsi | 10 ++++++++++
>>>>>    1 file changed, 10 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
>>>>> index 0761e6b5fd8d..69ad76831cde 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
>>>>> @@ -202,6 +202,16 @@ pm7250b_gpios: gpio@c000 {
>>>>>                interrupt-controller;
>>>>>                #interrupt-cells = <2>;
>>>>>            };
>>>>> +
>>>>> +        bcl@1d00 {
>>>>> +            compatible = "qcom,pm7250b-bcl", "qcom,bcl-v1";
>>>>> +            reg = <0x1d00>;
>>>>> +            interrupts = <PM7250B_SID 0x1d 0x0 IRQ_TYPE_EDGE_RISING>,
>>>>> +                     <PM7250B_SID 0x1d 0x1 IRQ_TYPE_EDGE_RISING>;
>>>>> +            interrupt-names = "bcl-max-min",
>>>>> +                      "bcl-critical";
>>>> We should strip the "bcl-" prefix, since these interrupts happen
>>>> to be under the bcl device
>>> Ack
>>>>
>>>>> +            overcurrent-thresholds-milliamp = <5500 6000>;
>>>> Is that something that we expect to change between boards, or is
>>>> that an electrical characteristic of the PM7250B?
>>> Yes,  It can change based on battery used for that board as these thresholds will be close below battery OCP spec.
>>> It is not based on pmic spec. Max current threshold support for specific pmic bcl is taken care in driver pmic data.
>>
>> Okay, so this property must not live in the common PMIC DTSI then..
> 
> Ack, I will move it into board file wherever it is required in next revision
> 
>>
>> I think ideally this could be communicated over battmgr, since it already
>> has a lot of information about the battery that's currently connected to
>> the device. Do you think that would be reasonable? Would you know who we
>> could talk to internally?
> 
> We are not adding any battery information here. This configuration is specifically for the BCL peripheral to monitor current and trigger an over‑current alarm. While the BCL settings are derived from battery specifications, they are not the same as the battery’s own limits,the BCL thresholds will always be set below the battery’s OCP specification.
> The intent of the BCL is to provide early detection of over‑current or under‑voltage conditions, notify the SoC/peripherals, and allow corrective action before the system ever reaches the battery’s actual protection limits.

Right, but as you say they are derived from the battery spec, I would
guesstimate it's something like "90% max current", so swapping out different
batteries for the same device could potentially affect this value. Since we
already have a place where OEMs are required to add the battery specs, I
would imagine this could be beneficial to move over to battmgr in the future

Konrad
