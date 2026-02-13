Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B5535B136
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Feb 2026 12:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770984025; cv=none; b=UabCxFS3ULoqtcmp3XWIuw6RIcGAAU7y7YjAD1aTS5LuDQ0g2MpbrI71kaM7fh3VZkqveC3xVG8yu86pMz83UGgwn/j7YxHX/zsHniRo6Fdro+737N+FKRyCuEXx+jG5lYmyTNZjOnG0VQLb2C+0okCgk7vd0sDNyie7D1yvgLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770984025; c=relaxed/simple;
	bh=OSvJKuP6dgZ4Wha7nT0kEvQYfBniuU9cyWrZ/6/n0Cw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hyTiZ2lTM+46IIuD//w9niI3X/DbLsxn18l4+l10riF19lyfy1EnPcHvaGofWdjPM9eFBken01k7vsDbeVl2uueTuXZbdasjUl6wnrX4ny/WjaYEUOh1DkqjNFjEdjF5t69QEnbWzfWs92Q9bOviS/0E4xGWNgWSbRoCPhjYMfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cVWusH1c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=el4iMATa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cVWusH1c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="el4iMATa"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D9efbj3022808
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Feb 2026 12:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OSvJKuP6dgZ4Wha7nT0kEvQYfBniuU9cyWrZ/6/n0Cw=; b=cVWusH1cLDLvSgTd
	wCVpvSKoBeylXV8QrScOSTBW6FZZAcgKEGRRk5+qrADiI5GYJwt52FahfAXD6slV
	F6ll+p/rrJK9Y3qXQI3CTJluA14xN33QVYHNAgFYVbuR16fzcHEzj1H5JBTPLeqj
	8Zt9/kTQs+CMoBLLzSa57njkBjvoNJLNIBSb/YMkqXxQhum5dTMrWl1/pZrKRwC4
	oLrzdEd/CJRSizouGVLdnxfc1A3DTbtny9/lJ9cw9SAQjy5idsCSnJoLAU6cKvte
	huWWNmsMNUHHHvldmSUxwz0ig2fIqOTs3a6vT7qrnqUVQjiEXQpYFZYu02ifboLx
	i88TZw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ca1hn0eku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Feb 2026 12:00:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2aae0d40a47so33345275ad.2
        for <linux-hwmon@vger.kernel.org>; Fri, 13 Feb 2026 04:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770984022; x=1771588822; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OSvJKuP6dgZ4Wha7nT0kEvQYfBniuU9cyWrZ/6/n0Cw=;
        b=el4iMATa4Mwk1ImzEZGCKyktzExrkW3DOZjK5FVxn0LNxGAWcM5DunafrIubklIL34
         1h5XjrhMqM/4M8q+0lLVfQca3q0m8/i+NWuffhNpakXUqY6jewwBeqZl4QuZSucn8UMx
         htKhglphjZnuiocV9lMzctEavds28TMrKmo/aCv5PpKNLsqhEmtnb8il6H1gjrO399lT
         G1pVgK+l9v5DxNltsDIZ/zLujR+kwrhY0iS1V5P33MnO3/DgjyDOcZWyP3QMKn62jEXg
         q7xLDSx8Eh6673xgSCWsYmvjGdyS2B0mKEPOhzsPL2FMlsBQQsjHFyw8uq4NkKK9YBHJ
         ld+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770984022; x=1771588822;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OSvJKuP6dgZ4Wha7nT0kEvQYfBniuU9cyWrZ/6/n0Cw=;
        b=uTxQ3LqCSK65YC1IBo3yxWVaeOFaSyOrHJ5CUIzi+RC8q1bcptbPOrIEnC4QZzI+TL
         Sfgpw1/+1QkUtXVfp1YUqr1kZaCv6mc2vOSbQM+lZQ4bCXG+CJT8Co7iIuEcbNKPU1oj
         fC7gta9+LQTGgM7Xvl5v3HdQo5HRlFoO0e4fp1y+saIMNypzbYiFd3tUcoqsvNWXgM1S
         VwY3UlsMwpJ5ojhvmT2603NyJXYHdMNhQzt6owBSBCgK9I14DwGAdqVBSkbb2LJv24Jp
         85yJATz6VWCz0km6uy0mGplfUgMvbPDKng0o8QpZyZnRt4HZVN8A2NwEoP6WzvkVhe+W
         r4KQ==
X-Gm-Message-State: AOJu0YxeMbKwfVr1Jxo/0W3vsP6ypo0RheGNb+UBbge1lPmjxF23taiw
	F/FOCV74xsY2pi/AMTeZ2Zn2SY7nP46PfFXCzIwXEVkAs5R0CJl2wgan35X285JephfQMdiNehM
	gZdcX8c5I5+Low8DgI19iz/E35g75Qxi/oInkuEqVIRv6/26hY7nMWzUcOsV3zAOtdg==
X-Gm-Gg: AZuq6aL/4A7ny2FALUv5sCWkrMpaqVb7EHvYMuXrXmdbZllC87tPilizWExDlLLA36B
	1PaZ89tFXfbuBholRz/4oH3OIFy24k2L/pd+WxWsXTH80iDDu24Y3J673chx6fYSslDBXDYYuhG
	hXIm99jVtAQHpF+DvTQV1edI9IddA5JA5JE68INyiYn7tnrFDuqYl0kq9qSDvUIT8YZIvvQYEyV
	VX97JqB+3+kn7eX9tKgZZHyQ/NkP/ujjjrq4MpoYL7W8X5eEMARiT86XWh5vpUDtpfMiR768xg2
	BQmALn+MJQrObCBDTwLrzqfUxqwYSQtNEB8698mrADR2nDlmdqrbohgQ5N7FgeeBplu7S26FrWJ
	AGpxpllZG3qGqQNk1PNE1IXyDqysnO6QaoyM8QrW3GXDXXHIHM1ZG25jbDw==
X-Received: by 2002:a17:903:ac5:b0:2aa:d7fe:8611 with SMTP id d9443c01a7336-2ab50568010mr18240385ad.27.1770984021493;
        Fri, 13 Feb 2026 04:00:21 -0800 (PST)
X-Received: by 2002:a17:903:ac5:b0:2aa:d7fe:8611 with SMTP id d9443c01a7336-2ab50568010mr18239755ad.27.1770984020748;
        Fri, 13 Feb 2026 04:00:20 -0800 (PST)
Received: from [10.217.198.130] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab2997bf86sm84627445ad.74.2026.02.13.04.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 04:00:20 -0800 (PST)
Message-ID: <8420d839-cc1f-4d03-a3ee-725d944577ec@oss.qualcomm.com>
Date: Fri, 13 Feb 2026 17:30:15 +0530
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: hwmon: Add qcom,bcl-hwmon yaml bindings
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
 <20260206-qcom-bcl-hwmon-v1-1-7b426f0b77a1@oss.qualcomm.com>
 <ae2802d8-2eb4-4dcf-8212-d8f2a41a7185@oss.qualcomm.com>
 <15fe2128-5a88-4140-8aba-0e8d73350df9@oss.qualcomm.com>
 <a4cfbe52-51cd-4851-8a1a-2830886c4dfc@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <a4cfbe52-51cd-4851-8a1a-2830886c4dfc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Wt0m8Nfv c=1 sm=1 tr=0 ts=698f1256 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=eFyIGa5nQRDKMWRvKKsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: EAq5pC3wBLPmkWfAJHO6ibnkjXFTZvKg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA5MiBTYWx0ZWRfX763vc4bCEu/P
 qcy2GMzhVYzJk6bSwnZ1Lw03PU4fmGh3Nsa4AERhfC59eHTYOjDo77qv6SnRvUiFZq7xrYZ2bt7
 VCl0aDzaPpIPBB5wZp1UD9FhJOvRs2eNqJMoJPlOWp5v2QTNQMtbAErQJNutvhDAGsuStXRe1tZ
 LaK99PxigrTEiVsFD0p/MUo9uChJ7NUxFS5zHBmlZBLveaHlLtuZEpNfbV9rDNtvect6OQzEPiz
 Tx4FsdsSGalgAxO96o60p/G629aJN6NO6/y4GT1O1X+J+EZ0GkmCTH3iMyt9y09FKmdBwX8D+U/
 Ukq6jlc8R1CmvONnEkNdt8LiG9dI/YUS5lJGfsVlAfRs/RVUOr4gVP87nLbb1F7sJNtnslq+eXg
 lpk/+Ueorg1YO3OyMzqOtjctxkaCN6G6sI8WQRfsRy5PxQxnPE9u7Yhsh9OY3Gth84qJdM4+27U
 dqgjDRyhe17fWekaFZg==
X-Proofpoint-GUID: EAq5pC3wBLPmkWfAJHO6ibnkjXFTZvKg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_02,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130092

Hi Konrad,

On 2/13/2026 4:11 PM, Konrad Dybcio wrote:
> On 2/13/26 7:04 AM, Manaf Meethalavalappu Pallikunhi wrote:
>> Hi Konrad,
>>
>> On 2/6/2026 2:38 PM, Konrad Dybcio wrote:
>>> On 2/5/26 10:14 PM, Manaf Meethalavalappu Pallikunhi wrote:
>>>> Add devicetree binding documentation for Qualcomm PMIC Battery Current
>>>> Limiting (BCL) hardware monitor. The BCL hardware provides monitoring
>>>> and alarm functionality for battery overcurrent and battery/system
>>>> under voltage conditions.
>>>>
>>>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>>>> ---
>>> [...]
>>>
>>>> +properties:
>>>> +  compatible:
>>>> +    oneOf:
>>>> +      - description: v1 based BCL
>>>> +        items:
>>>> +          - enum:
>>>> +              - qcom,pm7250b-bcl
>>>> +              - qcom,pm8250b-bcl
>>>> +          - const: qcom,bcl-v1
>>> I see that e.g. PMI8998 has a BCL block, would that also be 'v1',
>>> or something else?
>> I added support for pmic 5 bcl design from v1 to v4 in this series. PMI8998 is older pmic design(pmic 4). As of now, we don't have any requirement to enable it
> Right, but then you never mentioned "PMIC5" anywhere in the compatible
> or the binding, so this wasn't obvious at all. With the request from others
> to shift towards PMIC-specific compatibles that won't be an issue
Sure, will move to pmic specific compatibles.
Thanks,
Manaf
>
> Konrad
