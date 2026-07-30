Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C97441CB56
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 11:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785412090; cv=none; b=hT7cq+qD8duBxf8fjX70US9Yobi9aXC/2D64xmBxiCVVrK+lMK5IOcgtBonjOaV7ANs+mu2GXzhxQ9ZlUxgMkCf914K3zicCcz+uFChcgvWyEbSFVd5TEzvftGO1ywWJ3zwOHVGsU0VrCC4zFnkNxU4oWEkmxBl5YDsS4c0D9aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785412090; c=relaxed/simple;
	bh=ZTCUJnQcX4xxiOEuuREEDYYRsXwuOcI/mHgyUCcOAsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tv6rfwNH3lyn1br6V2vxHUEdrfxrAjMC7btS0B9tXzqNnE2hi7wLYH53S161AbR4z3Gznm0oDSD6vPZVznmFjm6+79UTNm+pjbxhBDIFD7VpkPLiWqo7cKcp2WYEjSmUIk9vqcvsRrkOAUiznRujzcozKRybzdaCQm8xP05UsBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YAFfNMet; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ifAH89EP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YAFfNMet";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ifAH89EP"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UB83eq563041
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 11:48:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wQ7v3R4RUFHEkfA1ob1O7Jo8Ig0/QehHvZfl+zCElQ8=; b=YAFfNMetBPtOhvhF
	uJWAfrktmzeHiBJ67zGGtiVtkNRP0r6T9hdWpomxRgQyNl0yMJqxJtDZcVzPQLz9
	OcQWUiXm3FOhbAJS4d5vcaga7i4t+dkevS1CWh7ea9mtOtwlHw+ju4hfmAd6SY63
	1xyjSOgpLg0bcjqgOU4zo8tW2v32xCEjOsZRmMeCaKgEfhrE+Eg1OyP8K2Xgk/Ye
	dGJjLdHYUVjemh+I9h5VpxHKS4UUAmoVj2JlOckbCz8q8UXV7ueSA3rtRzyVqMsh
	GpjVr5GT9g36SvToDSmxdcbSTXWei+uPbExnahXvW1thkZ2oCZbXt9h3Gx31NaLU
	k/yxtA==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr5fjg4g8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 11:48:07 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-669374b7e90so371541d50.0
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 04:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785412086; x=1786016886; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wQ7v3R4RUFHEkfA1ob1O7Jo8Ig0/QehHvZfl+zCElQ8=;
        b=ifAH89EPOCxwWhVoTk+cvruAssNYtTV7KNSlDLcRyv/aegz9lENY6OGM3xx1/PRK/J
         C/GBC2UZQ9L167lHi+gmsxhA5hGST/itLOUJkX+eW3ygGXfBsidJUoL1de3futUpwqvw
         9xT5XSAqJmXiu7OSFa8cpcl+3sizKY+qeNLi6mPlX+HGHKnDRzVGbHTWYlAsqD5o0rFW
         wBndR+fFAKoEvWb4kA8PIblr05IdOv1+jf4aktYgOHlW0DQQEq6WOrWxjMx/Rxwn3Vyg
         r05/I/bT8tq1rmEbd3MBJQENEzjwMEzMf8q45RCtho7ZTmZRSGZoMzOQjKgei7hOWaIF
         e10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785412086; x=1786016886;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wQ7v3R4RUFHEkfA1ob1O7Jo8Ig0/QehHvZfl+zCElQ8=;
        b=UiI1n+GbwUvrJmTpDxElqIv0eX86nu2jWBGQq+TxehmleLjn6PJUx9o5RXl9IdPP4B
         rZ0Z8eAeBNsyA3wBK5ogwJFN5FuSZEbNNvCMuZCjGEkuvIMDItHkGKIAGamZFeV0F84e
         i3szjUkLkLU+7lLxJHjk7P2c443jGKkFpuwFIjjpYWaaB61r9cq9V9hKnS1z3JCHm/J/
         xP+cDGe6CyIh8yghCxdxv8yAOI9Luj9ni89SiGr8qKKmgsBeJeRuLL53blGmhSEJT36F
         kgZniCVjOFsOXijKMpju+2Je24h0zgiocNY4SuHXsp40/xu4WXXIicKKg7Jcz9ii6SZc
         xSiQ==
X-Gm-Message-State: AOJu0YzOzSEMKpdAjznQ9WKU5F3t4SDpeS5af2mf85B/cUf8IVzidSmH
	2+pgsyRd8D0kIYGHanLIgofn83ebe6FpCS3w+bC9Oxv6kgsxI/bsaouD3y6C/HQKgI3hTm5j/hT
	hwsI71BnRAukJ1/dPdmdbDXQ2rn95oGdXsm6E/1tjCfL0Jat8HrqcXPedAJLxfNUD0w==
X-Gm-Gg: AR+sD12LKmsongyZzEC6ri93SNLNAZShW+deyO/Us2w6Msx4pxmsaLSVkdrs5NBu5pa
	q+btHcZYHvlaybDYhBl9dbIwdTEoqACBxazgwRzEVzlyUH2G+JHKCq8enfcKIItZCC7TDsD/Rbq
	FXRbYxUH3UQaIEC8r/Pqpss+OTvJ6A59lfhBmeqMxmwh9SQk1ccGYiLz9bFgZIX7wOJRn6MrzsU
	mFkPSdcpycWkRlCgWhzW5Pald4R/v/PpwD/NWuhQHr/g2e9q4uOqfsnL59mfVUb+CKEFp3zxKE/
	SRk4JNzjBXWiurlXPpCHBOzhYHWwyendpIm5Iq6sUaURfyRfPNZ5g/pKqYWIrrI7ysAjoCLaAv1
	GwT8YFeqk1fdvg3nItbTAaqoK1HU3HsOhhHqJDn091mo46GY1XBuvQflXn8mgtoAL7w==
X-Received: by 2002:a05:690e:4811:b0:667:8a32:fb04 with SMTP id 956f58d0204a3-66939ae94fdmr7967d50.5.1785412086243;
        Thu, 30 Jul 2026 04:48:06 -0700 (PDT)
X-Received: by 2002:a05:690e:4811:b0:667:8a32:fb04 with SMTP id 956f58d0204a3-66939ae94fdmr7947d50.5.1785412085691;
        Thu, 30 Jul 2026 04:48:05 -0700 (PDT)
Received: from ?IPV6:2a01:cde0:108:24ed:2206:62e9:bbc4:c360? ([2a01:cde0:108:24ed:2206:62e9:bbc4:c360])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6692c6e9bbcsm1106293d50.2.2026.07.30.04.48.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 04:48:05 -0700 (PDT)
Message-ID: <5861906e-2969-4849-b9ec-ff6c7df65dad@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 13:48:02 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/10] hwmon: Add Qualcomm PMIC BCL driver
To: Guenter Roeck <linux@roeck-us.net>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
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
 <c1db2ca4-ad1c-440f-bff8-eb7660af8021@oss.qualcomm.com>
 <df2f8d63-4972-4b59-883f-0a919e7cb409@roeck-us.net>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <df2f8d63-4972-4b59-883f-0a919e7cb409@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Jw353Zq8JdXcjLNwT37s-Ib80AbsyxdM
X-Authority-Analysis: v=2.4 cv=TKF1jVla c=1 sm=1 tr=0 ts=6a6b39f7 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=_jlGtV7tAAAA:8 a=_0oT8-qNcuQ5ffpwqqMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA4OCBTYWx0ZWRfX1a9muC5UqCT4
 8KN8ULWLtG+Rn55Ss/5o/IdlGdib84MPvaUJbqLZwtvgB32tp9qb+RNHbJi6WwFo4csPloBdH8A
 4gC2cJ25V7wn1iTjHUXPqSjXRQ4Xp0G/FKkqvISa3HKrfl2mZOEj2YDVASvGCiUTACtM9ffnUxt
 FXogoTQ3dUyZyw2Vg9DptlN2EVuLwIAZlO4pdl6IddeZljA8wnHL84B4GzxVbSf48IfoJLWlFd1
 oGAtg6UZ+beZ7nUD6z8ZAmcF6BRTX4k+0YeBXWNAHj1fQneILDquWB3Bl0ny1RgvL/oK1Hy/bnw
 updjRxjL7UznVNlFHFrvPxImzqtCDhoaMAepTgo/YPO5w1IY9/ZYchcpX6nKzwHjt/4KD49Sc0k
 Yw37Fb4SRUWMWL9K5fWRALh/wVRjO64eoOjB5b+3Guzzgt80W1cmY5C2f5Cr1ghpQBYxZHUDkem
 COTVsbH1i/bScKSVxBA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA4OCBTYWx0ZWRfX0modg824qtJd
 Yf8oPEwGh/YsvXuOCPrgCCxI0O0fskhbMbKKDeoN6IzlrSyoZxAyvxjtFJ/9qjYn6GR+deyBF3T
 /dnNf7Et5QlpUmDl9JKv4YHfPVzP/74=
X-Proofpoint-ORIG-GUID: Jw353Zq8JdXcjLNwT37s-Ib80AbsyxdM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300088

On 7/24/26 02:04, Guenter Roeck wrote:
> On 7/23/26 12:16, Manaf Meethalavalappu Pallikunhi wrote:
>> Hi Guenter,
>>
>> On 7/23/2026 12:29 AM, Guenter Roeck wrote:
>>> On 7/22/26 11:19, Manaf Meethalavalappu Pallikunhi wrote:
>>>> Hi Guenter,
>>>>
>>>> On 7/22/2026 11:16 PM, Guenter Roeck wrote:
>>>>> On 7/22/26 10:38, Manaf Meethalavalappu Pallikunhi wrote:
>>>>> ...
>>>>>>>
>>>>>>> I am curious: Why not use static initialization and use the 
>>>>>>> is_visible
>>>>>>> function to determine if an attribute is visible or not ?
>>>>>>
>>>>>> ACK. There is already a comment in v1 suggesting the use of 
>>>>>> dynamic allocation based on the available attributes rather than 
>>>>>> static initialization. The intent is to avoid having to perform 
>>>>>> enable flag checks in multiple places.
>>>>>> . >
>>>>>
>>>>> You lost me, sorry. There is only a single is_visible function,
>>>>> and its intent is exactly to handle situations where some sensors
>>>>> are not always available.
>>>>>
>>>>> What would be those "multiple places" ?
>>>>
>>>> Understood, thanks for the clarification. I'll revert to static 
>>>> attribute initialization in the next revision and use is_visible() 
>>>> to control attribute visibility where needed.
>>>>
>>>>>
>>>>>>>  From the earlier exchange I had the impression that there is a 
>>>>>>> large
>>>>>>> number of current and voltage channels, but it looks like there 
>>>>>>> is only
>>>>>>> one each. That doesn't really warrant or need all this dynamic code
>>>>>>
>>>>>> Yes, this hardware only supports one or two channels (voltage and 
>>>>>> current). What we discussed earlier was that each channel can have 
>>>>>> up to three threshold alarms (warning, critical, and emergency). 
>>>>>> However, the hwmon framework currently supports only two limit 
>>>>>> alarms for these sensor types. I have not added support for the 
>>>>>> third alarm threshold in this series to keep the initial driver 
>>>>>> support aligned with the existing hwmon capabilities. Once the 
>>>>>> basic driver support is accepted, I can queue a follow-up series 
>>>>>> to add support for the third limit alarm.
>>>>>>
>>>>>
>>>>> What does that have to do with attribute visibility ?
>>>>
>>>> I was only clarifying that the channel count has always been small 
>>>> (maximum of two channels) and has not changed since v1. The earlier 
>>>> discussion was primarily around the limit alarm attributes. That 
>>>> said, you're right that this is unrelated to attribute visibility.
>>>>
>>>
>>> Feel free to use (and test)
>>> https://lore.kernel.org/linux-hwmon/20260722185749.2313572-1- 
>>> linux@roeck-us.net/T/#u
>>
>> Thanks for working on this. I'll use that change as the base, rebase 
>> my series on top of it, and add support for the third alarm level.
>> By the way, for the voltage channel, the hardware monitors 
>> undervoltage conditions and provides three threshold levels. At the 
>> moment, I am mapping:
>>
>> LVL0 → min
>> LVL1 → lcrit
>>
>> For LVL2, would it be possible to introduce a corresponding low- 
>> voltage emergency threshold, such as lemergency (or another more 
>> appropriate name), to represent the third alarm level for voltage 
>> sensors ?
>>
> 
> We can, but I really have no idea how to name it. lcrit is bad enough,
> but lemergency is even worse (or at least I think so). "lemerg" would
> be almost as bad, but at least it would kind of match "lcrit".
> I tried to ask Google AI, but it didn't give me any useful ideas.
> Any other suggestions or ideas ?

'lfatal' ?


