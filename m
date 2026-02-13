Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0939D2DF146
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Feb 2026 10:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770979293; cv=none; b=SVHn8QUo2qzealYv2D/gGjJ5zL4YksCyLTPjl6k9akL/4gmDG3NCXeafruKG6n4itgeXShGoz4a0dL8Re074oWNq0VCicJz/LiQSM41uAJI+7ee5UbuDEZaNRn9vkv7bucRPt9dlj6UPyuAISgJZrSsecMVTmW4kWF1tdrmzX/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770979293; c=relaxed/simple;
	bh=wgmwpsW7eeK7dT6tep1a6shwrdiQKLgKcMB8xfG2iu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NbxnnJZam8o/UuMwqDWsYSBX5m54s3pmLTewRZq0tW0mJ8qyW+VkDleDl19mEVk1lLPJSu/w7d+rCQmCUgGsAUPYkdCYkuRAP5Bj63oWbRnzFbYRID/z47MHxqNTFBh+rU/8YyWmUnr+4jevTrx8wfNsephF+ruHRE2rjeG0e7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GsGokeVE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H29IMZ7x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GsGokeVE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H29IMZ7x"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D54Mjv1828056
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Feb 2026 10:41:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	euRNAmbdPE0Yo9bIP/pqIZTm2YoAfkfcYcqSuQD6OjY=; b=GsGokeVEMcmuv/oL
	WHtZELBYm6xGjvJ/Dv5b45VSSq+1wIyM4c8KS7cy2Ne3EZiYHjOc5CnkpmDjUUNM
	ji26wdRCXhNH3SreICPQNgh7qBdCXEErArgOdzH7MQ8r9hj+7JDfBJHw3QRww8MP
	FjxDkw9CH+fDVhgbYI5q1qfHdBJMOCnWv0rg5MYZKCcUxuFf1rbnZgdJruhmgMnD
	QJUXK6Sf6z8FEu/eRG04KsO//tjJUZ/+N8xZbbCVC5142jHZZWNZ7unExVp1YpAn
	CD+dtHTsYIUI+5z5p4bfFmji8OX5IOr6Sn6ipMLggQ2sIYLzZcc9tGewZSA5sLk8
	/6qllg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9wg016c3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Feb 2026 10:41:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70c91c8b0so37398485a.2
        for <linux-hwmon@vger.kernel.org>; Fri, 13 Feb 2026 02:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770979290; x=1771584090; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=euRNAmbdPE0Yo9bIP/pqIZTm2YoAfkfcYcqSuQD6OjY=;
        b=H29IMZ7xeS9KjGXvSV6GaYuBO355EljnphcvUJS3DNh/647DCfbhR5ZAbfL3gwSgoF
         qmcyS/Tm4ymk1psbXGw0OUovSyRioxJaSVSi4eahsg0Ie1LWxOqBC361i3n1T5bTBNPN
         Evqfu6lTf0VVyLbBXWU+ZW06foLwLaISGo7ZFMLKQIlsVshIcb0T3AgEQPrt6D/TTSM6
         wSEYuRXRe1tm0PaHeHW7RyeqvMS9+XypbjoLaQPS30qJtwSVyXZKOQJXuS5N+G07dyIA
         ejJ6B9m+hMQJ4zuVOqGGC2hkVd1kY+vd6D7/yqaeylfc+Nf/NKT2PxZ4AzCFuomSIqVF
         Z9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770979290; x=1771584090;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=euRNAmbdPE0Yo9bIP/pqIZTm2YoAfkfcYcqSuQD6OjY=;
        b=S6wEr5k+Q9o/49FGKUbXY/i/ZB1bXx87DAWgop0KEj8Xdfd+1JDvwjZFDmCMvOJoMq
         hCtSOmA6k6RSlqr2zCrqSWfCi6c/LhC6feXiJe4CoU/vd3JxDle/SuPXgb5Fa4IPKnSU
         v+ZpeY6qof6ETPo03bru4qjxPQDhQAAtnVs9zsZTk+uUEf8amNYGUV35/+QjHYkwHCYl
         4SKg5ZOiZ3jfLSwNTCuwYmezTJS/Ve2BCc2QOFoc7oZJxNvozwwrzicU3ppTKbS4ZqYJ
         SRVEYpjMUKCZMrjEZNAQb6B1RxDTJOKhdeNi/VqUwyoG+lba5luEbJPVDcx0E7fYgiWt
         90SA==
X-Gm-Message-State: AOJu0YwXWagO8tkX3ohORQbuf6mPHIhl4mGtw0J1gNIzFOy20SCn/El+
	wGcNBzed2DNnTrRkU1yK6jgRSdSP3vGsTsgkEFHLc41Uz33Kx8LHN9E9zm3rIeCSxDfUONNQY0P
	aXEtW4PtPQjBk8sAwZd6RwuVRONQDnrDAc9YSxiExL97qi1MDrQJlEZvNVPo9q2knsA==
X-Gm-Gg: AZuq6aLIjfYZml2WaYythhOkp3Hhkzj5ux3V567dd+dE8lBWn8BPexY483ck1WER01u
	+ImegNKSiVn0KBlgZwXEAyIYAtMfn8WiCguwOYl3hf+Buf0qMp+JNIzB1kzUTS75TNnrDldU+mn
	uM5esI5DbgKCKqHnggeLvnkPSKMAzcR6tr2v7FCHUTI8nEE+a1beN/fj1OZJRz40nni7Z8rhIBD
	a+Uzq3bLcDat2jIQg2GnPV1VFtF2HkMOQeFm8gUw9HB8BNlze9yHu0bvSPedKIFHgQFKgLfb8Vf
	drexgkVHFLKiPSk3YQHY8nOAC+4UEeitS8fYcoFZHsyTIt7ild/n/gDxEE0jZHv33sDcsrmxtvj
	qH5VHwWMrdETvj/TV1gt28StjOwxQ2qmTm4QhQom6c5JJuCTYOnk0OFYoEDBBkz5cWmitWyzOfK
	ZwbnQ=
X-Received: by 2002:a05:620a:472b:b0:8ca:4545:aee4 with SMTP id af79cd13be357-8cb40807ca3mr192990785a.1.1770979290400;
        Fri, 13 Feb 2026 02:41:30 -0800 (PST)
X-Received: by 2002:a05:620a:472b:b0:8ca:4545:aee4 with SMTP id af79cd13be357-8cb40807ca3mr192989185a.1.1770979290036;
        Fri, 13 Feb 2026 02:41:30 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad19be17sm524394a12.4.2026.02.13.02.41.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 02:41:28 -0800 (PST)
Message-ID: <a4cfbe52-51cd-4851-8a1a-2830886c4dfc@oss.qualcomm.com>
Date: Fri, 13 Feb 2026 11:41:25 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: hwmon: Add qcom,bcl-hwmon yaml bindings
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
 <20260206-qcom-bcl-hwmon-v1-1-7b426f0b77a1@oss.qualcomm.com>
 <ae2802d8-2eb4-4dcf-8212-d8f2a41a7185@oss.qualcomm.com>
 <15fe2128-5a88-4140-8aba-0e8d73350df9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <15fe2128-5a88-4140-8aba-0e8d73350df9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA4MiBTYWx0ZWRfXydx5w1+0fFs3
 CIspofBtCW7BHACtHMY88CzL2vs1ufLYvCQmBvCsOkj7lDkJSE5IX1edG3eokXvIlG/aVTJPwIL
 6B5aTnReV7V/bslFC+/B7C4ABbDakXNIanquRXBPCP1EOu/wCf7dCp9V9J+f0etlWBzAA9d0ora
 V89snRZ5WcrOH5feFiy86B5x8H0dZ+k0KUVLJfHtpGvNmATLGFsVensPtkdPnMhUVlZKgaIr620
 LP9BAfn/IuG5NY5SJZ5PVOUJhI0HQiOweV10RywKbDu4DJRrOHP2BExhUsPYpptPr2x9sVt9XHA
 TOLCeWhZ1mwRHLYfs+51Mp++MrycjCvxejBqDrNkhq3lxHu/MlrXKa1NQ05aeppwLweusMaHIha
 pVLtj0afXGyDGdoYsKAfKqFERn6yIwIWR1VIcTueNuaT1YR/XkjjB37Aj2YKeWFdcA87ysUPBDF
 hOkvNoe7UVTNwEDw5OQ==
X-Proofpoint-ORIG-GUID: dnkG-uDvzoeILO8eklbtC8LBAGGOEavq
X-Proofpoint-GUID: dnkG-uDvzoeILO8eklbtC8LBAGGOEavq
X-Authority-Analysis: v=2.4 cv=bo5BxUai c=1 sm=1 tr=0 ts=698effdb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=Q9nwfTyik-j77Jmcf8EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_01,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130082

On 2/13/26 7:04 AM, Manaf Meethalavalappu Pallikunhi wrote:
> Hi Konrad,
> 
> On 2/6/2026 2:38 PM, Konrad Dybcio wrote:
>> On 2/5/26 10:14 PM, Manaf Meethalavalappu Pallikunhi wrote:
>>> Add devicetree binding documentation for Qualcomm PMIC Battery Current
>>> Limiting (BCL) hardware monitor. The BCL hardware provides monitoring
>>> and alarm functionality for battery overcurrent and battery/system
>>> under voltage conditions.
>>>
>>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>>> ---
>> [...]
>>
>>> +properties:
>>> +  compatible:
>>> +    oneOf:
>>> +      - description: v1 based BCL
>>> +        items:
>>> +          - enum:
>>> +              - qcom,pm7250b-bcl
>>> +              - qcom,pm8250b-bcl
>>> +          - const: qcom,bcl-v1
>> I see that e.g. PMI8998 has a BCL block, would that also be 'v1',
>> or something else?
> 
> I added support for pmic 5 bcl design from v1 to v4 in this series. PMI8998 is older pmic design(pmic 4). As of now, we don't have any requirement to enable it

Right, but then you never mentioned "PMIC5" anywhere in the compatible
or the binding, so this wasn't obvious at all. With the request from others
to shift towards PMIC-specific compatibles that won't be an issue

Konrad
