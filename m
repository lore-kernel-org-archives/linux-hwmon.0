Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEC147CC69
	for <linux-hwmon@vger.kernel.org>; Thu,  2 Jul 2026 12:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782994660; cv=none; b=kUZw1T9DSasQaLpL/FRFIhcnxTnF5HvteCsQsOc85Re2Yg7lOmPdSk27AKDSXcvbyJMEJeOUv+YXc8+X44bOk7/XFTk5b7VibJCmAqEdpL1ZH4KfxohbfxnGWTRK0KhAgLmqcXUKwTpM1slAd+0UcT0u4PyBIkFJze+3TZOGw3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782994660; c=relaxed/simple;
	bh=d2zjVFisejDw5DlWK3026+2i4XLfiQgYGnyp8NqtcPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lhs5Qyu9tjM+5J+B18eH+5D+vJCa/avJJLjg1TNZ8AxzQNUstlbKDneVBwn+OtrUkRZWbAZXtdxliuhvDr/ofyq0Z6nAJkxd/k5x+vuunL+Rl3bmY4wtHWsBIaJ3U96OP+mIYxFnK28lLsgBViSnNbh7e72g/EMcGqv4M0G+34Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k/7bB8IL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b1H3iuTJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k/7bB8IL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b1H3iuTJ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662AkDRW3592277
	for <linux-hwmon@vger.kernel.org>; Thu, 2 Jul 2026 12:17:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xgLLk6Qbqh+v+ks65vVMnB0B2zxHQjGcUHKVyyKq4iA=; b=k/7bB8ILtTDhbbU+
	q/jbwd4Ps+xgqOjcsez/it8MIa44mRiNh03RNDg+3t824EkvbbLt9A3v3UD4dbLE
	ssra3Hs3MkmNwczHwFX0jO86vm4DHoU3WzVFwAOEN53E+OA0DauuAtiIT/LrOTCt
	4ftFjypqoD/H7SPlkJRGGbJ2TnGYKNH5GBLsyNLuQpsN3M3rx1ffRMYQ96QNJ/Ib
	FZhmndeor/IuBW0f5ljHCmclwQkVajnNoKO+NKuaXdoqbP3MA/437fgxSJw7uD1K
	iPtdVLhU2E3Ly3j1HpDeuLIHSB21e8rBJwO/JrGaxsdWL/cqap9UKTZq33QT5KMY
	dFM8Lw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h7n9n6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Thu, 02 Jul 2026 12:17:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c15c77619so3564951cf.1
        for <linux-hwmon@vger.kernel.org>; Thu, 02 Jul 2026 05:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782994658; x=1783599458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xgLLk6Qbqh+v+ks65vVMnB0B2zxHQjGcUHKVyyKq4iA=;
        b=b1H3iuTJRjEcV2KD+gpqTKfT3QlVRAIXsduUOCS4ojpuOdGVx1g3td532a0s5WInp7
         2jUvWxaheRZ2+oxzIeqdM4Kkuy7nJMNm7ul+X0Ebm7sf8XSUikUaGr/K9p2HluOqDT1A
         y37SP6hIOXCXJUu9ucQbTbz0Z3RVadWo/5ytXP4rY8RuySJb8MEkEjrWAFmoTuedNEvt
         j6w+3qdLttWex15pr/I8QZJqBbCwA9J/WbED7P94K+U9Rjx5ij04idx8jAP4mdiL5KtK
         DGLlsSBHeUZ1nlbWlyIu+smbAQF9iDjw0E1TciUoNpODEHMDRKtxi1tvwl7o15/nIE0O
         koUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782994658; x=1783599458;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xgLLk6Qbqh+v+ks65vVMnB0B2zxHQjGcUHKVyyKq4iA=;
        b=b7PWvp3yl61D0gkkOCSNtIrylGnk4HUXF6swUPM/Poz6Jl46JpvnXOakAV8QUb/S13
         xjcTuWFuAUy0wKLIg6wS/QpvBWzkzA+fdTYpHEL88nXv/K9Zvykg3aJyriK1opf2sTwL
         aT5Narly4/YCzurPk+R6qFbuubVzaDmzObWg+AyFNs2HhdjgGY9ylBdQeL22+vJ9M7ZN
         pLb3XAZeRqQkGwuEzzu9bmW2ngp/BSKd3xlsHUVJq1hjz5te7Y5CMoBtYS7xnUei8OZw
         a/B939+yBQyiDbJr3X0cZ78WZFGeVFCD6tpugZsH9fnG78YrARAYTPM7CgtM2XJqUk8q
         9MBQ==
X-Forwarded-Encrypted: i=1; AFNElJ/TQUDsriqbSzsE9FuTIHUPdPN219POCs84Q4zvBjENh72JlEPv7PeeExfeFhrw/XZpzHXiOTBSv1c7ng==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJo0V+4Mt8YTfV/JwmO763QjQdrL0JjGGtlqY2hmSe1lyr2lhV
	CQRUoAgVTdxPqdMNxl5s3As7UQlb9S542aS1lbwL2fjkPSz1K0voSzLp6c8TQyU7gyLtPzb1yr7
	VDH6NGJ2ES68x79THyrK8mFAyxQODjhbSvG5dQmbE72A2g6QCg5hjxe1mNggj+P1rcQ==
X-Gm-Gg: AfdE7clQ5AMJ4WN2Vb0aicW5X7PIibHVHgSxZPjV3Iopz0rBcJ4CokQnha3iTfrr/H2
	SXt1Nh9W3QhybhmXr37TiZe0PLgm3ijcFJAK+8EtLilk+/sOtcDw+naHzy9D7lJQMnHCZS+2XxB
	TVFDuzwKRF/bliGat9azwi6LgoNA9cSoHqT8v7g6PQIEDaAHhakjbytDnE9xBQQtopEOqlrVeO9
	yvw9Ain0vLlNkHi4gkPsuG/49yDxVbOnQ01MCc5MzIsbow3h4UaLSLj6F5hNYPSX/5lrHTjEDKc
	Al7xQAAOpNdomWTEf8JRCqsc1I6le2mtpsTkLNtSkQ5m2OhOj+ln5N+0QjKpWTbooJLOjUIryFK
	BBiYUD+Lb0slmWxMizyI5KMpxhB6epYcAi7c=
X-Received: by 2002:ac8:5a86:0:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-51c26a5611bmr48830391cf.2.1782994657833;
        Thu, 02 Jul 2026 05:17:37 -0700 (PDT)
X-Received: by 2002:ac8:5a86:0:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-51c26a5611bmr48829951cf.2.1782994657207;
        Thu, 02 Jul 2026 05:17:37 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6091785sm122892566b.16.2026.07.02.05.17.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 05:17:36 -0700 (PDT)
Message-ID: <6bcfcd62-d831-4262-9ce9-66e12a72b3f2@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 14:17:31 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: x1e78100-t14s: Add thermal zones
 for keyboard skin and charging sensors
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, sre@kernel.org,
        hansg@kernel.org, ilpo.jarvinen@linux.intel.com, linux@roeck-us.net,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260701103714.22583-1-daniel.lezcano@oss.qualcomm.com>
 <20260701103714.22583-3-daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260701103714.22583-3-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEyOSBTYWx0ZWRfX0GJQczZeMzxS
 RWWhAXM0AJSg2qm+lkhIjTaXWKSM3m0ED4Bw+lhoc/HvLZrtqQUg+48QOOc6J9n3MrNKxEyIdrz
 UZTtTtfUmFzj8Pwa0ydU+FYJf9it67VjEK6rAuXBCjgLXqxKrPrW9LuUW+aDWxRBr/EHMlxOR7x
 FnltdNUVpgNx0IFc0QTOH6OL+2a+dO4qJpqMtSg9KgVHWGQuTAd9jiBcFyZVpp1LaU8/iDSxFJ6
 rWdG4W/9mmXLTx2By93JSnroCxbTWc3yUj5nvnsZv4y+u4W8VKMvSwAUIHoFA+m9OiZNWO9JKjf
 5Rk4XSs05qalpk7GZ+psrblhVfx3j8Ahb140PyhN0VgKn2xEO3Q7UzrEZtUs94s1gmfx78QnqUO
 dETvd8f05GlVaAQlsrhLvLvIh6/beZtVEBtaTesCdSmCJvCZdN3MQN73tsoA1lNhCkU3U4iQsIi
 JgnBdKRKbDsAyWQkpag==
X-Proofpoint-ORIG-GUID: 2-fwvvswOaLWFT9zjvby0bslEG-MKUBL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEyOSBTYWx0ZWRfX9hLJNRnyFH/Y
 3dXroTHX5LJQmb6joZ+eLeUqOjNUr4C9HRzIQfVKw0WrcWu13RwmBy4s/KuGCQ3UlTN98rjhbAJ
 UAh/kjxRZmV6QoeYK0AE9pHKcXcVA0k=
X-Proofpoint-GUID: 2-fwvvswOaLWFT9zjvby0bslEG-MKUBL
X-Authority-Analysis: v=2.4 cv=WMBPmHsR c=1 sm=1 tr=0 ts=6a4656e2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=4cq-bv2Ru7092N9bbaEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020129

On 7/1/26 12:37 PM, Daniel Lezcano wrote:
> The Lenovo ThinkPad T14s embedded controller exposes several platform
> temperature sensors that are already used by the firmware for thermal
> management.
> 
> Expose the EC as a thermal sensor provider and describe the keyboard
> skin and charging circuitry sensors as thermal zones in the device
> tree.

[...]

> +&thermal_zones {
> +	ec-keyboard-thermal {
> +		polling-delay = <5000>;
> +		polling-delay-passive = <1000>;
> +
> +		thermal-sensors = <&ec 1>;

Do you think it'd be worth to add dt-bindings defines to avoid raw
numbers here?

[...]

> +		cooling-maps {
> +			map0 {
> +				trip = <&ec_charging_psv0>;
> +				cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +						 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +			};
> +		};
> +
> +	};

Stray \n above

Otherwise:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

