Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED2030E0E5
	for <linux-hwmon@vger.kernel.org>; Thu, 12 Feb 2026 20:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770928902; cv=none; b=TyGGmeT6AlBjJQgggJkRsFURM9s7q2i8KeFgqbvkOTLYhIA9GBefLm2/vHiWnrqlI/8ev+JmPchmoPHXhal1Z80DEBYGw/wCoqWiG2YyJPMLeQnjVtoSgE2Jj2kxQQosf7o9EBerGaStcmM+xhHxRC5xHUQv6FxMV9YJzit4fD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770928902; c=relaxed/simple;
	bh=puqpSLgYp5+DLUc+CMOLCPUjPfxEiDGdChhYjSYQkl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J4PoZgumCqYXtp99IPa4vi/8qfjqW8RlrbtV2ToKHHFso/EfdkqujsZC/hadAT03vlPW/apCMAfBV31qf33oP0QbUprfVbIFf7giimsRhJ6dGDwvVUdKbAhThOubl6T10t+VnrfAoWcljd0UCUtDZkWOzYdUMCHGe30USOhTBH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U6xc+6Sg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hyEjWtcM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U6xc+6Sg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hyEjWtcM"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CDRf9M588650
	for <linux-hwmon@vger.kernel.org>; Thu, 12 Feb 2026 20:41:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NgywEGgLe59qtrAUSuFO9PtFp926hXyT4OPCp7SP2Jk=; b=U6xc+6Sgk3ScJ+36
	5Z+JAh6ouasi/SObFaZVJfzkfLzXx3GnBIFcaQVRSar0/7lpNlqNzSI+RvK6usmE
	1mcJbjgshgq7g+/QqJPFLYjkre7/BF/JBnu8F3ERA3JxHB4RxYq1RAR7YgC8EQPx
	6Vqyf49KQqQi9I8a0PQR23V9W6/amU0CfxCuXAa6855KxK5qzMloFJ34Q/Hq8Efc
	pa48ZnYjNsYJsDOaxSU5k21MRh+adi0CWZeyk4aqPdMdkVq1pfOp1lbp5R3eZVT4
	iiGHZ8178TFDQJoElOLhJhz3TzCd1r1neo32fbhPUxdAH9c14JPZTHqTxlEKkuA0
	QK2Zgg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c93snkvpe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Thu, 12 Feb 2026 20:41:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aad5fc5b2fso2149625ad.1
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Feb 2026 12:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770928900; x=1771533700; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NgywEGgLe59qtrAUSuFO9PtFp926hXyT4OPCp7SP2Jk=;
        b=hyEjWtcM9Op7ueXkO6SPtoNO5Ey7a1G+EnSfL6e/dF3/Tk08LcAfP6f9x7K444EH5p
         I2z2Q7rAWGU4NJMFwvrQD4ZTpHNvyPFp8sGt5oRohk2fTQoRWaDnTaAzxeOcNMb+t/HK
         awnEonEHH0ospzzv979OLivAN3xf2495b6pEdE7zU4OInARH3n/scZXzQNzIVphxy+Gw
         LQS8cDGH1k1EkSQ91J4jOeBHN2ufF5refFMw1MDbIH6TD5i7T4PaesJrIAgQiYEdI6Fq
         3u3xVGxCyphGRww4RI+RWozKUXTk5OpV8HAjOnm2Fr6Gcm/K1Ez7nydPgo4PyFoYXan5
         sQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770928900; x=1771533700;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NgywEGgLe59qtrAUSuFO9PtFp926hXyT4OPCp7SP2Jk=;
        b=Zt9gsn+p8wK/oEpRy6UtdKzfewlUXGr8taPQsyg0tPRWMY4vT6zYQQvA0FaoT+Oqhi
         lUJSrgxCarcZ44GsQSlk+AHbCXPOSsscNOnCLIYvza4Bdl0OYxEpP+16NC0AzgRldPGv
         MBoS1D2PoebhqdCVNWDLjJJpf+6wkNZFN23ZfdXIKSjfoJ8kBd2cvrMKzsYQiFnEXQTV
         9tqVUcPkkxcyCQDjOcUrDTTaFaQl5Wt4Kv/QWcbS4hIFnPrXjSWtenk4v3xlVgdMBA2i
         jxfVJ1oeEk1FhXBSckaulF0ayv5h7rTPnZU3Z/lH36fJKR5o6SvsI3XGzRB2MNtrRT/4
         CvXA==
X-Forwarded-Encrypted: i=1; AJvYcCXumesZciQdRLn7s+ULTBICzLlhnRUqJ8etN0ZTcf5A6uWNVBGmA4RktV13NuTsCjSCs6r9bskRpWT2DQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFCMaQ/rIHaijQdpks6OK14q3Ls9VX6DJkeFcSe1FHKe77sE/w
	BaOdz0Y7bAUzuonGmEwChZRnbPzD8pIDq1FvJ0RMyB8/SSJq8SITHjRc6uWMHNTXk5qUP5OPx7h
	ijqNvbJ9H5jAj6EGddoED3thi5gikNA86H0xq1VpIqHaDyMpVXsnjU4u7XXf9+KKMog==
X-Gm-Gg: AZuq6aKfPGZK78g0pHhYKueKHwWWusoiv4DgvaSrkouaVpEJTo3tcRf0iVfjTrhDuBG
	E5VCE4YyhT+0QHzI8b3RTmPD3GpOBTgLdi5R5EmWUslWOAPpQ8hQf+WI/zBSV6lUYVSE0mv9L5L
	XTV3dR3dTW2N8VvJY8UFHUCYkZN5aec4BA2u9mIFIzzJFy/2QZH/7DRawG7EddceRPA9+m82Yw2
	f9TXcA/wxL35S73NeTLLiBlcOiMs1zv+M7xbchg5jNqZ6B270EFbA29jWF5d0G6JfN9kwM51fwK
	jBfrHBJhf4QkXRF7M7sM4AMwaBURsfsqJeYJFeoaqtfXLtIdk5k2D1TNxbcPlQV8lFQuR3oHn7F
	f0D4YTrBlaGAI2Q85TERdqJBuNeQRv6FctTP1FevQvAOoonr0Rxu9YDI=
X-Received: by 2002:a17:903:46cd:b0:2a0:bb05:df55 with SMTP id d9443c01a7336-2ab4cf42abfmr3012625ad.21.1770928899897;
        Thu, 12 Feb 2026 12:41:39 -0800 (PST)
X-Received: by 2002:a17:903:46cd:b0:2a0:bb05:df55 with SMTP id d9443c01a7336-2ab4cf42abfmr3012365ad.21.1770928899280;
        Thu, 12 Feb 2026 12:41:39 -0800 (PST)
Received: from [192.168.2.5] ([49.204.20.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab2984ab0esm59142485ad.9.2026.02.12.12.41.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 12:41:38 -0800 (PST)
Message-ID: <1c92466d-20b9-46e3-831a-ae058cb23c5d@oss.qualcomm.com>
Date: Fri, 13 Feb 2026 02:11:33 +0530
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: hwmon: Add qcom,bcl-hwmon yaml bindings
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
 <yrhfimj4ggs4ecy4qg6lve6v2hc5tzjvya2bom3paialuocyae@6xc4ulemx4ng>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <yrhfimj4ggs4ecy4qg6lve6v2hc5tzjvya2bom3paialuocyae@6xc4ulemx4ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDE1OSBTYWx0ZWRfXwsuY/UbBWJ+b
 BwyrRFIKDozl9RGK3By1sCTQ6Zaas+xCWQGvkG1iBgTmsXEANd/P2VoJRlfLm3o61jTSxnZ3KTM
 FXWW0S+A2cwHLGTOBoPMtV2qknDOHD7m9x3HwPUv+aj6R8EjdHQiLamxS5McpZvsCtJFAL39aM5
 b2nld0CM1K6h2caWr346eDG2vnfgRjcPoBWKOlE9C84TmvyXwSsry9bSxzBA+/RCuabhpq63aPA
 gM6/pps7+d0/JBmBcNN0r588uxzm2Ia5clba/CCApZfYRN6FO1Jy/wF3/5/lunGl5AuWGImEp/7
 SNcbb0fRqS5rjm4EM2z6KWTDzoQLdQn5yuXbHd9w5YYznCc1kTTmB0KMTe3pDTuJfjMEEjKmLHg
 QH4hoOrdP19RgM4F/nluamU4cLmLNhcZs/iS2y8uS2e67cEahqTz7U5GgloZkvbDIahscj6RieU
 n2HJfYtbUXpAqCOUFRQ==
X-Proofpoint-ORIG-GUID: is4bbBCQfrfYefqIK_A9Il_LaDFadfzE
X-Authority-Analysis: v=2.4 cv=dLCrWeZb c=1 sm=1 tr=0 ts=698e3b04 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=vFtg0H/HDnVpo/8TLRRAnA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=GuN8W3Bbd2OushFT6gEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: is4bbBCQfrfYefqIK_A9Il_LaDFadfzE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120159

Hi Dimitry,

On 2/6/2026 2:38 PM, Dmitry Baryshkov wrote:
> On Fri, Feb 06, 2026 at 02:44:05AM +0530, Manaf Meethalavalappu Pallikunhi wrote:
>> Add devicetree binding documentation for Qualcomm PMIC Battery Current
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
>> +
>> +      - description: v2 based BCL
>> +        items:
>> +          - enum:
>> +              - qcom,pm8350b-bcl
>> +              - qcom,pm8350c-bcl
>> +          - const: qcom,bcl-v2
>> +
>> +      - description: v3 bmx based BCL
> You need to explain your abbreviations. What is BMX? What is WB (and
> yep, they should be capital letters). What is the difference between all
> three of them?
ACK, Will update in next revision
>
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
>> +
>> +  reg:
>> +    maxItems: 1
>> +    description: BCL base address in the SPMI PMIC register map
>> +
>> +  interrupts:
>> +    minItems: 2
>> +    maxItems: 2
>> +    description:
>> +      BCL alarm interrupts for different threshold levels
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: bcl-max-min
>> +      - const: bcl-critical
>> +
>> +  overcurrent-thresholds-milliamp:
>> +    description:
>> +      Current thresholds in milliamperes for the two configurable current
>> +      alarm levels (max and critical). These values are used to override
>> +      default thresholds if a platform has different battery ocp specification.
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
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
>> +            compatible = "qcom,pm7250b-bcl", "qcom,bcl-v1";
>> +            reg = <0x1d00>;
>> +            interrupts = <0x2 0x1d 0x0 IRQ_TYPE_EDGE_RISING>,
>> +                         <0x2 0x1d 0x1 IRQ_TYPE_EDGE_RISING>;
>> +            interrupt-names = "bcl-max-min",
>> +                              "bcl-critical";
>> +            overcurrent-thresholds-milliamp = <5500 6000>;
> How is going to be used by the power supply subsystem?

There is no any interaction with power supply subsystem for bcl alarms

Thanks,

Manaf

>
>> +        };
>> +    };
>>
>> -- 
>> 2.43.0
>>
