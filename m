Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100070;
	b=rKjmmp+4xNvAfNGpbM+cuyuPvzJQUwl6B98P/jz1UQDUU0p7B46MkWrITac58lILnscj
	 Rrihp72Jl8ueQFWTOrsI+GCKFRCbie5muXUih5BLyYOS8mLDj4QmUj8xikDZJClO3ZfCa
	 MeCH3tTPB1L87qeA4/a8pGamwEkHahtm2EabT5y1h8OZ96dqOlHLwSBR3Sk30l8PELiAo
	 HbM5zC0YY9Ke+AnNwEdtA3SVNje1fcx1TsKqETSTagr5q+GGPPEcgQL8OzTJClZjI2ZXz
	 fGr/IV0xGhd73lpTxyWJKLzKMYRoGybE3esvcuw/8gPjdztcGZQQfoCPHucijN3F+Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100070;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=g0Nj3Nw2rDrclL+E9WuW5e/Vyn0k9Yby6gNuiOif1fQ=;
	b=K4envI0PzR4j/R3KXt4AJzH/FQqfzomBCVGCylRzQj/tXQVmcM0fcUwxmOz/JOf+J7ha
	 QtewFrWUZQSqbSuuXkPFj9MuG4R2pQp/3tM34ymiwCaLJgpAaJJBVOB6d8tyRdrPycwYJ
	 N2Bnduslj+njker7WP+ifoGNLTxJ5g22JexyeADcAEsZfarrnEdoLeFm5zpBN/SxEP2jL
	 VaE5M14RlrSPTYmZHkwuflQ/ORIgtG92jAEHQqALrSNmT8Krt+dZWEzssQCU6JXGZBqPx
	 q1wKOj1KfU+k1YaYLeknFYZmjbxyrunWzS3JDlLGXAMATAbkAHsKJpsNaw6VOQy9otw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=exfBBfqG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ALfI7hMt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCBB606A31F
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Oct 2026 11:21:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BCBB606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=exfBBfqG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ALfI7hMt
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeGn01936213
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Oct 2026 11:21:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g0Nj3Nw2rDrclL+E9WuW5e/Vyn0k9Yby6gNuiOif1fQ=; b=exfBBfqGbE5cPRe9
	PgCN0x/LLfHL/uEzbzFwyoiVd62STpMuaIi37jZHgiOR8HY1uxC6Mr+P2dGyf++N
	Z2X0D8qzizUaNFyddnU/wc7M/BVJEGDMqIGy52aa0i3Wc8Tl4ZeJYCj836vFVBJM
	egwXDBqAyuNkHQVUH3nvMsyY+UH2Zund7fumOSh+NdgpTv5QRLQfkKMGUqy9GCrJ
	3jKBrI3n4SuUTO1MhxUIVtix8abnt+mmoNbAZ15+eoK8ZH2MldtWliuf8pF1bxVo
	OyNCKJNaZno9vzesfV80RsklYEQj1fSzUnuKnO4EBv+4vE1fFanySwzSolClnd1u
	1YUr9g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjfavtjca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Oct 2026 11:21:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f20addba1so790167885a.1
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Oct 2026 04:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100068; x=1793704868; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g0Nj3Nw2rDrclL+E9WuW5e/Vyn0k9Yby6gNuiOif1fQ=;
        b=ALfI7hMt58xY3ik/+aP+b3JX6WQMCP2HCS5gxf4KHejsusfg1FT1fPHR2vH6Xmzprn
         voJ1Yi2VerbvpJfMZPdmV+vpMSRDNZjOQrtijSS8YoyMmyDnrREhgIzu+Nqn6IroVwhI
         /a64QTPj8eI17lqn6Jwa1N6N0YzyI38wlA4WskoM5cZWY2OuHIuuiyoHd8MSp/bAgQ2K
         5HnXFyfMZiKLfOYe3Wvr6KHuoLx1+8UG+/kwfpPaJpZmvqvkY8vw2C2cxZkm2jCz1O1j
         YBaQjvX6mxJjhEja0/nV9u9zM+iambebk7w+fTEziBOiy/9O0fndialFR40BT/V/1hUu
         l4GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100068; x=1793704868;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g0Nj3Nw2rDrclL+E9WuW5e/Vyn0k9Yby6gNuiOif1fQ=;
        b=W/2cY+jhd36R0ZtV1D9xEi47VH2dW3vDpyIqb496NfX9Y1+9YBurpkqMscfsVR4pGs
         R+tDFoiB85HDhXedh/kuo7CF3b8ugPDdp/bs3JJLuPU/OB01oIhHgyRROdD8umkXKbNT
         lOh18vGn7brk2ro3hlzyiE7IuDbI9Alafx07YRiEy4SUGorHg0FKZgnYYzkvP1XpW5I/
         1mBku/zXr5pweFXLNZrZ2sqMHXq7nW5GCX1qfTUlMIYWAtzwCa4h6y7R6aKDNq9S2Ajx
         FLY+PNTaLo1BLQA1KUf+UOMrWgrTeKivmdGlVCZu5NiOXJ/ABqB0qFVfnkOtVgJPu5ct
         C2lA==
X-Gm-Message-State: AFq9FYK+CWSH6OS6B/mAjPODduDACrE5gTB86MCPgGu/xCRN7EZXcI2N
	Lsd+pZ5I/5QPKZuE0oZehuk4uO7PTnQY+zwdvMV3ltevvvJ7FCAznBegHxRusjXdKdzSOp15CXP
	yYFp9iHQ4msQBOuG/s7Plgr1pSskeJGtueI58HpoCgVF5PrpK5TgE3MRVXwp/V9rzKw==
X-Gm-Gg: AYBFou3hMZvaJsUUlDqGBbmeXasyHjvxYmaRaf968vmFKcekaTUkSsINkYGy/9fNISM
	mgB46pHIPrazRMtY+zeIpYWatiImf0aPAY/UQHDlqA2jN+4W8Dg6rO6ZgkedPurh4w4EWmUZjB1
	3bttKDtWlMiwOu514T1UOdsUTCc/Db8bNWx2cdqo0olrbkR3y+JmLXOPC9E7Rikpinl19OmQMqY
	d4gfesIkQMlVs68c5xMJDSomSRXwuOV4WLF4ROJ4wO1wdQCE1DRHFCUkSh81WivhocM8b5ZfC4X
	kI+9JDIm5sXiJrt2vvOivSduWndrfJ8Dw87HJJ7vgarIbI0mm+cWE5WZB1TyCoHBicRS8egCY6K
	ceAizPXpkEOlLkMQbtQYw9ZJkSkt6odvd+37MHOuuJZBQdMcWlgZHLZqCa4MQ5w==
X-Received: by 2002:a05:620a:1991:b0:93f:c0d:40a4 with SMTP id af79cd13be357-940ef9aecacmr1494133985a.75.1793100067743;
        Tue, 27 Oct 2026 04:21:07 -0700 (PDT)
X-Received: by 2002:a05:620a:1991:b0:93f:c0d:40a4 with SMTP id af79cd13be357-940ef9aecacmr1494128185a.75.1793100067048;
        Tue, 27 Oct 2026 04:21:07 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a08643dsm206156405e9.4.2026.10.27.04.21.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 04:21:06 -0700 (PDT)
Message-ID: <5598422c-8830-4fcf-be2b-e4486ea64539@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:21:05 +0100
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
Subject: Re: [PATCH v4 02/12] hwmon: Add Qualcomm PMIC BCL driver
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-2-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-2-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: beRXd_ee3DFKimoBC7riTaL4dEs6s8Nv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX+dGtfsUcK0wz
 I1T0Nm8fkQWbETCo7E7fDh5rxguG546IJFnccs9BANCFXtMhd7aAmLv1VR/bBUCJVj8wO//CPUX
 +b57FvbXhmf6tZVkpef+tWYIxqcLiTc=
X-Authority-Analysis: v=2.4 cv=EIeTQFZC c=1 sm=1 tr=0 ts=6ae08924 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=ZtYQVpOM0TWofVJcpS4A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: beRXd_ee3DFKimoBC7riTaL4dEs6s8Nv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfXx85bUblbFY45
 7m2N56LYLVkRbOhfWGvu+xOFXZnnkA1xpUJIG6NWiuDOiNBF3IE7YerLQD082Z8PWzELQ+waT4o
 +5DVokxFRKvlv9UxpAnmmVuQn2/S3bDLgScD6gQo6A99e1CcTYM3s8DDs0OgVks85tH2BAZEghl
 QjB+5Otz0bpbEa8hS/uKDikmkUZm36bocVRpMSuFVKSMNSXJ66LQnEeIKr9oaoEKw7iPw+AQO5Q
 O1FBPDBvX0lSdHP8c+R5Bc+QFgxs0m2Vw13AX1NMH0hF/rEcn+8GDfQaAebRuHEB/dXKsN34FiW
 h6Wpieql6E12I6IaLvGasTb95uE8Ih4qmssVx4PLc7If0LgR2+emZvEccl4ivQd+SXw4U4+Huzc
 HEYnQieZZL2s2c3JWwnUT7vwhfrKOZ/fQfQAi7L1OHmQfiP+z4GxBLZlQa3oHDC1j79zi+7pXQW
 KwwKTldb0Cr4QqWIcSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270045


Hi Manaf,

On 10/5/26 14:24, Manaf Meethalavalappu Pallikunhi wrote:
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

There are a couple of issues in sashiko related to this patch (devres 
LIFO issue and 6 bits encoding value too short for the represented value).

[ ... ]

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
> + * @in_mon_enabled: Voltage monitoring enabled at boot
> + * @in_input_enabled: Voltage input reading enabled at boot
> + * @curr_mon_enabled: Current monitoring enabled at boot
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
> +	bool in_mon_enabled;
> +	bool in_input_enabled;
> +	bool curr_mon_enabled;
> +};

It is your call but I suggest to use a single variable:

eg. u8 features

and use masks

	features = IN_MON | IN_INPUT;

that will reduce the declaration size below.

> +/**
> + * struct bcl_alarm_data - BCL alarm interrupt data
> + * @irq: IRQ number assigned to this alarm
> + * @irq_enabled: Flag indicating if IRQ is enabled
> + * @irq_wake_enabled: Flag indicating if IRQ wake is enabled
> + * @shutting_down: Flag preventing work from re-enabling IRQ during teardown
> + * @type: Alarm level type (LVL0, or LVL1)
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

Same suggestion

> +	enum bcl_limit_alarm	type;
> +	void			*device;
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
> +	u16			base;
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
> +static const u8 in_lvl_to_attr_map[BCL_LIMIT_ALARM_MAX] = {
> +	[BCL_LIMIT_ALARM_LVL0] = hwmon_in_min_alarm,
> +	[BCL_LIMIT_ALARM_LVL1] = hwmon_in_lcrit_alarm,
> +	[BCL_LIMIT_ALARM_LVL2] = hwmon_in_lemergency_alarm,
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
> +static const u8 curr_lvl_to_attr_map[BCL_LIMIT_ALARM_MAX] = {
> +	[BCL_LIMIT_ALARM_LVL0] = hwmon_curr_max_alarm,
> +	[BCL_LIMIT_ALARM_LVL1] = hwmon_curr_crit_alarm,
> +	[BCL_LIMIT_ALARM_LVL2] = hwmon_curr_emergency_alarm,
> +};
> +
> +/* Interrupt names for each alarm level */
> +static const char * const bcl_int_names[BCL_LIMIT_ALARM_MAX] = {
> +	[BCL_LIMIT_ALARM_LVL0] = "max-min",
> +	[BCL_LIMIT_ALARM_LVL1] = "critical",
> +	[BCL_LIMIT_ALARM_LVL2] = "emergency",
> +};

why not fold the structures into a single one?

eg.

struct attr_lvl_map {
	const int level;
	const int attr;
	const char *name;
};

const curr_attr_lvl_map[] = {
	{
	  .level = BCL_LIMIT_ALARM_LVL0,
	  .attr = hwmon_curr_max_alarm,
	  .name = "max-min"
	}
	...
};

And a function lvl_to_attr() / attr_to_lvl()

?


[ ... ]

Thanks

   -- Daniel

