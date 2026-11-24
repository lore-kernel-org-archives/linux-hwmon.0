Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795526156;
	b=449AAl0GmXTkZ8duymzwTCkm7X+2YvDu+0QW2XoQNTBsPE4RQvbm8NrckkgUcfK6ANyD
	 U0YJoHmWOOkihNwnpzXNJAAXZi2h++ruBrt4TNlJ4ESqHGcl9dqiE7O6aCwfFCVqifEnO
	 7fwcgHfLjsQPM7NisR+NVloSxGZ+lb9TJ3xghmUThFeB8t8ITwJ4pMb+gihNCDOmaf7CT
	 KkNL9UGImuEI0ILgrBKlmleXDy/h9ZR1XwZC53cjSlGX4aGUyXKntDtZ1TohfacRs7pKf
	 E/WavLH/Aq/HVy5Aq1/31McZJfHkokiyG3dGaYhHTUPpmy9Uzv/2YAYfUz4hHRbBeDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526156;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=m1rqnYd4punCWixgz7BXE3/JxA9vIXes/iieBPmvnpw=;
	b=uWCr2N0nxo22ZpnNv2XOop244fQsVFmI3JezhRHCljxgB1xsI0/SVJ5gUZrLpTThc0t7
	 4L7ZZRrG+7fCYF4HAhBXZqGMVvW9j5wWlSY3Vz/nUfyQ+8f3XXeTvBEngdfWoBTumvSY6
	 3BkVSO2E1GC3r5yUfx9E2Qm7xUWSHWcMNO70QKP9aGbFYZG8tcxuEewmBhSaGG7xPN6cE
	 YWzaI6wLTtcqc4j769/eA+x0UOZJA7g0tQii9yCFrznMNZNCTYYRsQKtEkRBjE5MhokBE
	 1onV0QVKwq4sCK/C/H1hfMOyKH+KRfVg5Nc9/H+xMxs4eJTFjra815qzSretZ5OieCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cSvu5e8u;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F+ZeteHF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64315606A686
	for <linux-hwmon@vger.kernel.org>; Tue, 24 Nov 2026 13:15:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64315606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cSvu5e8u;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F+ZeteHF
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuaZX3299679
	for <linux-hwmon@vger.kernel.org>; Tue, 24 Nov 2026 13:15:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m1rqnYd4punCWixgz7BXE3/JxA9vIXes/iieBPmvnpw=; b=cSvu5e8uAz5Cbv4z
	ZzQxAcGZ/gV/+wqKBcYqnvXW0yoCHBEq/Xe/uA5am5FxdLhP93amvdXTMZkQW8w0
	Do+ma9hxym/1DVs7m8D0O2EFHP11tY0JYfEOQggsEO6TWvO1uwmtZvBb8kO+XfiT
	XA65UW1a4PZNtTiOXMomsY5yeIsDaufXbQUX684PRfnmF1GYfzJpxnoKzTWo4TIp
	e9Luces/lWgfUOoyKUzlvT5+JgnvlpHkWYJWb+t1nf7/BmQGAk2ipUs/Q6dZOui9
	0HVYR/k0u1ZvpSFeSGEvIiE3av0yJzt4gB7onhqxTev4CUEOjhxe7xYXaN+SumV4
	WzH/xg==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yy12wkp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 24 Nov 2026 13:15:54 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b37869f851so72141457b3.2
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Nov 2026 05:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795526154; x=1796130954; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m1rqnYd4punCWixgz7BXE3/JxA9vIXes/iieBPmvnpw=;
        b=F+ZeteHFTgWn3MbOBwEBQ0++56V5pHksCA59rWfvqvPGgEbYYOlQ9erJJ9zWvwpDT8
         HKm1fk0m358r9GzU1uDoAz/uBbHBON11B7YRaqD0VGVkL4QhN/g4zYGCOKntNZp4UQFx
         KtFOMcCOUmOZy+7RDaiGneNhdQ78zMZXI+Fa+qslpzz0hocfKHELSHdGEeB7geEji5VX
         DOIZaCvlDqqKirE1M7TKaiwmTdaxJW26wjkVqrfCcROJYoE0bwvjPNj2Skd9rIcuHEj/
         osvMR/dITG4P4l6QHhjlu+wRH2kwWd2oZoDUbB/n5ihOWI3cFlONLVCfdT44aj8laC07
         blPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795526154; x=1796130954;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m1rqnYd4punCWixgz7BXE3/JxA9vIXes/iieBPmvnpw=;
        b=WYBPZElV5Vxonx2SXp2K9rGAwAELjhPIZejVNIti9GuTVarW/UkQxeTEVGTYZxTCyC
         D2d8zbcEfS4J1crNoLFUOA4N5IIS+hAdnzJRJ3geMz24O11XjqsYy1KhPSIIsqPqS7VN
         EibFzts6AAxzcu1nu83lfCRoZ60I8GDnnVO655O0X+vTILd/tWsXIzPu2+9CYYql/D+J
         JPg1eEKjPRxSCHbkLVq18bR7LZ3WCl+DwbyozUgvp+NJctTVkCNeaxJy9DYDnLL1L0tY
         G/ZFKL4bj2v+70YxnyPSi6ScZXTHWsYICfnBvzg+/n5nQ3stIUvbylCdhcNASfuqbJqU
         P7IQ==
X-Gm-Message-State: APuU4Z/ycFjcin7+MiFncHcBX3WsIHolt2ImIcP0RxEjDsii3nhqdscr
	XwhCLADbEaTSyZ52cIv4xkHjwzai+o0zn/BkE8Uj6lrcsMHd7sTkwyKnQR0OMeMdKYjgceQ7rm4
	Sohf7kD/pLu1afbL+WxwAA708csbhjt+9v348ab7naHo4CK4OtYtUPcRSPtPYVW5qbA==
X-Gm-Gg: AZFdTZe91pcJ/C3TLRLvD2aROP3BuZr2IRyrT28sPvzhDuu6kqPdlFMTXADqDzBnBUS
	y1hzoDPCrn7AG8G+UzvmPBnx5HQq4FusPRHDkzXuR11pzOT1qZVLFNpcOppASr0KnkYbqd8jXjr
	7V0iCzoInj1PFyy8eTk3rAjBpvt8Bt5+CRrby0ejQGlJaerMT2+c9Tjr58kYCwIkXRnrJtZRBBP
	4MDIti2ecILvME/aOFzfz+bV5zTSQJVBDTJgEl1HKoVRqV7iPhTPTxaRJ0h+M+JP5BYWTPTuv8a
	MTkazujPGCiTqhGHsqzrGE9Lf6/GcWDNBhAp6bGuXB4Sq2+KzzX7gUZcjeLF201iTjduHwy052l
	JWXztNDp/8FCLto8ijrsuWOq7M6BPMBc6JlK2U9s3xYDBVndmywMFkItZ2feWxGxyDMLmPTguZ4
	b9D9Q7djmM0W/gbF1u6sUYbvMDLvgKR7mSTB0=
X-Received: by 2002:a05:690e:419a:b0:67d:c1a6:1d25 with SMTP id 956f58d0204a3-67df44dad7amr3597459d50.116.1795526152943;
        Tue, 24 Nov 2026 05:15:52 -0800 (PST)
X-Received: by 2002:a05:690e:419a:b0:67d:c1a6:1d25 with SMTP id 956f58d0204a3-67df44dad7amr3597426d50.116.1795526151883;
        Tue, 24 Nov 2026 05:15:51 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:2904:b6b3:45df:9155? ([2a05:6e02:1041:c10:2904:b6b3:45df:9155])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61e53asm29074160f8f.59.2026.11.24.05.15.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 05:15:50 -0800 (PST)
Message-ID: <7459d762-d694-4ad9-8551-a6d7e0145319@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 14:15:49 +0100
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/12] hwmon: Add Qualcomm PMIC BCL driver
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, linux-doc@vger.kernel.org
References: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
 <20261124-qcom-bcl-hwmon-v5-2-747d5383d538@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-bcl-hwmon-v5-2-747d5383d538@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: l7HCsxM0uMsUOqo6mP2idD-6uZvsx0Oe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1MSBTYWx0ZWRfX4Yw41Ao9q5o7
 7GFN88uKGPKGWb4mk7aw2UcrKdZHgCEmTIBsOYvd3tnk7jP8C04RNDf/G64qZs/Dz6XIEHK3oqj
 wYp1RqvpJT75XQCW7+gx/17UKAa1dTI=
X-Authority-Analysis: v=2.4 cv=JYspPkKV c=1 sm=1 tr=0 ts=6b058e0a cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=UP6OsoqGTlvrOXh9pHIA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1MSBTYWx0ZWRfX364NQzHIrsLU
 HXXOjxTllY2i7UgxD+x6qZ6BSUhi7yu7WEsZqOHjAbIo3Ucc9H9ul/KYpcIFLPINurCm0oZnOOI
 LEX+v9RJ3BRU1mEJeY4VDG79V1liPsHHtze755x0xHMYj/a3zJzswM0uZFajGhqm57ujTzduSPV
 WpPeTLB7w0b/LxVrZ9JAf3OV5J89qqx7NltZ5SKib0sDOfpcxcLGqW4GY+VB84vzkp9i6Gp22IN
 rcq5rEg8yFKDH4nZSqc2EVLSwpirFo/++khT7HPN3nl2ZOEgdyJ4paRJs5DF+g7DAenKymcL9VG
 I/mSGQEyfdO9UvlY4si8GPF7NvhM2sxmt5XG0kYGwmn4E/m8HTQSX2LRDcvlsXjMvbpKQu1WMHs
 e1Hf3a7JvKjCdJqxYHfNQaOMfQn4i42pIkwKeWczijFpDHRKcZoTM2oYGuq6tc/C+HzwXbp+gCG
 yT495urKEK2yP8aSAgA==
X-Proofpoint-GUID: l7HCsxM0uMsUOqo6mP2idD-6uZvsx0Oe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240051

On 11/23/26 21:54, Manaf Meethalavalappu Pallikunhi wrote:
> Add driver for Qualcomm SPMI PMIC Battery Current Limiting (BCL)
> hardware monitor. The driver exposes battery voltage and current
> monitoring through hwmon interface.
> 
> The BCL driver provides
> - Real-time voltage and current readings
> - Configurable threshold-based alarms
> - Interrupt-driven notifications when thresholds are exceeded
> - Automatic threshold management with polling-based recovery
> - Hardware-specific scaling factors and threshold representations
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---
>   Documentation/hwmon/index.rst          |    1 +
>   Documentation/hwmon/qcom-bcl-hwmon.rst |   67 ++
>   MAINTAINERS                            |    2 +
>   drivers/hwmon/Kconfig                  |   12 +
>   drivers/hwmon/Makefile                 |    1 +
>   drivers/hwmon/qcom-bcl-hwmon.c         | 1434 ++++++++++++++++++++++++++++++++
>   6 files changed, 1517 insertions(+)
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 2167e04ef573..3dc615316290 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -241,6 +241,7 @@ Hardware Monitoring Kernel Drivers
>      pxe1610
>      pwm-fan
>      q54sj108a2
> +   qcom-bcl-hwmon
>      qnap-mcu-hwmon
>      raspberrypi-hwmon
>      sbrmi
> diff --git a/Documentation/hwmon/qcom-bcl-hwmon.rst b/Documentation/hwmon/qcom-bcl-hwmon.rst
> new file mode 100644
> index 000000000000..8ab4ff31aa15
> --- /dev/null
> +++ b/Documentation/hwmon/qcom-bcl-hwmon.rst
> @@ -0,0 +1,67 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +Kernel driver qcom-bcl-hwmon
> +=============================
> +
> +Supported chips:
> +
> +  * Qualcomm SPMI PMIC Battery Current Limiting (BCL) peripheral
> +
> +    Prefix: 'qcom-bcl-hwmon'
> +
> +    Addresses scanned: none
> +
> +    Datasheet: Not publicly available.
> +
> +  Compatible strings:
> +
> +    - qcom,pm7250b-bcl
> +    - qcom,pm7550ba-bcl
> +    - qcom,pm8350c-bcl
> +    - qcom,pm8550-bcl
> +    - qcom,pmh0101-bcl
> +    - qcom,pmih0108-bcl
> +    - qcom,smb2360-bcl
> +    - qcom,smb2370-bcl
> +    - qcom,pm7550-bcl (requires qcom,pm8550-bcl as a fallback compatible)
> +
> +Author: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> +
> +Description
> +-----------
> +
> +This driver supports the Battery Current Limiting (BCL) peripheral found
> +on several Qualcomm SPMI PMICs. BCL monitors system/battery voltage and
> +battery current against three configurable threshold levels (LVL0, LVL1,
> +and LVL2/emergency) and raises an alarm interrupt when a threshold is
> +crossed.
> +
> +Each alarm level has a dedicated IRQ. On an alarm interrupt, the driver
> +disables that level's IRQ, notifies hwmon of the change, and schedules a
> +delayed work item to poll the alarm status; the IRQ is re-enabled once
> +polling observes that the alarm condition has cleared. Not all PMIC
> +variants support both voltage and current monitoring, or both input and
> +threshold reporting on a given channel -- availability is determined by
> +devicetree-described hardware features.
> +
> +Sysfs entries
> +--------------
> +
> +The presence of individual sysfs attributes depends on the features
> +supported by the underlying PMIC hardware variant.
> +
> +======================= =======================================
> +in0_input               Measured voltage (mV)
> +in0_min                 LVL0 (undervoltage) threshold, RW
> +in0_min_alarm           LVL0 undervoltage alarm
> +in0_lcrit               LVL1 (undervoltage) threshold, RW
> +in0_lcrit_alarm         LVL1 undervoltage alarm
> +in0_lemergency          LVL2 (undervoltage) threshold, RW
> +in0_lemergency_alarm    LVL2 undervoltage alarm
> +curr1_input             Measured current (mA)
> +curr1_max               LVL0 (overcurrent) threshold, RW
> +curr1_max_alarm         LVL0 overcurrent alarm
> +curr1_crit              LVL1 (overcurrent) threshold, RW
> +curr1_crit_alarm        LVL1 overcurrent alarm
> +curr1_emergency_alarm   LVL2 (overcurrent) alarm
> +======================= =======================================
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 36a470c859a7..9ebbd1db2ce4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23086,6 +23086,8 @@ L:	linux-hwmon@vger.kernel.org
>   L:	linux-arm-msm@vger.kernel.org
>   S:	Maintained
>   F:	Documentation/devicetree/bindings/hwmon/qcom,pm7250b-bcl.yaml
> +F:	Documentation/hwmon/qcom-bcl-hwmon.rst
> +F:	drivers/hwmon/qcom-bcl-hwmon.c
>   
>   QUALCOMM BLUETOOTH DRIVER
>   M:	Bartosz Golaszewski <brgl@kernel.org>
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 576ddbfec7ab..0bd9c864316d 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -2027,6 +2027,18 @@ config SENSORS_PWM_FAN
>   	  This driver can also be built as a module. If so, the module
>   	  will be called pwm-fan.
>   
> +config SENSORS_QCOM_SPMI_BCL
> +	tristate "Qualcomm SPMI BCL hardware monitoring"
> +	depends on MFD_SPMI_PMIC || COMPILE_TEST
> +	depends on SPMI
> +	select REGMAP_SPMI
> +	help
> +	  Say yes here to enable support for Qualcomm battery over current
> +	  and under voltage alarms monitor.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called qcom-bcl-hwmon.
> +
>   config SENSORS_QNAP_MCU_HWMON
>   	tristate "QNAP MCU hardware monitoring"
>   	depends on MFD_QNAP_MCU
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 3ee099699f6f..2c2e14aaee35 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -210,6 +210,7 @@ obj-$(CONFIG_SENSORS_POWR1220)  += powr1220.o
>   obj-$(CONFIG_SENSORS_PROM21_XHCI)	+= prom21-xhci.o
>   obj-$(CONFIG_SENSORS_PT5161L)	+= pt5161l.o
>   obj-$(CONFIG_SENSORS_PWM_FAN)	+= pwm-fan.o
> +obj-$(CONFIG_SENSORS_QCOM_SPMI_BCL)	+= qcom-bcl-hwmon.o
>   obj-$(CONFIG_SENSORS_QNAP_MCU_HWMON)	+= qnap-mcu-hwmon.o
>   obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)	+= raspberrypi-hwmon.o
>   obj-$(CONFIG_SENSORS_SBTSI)	+= sbtsi_temp.o
> diff --git a/drivers/hwmon/qcom-bcl-hwmon.c b/drivers/hwmon/qcom-bcl-hwmon.c
> new file mode 100644
> index 000000000000..a5a3a5948457
> --- /dev/null
> +++ b/drivers/hwmon/qcom-bcl-hwmon.c
> @@ -0,0 +1,1434 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Qualcomm pmic BCL driver for battery overcurrent and
> + * battery or system under voltage monitor
> + *
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/devm-helpers.h>
> +#include <linux/err.h>
> +#include <linux/hwmon.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/math64.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +#include <linux/workqueue.h>
> +
> +/* BCL common regmap offset */
> +#define REVISION1			0x0
> +#define REVISION2			0x1
> +#define STATUS				0x8
> +#define EN_CTL1				0x46
> +
> +/* BCL GEN1 regmap offsets */
> +#define VADC_L0_THR			0x48
> +#define VCMP_L1_THR			0x49
> +#define VCMP_L2_THR			0x4a
> +#define IADC_H0_THR			0x4b
> +#define IADC_H1_THR			0x4c
> +#define VADC_DATA1			0x76
> +#define IADC_DATA1			0x86
> +
> +/* BCL GEN3 regmap offsets */
> +#define VCMP_L0_THR			0x47
> +#define IADC_H1_THR_GEN3		0x4d
> +
> +#define BCL_ALARM_POLLING_MS		50
> +
> +/**
> + * enum bcl_limit_alarm - BCL alarm threshold levels
> + * @BCL_LIMIT_ALARM_LVL0: Level 0 alarm threshold
> + * @BCL_LIMIT_ALARM_LVL1: Level 1 alarm threshold
> + * @BCL_LIMIT_ALARM_LVL2: Level 2 alarm threshold
> + * @BCL_LIMIT_ALARM_MAX: sentinel value
> + *
> + * Defines the threshold levels for BCL monitoring. Each level corresponds
> + * to different severity of in or curr conditions.
> + */
> +enum bcl_limit_alarm {
> +	BCL_LIMIT_ALARM_LVL0,
> +	BCL_LIMIT_ALARM_LVL1,
> +	BCL_LIMIT_ALARM_LVL2,
> +
> +	BCL_LIMIT_ALARM_MAX,
> +};
> +
> +/**
> + * enum bcl_channel - BCL supported sensor channel type
> + * @CHANNEL_IN: in (voltage) channel
> + * @CHANNEL_CURR: curr (current) channel
> + * @CHANNEL_MAX: sentinel value
> + *
> + * Defines the supported channel types for bcl.
> + */
> +enum bcl_channel {
> +	CHANNEL_IN,
> +	CHANNEL_CURR,
> +
> +	CHANNEL_MAX,
> +};
> +
> +/**
> + * enum bcl_thresh_type - voltage or current threshold representation type
> + * @THRESH_TYPE_ADC: Raw ADC value representation
> + * @THRESH_TYPE_INDEX: Index-based voltage or current representation
> + *
> + * Specifies how voltage or current thresholds are stored and interpreted in
> + * registers. Some PMICs use raw ADC values while others use indexed values.
> + */
> +enum bcl_thresh_type {
> +	THRESH_TYPE_ADC,
> +	THRESH_TYPE_INDEX,
> +};
> +
> +/**
> + * enum bcl_battery_config - Battery configuration types
> + * @BCL_BATT_1S: Single cell battery
> + * @BCL_BATT_2S: Two cells in series
> + * @BCL_BATT_3S: Three cells in series
> + */
> +enum bcl_battery_config {
> +	BCL_BATT_1S,
> +	BCL_BATT_2S,
> +	BCL_BATT_3S,
> +};
> +
> +/**
> + * enum bcl_fields - BCL register field identifiers
> + * @F_V_MAJOR: Major revision info field
> + * @F_V_MINOR: Minor revision info field
> + * @F_CTL_EN: Monitor enable control field
> + * @F_LVL0_ALARM: Level 0 alarm status field
> + * @F_LVL1_ALARM: Level 1 alarm status field
> + * @F_LVL2_ALARM: Level 2 alarm status field
> + * @F_IN_L0_THR: voltage level 0 threshold field
> + * @F_IN_L1_THR: voltage level 1 threshold field
> + * @F_IN_L2_THR: voltage level 2 threshold field
> + * @F_IN_INPUT: voltage input data field (LSB for 16-bit data)
> + * @F_CURR_H0_THR: current level 0 threshold field
> + * @F_CURR_H1_THR: current level 1 threshold field
> + * @F_CURR_INPUT: current input data field (LSB for 16-bit data)
> + * @F_MAX_FIELDS: sentinel value
> + *
> + * Enumeration of all register fields used by the BCL driver for accessing
> + * registers through regmap fields.
> + */
> +enum bcl_fields {
> +	/* Common fields - present in all BCL variants */
> +	F_V_MAJOR,
> +	F_V_MINOR,
> +	F_CTL_EN,
> +	F_LVL0_ALARM,
> +	F_LVL1_ALARM,
> +	F_LVL2_ALARM,
> +
> +	/* Voltage monitoring fields */
> +	F_IN_L0_THR,
> +	F_IN_L1_THR,
> +	F_IN_L2_THR,
> +	F_IN_INPUT,
> +
> +	/* Current monitoring fields */
> +	F_CURR_H0_THR,
> +	F_CURR_H1_THR,
> +	F_CURR_INPUT,
> +
> +	F_MAX_FIELDS
> +};
> +
> +/**
> + * struct bcl_channel_cfg - BCL channel related configuration
> + * @default_scale_nu:  Default scaling factor in nano unit
> + * @base_mu: Base threshold value in milli unit
> + * @max_mu: Maximum threshold value in milli unit
> + * @step_mu: step increment value between two indexed threshold value in milli unit
> + * @thresh_type: Array specifying threshold representation type for each alarm level
> + *
> + * Contains hardware-specific configuration and scaling parameters for different
> + * channels (voltage and current).
> + */
> +struct bcl_channel_cfg {
> +	u32 default_scale_nu;
> +	u32 base_mu;
> +	u32 max_mu;
> +	u32 step_mu;
> +	u8 thresh_type[BCL_LIMIT_ALARM_MAX];
> +};
> +
> +#define BCL_IN_MON	BIT(0)	/* Voltage monitoring enabled at boot */
> +#define BCL_IN_INPUT	BIT(1)	/* Voltage input reading enabled at boot */
> +#define BCL_CURR_MON	BIT(2)	/* Current monitoring enabled at boot */
> +
> +/**
> + * struct bcl_desc - BCL device descriptor
> + * @reg_fields: Array of register field definitions for this device variant
> + * @channel_cfg: Array of channel configurations indexed by battery config
> + *               PMICs without battery detection: only [BCL_BATT_1S] is defined
> + *               PMICs with battery detection: [BCL_BATT_2S], [BCL_BATT_3S]
> + * @battery_config_field: Register field for battery configuration detection
> + *                        NOTE: This is an ABSOLUTE address, not relative to BCL base
> + *                        Set to REG_FIELD(0, 0, 0) if not used
> + * @num_reg_fields: Number of register field definitions for this device variant
> + * @data_field_bits_size: data read register bit size
> + * @thresh_field_bits_size: lsb bit size those are not included in threshold register
> + * @features: Bitmask of BCL_IN_MON / BCL_IN_INPUT / BCL_CURR_MON
> + *
> + * Contains hardware-specific configuration and scaling parameters for different
> + * BCL variants. Each PMIC model may have different register layouts and
> + * conversion factors.
> + */
> +struct bcl_desc {
> +	const struct reg_field *reg_fields;
> +	struct bcl_channel_cfg channel_cfg[BCL_BATT_3S + 1][CHANNEL_MAX];
> +	const struct reg_field battery_config_field;
> +	u8 num_reg_fields;
> +	u8 data_field_bits_size;
> +	u8 thresh_field_bits_size;
> +	u8 features;
> +};
> +
> +/**
> + * struct bcl_alarm_data - BCL alarm interrupt data
> + * @irq: IRQ number assigned to this alarm
> + * @irq_enabled: Flag indicating if IRQ is enabled
> + * @irq_wake_enabled: Flag indicating if IRQ wake is enabled
> + * @shutting_down: Flag preventing work from re-enabling IRQ during teardown
> + * @type: Alarm level type (LVL0, LVL1, or LVL2)
> + * @device: Pointer to parent BCL device structure
> + * @a_lock: Mutex for protecting alarm state
> + * @alarm_poll_work: delayed_work to poll alarm status
> + *
> + * Stores interrupt-related information for each alarm threshold level.
> + * Used by the IRQ handler to identify which alarm triggered.
> + */
> +struct bcl_alarm_data {
> +	int			irq;
> +	bool			irq_enabled;
> +	bool			irq_wake_enabled;
> +	bool			shutting_down;
> +	enum bcl_limit_alarm	type;
> +	void			*device;

Use struct bcl_device * instead

> +	/* Protects alarm IRQ enable/disable state */
> +	struct mutex		a_lock;
> +	struct delayed_work	alarm_poll_work;
> +};
> +
> +/**
> + * struct bcl_device - Main BCL device structure
> + * @dev: Pointer to device structure
> + * @regmap: Regmap for accessing PMIC registers
> + * @base: the BCL regbase offset from regmap
> + * @fields: Array of regmap fields for register access
> + * @bcl_alarms: Array of alarm data structures for each threshold level
> + * @lock: Mutex for protecting concurrent hardware access
> + * @last_in_input: Last valid voltage input reading in millivolts
> + * @last_curr_input: Last valid current input reading in milliamps
> + * @last_in_updated: Timestamp of last voltage input update
> + * @last_curr_updated: Timestamp of last current input update
> + * @desc: Pointer to device descriptor with hardware-specific parameters
> + * @hwmon_dev: Pointer to registered hwmon device
> + * @hwmon_name: Sanitized name for hwmon device
> + * @batt_config: Detected battery configuration (only for SMB2360/2370)
> + * @batt_config_regfield: Regmap field for battery configuration register
> + *
> + * Main driver structure containing all state and configuration for a BCL
> + * monitoring instance. Manages voltage and current monitoring, thresholds,
> + * and alarm handling.
> + */
> +struct bcl_device {
> +	struct device		*dev;
> +	struct regmap		*regmap;
> +	u32			base;
> +	struct regmap_field	*fields[F_MAX_FIELDS];
> +	struct bcl_alarm_data	bcl_alarms[BCL_LIMIT_ALARM_MAX];
> +	/* Protects hardware register access and device state */
> +	struct mutex		lock;
> +	u32			last_in_input;
> +	s32			last_curr_input;
> +	unsigned long		last_in_updated;
> +	unsigned long		last_curr_updated;
> +	const struct bcl_desc	*desc;
> +	struct device		*hwmon_dev;
> +	char			*hwmon_name;
> +	enum bcl_battery_config	batt_config;
> +	struct regmap_field	*batt_config_regfield;
> +};
> +
> +static const u8 in_attr_to_lvl_map[] = {
> +	[hwmon_in_min] = BCL_LIMIT_ALARM_LVL0,
> +	[hwmon_in_lcrit] = BCL_LIMIT_ALARM_LVL1,
> +	[hwmon_in_lemergency] = BCL_LIMIT_ALARM_LVL2,
> +	[hwmon_in_min_alarm] = BCL_LIMIT_ALARM_LVL0,
> +	[hwmon_in_lcrit_alarm] = BCL_LIMIT_ALARM_LVL1,
> +	[hwmon_in_lemergency_alarm] = BCL_LIMIT_ALARM_LVL2,
> +};
> +
> +static const u8 curr_attr_to_lvl_map[] = {
> +	[hwmon_curr_max] = BCL_LIMIT_ALARM_LVL0,
> +	[hwmon_curr_crit] = BCL_LIMIT_ALARM_LVL1,
> +	[hwmon_curr_max_alarm] = BCL_LIMIT_ALARM_LVL0,
> +	[hwmon_curr_crit_alarm] = BCL_LIMIT_ALARM_LVL1,
> +	[hwmon_curr_emergency_alarm] = BCL_LIMIT_ALARM_LVL2,
> +};
> +
> +static const struct bcl_lvl_info {
> +	u8 in_alarm_attr;
> +	u8 curr_alarm_attr;
> +	const char *irq_name;
> +} bcl_lvl_info[BCL_LIMIT_ALARM_MAX] = {
> +	[BCL_LIMIT_ALARM_LVL0] = {
> +		.in_alarm_attr = hwmon_in_min_alarm,
> +		.curr_alarm_attr = hwmon_curr_max_alarm,
> +		.irq_name = "max-min",
> +	},
> +	[BCL_LIMIT_ALARM_LVL1] = {
> +		.in_alarm_attr = hwmon_in_lcrit_alarm,
> +		.curr_alarm_attr = hwmon_curr_crit_alarm,
> +		.irq_name = "critical",
> +	},
> +	[BCL_LIMIT_ALARM_LVL2] = {
> +		.in_alarm_attr = hwmon_in_lemergency_alarm,
> +		.curr_alarm_attr = hwmon_curr_emergency_alarm,
> +		.irq_name = "emergency",
> +	},
> +};
> +
> +static const struct reg_field bcl_pm7250b_reg_fields[] = {
> +	[F_V_MAJOR]	= REG_FIELD(REVISION2, 0, 7),
> +	[F_V_MINOR]	= REG_FIELD(REVISION1, 0, 7),
> +	[F_CTL_EN]	= REG_FIELD(EN_CTL1, 7, 7),
> +	[F_LVL0_ALARM]	= REG_FIELD(STATUS, 0, 0),
> +	[F_LVL1_ALARM]	= REG_FIELD(STATUS, 1, 1),
> +	[F_LVL2_ALARM]	= REG_FIELD(STATUS, 2, 2),
> +	[F_IN_L0_THR]	= REG_FIELD(VADC_L0_THR, 0, 7),
> +	[F_IN_L1_THR]	= REG_FIELD(VCMP_L1_THR, 0, 5),
> +	[F_IN_L2_THR]	= REG_FIELD(VCMP_L2_THR, 0, 5),
> +	[F_IN_INPUT]	= REG_FIELD(VADC_DATA1, 0, 7),
> +	[F_CURR_H0_THR]	= REG_FIELD(IADC_H0_THR, 0, 7),
> +	[F_CURR_H1_THR]	= REG_FIELD(IADC_H1_THR, 0, 7),
> +	[F_CURR_INPUT]	= REG_FIELD(IADC_DATA1, 0, 7),
> +};
> +
> +static const struct reg_field bcl_pm7550ba_reg_fields[] = {
> +	[F_V_MAJOR]	= REG_FIELD(REVISION2, 0, 7),
> +	[F_V_MINOR]	= REG_FIELD(REVISION1, 0, 7),
> +	[F_CTL_EN]	= REG_FIELD(EN_CTL1, 7, 7),
> +	[F_LVL0_ALARM]	= REG_FIELD(STATUS, 0, 0),
> +	[F_LVL1_ALARM]	= REG_FIELD(STATUS, 1, 1),
> +	[F_LVL2_ALARM]	= REG_FIELD(STATUS, 2, 2),
> +	[F_IN_L0_THR]	= REG_FIELD(VADC_L0_THR, 0, 7),
> +	[F_IN_L1_THR]	= REG_FIELD(VCMP_L1_THR, 0, 5),
> +	[F_IN_L2_THR]	= REG_FIELD(VCMP_L2_THR, 0, 5),
> +	[F_IN_INPUT]	= REG_FIELD(VADC_DATA1, 0, 7),
> +	[F_CURR_H0_THR]	= REG_FIELD(IADC_H0_THR, 0, 7),
> +	[F_CURR_H1_THR]	= REG_FIELD(IADC_H1_THR_GEN3, 0, 7),
> +	[F_CURR_INPUT]	= REG_FIELD(IADC_DATA1, 0, 7),
> +};
> +
> +static const struct reg_field bcl_pm8350c_reg_fields[] = {
> +	[F_V_MAJOR]	= REG_FIELD(REVISION2, 0, 7),
> +	[F_V_MINOR]	= REG_FIELD(REVISION1, 0, 7),
> +	[F_CTL_EN]	= REG_FIELD(EN_CTL1, 7, 7),
> +	[F_LVL0_ALARM]	= REG_FIELD(STATUS, 0, 0),
> +	[F_LVL1_ALARM]	= REG_FIELD(STATUS, 1, 1),
> +	[F_LVL2_ALARM]	= REG_FIELD(STATUS, 2, 2),
> +	[F_IN_L0_THR]	= REG_FIELD(VADC_L0_THR, 0, 7),
> +	[F_IN_L1_THR]	= REG_FIELD(VCMP_L1_THR, 0, 5),
> +	[F_IN_L2_THR]	= REG_FIELD(VCMP_L2_THR, 0, 5),
> +};
> +
> +static const struct reg_field bcl_pm8550_reg_fields[] = {
> +	[F_V_MAJOR]	= REG_FIELD(REVISION2, 0, 7),
> +	[F_V_MINOR]	= REG_FIELD(REVISION1, 0, 7),
> +	[F_CTL_EN]	= REG_FIELD(EN_CTL1, 7, 7),
> +	[F_LVL0_ALARM]	= REG_FIELD(STATUS, 0, 0),
> +	[F_LVL1_ALARM]	= REG_FIELD(STATUS, 1, 1),
> +	[F_LVL2_ALARM]	= REG_FIELD(STATUS, 2, 2),
> +	[F_IN_L0_THR]	= REG_FIELD(VCMP_L0_THR, 0, 5),
> +	[F_IN_L1_THR]	= REG_FIELD(VCMP_L1_THR, 0, 5),
> +	[F_IN_L2_THR]	= REG_FIELD(VCMP_L2_THR, 0, 5),
> +};
> +
> +static const struct reg_field bcl_pmh0101_reg_fields[] = {
> +	[F_V_MAJOR]	= REG_FIELD(REVISION2, 0, 7),
> +	[F_V_MINOR]	= REG_FIELD(REVISION1, 0, 7),
> +	[F_CTL_EN]	= REG_FIELD(EN_CTL1, 7, 7),
> +	[F_LVL0_ALARM]	= REG_FIELD(STATUS, 0, 0),
> +	[F_LVL1_ALARM]	= REG_FIELD(STATUS, 1, 1),
> +	[F_LVL2_ALARM]	= REG_FIELD(STATUS, 2, 2),
> +	[F_IN_L0_THR]	= REG_FIELD(VCMP_L0_THR, 0, 6),
> +	[F_IN_L1_THR]	= REG_FIELD(VCMP_L1_THR, 0, 6),
> +	[F_IN_L2_THR]	= REG_FIELD(VCMP_L2_THR, 0, 6),
> +};
> +
> +static const struct reg_field bcl_pmih0108_reg_fields[] = {
> +	[F_V_MAJOR]	= REG_FIELD(REVISION2, 0, 7),
> +	[F_V_MINOR]	= REG_FIELD(REVISION1, 0, 7),
> +	[F_CTL_EN]	= REG_FIELD(EN_CTL1, 7, 7),
> +	[F_LVL0_ALARM]	= REG_FIELD(STATUS, 0, 0),
> +	[F_LVL1_ALARM]	= REG_FIELD(STATUS, 1, 1),
> +	[F_LVL2_ALARM]	= REG_FIELD(STATUS, 2, 2),
> +	[F_IN_L0_THR]	= REG_FIELD(VADC_L0_THR, 0, 7),
> +	[F_IN_L1_THR]	= REG_FIELD(VCMP_L1_THR, 0, 5),
> +	[F_IN_L2_THR]	= REG_FIELD(VCMP_L2_THR, 0, 5),
> +	[F_IN_INPUT]	= REG_FIELD(VADC_DATA1, 0, 7),
> +	[F_CURR_H0_THR]	= REG_FIELD(IADC_H0_THR, 0, 7),
> +	[F_CURR_H1_THR]	= REG_FIELD(IADC_H1_THR_GEN3, 0, 7),
> +	[F_CURR_INPUT]	= REG_FIELD(IADC_DATA1, 0, 7),
> +};
> +
> +static const struct reg_field bcl_smb2360_reg_fields[] = {
> +	[F_V_MAJOR]	= REG_FIELD(REVISION2, 0, 7),
> +	[F_V_MINOR]	= REG_FIELD(REVISION1, 0, 7),
> +	[F_CTL_EN]	= REG_FIELD(EN_CTL1, 7, 7),
> +	[F_LVL0_ALARM]	= REG_FIELD(STATUS, 0, 0),
> +	[F_LVL1_ALARM]	= REG_FIELD(STATUS, 1, 1),
> +	[F_LVL2_ALARM]	= REG_FIELD(STATUS, 2, 2),
> +	[F_IN_L0_THR]	= REG_FIELD(VADC_L0_THR, 0, 7),
> +	[F_IN_L1_THR]	= REG_FIELD(VCMP_L1_THR, 0, 5),
> +	[F_IN_L2_THR]	= REG_FIELD(VCMP_L2_THR, 0, 5),
> +	[F_IN_INPUT]	= REG_FIELD(VADC_DATA1, 0, 7),
> +	[F_CURR_H0_THR]	= REG_FIELD(IADC_H0_THR, 0, 7),
> +	[F_CURR_H1_THR]	= REG_FIELD(IADC_H1_THR_GEN3, 0, 7),
> +	[F_CURR_INPUT]	= REG_FIELD(IADC_DATA1, 0, 7),
> +};
> +
> +static const struct reg_field bcl_smb2370_reg_fields[] = {
> +	[F_V_MAJOR]	= REG_FIELD(REVISION2, 0, 7),
> +	[F_V_MINOR]	= REG_FIELD(REVISION1, 0, 7),
> +	[F_CTL_EN]	= REG_FIELD(EN_CTL1, 7, 7),
> +	[F_LVL0_ALARM]	= REG_FIELD(STATUS, 0, 0),
> +	[F_LVL1_ALARM]	= REG_FIELD(STATUS, 1, 1),
> +	[F_LVL2_ALARM]	= REG_FIELD(STATUS, 2, 2),
> +	[F_IN_L0_THR]	= REG_FIELD(VADC_L0_THR, 0, 7),
> +	[F_IN_L1_THR]	= REG_FIELD(VCMP_L1_THR, 0, 5),
> +	[F_IN_L2_THR]	= REG_FIELD(VCMP_L2_THR, 0, 5),
> +	[F_IN_INPUT]	= REG_FIELD(VADC_DATA1, 0, 7),
> +	[F_CURR_H0_THR]	= REG_FIELD(IADC_H0_THR, 0, 7),
> +	[F_CURR_H1_THR]	= REG_FIELD(IADC_H1_THR_GEN3, 0, 7),
> +	[F_CURR_INPUT]	= REG_FIELD(IADC_DATA1, 0, 7),
> +};

These array can be compacted by using a common array definition

> +static const struct bcl_desc pm7250b_data = {
> +	.reg_fields = bcl_pm7250b_reg_fields,
> +	.num_reg_fields = F_CURR_INPUT + 1,

Very prone to error, replace with ARRAY_SIZE(), here and all structure below

> +	.data_field_bits_size = 8,

BITS_PER_BYTE and BITS_PER_TYPE() whenever possible in this driver 
instead of litterals

> +	.thresh_field_bits_size = 7,
> +	.battery_config_field = REG_FIELD(0, 0, 0),
> +	.features = BCL_IN_MON | BCL_IN_INPUT | BCL_CURR_MON,
> +	.channel_cfg[BCL_BATT_1S][CHANNEL_IN] = {
> +		.base_mu = 2250,
> +		.max_mu = 3600,
> +		.step_mu = 25,
> +		.default_scale_nu = 194637,
> +		.thresh_type = {THRESH_TYPE_ADC, THRESH_TYPE_INDEX, THRESH_TYPE_INDEX},
> +	},
> +	.channel_cfg[BCL_BATT_1S][CHANNEL_CURR] = {
> +		.max_mu = 9918,
> +		.default_scale_nu = 305180,
> +		.thresh_type = {THRESH_TYPE_ADC, THRESH_TYPE_ADC},
> +	},
> +};
> +
> +static const struct bcl_desc pm8350c_data = {
> +	.reg_fields = bcl_pm8350c_reg_fields,
> +	.num_reg_fields = F_IN_L2_THR + 1,
> +	.data_field_bits_size = 0,
> +	.thresh_field_bits_size = 8,
> +	.battery_config_field = REG_FIELD(0, 0, 0),
> +	.features = BCL_IN_MON,
> +	.channel_cfg[BCL_BATT_1S][CHANNEL_IN] = {
> +		.base_mu = 2250,
> +		.max_mu = 3600,
> +		.step_mu = 25,
> +		.default_scale_nu = 194637,
> +		.thresh_type = {THRESH_TYPE_ADC, THRESH_TYPE_INDEX, THRESH_TYPE_INDEX},
> +	},
> +};
> +
> +static const struct bcl_desc pm7550ba_data = {
> +	.reg_fields = bcl_pm7550ba_reg_fields,
> +	.num_reg_fields = F_CURR_INPUT + 1,
> +	.data_field_bits_size = 8,
> +	.thresh_field_bits_size = 8,
> +	.battery_config_field = REG_FIELD(0, 0, 0),
> +	.features = BCL_IN_MON | BCL_IN_INPUT | BCL_CURR_MON,
> +	.channel_cfg[BCL_BATT_1S][CHANNEL_IN] = {
> +		.base_mu = 2250,
> +		.max_mu = 3600,
> +		.step_mu = 25,
> +		.default_scale_nu = 194637,
> +		.thresh_type = {THRESH_TYPE_ADC, THRESH_TYPE_INDEX, THRESH_TYPE_INDEX},
> +	},
> +	.channel_cfg[BCL_BATT_1S][CHANNEL_CURR] = {
> +		.max_mu = 11901,
> +		.default_scale_nu = 366220,
> +		.thresh_type = {THRESH_TYPE_ADC, THRESH_TYPE_ADC},
> +	},
> +};
> +
> +static const struct bcl_desc pm8550_data = {
> +	.reg_fields = bcl_pm8550_reg_fields,
> +	.num_reg_fields = F_IN_L2_THR + 1,
> +	.data_field_bits_size = 0,
> +	.thresh_field_bits_size = 6,
> +	.battery_config_field = REG_FIELD(0, 0, 0),
> +	.features = BCL_IN_MON,
> +	.channel_cfg[BCL_BATT_1S][CHANNEL_IN] = {
> +		.base_mu = 2250,
> +		.max_mu = 3600,
> +		.step_mu = 25,
> +		.thresh_type = {THRESH_TYPE_INDEX, THRESH_TYPE_INDEX, THRESH_TYPE_INDEX},
> +	},
> +};
> +
> +static const struct bcl_desc pmih0108_data = {
> +	.reg_fields = bcl_pmih0108_reg_fields,
> +	.num_reg_fields = F_CURR_INPUT + 1,
> +	.data_field_bits_size = 16,
> +	.thresh_field_bits_size = 8,
> +	.battery_config_field = REG_FIELD(0, 0, 0),
> +	.features = BCL_IN_MON | BCL_IN_INPUT | BCL_CURR_MON,
> +	.channel_cfg[BCL_BATT_1S][CHANNEL_IN] = {
> +		.base_mu = 2250,
> +		.max_mu = 3600,
> +		.step_mu = 25,
> +		.default_scale_nu = 194637,
> +		.thresh_type = {THRESH_TYPE_ADC, THRESH_TYPE_INDEX, THRESH_TYPE_INDEX},
> +	},
> +	.channel_cfg[BCL_BATT_1S][CHANNEL_CURR] = {
> +		.max_mu = 19836,
> +		.default_scale_nu = 610370,
> +		.thresh_type = {THRESH_TYPE_ADC, THRESH_TYPE_ADC},
> +	},
> +};
> +
> +static const struct bcl_desc pmh0101_data = {
> +	.reg_fields = bcl_pmh0101_reg_fields,
> +	.num_reg_fields = F_IN_L2_THR + 1,
> +	.data_field_bits_size = 0,
> +	.thresh_field_bits_size = 7,
> +	.battery_config_field = REG_FIELD(0, 0, 0),
> +	.features = BCL_IN_MON,
> +	.channel_cfg[BCL_BATT_1S][CHANNEL_IN] = {
> +		.base_mu = 1500,
> +		.max_mu = 4000,
> +		.step_mu = 25,
> +		.thresh_type = {THRESH_TYPE_INDEX, THRESH_TYPE_INDEX, THRESH_TYPE_INDEX},
> +	},
> +};
> +
> +/* Register 0x2a50 mapping: 0 -> 2S, 1 -> 3S */
> +static const struct bcl_desc smb2360_data = {
> +	.reg_fields = bcl_smb2360_reg_fields,
> +	.num_reg_fields = F_CURR_INPUT + 1,
> +	.data_field_bits_size = 8,
> +	.thresh_field_bits_size = 8,
> +	.battery_config_field = REG_FIELD(0x2a50, 0, 1),
> +	.features = BCL_IN_MON | BCL_IN_INPUT | BCL_CURR_MON,
> +	.channel_cfg[BCL_BATT_2S][CHANNEL_IN] = {
> +		.base_mu = 4500,
> +		.max_mu = 8400,
> +		.step_mu = 50,
> +		.default_scale_nu = 432918,
> +		.thresh_type = {THRESH_TYPE_ADC, THRESH_TYPE_INDEX, THRESH_TYPE_INDEX},
> +	},
> +	.channel_cfg[BCL_BATT_2S][CHANNEL_CURR] = {
> +		.max_mu = 17575,
> +		.default_scale_nu = 540679,
> +		.thresh_type = {THRESH_TYPE_ADC, THRESH_TYPE_ADC},
> +	},
> +	.channel_cfg[BCL_BATT_3S][CHANNEL_IN] = {
> +		.base_mu = 6750,
> +		.max_mu = 12600,
> +		.step_mu = 75,
> +		.default_scale_nu = 648790,
> +		.thresh_type = {THRESH_TYPE_ADC, THRESH_TYPE_INDEX, THRESH_TYPE_INDEX},
> +	},
> +	.channel_cfg[BCL_BATT_3S][CHANNEL_CURR] = {
> +		.max_mu = 17575,
> +		.default_scale_nu = 540679,
> +		.thresh_type = {THRESH_TYPE_ADC, THRESH_TYPE_ADC},
> +	},
> +};
> +
> +static const struct bcl_desc smb2370_data = {
> +	.reg_fields = bcl_smb2370_reg_fields,
> +	.num_reg_fields = F_CURR_INPUT + 1,
> +	.data_field_bits_size = 16,
> +	.thresh_field_bits_size = 8,
> +	.battery_config_field = REG_FIELD(0x2a50, 0, 1),
> +	.features = BCL_IN_MON | BCL_IN_INPUT | BCL_CURR_MON,
> +	.channel_cfg[BCL_BATT_2S][CHANNEL_IN] = {
> +		.base_mu = 4500,
> +		.max_mu = 8400,
> +		.step_mu = 50,
> +		.default_scale_nu = 432918,
> +		.thresh_type = {THRESH_TYPE_ADC, THRESH_TYPE_INDEX, THRESH_TYPE_INDEX},
> +	},
> +	.channel_cfg[BCL_BATT_2S][CHANNEL_CURR] = {
> +		.max_mu = 46852,
> +		.default_scale_nu = 1441603,
> +		.thresh_type = {THRESH_TYPE_ADC, THRESH_TYPE_ADC},
> +	},
> +	.channel_cfg[BCL_BATT_3S][CHANNEL_IN] = {
> +		.base_mu = 6750,
> +		.max_mu = 12600,
> +		.step_mu = 75,
> +		.default_scale_nu = 648790,
> +		.thresh_type = {THRESH_TYPE_ADC, THRESH_TYPE_INDEX, THRESH_TYPE_INDEX},
> +	},
> +	.channel_cfg[BCL_BATT_3S][CHANNEL_CURR] = {
> +		.max_mu = 46852,
> +		.default_scale_nu = 1441603,
> +		.thresh_type = {THRESH_TYPE_ADC, THRESH_TYPE_ADC},
> +	},
> +};
> +
> +/**
> + * bcl_convert_raw_to_milliunit - Convert raw value to milli unit
> + * @bcl: BCL device structure
> + * @raw_val: Raw ADC value from hardware (signed for current, unsigned for voltage)
> + * @type: type of the channel, in or curr
> + * @field_width: bits size for data or threshold field
> + *
> + * Return: value in milli unit
> + */
> +static int bcl_convert_raw_to_milliunit(const struct bcl_device *bcl,
> +					s32 raw_val,
> +					enum bcl_channel type,
> +					u8 field_width)
> +{
> +	const struct bcl_desc *desc = bcl->desc;
> +	u32 def_scale = desc->channel_cfg[bcl->batt_config][type].default_scale_nu;
> +	u64 scaling_factor = (field_width > 8) ? def_scale : ((u64)def_scale << field_width);

This initialization can be simplified with:

	u64 scaling_factor = def_scale;

	if (field_width <= 8)
		scaling_factor <<= field_width;

And then factored out to be shared with bcl_convert_milliunit_to_raw()


> +	if (WARN_ON(!scaling_factor))
> +		return 0;
> +
> +	return DIV_S64_ROUND_CLOSEST((s64)raw_val * scaling_factor, 1000000);

These literals are unclear, using units.h with (NANO / MILLI) should be 
self-explanatory

> +}
> +
> +/**
> + * bcl_convert_milliunit_to_raw - Convert milli unit to raw value
> + * @bcl: BCL device structure
> + * @mval: threshold value in milli unit
> + * @type: type of the channel, in or curr
> + * @field_width: bits size for data or threshold field
> + *
> + * Return: Raw ADC value for hardware
> + */
> +static unsigned int bcl_convert_milliunit_to_raw(const struct bcl_device *bcl,
> +						 int mval,
> +						 enum bcl_channel type,
> +						 u8 field_width)
> +{
> +	const struct bcl_desc *desc = bcl->desc;
> +	u32 def_scale = desc->channel_cfg[bcl->batt_config][type].default_scale_nu;
> +	u64 scaling_factor = (field_width > 8) ? def_scale : ((u64)def_scale << field_width);
> +
> +	if (WARN_ON(!scaling_factor))
> +		return 0;
> +
> +	return DIV_ROUND_CLOSEST_ULL((u64)mval * 1000000, scaling_factor);

Same comments as bcl_convert_raw_to_milliunit()

> +}
> +
> +/**
> + * bcl_convert_milliunit_to_index - Convert milliunit to in or curr index
> + * @bcl: BCL device structure
> + * @val: in or curr value in milli unit
> + * @type: type of the channel, in or curr
> + *
> + * Converts a value in milli unit to an index for BCL that use indexed thresholds.
> + *
> + * Return: Index value
> + */
> +static unsigned int bcl_convert_milliunit_to_index(const struct bcl_device *bcl,
> +						   int val,
> +						   enum bcl_channel type)
> +{
> +	const struct bcl_desc *desc = bcl->desc;
> +	const struct bcl_channel_cfg *cfg = &desc->channel_cfg[bcl->batt_config][type];
> +	u64 diff = (u64)val - cfg->base_mu;
> +
> +	return DIV_ROUND_CLOSEST_ULL(diff, cfg->step_mu);
> +}
> +
> +/**
> + * bcl_convert_index_to_milliunit - Convert in or curr index to milli unit
> + * @bcl: BCL device structure
> + * @val: index value
> + * @type: type of the channel, in or curr
> + *
> + * Converts an index value to milli unit for BCL that use indexed thresholds.
> + *
> + * Return: Value in millivolts or milliamps
> + */
> +static unsigned int bcl_convert_index_to_milliunit(const struct bcl_device *bcl,
> +						   int val,
> +						   enum bcl_channel type)
> +{
> +	const struct bcl_desc *desc = bcl->desc;
> +	const struct bcl_channel_cfg *cfg = &desc->channel_cfg[bcl->batt_config][type];
> +
> +	return cfg->base_mu + val * cfg->step_mu;
> +}
> +
> +static int bcl_validate_threshold_fits(const struct bcl_device *bcl,
> +				       const struct reg_field *reg_field,
> +				       u32 raw_val,
> +				       long thresh,
> +				       const char *unit)
> +{
> +	unsigned int field_width;
> +	unsigned int field_mask;
> +
> +	if (WARN_ON(reg_field->msb < reg_field->lsb))
> +		return -EINVAL;
> +
> +	field_width = reg_field->msb - reg_field->lsb + 1;
> +	field_mask = GENMASK(field_width - 1, 0);
> +
> +	if (raw_val > field_mask) {
> +		dev_err(bcl->dev,
> +			"Threshold value %ld %s (raw: %u) exceeds field capacity (max: %u)\n",
> +			thresh, unit, raw_val, field_mask);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int bcl_thresh_write(struct bcl_device *bcl, long value, enum bcl_limit_alarm lvl,
> +			    enum bcl_channel channel)
> +{
> +	const struct bcl_desc *desc = bcl->desc;
> +	const struct bcl_channel_cfg *cfg = &desc->channel_cfg[bcl->batt_config][channel];
> +	enum bcl_fields base_field = channel == CHANNEL_IN ? F_IN_L0_THR : F_CURR_H0_THR;
> +	struct regmap_field *field;
> +	long thresh = clamp_val(value, cfg->base_mu, cfg->max_mu);
> +	u32 raw_val;
> +	int ret;
> +
> +	if (WARN_ON(channel == CHANNEL_CURR && lvl >= BCL_LIMIT_ALARM_LVL2))
> +		return -EINVAL;
> +
> +	field = bcl->fields[base_field + lvl];
> +
> +	if (cfg->thresh_type[lvl] == THRESH_TYPE_ADC)
> +		raw_val = bcl_convert_milliunit_to_raw(bcl, thresh, channel,
> +						       desc->thresh_field_bits_size);
> +	else
> +		raw_val = bcl_convert_milliunit_to_index(bcl, thresh, channel);
> +
> +	ret = bcl_validate_threshold_fits(bcl, &desc->reg_fields[base_field + lvl],
> +					  raw_val, thresh, channel == CHANNEL_IN ? "mV" : "mA");
> +	if (ret)
> +		return ret;
> +
> +	return regmap_field_write(field, raw_val);
> +}
> +
> +static int bcl_thresh_read(struct bcl_device *bcl, enum bcl_limit_alarm lvl,
> +			   enum bcl_channel channel, long *out)
> +{
> +	const struct bcl_desc *desc = bcl->desc;
> +	const struct bcl_channel_cfg *cfg = &desc->channel_cfg[bcl->batt_config][channel];
> +	enum bcl_fields base_field = channel == CHANNEL_IN ? F_IN_L0_THR : F_CURR_H0_THR;
> +	u32 raw_val = 0;
> +	int ret;
> +
> +	if (WARN_ON(channel == CHANNEL_CURR && lvl >= BCL_LIMIT_ALARM_LVL2))
> +		return -EINVAL;
> +
> +	ret = regmap_field_read(bcl->fields[base_field + lvl], &raw_val);
> +	if (ret)
> +		return ret;
> +
> +	if (cfg->thresh_type[lvl] == THRESH_TYPE_ADC)
> +		*out = bcl_convert_raw_to_milliunit(bcl, raw_val, channel,
> +						    desc->thresh_field_bits_size);
> +	else
> +		*out = bcl_convert_index_to_milliunit(bcl, raw_val, channel);
> +
> +	return 0;
> +}
> +
> +static int bcl_curr_input_read(struct bcl_device *bcl, long *out)
> +{
> +	int ret;
> +	u32 raw_val = 0;
> +	s32 signed_val;
> +	const struct bcl_desc *desc = bcl->desc;
> +
> +	/* Return cached value if read too soon after last update */
> +	if (bcl->last_curr_updated &&
> +	    time_before(jiffies, bcl->last_curr_updated + HZ)) {
> +		*out = bcl->last_curr_input;
> +		return 0;
> +	}
> +
> +	if (desc->data_field_bits_size == 16) {
> +		u8 buf[2];
> +		unsigned int reg = bcl->base + desc->reg_fields[F_CURR_INPUT].reg;
> +
> +		/*
> +		 * Use a single bulk read for the LSB/MSB pair so the
> +		 * hardware returns both bytes from one bus transaction,
> +		 * avoiding a torn read if the ADC updates in between.
> +		 */
> +		ret = regmap_bulk_read(bcl->regmap, reg, buf, sizeof(buf));
> +		if (ret)
> +			return ret;
> +		raw_val = buf[0] | FIELD_PREP(GENMASK(15, 8), buf[1]);
> +	} else {
> +		ret = regmap_field_read(bcl->fields[F_CURR_INPUT], &raw_val);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/*
> +	 * Current ADC reading is in 2's complement form.
> +	 * Sign extend the value based on data field bit size.
> +	 */
> +	signed_val = sign_extend32(raw_val, desc->data_field_bits_size - 1);
> +
> +	bcl->last_curr_input =
> +		bcl_convert_raw_to_milliunit(bcl, signed_val, CHANNEL_CURR,
> +					     desc->data_field_bits_size);
> +	bcl->last_curr_updated = jiffies;
> +
> +	*out = bcl->last_curr_input;
> +
> +	return 0;
> +}
> +
> +static int bcl_in_input_read(struct bcl_device *bcl, long *out)
> +{
> +	int ret;
> +	u32 raw_val = 0;
> +	const struct bcl_desc *desc = bcl->desc;
> +
> +	/* Return cached value if read too soon after last update */
> +	if (bcl->last_in_updated &&
> +	    time_before(jiffies, bcl->last_in_updated + HZ)) {
> +		*out = bcl->last_in_input;
> +		return 0;
> +	}
> +
> +	if (desc->data_field_bits_size == 16) {
> +		u8 buf[2];
> +		unsigned int reg = bcl->base + desc->reg_fields[F_IN_INPUT].reg;
> +
> +		/*
> +		 * Use a single bulk read for the LSB/MSB pair so the
> +		 * hardware returns both bytes from one bus transaction,
> +		 * avoiding a torn read if the ADC updates in between.
> +		 */
> +		ret = regmap_bulk_read(bcl->regmap, reg, buf, sizeof(buf));
> +		if (ret)
> +			return ret;
> +		raw_val = buf[0] | FIELD_PREP(GENMASK(15, 8), buf[1]);
> +	} else {
> +		ret = regmap_field_read(bcl->fields[F_IN_INPUT], &raw_val);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	bcl->last_in_input =
> +		bcl_convert_raw_to_milliunit(bcl, raw_val, CHANNEL_IN,
> +					     desc->data_field_bits_size);
> +	bcl->last_in_updated = jiffies;
> +
> +	*out = bcl->last_in_input;
> +
> +	return 0;
> +}
> +
> +static int bcl_read_alarm_status(struct bcl_device *bcl,
> +				 enum bcl_limit_alarm lvl, long *status)
> +{
> +	int ret;
> +	u32 raw_val = 0;
> +
> +	ret = regmap_field_read(bcl->fields[F_LVL0_ALARM + lvl], &raw_val);
> +	if (ret)
> +		return ret;
> +
> +	*status = raw_val;
> +
> +	return 0;
> +}
> +
> +static void bcl_hwmon_notify_event(struct bcl_device *bcl, enum bcl_limit_alarm alarm)
> +{
> +	if (bcl->desc->features & BCL_IN_MON)
> +		hwmon_notify_event(bcl->hwmon_dev, hwmon_in,
> +				   bcl_lvl_info[alarm].in_alarm_attr, 0);
> +
> +	if (bcl->desc->features & BCL_CURR_MON)
> +		hwmon_notify_event(bcl->hwmon_dev, hwmon_curr,
> +				   bcl_lvl_info[alarm].curr_alarm_attr, 0);
> +}
> +
> +static void bcl_alarm_enable_poll(struct work_struct *work)
> +{
> +	struct bcl_alarm_data *alarm = container_of(work, struct bcl_alarm_data,
> +							 alarm_poll_work.work);
> +	struct bcl_device *bcl = (struct bcl_device *)alarm->device;
> +	long status;
> +	int ret;
> +	bool notify = false;
> +
> +	scoped_guard(mutex, &bcl->lock)
> +		ret = bcl_read_alarm_status(bcl, alarm->type, &status);
> +
> +	/* If read failed or shutting down, reschedule */
> +	if (ret || READ_ONCE(alarm->shutting_down)) {
> +		if (!READ_ONCE(alarm->shutting_down)) {
> +			dev_err_ratelimited(bcl->dev,
> +					    "Failed to read alarm %d status: %d\n",
> +					    alarm->type, ret);
> +			schedule_delayed_work(&alarm->alarm_poll_work,
> +					      msecs_to_jiffies(BCL_ALARM_POLLING_MS));
> +		}
> +		return;
> +	}
> +
> +	/* Check if alarm cleared and IRQ needs re-enabling */
> +	scoped_guard(mutex, &alarm->a_lock) {
> +		if (alarm->shutting_down)
> +			return;
> +
> +		if (!status && !alarm->irq_enabled) {
> +			alarm->irq_enabled = true;
> +			enable_irq(alarm->irq);

This assumes the polling is not running after the interrupt was not 
enabled. If one of these two conditions is not fulfilled, then 
notify=true is never called, consequently the following block is never 
accessed.

That's a particulary tricky bug and without the help of a LLM I would 
not have spotted it. It seems to be the irq <-> poll episodes handling 
should be redesigned to have less prone to errors conditions like these.

> +
> +			if (!alarm->irq_wake_enabled && !enable_irq_wake(alarm->irq))
> +				alarm->irq_wake_enabled = true;
> +
> +			notify = true;
> +		}
> +	}
> +
> +	if (notify) {
> +		/* Reassertion racing enable_irq() is dropped by the PMIC on unmask; re-check. */
> +		scoped_guard(mutex, &bcl->lock)
> +			ret = bcl_read_alarm_status(bcl, alarm->type, &status);
> +
> +		if (ret || status) {
> +			if (!READ_ONCE(alarm->shutting_down))
> +				schedule_delayed_work(&alarm->alarm_poll_work,
> +						      msecs_to_jiffies(BCL_ALARM_POLLING_MS));
> +			return;
> +		}
> +
> +		/* Notify outside a_lock: sysfs_notify()/kobject_uevent_env() may sleep */
> +		bcl_hwmon_notify_event(bcl, alarm->type);
> +		return;
> +	}
> +
> +	/* Alarm still active, reschedule polling */
> +	if (!READ_ONCE(alarm->shutting_down))
> +		schedule_delayed_work(&alarm->alarm_poll_work,
> +				      msecs_to_jiffies(BCL_ALARM_POLLING_MS));
> +}
> +
> +static irqreturn_t bcl_handle_alarm(int irq, void *data)
> +{
> +	struct bcl_alarm_data *alarm = data;
> +	struct bcl_device *bcl = (struct bcl_device *)alarm->device;
> +	long status;
> +	int ret;
> +	bool notify = false;
> +
> +	if (READ_ONCE(alarm->shutting_down))
> +		return IRQ_HANDLED;
> +
> +	scoped_guard(mutex, &bcl->lock)
> +		ret = bcl_read_alarm_status(bcl, alarm->type, &status);
> +
> +	if (ret || !status)
> +		return IRQ_HANDLED;
> +
> +	/* Dedupe against bcl_alarm_enable_poll(): only the call that flips
> +	 * irq_enabled owns this transition and gets to notify.
> +	 */
> +	scoped_guard(mutex, &alarm->a_lock) {
> +		if (alarm->shutting_down)
> +			return IRQ_HANDLED;
> +
> +		if (alarm->irq_enabled) {
> +			alarm->irq_enabled = false;
> +			disable_irq_nosync(alarm->irq);
> +			notify = true;
> +		}
> +
> +		if (alarm->irq_wake_enabled) {
> +			disable_irq_wake(alarm->irq);
> +			alarm->irq_wake_enabled = false;
> +		}
> +	}
> +
> +	/* Notify outside a_lock: sysfs_notify()/kobject_uevent_env() may sleep */
> +	if (notify)
> +		bcl_hwmon_notify_event(bcl, alarm->type);
> +
> +	if (!READ_ONCE(alarm->shutting_down))
> +		schedule_delayed_work(&alarm->alarm_poll_work,
> +				      msecs_to_jiffies(BCL_ALARM_POLLING_MS));
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static umode_t bcl_hwmon_is_visible(const void *data,
> +				    enum hwmon_sensor_types type,
> +				    u32 attr, int channel)
> +{
> +	const struct bcl_device *bcl = data;
> +
> +	switch (type) {
> +	case hwmon_in:
> +		if (!(bcl->desc->features & BCL_IN_MON))
> +			return 0;
> +
> +		switch (attr) {
> +		case hwmon_in_input:
> +			return bcl->desc->features & BCL_IN_INPUT ? 0444 : 0;
> +		case hwmon_in_min_alarm:
> +		case hwmon_in_lcrit_alarm:
> +		case hwmon_in_lemergency_alarm:
> +			return 0444;
> +		case hwmon_in_min:
> +		case hwmon_in_lcrit:
> +		case hwmon_in_lemergency:
> +			return 0644;
> +		default:
> +			return 0;
> +		}
> +	case hwmon_curr:
> +		if (!(bcl->desc->features & BCL_CURR_MON))
> +			return 0;
> +
> +		switch (attr) {
> +		case hwmon_curr_input:
> +		case hwmon_curr_max_alarm:
> +		case hwmon_curr_crit_alarm:
> +		case hwmon_curr_emergency_alarm:
> +			return 0444;
> +		case hwmon_curr_max:
> +		case hwmon_curr_crit:
> +			return 0644;
> +		default:
> +			return 0;
> +		}
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int bcl_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
> +			   u32 attr, int channel, long val)
> +{
> +	struct bcl_device *bcl = dev_get_drvdata(dev);
> +
> +	guard(mutex)(&bcl->lock);
> +
> +	switch (type) {
> +	case hwmon_in:
> +		switch (attr) {
> +		case hwmon_in_min:
> +		case hwmon_in_lcrit:
> +		case hwmon_in_lemergency:
> +			return bcl_thresh_write(bcl, val, in_attr_to_lvl_map[attr], CHANNEL_IN);
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +	case hwmon_curr:
> +		switch (attr) {
> +		case hwmon_curr_max:
> +		case hwmon_curr_crit:
> +			return bcl_thresh_write(bcl, val, curr_attr_to_lvl_map[attr], CHANNEL_CURR);
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int bcl_in_read(struct bcl_device *bcl, u32 attr, long *value)
> +{
> +	guard(mutex)(&bcl->lock);
> +
> +	switch (attr) {
> +	case hwmon_in_input:
> +		return bcl_in_input_read(bcl, value);
> +	case hwmon_in_min:
> +	case hwmon_in_lcrit:
> +	case hwmon_in_lemergency:
> +		return bcl_thresh_read(bcl, in_attr_to_lvl_map[attr], CHANNEL_IN, value);
> +	case hwmon_in_min_alarm:
> +	case hwmon_in_lcrit_alarm:
> +	case hwmon_in_lemergency_alarm:
> +		return bcl_read_alarm_status(bcl, in_attr_to_lvl_map[attr], value);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int bcl_curr_read(struct bcl_device *bcl, u32 attr, long *value)
> +{
> +	guard(mutex)(&bcl->lock);
> +
> +	switch (attr) {
> +	case hwmon_curr_input:
> +		return bcl_curr_input_read(bcl, value);
> +	case hwmon_curr_max:
> +	case hwmon_curr_crit:
> +		return bcl_thresh_read(bcl, curr_attr_to_lvl_map[attr], CHANNEL_CURR, value);
> +	case hwmon_curr_max_alarm:
> +	case hwmon_curr_crit_alarm:
> +	case hwmon_curr_emergency_alarm:
> +		return bcl_read_alarm_status(bcl, curr_attr_to_lvl_map[attr], value);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int bcl_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> +			  u32 attr, int channel, long *value)
> +{
> +	struct bcl_device *bcl = dev_get_drvdata(dev);
> +
> +	switch (type) {
> +	case hwmon_in:
> +		return bcl_in_read(bcl, attr, value);
> +	case hwmon_curr:
> +		return bcl_curr_read(bcl, attr, value);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static const struct hwmon_ops bcl_hwmon_ops = {
> +	.is_visible	= bcl_hwmon_is_visible,
> +	.read		= bcl_hwmon_read,
> +	.write		= bcl_hwmon_write,
> +};
> +
> +static const struct hwmon_channel_info * const bcl_hwmon_info[] = {
> +	HWMON_CHANNEL_INFO(in,
> +			   HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_LCRIT |
> +			   HWMON_I_LEMERGENCY |
> +			   HWMON_I_MIN_ALARM | HWMON_I_LCRIT_ALARM |
> +			   HWMON_I_LEMERGENCY_ALARM),
> +	HWMON_CHANNEL_INFO(curr,
> +			   HWMON_C_INPUT | HWMON_C_MAX | HWMON_C_CRIT |
> +			   HWMON_C_MAX_ALARM | HWMON_C_CRIT_ALARM |
> +			   HWMON_C_EMERGENCY_ALARM),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info bcl_chip_info = {
> +	.ops = &bcl_hwmon_ops,
> +	.info = bcl_hwmon_info,
> +};
> +
> +static int bcl_detect_battery_config(struct bcl_device *bcl)
> +{
> +	u32 reg_val = 0;
> +	int ret;
> +
> +	ret = regmap_field_read(bcl->batt_config_regfield, &reg_val);
> +	if (ret) {
> +		dev_err(bcl->dev, "Failed to read battery config register: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/*
> +	 * Map register value to battery configuration.
> +	 * As per hardware documentation:
> +	 * 0 -> 2S, 1 -> 3S, 2 -> 4S (unsupported)
> +	 */
> +	switch (reg_val) {
> +	case 0:
> +		bcl->batt_config = BCL_BATT_2S;
> +		return 0;
> +	case 1:
> +		bcl->batt_config = BCL_BATT_3S;
> +		return 0;
> +	default:
> +		dev_err(bcl->dev, "Unsupported battery configuration: 0x%x\n",
> +			reg_val);
> +		return -EINVAL;
> +	}
> +}
> +
> +static int bcl_update_scaling_factors(struct bcl_device *bcl)
> +{
> +	const struct bcl_desc *desc = bcl->desc;
> +	int ret;
> +
> +	/* Check if battery detection is supported */
> +	if (desc->battery_config_field.reg == 0) {
> +		/* No battery detection - use BCL_BATT_1S */
> +		bcl->batt_config = BCL_BATT_1S;
> +		dev_dbg(bcl->dev, "Using default 1S battery configuration\n");
> +		return 0;
> +	}
> +
> +	bcl->batt_config_regfield = devm_regmap_field_alloc(bcl->dev,
> +							    bcl->regmap,
> +							    desc->battery_config_field);
> +	if (IS_ERR(bcl->batt_config_regfield)) {
> +		dev_err(bcl->dev, "Failed to allocate battery config regmap field\n");
> +		return PTR_ERR(bcl->batt_config_regfield);
> +	}
> +
> +	ret = bcl_detect_battery_config(bcl);
> +	if (ret < 0)
> +		return ret;
> +
> +	dev_dbg(bcl->dev,
> +		"%dS battery: BASE=%u mV,MAX=%u mV,STEP=%u mV,V_SCALE=%u nV, I_SCALE=%u nA\n",
> +		bcl->batt_config + 1,
> +		desc->channel_cfg[bcl->batt_config][CHANNEL_IN].base_mu,
> +		desc->channel_cfg[bcl->batt_config][CHANNEL_IN].max_mu,
> +		desc->channel_cfg[bcl->batt_config][CHANNEL_IN].step_mu,
> +		desc->channel_cfg[bcl->batt_config][CHANNEL_IN].default_scale_nu,
> +		desc->channel_cfg[bcl->batt_config][CHANNEL_CURR].default_scale_nu);
> +
> +	return 0;
> +}
> +
> +static void bcl_alarm_cleanup_action(void *data)
> +{
> +	struct bcl_alarm_data *alarm = data;
> +
> +	/*
> +	 * Set shutting_down and clear irq_enabled in the same critical
> +	 * section so bcl_handle_alarm() cannot race a disable with its
> +	 * shutting_down check.
> +	 */
> +	scoped_guard(mutex, &alarm->a_lock) {
> +		WRITE_ONCE(alarm->shutting_down, true);
> +		alarm->irq_enabled = false;
> +	}
> +
> +	/*
> +	 * Wait (outside a_lock, to avoid deadlocking against a handler
> +	 * blocked on it) for any in-flight handler to return before
> +	 * cancelling poll work, so a late schedule_delayed_work() from a
> +	 * handler that raced the shutting_down check above can't outlive us.
> +	 */
> +	disable_irq(alarm->irq);
> +
> +	cancel_delayed_work_sync(&alarm->alarm_poll_work);
> +
> +	/*
> +	 * Only disable the wake source after the poll work has been
> +	 * synchronously drained above. Doing this earlier (e.g. in a
> +	 * separate, earlier-unwinding devm action) would leave a window
> +	 * where bcl_alarm_enable_poll() could still observe
> +	 * irq_wake_enabled == false and call enable_irq_wake() again,
> +	 * leaking the wake source enabled with nothing left to disable it.
> +	 */
> +	guard(mutex)(&alarm->a_lock);
> +	if (alarm->irq_wake_enabled) {
> +		disable_irq_wake(alarm->irq);
> +		alarm->irq_wake_enabled = false;
> +	}
> +}
> +
> +static int bcl_alarm_irq_init(struct platform_device *pdev,
> +			      struct bcl_device *bcl)
> +{
> +	int ret, irq_num, i;
> +	struct bcl_alarm_data *alarm;
> +
> +	for (i = 0; i < ARRAY_SIZE(bcl->bcl_alarms); i++) {
> +		alarm = &bcl->bcl_alarms[i];
> +		alarm->type = i;
> +		alarm->device = bcl;
> +		ret = devm_mutex_init(bcl->dev, &alarm->a_lock);
> +		if (ret)
> +			return ret;
> +
> +		/* Initialize work before IRQ request */
> +		INIT_DELAYED_WORK(&alarm->alarm_poll_work, bcl_alarm_enable_poll);
> +
> +		irq_num = platform_get_irq_byname(pdev, bcl_lvl_info[i].irq_name);
> +		if (irq_num < 0)
> +			return irq_num;
> +
> +		alarm->irq = irq_num;
> +		alarm->irq_enabled = true;
> +
> +		ret = devm_request_threaded_irq(&pdev->dev, irq_num, NULL,
> +						bcl_handle_alarm, IRQF_ONESHOT,
> +						bcl_lvl_info[i].irq_name, alarm);
> +		if (ret) {
> +			alarm->irq_enabled = false;
> +			return ret;
> +		}
> +
> +		/*
> +		 * Register the cleanup action right after the IRQ is
> +		 * requested, before any other fallible step in this loop, so
> +		 * a delayed work scheduled by the IRQ handler is guaranteed
> +		 * to be canceled on teardown. Keeping it after the IRQ
> +		 * request also preserves safe devm LIFO teardown order.
> +		 */
> +		ret = devm_add_action_or_reset(&pdev->dev, bcl_alarm_cleanup_action,
> +					       alarm);
> +		if (ret)
> +			return ret;
> +
> +		if (!enable_irq_wake(irq_num))
> +			alarm->irq_wake_enabled = true;

This can race with bcl_handle_alarm() because the interrrupt is enabled 
automatically with devm_request_threaded_irq()

> +	}
> +
> +	return 0;
> +}
> +
> +static int bcl_regmap_field_init(struct device *dev, struct bcl_device *bcl,
> +				 const struct bcl_desc *data)

'data' is already in the bcl structure, no need to pass it to this function

> +{
> +	struct reg_field fields[F_MAX_FIELDS];
> +	int i;
> +
> +	/*
> +	 * Note: We use a mutable local copy of struct reg_field (not const)
> +	 * because we need to modify the .reg field to add the BCL base offset.
> +	 */
> +	for (i = 0; i < data->num_reg_fields; i++) {
> +		fields[i] = data->reg_fields[i];
> +		fields[i].reg += bcl->base;
> +	}
> +
> +	return devm_regmap_field_bulk_alloc(dev, bcl->regmap, bcl->fields,
> +					    fields, data->num_reg_fields);
> +}
> +
> +static int bcl_probe(struct platform_device *pdev)
> +{
> +	struct bcl_device *bcl;
> +	u32 reg, major = 0, minor = 0;
> +	int ret;
> +
> +	bcl = devm_kzalloc(&pdev->dev, sizeof(*bcl), GFP_KERNEL);
> +	if (!bcl)
> +		return -ENOMEM;
> +
> +	bcl->dev = &pdev->dev;
> +	bcl->desc = device_get_match_data(&pdev->dev);
> +	if (!bcl->desc)
> +		return dev_err_probe(&pdev->dev, -EINVAL, "Failed to get device match data\n");
> +
> +	ret = devm_mutex_init(bcl->dev, &bcl->lock);
> +	if (ret)
> +		return ret;
> +
> +	bcl->regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +	if (!bcl->regmap)
> +		return dev_err_probe(&pdev->dev, -EINVAL, "Couldn't get parent's regmap\n");
> +
> +	ret = device_property_read_u32(&pdev->dev, "reg", &reg);
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to read 'reg' property\n");
> +
> +	bcl->base = reg;
> +
> +	ret = bcl_regmap_field_init(bcl->dev, bcl, bcl->desc);
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret, "Unable to allocate regmap fields\n");
> +
> +	ret = regmap_field_read(bcl->fields[F_CTL_EN], &reg);
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to read BCL enable status\n");
> +
> +	if (!reg)
> +		return dev_err_probe(&pdev->dev, -ENODEV, "BCL is not enabled by bootloader\n");
> +
> +	ret = bcl_update_scaling_factors(bcl);
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to update scaling factors\n");
> +
> +	dev_set_drvdata(&pdev->dev, bcl);
> +
> +	bcl->hwmon_name = devm_hwmon_sanitize_name(&pdev->dev,
> +						   dev_name(bcl->dev));
> +	if (IS_ERR(bcl->hwmon_name))
> +		return PTR_ERR(bcl->hwmon_name);
> +
> +	bcl->hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev,
> +							      bcl->hwmon_name,
> +							      bcl,
> +							      &bcl_chip_info,
> +							      NULL);
> +	if (IS_ERR(bcl->hwmon_dev))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(bcl->hwmon_dev),
> +				     "Failed to register hwmon device\n");
> +
> +	ret = bcl_alarm_irq_init(pdev, bcl);
> +	if (ret < 0)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to initialize alarm IRQs\n");
> +
> +	regmap_field_read(bcl->fields[F_V_MAJOR], &major);
> +	regmap_field_read(bcl->fields[F_V_MINOR], &minor);
> +
> +	dev_dbg(&pdev->dev, "BCL hwmon device with version: %u.%u registered\n",

Nitpicking but if the reads fail, the version will be '0.0'

> +		major, minor);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id bcl_match[] = {
> +	{
> +		.compatible = "qcom,pm7250b-bcl",
> +		.data = &pm7250b_data,
> +	}, {
> +		.compatible = "qcom,pm7550ba-bcl",
> +		.data = &pm7550ba_data,
> +	}, {
> +		.compatible = "qcom,pm8350c-bcl",
> +		.data = &pm8350c_data,
> +	}, {
> +		.compatible = "qcom,pm8550-bcl",
> +		.data = &pm8550_data,
> +	}, {
> +		.compatible = "qcom,pmh0101-bcl",
> +		.data = &pmh0101_data,
> +	}, {
> +		.compatible = "qcom,pmih0108-bcl",
> +		.data = &pmih0108_data,
> +	}, {
> +		.compatible = "qcom,smb2360-bcl",
> +		.data = &smb2360_data,
> +	}, {
> +		.compatible = "qcom,smb2370-bcl",
> +		.data = &smb2370_data,
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, bcl_match);
> +
> +static struct platform_driver bcl_driver = {
> +	.probe	= bcl_probe,
> +	.driver	= {
> +		.name		= "qcom-bcl-hwmon",
> +		.of_match_table	= bcl_match,
> +	},
> +};
> +
> +module_platform_driver(bcl_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm SPMI BCL HWMON driver");
> +MODULE_LICENSE("GPL");
> 

