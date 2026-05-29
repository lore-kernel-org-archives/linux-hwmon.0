Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE473E0C44
	for <linux-hwmon@vger.kernel.org>; Fri, 29 May 2026 12:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780058506; cv=none; b=fKYyE6FlRanAHOtZN7ehSl1xRYso0lLYQW6hDs1ZPi0mSIksur5fltbSHb6vfSu9qBj8xC5JtB4u6xHLGQzW/Os5ON+laXkYys/vDTXO2mh7DQbdBqOY92+AIddEtx6r0joDrPw7JIIxLZ6wBpAfUD//nzePl6ZjCllKEdSgRTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780058506; c=relaxed/simple;
	bh=U0ZiCpGrQzS5HzpBXp9yo5/5i+Cd7m9OkzQtYZezJpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ioiTXMC4ij5uZKKDoR6LnqlxwrjBJLfpmpKTX6iAgUD9qAiszCFZsrtJbpWeP8UE8xQtMisGiFYqAa+WTUG+svjMVjsaxWzkliXGpDwQWDMtMA3rVe2Cpj2e9N6RDLbAgWBsUYgcTAWkLSQDs6L+oDVO5cWXfyiuH7DTo24A7a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WPMpDRsK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dEh0EcAg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WPMpDRsK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dEh0EcAg"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TCIbg0562430
	for <linux-hwmon@vger.kernel.org>; Fri, 29 May 2026 12:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mivxdVSFzM+R3HCyR7DyL87/tbqVcQmoi8n4EwJ2Ipg=; b=WPMpDRsK9pwlCU2E
	hkPjKopTqTto/ctB7fm5z+O9S/1RXh5t6sRuloOY32VhEXTMh5WRpbHhu8xG5oT1
	tVcAxgNQO025qE0MArrmxerbfTxp7qS+2YMZg4rcqqIURuId1PRc8k+C4lNL+23R
	6YhQ8xMGvCEHJTvsi0h7V3vOatsqqaoz3X9NgA/Y+oE1L4pUhSS7k9WRidEYxa2i
	48vp1OdUhu37BQNOk1Yi7O1XYzdGiXrdcZORReAFDiqQCUK0i3TbmtlcA0qazUAE
	+Nxv5icaR+jLvhGWl3ezLpPjWPeN56E4qD/S4qHdo3wE4CGGs6BnwvLzcwPywNEe
	Whcx/Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eevug3jwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Fri, 29 May 2026 12:41:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50f13da9684so168383391cf.3
        for <linux-hwmon@vger.kernel.org>; Fri, 29 May 2026 05:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780058504; x=1780663304; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mivxdVSFzM+R3HCyR7DyL87/tbqVcQmoi8n4EwJ2Ipg=;
        b=dEh0EcAgYk06Nt5k3+S12raucHqwj0zdNqvqLzb8VRcZTEWCX5FaVqGV9xWR1uBfcy
         rtzbfvl7Ji9fQ7mi3RqGEjlYYVwVCpIwwXjNSugw15+TBRFds4VhUsQTJHInbo2eFOyI
         jRSHH6C3+pEFnqJIJcguL5VufF9vVAGfRlCvivTvIAkHHKm2sKX3PpBU4kG8I4eRRscW
         +DAvMKLUp9PT/ufcmNLWQ+RSLj5RyqrwF5Uy342IseTY+duUkGU78csaiqj6PAu4re66
         rsyGxIMGVl4EIJfPhQ4O3HdWW6ei/Qjtcv/K9lLOjCgGiv9HS3bL9MkbupAOEJy7hgYj
         18Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780058504; x=1780663304;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mivxdVSFzM+R3HCyR7DyL87/tbqVcQmoi8n4EwJ2Ipg=;
        b=G/1lYzFEajGxUYSdC/vrGEaWa8L8VDah9lPkbLJq5NG5pyvvRWT2eAebrmbx19DoBo
         h+S+a23qSoK9n/BNHmMzjo6I4cGsu8eDP0lnOy4SeT1Jg1xWJ8Tf5RSqLieuRE1J4qKL
         AZ/rNUUD1V6knW4/koRFazroySDzFNL2OUULjvZihrlpHgVHo88JdynSX2bT+8pBZ9k/
         /Ly0X/DTJJH8KV2tR6r4SSAMEyBmchJZR4W4O8Bs2+WcvSRzib//roSGRo0Ibj0qpsoy
         4GxNs4kbsgskuvGSCpJe/SuJraBFBFCSsEYtaFYYW+otZ/Q8W8aGQlZqX7LPOVqe8GB5
         /E+g==
X-Forwarded-Encrypted: i=1; AFNElJ9ScxhHOJYl3WkQUZk/MxSY2hG1vH9n1jW/2XENHIyC5yzpXZCnkg571uvKrHCZrJem60n4H6jiJ+oSzw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4/60e4dC51y95jLvkZwEtzKNK+slsdBzyZcYL2jMmVAYHTajX
	u2Nvspqnx/KUyQm8+GUQftIyILK5skHnsNBQPegyUvMB1Z7uHxPuZKJabOdCMq/bknpPmmEIgYd
	C0M2uttmY7YX/Q1+L5nPJ9ljZzXn3rki0sfMDO/OS6EAWzJJomtY6ljtdU0xb6HM7Zw==
X-Gm-Gg: Acq92OEUO+TvdOGZ7CEKrGlVeDeXzefBGY5oMovThjIGwZ/8FvCEAXokr7OvDP9/XH0
	yzk+IrsAT6S1YJQxToPMij9BONvaKTD7SVhx7I9jKQ6z+r4rct3KLBJ0GzwZYVOpZ4BuAHgYKiU
	EVyBjxcHdlfU03xjPB+FhH8PHI8ehrdheNnsyo30rFStz0CfKWrmYP1DVxz6KRc8JVLGrmRNLHc
	mJn/0wV0eZWEV5J8cT2BaBIWInz06nwr4bbDWcUVNRMTJGT/xJ+q8aec4d6ccVxxM8HXZHPnti6
	djlVntyKneQc19X3UIG3rT333KM0qmMYXtbluBhUU0cLp6avQfg0LCT/0mgwIZdlMU/7IYbHPGR
	qShXZkdUKT5SnisBZk1TpJdsMSZq1vNFkhw6PksYAtxfGlMcqhqe/KsWQ5B8XmwA+uAS7B/tNV4
	zi/CVxCBSisJ5DMXAT4jo=
X-Received: by 2002:ac8:5855:0:b0:50e:5a87:6bfc with SMTP id d75a77b69052e-5172dc99419mr32999711cf.24.1780058503656;
        Fri, 29 May 2026 05:41:43 -0700 (PDT)
X-Received: by 2002:ac8:5855:0:b0:50e:5a87:6bfc with SMTP id d75a77b69052e-5172dc99419mr32999101cf.24.1780058502947;
        Fri, 29 May 2026 05:41:42 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c123406sm17550615e9.5.2026.05.29.05.41.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 05:41:42 -0700 (PDT)
Message-ID: <41eec804-5678-475d-b0b2-a5c0b3b005d4@oss.qualcomm.com>
Date: Fri, 29 May 2026 14:41:40 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH vs/3/4/ 00/11] Support cooling device with ID in the OF
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: daniel.lezcano@kernel.org, Zhang Rui <rui.zhang@intel.com>,
        Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Benson Leung <bleung@chromium.org>,
        =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Amit Daniel Kachhap <amit.kachhap@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Amit Kucheria
 <amitk@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20260526140802.1059293-12-daniel.lezcano@oss.qualcomm.com>
 <a943706d-d413-4ed8-a0fd-a3234c66cd8d@oss.qualcomm.com>
 <CAJZ5v0hG4aNrTR1j1DX+xv7cBNwsN4Y+qa3eFfXtLrrDBZ6kCA@mail.gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <CAJZ5v0hG4aNrTR1j1DX+xv7cBNwsN4Y+qa3eFfXtLrrDBZ6kCA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDEyNyBTYWx0ZWRfX61YQVCdu6Yxv
 tGR8tycgIapelb0d+W8uMKq7ejekhdabRuB+ivoT+C3RZ8XmQQaWrx9OUnWnYq4vSB2R+RF4BLE
 D8EhziK0Dj/fu5c6HcuwhAEHnVpcxTRg+yS0Cgk8k5gmmV+sYgJfZFhO6GxotOcyTfH66Z76PXP
 XtrHmtsxVIA6v90uETmhXKTeL6H51/G7dNMWIlFrJ2Cc+FViPCYDwvg1i2C3Zc5PXPMy2um939q
 mC0lI2ZQ2KyKUObxo83Sj/5Bm7HJrpd/EJm/YXlMFI4uYuskPqZysieeDYE4s8F8suwTXmA2u5P
 L/bTC74OLraKhBLm7MqLAEb2Av5/4ZPbDg+WqYybOxebgWiV3YFXmS8Su/EjBGSehIzz3FIlfts
 QHvRZC5TAYiJJElMjSMP7u4QMGnX+jEZR/w8DHOYqMqqW/vj3nGK7mFHYhxGat7T7La551dpFlK
 opSNBEpd8OTCChqi5Wg==
X-Authority-Analysis: v=2.4 cv=SNBykuvH c=1 sm=1 tr=0 ts=6a198988 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=JaHYm0A9nh1dz2_bgYwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: aQiiWqVM87pojOwWCfisy1E2dcMEUROE
X-Proofpoint-GUID: aQiiWqVM87pojOwWCfisy1E2dcMEUROE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290127

On 5/29/26 14:35, Rafael J. Wysocki wrote:
> Hi Daniel,
> 
> On Fri, May 29, 2026 at 10:35 AM Daniel Lezcano
> <daniel.lezcano@oss.qualcomm.com> wrote:
>>
>>
>> Hi Rafael,
>>
>> On 5/26/26 16:08, Daniel Lezcano wrote:
>>
>> [ ... ]
>>
>>> ---
>>> Changelog:
>>>    - V4
>>>      - Reworked splitted functions to register a cooling device and
>>>        merged separately
>>
>> Are you fine with the thermal core changes in this series ?
> 
> Generally, yes, I am, but let me have one more look at it.
> 
>> Is it ok if I pick the series in my branch (and may be send a early PR) ?
> 
> I have no comments, I'll respond with an Acked-by to it later today.
> 
> Thanks!

Thanks
