Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BA03A1A28
	for <linux-hwmon@vger.kernel.org>; Tue, 24 Feb 2026 18:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771958149; cv=none; b=kjbznJDqhfgOoXazVM1xJ1BUzwrjGuQlrAK8OnmifTDDV9sNzHhGjR+GmrwmShpEdYQwXj+YAnpUp1YYkU8tGyNDux3Kz4l1uuCqks/FsjSqOBc8n9XfrJfse2OBGT0GDwtDCr+SC2mOsWCxn7zEXnU5ciK0Dc2SoixPQMzdY5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771958149; c=relaxed/simple;
	bh=EQXHCXGYBNLgtj8CYu1kGo3wDJ8103pXTbf6Uyo4HHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aLOy5FltW8d4CmJkT3ebi4owAK+/AE3VatjWt5/TDwVp/XUW5fjmGZZSkt6hWv/nWp2kw4pLEX8WtGV5tezGR71bCpqiKqVyiObBMenKbwT3/5RAW0c9Qrl+nP+cab+wEeqFEegI8onaypQYlk+WdvAhihliogAdyCH0jzHVWBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qn20zbyc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GNzPX6Up; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qn20zbyc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GNzPX6Up"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OHf8C92560769
	for <linux-hwmon@vger.kernel.org>; Tue, 24 Feb 2026 18:35:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CJPdiDwhztQ6U2fjdX5D9hmlQO2VI5OmiEetfVCs6gg=; b=Qn20zbycvuhusyLu
	sCGmwyCykT2Uti2eP5uXgw2t8psbfrksAfGUNJFQ0h/764gMgvvvmod9zKOhjz0O
	kNDLn1I9/yFOOJ/0aZLcUh9PFZNYyE74JDB0SDG63qJN8Z1l++CNqiXUZd+oRCYb
	jmpXoMWX55/TDnlpAosIwxEuCIOYTFISXAguBrvDJj28kmGjMINyssToQpxnRA9T
	ZFAv+OS4BLyg//KeIGMb3Ypko2ZTMejM8x3hsBpR/Oz6VKhr9QuGflmQ3liegxlS
	aOAw9zBc7O4wJdFFNES5NF2Syq4VOuI7/BuiUitedHLzk2j1IdnWnC+93wMYsA4s
	LqS/Jw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch4e3amg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 24 Feb 2026 18:35:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2adb1bdf778so6419425ad.3
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Feb 2026 10:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771958145; x=1772562945; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CJPdiDwhztQ6U2fjdX5D9hmlQO2VI5OmiEetfVCs6gg=;
        b=GNzPX6UpATzOulOyaqMkF5VZfWsfNWjWLtSVNLqi8P1gWv+H9ChXMyMujpti+GIcY9
         xGFkkQjFlWYcfuy6YbZIx6lvsug1i5gcI0EST9e/C9gfIeW88/zj7Z9GXfenOGOQTiXJ
         k+jpyBIe09h84vCA7TPa1azPwPoBmtg2MVJbpi+NXxmg/KzHi3AnpdzymenercTOuCHB
         vzpqiqlY/iN9Z73a8B5ZsaMONs/tlCFcuSl+mekf0kOjk9BeYlHYNoENMNnQs9M28Ddz
         JnDVYQv19A1vViFjeC6VebmrxYlCAQv2ZePsuH3qWIjTgnApScyQyivmih7WfVANC+4o
         ir6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771958145; x=1772562945;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CJPdiDwhztQ6U2fjdX5D9hmlQO2VI5OmiEetfVCs6gg=;
        b=pYNEh9lXCO1KfQzvv1POsdEYWlSXKWIVkBGP9AUBICp2jlvOjI+IifKcAh/Kl9EkuC
         SnHhghFycJjNpZwA/+ly7di0+LCDQEs+rTNzXaQEajGvo9pOlLDP2xhpEBolhojbtdTj
         EkVeRrVT8QFbd7mda2L0zeeyDPdkD1W7UCWGmp5hJXujFDSqVRVzG+HnBXw8PDytlkmg
         mHwFtTWhDRCMuVrY+NW9uXUe/C7x+41EpM4es2WnyEW2pOcUhfAfzpHZFJaqk45cDtvW
         nnU22kdJXJST5KS0I+Yjo6vYJrP31bcoGdzy7wVMQ7nkbGBshyVJ1StpqJBGfyP4VGLd
         GYbA==
X-Gm-Message-State: AOJu0Yz9RSBa591Cr50AYozVRPlWADvNF+wHFi85lGfHJyqADVF6eJwk
	6xQ2yrbRxtb22P9jFi8kDXOzEU0LSP0a8i7HQUBlqRrT+hbt7Irob9jSvlDN084hSLcKWPwr7j3
	xnfI3Iy+iJiVaBckxLkco6LXjMXW1DbtA2+W4bVW9JFzs+bCm6/yeQA9FVkKex2NGlg==
X-Gm-Gg: ATEYQzy8Gik/BrXTxFLN4kZzoziUcEYV8e3faAPSx6rOZzZSd5zXIo64rgZxSqK7DnQ
	SyhPoGCQRwATR2bok/LAcp4Wfku2RE63tzc60sofxvMELo7LlRd+MMDIcpXYXEDbyB29jw3h9/T
	wj8HIPPplk2BrJ2waWdpXnaD9NwjKzONP/UDQQF6eVD7wZOJtoONX9D4f3CtQBTzu188FLQ9bvU
	9riJW4VQcI0f8K6Nw4bgGYXSgkitgVBIjkO+o2Bd10kCSCOpZ+YqjemE30x3cZZjjdYZhejmeiN
	3XhAnjIjVO5BJBPCr70DEynNaTQ9ecBq4ZkgvjFvLrZXf37NxxRT8fbSB7c9fVRxchwyWDfmKVy
	rdNtiYYroLjtAe3Yb44Yhqm3fqEI4gsyXewAXpZvTTpj0AKVtB4Wtmco=
X-Received: by 2002:a17:902:ce89:b0:2a9:63f4:127 with SMTP id d9443c01a7336-2ad74515418mr118792315ad.30.1771958145440;
        Tue, 24 Feb 2026 10:35:45 -0800 (PST)
X-Received: by 2002:a17:902:ce89:b0:2a9:63f4:127 with SMTP id d9443c01a7336-2ad74515418mr118791875ad.30.1771958144831;
        Tue, 24 Feb 2026 10:35:44 -0800 (PST)
Received: from [192.168.2.4] ([49.204.20.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad75027641sm142943975ad.64.2026.02.24.10.35.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 10:35:44 -0800 (PST)
Message-ID: <cbfd429a-459a-481a-93b5-fc9204d9ca8c@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 00:05:37 +0530
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: pm7250b: Enable Qualcomm BCL device
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, amit.kucheria@oss.qualcomm.com,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
 <20260206-qcom-bcl-hwmon-v1-3-7b426f0b77a1@oss.qualcomm.com>
 <98ad13d8-82d0-4def-917d-b99cf455c5f1@oss.qualcomm.com>
 <fa6ce650-42b8-4090-9c80-7f4e4c85a96e@oss.qualcomm.com>
 <91425550-35f6-4941-917c-f639dfadb42d@oss.qualcomm.com>
 <f62c0595-16ce-4af3-b0e1-0ebb84dc4236@oss.qualcomm.com>
 <81d31750-f301-4332-84fa-a5c1aa401507@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <81d31750-f301-4332-84fa-a5c1aa401507@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=UtFu9uwB c=1 sm=1 tr=0 ts=699def82 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=vFtg0H/HDnVpo/8TLRRAnA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=38XHzwzGw0Zk6fhE6zEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: Kx8957ve8q5tXQ-GlbJ9AXnoBLNo7Ye5
X-Proofpoint-ORIG-GUID: Kx8957ve8q5tXQ-GlbJ9AXnoBLNo7Ye5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDE1OCBTYWx0ZWRfXznmose8nSyST
 iGS5sOy3CbeEEG2V9gpGgUzZpvm4NLRAHklWAiPMNqzZt0bZyigXauUvrnkBgEnjaBKdcaiO3Kr
 F8hI5knULloxsAl7vTywdwMn7NDUtthOn7i+jbXrimDa8tQpvEZXVpOu7jSLZk1sVZ4ZIUDmDKI
 7yHyvG8BwzVuewNxuB9NFT8rpLKo6/vxCSGdf7/biqL4OU1XCBF1UdjBbbILZyDi8SUREQqzyZS
 NYfgWz0iwAyFFe+kqmOo9G1xIfheeRNEQNAtFJw7+lxgpaDOZG9bmGRV3KOf3xHkdvkP78NmY/n
 +N3z7jjwrXH0Cm1zTYcdKZOj/SeNiShd+trJB0mh9/Yf/a6i/qKRBKy0actgU2uJqgf+387y4nu
 D4KzUujc+9PcP6HOACaiop0402dByBNpwNFX+BZpoftNjA+GaJgy1Y66BWhrSY5sG+wR1hwmS1Z
 k/qJ0tQXaVzSbYjioNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_02,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240158

Hi Konrad,

On 2/19/2026 6:34 PM, Konrad Dybcio wrote:
> On 2/19/26 12:34 PM, Manaf Meethalavalappu Pallikunhi wrote:
>> Hi Konrad,
>>
>> On 2/16/2026 5:18 PM, Konrad Dybcio wrote:
>>> On 2/13/26 12:55 PM, Manaf Meethalavalappu Pallikunhi wrote:
>>>> Hi Konrad,
>>>>
>>>> On 2/6/2026 2:41 PM, Konrad Dybcio wrote:
>>>>> On 2/5/26 10:14 PM, Manaf Meethalavalappu Pallikunhi wrote:
>>>>>> Enable Qualcomm BCL hardware devicetree binding configuration
>>>>>> for pm7250b.
>>>>>>
>>>>>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>>>>>> ---
>>>>>>     arch/arm64/boot/dts/qcom/pm7250b.dtsi | 10 ++++++++++
>>>>>>     1 file changed, 10 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
>>>>>> index 0761e6b5fd8d..69ad76831cde 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
>>>>>> @@ -202,6 +202,16 @@ pm7250b_gpios: gpio@c000 {
>>>>>>                 interrupt-controller;
>>>>>>                 #interrupt-cells = <2>;
>>>>>>             };
>>>>>> +
>>>>>> +        bcl@1d00 {
>>>>>> +            compatible = "qcom,pm7250b-bcl", "qcom,bcl-v1";
>>>>>> +            reg = <0x1d00>;
>>>>>> +            interrupts = <PM7250B_SID 0x1d 0x0 IRQ_TYPE_EDGE_RISING>,
>>>>>> +                     <PM7250B_SID 0x1d 0x1 IRQ_TYPE_EDGE_RISING>;
>>>>>> +            interrupt-names = "bcl-max-min",
>>>>>> +                      "bcl-critical";
>>>>> We should strip the "bcl-" prefix, since these interrupts happen
>>>>> to be under the bcl device
>>>> Ack
>>>>>
>>>>>> +            overcurrent-thresholds-milliamp = <5500 6000>;
>>>>> Is that something that we expect to change between boards, or is
>>>>> that an electrical characteristic of the PM7250B?
>>>> Yes,  It can change based on battery used for that board as these thresholds will be close below battery OCP spec.
>>>> It is not based on pmic spec. Max current threshold support for specific pmic bcl is taken care in driver pmic data.
>>>
>>> Okay, so this property must not live in the common PMIC DTSI then..
>>
>> Ack, I will move it into board file wherever it is required in next revision
>>
>>>
>>> I think ideally this could be communicated over battmgr, since it already
>>> has a lot of information about the battery that's currently connected to
>>> the device. Do you think that would be reasonable? Would you know who we
>>> could talk to internally?
>>
>> We are not adding any battery information here. This configuration is specifically for the BCL peripheral to monitor current and trigger an over‑current alarm. While the BCL settings are derived from battery specifications, they are not the same as the battery’s own limits,the BCL thresholds will always be set below the battery’s OCP specification.
>> The intent of the BCL is to provide early detection of over‑current or under‑voltage conditions, notify the SoC/peripherals, and allow corrective action before the system ever reaches the battery’s actual protection limits.
> 
> Right, but as you say they are derived from the battery spec, I would
> guesstimate it's something like "90% max current", so swapping out different
> batteries for the same device could potentially affect this value. Since we

No, there is no predefined equation to derive these values directly from 
the battery specifications. The actual limits depend on multiple 
factors, including the underlying mitigation support available on the 
board for different components (fast path/slow path), the peak‑current 
use cases defined for that board, the battery characteristics etc. 
Simply swapping the battery will not automatically make it work. These 
parameters must be carefully tuned and configured.

I discussed this with the internal battery manager driver team, and they 
mentioned that the power‑supply framework does not expose any 
discharging current spec details. Typically, only 
charging‑current–related information is provided.

For some modern battery use cases, these configurations must also be 
adjusted dynamically based on factors such as ambient temperature and 
battery state of charge. The driver already supports this through the 
hwmon sysfs interface, allowing these values to be overridden at runtime.

Thanks,
Manaf

> already have a place where OEMs are required to add the battery specs, I
> would imagine this could be beneficial to move over to battmgr in the future
> 
> Konrad

