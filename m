Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4A62D97BA
	for <linux-hwmon@vger.kernel.org>; Thu, 25 Jun 2026 08:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782374591; cv=none; b=g9nfX2TfuYtf2hYiUPNPtTqGDEfjYOdOYwzuDpAIMc90PtxJw3L+RGz7RPSmeHl+Z4wRswSNUPE7O3mDgLYKpCugEoXQA7ynp6Dgva57FWS7GW7wQGu2X0t5GxwGhS37TwYDvv1zBzvBUBsJhW1uNR6jOT+BkJHmPFAw3hAxJZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782374591; c=relaxed/simple;
	bh=+LeUK2W5WFxMKhi1pUwMIkmIdcqHQRyIWqYHLGd/T/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mWDKrZbibh1QNZAEIMlhZDW50u2evUT0fNfKq+RboxMKpHI4sI+1BmyCX2c/GgilOHQaHAqaH54eif98WQUhizQ6L9mXSAOLJ2BdU1SMwAbH2h3daZ5i5MJYPojxHw1AIX3LEuaq5ndw5CK5leffF8vRmnQa+dZeLSlAUCyUH+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AqIS9j1t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AEGvldsS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AqIS9j1t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AEGvldsS"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P6h2Tv1527173
	for <linux-hwmon@vger.kernel.org>; Thu, 25 Jun 2026 08:03:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rO5FCGXsOoFHvv0mUd0JcJWaoLBN4ynun7BHL8hKdy8=; b=AqIS9j1to+afer2w
	TBq4LwesK9SicCLGAyGSt08s7w0zPebsw7YZg0wTrIa8NQqDpF2CSvLrOXzh1nK1
	vwaNumsxuvNfWr+X7k0wcoTa22j8ydLkGKabfRLryANYtODU8Tmbx7oPyb/LxLFs
	SNNse8jCF7jR/jxa38+qzk4X7y2HLWd8KB6R60skirMK/VoJtCuJzyfYch7Q+gTb
	zQgdD9V9PGVtkmlsQ0EeHj0c6DnHINfFDF7siO9XMm1o5YnzJZGh3uZAsRfgJEE3
	pA1cvXx/ezBX/dX1RgfKIF8/9u/ZW43exOYR/4dEBrLEcWau0zPWit3kyR9rUSBR
	ds1/WQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0ya8r9v2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Thu, 25 Jun 2026 08:03:08 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5a503b1766fso56024e0c.2
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Jun 2026 01:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782374588; x=1782979388; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rO5FCGXsOoFHvv0mUd0JcJWaoLBN4ynun7BHL8hKdy8=;
        b=AEGvldsSKfHU7MuVHBGJyXthXCQVM9RC/a6LBzhnlduPif/3pXJY0bq/tRFOZABg3/
         na7BYBdKwOm2+/gHr/Yi2Exa06G2wq0rQu/rALgxuKbIkIL0aczAHVXVDpmZmjK2o/D8
         agdcCJkfhZ1/5n3QVSp19i5ooPODkdzskO8lwo2eturfTx8HyznS9CSIjM9ZM8PkHjve
         jxcVNGS2Y6wZlJ1/QulpjIbys2iY+xQLzPomUjPqrofwQwfAwT/3Ga/sjKra8q1OUBcw
         4RWeGRGs8vTCwebhbe6GzWMx46b+VqqDFHxWCeUZm18muSgnqG7h4QrdwUIfz9OvckAe
         R+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782374588; x=1782979388;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rO5FCGXsOoFHvv0mUd0JcJWaoLBN4ynun7BHL8hKdy8=;
        b=b1PdyRd2lFPPbB0G9JjUcwvX3sNLjU7qAWfEsKSJnWRH1opnGMcj7v5tbUsiLuDvcb
         LT/BiGO7lXRLd6W2DxOheVoOoN2mISyq46dDMlF1HkkdvluU/s3XTdrf5khZz0PpWIH3
         5xwDxyIlwpSbG2pWrbhCJPQniiE7s92I2xji7jMUkyWrBjxvVtZ4hcGO0nNSO/9fe0Uj
         PdOI6PMRR4s3a9dZSBNV/IfdPkFOPF7Da3LfsL+OOYU7p57cppO/E1q/dgJY6mK99Hie
         7DpACDCDpfEzQInOCUvVm9AM07UqNgZR05iqPHleAJpX8uZXAcC/bdZVwmLLegLtp4cZ
         d9uA==
X-Forwarded-Encrypted: i=1; AHgh+RqW3nmiwF/ZlSUm0YaEgkYYk89HDFJFYW5aUJaipPKmF+Xo6ZAQ3K9V9lUNyyB9h94Fy8vRSLINvCTRPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBaeWZEHt8sotWLVmZ9iKsBNdfHSPd1C4xT95G9ozcF6Q8qx9e
	9h0dfBe0UjXh3rPry5FB7I/5c+R7PjH2O7ijV9i3+JGMbN+boSdaAgF//r6xBeJKXOTGOjZXEzC
	XmwTbkxBI+d4isZ0kYZGCib9eoXpZ5CIgGXWJQvFoKYGflSuo2fu4+5HvUzwcH2KPtQ==
X-Gm-Gg: AfdE7cl6KZKunT+kzhSxWw5XUM5miwkdEEQU+Wa2aLQ9B5ZjaOGrRT6TX0exGKhUV3V
	vB/do77tRU7udmzzMOZXYAviCFJ2vWoxf6f4RBY3yS2fwVLY+uL3WbuZil8wZU3t4skFQE4f2yn
	bQg1byha/yUMCQGKPMCmg+5M8YpJ5G41/d8nrcFYrjMiuHbXYKiBCfw2x0XOwNgT60XC343Xtiw
	McrsK6g9OCu/ibCf1vLD+ee7fFTDQOMbxZ/JlOQixsm8w2RQ/zVR2l7U4cZievmSP/uNnSH1dTa
	dPKDjlIY0r5XLtIkPhpTjcSjvCt+f/6yX+XxRcJfX00MOKANBIB3paj+aAQBA28rFFQQnMoENJ2
	SJkB9XZYWl1C9rjHJDuHqf3TJtZ/E5nlwuLk=
X-Received: by 2002:a05:6102:548a:b0:632:9ebf:6069 with SMTP id ada2fe7eead31-734360a285amr157861137.4.1782374587902;
        Thu, 25 Jun 2026 01:03:07 -0700 (PDT)
X-Received: by 2002:a05:6102:548a:b0:632:9ebf:6069 with SMTP id ada2fe7eead31-734360a285amr157854137.4.1782374587428;
        Thu, 25 Jun 2026 01:03:07 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe59504sm121399566b.43.2026.06.25.01.03.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 01:03:06 -0700 (PDT)
Message-ID: <1d26c917-917e-41b8-ad52-8c1f3e306ce6@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 10:03:02 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] drivers/platform: lenovo-t14s-ec: Add hwmon
 support for temperatures and fan speed
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, sre@kernel.org,
        hansg@kernel.org, ilpo.jarvinen@linux.intel.com, linux@roeck-us.net,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
 <20260624210825.264454-2-daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260624210825.264454-2-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA2OCBTYWx0ZWRfX+2WXPFj8rT7K
 f2xMv8WL5Dp2Xpvta8OTXlFZ2rqsQsSP3RCsNY2kfmIqflyzaVl49yiNClYteOR8gx87NLbz8g6
 ejNFK+Z6JtYNLZvzIrYRWF2pVVdm2ws=
X-Proofpoint-GUID: vP4wVxhvCRaUReo_Y7ol_7cAA-AZLmLr
X-Proofpoint-ORIG-GUID: vP4wVxhvCRaUReo_Y7ol_7cAA-AZLmLr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA2OCBTYWx0ZWRfX8WpMScBvK8So
 kHxX0TJRCCAoyph+Yp0fAlDg0TrcrvKhL799ZxfSq9K8e4apWB7o/KJOL9yA+1J/05UdYgbBlCU
 d/WodpmRjoNpEMiMP+UyYLPaGARxSeGzcWjZDr6iyxGnTI35XcJIrzqWvkXSWGUpbKmJlYF10W8
 comAIrqJj76TCDG9nFj+VFF5lXKPpcMrpJO+sN+IFXNJSytc2YFDTCAWgvT01HtEp4GrBi8o3AE
 5ND7GufYDzwpCR3FA9xt4kYdgxsHn+XIRuQCSQuDtOupruYqDu3G2uJtgF3/ytl+vue3jyJ78li
 5+8DlKlZ5Jdjze9sK+LerE/gguHvtrj3zjdsvR6LgLn0py4MW/sZrrkDe25qHc1OEcqiIxSTJof
 xGy3DciljRaFl8eIU1B3NerP6h1NeKQGRldpdlaEj1EH0vIkIcgbLoNYiE/ugIp1lCyaOKh/nJi
 BEwJ3iE9aoJbDhZwasw==
X-Authority-Analysis: v=2.4 cv=Z+Xc2nRA c=1 sm=1 tr=0 ts=6a3ce0bc cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=3l1M8v5O_xJZoUiDCkgA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250068

On 6/24/26 11:08 PM, Daniel Lezcano wrote:
> Expose the Lenovo ThinkPad T14s EC environmental sensors through
> the hwmon subsystem.
> 
> The driver now registers a hwmon device providing access to six EC
> temperature sensors corresponding to the SoC, keyboard area, base
> cover, PMIC/charging circuitry, QTM module and SSD. Sensor labels
> are exported to allow user space to identify each measurement.
> 
> Additionally, expose the system fan speed by reading the fan RPM
> registers from the embedded controller.
> 
> This allows standard monitoring tools such as lm-sensors to report
> platform temperatures and fan speed.
> 
> Signed-off-by: Daniel Lezcano daniel.lezcano@oss.qualcomm.com
> ---

[...]

> +	case hwmon_fan:
> +		if (attr == hwmon_fan_input) {
> +			int lsb, msb;
> +			ret = t14s_ec_read(ec, T14S_EC_FAN_RPM_LSB, &lsb);
> +			if (ret)
> +				return ret;
> +
> +			ret = t14s_ec_read(ec, T14S_EC_FAN_RPM_MSB, &msb);
> +			if (ret)
> +				return ret;
> +
> +			*val = 0;
> +			*val = lsb + (msb << 8);

'+' looks funny here.. although t14s_ec_read() only reads a
single byte and assigns a u8 value to the u32 that's being passed
to it, so it never *actually* breaks..
 
[...]

> +static const struct hwmon_channel_info *t14s_ec_hwmon_info[] = {
> +	HWMON_CHANNEL_INFO(temp,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL),
> +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info t14s_ec_chip_info = {
> +	.ops = &t14s_ec_hwmon_ops,
> +	.info = t14s_ec_hwmon_info,
> +};
> +
> +static int t14s_ec_hwmon_probe(struct t14s_ec *ec)
> +{
> +	struct device *dev;
> +	struct t14s_ec_hwmon_sys_thermx sys_thermx[] = {
> +		{ T14S_EC_SYS_THERM0, "soc" },
> +		{ T14S_EC_SYS_THERM1, "keyboard" },
> +		{ T14S_EC_SYS_THERM2, "base" },
> +		{ T14S_EC_SYS_THERM3, "pmbm" },
> +		{ T14S_EC_SYS_THERM6, "qtm" },
> +		{ T14S_EC_SYS_THERM7, "ssd" },

Makes one wonder what happened to THERM4/5 - may they be dedicated to
the 5G modem, perhaps?

Konrad
