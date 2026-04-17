Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E788033A9DD
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Apr 2026 18:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776449313; cv=none; b=lZ2UtMLHQSj+xN0b1RkASD64nsrPEdJSbF8LnNolCsBRnpVVWsaA3MUvZS/WtUlQbCx7U5X6801RZIKJFH8m2JGF0pJtyrd/wYBk80kDMedmpvpx2qoVDCDdC+PX8JJRZ0JYDsXb3ZDPQufXmuZGE3ut1x0niRGPzalqn5QdTV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776449313; c=relaxed/simple;
	bh=GGBj5Omn5eGTfnwBhm7bOf3DSJcY3zfC7XPsQH3CnY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ENxZ4LpzEtSzbcjPAL+F8AEPCm3BEBCdCSwm44gT0jhjNnRh8Eg12IugHYmgKMe6mKPkkP+eFrpAbphZNfJFjd3I+fOuIFfrV6TGvrW3XDMnJH216YIiVm2q8ymmofY6srFxz9Zt22WyD12a7kyBhpvYx5Q9HoieScml9h/RXgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ARu/+63R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N8cGHqp5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ARu/+63R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N8cGHqp5"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HG49XV2932814
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Apr 2026 18:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B2ETjNBPuF9FkS5G/k+JE8KM1KK1geNXSgpuD3ZMEGU=; b=ARu/+63RHiJpOpF/
	1Hb3ePPyv2yQ0asDXeCVZDLxE3NW1rzhDMFydE9U7Bf69SRaFCBJjne9EE0XT/Wp
	xltTcJXcWoCy+ebIp7BRfSszKAOn94mPY/FFG9+04weblHmO+p8OyKh49ZH23ptd
	/bRbEtced7BCRTVTUSB83UzjV1DE3+DfMm08GkO/g652YePBxZxRoWLEnh+fd779
	lapMCpmkU1hQLw6MoPs4vmETe1Rk/eh7+Lnf9HYXJmKuGFDxrxW/GAv3d5gMDFH2
	nEb+mEAKFCcVWmo6pyaARJsBuV6BAtW+B5zt6fw5BUvIqdB5Ve9gnUYZsfj2urr0
	0d63iw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkhsh9xck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Apr 2026 18:08:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35e59791605so966481a91.1
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Apr 2026 11:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776449306; x=1777054106; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B2ETjNBPuF9FkS5G/k+JE8KM1KK1geNXSgpuD3ZMEGU=;
        b=N8cGHqp5JT3aOQDXXSrqPl0wyXF30k6JoP2AtpWEAj2hsCgRXZ8ZSCmm5L4eCf571n
         TFN/1II7DZwMoePafKrSq3JSaY7oR8k2NNq8F15R0Oks324jqgJhejdlF/pEoALZVE65
         S4GSDuqnc4lSRYk6rxtqQECHZUUiGVy+XQMDtL315pRwL31NQ6aVASfd8n121yMDvKlC
         /AwCv6rrHnztPgv5k1WViYx8xboMMWh2rnI8kqDqk90/KcNExhGaoTbNMXPLXVwSDJo/
         iBwaFtoZX4JUUp3gBqvhrU+AtXCTAUSi8pCuQTauSeF9UVhCLn1zC8zuFyJWflTRkkn2
         68Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776449306; x=1777054106;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B2ETjNBPuF9FkS5G/k+JE8KM1KK1geNXSgpuD3ZMEGU=;
        b=jOvMICBT6cbTEHyBUu9WnIG+ObT/zUisf78+MggjxoOVhX1VWjdjF2OrB5nXS0uFM3
         PSnbBDCXjGAfYMq7PuGfUhvJfE75NvqyW4qNFXK6CrTugB9LtWvobUBD3+FZMuJp4ZFq
         y82uiOMZ7mA5y59Vq16REY2zTqPOt1AJwiRIUA2FgG3S+GJsuzuAETDMf+bB4KLd5Lq6
         cdiTfWkf6dc3k5mLucXmChiw7Ap26yxOeytojvfXe2WM6e4oZPYGQ4Mw8qf38Vvepfsk
         Ec5Z4/7xdnL15SMFOc8RqEi1lFv/tIC56qKFcnZKyVMCtx/v/tz6YjV4AYXMqaKvOdrs
         3VCQ==
X-Forwarded-Encrypted: i=1; AFNElJ+AGeGVzCpsRWIun9boO4RgCQV5oMq3x/iDwUCC3bQWZZuNhPUOHVxR2y6mZ2Zqj9dWgWwzSoxaM/yDjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvW+fMR2RpNvFoALsym1tag2o705Kf5kBKebQKq3EA1cP4Hze9
	IjgK6zFkxKumnzIbQ2T7TXyfvOGPDzx7+x1yjZP1RHOoDwA4VxjsLHvkwRy7VkKalvKXOHAIQFT
	PI11TpFq8YwazddMb0cC4Xu8+ulkA6NJz7gtkGQzVDQ/a/OXLwyzW0uPx1yK2qJbk3A==
X-Gm-Gg: AeBDiesbKF3kklW4ollOoy1fpfQjTyT9h4EYRSMb2Pcfic3/YcHOSozdJZln3znb3zM
	ibGXyOsa/446ZsdZaqQzJf5jy/hXhhaXR4Hu7oMiEqnO/c/lstkI6ix6UGwI5dJZLhlaFztS5wO
	b66gy1OkduOfgVRahoYnpgAxJPTrFSlj5cuxM+0F2LPXJ2gxCVgkKpheBGUD0pHXCqhfno+yOVa
	ijhtAgBnwlWORtfGef0LDJUn/Eie1b+CuKZh1Rv5adLoNKv08FGKSWjtgjhAeDSKVhBJ/pL6stJ
	6fH+apEeBccZya77hgnGt0pMbD5GsrjGnPn5vHuaqScA+kgec+BYUoVc1RIinVlnaLO2+0bVGLP
	aZ8E96D2YSkUcTxwHohCYDEQ/l0FJpm9Bi7zLl91DjtTmifyWNyYyzM/cqTAtTmqh
X-Received: by 2002:a17:90b:4b49:b0:35d:9560:3f09 with SMTP id 98e67ed59e1d1-361404b8efbmr3987067a91.24.1776449306066;
        Fri, 17 Apr 2026 11:08:26 -0700 (PDT)
X-Received: by 2002:a17:90b:4b49:b0:35d:9560:3f09 with SMTP id 98e67ed59e1d1-361404b8efbmr3987033a91.24.1776449305385;
        Fri, 17 Apr 2026 11:08:25 -0700 (PDT)
Received: from [192.168.2.3] ([49.204.17.60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff3bfsm33496785ad.7.2026.04.17.11.08.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 11:08:25 -0700 (PDT)
Message-ID: <680211d2-9277-4a44-b403-a2c17e531d3a@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 23:38:19 +0530
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] hwmon: Add Qualcomm PMIC BCL hardware monitor driver
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, amit.kucheria@oss.qualcomm.com,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
 <20260206-qcom-bcl-hwmon-v1-2-7b426f0b77a1@oss.qualcomm.com>
 <ab1fSWx7pqlSANph@mai.linaro.org>
 <a922cf55-ebe7-4256-b3bb-cc732e45e1ff@roeck-us.net>
 <6f4b27c5-074e-403a-90b8-fe7ef3a993b5@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <6f4b27c5-074e-403a-90b8-fe7ef3a993b5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=d6/FDxjE c=1 sm=1 tr=0 ts=69e2771a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=AEHGBJ4MxtK84nyFdbYi0g==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bmlHNXG4B5j1TUniDnQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: axBDsKcobxvWiYNCvQwunGx-BKj_k6Vb
X-Proofpoint-ORIG-GUID: axBDsKcobxvWiYNCvQwunGx-BKj_k6Vb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE4MiBTYWx0ZWRfX4TRJteQKoxb1
 5xGiE1ygsie91ay/H+y2KCczWGe8akze/gpzfTC8atjTL6jDvhtYNQ7UJA8rS1jRKlmgv0fped4
 68akrC30c+nidpLdpC9fuCqbO+fY6QckulWP1ylj9dLn9wHqq3vR2XGVx3L5d+v8NygHFzk6ykC
 UIFyfi9T63oDlKZbBJk/5hr0tcaZNM6h8CCwjMJu4UzUqH00TbWHSIG4CQ/2Ix23E5yOV4knc/Z
 Yz9GU9ipOyW3NbpuY/EorvCa9SA1VEgRjDdQsmUFQqLeZo4bqNYSETXgwyzVJ7aNkcEybtgLb6V
 EOiIIfguf9BQ2fRVjF//wp+e/eMOQTomKENAw0jJRiQ69imApUhgFjwOg1p7/DgaN8YbCtBsUIF
 o95S6h+GcsYOfoSM2FJmKAXW4ENY2NuRaQmJI3xDya9WvNIIefaCzHTe9vvFmkSFRPBYBJ0XpED
 3Evwy1gRxCgQAi86Npg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1011 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170182

Hi Daniel/Guenter,


On 3/20/2026 9:38 PM, Daniel Lezcano wrote:
> 
> Hi Guenter,
> 
> On 3/20/26 16:22, Guenter Roeck wrote:
>> On 3/20/26 07:52, Daniel Lezcano wrote:
> 
> [ ... ]
> 
>>>> +
>>>> +ADD_BCL_HWMON_ALARM_MAPS(in, min, lcrit);
>>>> +ADD_BCL_HWMON_ALARM_MAPS(curr, max, crit);
>>>> +
>>>> +/* Interrupt names for each alarm level */
>>>> +static const char * const bcl_int_names[ALARM_MAX] = {
>>>> +    [LVL0] = "bcl-max-min",
>>>> +    [LVL1] = "bcl-critical",
>>>> +};
>>>
>>> IIUC there are three levels of alarms but the hwmon only has max/min
>>> and critical. Would it make sense to do adaptative min / max ? So when
>>
>> hwmon has lcrit, min, max, and crit alarms for all sensor types, plus
>> an additional _cap_alarm for power attributes and _emergency_alarm
>> for temperature attributes. There is also a generic _alarm attribute
>> for each sensor, which is supposed to be used if the specific alarm
>> type is not known.
>>
>> What exactly are the three levels of alarms ?
> 
> Manaf can give more clarifications, but it is like we have yellow, 
> orange and red alarms. So there is an additional alarm comparing to what 
> is available in hwmon. The proposed driver maps orange and red alarms, 
> respectively to bcl-max and bcl-critical.

Yes, it is different limit level alarms (3 low voltage and 3 over 
current) like yellow, orange and Red.
Currently I mapped, yellow and orange. Red is not enabled.

Thanks,
Manaf

> 
> I'm just asking if it is important to have this 'yellow' alarm ? And as 
> there is a missing alarm to describe it in hwmon, how can we use it ?

