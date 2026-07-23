Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BAC44C505
	for <linux-hwmon@vger.kernel.org>; Thu, 23 Jul 2026 19:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784834190; cv=none; b=uGbsz0SxO1BySLFTu3GD1a22JEiugYcfynw6v9xPS9PtWtrJQ+3xFx9x0MS9qBgDcu/iwlDWr+7JAognwbWZJak38A/PL8f9P2tOa5aoqK+bGtChzZEeMw1AHOLaPS+XX47xh6OqEk+dYczmtzIOrWIWKaN1iJ0vx4OHDDS6w/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784834190; c=relaxed/simple;
	bh=asxDQ6fQtq0+zoBrpTtg4hSVuljD7ouxIXdiKSHzxcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a0KJsal1IgcoY14rdMka0suhE4cBGkLo7kCl7nZ8Rb5hM0kyJ3PXACAfKJP3M2umrA0nsvg0kbzFIheiD6G2+1FH2db4l2NN4bfRSPnCPGF64WIBAulpyBp8ltYDoccJJaWAn0OfvR8xJnrExnPR9f5fcMomZk/HTUqwJ9QMR88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j8YM4+5/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VMt+lrpx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j8YM4+5/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VMt+lrpx"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NImGLw579769
	for <linux-hwmon@vger.kernel.org>; Thu, 23 Jul 2026 19:16:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+YmIG/iZNAmovLkMBYqbYn5P4DPYWwSvMf5WH1pV7/Y=; b=j8YM4+5/mxhtJZA/
	Fw7grVa5EXsQG9wnVw9HnY/SkxNvYuRc+KqREeqWrcAbdrgMwtgUlreKPlhKffSe
	QOdGt9Po7AW6PQhp2dL96ei7Wfqo4PvYz1j6CncO9SHhGeGCIM3m7tf8/KxI3BpU
	GvVrcq/FHHJPplYmVe9EvbkhfttV4pURzXDt0sSGGq4hbhEPKL0Pd+b3SSektTCI
	m+6T4DRiG7MV5i16v5NqXKGtPLT3+llMwFHZyCSHctzuPITLA6aCnzrDhKOc8W11
	JLn/W0OJcSzxD3Ex7XSd3M51TGMEGaXcJG55m404MdQ5QiDFkhTQEanX+ZorN+/p
	eubtxw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkjnua0eg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Thu, 23 Jul 2026 19:16:20 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso944705a12.3
        for <linux-hwmon@vger.kernel.org>; Thu, 23 Jul 2026 12:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784834179; x=1785438979; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+YmIG/iZNAmovLkMBYqbYn5P4DPYWwSvMf5WH1pV7/Y=;
        b=VMt+lrpxv1soFVh/cvDopZzSBOIw9Nrn4NfQVPNlT1wuQlyM9rgsvd/DZQfi/y1tEa
         6YqxHEqN7qGV8KlAqgWGOBc2moinph0krJnxtfA1TH1KlpxyU/+m+RXia2gKLd2JYGAN
         du5MmuqsF8PDei0ZIOz8Uz0eu7BMnuoRN6zHc/Ue0qvBsDxfBXfNMQov7VeuZQGq1sUs
         fp8MO1xAoecVXOgFjeX9diBWr5GJHDdJGOnQMRpPYgvv/VGua4CqqoHS1Hxhmj2c02Gu
         zoZBXfoq7Word9GaojBoHiVPxAMsHRSNA8mSQUnyOc4Gvs45edz76UI3L+icXcdBIunI
         YH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784834179; x=1785438979;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+YmIG/iZNAmovLkMBYqbYn5P4DPYWwSvMf5WH1pV7/Y=;
        b=co/OlatfYhXrR3yeF8fxDlxBCyQ+WvlB11AYY1D34A7OefjgtWoETjbuOaQR42hmM8
         VsfLb0qXlHW5vaJRTv8hbW1kG20pDBWP6y6DXt95GvBhznaK166mC/449DVjb2DyTQ5s
         GBuKLbZk0VovkgF+q8x88Lf6Uo15cUMlWdNOsxVrVUMR9vCYZ5RLA/jDOEAXbL5g2jid
         3V27Xs0psEPFcYr3zNST/nm+x7T3EysOBDvljs0yCYY+eBSrSsRZcIl6V5yR9gIlCi1d
         BVcYxX2LXiVC1psf6C93ehIjPmZTWsiF4eG41TZfAbrM25T/jLjMDMtn2TesdZGqHtvt
         5+FA==
X-Gm-Message-State: AOJu0Yw3LG/VtPP4Pr0/Ijjv4noE2w7buu6WwIivwrYs+8IUCRTlMxO+
	rUPEJgccXp98NPHBMei8OOw9OUT3Rp6ZqhsxjbGeGFgyTGfJ9EAz86AfG1TrDJZzDs3qdKW2Ldb
	JLctFQ5L0YT6xZ2ANsR+JL5Cha8zTMuxSPQQU4bqe+S3y7iHjpSnXZKpH9QmhfZkR/g==
X-Gm-Gg: AR+sD107ZebO45d31iLREgFq/MrKV6d4xPVbdaegUEgiQGVsH2hGrwGpx//L9S5Zh/w
	wDV303FXrXLV7JtKFAIH7aOxTHnDEBJ779TAIBZhjtvN4TBOhRaIV2r1MCG0NPHmVIwMwfMIhrr
	0wHHow2x6XdHfNTb4wTdsK70OGvDYoF1BnzJOAILeMNnCeWspENVYQxKgi4U6Eln6iF0RTcy3a6
	U7fTgdDbx5A7vyte/GEaCqT4CAYhOMx72/0nrL5Z/V6iFs3vdL1qnv33mGLZykjeFHD6wURSswA
	pQ8WkwCX3VSD0J4DkdHkK7x2HStDeH31gKXlgVaKIXyiw3SnglRDWqkB/DbNYblW1I15Qn91K6i
	M/ynTeMf9+1TaCARTJJOHooH7gPSnDPTb
X-Received: by 2002:a05:6a21:103:b0:3c1:d78:6457 with SMTP id adf61e73a8af0-3c44b02ea57mr4433547637.32.1784834178838;
        Thu, 23 Jul 2026 12:16:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:103:b0:3c1:d78:6457 with SMTP id adf61e73a8af0-3c44b02ea57mr4433501637.32.1784834178262;
        Thu, 23 Jul 2026 12:16:18 -0700 (PDT)
Received: from [192.168.2.3] ([49.204.16.42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e070538sm22149978eec.20.2026.07.23.12.16.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 12:16:17 -0700 (PDT)
Message-ID: <c1db2ca4-ad1c-440f-bff8-eb7660af8021@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 00:46:11 +0530
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/10] hwmon: Add Qualcomm PMIC BCL driver
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
 <20260722-qcom-bcl-hwmon-v2-2-febe2805e17b@oss.qualcomm.com>
 <373bd00e-bfcd-4f6c-b64e-a707af01417c@roeck-us.net>
 <cdc0fb5c-d277-40b4-8b00-c73eb881c062@oss.qualcomm.com>
 <4f2d9c51-1059-489c-a469-562ec52015da@roeck-us.net>
 <24a0ac2f-792e-4296-949c-047d9ce1c1f3@oss.qualcomm.com>
 <3635cd34-4c11-40fe-a9ff-48b752fb5150@roeck-us.net>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <3635cd34-4c11-40fe-a9ff-48b752fb5150@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: aypEvB7ng7fKRfbwtN_WtLcGYpab6Hjn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE4NyBTYWx0ZWRfX+55GnymXgyO9
 NboZjf8IEw9mwH8T4GyO1v4O7XGot205RlhZYVbQCyJ7aga2njZLrpuhN3bRbGqmADKlsRukg/I
 fISqNw74kFEysPCJwSHOajwptG+2W3XUpLsoFImf5Ie+fI02SWRAzHcCCs+OGUCBO6ZMy/0Hv2Y
 1Wt1Zfl1AbJXv1pBtIF4Q6YmnMoXTCVn+ojOQYi6Vjdd0eKI4KDQN5jhZR/XElGx9gLkjCRCayY
 fi5mTVyZs8UIvarZkOKGJTM/5x0Mxk7mG116aPBJpz8+52muxVY/15huqrM+Ymp5iIO1M7Lk5zJ
 Q6cJWnvgq4LInVvaiJsqh8/rgW52QmPYIt8O0cEy00lF+Ga3Dkyjh2AX3vDldiy9MrnFbhCNqgs
 QkhJPOvpKVhoVZGbTTAA59Z3ZLpnUXxTQhBEDC4ec/2NeACzdRnnoUBAdy/GsQZ6hV7/ODXM1j3
 RXuXyrBa9+Ua+edsWlA==
X-Authority-Analysis: v=2.4 cv=Een4hvmC c=1 sm=1 tr=0 ts=6a626884 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=BvtW7Q8lqb1UdYndl6lHrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=_jlGtV7tAAAA:8 a=l_Mds-CbMwRO_PrwST4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE4NyBTYWx0ZWRfXyk64fUJxuI9V
 tMDwPvpOk1ERIvfM9zd5+qzdKQKQYCmPEkdmxjEu8mg8qtUQZ6SRRg9d5FouQw0+saeMD0Z0i46
 5+40GATx1pS6cLwGB1Ie2TQ7IPaarI8=
X-Proofpoint-GUID: aypEvB7ng7fKRfbwtN_WtLcGYpab6Hjn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_06,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230187

Hi Guenter,

On 7/23/2026 12:29 AM, Guenter Roeck wrote:
> On 7/22/26 11:19, Manaf Meethalavalappu Pallikunhi wrote:
>> Hi Guenter,
>>
>> On 7/22/2026 11:16 PM, Guenter Roeck wrote:
>>> On 7/22/26 10:38, Manaf Meethalavalappu Pallikunhi wrote:
>>> ...
>>>>>
>>>>> I am curious: Why not use static initialization and use the is_visible
>>>>> function to determine if an attribute is visible or not ?
>>>>
>>>> ACK. There is already a comment in v1 suggesting the use of dynamic 
>>>> allocation based on the available attributes rather than static 
>>>> initialization. The intent is to avoid having to perform enable flag 
>>>> checks in multiple places.
>>>> . >
>>>
>>> You lost me, sorry. There is only a single is_visible function,
>>> and its intent is exactly to handle situations where some sensors
>>> are not always available.
>>>
>>> What would be those "multiple places" ?
>>
>> Understood, thanks for the clarification. I'll revert to static 
>> attribute initialization in the next revision and use is_visible() to 
>> control attribute visibility where needed.
>>
>>>
>>>>>  From the earlier exchange I had the impression that there is a large
>>>>> number of current and voltage channels, but it looks like there is 
>>>>> only
>>>>> one each. That doesn't really warrant or need all this dynamic code
>>>>
>>>> Yes, this hardware only supports one or two channels (voltage and 
>>>> current). What we discussed earlier was that each channel can have 
>>>> up to three threshold alarms (warning, critical, and emergency). 
>>>> However, the hwmon framework currently supports only two limit 
>>>> alarms for these sensor types. I have not added support for the 
>>>> third alarm threshold in this series to keep the initial driver 
>>>> support aligned with the existing hwmon capabilities. Once the basic 
>>>> driver support is accepted, I can queue a follow-up series to add 
>>>> support for the third limit alarm.
>>>>
>>>
>>> What does that have to do with attribute visibility ?
>>
>> I was only clarifying that the channel count has always been small 
>> (maximum of two channels) and has not changed since v1. The earlier 
>> discussion was primarily around the limit alarm attributes. That said, 
>> you're right that this is unrelated to attribute visibility.
>>
> 
> Feel free to use (and test)
> https://lore.kernel.org/linux-hwmon/20260722185749.2313572-1- 
> linux@roeck-us.net/T/#u

Thanks for working on this. I'll use that change as the base, rebase my 
series on top of it, and add support for the third alarm level.
By the way, for the voltage channel, the hardware monitors undervoltage 
conditions and provides three threshold levels. At the moment, I am mapping:

LVL0 → min
LVL1 → lcrit

For LVL2, would it be possible to introduce a corresponding low-voltage 
emergency threshold, such as lemergency (or another more appropriate 
name), to represent the third alarm level for voltage sensors ?

Thanks,
Manaf

> 
> Guenter
> 

