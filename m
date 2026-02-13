Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D09350D48
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Feb 2026 11:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770983736; cv=none; b=WBYXyhSWMPwi01zu3HZsrAePjQY27ZDttOSshJ7C8co1T0HLjLQugt0piLOEakJHV1uFV6Au3lPMz8+5fYYitjEKZJBA7M21/ZfyZdP8LVXOBfPPJ41qiRZopwpiEvvSZ/avqxR6XCHmutBV/aP4bFHSeLnIZH2+8iCeLk++YV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770983736; c=relaxed/simple;
	bh=sz/axaANDTa8BKdieIycz4ht/o4pjp6rqdiubmQgERg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BBSv7vRPbi5/GauTBL3bFf50RzIrcmndqFq7RReZZnBM2MXoXkkOVD/2C3w5EEo4Tvgwjx9sY9jvdkvVbdMqmBQXeDSPqtREmYD7wK29adljxerw/J44uZbgdckpctAkqExJOZ1mC2CaVnOZhYISAJP9aazeyND0coR+UKQegnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SavJVvS+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A+XgabWZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SavJVvS+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A+XgabWZ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D7MTXN2627965
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Feb 2026 11:55:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v8sabKoPnoM50c9RRPi9ukR8JerxJG8+uHFtlCWAJ9U=; b=SavJVvS+nWZRN/Yk
	xCaBBxkSTtRUwhv1hCoXKHSRouId7dEYRODH/jZosZkQZfDEfNWw167+3NRaiZ1m
	YNOMVqmV2ubjxQDvVygRAAdF79ZQ6nA01kbiDLmeLNkRBZQo3johPfF/eHyKlLWL
	aOLSXXxqybZzeqqsYpi3t8CKoSr6KdhNyo1fe4EFo9/yG/SgcQxnf5hpWwB+B5HY
	/V73/aX4s+n9xgdAvLLpnrCK8JDkeS89lWzU4/z6QG/BoIVHD8W0lsbK/ujMbEo+
	7TtM9YDShIpfZrbrixQ1rU+x1C3qrXJwKIuLmjNU0iFSyvrKENq3McbZ4iRr2FRa
	VHXpxA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9ygurxqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Feb 2026 11:55:26 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c6e1e748213so650861a12.2
        for <linux-hwmon@vger.kernel.org>; Fri, 13 Feb 2026 03:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770983726; x=1771588526; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v8sabKoPnoM50c9RRPi9ukR8JerxJG8+uHFtlCWAJ9U=;
        b=A+XgabWZSUcgLcz/ubfIb9COtdIXNo4fXOt2pxbInIeAIJEqImLokeKGB/yIp9CRVZ
         wK9IB+GL1LF2nFhHA7GWSwoNUevjJ32vI2VIyfes6QyAOqXxdM2SZWHavdHF7CJhEJGX
         o0Hjuu+h5mFXiRjRLYvsvmoa6DgjC3cTsD3LSEfHcS/4vjsIyNADCDH5zOE5uLHXPnmG
         n98oxxOduk5JsXx7pxLj839EOC/qV3ccx9CxJFP2rDQvYUobAEDIwjZEW2KO3kp4Mjhf
         lBOA+Sn4uPZviGIxBjDDZxLe/A5JfRsSM+CgxueCLa9D2cfqYWWsuMfbdc0zF85m69Kb
         XDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770983726; x=1771588526;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v8sabKoPnoM50c9RRPi9ukR8JerxJG8+uHFtlCWAJ9U=;
        b=Zm4e8Lz9zwdV0L7avrkDMoRQ6yCKk824a6V+1tJusvW+CgByUGTy6t1t0ZAZD70dqQ
         VcoW1BKzZhXKVEyaMBykp/04cftG4MqJZ7yKhjPByb/Zzs5mdCBlDHnetrH+cOpXF1/6
         hAMZ0pgQES3n7rOCJ6olLLY3M3BzkOpOUz5vOq0b+sClamztnix2Bg3iSXIkDx3XV1+f
         MllgFKul7YnPZ7CKqnJPXQDz5Khwo/WcECGpaOJjbvvDmw9P2BIJKAzFofB4+xf9Uym0
         k6a5aJ5nmU6pZhOiWqXkKCEyy5CpE3IGrYQVX/vubXFXFLczik86rb1bkdqTz3KC/YYR
         M4TA==
X-Gm-Message-State: AOJu0Yx8Y398hKmHvh2c61uR+z/FV6E9m4OaWFUGdPKOOLK7kwY3zgqc
	76ee0AAo+wNO6gNn5viwkqY3uAbO+tjMmUkqWNVYvpyZdE11Pe/hRrAS7F9WqUgoj0UZlJ8Y3xf
	/kuARWqqMzdgc2BoMK0tZBJgMvwodoDnFjR5XpkAxywFBvZgfBc8RjruvJTtFK24Au6hkNMNCyg
	==
X-Gm-Gg: AZuq6aJk5GgQbGmebscDyE+2RFWKpxMgbVcKT6TPueEcBUzEjxg1PpbD4lx7zwQuU6q
	ha01NFC3nzuki++wBZzzjn6RYVAI2mGolIGmyv3OhwQ8z2XYTabCMcrA491UrQszid6SyoLsMKs
	Si11jWzmjEaOLBi9SuV2uiChkbB5vo5egFVMWriTXnALiVd9izrEHlpfacL+KLMW/fDj6LhlamR
	/vdo9YVaiI/RfgE97k1KJJfVZB/ird+rztfDqPO83g8VLq1+66+nKCXR0aanoMCVwG0eZ1LC/wm
	lfI5jl4kw0PBPRS18wTvvzWDMhcQib0Mp7jP91VPY8Y4UpoYQlYCBwmpQ0Lg6Lsf/BAYBRSwvzy
	GdBpfmJeANPz2T9AexxMNDQnlm13dvjvuI6E2plOW3lwB+51qkVANc/9O+A==
X-Received: by 2002:a05:6a20:cfac:b0:394:426b:675e with SMTP id adf61e73a8af0-3946c8651b8mr1702508637.39.1770983725725;
        Fri, 13 Feb 2026 03:55:25 -0800 (PST)
X-Received: by 2002:a05:6a20:cfac:b0:394:426b:675e with SMTP id adf61e73a8af0-3946c8651b8mr1702479637.39.1770983725125;
        Fri, 13 Feb 2026 03:55:25 -0800 (PST)
Received: from [10.217.198.130] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e1969f314sm8095313a12.8.2026.02.13.03.55.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 03:55:24 -0800 (PST)
Message-ID: <fa6ce650-42b8-4090-9c80-7f4e4c85a96e@oss.qualcomm.com>
Date: Fri, 13 Feb 2026 17:25:19 +0530
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
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
 <20260206-qcom-bcl-hwmon-v1-3-7b426f0b77a1@oss.qualcomm.com>
 <98ad13d8-82d0-4def-917d-b99cf455c5f1@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <98ad13d8-82d0-4def-917d-b99cf455c5f1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: UAzUIViJU3ItzJo8hGftXi9BbH2z1cR9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA5MSBTYWx0ZWRfX5M5Fbcovddwm
 8huwhnvBHQtHAtDFxLX5lgESjoz4jOBDypB9DhhyQBZA9posm4HGZDPfcjR12eiX5eoOT/dvCPY
 zl3mj7RI+XerL9LiD0iJheUhgASDFKbJp9ROpg6j7v0NY8JrN8LnsiohburJBd5DJFJZYobT5Pz
 Tg4dLOabcBcq/Gb3avt6GpBJugA7ZSt9iJxGgkA5+KybCwtq1RHBteEHPmw2gBYGfsP7T776BwI
 8N55dS8hvZ0lqlXq2FTZzP+1sER1ckCMcPuphKOubaC38EsDogsEKMIL3n2/rJ3II+qzweug55U
 RoSTOzhedJVA78/0sZ0tDg1MTlbPOvur6ed35JX2rkcfkwcT4Ml9KFIhChDo9S0S7DG4G5MBeLS
 Www/0Q2R9il1d+VOMy/zHHZhxemwexvlR9NPtwEUFf4iWHClA08Hex0LkXbKGGn9FMYSk4LmYnP
 5ILxYg/fmx2oih4ARYg==
X-Authority-Analysis: v=2.4 cv=If+KmGqa c=1 sm=1 tr=0 ts=698f112e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=ACex8TXLvSLCdC7mc1oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: UAzUIViJU3ItzJo8hGftXi9BbH2z1cR9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_02,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130091

Hi Konrad,

On 2/6/2026 2:41 PM, Konrad Dybcio wrote:
> On 2/5/26 10:14 PM, Manaf Meethalavalappu Pallikunhi wrote:
>> Enable Qualcomm BCL hardware devicetree binding configuration
>> for pm7250b.
>>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/pm7250b.dtsi | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
>> index 0761e6b5fd8d..69ad76831cde 100644
>> --- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
>> @@ -202,6 +202,16 @@ pm7250b_gpios: gpio@c000 {
>>   			interrupt-controller;
>>   			#interrupt-cells = <2>;
>>   		};
>> +
>> +		bcl@1d00 {
>> +			compatible = "qcom,pm7250b-bcl", "qcom,bcl-v1";
>> +			reg = <0x1d00>;
>> +			interrupts = <PM7250B_SID 0x1d 0x0 IRQ_TYPE_EDGE_RISING>,
>> +				     <PM7250B_SID 0x1d 0x1 IRQ_TYPE_EDGE_RISING>;
>> +			interrupt-names = "bcl-max-min",
>> +					  "bcl-critical";
> We should strip the "bcl-" prefix, since these interrupts happen
> to be under the bcl device
Ack
>
>> +			overcurrent-thresholds-milliamp = <5500 6000>;
> Is that something that we expect to change between boards, or is
> that an electrical characteristic of the PM7250B?
Yes,  It can change based on battery used for that board as these 
thresholds will be close below battery OCP spec.
It is not based on pmic spec. Max current threshold support for specific 
pmic bcl is taken care in driver pmic data.


Thanks,
Manaf
>
> Konrad
