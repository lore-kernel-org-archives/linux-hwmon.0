Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679D24399E3
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Jul 2026 18:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784744369; cv=none; b=Gfr3/ed8FS+9L6mHrbarZanvA6ZTJB46VzgoKDJHZ9igUWQuCFpY6nxzXD7u/QiaRGPVjDFxnA4XRpUD24/LHaVuv56gFoT2HsUJllaU3ftcSaWDgfW/XzVcWjiNetaD19M1zST8GGmergyXtLpWKgaEfNiR6WuSz5WMG4YzHw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784744369; c=relaxed/simple;
	bh=h9KLvKhk60wBGwe7X2Kpn4tVz7qaWBCBWsRClzb7DOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UAm+ACwz2139a8ytzvDsXNp1MLHk+RjcqZgcy/nDXBaw1qh2NceREQSUIy1je6AEtuJP6sHe/vpljl08XJ4V1tOmCdTAjJBfgJttC0gQ6Osi7rCDIWg53kJgjQ1TT7N1BpcBRaor6JMHfb+A0Hot+LnBSwMotstJbCTfRobAH4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kFmgGIgy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KGlBuvfj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kFmgGIgy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KGlBuvfj"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MHrABI1641665
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Jul 2026 18:19:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SKbgS0N/CRAlO5dvnweSF5hTUngsf8UTKv2PHTmbOF8=; b=kFmgGIgyTTnu3g4J
	QX/XwcbLHZCQy0lVElgeHDP0QIRCH9tb2meYXOaP05BogeReg+vVJrXOWNJytY7P
	KDNkbYz68jJjFGumx3ekIdQ0176FhyLh7czPCk4iKOEPLzQKr5/6E8rqmqYdmzCp
	bKHpomqBTOlSGIPRzhylXH3rVsSnl3xxc7aYGL9J8WcHeZGuLYxbmmr3HuyEV6va
	4q+NZdw8mJRLzzClol4tPZk6AjyhdWImMC7h3B0pcAG6Cib7n96uZX4zL1AQWNA1
	PDyX1BgInUzk5Ghe+3AsQ8VV7KWdHksy+OkM32dqgs/uuJjzvfwS7xlr6EoP7+Ax
	6lrcWw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjt79ahdg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Jul 2026 18:19:27 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb7d6ba548eso4953334a12.1
        for <linux-hwmon@vger.kernel.org>; Wed, 22 Jul 2026 11:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784744366; x=1785349166; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SKbgS0N/CRAlO5dvnweSF5hTUngsf8UTKv2PHTmbOF8=;
        b=KGlBuvfjKCr+wEEUs67oZNR6gYqCULfIHngnNMsnZu3QLjdHxTZyNjRS/dWPcQeL2G
         d8CiyOZp+I34Kwb68cMaoLQjxaZbeoA29eRuT0n9szqMPR95+w2/qxjjXEr6hmDAGxnI
         MtvYgQawttUpKyrATgMw+q/d9gFVsPc6LfK6sDgKJjiMHNgCQe8rGjCHe0Eymz042d4R
         +Au5JiQzN/u9LVV8si02q+PfJ6xGhLYfcR2GLH/V2STNWvOB3bkEoAPbzLcgkFfYf/GI
         aFOrEK13INcKvPnxaJkxkqmpsxB+h6aaC28+6RStZcX+RO0XGacABQ2XeChGOzyKfKU9
         35gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784744366; x=1785349166;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SKbgS0N/CRAlO5dvnweSF5hTUngsf8UTKv2PHTmbOF8=;
        b=gaiRFN5w/7eBKrpH6yEAbHIsqLSCl9JoptMT0woh/kmArb3kPyCTmDEtjJIcKWbIpw
         OK1y/UfflmXgjY0CXGE67wCDD8BB289Zuy1Ooymjmc8Or8TEJsWu31i9oJaBL/XwPa0/
         m2uBt/zmukSuUw/IIMYU5kilh2gWaB36w3v3CjmlR0A1ztAEJqN3ej1dpIJkHMUZUJYk
         Xpeoe1PURCHRAzTp0twdc1oEZJyw9IeBpK1dWC4tLRYN2HwBONlb/L/z9uSJkGgHvIS1
         LVFm60sZvlo4pxR+8dpOPIP5bZXtgWqy4KStTHatATvKCoUYcs4xGnJRfY2Vo4R3oAKM
         BrLg==
X-Gm-Message-State: AOJu0Yzt8gkNqH+nwd2n1q6B9D35xNIyPxP1yug4I0wt/DgWbipWGHh1
	gvocwFM183qYi0Xg1s7HNdDXAYuyybf81QfrePwIq1lgT2xKkSpmlfWqR9luGsuTLfwKv8NDIHs
	838aQbCGV8FEqZYloxUNEdQiQZi7W9smGAs8bkIt5CVM8MqPt7+VRnS1szV8UJFJOUA==
X-Gm-Gg: AR+sD12U0MMl+qrqvJHZigE2/BMe/IT+wyd6ddAzh3Yvhz3gw+kLbnqaJet/TjYJL9U
	RPj0lB8aMkHQ9IokGafq7hH9m4UrTSmHaSvfNTso4Kn+RnDlKxYGGeKmPy1f7EKg0yd8z73s0gW
	IJV6tbI7jloPHtm8bwR3gBjaH7dncnyJteA9a6tOZoZCIInSI+KTRfiTk2qN7YpkRjI47EH7jOL
	1JkLbaG/6I1qQwOwO+FdYuFUI5ALhQHlT7eUSnhhUuTZVDyPYlT9z0pHl893D8Bw8P6EMZeiM6y
	VCz0Cav5dTbvsn/cHdebHKePSnH3DhqNxBIJgI0n98y4vcktTiyDbH/G1DePjYH4KE9y416V2F4
	XcriRMJaLKbDpwfyHozYaPpXdu4JS6nBY
X-Received: by 2002:a05:6a20:9145:b0:3a0:bc61:62e6 with SMTP id adf61e73a8af0-3c3ad66828fmr26270278637.8.1784744366192;
        Wed, 22 Jul 2026 11:19:26 -0700 (PDT)
X-Received: by 2002:a05:6a20:9145:b0:3a0:bc61:62e6 with SMTP id adf61e73a8af0-3c3ad66828fmr26270228637.8.1784744365633;
        Wed, 22 Jul 2026 11:19:25 -0700 (PDT)
Received: from [192.168.2.3] ([49.204.16.42])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130a87e9sm7813501c88.11.2026.07.22.11.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 11:19:25 -0700 (PDT)
Message-ID: <24a0ac2f-792e-4296-949c-047d9ce1c1f3@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 23:49:18 +0530
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
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <4f2d9c51-1059-489c-a469-562ec52015da@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Sr6gLvO0 c=1 sm=1 tr=0 ts=6a6109af cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=BvtW7Q8lqb1UdYndl6lHrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=e4paWlehE--IC7SGyJgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: dZR__zzZTsBeoBnbzWAm_XfC-cMphNbV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE4MCBTYWx0ZWRfX7Wnxe9PuQenu
 mexOUHM/d5ZkHEcgoYczo8eFVc+qwxxVpYynwrFsEKJ8eR+vgb8CuhgK7qk95tNYL7qnxRJyJU1
 PPQnrcibFwagsEO89CHQR6mH7J/CWXYpOTZ8DIVAHBUk/t057cxElocGqadODh3V6Bh+u7ktpnI
 apzFn9l3Ohflockw/Dyhya8CyZbiz714ILeffpc1uzj4ovfQoX2RP4M4ul3wxLA4qFrgF48xxBf
 zew6e1eyN4KJRHBih6zpjSx362OQbKWP8tRYrCVl480anA+zyLo+5GckcYSfshjuqlsgpcDfKr7
 dMWnDMFIi7t51ZL2Z7duGe7Dia8mk3QuOJsvCF0DQ1s05d1rKUgveLokhLS/xXqWThLDl0qLY0c
 6Wq+7olJe9c/IY7Cs4cVJGmnrH9Q8/T5M9MiEDnJsm8RKH/WjJghaWce6riaPa+JlGz3UJrYUEH
 RSzYo2btjPoOQqjweww==
X-Proofpoint-GUID: dZR__zzZTsBeoBnbzWAm_XfC-cMphNbV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE4MCBTYWx0ZWRfX8eOd7QPUHxX7
 GNfDUf3kZ+/UPilwI7zxVBIhe3qatyQLX8P8sgweCcS4ozZ6Ql6G4vvjb6qHTqxNzozjoOmsx22
 N2SX1sNRhCrhqzueBWbS+uICs/wRfao=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_05,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220180

Hi Guenter,

On 7/22/2026 11:16 PM, Guenter Roeck wrote:
> On 7/22/26 10:38, Manaf Meethalavalappu Pallikunhi wrote:
> ...
>>>
>>> I am curious: Why not use static initialization and use the is_visible
>>> function to determine if an attribute is visible or not ?
>>
>> ACK. There is already a comment in v1 suggesting the use of dynamic 
>> allocation based on the available attributes rather than static 
>> initialization. The intent is to avoid having to perform enable flag 
>> checks in multiple places.
>> . >
> 
> You lost me, sorry. There is only a single is_visible function,
> and its intent is exactly to handle situations where some sensors
> are not always available.
> 
> What would be those "multiple places" ?

Understood, thanks for the clarification. I'll revert to static 
attribute initialization in the next revision and use is_visible() to 
control attribute visibility where needed.

> 
>>>  From the earlier exchange I had the impression that there is a large
>>> number of current and voltage channels, but it looks like there is only
>>> one each. That doesn't really warrant or need all this dynamic code
>>
>> Yes, this hardware only supports one or two channels (voltage and 
>> current). What we discussed earlier was that each channel can have up 
>> to three threshold alarms (warning, critical, and emergency). However, 
>> the hwmon framework currently supports only two limit alarms for these 
>> sensor types. I have not added support for the third alarm threshold 
>> in this series to keep the initial driver support aligned with the 
>> existing hwmon capabilities. Once the basic driver support is 
>> accepted, I can queue a follow-up series to add support for the third 
>> limit alarm.
>>
> 
> What does that have to do with attribute visibility ?

I was only clarifying that the channel count has always been small 
(maximum of two channels) and has not changed since v1. The earlier 
discussion was primarily around the limit alarm attributes. That said, 
you're right that this is unrelated to attribute visibility.

Thanks,
Manaf

> 
> Guenter
> 

