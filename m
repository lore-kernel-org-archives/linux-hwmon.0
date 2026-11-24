Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529007;
	b=mT46dYPsPA6X4fDCljmBqVTnkv5uSz2cJV0fRiybKLQRQUAw6W60fEm9d5JhmK7UopY6
	 vQ3PYyIKYm5DJayO7Be6o9wU1RZygY5sHDl+ARYFTSuJuwm4lKVO3FWNVIIDPJ4gTi5yi
	 7RAtMwuBAwsgTwtgUA7Eh97/D+DVYwpCVQDVY383yXxm08hRF2WNE9K8v8q1XqSUdT0MD
	 NFdEtZ0t+3OmQci7o8fEEGT5efOvCpmd7KvvnDzve0xKbJZS0vDkqSdkct+zFn1uoPDfz
	 +uDmYn+3F1/3goF0ILw1raQlelfJSYFV6IDdHG9yK3aL87GVLqWpHXXDHPlgE+BkiBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=BmiCN77Aw/h7BiprF2ntlBFbL25ugi22XICBugdNRMQ=;
	b=JbCnx7YgKVG0TOiPRZVkByrSaoKDiyLS0EGPPhCW/7Hy2s8kUK0W1TeX8Slttz/DYAHf
	 3ghJQEuQBhDNqyTsAkfvWmeFHCEYcyr15ND/nu6VgvrRVtL28t7pwap3GgeDwjrQOx3mv
	 65bBPZecFvxH0hbrJ3JLTA+iie4xovgit6tGaBs7QvvJOj6IknGQNi8SOOk2E5Uh3FaGm
	 Uy+i08slZIPiGdakwSz4JyaokS4JF3lRNe3/uVMbNP35TPzXu2kZHSuumMTG7fz7GOnzy
	 hFSYxXKhm80Cx4i9suai0KVbSQvXT6YqdFMRHtDkTaWhKD/Gb36jGDVLQqlLrWxNZlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ukiSOZUO;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C847B606A33A
	for <linux-hwmon@vger.kernel.org>; Tue, 24 Nov 2026 14:03:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C847B606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ukiSOZUO
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c5198302d38so78666666b.0
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Nov 2026 06:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795529005; x=1796133805; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BmiCN77Aw/h7BiprF2ntlBFbL25ugi22XICBugdNRMQ=;
        b=ukiSOZUO2GyI9WW2Hp77iKkVNMkOHuY7o4g5f3aW3EXCGVsK0nQ/L6RfBKWO2T9Jlc
         jnU3tq3aEGNDAJHgNAstZoLxDMtkTDW+/mJbxPNcZ+6UMNO8QIwgLnxHyhTBLNOsWTrV
         B7nOg4FqmMgEz/Upfyv6SZD9S10nfOYcY/CaRaRAILpA/TXkxR6nGap86rwGpGIXiStQ
         a6dBGiUc5Y6BxzxJpaMHbVc+mnvNflPbla3j7wCHsl5k217FZqoMSJKRlyAbzUQw6+QK
         /kEu0pUQ1/BN8LWvrd4lBFy5xizt6Ae1S2eNGe9sPUfBOTqjtGl5apop3VpRgDP4y+1b
         HdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795529005; x=1796133805;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BmiCN77Aw/h7BiprF2ntlBFbL25ugi22XICBugdNRMQ=;
        b=mscuHk5dk1AQYZusFvxswAvJ//Pc0f9BKvPBCyzkH4G5nRutuR0hdYFjQFELMAeyMT
         D/C7zRI8cz5Z+3nmZHMpsgUCWPwcGGHrN/5s5amgIM66J7awYiQPZOB/0H1ZTB6F+4Ut
         29EpkUpIYk3NUqha8tP0QUeqEZcRACwMCZbhyjhCjOQbY7ES3R0gfCphcEJd8WXUT1zT
         pHsSwUv+6uecJCgJu/md1l08nGGyygnzK0x2vmnXWfhYNySFhkWl0pzTvHDHr7aFfoCZ
         UZunSDBApkUC7E6XLg4YfqAfxBgg2W/pXeX5I198ggPuy9wwzrk32mBUQ/XJ2yS8CSpf
         ETsw==
X-Forwarded-Encrypted: i=1; AL+hErE5BXnfgt+Vi5O+bkAMOQUSPGj5xD1A9wcTvvLIwii+yTPpF573/0/JwRzXAUMyKqPYH0bEhh/Q5/LRvQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/XDyp6cjIsBltJYQdmeVKZl93SflUvX7MEZ1tDVjLJ5C8ezwCw
	ZqzdwQwWUi4wL43QvwcQbJllPH6PhNprXlQKa2O8/S1B6BcU5mOHz3q/kQofXP2UvC+STWqB/sh
	xmp7Qwc8=
X-Gm-Gg: AZFdTZeM5mr3k44ogpd3KiSa6nlS7oHVImo/e+AGRghRyIX017mI+VmaceY7e+NPZCX
	QdriLQ1/wYAShikuZ/41yY/kpC21QVX+VDCSBHe5QdweQc5cu67JDJYAacloN52pUrGnsFSWQI0
	zK6a53r9eQdQ/UINJH1xRar3xndz0q39BV4+LT0aUVr4IHPBc5eO2kvy6D2lm+CFxghkoGcu1IZ
	vtoJwHr3fzgNnaif+0oFKC7HxZmz7gjk9YV7JnmecD3jYaRlU8QxreBQ1vP7/Mnr/c4c6thMS96
	D6NNeU/mBAYt7uzhI+sgyd7NIg9ICxxlt9Flt/p/Y7Z8Jf3l6wjmzcVfAK6kC69wnApXwl24YSy
	Hf4B0aPtG7xQGyaUtdjmZdkEJTLOv0mh2s7fn8c13zo8ugMp4xvvTuRL6i9qJjXykGGAO1HfH7Q
	x8Df20WsRGBcD/YJXVyBCZ+ujtpSe21YAyofhQ0bP/LinG8czT4TWHR0ahHt0izrEH5GMWs/HeR
	9rraSWPLn5UvipCecPebs7V0noA2Uctf5k9avYZLXObu7sNO+rR4vpAVcOutDCyIoO8w/MJ3OgU
	GcjyTqBdWGjno5Kca2Q23SACFfA9t9X1U5ha0KuJP43vQNxBbvgyspklnuvkY16ylR0kcaB1YHS
	ePPGumMV6bFCXx2lQ7oVK7XJyd5ivwg==
X-Received: by 2002:a17:906:2db1:b0:c51:691:c76e with SMTP id a640c23a62f3a-c513a9abeffmr853349866b.36.1795529003374;
        Tue, 24 Nov 2026 06:03:23 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:ac27:24a0:7b1a:dd94? ([2a01:e0a:106d:1080:ac27:24a0:7b1a:dd94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad010a6sm528420066b.7.2026.11.24.06.03.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 06:03:23 -0800 (PST)
Message-ID: <729e2ab7-ebf2-4dd5-8c73-3e9ac1764663@linaro.org>
Date: Tue, 24 Nov 2026 15:03:21 +0100
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
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v7 3/3] iio: adc: add driver for the MAX34417 Four-Channel
 High Dynamic Range Power Accumulator
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261123-topic-sm8x50-iio-max34417-adc-v7-0-d8f87edc5086@linaro.org>
 <20261123-topic-sm8x50-iio-max34417-adc-v7-3-d8f87edc5086@linaro.org>
 <sashiko-outbox-229791@kernel.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <sashiko-outbox-229791@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/26 19:02, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] iio: adc: max34417: voltage read fails on power overflow in
>    CAM mode
> - [Medium] iio: adc: max34417: stale OVF and state desync in
>    max34417_setup_cam_mode()
> --
> 
> commit bc8a43ebc9b20a80f36676c2f0db12f5485b7c1d
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> iio: adc: add driver for the MAX34417 Four-Channel High Dynamic Range Power Accumulator
> 
> This commit adds an IIO ADC driver for the MAX34417 four-channel voltage and
> power accumulator over I2C/SMBus, supporting single-shot voltage and power
> measurements as well as continuous energy and average power accumulation.
> 
>> diff --git a/drivers/iio/adc/max34417.c b/drivers/iio/adc/max34417.c
>> new file mode 100644
>> index 0000000000000..241cc9c3c2546
>> --- /dev/null
>> +++ b/drivers/iio/adc/max34417.c
> [ ... ]
>> +static int max34417_check_ovf(struct max34417_data *max34417)
>> +{
>> +	struct regmap *map = max34417->regmap;
>> +	u32 control;
>> +	int rc;
>> +
>> +	rc = regmap_read(map, MAX34417_CONTROL_REG, &control);
>> +	if (rc)
>> +		return rc;
>> +
>> +	if (!(control & MAX34417_CONTROL_OVF))
>> +		return 0;
>> +
>> +	rc = regmap_clear_bits(map, MAX34417_CONTROL_REG, MAX34417_CONTROL_OVF);
>> +	if (rc)
>> +		return rc;
>> +
>> +	rc = regmap_write(map, MAX34417_UPDATE_REG, 1);
>> +	if (rc)
>> +		return rc;
>> +
>> +	/* Save the timestamp for the next read */
>> +	max34417->last_update = ktime_get();
>> +
>> +	return 0;
>> +}
> [ ... ]
>> +static int max34417_save_accumulators(struct max34417_data *max34417)
>> +{
>> +	s64 acc_power;
>> +	s32 acc_count;
>> +	int rc;
>> +
>> +	rc = max34417_read_acc_count(max34417, &acc_count);
>> +	if (rc)
>> +		return rc;
>> +
>> +	if (check_add_overflow(max34417->acc_count, acc_count, &max34417->acc_count)) {
>> +		max34417->overflow = true;
>> +		goto check_ovf;
>> +	}
>> +
>> +	for (int i = 0; i < MAX34417_CHANNEL_COUNT; i++) {
>> +		rc = max34417_read_acc_power(max34417, MAX34417_PWR_ACC_1_REG + i,
>> +					     &acc_power);
>> +		if (rc)
>> +			return rc;
>> +
>> +		/* Check for overflow on local accumulators */
>> +		if (check_add_overflow(max34417->acc_power[i], acc_power,
>> +				       &max34417->acc_power[i])) {
>> +			max34417->overflow = true;
>> +			goto check_ovf;
>> +		}
>> +	}
>> +
>> +check_ovf:
>> +	rc = max34417_check_ovf(max34417);
>> +	if (rc)
>> +		return rc;
>> +
>> +	return max34417->overflow ? -EOVERFLOW : 0;
>> +}
>> +
>> +static int max34417_read_voltage(struct max34417_data *max34417,
>> +				 const struct iio_chan_spec *chan, int *val)
>> +{
> [ ... ]
>> +	rc = regmap_write(map, MAX34417_UPDATE_REG, 1);
>> +	if (rc)
>> +		return rc;
>> +
>> +	/* Save the timestamp for the next read */
>> +	max34417->last_update = ktime_get();
>> +
>> +	if (max34417->cam_mode) {
>> +		/* Retrieve all channels to avoid missing data for other channels */
>> +		rc = max34417_save_accumulators(max34417);
>> +		if (rc)
>> +			return rc;
>> +	}
>> +
>> +	rc = regmap_noinc_read(map, chan->address, &buf, sizeof(buf));
>> +	if (rc)
>> +		return rc;
>> +
>> +	/* Ignore first byte which contains the Byte Count & data starts at Bit 2 */
>> +	*val = get_unaligned_be16(&buf[MAX34417_VOLTAGE_READ_OFFSET]) >> 2;
>> +
>> +	return IIO_VAL_INT;
>> +}
> 
> [Severity: Medium]
> Should max34417_read_voltage() fail with -EOVERFLOW when a software power
> accumulator overflows in CAM mode?
> 
> Voltage readings from MAX34417_V_CHx_REG are instantaneous 14-bit samples
> that do not depend on max34417->acc_power[] or max34417->acc_count, yet once
> max34417->overflow is set, max34417_save_accumulators() returns -EOVERFLOW
> and aborts every voltage read.
> 
> In addition, because neither max34417_read_voltage() nor
> max34417_save_accumulators() checks max34417->overflow before running
> check_add_overflow(), subsequent voltage reads continue adding into the
> wrapped max34417->acc_count and max34417->acc_power[] values.  And if
> MAX34417_CONTROL_OVF is set in hardware, max34417_check_ovf() clears it and
> writes MAX34417_UPDATE_REG before max34417_read_voltage() has read
> chan->address.

Will address that, and not fail on accumulation overflow.

> 
> [ ... ]
>> +static int max34417_setup_cam_mode(struct max34417_data *max34417, int val)
>> +{
>> +	struct regmap *map = max34417->regmap;
>> +	int rc;
>> +
>> +	if (max34417->cam_mode && !val) {
>> +		/* Reset counters and accumulators */
>> +		for (int i = 0; i < MAX34417_CHANNEL_COUNT; i++)
>> +			max34417->acc_power[i] = 0;
>> +		max34417->acc_count = 0;
>> +		max34417->overflow = false;
>> +
>> +		rc = regmap_clear_bits(map, MAX34417_CONTROL_REG,
>> +				       MAX34417_CONTROL_CAM);
>> +		if (rc)
>> +			return rc;
>> +
>> +		rc = regmap_write(map, MAX34417_UPDATE_REG, 1);
>> +		if (rc)
>> +			return rc;
>> +	} else if (!max34417->cam_mode && val) {
>> +		/*
>> +		 * If CAM mode must be set, the Control byte must be set to desired
>> +		 * values with CAM = 0, then followed by an UPDATE.
>> +		 */
>> +		rc = regmap_clear_bits(map, MAX34417_CONTROL_REG,
>> +				       MAX34417_CONTROL_CAM);
>> +		if (rc)
>> +			return rc;
>> +
>> +		rc = regmap_write(map, MAX34417_UPDATE_REG, 1);
>> +		if (rc)
>> +			return rc;
>> +
>> +		rc = regmap_set_bits(map, MAX34417_CONTROL_REG, MAX34417_CONTROL_CAM);
>> +		if (rc)
>> +			return rc;
>> +
>> +		rc = regmap_write(map, MAX34417_UPDATE_REG, 1);
>> +		if (rc)
>> +			return rc;
>> +	}
>> +
>> +	/* Save the timestamp for the next read */
>> +	max34417->last_update = ktime_get();
>> +
>> +	max34417->cam_mode = val;
>> +
>> +	return 0;
>> +}
> 
> [Severity: Medium]
> Does max34417_setup_cam_mode() leave MAX34417_CONTROL_OVF set in
> MAX34417_CONTROL_REG when toggling CAM mode after an accumulator saturation?
> 
> When a hardware accumulator saturates, the chip sets MAX34417_CONTROL_OVF
> and stops measuring until MAX34417_CONTROL_OVF is cleared followed by an
> UPDATE command.  And once max34417->overflow is set, max34417_read_power()
> and max34417_read_energy() return -EOVERFLOW before reaching
> max34417_check_ovf(), so disabling and re-enabling CAM mode is the way to
> reset accumulation.  Because both branches here only modify
> MAX34417_CONTROL_CAM via regmap_clear_bits() and regmap_set_bits(),
> MAX34417_CONTROL_OVF stays set in hardware across the reset and keeps
> accumulation halted when CAM mode is re-enabled.
> 
> Also, in the disable branch, max34417->acc_power[], max34417->acc_count and
> max34417->overflow are cleared before the I2C writes, so a failed write
> discards the accumulated data while leaving max34417->cam_mode true; in the
> enable branch, if the final regmap_write(map, MAX34417_UPDATE_REG, 1) fails,
> MAX34417_CONTROL_CAM remains set in hardware while max34417->cam_mode stays
> false.
> 

Will clear OVF on disabling and clear the accumulator after the i2c writes.
