Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40333C5538
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Mar 2026 14:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774018385; cv=none; b=U95fyGB/eHAmYUhp1dMIti35BqC47RujRtzAOsPpEb/B1cevmPXAI28skKQbIo8sWK/gRX+ZFjPeRGOn4sv4shPekURSD49YukBsAVF6vXLTMOPzkvT5DDFEm4BTT8/+hCFnSAz0VELYf8oriZo9zqNT7sMvjLM+eYSAQkyl3tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774018385; c=relaxed/simple;
	bh=vFAcD5C+XeoxSQpchGTgsbfm6juZz8feiEpQjrhksW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JaNSvE/THtCIvs/y3+sKs9UEgKCuQ2Hjbecasnq7aBzL+ZjHe9RN5ayuvUI9m7cG4OUuWCflKDj1OsNVErlKlzOF8ImodIrCRxwRJAUOH1+4pAAJH0DThfqLQVVaCIgtKKc5CPbpJJwLe0DlbB7t7EiSEFQEeeUAOIxj5ofL0u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pceoFP11; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jGXN2s1g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pceoFP11";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jGXN2s1g"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62KBsOmj3875956
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Mar 2026 14:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=N6wl26AmXeAuagoApTF2cJD6
	McsibyecrhcY0XZq3sM=; b=pceoFP11QzKimuweu7eMPiHTY2H5aXVTSiDNB/dE
	VmfifT8cci85d+1XoGKmnYvb6FcfMfHROAKMIBkk3Cl5RimpCuy5l16atLcfDOoN
	rmeqi7Fecxtem0BBPz/t44QrpsS/bNh74bCAoHS2Co2qn5ShAnRj+NqIAFDPkNB/
	ldExqEPvtbEUSbMwU89dQPRWpwCmsdFEuaKO+xnHHvLT/o8DePko+K/Bo3AS9lI/
	UKBLQgjdzrBpi7/0+nh0NmpdMXjOpf2i2vJIWnXTG9hz0AOmHAhKB69SqCYxp6ca
	t7rI4/yjxTMaRf4oQu/85OQloWxaZjtncg48AFoc8bxO5g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d15s08ef2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Mar 2026 14:53:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5091327215dso90240451cf.1
        for <linux-hwmon@vger.kernel.org>; Fri, 20 Mar 2026 07:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774018381; x=1774623181; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N6wl26AmXeAuagoApTF2cJD6McsibyecrhcY0XZq3sM=;
        b=jGXN2s1gw4ajCoCJqdjNbXV3UoSIPX0qxDjgTKA4YnIUYNAer9xnjwV/fu5smEoHEG
         pMkvlp0h2u65csXvQdkCtfQHjLRzEvbKCq81TRMwRfSZ8N0e9oxYR2c1D/AMhO/Ef5Cp
         uofdlT/t1WK0Kl+XQ+IRLZIThED/DnGD2J9Li+WEgYFn7isEgtmDdJWAFeMI23v7pS2Y
         0cNEU0y2V8b5sPxZv4pBW2j48jrwRYU98oGpgDWzeIDqBG0pxP7f3D9VJvniwYKWzqXg
         08wPMKriMbw4YszcBi9D8LW1i+/+CAg8qdSsN2J41IOo/HEkA0tLTpwoQPjJR/urYcEc
         TvHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774018381; x=1774623181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N6wl26AmXeAuagoApTF2cJD6McsibyecrhcY0XZq3sM=;
        b=Wp/YaxGOgIbVggqhVqJX5iKB7eGYgN+ZHYBwQaSRP5BvAstXMu1yRy3KW8Su7szd3r
         H3aDFsSO5tDkyE27yWRdTohk/5ii+7ZuSW4dvMhZ3bZtHfIfOZ+SSKd5kyz84Kj7O7cP
         +yNoA0BnHFcdlI0Y04ESXb4fj0JsnL1RhNPTgf8CwgJ6naNfE4vVjzGz/OXB9EsXobpr
         Gk5Vmek5ZHwvUOm6k+wy/y3yAl5SIxjD0zjjgJ6EYnOrIRC9KqVf+UUYImWBqsisc+yI
         D4j5PJvpdaT7ylcIrQF7PLMvskMFXDVMkCe9fZRpBWLvjlA8ZPSrTSny49CI4hQLlHAP
         IaUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtElwxlVoYj9EWLZ3tfun7AoibwBZsM3cgPwQS/Eg1RrB5qfmnOQwVMwJ4Z1HzdOYp/4GkKpHcECZuyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZWnSuwAKJX6FFbKtlWUwjG4n1KAcTXr1jqPOI6hbBJHxbLaRV
	2MjuLy+c0gSGQowftjDRobX1OJHIMetD8UknbB9czvVMD0CgbATTheifX/LKFzWnco9WSiP4vCU
	NXLUZmcw0b53IesHRYWwWWtAVCyPC6Lf+9voQTLWoR+sbP774jMr/x5i0oNoJdgr42Q==
X-Gm-Gg: ATEYQzyg/Xby3WJbfxTUSp2rJyfts8ZBRpJLT9qOMv4bfi82Qu/2ccgopZgCXLiFmZN
	U9o1GDDp2ukcFtk7aKehC8YWhkV8MVtTLwXfAvtBPXvbc+Lv4DTq3z38eFXmNK7oSRT1jMAeii5
	t1T2UHlhcjz3K19ZsluRJkhlNqniCyPAqzWhiz8F1/3Xu8XzGsj8WGlPyop522lPce+V1hPbzsh
	yfNVuO4ZEZMDf59wxpJf7C5lEP/2fryhod2sihHOgMmzkfj/BgmK5hsnnRYDsJhkmnPC56+ZNRB
	NaeWnBcHXA4yOG/BHjISOhe54AaffJNze1muT+OUFXvZQGOD/kM8yJGpsdidctBQw9LTsBlorct
	V1DmAC1SzXIy4QicKBscCM5YwIvRScR+cStQbaqsHrb8=
X-Received: by 2002:a05:622a:130b:b0:506:1edb:2cf8 with SMTP id d75a77b69052e-50b373ee8b7mr48840061cf.8.1774018380628;
        Fri, 20 Mar 2026 07:53:00 -0700 (PDT)
X-Received: by 2002:a05:622a:130b:b0:506:1edb:2cf8 with SMTP id d75a77b69052e-50b373ee8b7mr48839201cf.8.1774018379805;
        Fri, 20 Mar 2026 07:52:59 -0700 (PDT)
Received: from mai.linaro.org ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644ae048sm7385066f8f.1.2026.03.20.07.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 07:52:58 -0700 (PDT)
Date: Fri, 20 Mar 2026 15:52:57 +0100
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, amit.kucheria@oss.qualcomm.com,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] hwmon: Add Qualcomm PMIC BCL hardware monitor driver
Message-ID: <ab1fSWx7pqlSANph@mai.linaro.org>
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
 <20260206-qcom-bcl-hwmon-v1-2-7b426f0b77a1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206-qcom-bcl-hwmon-v1-2-7b426f0b77a1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: diR6xS3wzSD5vveBvqVHbvdcUaCqK3KM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDExOSBTYWx0ZWRfXwi4RI4/To5xd
 5TWT5oOrSiVmiU794RTfg9El9tuob+9Zz+qiV6/RsH2OYosNAjyZo/pAbgvn1WQkSo7xlvkDdZO
 5qzAOKive7pyoIi4hkRCg0LJDOxx2xu16vIPXtsHizPoTaV6AV4Fk7mS4zxkahVBV/TUecHy10K
 EWxT5orPGSFdtc2MSuslStpmQD1K7wHlPFmNT/jFqkj9Iaw+78bqjVRMNgcEijyuboGRpHe1rkU
 qS7/O9dEdHq5ene/dkLwH7FIDc63QUboHYrViyV3HzM6zjE6+tZy5s7nVeXpK2g47vMaHU0DHa+
 tIdYladuXItioPccotzCpOfxFPMDetInU/z5036znO1W0dna+/6y3ojgObrriT0yvBVcAWIUdNH
 GhZVn3OHgVW/hrrqH3vnb/UCaO5R+8uSmxqUODC4CT5Ikn71JUxF08TbcMNMMxZ/e1NAoOJ2zOD
 48EGEjc0xmu2YynaLAw==
X-Proofpoint-GUID: diR6xS3wzSD5vveBvqVHbvdcUaCqK3KM
X-Authority-Analysis: v=2.4 cv=KORXzVFo c=1 sm=1 tr=0 ts=69bd5f4d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=ARs1_2G646RLOo2N7esA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1011
 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200119

Hi Manaf,

On Fri, Feb 06, 2026 at 02:44:06AM +0530, Manaf Meethalavalappu Pallikunhi wrote:
> Add support for Qualcomm PMIC Battery Current Limiting (BCL) hardware
> monitor driver. The BCL peripheral is present in Qualcomm PMICs and
> provides real-time monitoring and protection against battery
> overcurrent and under voltage conditions.
> 
> The driver monitors:
> - Battery voltage with configurable low voltage thresholds
> - Battery current with configurable high current thresholds
> - Two limit alarm interrupts (max/min, critical)

Can you describe the behavior of the alarm ?

I assume the alarm is raised when a threshold is crossed from normal
to anormal condition leading to a hwmon event.

 * Does the BCL trigger an interrupt when going back to the normal condition ?

 * When is the alarm flag reset ?

 * Can we have a flood of events if the current / voltage is wavering
   around the thresholds ?

Overall, the driver is too big, so hard to review. It is better to
provide a simplified version with one version supported.

> The driver integrates with the Linux hwmon subsystem and provides
> standard hwmon attributes for monitoring battery conditions.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---
>  MAINTAINERS                    |   9 +
>  drivers/hwmon/Kconfig          |   9 +
>  drivers/hwmon/Makefile         |   1 +
>  drivers/hwmon/qcom-bcl-hwmon.c | 982 +++++++++++++++++++++++++++++++++++++++++
>  drivers/hwmon/qcom-bcl-hwmon.h | 311 +++++++++++++
>  5 files changed, 1312 insertions(+)

[ ... ]

> diff --git a/drivers/hwmon/qcom-bcl-hwmon.c b/drivers/hwmon/qcom-bcl-hwmon.c
> new file mode 100644
> index 000000000000..a7e3b865de5c
> --- /dev/null
> +++ b/drivers/hwmon/qcom-bcl-hwmon.c
> @@ -0,0 +1,982 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Qualcomm pmic BCL hardware driver for battery overcurrent and
> + * battery or system under voltage monitor
> + *
> + * Copyright (c) 2026, Qualcomm Innovation Center, Inc. All rights reserved.
> + */

Old copyright format

> +#include <linux/devm-helpers.h>
> +#include <linux/err.h>
> +#include <linux/hwmon.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +#include <linux/workqueue.h>
> +
> +#include "qcom-bcl-hwmon.h"
> +
> +ADD_BCL_HWMON_ALARM_MAPS(in, min, lcrit);
> +ADD_BCL_HWMON_ALARM_MAPS(curr, max, crit);
> +
> +/* Interrupt names for each alarm level */
> +static const char * const bcl_int_names[ALARM_MAX] = {
> +	[LVL0] = "bcl-max-min",
> +	[LVL1] = "bcl-critical",
> +};

IIUC there are three levels of alarms but the hwmon only has max/min
and critical. Would it make sense to do adaptative min / max ? So when
LVL0 is reached, update min / max with LVL1 value, LVL2 is critical
and does not change ?

> +static const char * const bcl_channel_label[CHANNEL_MAX] = {
> +	"BCL Voltage",
> +	"BCL Current",
> +};

s/[CHANNEL_MAX]/[]/

> +/* Common Reg Fields */
> +static const struct reg_field common_reg_fields[COMMON_FIELD_MAX] = {
> +	[F_V_MAJOR]	= REG_FIELD(REVISION2, 0, 7),
> +	[F_V_MINOR]	= REG_FIELD(REVISION1, 0, 7),
> +	[F_CTL_EN]	= REG_FIELD(EN_CTL1, 7, 7),
> +	[F_LVL0_ALARM]	= REG_FIELD(STATUS, 0, 0),
> +	[F_LVL1_ALARM]	= REG_FIELD(STATUS, 1, 1),
> +};
> +
> +/* BCL Version/Modes specific fields */
> +static const struct reg_field bcl_v1_reg_fields[] = {
> +	[F_IN_MON_EN]	= REG_FIELD(MODE_CTL1, 0, 2),
> +	[F_IN_L0_THR]	= REG_FIELD(VADC_L0_THR, 0, 7),
> +	[F_IN_L1_THR]	= REG_FIELD(VCMP_L1_THR, 0, 5),
> +	[F_IN_INPUT_EN]	= REG_FIELD(VADC_CONV_REQ, 0, 0),
> +	[F_IN_INPUT]	= REG_FIELD(VADC_DATA1, 0, 7),
> +	[F_CURR_MON_EN]	= REG_FIELD(IADC_CONV_REQ, 0, 0),
> +	[F_CURR_H0_THR]	= REG_FIELD(IADC_H0_THR, 0, 7),
> +	[F_CURR_H1_THR]	= REG_FIELD(IADC_H1_THR, 0, 7),
> +	[F_CURR_INPUT]	= REG_FIELD(IADC_DATA1, 0, 7),
> +};
> +
> +static const struct reg_field bcl_v2_reg_fields[] = {
> +	[F_IN_MON_EN]	= REG_FIELD(VCMP_CTL, 0, 1),
> +	[F_IN_L0_THR]	= REG_FIELD(VADC_L0_THR, 0, 7),
> +	[F_IN_L1_THR]	= REG_FIELD(VCMP_L1_THR, 0, 5),
> +	[F_IN_INPUT_EN]	= REG_FIELD(VADC_CONV_REQ, 0, 0),
> +	[F_IN_INPUT]	= REG_FIELD(VADC_DATA1, 0, 7),
> +	[F_CURR_MON_EN]	= REG_FIELD(IADC_CONV_REQ, 0, 0),
> +	[F_CURR_H0_THR]	= REG_FIELD(IADC_H0_THR, 0, 7),
> +	[F_CURR_H1_THR]	= REG_FIELD(IADC_H1_THR, 0, 7),
> +	[F_CURR_INPUT]	= REG_FIELD(IADC_DATA1, 0, 7),
> +};

Please begin with a simplified driver supporting one version and then
add more versions. That will help for the review process.

[ ... ]

> +/* V1 BMX and core */
> +static const struct bcl_desc pm7250b_data = {
> +	.reg_fields = bcl_v1_reg_fields,
> +	.num_reg_fields = F_MAX_FIELDS,
> +	.data_field_bits_size = 8,
> +	.thresh_field_bits_size = 7,
> +	.channel[IN] = {
> +		.base = 2250,
> +		.max = 3600,
> +		.step = 25,
> +		.default_scale_nu = 194637,
> +		.thresh_type = {ADC, INDEX},
> +	},
> +	.channel[CURR] = {
> +		.max = 10000,
> +		.default_scale_nu = 305180,
> +		.thresh_type = {ADC, ADC},
> +	},
> +};
>
> +/* V2 BMX and core */

Ditto

[ ... ]

> +/**
> + * bcl_convert_raw_to_milliunit - Convert raw value to milli unit
> + * @desc: BCL device descriptor
> + * @raw_val: Raw ADC value from hardware
> + * @type: type of the channel, in or curr
> + * @field_width: bits size for data or threshold field
> + *
> + * Return: value in milli unit
> + */
> +static unsigned int bcl_convert_raw_to_milliunit(const struct bcl_desc *desc, int raw_val,
> +					enum bcl_channel_type type, u8 field_width)
> +{
> +	u32 def_scale = desc->channel[type].default_scale_nu;
> +	u32 lsb_weight = field_width > 8 ? 1 : 1 << field_width;
> +	u32 scaling_factor = def_scale * lsb_weight;

This is confusing, can you explain ?

if 'field_width' == 7, then we do def_scale * 1^7 ?

Why ?

> +	return div_s64((s64)raw_val * scaling_factor, 1000000);

If it is milliunit why dividing by 10^6 ?

> +/**
> + * bcl_convert_milliunit_to_index - Convert milliunit to in or curr index
> + * @desc: BCL device descriptor
> + * @val: in or curr value in milli unit
> + * @type: type of the channel, in or curr
> + *
> + * Converts a value in milli unit to an index for BCL that use indexed thresholds.
> + *
> + * Return: Voltage index value
> + */
> +static unsigned int bcl_convert_milliunit_to_index(const struct bcl_desc *desc, int val,
> +					  enum bcl_channel_type type)
> +{
> +	return div_s64((s64)val - desc->channel[type].base, desc->channel[type].step);
> +}
> +
> +/**
> + * bcl_convert_index_to_milliunit - Convert in or curr index to milli unit
> + * @desc: BCL device descriptor
> + * @val: index value
> + * @type: type of the channel, in or curr
> + *
> + * Converts an index value to milli unit for BCL that use indexed thresholds.
> + *
> + * Return: Voltage value in millivolts
> + */
> +static unsigned int bcl_convert_index_to_milliunit(const struct bcl_desc *desc, int val,
> +					 enum bcl_channel_type type)
> +{
> +	return desc->channel[type].base + val * desc->channel[type].step;

To be sure, is it (A + val) * B, or, A + (val * B) ?

> +}
> +
> +static int bcl_in_thresh_write(struct bcl_device *bcl, long value, enum bcl_limit_alarm lvl)
> +{
> +	const struct bcl_desc *desc = bcl->desc;
> +	u32 raw_val;
> +
> +	int thresh = clamp_val(value, desc->channel[IN].base, desc->channel[IN].max);
> +
> +	if (desc->channel[IN].thresh_type[lvl] == ADC)
> +		raw_val = bcl_convert_milliunit_to_raw(desc, thresh, IN,
> +						       desc->thresh_field_bits_size);
> +	else
> +		raw_val = bcl_convert_milliunit_to_index(desc, thresh, IN);
> +
> +	return regmap_field_write(bcl->fields[F_IN_L0_THR + lvl], raw_val);
> +}
> +
> +static int bcl_curr_thresh_write(struct bcl_device *bcl, long value, enum bcl_limit_alarm lvl)
> +{
> +	const struct bcl_desc *desc = bcl->desc;
> +	u32 raw_val;
> +
> +	/* Clamp only to curr max */
> +	int thresh = clamp_val(value, value, desc->channel[CURR].max);
> +
> +	if (desc->channel[CURR].thresh_type[lvl] == ADC)
> +		raw_val = bcl_convert_milliunit_to_raw(desc, thresh, CURR,
> +						       desc->thresh_field_bits_size);
> +	else
> +		raw_val = bcl_convert_milliunit_to_index(desc, thresh, CURR);
> +
> +	return regmap_field_write(bcl->fields[F_CURR_H0_THR + lvl], raw_val);
> +}
> +
> +static int bcl_in_thresh_read(struct bcl_device *bcl, enum bcl_limit_alarm lvl, long *out)
> +{
> +	int ret, thresh;
> +	u32 raw_val = 0;
> +	const struct bcl_desc *desc = bcl->desc;
> +
> +	ret = bcl_read_field_value(bcl, F_IN_L0_THR + lvl, &raw_val);
> +	if (ret)
> +		return ret;
> +
> +	if (desc->channel[IN].thresh_type[lvl] == ADC)
> +		thresh = bcl_convert_raw_to_milliunit(desc, raw_val, IN,
> +						      desc->thresh_field_bits_size);
> +	else
> +		thresh = bcl_convert_index_to_milliunit(desc, raw_val, IN);
> +
> +	*out = thresh;
> +
> +	return 0;
> +}
> +
> +static int bcl_curr_thresh_read(struct bcl_device *bcl, enum bcl_limit_alarm lvl, long *out)
> +{
> +	int ret, thresh;
> +	u32 raw_val = 0;
> +	const struct bcl_desc *desc = bcl->desc;
> +
> +	ret = bcl_read_field_value(bcl, F_CURR_H0_THR + lvl, &raw_val);
> +	if (ret)
> +		return ret;
> +
> +	if (desc->channel[CURR].thresh_type[lvl] == ADC)
> +		thresh = bcl_convert_raw_to_milliunit(desc, raw_val, CURR,
> +						      desc->thresh_field_bits_size);
> +	else
> +		thresh = bcl_convert_index_to_milliunit(desc, raw_val, CURR);
> +
> +	*out = thresh;
> +
> +	return 0;
> +}
> +
> +static int bcl_curr_input_read(struct bcl_device *bcl, long *out)
> +{
> +	int ret;
> +	u32 raw_val = 0;
> +	const struct bcl_desc *desc = bcl->desc;
> +
> +	ret = bcl_read_field_value(bcl, F_CURR_INPUT, &raw_val);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * The sensor sometime can read a value 0 if there are
> +	 * consecutive reads
> +	 */

In order to prevent the userspace to read in a too high rate the
values of a hwmon, where I guess it is the reason why the value can be
0, the cached value is returned if two reads are under a minimal
jiffies based interval.

Something like:

	  if (time_before(jiffies, last_updated + HZ))
	     return bcl->last_curr_input;

If it is correct, then that could be put at the beginning of the
function instead of checking the zero value.

> +	if (raw_val != 0)
> +		bcl->last_curr_input =
> +			bcl_convert_raw_to_milliunit(desc, raw_val, CURR,
> +						     desc->data_field_bits_size);
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
> +	ret = bcl_read_field_value(bcl, F_IN_INPUT, &raw_val);
> +	if (ret)
> +		return ret;
> +
> +	if (raw_val < GENMASK(desc->data_field_bits_size - 1, 0))
> +		bcl->last_in_input =
> +			bcl_convert_raw_to_milliunit(desc, raw_val, IN,
> +						     desc->data_field_bits_size);
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
> +	ret = bcl_read_field_value(bcl, F_LVL0_ALARM + lvl, &raw_val);
> +	if (ret)
> +		return ret;
> +
> +	*status = raw_val;
> +
> +	return 0;
> +}
> +
> +static unsigned int bcl_get_version_major(const struct bcl_device *bcl)
> +{
> +	u32 raw_val = 0;
> +
> +	bcl_read_field_value(bcl, F_V_MAJOR, &raw_val);
> +
> +	return raw_val;
> +}
> +
> +static unsigned int bcl_get_version_minor(const struct bcl_device *bcl)
> +{
> +	u32 raw_val = 0;
> +
> +	bcl_read_field_value(bcl, F_V_MINOR, &raw_val);
> +
> +	return raw_val;
> +}
> +
> +static void bcl_hwmon_notify_event(struct bcl_device *bcl, enum bcl_limit_alarm alarm)
> +{
> +	if (bcl->in_mon_enabled)
> +		hwmon_notify_event(bcl->hwmon_dev, hwmon_in,
> +				in_lvl_to_attr_map[alarm], 0);
> +	if (bcl->curr_mon_enabled)
> +		hwmon_notify_event(bcl->hwmon_dev, hwmon_curr,
> +				curr_lvl_to_attr_map[alarm], 0);
> +}

What is the rate of the events we can face if they are mitigations
happening under the hood from the HW ?

> +static void bcl_alarm_enable_poll(struct work_struct *work)
> +{
> +	struct bcl_alarm_data *alarm = container_of(work, struct bcl_alarm_data,
> +							 alarm_poll_work.work);
> +	struct bcl_device *bcl = alarm->device;
> +	long status;
> +
> +	guard(mutex)(&bcl->lock);
> +
> +	if (bcl_read_alarm_status(bcl, alarm->type, &status))
> +		goto re_schedule;
> +
> +	if (!status & !alarm->irq_enabled) {
> +		bcl_enable_irq(alarm);
> +		bcl_hwmon_notify_event(bcl, alarm->type);
> +		return;
> +	}
> +
> +re_schedule:
> +	schedule_delayed_work(&alarm->alarm_poll_work,
> +				msecs_to_jiffies(BCL_ALARM_POLLING_MS));
> +}
> +
> +static irqreturn_t bcl_handle_alarm(int irq, void *data)
> +{
> +	struct bcl_alarm_data *alarm = data;
> +	struct bcl_device *bcl = alarm->device;
> +	long status;
> +
> +	guard(mutex)(&bcl->lock);
> +
> +	if (bcl_read_alarm_status(bcl, alarm->type, &status) || !status)
> +		return IRQ_HANDLED;

So it is possible to have an interrupt but not an alarm (!status) ?

> +	if (!bcl->hwmon_dev)
> +		return IRQ_HANDLED;

This should not be needed, revisit the init routine

> +
> +	bcl_hwmon_notify_event(bcl, alarm->type);
> +
> +	bcl_disable_irq(alarm);
> +	schedule_delayed_work(&alarm->alarm_poll_work,
> +			msecs_to_jiffies(BCL_ALARM_POLLING_MS));

Why ?

> +	dev_dbg(bcl->dev, "Irq:%d triggered for bcl type:%d\n",
> +			 irq, alarm->type);

Please remove, that is debug code

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
> +		if (!bcl->in_mon_enabled)
> +			return 0;
> +		switch (attr) {
> +		case hwmon_in_input:
> +			return bcl->in_input_enabled ? 0444 : 0;
> +		case hwmon_in_label:
> +		case hwmon_in_min_alarm:
> +		case hwmon_in_lcrit_alarm:
> +			return 0444;
> +		case hwmon_in_min:
> +		case hwmon_in_lcrit:
> +			return 0644;
> +		default:
> +			return 0;
> +		}
> +	case hwmon_curr:
> +		if (!bcl->curr_mon_enabled)
> +			return 0;
> +		switch (attr) {
> +		case hwmon_curr_input:
> +		case hwmon_curr_label:
> +		case hwmon_curr_max_alarm:
> +		case hwmon_curr_crit_alarm:
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

What is the benefit of the userspace to set the thresholds ? Should
they be a platform property ?

Should the thresholds be check to be in ascending order and separated
with 100mV (for IN) ?

> +{
> +	struct bcl_device *bcl = dev_get_drvdata(dev);
> +	int ret = -EOPNOTSUPP;
> +
> +	guard(mutex)(&bcl->lock);
> +
> +	switch (type) {
> +	case hwmon_in:
> +		switch (attr) {
> +		case hwmon_in_min:
> +		case hwmon_in_lcrit:
> +			ret = bcl_in_thresh_write(bcl, val, in_attr_to_lvl_map[attr]);
> +			break;
> +		default:
> +			ret = -EOPNOTSUPP;
> +		}
> +		break;
> +	case hwmon_curr:
> +		switch (attr) {
> +		case hwmon_curr_max:
> +		case hwmon_curr_crit:
> +			ret = bcl_curr_thresh_write(bcl, val, curr_attr_to_lvl_map[attr]);
> +			break;
> +		default:
> +			ret = -EOPNOTSUPP;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static int bcl_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> +			  u32 attr, int channel, long *value)
> +{
> +	struct bcl_device *bcl = dev_get_drvdata(dev);
> +	int ret;
> +
> +	guard(mutex)(&bcl->lock);
> +
> +	switch (type) {
> +	case hwmon_in:
> +		switch (attr) {
> +		case hwmon_in_input:
> +			ret = bcl_in_input_read(bcl, value);
> +			break;
> +		case hwmon_in_min:
> +		case hwmon_in_lcrit:
> +			ret = bcl_in_thresh_read(bcl, in_attr_to_lvl_map[attr], value);
> +			break;
> +		case hwmon_in_min_alarm:
> +		case hwmon_in_lcrit_alarm:
> +			ret = bcl_read_alarm_status(bcl, in_attr_to_lvl_map[attr], value);
> +			break;
> +		default:
> +			ret = -EOPNOTSUPP;
> +		}
> +		break;

Please split this function into:

       case hwmon_in:
       	    return bcl_in_read();
       case hwmon_curr:
       	    return bcl_curr_read();
       default:
             return -EOPNOTSUPP;

> +	case hwmon_curr:
> +		switch (attr) {
> +		case hwmon_curr_input:
> +			ret = bcl_curr_input_read(bcl, value);
> +			break;
> +		case hwmon_curr_max:
> +		case hwmon_curr_crit:
> +			ret = bcl_curr_thresh_read(bcl, curr_attr_to_lvl_map[attr], value);
> +			break;
> +		case hwmon_curr_max_alarm:
> +		case hwmon_curr_crit_alarm:
> +			ret = bcl_read_alarm_status(bcl, curr_attr_to_lvl_map[attr], value);
> +			break;
> +		default:
> +			ret = -EOPNOTSUPP;
> +		}
> +		break;
> +	default:
> +		ret = -EOPNOTSUPP;
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static int bcl_hwmon_read_string(struct device *dev,
> +				 enum hwmon_sensor_types type,
> +				 u32 attr, int channel, const char **str)
> +{
> +	switch (type) {
> +	case hwmon_in:
> +		if (attr != hwmon_in_label)
> +			break;
> +		*str = bcl_channel_label[IN];

Why not use 'channel' passed as parameter ?

> +		return 0;
> +	case hwmon_curr:
> +		if (attr != hwmon_curr_label)
> +			break;
> +		*str = bcl_channel_label[CURR];
> +		return 0;
> +	default:
> +		break;
> +	}
> +
> +	return -EOPNOTSUPP;

Given there are few channels I suggest to simplify to:

      if (type == hwmon_in && attr == hwmon_in_label) {
      	 *str = "BCL Voltage";
      } else if (type == hwmon_curr && attr == hwmon_curr_label) {
         *str = "BCL Current";
      } else {
      	 *str = NULL;
      }

      return *str ? 0 : -EOPNOTSUPP;

Up to you.

> +}
> +
> +static const struct hwmon_ops bcl_hwmon_ops = {
> +	.is_visible	= bcl_hwmon_is_visible,
> +	.read		= bcl_hwmon_read,
> +	.read_string	= bcl_hwmon_read_string,
> +	.write		= bcl_hwmon_write,
> +};
> +
> +static const struct hwmon_channel_info *bcl_hwmon_info[] = {
> +	HWMON_CHANNEL_INFO(in,
> +			   HWMON_I_INPUT | HWMON_I_LABEL | HWMON_I_MIN |
> +			   HWMON_I_LCRIT | HWMON_I_MIN_ALARM |
> +			   HWMON_I_LCRIT_ALARM),
> +	HWMON_CHANNEL_INFO(curr,
> +			   HWMON_C_INPUT | HWMON_C_LABEL | HWMON_C_MAX |
> +			   HWMON_C_CRIT | HWMON_C_MAX_ALARM |
> +			   HWMON_C_CRIT_ALARM),
> +	NULL,
> +};
> +
> +static const struct hwmon_chip_info bcl_hwmon_chip_info = {
> +	.ops	= &bcl_hwmon_ops,
> +	.info	= bcl_hwmon_info,
> +};
> +
> +static int bcl_curr_thresh_update(struct bcl_device *bcl)
> +{
> +	int ret, i;
> +
> +	if (!bcl->curr_thresholds[0])
> +		return 0;
> +
> +	for (i = 0; i < ALARM_MAX; i++) {
> +		ret = bcl_curr_thresh_write(bcl, bcl->curr_thresholds[i], i);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void bcl_hw_channel_mon_init(struct bcl_device *bcl)
> +{
> +	bcl->in_mon_enabled = bcl_in_monitor_enabled(bcl);
> +	bcl->in_input_enabled = bcl_in_input_enabled(bcl);
> +	bcl->curr_mon_enabled = bcl_curr_monitor_enabled(bcl);

Can you describe why we can have this optionnal ?

Why not set bcl_hwmon_info[] regarding what is enabled instead of
having boolean checks all over the place ?

> +}
> +
> +static int bcl_alarm_irq_init(struct platform_device *pdev,
> +			      struct bcl_device *bcl)
> +{
> +	int ret = 0, irq_num = 0, i = 0;
> +	struct bcl_alarm_data *alarm;
> +
> +	for (i = LVL0; i < ALARM_MAX; i++) {
> +		alarm = &bcl->bcl_alarms[i];
> +		alarm->type = i;
> +		alarm->device = bcl;
> +
> +		ret = devm_delayed_work_autocancel(bcl->dev, &alarm->alarm_poll_work,
> +					   bcl_alarm_enable_poll);
> +		if (ret)
> +			return ret;

Why ?

> +		irq_num = platform_get_irq_byname(pdev, bcl_int_names[i]);
> +		if (irq_num <= 0)
> +			continue;
> +
> +		ret = devm_request_threaded_irq(&pdev->dev, irq_num, NULL,
> +						bcl_handle_alarm, IRQF_ONESHOT,
> +						bcl_int_names[i], alarm);
> +		if (ret) {
> +			dev_err(&pdev->dev, "Error requesting irq(%s).err:%d\n",
> +				bcl_int_names[i], ret);
> +			return ret;
> +		}
> +		enable_irq_wake(alarm->irq);
> +		alarm->irq_enabled = true;
> +		alarm->irq = irq_num;
> +	}
> +
> +	return 0;
> +}
> +
> +static int bcl_regmap_field_init(struct device *dev, struct bcl_device *bcl,
> +				 const struct bcl_desc *data)
> +{
> +	int i;
> +	struct reg_field fields[F_MAX_FIELDS];
> +
> +	BUILD_BUG_ON(ARRAY_SIZE(common_reg_fields) != COMMON_FIELD_MAX);

No, this error implies the way the fields are declared is fragile, may
be revisit the declaration.

> +
> +	for (i = 0; i < data->num_reg_fields; i++) {
> +		if (i < COMMON_FIELD_MAX)
> +			fields[i] = common_reg_fields[i];
> +		else
> +			fields[i] = data->reg_fields[i];
> +
> +		/* Need to adjust BCL base from regmap dynamically */
> +		fields[i].reg += bcl->base;
> +	}
> +
> +	return devm_regmap_field_bulk_alloc(dev, bcl->regmap, bcl->fields,
> +					   fields, data->num_reg_fields);
> +}
> +
> +static int bcl_get_device_property_data(struct platform_device *pdev,
> +				   struct bcl_device *bcl)

*dev could be passed as parameter instead of *pdev

> +{
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +	u32 reg;
> +
> +	ret = device_property_read_u32(dev, "reg", &reg);
> +	if (ret < 0)
> +		return ret;
> +
> +	bcl->base = reg;
> +
> +	device_property_read_u32_array(dev, "overcurrent-thresholds-milliamp",
> +				       bcl->curr_thresholds, 2);

Why don't you want this as a required property ?

> +	return 0;
> +}
> +
> +static int bcl_probe(struct platform_device *pdev)
> +{
> +	struct bcl_device *bcl;
> +	int ret;
> +
> +	bcl = devm_kzalloc(&pdev->dev, sizeof(*bcl), GFP_KERNEL);
> +	if (!bcl)
> +		return -ENOMEM;
> +
> +	bcl->dev = &pdev->dev;
> +	bcl->desc = device_get_match_data(&pdev->dev);
> +	if (!bcl->desc)
> +		return -EINVAL;
> +
> +	ret = devm_mutex_init(bcl->dev, &bcl->lock);
> +	if (ret)
> +		return ret;
> +
> +	bcl->regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +	if (!bcl->regmap) {
> +		dev_err(&pdev->dev, "Couldn't get parent's regmap\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = bcl_get_device_property_data(pdev, bcl);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = bcl_regmap_field_init(bcl->dev, bcl, bcl->desc);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "Unable to allocate regmap fields, err:%d\n", ret);
> +		return ret;
> +	}
> +
> +	if (!bcl_hw_is_enabled(bcl))
> +		return -ENODEV;
> +
> +	ret = bcl_curr_thresh_update(bcl);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = bcl_alarm_irq_init(pdev, bcl);
> +	if (ret < 0)
> +		return ret;
> +
> +	bcl_hw_channel_mon_init(bcl);
> +
> +	dev_set_drvdata(&pdev->dev, bcl);
> +
> +	bcl->hwmon_name = devm_hwmon_sanitize_name(&pdev->dev,
> +						   dev_name(bcl->dev));
> +	if (IS_ERR(bcl->hwmon_name)) {
> +		dev_err(&pdev->dev, "Failed to sanitize hwmon name\n");
> +		return PTR_ERR(bcl->hwmon_name);
> +	}
> +
> +	bcl->hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev,
> +							      bcl->hwmon_name,
> +							      bcl,
> +							      &bcl_hwmon_chip_info,
> +							      NULL);
> +	if (IS_ERR(bcl->hwmon_dev)) {
> +		dev_err(&pdev->dev, "Failed to register hwmon device: %ld\n",
> +			PTR_ERR(bcl->hwmon_dev));
> +		return PTR_ERR(bcl->hwmon_dev);
> +	}
> +
> +	dev_dbg(&pdev->dev, "BCL hwmon device with version: %u.%u registered\n",
> +		bcl_get_version_major(bcl), bcl_get_version_minor(bcl));
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id bcl_match[] = {
> +	{
> +		.compatible = "qcom,bcl-v1",
> +		.data = &pm7250b_data,
> +	}, {
> +		.compatible = "qcom,bcl-v2",
> +		.data = &pm8350_data,
> +	}, {
> +		.compatible = "qcom,bcl-v3-bmx",
> +		.data = &pm8550b_data,
> +	}, {
> +		.compatible = "qcom,bcl-v3-wb",
> +		.data = &pmw5100_data,
> +	}, {
> +		.compatible = "qcom,bcl-v3-core",
> +		.data = &pm8550_data,
> +	}, {
> +		.compatible = "qcom,bcl-v4-bmx",
> +		.data = &pmih010_data,
> +	}, {
> +		.compatible = "qcom,bcl-v4-wb",
> +		.data = &pmw6100_data,
> +	}, {
> +		.compatible = "qcom,bcl-v4-core",
> +		.data = &pmh010_data,
> +	}, {
> +		.compatible = "qcom,bcl-v4-pmv010",
> +		.data = &pmv010_data,
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, bcl_match);
> +
> +static struct platform_driver bcl_driver = {
> +	.probe	= bcl_probe,
> +	.driver	= {
> +		.name		= BCL_DRIVER_NAME,
> +		.of_match_table	= bcl_match,
> +	},
> +};
> +
> +MODULE_AUTHOR("Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>");
> +MODULE_DESCRIPTION("QCOM BCL HWMON driver");
> +module_platform_driver(bcl_driver);
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/hwmon/qcom-bcl-hwmon.h b/drivers/hwmon/qcom-bcl-hwmon.h
> new file mode 100644
> index 000000000000..28a7154d9486
> --- /dev/null
> +++ b/drivers/hwmon/qcom-bcl-hwmon.h

As there is nothing shared with other files, no header is needed.

> @@ -0,0 +1,311 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2026, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef __QCOM_BCL_HWMON_H__
> +#define __QCOM_BCL_HWMON_H__
> +
> +#define BCL_DRIVER_NAME			"qcom-bcl-hwmon"
> +
> +/* BCL common regmap offset */
> +#define REVISION1			0x0
> +#define REVISION2			0x1
> +#define STATUS				0x8
> +#define INT_RT_STS			0x10
> +#define EN_CTL1				0x46
> +
> +/* BCL GEN1 regmap offsets */
> +#define MODE_CTL1			0x41
> +#define VADC_L0_THR			0x48
> +#define VCMP_L1_THR			0x49
> +#define IADC_H0_THR			0x4b
> +#define IADC_H1_THR			0x4c
> +#define VADC_CONV_REQ			0x72
> +#define IADC_CONV_REQ			0x82
> +#define VADC_DATA1			0x76
> +#define IADC_DATA1			0x86
> +
> +/* BCL GEN3 regmap offsets */
> +#define VCMP_CTL			0x44
> +#define VCMP_L0_THR			0x47
> +#define PARAM_1				0x0e
> +#define IADC_H1_THR_GEN3		0x4d
> +
> +#define BCL_IN_INC_MV			25
> +#define BCL_ALARM_POLLING_MS		50
> +
> +/**
> + * enum bcl_limit_alarm - BCL alarm threshold levels
> + * @LVL0: Level 0 alarm threshold (mapped to in_min_alarm or curr_max_alarm)
> + * @LVL1: Level 1 alarm threshold (mapped to in_lcrit_alarm or curr_crit_alarm)
> + * @ALARM_MAX: sentinel value
> + *
> + * Defines the three threshold levels for BCL monitoring. Each level corresponds
> + * to different severity of in or curr conditions.
> + */
> +enum bcl_limit_alarm {
> +	LVL0,
> +	LVL1,
> +	ALARM_MAX,
> +};

These are too generic names and they can collide with other
subsystems. BCL_LIMIT_ALRM_LVL0/1, BLC_LIMIT_ALRM_MAX should be fine.

> +/**
> + * enum bcl_channel_type - BCL supported sensor channel type
> + * @IN: in (voltage) channel
> + * @CURR: curr (current) channel
> + * @CHANNEL_MAX: sentinel value
> + *
> + * Defines the supported channel types for bcl.
> + */
> +enum bcl_channel_type {

s/bcl_channel_type/bcl_channel/ ?

> +	IN,
> +	CURR,
> +
> +	CHANNEL_MAX,
> +};

Same comment: BCL_CHANNEL_IN, BCL_CHANNEL_CURR, BCL_CHANNEL_MAX

> +/**
> + * enum bcl_thresh_type - voltage or current threshold representation type
> + * @ADC: Raw ADC value representation
> + * @INDEX: Index-based voltage or current representation
> + *
> + * Specifies how voltage or current thresholds are stored and interpreted in
> + * registers. Some PMICs use raw ADC values while others use indexed values.
> + */
> +enum bcl_thresh_type {
> +	ADC,
> +	INDEX,
> +};

Ditto

> +/**
> + * enum bcl_fields - BCL register field identifiers
> + * @F_V_MAJOR: Major revision info field
> + * @F_V_MINOR: Minor revision info field
> + * @F_CTL_EN: Monitor enable control field
> + * @F_LVL0_ALARM: Level 0 alarm status field
> + * @F_LVL1_ALARM: Level 1 alarm status field
> + * @COMMON_FIELD_MAX: sentinel value for common fields
> + * @F_IN_MON_EN: voltage monitor enable control field
> + * @F_IN_L0_THR: voltage level 0 threshold field
> + * @F_IN_L1_THR: voltage level 1 threshold field
> + * @F_IN_INPUT_EN: voltage input enable control field
> + * @F_IN_INPUT: voltage input data field
> + * @F_CURR_MON_EN: current monitor enable control field
> + * @F_CURR_H0_THR: current level 0 threshold field
> + * @F_CURR_H1_THR: current level 1 threshold field
> + * @F_CURR_INPUT: current input data field
> + * @F_MAX_FIELDS: sentinel value
> + *
> + * Enumeration of all register fields used by the BCL driver for accessing
> + * registers through regmap fields.
> + */
> +enum bcl_fields {
> +	F_V_MAJOR,
> +	F_V_MINOR,
> +
> +	F_CTL_EN,
> +
> +	/* common alarm for in and curr channel */
> +	F_LVL0_ALARM,
> +	F_LVL1_ALARM,
> +
> +	COMMON_FIELD_MAX,
> +
> +	F_IN_MON_EN = COMMON_FIELD_MAX,
> +	F_IN_L0_THR,
> +	F_IN_L1_THR,
> +
> +	F_IN_INPUT_EN,
> +	F_IN_INPUT,
> +
> +	F_CURR_MON_EN,
> +	F_CURR_H0_THR,
> +	F_CURR_H1_THR,
> +
> +	F_CURR_INPUT,
> +
> +	F_MAX_FIELDS
> +};

Usually this is described with macro, not enum.

> +#define ADD_BCL_HWMON_ALARM_MAPS(_type, lvl0_attr, lvl1_attr)	\
> +								\
> +static const u8 _type##_attr_to_lvl_map[] = {			\
> +	[hwmon_##_type##_##lvl0_attr] = LVL0,			\
> +	[hwmon_##_type##_##lvl1_attr] = LVL1,			\
> +	[hwmon_##_type##_##lvl0_attr##_alarm] = LVL0,		\
> +	[hwmon_##_type##_##lvl1_attr##_alarm] = LVL1,		\
> +};								\
> +								\
> +static const u8 _type##_lvl_to_attr_map[ALARM_MAX] = {		\
> +	[LVL0] = hwmon_##_type##_##lvl0_attr##_alarm,		\
> +	[LVL1] = hwmon_##_type##_##lvl1_attr##_alarm,		\
> +}

Please avoid these macros, they don't help to the readability.

> +/**
> + * struct bcl_channel_cfg - BCL channel related configuration
> + * @default_scale_nu:  Default scaling factor in nano unit
> + * @base: Base threshold value in milli unit
> + * @max: Maximum threshold value in milli unit
> + * @step: step increment value between two indexed threshold value
> + * @thresh_type: Array specifying threshold representation type for each alarm level
> + *
> + * Contains hardware-specific configuration and scaling parameters for different
> + * channel(voltage and current)..
> + */
> +
> +struct bcl_channel_cfg {
> +	u32 default_scale_nu;
> +	u32 base;
> +	u32 max;
> +	u32 step;
> +	u8 thresh_type[ALARM_MAX];
> +};
> +
> +/**
> + * struct bcl_desc - BCL device descriptor
> + * @reg_fields: Array of register field definitions for this device variant
> + * @channel: Each channel specific(voltage or current) configuration
> + * @num_reg_fields: Number of register field definitions for this device variant
> + * @data_field_bits_size: data read register bit size
> + * @thresh_field_bits_size: lsb bit size those are not included in threshold register
> + *
> + * Contains hardware-specific configuration and scaling parameters for different
> + * BCL variants. Each PMIC model may have different register layouts and
> + * conversion factors.
> + */
> +
> +struct bcl_desc {
> +	const struct reg_field *reg_fields;
> +	struct bcl_channel_cfg channel[CHANNEL_MAX];
> +	u8 num_reg_fields;
> +	u8 data_field_bits_size;
> +	u8 thresh_field_bits_size;
> +};
> +
> +struct bcl_device;

No forward declaration, reorg the structure definitions below

> +/**
> + * struct bcl_alarm_data - BCL alarm interrupt data
> + * @irq: IRQ number assigned to this alarm
> + * @irq_enabled: Flag indicating if IRQ is enabled
> + * @type: Alarm level type (LVL0, or LVL1)
> + * @device: Pointer to parent BCL device structure
> + * @alarm_poll_work: delayed_work to poll alarm status

Why do you want to poll the alarm status if there is an interrupt ?

> + *
> + * Stores interrupt-related information for each alarm threshold level.
> + * Used by the IRQ handler to identify which alarm triggered.
> + */
> +struct bcl_alarm_data {
> +	int			irq;
> +	bool			irq_enabled;
> +	enum bcl_limit_alarm	type;
> +	struct bcl_device	*device;
> +	struct delayed_work	alarm_poll_work;
> +};
> +
> +/**
> + * struct bcl_device - Main BCL device structure
> + * @dev: Pointer to device structure
> + * @regmap: Regmap for accessing PMIC registers
> + * @fields: Array of regmap fields for register access
> + * @bcl_alarms: Array of alarm data structures for each threshold level
> + * @lock: Mutex for protecting concurrent hardware access
> + * @in_mon_enabled: Flag indicating if voltage monitoring is enabled
> + * @curr_mon_enabled: Flag indicating if current monitoring is enabled
> + * @curr_thresholds: Current threshold values in milliamps from dt-binding(LVL0 and LVL1)
> + * @base: the BCL regbase offset from regmap
> + * @in_input_enabled: Flag indicating if voltage input reading is enabled
> + * @last_in_input: Last valid voltage input reading in millivolts
> + * @last_curr_input: Last valid current input reading in milliamps
> + * @desc: Pointer to device descriptor with hardware-specific parameters
> + * @hwmon_dev: Pointer to registered hwmon device
> + * @hwmon_name: Sanitized name for hwmon device
> + *
> + * Main driver structure containing all state and configuration for a BCL
> + * monitoring instance. Manages voltage and current monitoring, thresholds,
> + * and alarm handling.
> + */
> +struct bcl_device {
> +	struct device		*dev;

This field is unnecessary if the debug message is removed from the
interrupt handler.

> +	struct regmap		*regmap;
> +	u16			base;
> +	struct regmap_field	*fields[F_MAX_FIELDS];
> +	struct bcl_alarm_data	bcl_alarms[ALARM_MAX];
> +	struct mutex		lock;

What is this lock for ?

> +	u32			curr_thresholds[ALARM_MAX];
> +	u32			last_in_input;
> +	u32			last_curr_input;
> +	bool			in_mon_enabled;
> +	bool			curr_mon_enabled;
> +	bool			in_input_enabled;
> +	const struct bcl_desc	*desc;
> +	struct device		*hwmon_dev;
> +	char			*hwmon_name;
> +};
> +
> +/**
> + * bcl_read_field_value - Read alarm status for a given level
> + * @bcl: BCL device structure
> + * @id: Index in bcl->fields[]
> + * @val: Pointer to store val
> + *
> + * Return: 0 on success or regmap error code
> + */
> +static inline int bcl_read_field_value(const struct bcl_device *bcl, enum bcl_fields id, u32 *val)
> +{
> +	return regmap_field_read(bcl->fields[id], val);
> +}
> +
> +/**
> + * bcl_field_enabled - Generic helper to check if a regmap field is enabled
> + * @bcl: BCL device structure
> + * @field: Index in bcl->fields[]
> + *
> + * Return: true if field is non-zero, false otherwise
> + */
> +static inline bool bcl_field_enabled(const struct bcl_device *bcl, enum bcl_fields id)
> +{
> +	int ret;
> +	u32 val = 0;
> +
> +	ret = regmap_field_read(bcl->fields[id], &val);
> +	if (ret)
> +		return false;
> +
> +	return !!val;
> +}
> +
> +#define bcl_in_input_enabled(bcl)	bcl_field_enabled(bcl, F_IN_INPUT_EN)
> +#define bcl_curr_monitor_enabled(bcl)	bcl_field_enabled(bcl, F_CURR_MON_EN)
> +#define bcl_in_monitor_enabled(bcl)	bcl_field_enabled(bcl, F_IN_MON_EN)
> +#define bcl_hw_is_enabled(bcl)		bcl_field_enabled(bcl, F_CTL_EN)
> +
> +/**
> + * bcl_enable_irq - Generic helper to enable alarm irq
> + * @alarm: BCL level alarm data
> + */
> +static inline void bcl_enable_irq(struct bcl_alarm_data *alarm)
> +{
> +	if (alarm->irq_enabled)
> +		return;
> +	alarm->irq_enabled = true;
> +	enable_irq(alarm->irq);
> +	enable_irq_wake(alarm->irq);
> +}
> +
> +/**
> + * bcl_disable_irq - Generic helper to disable alarm irq
> + * @alarm: BCL level alarm data
> + */
> +static inline void bcl_disable_irq(struct bcl_alarm_data *alarm)
> +{
> +	if (!alarm->irq_enabled)
> +		return;
> +	alarm->irq_enabled = false;
> +	disable_irq_nosync(alarm->irq);
> +	disable_irq_wake(alarm->irq);
> +}
> +#endif /* __QCOM_BCL_HWMON_H__ */
> 
> -- 
> 2.43.0
> 

-- 
