Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795532871;
	b=a6IlgI0RKcFDb/moQwqOulhaFHX/Nq04E7mjXpBJ+TyRt8xYbWgAFmy2OgoXq03/9nTm
	 TpKTzGeiU4woQoKhG3bindcMDzeB4VSsEjKzaM2V0XoA3PF+eLsu02aYUdASkb7Lyeky1
	 82TvpetoVWWO/ivSQl7OSN7ZtIx9GU9s9ZkXuFymYmFlaDQCIeIYl6SEb9ca1iIAzc00g
	 gHfi8oszyzvJCECR+tD689PqmlzlQMtFbfUsZ5s1h0LgSFeq9iRrzNkS4EKoLqFiPEo1g
	 159LX7EDCWRPSjx26v8Pc4Pc8eQVRS3uuzWg6NqquCpjTBdW+0WM0lz8ygvfIMBnkSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532871;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=G7Hg0gt668orwU2HO5Iwx97Bb7gVHA6V0wHbzGAHiEU=;
	b=XctqsgvE3RQJcJ9Ly+bh5vf43DV71l/uJzzVxEZkUygJUvIWGIGqCgezkuKGoLFUjj8g
	 bhaSRdyKLqQN27jVvcTmRuCVH4WE02Ckx4P68Rvz1TtJdU0ly8XcUkznGoGyUZhxvSh2D
	 50ueM5pnVD9dc3d0cAZlGWf99YWR66sCuCbIKS5jAXLvAujQQdMC812K8bnrFBYSanQgc
	 VSrFSASeBp8cRtejYWmWHj/mFdv7wdk1u+siEHUxuEKGB4Y8xlUuOz/xutbUsopkDuIAi
	 ZgU3jOz2LC5z/yK035qNPxgrwh7n2qCrbOFxXIJDMFR/L/s/8D8qKgmJk1MfKyvKavg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=YrkMIerM;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D086606A323
	for <linux-hwmon@vger.kernel.org>; Tue, 24 Nov 2026 15:07:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D086606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=YrkMIerM
Received: from eig-obgw-6003b.ext.cloudfilter.net ([10.0.30.175])
	by cmsmtp with ESMTPS
	id VrSZx33HOVK9UVs7Zx6i4k; Tue, 24 Nov 2026 15:07:49 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id Vs7YxQqovGh2BVs7YxuOEG; Tue, 24 Nov 2026 15:07:48 +0000
X-Authority-Analysis: v=2.4 cv=Aszu3P9P c=1 sm=1 tr=0 ts=6b05a844
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=BOHXnwOiB0Zir2JbBRsA:9 a=QEXdDO2ut3YA:10
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=G7Hg0gt668orwU2HO5Iwx97Bb7gVHA6V0wHbzGAHiEU=; b=YrkMIerM6e9D
	UE1bgvvfVEvE/eVN1bC+wKms0MJUP/hyKmAHWcrs4jjTYmzPLi876wk1L7hoO0BzpF76cxUjzfYFM
	2PcIdBx3ClJoaqnsZgpKHQGR/FlRLc4a+nkMvaHtGGIUX5jqBj/DUUMc4SJUYBSq3mp7qD1RcxwkU
	6ROOU40JGNpsM5KgvpimqjRjCfO5P44OL5S5s068CHW9jwCIDxNtMkjjtlzP0phdhLPw2Vvvw0wG2
	dR8lSErO+u33+aOKXhymS1S8OtxpHfRfT3W0cZvpKEDffBDTwZjxwGb5ilFX2cYT4ZiYGZ2g9HaFE
	wf57MHsXKCB6qEGZB/O2qg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:41580)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xVs7Y-00000001Ab4-02SJ;
	Tue, 24 Nov 2026 20:37:48 +0530
Message-ID: <8046641a-3e9d-434b-b0db-58190257b38a@roeck-us.net>
Date: Tue, 24 Nov 2026 07:07:46 -0800
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
To: sashiko-reviews@lists.linux.dev,
 Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
References: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
 <20261124-qcom-bcl-hwmon-v5-2-747d5383d538@oss.qualcomm.com>
 <sashiko-outbox-230063@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <sashiko-outbox-230063@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xVs7Y-00000001Ab4-02SJ
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:41580
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 6
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfDKgubHL2sduBKTq6mPfvkozBPIykJgPqwrF5yVIZEUIWUs2r44YsefjwMobhHTxL7Xmief42U0/aybexLcyhTftkSoD9xFuDYjwOaAPqGllkY9Ok8h+
 K915r5rKtiIl00dsvGUfrvs6+sGgIYiKKKjSo4mso0kUWLftYuhNl7vKVj5ZZTloGplJpUF7msARU1zkR9i1F3PVMjJUt7HIQy3OSr0Uci3OFiQFdei1Brla

On 11/23/26 13:11, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential
> issues to consider:
> - [Medium] hwmon: qcom-bcl: infinite poll loop in
>    bcl_alarm_enable_poll() on reassertion
> - [Medium] hwmon: qcom-bcl: max_mu exceeds 6-bit L1/L2 field in
>    bcl_thresh_write()
> - [Medium] hwmon: qcom-bcl: unlocked enable_irq_wake() race in
>    bcl_alarm_irq_init()
> - [Low] hwmon: qcom-bcl: 32-bit jiffies wraparound in
>    bcl_curr_input_read() cache
> - [Low] hwmon: qcom-bcl: redundant private mutex bcl->lock duplicating
>    hwmon_lock()
> --
> 
> commit ad4e95352ce7aa5ad76440eaf33e8bd9c53a0538
> Author: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> 
> hwmon: Add Qualcomm PMIC BCL driver
> 
> This commit adds a hwmon driver for the Qualcomm SPMI PMIC Battery Current
> Limiting (BCL) peripheral to monitor battery voltage and current and report
> threshold alarms.
> 
>> diff --git a/drivers/hwmon/qcom-bcl-hwmon.c b/drivers/hwmon/qcom-bcl-hwmon.c
>> new file mode 100644
>> index 0000000000000..a5a3a59484571
>> --- /dev/null
>> +++ b/drivers/hwmon/qcom-bcl-hwmon.c
> 
> [ ... ]
> 
>> +struct bcl_device {
>> +	struct device		*dev;
>> +	struct regmap		*regmap;
>> +	u32			base;
>> +	struct regmap_field	*fields[F_MAX_FIELDS];
>> +	struct bcl_alarm_data	bcl_alarms[BCL_LIMIT_ALARM_MAX];
>> +	/* Protects hardware register access and device state */
>> +	struct mutex		lock;
> 
> [Severity: Low]
> This isn't a bug, but the hwmon core already serializes .read and .write
> callbacks under the hwmon device lock, and regmap serializes individual
> register accesses.  Could this use hwmon_lock() and hwmon_unlock() instead
> of a driver-private mutex?
> 

Please use the subsystem lock.

>> +	u32			last_in_input;
>> +	s32			last_curr_input;
>> +	unsigned long		last_in_updated;
>> +	unsigned long		last_curr_updated;
> 
> [ ... ]
> 
>> +static const struct reg_field bcl_smb2360_reg_fields[] = {
>> +	[F_V_MAJOR]	= REG_FIELD(REVISION2, 0, 7),
>> +	[F_V_MINOR]	= REG_FIELD(REVISION1, 0, 7),
>> +	[F_CTL_EN]	= REG_FIELD(EN_CTL1, 7, 7),
>> +	[F_LVL0_ALARM]	= REG_FIELD(STATUS, 0, 0),
>> +	[F_LVL1_ALARM]	= REG_FIELD(STATUS, 1, 1),
>> +	[F_LVL2_ALARM]	= REG_FIELD(STATUS, 2, 2),
>> +	[F_IN_L0_THR]	= REG_FIELD(VADC_L0_THR, 0, 7),
>> +	[F_IN_L1_THR]	= REG_FIELD(VCMP_L1_THR, 0, 5),
>> +	[F_IN_L2_THR]	= REG_FIELD(VCMP_L2_THR, 0, 5),
>> +	[F_IN_INPUT]	= REG_FIELD(VADC_DATA1, 0, 7),
>> +	[F_CURR_H0_THR]	= REG_FIELD(IADC_H0_THR, 0, 7),
>> +	[F_CURR_H1_THR]	= REG_FIELD(IADC_H1_THR_GEN3, 0, 7),
>> +	[F_CURR_INPUT]	= REG_FIELD(IADC_DATA1, 0, 7),
>> +};
>> +
>> +static const struct reg_field bcl_smb2370_reg_fields[] = {
>> +	[F_V_MAJOR]	= REG_FIELD(REVISION2, 0, 7),
>> +	[F_V_MINOR]	= REG_FIELD(REVISION1, 0, 7),
>> +	[F_CTL_EN]	= REG_FIELD(EN_CTL1, 7, 7),
>> +	[F_LVL0_ALARM]	= REG_FIELD(STATUS, 0, 0),
>> +	[F_LVL1_ALARM]	= REG_FIELD(STATUS, 1, 1),
>> +	[F_LVL2_ALARM]	= REG_FIELD(STATUS, 2, 2),
>> +	[F_IN_L0_THR]	= REG_FIELD(VADC_L0_THR, 0, 7),
>> +	[F_IN_L1_THR]	= REG_FIELD(VCMP_L1_THR, 0, 5),
>> +	[F_IN_L2_THR]	= REG_FIELD(VCMP_L2_THR, 0, 5),
> 
> [ ... ]
> 
>> +/* Register 0x2a50 mapping: 0 -> 2S, 1 -> 3S */
>> +static const struct bcl_desc smb2360_data = {
>> +	.reg_fields = bcl_smb2360_reg_fields,
>> +	.num_reg_fields = F_CURR_INPUT + 1,
>> +	.data_field_bits_size = 8,
>> +	.thresh_field_bits_size = 8,
>> +	.battery_config_field = REG_FIELD(0x2a50, 0, 1),
>> +	.features = BCL_IN_MON | BCL_IN_INPUT | BCL_CURR_MON,
>> +	.channel_cfg[BCL_BATT_2S][CHANNEL_IN] = {
>> +		.base_mu = 4500,
>> +		.max_mu = 8400,
>> +		.step_mu = 50,
>> +		.default_scale_nu = 432918,
>> +		.thresh_type = {THRESH_TYPE_ADC, THRESH_TYPE_INDEX, THRESH_TYPE_INDEX},
>> +	},
>> +	.channel_cfg[BCL_BATT_2S][CHANNEL_CURR] = {
>> +		.max_mu = 17575,
>> +		.default_scale_nu = 540679,
>> +		.thresh_type = {THRESH_TYPE_ADC, THRESH_TYPE_ADC},
>> +	},
>> +	.channel_cfg[BCL_BATT_3S][CHANNEL_IN] = {
>> +		.base_mu = 6750,
>> +		.max_mu = 12600,
>> +		.step_mu = 75,
>> +		.default_scale_nu = 648790,
>> +		.thresh_type = {THRESH_TYPE_ADC, THRESH_TYPE_INDEX, THRESH_TYPE_INDEX},
>> +	},
> 
> [ ... ]
> 
>> +static int bcl_thresh_write(struct bcl_device *bcl, long value, enum bcl_limit_alarm lvl,
>> +			    enum bcl_channel channel)
>> +{
>> +	const struct bcl_desc *desc = bcl->desc;
>> +	const struct bcl_channel_cfg *cfg = &desc->channel_cfg[bcl->batt_config][channel];
>> +	enum bcl_fields base_field = channel == CHANNEL_IN ? F_IN_L0_THR : F_CURR_H0_THR;
>> +	struct regmap_field *field;
>> +	long thresh = clamp_val(value, cfg->base_mu, cfg->max_mu);
>> +	u32 raw_val;
>> +	int ret;
>> +
>> +	if (WARN_ON(channel == CHANNEL_CURR && lvl >= BCL_LIMIT_ALARM_LVL2))
>> +		return -EINVAL;
>> +

The above should not be needed. In general, I am not in favor of unnecessary
checks against programming errors, much less associated warning tracebacks.
The above should be covered by the is-Visible function. If not, that is a bug
which needs to be fixed, not carried into production code. Same for everywhere
else where similar checks are made.

To clarify: I am not going to accept this driver with all the WARN_ON() spread
through it. That suggest that you don't trust your code, which in turn means
that I don't trust it either.

>> +	field = bcl->fields[base_field + lvl];
>> +
>> +	if (cfg->thresh_type[lvl] == THRESH_TYPE_ADC)
>> +		raw_val = bcl_convert_milliunit_to_raw(bcl, thresh, channel,
>> +						       desc->thresh_field_bits_size);
>> +	else
>> +		raw_val = bcl_convert_milliunit_to_index(bcl, thresh, channel);
>> +
>> +	ret = bcl_validate_threshold_fits(bcl, &desc->reg_fields[base_field + lvl],
>> +					  raw_val, thresh, channel == CHANNEL_IN ? "mV" : "mA");
>> +	if (ret)
>> +		return ret;
> 
> [Severity: Medium]
> As reported by Daniel Lezcano on v4 [1], can bcl_thresh_write() reject
> valid clamped thresholds on SMB2360 and SMB2370?
> 
> For both chips, F_IN_L1_THR and F_IN_L2_THR are 6-bit fields (max index
> 63, which corresponds to 7650 mV on 2S and 11475 mV on 3S), whereas
> channel_cfg sets max_mu to 8400 mV on 2S and 12600 mV on 3S (index 78).
> Writing a value >= 7675 mV on 2S or >= 11513 mV on 3S to in0_lcrit or
> in0_lemergency clamps to at most index 78, causing
> bcl_validate_threshold_fits() to log a dev_err() and fail with -EINVAL
> instead of clamping to the hardware limit.
> 

Hardware monitoring drivers are expected to clamp limits, not to reject
out-of-range values.

> [ ... ]
> 
>> +static int bcl_curr_input_read(struct bcl_device *bcl, long *out)
>> +{
>> +	int ret;
>> +	u32 raw_val = 0;
>> +	s32 signed_val;
>> +	const struct bcl_desc *desc = bcl->desc;
>> +
>> +	/* Return cached value if read too soon after last update */
>> +	if (bcl->last_curr_updated &&
>> +	    time_before(jiffies, bcl->last_curr_updated + HZ)) {
>> +		*out = bcl->last_curr_input;
>> +		return 0;
>> +	}
> 
> [Severity: Low]
> On 32-bit platforms, can time_before(jiffies, bcl->last_curr_updated + HZ)
> wrap around if curr1_input (or in0_input in bcl_in_input_read()) is not
> read for more than LONG_MAX jiffies (~24.8 days at HZ=1000)?  During the
> following ~24.8 days, time_before() evaluates to true and returns the
> stale cached reading without updating last_curr_updated.  Using u64
> timestamps with get_jiffies_64() and time_before64() would avoid the wrap.
> 

Either don't cache, or use 64-bit time functions.

Thanks,
Guenter

