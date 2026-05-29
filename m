Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2183B27E9
	for <linux-hwmon@vger.kernel.org>; Fri, 29 May 2026 08:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780043755; cv=none; b=QZDF0rXW0+nUyisjl6To/4VNZ3gmjN77uH0GGVewpn3BEU8Qm3fxA57YDbK8plBrtfGOlA3jW2Y0f0Murtgo4kVnjAcVcAHPSfJJ0UlacDSsa6g2GjeBNhyrsXfi934V4ehwuUswQLt5a5NWI5vABqNT3sTc9hHH8BGyEpKx0+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780043755; c=relaxed/simple;
	bh=IiDzUPY3ZXxHniqaREbBQdI/nhXVv0VGu3X3wzZjFjE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Xh1jeEhwODoDlJL13nMbOrbLuZf30ksiakH3OKoTUtmf2/m9guCo84RwfUEq2/JBKT/N2Aqojf8zCPVyL+BirQMJZhgqc/pr/8ZSWH5xOGiVoCtIXqy6zAxYN/IwtxbcC+22/VsP90ICpoxtolx4Z8BUHbUkMhX8BhL1qbB4g/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oCTBQVDz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KJGOw/fy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oCTBQVDz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KJGOw/fy"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T62GXh562513
	for <linux-hwmon@vger.kernel.org>; Fri, 29 May 2026 08:35:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jQKfd+djVSHMpFmIiOUjSH6Yd0pkzc/GU2jwfOrQ2uA=; b=oCTBQVDz63d2Xxwp
	M3ZhS0jzWsM3EW0XgyXyJrDY1KKY6gtXcN/VEHY+B4J/pp2lMq9A37yT+IScujsg
	3zwZWms2wPk9t7NWmSHSAxqG+MI0PAvcRM2zRPRIqiapyUxnfeY0eU2T1MAU6BuP
	50DuTXgTsnUZm2/zv2GwY5MrBS616k2d10OC6XkCoAUvt2RVl6bEfArXqiGlrpEo
	41I2EvVzbBqSR/ExcdECB6207Hpja/3Z7mTUlBlpo5hmDPjqwfmmysHFr+INiynN
	jTXAkkgULWncBBBgqfHDHbFTg/4upwmsVJOPg6o3PY41fuBHnw+VAhSiaqBHLfDq
	XlH/0g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eevug2ktj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Fri, 29 May 2026 08:35:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-517288c4ed0so22204491cf.3
        for <linux-hwmon@vger.kernel.org>; Fri, 29 May 2026 01:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780043752; x=1780648552; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jQKfd+djVSHMpFmIiOUjSH6Yd0pkzc/GU2jwfOrQ2uA=;
        b=KJGOw/fyPemZ7X3dldX7KiwwIL0rt66AP2wduS/BZOXG1dWV/hIW6UAub7WO1/PPUb
         aEnpm6PLLp41zhOevyy9VuqkE0CMJeO/oD/o13Lr5A77G+d8ecuNg2tH88YQsLSYhpCp
         Ox6ptlJKh/7CRnJRVf86wxB6SwyLxvDts3kvB3bij/UWLi3CtkFbJCUPiCwk+l7vVnsz
         S+CfnuOuLEGiexFhjO0R2lF9bh6XZku98V+kwk1Zzm0JoqTOWfRSeNaDAhwnRWRpYw33
         B2R6K/e5mfksHLBN0OheawjVfjLj26EUwjWpjlhoJLjCBpFSl/pui5lZPSPc9UujPBWd
         79Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780043752; x=1780648552;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jQKfd+djVSHMpFmIiOUjSH6Yd0pkzc/GU2jwfOrQ2uA=;
        b=fd79NuIUbkwc9Vo4+OpunXuWcDuMwSq7eRABXMBr7bkuuMXGPPSQ3BvqUtDLoxY1St
         vXhJvCL9vpkt02iT9cj1XHDwxbbHKpFzS6iyvb4zd3sqm1/WznbdpO/7dy0BxH7touK9
         kqdq5mw2ivd0C6bWPp3EkQQzrI10WBr4MeZoEh3PQxbcfB4Ix10FeyWbTaeMQ/5Ja84t
         PeT9JJlH4PzBMzZIXZV4i3NzXvGpePx6IA2Bdt4pFSMG1oVVyQPhQy81knooyUh77u0H
         HN57J4nQDwPpF8RMzpjDZkuVZPXIR916b++spIVw/njJ52MoP0gnrxQhz8xiesEEfOCD
         FdIQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Cx69gF4vLyJR8gMrVBXWy7BkIUmtYDaWLcj1Xoh1tuta771mKWQYm6TQbLQfMkjExE5CpAKRf2OHnDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAkzA07FGHV/A5Z07cluHJ+FoBhG8t8jp4lCvd8bAhYflJ/+mW
	7H5Dz7hCFMxZOODFHWk3NwcVrA0S1+/TIGGpouQ/MKjABIzM/hSf+Kxc1lvjA4LWaSkMC4y/bQU
	WgBMEbvFklUrsqh4EnaT8Qm0cVb2M6FkvM25n/Q2G/QDeJ9vEJd9waTBvKgCJErG0WQ==
X-Gm-Gg: Acq92OGm9tCIqFMt337rJxA8EP0jDkjx1W5tfTIWwOEivDljh5iV/4X4xx3SOs6L1pR
	Cn6CmlT2bDNuzVTGuRD6gPrgrKwh9Isniyx5hqLr3KxiZxdBhJrg6Vn6a2rlBRvu7R0Ye7heLFU
	KAO3npep/YkXXcWJSU5thOWcj52tTmmf+uXvP4o3trxZIBSDxF2NA8JKbBsS87EGk4KQBzPuw7l
	R6r9elEWFMNIRMdgnBVxqNrQ2NMJD2oZkpySiAl7Mta5ZYo39idKImQGeuaxeovfepjJa7fJi+2
	gEFmK4EKykPbfGNCYon3FHnyHKOsGzlcZrg9/vsSwTasX6fKMr0vldxUkbgNh/2juYdHT00+ZSz
	7WbXMCb+f9JzYwLBLiQ7C9Sp5j4tjoNWRyxC3pPi3jOonaOzdUG+ipMoenyYl7yl3JiZpcGBw4V
	dDMo849xdeVgUUP79mXxQ=
X-Received: by 2002:a05:622a:2a07:b0:516:e0c4:743a with SMTP id d75a77b69052e-5172dd240f8mr21784121cf.36.1780043752126;
        Fri, 29 May 2026 01:35:52 -0700 (PDT)
X-Received: by 2002:a05:622a:2a07:b0:516:e0c4:743a with SMTP id d75a77b69052e-5172dd240f8mr21783621cf.36.1780043751606;
        Fri, 29 May 2026 01:35:51 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909ca6575csm49242245e9.4.2026.05.29.01.35.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 01:35:50 -0700 (PDT)
Message-ID: <a943706d-d413-4ed8-a0fd-a3234c66cd8d@oss.qualcomm.com>
Date: Fri, 29 May 2026 10:35:49 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH vs/3/4/ 00/11] Support cooling device with ID in the OF
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org, daniel.lezcano@kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
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
Content-Language: en-US
In-Reply-To: <20260526140802.1059293-12-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA4MyBTYWx0ZWRfX6TJUyYWgtshn
 M0A81q7y3GRnocmLgdL1UeTTmhYTMJlBDW9chP59aavmwV/9vRMs0qIKYpwbrAw4pzEn4EEsojT
 F5nEE1MXO++cdhE7uUDFsvHhAyPWeQoAjfuO7gaqX539QfPKC028Bq1xoh3oS5lBbTx3FjelhZc
 2nqyDCfm9y9r7e6T/Eo7mcNon7k0vanqmSQw5hMDXvahpndLahZPX3xd0/7IcJVfNIBXKEcBRcQ
 9Mvieh3Q8pJqEk8TyCfZ0kafEZGbQEecK52Gbcfu5r0lNO8SCkGZVYsmcNTr6noce6LNTNwm6i5
 ktgk1AqiONITENKWGadWVBGyxv0amYZ7QzanOXCgPr16wCM/6Lm5fEgn4G+yL1k3dEttqVhmEVD
 IckyQ2+4eDaslpHXrCed3p2sWXBVXNRFURVKBqzSfVZRJLtqi2S6XKJgEV4zOzG7IYtqMbRbwoc
 N1sk8M8be5Q+NalIHdw==
X-Authority-Analysis: v=2.4 cv=SNBykuvH c=1 sm=1 tr=0 ts=6a194fe9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=fdR-mB4-UEK_HjMIXJsA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 5O-FQOWbPG19TJdYXKahMcwv9OX_M0vJ
X-Proofpoint-GUID: 5O-FQOWbPG19TJdYXKahMcwv9OX_M0vJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290083


Hi Rafael,

On 5/26/26 16:08, Daniel Lezcano wrote:

[ ... ]

> ---
> Changelog:
>   - V4
>     - Reworked splitted functions to register a cooling device and
>       merged separately

Are you fine with the thermal core changes in this series ?

Is it ok if I pick the series in my branch (and may be send a early PR) ?


>   - V3
>     - Reordered and reworked the patches to be git bisect safe
>     - Reworked devm usage by using a more adequate function doing the
>       same as the group of calls to devm*
>     - Pass an init callback instead of moving
>       thermal_cooling_device_init_complete() out of the function and
>       calling it in different places
>     - Sent separetely changes to the tegra soctherm driver
>   - V2
>     - Added stubs for OF functions in order to prevent to break the git
>       bisectability compilation
>     - Added missing call to thermal_cooling_device_init_complete() in
>       devm_thermal_of_cooling_device_register()
>     - Fixed assymetry in devm_ calls for the tegra/soctherm() driver
>     - Fixed kernel documentation for API changes
>     - Added missing static inline for a API stub
>     - Hardened the test with two or three arguments in the cooling spec
>     - Narrowed const: 2 strict in pwm-fan
> ---
> 
> Daniel Lezcano (9):
>    thermal/core: Introduce non-OF thermal_cooling_device_register()
>    thermal/core: Add devm_thermal_cooling_device_register()
>    hwmon: Use non-OF thermal cooling device registration API
>    thermal/core: Make cooling device OF node conditional on
>      CONFIG_THERMAL_OF
>    thermal/of: Move cooling device OF helpers out of thermal core
>    thermal/of: Rename the devm_thermal_of_cooling_device_register()
>      function
>    thermal/of: Add cooling device ID support
>    thermal/of: Pass cdev_id and introduce devm registration helper
>    thermal/of: Support cooling device ID in cooling-spec
> 
> Gaurav Kohli (1):
>    dt-bindings: thermal: cooling-devices: Update support for 3 cells
>      cooling device
> 
>   .../devicetree/bindings/hwmon/pwm-fan.yaml    |   3 +-
>   .../thermal/thermal-cooling-devices.yaml      |   8 +-
>   .../bindings/thermal/thermal-zones.yaml       |   3 +-
>   drivers/gpu/drm/etnaviv/etnaviv_gpu.c         |   5 +-
>   drivers/hwmon/amc6821.c                       |   2 +-
>   drivers/hwmon/aspeed-pwm-tacho.c              |   5 +-
>   drivers/hwmon/cros_ec_hwmon.c                 |   4 +-
>   drivers/hwmon/dell-smm-hwmon.c                |   4 +-
>   drivers/hwmon/emc2305.c                       |   6 +-
>   drivers/hwmon/gpio-fan.c                      |   6 +-
>   drivers/hwmon/max6650.c                       |   6 +-
>   drivers/hwmon/mlxreg-fan.c                    |   4 +-
>   drivers/hwmon/npcm750-pwm-fan.c               |   6 +-
>   drivers/hwmon/pwm-fan.c                       |   5 +-
>   drivers/hwmon/qnap-mcu-hwmon.c                |   6 +-
>   drivers/hwmon/tc654.c                         |   5 +-
>   drivers/memory/tegra/tegra210-emc-core.c      |   4 +-
>   drivers/soc/qcom/qcom_aoss.c                  |   2 +-
>   drivers/thermal/cpufreq_cooling.c             |   2 +-
>   drivers/thermal/cpuidle_cooling.c             |   2 +-
>   drivers/thermal/devfreq_cooling.c             |   2 +-
>   drivers/thermal/khadas_mcu_fan.c              |   7 +-
>   drivers/thermal/tegra/soctherm.c              |   6 +-
>   drivers/thermal/thermal_core.c                |  85 ++--------
>   drivers/thermal/thermal_core.h                |   5 +
>   drivers/thermal/thermal_of.c                  | 148 +++++++++++++++++-
>   include/linux/thermal.h                       |  69 +++++---
>   27 files changed, 273 insertions(+), 137 deletions(-)
> 

