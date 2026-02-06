Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4AD346E45
	for <linux-hwmon@vger.kernel.org>; Fri,  6 Feb 2026 09:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770370065; cv=none; b=LT8ozeiNjeL7dc3FnGuOiYnyKIyZCRL7fwWYkaUigj+XU3iRdOMX/OgDyXu7FJyP49OLdsJJ55zHSVnVJeAwKvtjcisOS2aEOgxzJZGJNMH/5mY4rAhch2i7iM4bI+/XEq3NlKCSDHxidbOxG3eGAHf5e9sTLM6RmS6pVOv73bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770370065; c=relaxed/simple;
	bh=kVJ0oc2XsYQQ2Gxf+FhnDB0t3X56Tnw2t5+EdWhpsBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nVSop6mOGjrcgiDCWOwygPRJIFttv1+QFdWftkkTBC0iuIga+MdovO1tx676JtjpZnS64NWQoqbQ5a8rwzlwatCBGKf1TdF9ci1BgzD0Cj58fk39beNXRBjsiNGFaObKe99EURhDEzPr5KHVdEKAzCBCKChgd69pHndXcjOPHrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y2KnBvaK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hevppbtm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y2KnBvaK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hevppbtm"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6167Xu8B2482264
	for <linux-hwmon@vger.kernel.org>; Fri, 6 Feb 2026 09:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IYUbkmp+idEtsYFQBmZoCdvXyZKJdkMDyJrserH0iQE=; b=Y2KnBvaKV9t8IgRj
	WjRyaX3DpADa/v7fX+/0evFiJhj2df0vUbFILFeri47NU+PiM2zs8A6b8C5gl8b3
	D13TawLHAH+e2np/awdGtnyOOMadSQTLFVdeYudyYHBfZqTZQZ6TIeTcaFgtU3hs
	UgfUtVMTLiDADexwQL+xHpWCGAMnjDbT5VOYHCmkLRmKgbUzdJGlGE4Ohscme6nQ
	SPeXdouhrFob5+82XacJ9oCvCmjjViFJj9QcQcbwSiJPNaL1W/iQdDohVbLkah9F
	rjHbk1qz85NAp5gyT7NkMryl//5t/SymIB9s1ETujHhBNFt/6z7l7lspWqVs94uF
	BgQF9Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5c170cyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Fri, 06 Feb 2026 09:27:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c709a3a56dso94910785a.2
        for <linux-hwmon@vger.kernel.org>; Fri, 06 Feb 2026 01:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770370063; x=1770974863; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IYUbkmp+idEtsYFQBmZoCdvXyZKJdkMDyJrserH0iQE=;
        b=hevppbtmpiRAiWoYCgcTEtj+ngsRY67ugLzMhWqr2BzQdw+wh3ONJUY7Dh19IwHd6f
         sSTczYf4jbZLHHkHruZkvcss9jHnX4ECAweMZi2l7gCkY4e4C9uBmRhpFLYWiuUWyTRh
         OrEa3ItFulDEVil4UhCOWeL37MxAa5SEwhIiTCE009tUM5C69QRAXymCmu+FgiQa4oEu
         iyJvc/RtU2WBPkQnbhiSo4hq2K09b06XPagkSngt3zF9x/YolAEin2qP3MANcSODtXp9
         95htqC/uG5a9JedPVw7t56FMcHf8RsqWCRGrIgT+kfeE6kszt+V25iyoz084a8Grxo3U
         RrTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770370063; x=1770974863;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IYUbkmp+idEtsYFQBmZoCdvXyZKJdkMDyJrserH0iQE=;
        b=wbgVK5t/rgu5K1PWjR687vypl2bAzqpQVphLoH4L9ww0ujkKg9fy9AGo/dIS+dlJMS
         NOfffWD4oRN89yFuKPwP3MtGxVCnn6ogG0OLNNJ8HzrWTKxqFOdVen3LTsGoDnmNo5iG
         8k3HutrTmuY5qw8aQglEqMOtqNjv4zOjAJ/ZgvMZJSvwuswUoLM5zInGUYDtxyA/3wJp
         mMoRwvH6mPPJblqPAvasigaTtDXEL8vGwF1CU6/nMapsD390B/QgBYKhGi39jk0U06TK
         GX00KOZ/pjfKqNj56IHjJzS6dqP8jTL+Ld7g3XxlDobSeCkw2xuxnpjaPi+8YXLMpzys
         TA1w==
X-Gm-Message-State: AOJu0YyaCAC0Odx1OpNfiKJ9V++/Ev6SM8ygJ8260F/9xj6Yy918xMH8
	NSCXa9baSRWfPVMGVNC+i0Evrs+3z+l0XhFQtWW8qkMT0h3RT4iUMaSemzLqh14hekXAan01eD1
	0qMSoJ0Y3OpsOyuXdXyQVub5sXO3qa1iLLpoUVL4qPMfUIW1kBPRO7zhnDfcOsHMGKA==
X-Gm-Gg: AZuq6aLTd2XmLLSXsSFWz31gDMfQEEdCfEwKCdAyWORaa9TNjqHyMmN/NfZ7L+wvFAo
	QFS4NqmnaIiX+j8T2gUr+2xCZiqFwUXGZOznFij2aSq6wFHKoWVptVcEEM1vqZSbCrEttihVCzP
	YzjxHFhvBxfjULTUzcjBacL4KFg+xRTOJ63pCHvu43kQIGktqFt4WAyUlnUOgb2ee0I5fwqsS1Y
	0xa1ExrrCYumKMlE1kMUVbr1y0rg9MyrKUjL8jvkyFA9jBMHPwAS1XYGRTgj19I0W030pNNS5s6
	CW5bRNYecWWyPBlSlCoLN6Ln0utDTFl++7I74Nvr4nC6blwWQGCPdPwcwQ75Ur5suOy5ymY0/8Y
	Xsf0/NdVubqIz1aqTlJ1bJu7WS2vuOQ39tqwQRygZqD90KpaeGwZh4vdHm2qum1DED3cClERNUQ
	iOslk=
X-Received: by 2002:a05:620a:46a6:b0:8ca:1ea3:3d9d with SMTP id af79cd13be357-8caeeb51263mr205602185a.1.1770370063476;
        Fri, 06 Feb 2026 01:27:43 -0800 (PST)
X-Received: by 2002:a05:620a:46a6:b0:8ca:1ea3:3d9d with SMTP id af79cd13be357-8caeeb51263mr205599485a.1.1770370062996;
        Fri, 06 Feb 2026 01:27:42 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65984019d78sm384407a12.25.2026.02.06.01.27.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 01:27:41 -0800 (PST)
Message-ID: <7911bbae-c507-4420-a05c-89242941f774@oss.qualcomm.com>
Date: Fri, 6 Feb 2026 10:27:38 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] hwmon: Add Qualcomm PMIC BCL hardware monitor driver
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
 <20260206-qcom-bcl-hwmon-v1-2-7b426f0b77a1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260206-qcom-bcl-hwmon-v1-2-7b426f0b77a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5pZvRu23kyEwH7ftJ_CiHa3F7mNHogV1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA2MiBTYWx0ZWRfX+V5fVMXR6H+C
 QWK+UjhMlAgJMDwFKLzC7g9NM40SEm/Jzjn3K58ECkP0CrPkJYwEAzdeDFvjzqbVdFI9Uht3GXG
 18U4GK+2QMO5Z5nNoodYc6k4wZ7DkX+uOEFPFAyr52iLcEd82emAhKuWUFJNRKrMEuzKVWD3Mp/
 50/jM3U3NApAs/7EvwZh5J29H9ECad/+QWaH8hdLdigjua8zUue3uPo95jglFnPzQNtFx/H726h
 +htl44S01SNlCudKAWd7cR3twLK60qvJrXMzI6bB06UHQ0xHbQU2mUFgaOf5427b3xqLV5/S2hW
 GZlSqJI5lz+nq8DzGkeWjVBlNntgKXeDy7e3r6RPBG+hhW4qSq5UXCxSe7Xb4gC+BDrVqtWjSEO
 U2G/2cDbyIozyPnXHXE9xLNBsSkdW3nZv00Jb9LAj9BMtg0pnhUIS9piCu6t3VqVrV2kg6Tfnmw
 S2lEo7bHEuPlfgNi4pA==
X-Proofpoint-ORIG-GUID: 5pZvRu23kyEwH7ftJ_CiHa3F7mNHogV1
X-Authority-Analysis: v=2.4 cv=E7TAZKdl c=1 sm=1 tr=0 ts=6985b410 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=543Mn12OrukPu6d3EUcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_02,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602060062

On 2/5/26 10:14 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add support for Qualcomm PMIC Battery Current Limiting (BCL) hardware
> monitor driver. The BCL peripheral is present in Qualcomm PMICs and
> provides real-time monitoring and protection against battery
> overcurrent and under voltage conditions.
> 
> The driver monitors:
> - Battery voltage with configurable low voltage thresholds
> - Battery current with configurable high current thresholds
> - Two limit alarm interrupts (max/min, critical)
> 
> The driver integrates with the Linux hwmon subsystem and provides
> standard hwmon attributes for monitoring battery conditions.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

[...]

> +/* Interrupt names for each alarm level */
> +static const char * const bcl_int_names[ALARM_MAX] = {
> +	[LVL0] = "bcl-max-min",
> +	[LVL1] = "bcl-critical",
> +};
> +
> +static const char * const bcl_channel_label[CHANNEL_MAX] = {
> +	"BCL Voltage",
> +	"BCL Current",
> +};

Let's strip the BCL prefix

[...]

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

raw_val is an int here, a u32 when you retrieve it and a s64 in the math..

> +					enum bcl_channel_type type, u8 field_width)
> +{
> +	u32 def_scale = desc->channel[type].default_scale_nu;
> +	u32 lsb_weight = field_width > 8 ? 1 : 1 << field_width;
> +	u32 scaling_factor = def_scale * lsb_weight;

Would this be equivalent?

if (field_width > 8)
	def_scale <<= field_width;

[...]

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

Do we really need so many read-1-value functions?

> +static void bcl_hwmon_notify_event(struct bcl_device *bcl, enum bcl_limit_alarm alarm)
> +{
> +	if (bcl->in_mon_enabled)
> +		hwmon_notify_event(bcl->hwmon_dev, hwmon_in,
> +				in_lvl_to_attr_map[alarm], 0);
> +	if (bcl->curr_mon_enabled)
> +		hwmon_notify_event(bcl->hwmon_dev, hwmon_curr,
> +				curr_lvl_to_attr_map[alarm], 0);
> +}
> +
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

Do we ever expect regmap_read to *actually* fail?

[...]

> +static int bcl_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
> +			   u32 attr, int channel, long val)
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

Please don't "ret = ...;break;, just return directly, also in the function
below

[...]

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

This too, fails if a regmap_write() fails and leaves other registers
unconfigured if that happens for $reasons

[...]

> +static int bcl_get_device_property_data(struct platform_device *pdev,
> +				   struct bcl_device *bcl)
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
> +	return 0;

If you don't expect this to grow, just inline it in .probe

[...]

> +	if (!bcl_hw_is_enabled(bcl))
> +		return -ENODEV;

Please make this print a meaningful error - also, should we expect this to
ever happen, or would it mean that the bootloader (or something) hasn't
configured BCL prior to Linux booting?

[...]


> + * enum bcl_channel_type - BCL supported sensor channel type
> + * @IN: in (voltage) channel
> + * @CURR: curr (current) channel
> + * @CHANNEL_MAX: sentinel value
> + *
> + * Defines the supported channel types for bcl.
> + */
> +enum bcl_channel_type {
> +	IN,
> +	CURR,

The enum defines could use a prefix, say CHANNEL_CURR

> +
> +	CHANNEL_MAX,
> +};
> +
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

Same here, THRESH_TYPE_ADC

[...]

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

This produces more characters than it would to inline the function

Now, that doesn't mean it can't be like that, but it's certainly curious

Konrad
