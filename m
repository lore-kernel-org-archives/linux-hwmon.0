Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DED42F3C13
	for <linux-hwmon@vger.kernel.org>; Wed,  8 Jul 2026 13:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783516589; cv=none; b=HuDWlZosmpqHhULjE8WSqd2gYRnode5bfQmdldA+IIp438Z5h8Aqu1sBkvYUrAAU3jXNwVux1CUi1rB93HRfsaLFjMfk677rfEDeY+/RVoRI50+021wNYYic1EUGamVAK9Gj2CPoioA9rbdgEU0XYInjGUb90mJryJzBnDdOY/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783516589; c=relaxed/simple;
	bh=5ss1M5aFcSPtgxLcdzN+gd/r5r3CnVFwNjAglx8XzQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kLWfsd1eT70qMlFX8AXjlHjBsODQCG49rI5bhwDsvHKOXF1cz/ZzyGBUWf6rlCQXVq2uhVtXLCJQLIXRYYHbiVxEE23bCpfWZxaykt5f4jWx79t7NibGzGcWc6JzZ+x1R/HVII10mCcTm8IUTg7m+P7Q1jGuDORl4ND6yKufkYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GWPMjyCx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fl2qnUO5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GWPMjyCx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fl2qnUO5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3Ph82579556
	for <linux-hwmon@vger.kernel.org>; Wed, 8 Jul 2026 13:16:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1ddQQBwVkaiRpR0VGfp4Io2V+KcD8Dcdzv+lkD5fzCs=; b=GWPMjyCxGeu9AJCj
	e+G5ahPNuaB5ExQiIRGqV28SBjqhzZ0aMwWrmKEyZCEdXpe1hjGNiCZSn++r0HV4
	4RjmQphGiS9Hd2Ls5lTFckTTWxv6/mrGBxq/OYcYZgibx/h1ie9ci9qRyeNs3iPg
	nnUaQu7n4iZjWnxbcw/S0W6+5HjfeRG7ryu1s01bpKFBUED3rfWFK1vTPMdiJurN
	4W4HfrS6zoltgDWQyAYZvsOGcKF7XzQJXxYRv5xjPZl5abCi2Q0UAcQnZr5n9dkA
	IEEJDLPyZb28q6VHBRTuGz/XPhF3IQMZM1QEAbzR4HTE2S7/QTSrzI7oZTNL/AqO
	d2yQkw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9b5gavjk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 08 Jul 2026 13:16:24 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-737f1f1e1bbso156906137.0
        for <linux-hwmon@vger.kernel.org>; Wed, 08 Jul 2026 06:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783516583; x=1784121383; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1ddQQBwVkaiRpR0VGfp4Io2V+KcD8Dcdzv+lkD5fzCs=;
        b=Fl2qnUO594k6ng7cICKoytCkPzNQnNP6TBWrnpTwhcc94EMdV6aQBcabadjVMFpeP9
         YZrCX6hQtztfbBiBhlhwvRsYKD/qg069GaGiGdeMVEqCofFPVghpE+PRVuQZ1DRcZoPc
         yPz4IUoQAr5mTDg+eE58wWTTyuqVY8KJmdLZ5csn7pceSMDsEB6Ht4woPUX/D8bFy11F
         wi9fOBnkR3m+AWbqtbRWIsp8uMQLlqdxGfRZ2cLl/sLareLaU0KlAH8l7l3puH5bpq8d
         YrjX/AT34xYhy63YDMnUnu3cmC79zgg1DnEBNaRSL6Uf2qNIBGYt3e4TU5xlSrvSlFmK
         e8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783516583; x=1784121383;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ddQQBwVkaiRpR0VGfp4Io2V+KcD8Dcdzv+lkD5fzCs=;
        b=QQE/15SUvMrYA/n/TMOD2FcpVbrTYbl1TofzPcGgIHhzfmJjPznp664OWHIMRqovV+
         iJGECddHbCdyzimPLzhTAUZKFeUCOvRTRVlu6aZU+/GGlLX53NlDUmfpzp+Em/JdnDzk
         SggX5U1HuJQ30iqoN7ZJd/6Ef5ti5MINXmzVZlHlL944lzpM9/Z7YKaMsqedEjt/otQd
         WYJmRpgaSGPgS7424Gsi77vEogVBeG70aHC0G3I6E4AaS3WsFT3a4YvBjMiixc4ogXUy
         9q7k2d9irnJqxtdrAB4fcRxmZ2CB5dU1+JlWrBiF1SQhfM6E+dygHDvfnaab55Rllo27
         ZDdA==
X-Forwarded-Encrypted: i=1; AHgh+Rr+Iy1mdeW/KW7965udx5qMfzFWK1Tf1clXvRCEEOKTFye3DsUsiB61PDQiQX1cqYtruqm301G49h6Cjw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfwnK5coYa7+cbe/faaMwoXLyoa5DEoKMBUtNWPkgzdqUWReOA
	c4ZzjRzL/yBHoNFh0Pz1LPFNDFhRY0prpBu9qFa1P5FlxjJgK/C97GaDSM/zqN2838zSfpgkGNL
	CBKi0GGAgw61mhmJo/6COARHUGr/dRcohWb7Da3WXl5V4CdqIn2DiS5+IEDKT1FBfXw==
X-Gm-Gg: AfdE7cmVhYioqcQMsOOVkjFdx39zG9C51kyMHCQntz+VRLVh4H4MdoBDRthATWfbzk3
	GHST3J006AfWCysi9sRkZxswhv7mBHwwJCayDR5TYUBkWKlbdbrNcTKPWX+bU3zWSXeoU52yNUm
	n+i3xilYDs6/az0OduGN+lUxlvqja61KWhGYRaCVnJTdfU5NJlgx8k5vtDhsZnOGmBXgDggHU0x
	tNmjavoIsxQp1lzGWxpAYhgij/gIhLtoGLUB1zEvpoNR9MJnHO+c+XwBkD3DsX/vKlL7uX9U49g
	6RY6aF5hBaVliqDI23Z8pgw1/pkqw+W3KyQ/xtKfOGI8hbZGN/6/ByP6GO+DP5BH87CZ58l4oXH
	hz36zAsyX4LAWl6hsUT4jwN2FlJansNbloucvlCmwhFt3CBmop2eKohMGM0JR0UPJfypsuClYYQ
	==
X-Received: by 2002:a05:6102:54a0:b0:720:8849:88e7 with SMTP id ada2fe7eead31-744dfe61af4mr1302854137.17.1783516583445;
        Wed, 08 Jul 2026 06:16:23 -0700 (PDT)
X-Received: by 2002:a05:6102:54a0:b0:720:8849:88e7 with SMTP id ada2fe7eead31-744dfe61af4mr1302802137.17.1783516582708;
        Wed, 08 Jul 2026 06:16:22 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:2110:e352:d7b8:8bf2? ([2a05:6e02:1041:c10:2110:e352:d7b8:8bf2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d905sm44373246f8f.2.2026.07.08.06.16.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 06:16:21 -0700 (PDT)
Message-ID: <76b55f79-010d-46a8-a7c6-a47d18ce2143@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 15:16:20 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] Lenovo ThinkPad T14s EC thermal monitoring and
 thermal zone integration
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
References: <20260707192228.14647-1-daniel.lezcano@oss.qualcomm.com>
 <ak48gsxhVW492C7H@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <ak48gsxhVW492C7H@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEyOSBTYWx0ZWRfX4xpA3VPyd+Hw
 IwdouTjL0KMmciOedRSMKlzoyCcOT5VrfOxyMiXVr1m9pMIsxs37fOerZvuGIURgmeLGheMg/Iq
 0TayDQUkbQYzHiuWWjGVubDDuFhNd30=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEyOSBTYWx0ZWRfX0VdxXoWDjDjA
 /VeDwkh6B8GQw9lHfD5ItGOut6MlmMf0C/oRL2lavxr8T9DgX3IUsQvLS6b9TpXfI9+CZFDoMk4
 I3NCYwsrBtxc1hZLA/Iyby58YueOMznjowSVQFYZeRZyhmWAqn/rnbmYvX+D3uttHzDWobBq6LX
 BJqWLGIS2XZWWPYVM0zp5NEHa2ZFqgMTWzenaGqhRZZCrq9bxGyaAEvyUlHTzHt8suIE8jn9jsj
 cqFebLHnOSEzyUDJ7IVG0weDvM4IwTSgTnggwqdb6uHSbzlbnOFj5mD7QCAIbf49KEtFKp7Fc6m
 J8j69hghtnpawKt9jtYjqZW+TkOJc1Q5CCnDhTONtkTdDkxVNJUp3f1/ob9qqDAFZ16gfZjAwJR
 Zs24XBHIIFB3W4SnOkbnAe2IeSBeEcIf96I9s2ZfJNqI8dC3HVc3twueY13uu6RkuiP+wiqYqdp
 lczDwCcpnAPaJCi2FDA==
X-Proofpoint-ORIG-GUID: UOPiq1lTP53I9pcCeI1CRokgzl3QTcEZ
X-Authority-Analysis: v=2.4 cv=JLULdcKb c=1 sm=1 tr=0 ts=6a4e4da8 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=7Jf4kJHaAAAA:8
 a=8k6WQxmsAAAA:8 a=BcwmCNv_Av6BOAgHPewA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=TjNXssC_j7lpFel5tvFf:22 a=B30mOkiisUNQCrgcu9ts:22
X-Proofpoint-GUID: UOPiq1lTP53I9pcCeI1CRokgzl3QTcEZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080129


Hi Stephan,

On 7/8/26 14:03, Stephan Gerhold wrote:
> On Tue, Jul 07, 2026 at 09:22:25PM +0200, Daniel Lezcano wrote:
>> This series extends the Lenovo ThinkPad T14s embedded controller driver
>> with environmental monitoring capabilities and integrates the exposed
>> sensors into the Linux thermal framework.
>>
>> The EC provides access to several platform temperature sensors
>> covering the SoC, keyboard area, bottom cover, charging circuitry, QTM
>> module and SSD. These sensors are currently used by the firmware for
>> thermal management but are not exposed to Linux.
>>
>> The first patch adds hwmon support for the EC temperature sensors.
>>
>> The second patch exposes the EC as a thermal sensor provider in the
>> device tree and defines thermal zones for the keyboard skin
>> temperature and the charging circuitry temperature. This allows the
>> generic thermal framework to react to EC-reported temperatures and
>> apply standard Linux thermal mitigation policies.
>>
>> As the EC protocol is not fully decoded, the passive trip points
>> get/set actions are missing, so it is not possible to program a
>> threshold and receive an interrupt when crossed the way up or
>> down. Consequently, the thermal zone related to the charging circuitry
>> is polled every two seconds until we can set the trip points in the
>> EC.
>>
>> This series fixes critical thermal issues happening on this platform
>> where a kernel compilation, or heavy workloads, lead to a system
>> reboot.
>>
> 
> Thanks for working on this! I have a few comments/questions about this:

Thanks for jumping in the discussion

> 1. EC vs PMIC temperature sensors
> 
> AFAIK, the T14s (and actually most X1E laptops) have two sets of
> thermistors in each location: One is connected to the PMIC (called
> SYS_THERMx), and the other set is connected to the EC.

 From the schematics I have in my possession, the SYS_THERMx are 
connected to the EC, at least this is how they are named. May be it is 
the other set with different numbers.

I'm curious to know why this mirroring ?

> The SYS_THERMx sensors connected to the PMIC have been enabled for the
> T14s already over a year ago [1]. The reason this is not upstream is
> that we now been waiting 3 years for the corresponding ADC/thermal code
> to land upstream [2]. It seems pretty close now, the ADC part has landed
> and there is only the thermal part left [3].

Right, I have to pick this one.

> The PMIC thermistor setup is likely going to be similar for most X1E
> laptops, so I think it would be preferable to use that instead of the EC
> sensors to implement additional temperature throttling. It also supports
> interrupts/trip points already, so it doesn't need polling.

I definitively second that

> The most recent proposed patch actually adds the SYS_THERMx thermal
> zones to all X1E-based devices [4], although I'm not sure if it would be
> better to keep that device-specific...
> 
> [1]: https://github.com/stephan-gh/linux/commit/c0ddc9fa96667d6b32d690ce6a3dcfc76aaabad6
> [2]: https://lore.kernel.org/linux-arm-msm/20230708072835.3035398-1-quic_jprakash@quicinc.com/
> [3]: https://lore.kernel.org/linux-arm-msm/20260705-gen3_adc_tm-v3-0-ac62f387dbce@oss.qualcomm.com/
> [4]: https://lore.kernel.org/linux-arm-msm/20260614-adc5_gen3_dt-v2-4-32ec576c5865@oss.qualcomm.com/
> 
> 2. EC sensor mapping vs PMIC sensor mapping
> 
> In PATCH 2/3 you define:
> 
> 	{ .label = "soc",	.reg = T14S_EC_SYS_THERM0 },
> 	{ .label = "keyboard",	.reg = T14S_EC_SYS_THERM1 },
> 	{ .label = "base",	.reg = T14S_EC_SYS_THERM2 },
> 	{ .label = "charging",	.reg = T14S_EC_SYS_THERM3 },
> 	{ .label = "qtm",	.reg = T14S_EC_SYS_THERM6 },
> 	{ .label = "ssd",	.reg = T14S_EC_SYS_THERM7 },
> 
> I'm not sure if this is correct. When comparing this with the data read
> from the sensors connected to the PMIC:
> 
> | Sensor          | PMIC Channel | EC (hwmon)   | PMIC (thermal)  | Delta    |
> |-----------------|--------------|--------------|-----------------|----------|
> | SOC             | SYS_THERM0   | 79.0°C       | 78.7°C          | +0.3°C   |
> | Keyboard        | SYS_THERM1   | 68.0°C       | 70.1°C          | -2.1°C   |
> | Base / Back     | SYS_THERM2   | 66.0°C       | 64.6°C          | +1.4°C   |
> | Charging        | SYS_THERM3   | 73.0°C       | 73.8°C          | -0.8°C   |
> | West / QTM      | SYS_THERM6   | 64.0°C       | 62.6°C          | +1.4°C   |
> | SSD             | SYS_THERM7   | 31.0°C       | 67.1°C          | -36.1°C  |
> | Modem           | SYS_THERM4   | N/A          | 31.6°C          | N/A      |
> | East            | SYS_THERM5   | N/A          | 70.3°C          | N/A      |
> 
> The SSD delta of 36°C is definitely suspicious. I think
> "ssd"/T14S_EC_SYS_THERM7 in your EC driver patch is actually the modem
> sensor (SYS_THERM4).

Yes probably, it was unclear from the documentation. I may have mixed 
some info.

The SoC sensor seems to be hotter than the Charging sensor. I'm a bit 
surprised because I've always seen charging hotter than the rest.


> If you look at a picture of the T14s mainboard
> (https://www.notebookcheck.net/fileadmin/_processed_/d/c/csm_DSC_0003_aadae1ddd2.jpg)
> and zoom in to the unpopulated modem sub-board left to the fan you can
> see the two thermistors RT601 and RT301. The SSD on the other hand sits
> almost directly next to the SoC on the right, so I wouldn't expect it to
> stay > 30°C cooler than its surroundings.
> 
> However, there are also two thermistors next to the SSD, see e.g. this
> close-up picture of the mainboard:
> https://download.lenovo.com/Images/Parts/5B21P83385/5B21P83385_A.jpg
> This means that the SSD is probably one of the other mappings. If the
> thermistors are consecutively numbered in the EC firmware, the SSD
> (RT8203) might be actually the third sensor ("base"/T14S_EC_SYS_THERM2).
> I'm not sure how to figure out the proper mapping.
> 
> The back of the mainboard is completely covered with tape
> (https://download.lenovo.com/Images/Parts/5B21P83377/5B21P83377_B.jpg)
> so it's impossible to see anything there.
> 
> 3. Active vs passive throttling
> 
> Are you matching the Windows cooling/throttling setup here? If not, have
> you considered how this interacts with the fan control applied by the
> EC? I'm a bit worried that this might lead to unexpected performance
> regressions if we start throttling before the EC runs the fan at full
> speed.

For the moment, I would say fixing the critical issue is the highest 
priority. With the 'charging' sensor with a 55°C trip point, AFAICT the 
fan is at full speed before this trip is reached.

Then we may want to take control of the fan and add active trip and 
passive trip.

This autonomous EC / PMIC mix sounds a bit strange to me :/


