Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EDF2777E0
	for <linux-hwmon@vger.kernel.org>; Thu, 12 Feb 2026 20:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770927899; cv=none; b=KZqN0ORYxDubvlL/rr3CZl6CkBcUGijPaf076E5eN2/04kO0vI2bvAogVVVW1haUrli9BveSXIhD8BVkhOvHArie5xR/6qF2BGZgc3YIJvC3F8yOUHx/frd0yedO2HERZaQNS/zXoHHiaMCjg2DShSArqFQsyzBQF7BgcAth4xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770927899; c=relaxed/simple;
	bh=z0MqLM9tPrQBVm9SriOBamLQ+piTfSlt5beztrKO9Dk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D0i1qH0nnKWJENN7ihHzcnamw+cZehbmI0EyIbfQo8hZ0mAZ+X3ySA2B43404QhQWjxiHP4xmFh/zc2p2yEauqE57A9VK6PCWTKXieZc7U8GQkTMA5twK7rAKiWMJNbTZnOD8JFTIsuWf+dKfKgw5Jqb1v/wwuH/DF82K+ZkJ/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BV3Z6Ppn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R10hHf98; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BV3Z6Ppn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R10hHf98"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CDRgJK4033391
	for <linux-hwmon@vger.kernel.org>; Thu, 12 Feb 2026 20:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uKYdLADorOb0aef85RQYXnUPOkx+7cAVnEN0Fv//BAA=; b=BV3Z6Ppn6qugW25e
	7pp+UYLeo+UAGAajAXEOUfhmef4hrEFoxN2cEbljoY04rAw2pOa0ajI4hlY5dI6W
	It9SxApZLQQc+1aCXKbWw87HMI7WozngBFgIOAJ+TycEvNEbJ/IUFdWDk6tKDvE9
	+/2A3f/vYpwr5gTy8CalsQNU4GN3XkZOash1Tje8WcZd8V+v+Aho5GxEKQvkZMyv
	MPZ4bXyJZzAH3RNNiAn+HkMBbninH5NfZVVL/p8lb76fcqWKUZLOf5FXD1nqqbrI
	1IPc/fS4Dkh7T8bApxKCs3S8OknOh8z1AD5gyY87GyAvIl1z2VmPwbKgKC6Vs86a
	Quz7pw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9ck2j52h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Thu, 12 Feb 2026 20:24:56 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b62da7602a0so111280a12.2
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Feb 2026 12:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770927896; x=1771532696; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uKYdLADorOb0aef85RQYXnUPOkx+7cAVnEN0Fv//BAA=;
        b=R10hHf98BriXgOSKYgQK/3lvScIJUgQYgXij2FKmU1ERT0IZFYEEb09PnKzseJm/5R
         CtEewR9mUd5Xg4M4HFNZvscta8vMq31MqkEOZq4VSoOLIYekZQPClSn+GEKOivm0NxGA
         TaC/2vUIDOtQioEm+j0RdWK5Bu5bS6bMjGOUzwbqtq7CgbmdRgqnFxP4YbfORStYYEGG
         2iaB6SuRIoJNYjA805x0u5tI2zKxS/clrF+5sCnne7BRQZCqdzd68gPYmuYKaZPFyz7L
         C7grhdPkQsd2V5aqSvf+TXejR+AwSHmcQTC0GaF3dEaerE9LTmj4Gs8mpdEtmNW168iJ
         OL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770927896; x=1771532696;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uKYdLADorOb0aef85RQYXnUPOkx+7cAVnEN0Fv//BAA=;
        b=Oh/x2hkc6WANd7h0MI8eNK1HAROckJjjfOP5eRknVV1bRzIm27SPpEKjoHO2z/hOD9
         Tq3RyUWrt4Z2gmR+0VWcbgKsdqTmLYghdh9kQUoMDSf92854TSKjs39Nb1mv9KaM42R+
         F137ffTVZzf+BI8Lf58nDxfpvuyfHwl2dW/YM166xzzaJlM3zFlkR8xa5lzmmPuMNorl
         Y5DR0SRhE2H6o4eYqLYR8AiSZzGz04fK07ZOqrz7gDA8z/Ab1VvoIkMgR4KNz71lw8hM
         G97oV0jrZkoeQkHNG1Un2GVP6moKq0RBovti3yYJrhgziFLgzj/nPoWutZN7BDzEZn1d
         Tdog==
X-Forwarded-Encrypted: i=1; AJvYcCVAyR2na29W1/65vlLbbrzblYmeMR8/V4cR7xL9/5CPp1jvlP5vkB7YV/vnPS3wGibWYhsNY4fCSaQdnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTEYvVb/njdYAcX4+O9pGXmtGDSnQMvhF8CTmR1T6+Ci0/e+F5
	hSkdfzcdhCo7eqastoen+tAZ62WXy3PwFJ8yR6Fre/t7MR0H5OH7YWD4atINI8Ut/n9h2IrwkYJ
	a4B1Hwh6CYz8Ed4Nqb0pzVF/9SBI7zQKtYIxPCzQuUGKB0brgiuVtZFdDYFAyw/JqMA==
X-Gm-Gg: AZuq6aJ0na9XbG0Ef5viqwNsdCjT2+SB0hi1J+vOPmOz92EISkKHNClHwQ6pn7JLXCx
	ADb+8Lfghp02e02mxCTNrsnWjGlAuzRDemsyELnyVAmAnSRPvg8tcbpKEFXWnQ5MNDyW9f8GcRN
	uMhy2SLFLVKthn6LilgeNkJt3sW88hxbZrQHR24fK2oy1NezuzgLuMBEpilz1gOoWm3C0bm2o0/
	oDqMNXz7rZPj2wVpeY7O3U3hqZRmwGPz9UsTwG/EEH5IyVn3EcvmltXaEs+X95j7ZVzI2zhgS2Q
	zyHXhyfBu+i78pPr2ILaF9h3WLsfAcwPyvn5wf0nQwZ6SifvCNvyOZ6aCmuK6mUWWLaba3UvDG3
	GZk1D9ILtCYzliVtkDHF85Kx03Lhhmc739IqbNfI8slU+P29ow9dU2GQ=
X-Received: by 2002:a05:6a21:150b:b0:366:14b0:4b03 with SMTP id adf61e73a8af0-394672af719mr16688637.63.1770927895629;
        Thu, 12 Feb 2026 12:24:55 -0800 (PST)
X-Received: by 2002:a05:6a21:150b:b0:366:14b0:4b03 with SMTP id adf61e73a8af0-394672af719mr16666637.63.1770927894991;
        Thu, 12 Feb 2026 12:24:54 -0800 (PST)
Received: from [192.168.2.5] ([49.204.20.221])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-356a88a04a5sm19658a91.13.2026.02.12.12.24.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 12:24:54 -0800 (PST)
Message-ID: <b286f784-1246-464a-a678-dcdcf3350f3d@oss.qualcomm.com>
Date: Fri, 13 Feb 2026 01:54:48 +0530
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: hwmon: Add qcom,bcl-hwmon yaml bindings
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, amit.kucheria@oss.qualcomm.com,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
 <20260206-qcom-bcl-hwmon-v1-1-7b426f0b77a1@oss.qualcomm.com>
 <20260206-tricky-funky-bison-ffafa3@quoll>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <20260206-tricky-funky-bison-ffafa3@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cd7fb3DM c=1 sm=1 tr=0 ts=698e3718 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=vFtg0H/HDnVpo/8TLRRAnA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=gEfo2CItAAAA:8 a=UXIAUNObAAAA:8 a=EUspDBNiAAAA:8 a=GuN8W3Bbd2OushFT6gEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=a1s67YnXd6TbAZZNj1wK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDE1NyBTYWx0ZWRfX/rwwMSWy2oXE
 afvKn+xk9iA3WYTpZRp5w6WqrAs++nKPw7FHFfCpRaMhM+RFEvg/qbDWE8uVmhlpmNGV3ORbMSy
 Dr8VyCzM88f5mLgMMiIfGh1t9kz4SbUBjr39lzybaByMDa5014ggk9yx96AVtfHLIwZosPvVbiz
 L721+txba2sYSsIC2g0JMvu7yOiVpxvywEfNjXM0EhE/P0GbyKzYMaE/PHSDH+Gda2VvxQP5wLg
 6hn10isXik21fPhXHuBmLZ5LuMpr/3Exp9j2om6Bu7Vt4rV6kXhT7kMCf/usqw1Rm57ZxnoFhhD
 Dsr4J/s8q8ueYZD4uwpbW6JWsj96ik7hSwO4gjTduv5oxwmW401pdlRGVBhl3/dAyHVVGDoPiGT
 Nf3jdvo+sfeqrrPVhYvNCMb9AO3XaKvM0jFrq3oTZKpLwxWDTPaTB6AhJ5vzixA8ps4cdBKch/Z
 mwLPuoFP4fp/rv7AABA==
X-Proofpoint-GUID: hPUtGJZ8DquCCwiTQpQs2XMJyoKoWz06
X-Proofpoint-ORIG-GUID: hPUtGJZ8DquCCwiTQpQs2XMJyoKoWz06
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120157

Hi Krzysztof,


On 2/6/2026 1:39 PM, Krzysztof Kozlowski wrote:
> On Fri, Feb 06, 2026 at 02:44:05AM +0530, Manaf Meethalavalappu Pallikunhi wrote:
>> Add devicetree binding documentation for Qualcomm PMIC Battery Current
> Subject - You almost hit bingo of what not to do. You miss the third one.
> When you hit the bingo, get in touch for a beer.
>
> And before, read the docs, because this was repeated SO MANY TIMES.
Sure, I will update in next revision
>
>
>> Limiting (BCL) hardware monitor. The BCL hardware provides monitoring
>> and alarm functionality for battery overcurrent and battery/system
>> under voltage conditions.
>>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/hwmon/qcom,bcl-hwmon.yaml  | 128 +++++++++++++++++++++
>>   1 file changed, 128 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/qcom,bcl-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/qcom,bcl-hwmon.yaml
>> new file mode 100644
>> index 000000000000..a0e8eaf13eec
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/qcom,bcl-hwmon.yaml
>> @@ -0,0 +1,128 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/hwmon/qcom,bcl-hwmon.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm SPMI PMIC Battery Current Limiting (BCL) Hardware Monitor
>> +
>> +maintainers:
>> +  - Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> +
>> +description: |
> Do not need '|' unless you need to preserve formatting.
ACK
>
>> +  SPMI PMIC Battery Current Limiting (BCL) hardware provides monitoring and
>> +  alarm functionality for battery overcurrent and battery or system under
>> +  voltage conditions. It monitors battery voltage and current, and
>> +  can trigger interrupts when configurable thresholds are exceeded.
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - description: v1 based BCL
>> +        items:
>> +          - enum:
>> +              - qcom,pm7250b-bcl
>> +              - qcom,pm8250b-bcl
>> +          - const: qcom,bcl-v1
> Drop all bcl fallbacks. Pointless, incorrect and misleading.
ACK
>
>> +
>> +      - description: v2 based BCL
>> +        items:
>> +          - enum:
>> +              - qcom,pm8350b-bcl
>> +              - qcom,pm8350c-bcl
>> +          - const: qcom,bcl-v2
>> +
>> +      - description: v3 bmx based BCL
>> +        items:
>> +          - enum:
>> +              - qcom,pm8550b-bcl
>> +              - qcom,pm7550ba-bcl
>> +          - const: qcom,bcl-v3-bmx
>> +
>> +      - description: v3 core based BCL
>> +        items:
>> +          - enum:
>> +              - qcom,pm8550-bc0l
>> +              - qcom,pm7550-bcl
>> +          - const: qcom,bcl-v3-core
>> +
>> +      - description: v3 wb based BCL
>> +        items:
>> +          - enum:
>> +              - qcom,pmw5100-bcl
>> +          - const: qcom,bcl-v3-wb
>> +
>> +      - description: v4 bmx based BCL
>> +        items:
>> +          - enum:
>> +              - qcom,pmih010-bcl
>> +          - const: qcom,bcl-v4-bmx
>> +
>> +      - description: v4 bmx with different scale based BCL
>> +        items:
>> +          - enum:
>> +              - qcom,pmv010-bcl
>> +          - const: qcom,bcl-v4-pmv010
>> +
>> +      - description: v4 core based BCL
>> +        items:
>> +          - enum:
>> +              - qcom,pmh010-bcl
>> +          - const: qcom,bcl-v4-core
>> +
>> +      - description: v4 wb based BCL
>> +        items:
>> +          - enum:
>> +              - qcom,pmw6100-bcl
>> +          - const: qcom,bcl-v4-wb
> I really do not get what you are expressing here but all this is wrong.
>
>> +
>> +  reg:
>> +    maxItems: 1
>> +    description: BCL base address in the SPMI PMIC register map
> Bus defines it. Drop descrip=tion.
ACK
>
>> +
>> +  interrupts:
>> +    minItems: 2
> Drop.
ACK
>
>> +    maxItems: 2
>> +    description:
>> +      BCL alarm interrupts for different threshold levels
> Drop
ACK
>
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: bcl-max-min
>> +      - const: bcl-critical
> Drop bcl
ACK
>
>> +
>> +  overcurrent-thresholds-milliamp:
>> +    description:
>> +      Current thresholds in milliamperes for the two configurable current
>> +      alarm levels (max and critical). These values are used to override
>> +      default thresholds if a platform has different battery ocp specification.
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> No, please read basic guides or presentations about DT bindings. The
> suffix already defines this.
ACK
>
>> +    minItems: 2
>> +    maxItems: 2
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - interrupt-names
>> +
>> +unevaluatedProperties: false
> You did not bother to read the docs prior to posting this.
>
> You are supposed to do internal review first. Did it happen? I checked
> and cannot find anything. It's not acceptable to use the community
> instead of your internal review.
>
> NAK
My understanding is, it is optional. I will send v2 for internal review.
>
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    pmic {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        bcl@1d00 {
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> If you cannot find a name matching your device, please check in kernel
> sources for similar cases or you can grow the spec (via pull request to
> DT spec repo).

ACK, Will use  node name as  sensor

Thanks,

Manaf

>
> Best regards,
> Krzysztof
>
