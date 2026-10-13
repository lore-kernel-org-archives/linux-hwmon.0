Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0035D3EE1E0
	for <linux-hwmon@vger.kernel.org>; Tue, 13 Oct 2026 14:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791901434; cv=none; b=o7Lq3PyafKrkbo2b7yoWCNmoTRVfvB/aFU/pTDpYig9nDIVA1FpSsvYKWeyLfjTLpaDiWf5J02OzHv84wCYY5mjHdFgXCigDC7i0HUpmU682p5aWRWq3Il4tPpraAfrBKgPBNrNw6TWzc9MkosiOgXh+cTLls/YnA+Eeopb308o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791901434; c=relaxed/simple;
	bh=F6xdNylOra+d6nScPWTOEdS7UIVxYDy2KpsyhXvVqUY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=j+vb2ZciQovGqA0B80CwueUjowZQF7j1sYO8NHmtFvqoVGqcUFvLJmpjdJ4zKeGqLPZr3Qrq1cx5wwC/d6+UMYODjn/ly11ZEBOW/+s7sE1SiVCvKphoynV78VBWsugyQCm1HcznbjmZU61bR0K82fnyNhOrdEJiOQ+iZNpz7Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k0IbU070; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k0IbU070"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso21643205e9.1
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Oct 2026 07:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791901431; x=1792506231; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ab10SuSZKniPFCPp3hIt28gYpjjC/wvqCg5uxaP7xbQ=;
        b=k0IbU070ZVB+i6N0ptron3p4her+E1u+kSDWlpRnSZfmM6YqDAZtn6mVzniL1mJUZV
         k7fPqUSjeD6cJL7yKgq3hSLVZGvKIXgKxUsl9JJkrot6kWFVIjao/1LcbhnJnoGjbGqF
         Q75c7Z/6rmA2ZFL8XmlntYF/Eq1PzrMOqulRFyJrva2Bajj6db01km6okW+mffGm4xBK
         F+p5O7LcbzvtUfMFLGq7HRyG/4HYYkD6e7gEn1AJo7ilW3eU8xM7lGbWcwc26/GmRlBC
         YaM/2NaR7O8I4LjKNITtGApSqp0rUTNBGDOivvoks9zb1cELo2BCbknKN/BKSFuAtt5I
         r8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791901431; x=1792506231;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ab10SuSZKniPFCPp3hIt28gYpjjC/wvqCg5uxaP7xbQ=;
        b=fB6dbjRk3InXLhHswbMhThpYHzgL/en9OeqrRNkne/sELkihNF4F1Y16f/hnBAljpA
         L3svvUbASCqL00T6z59ftH26IkL+JGeRlJ7h8yUVBIHsHlteYt/tzGfV7LewQk28e4UI
         PNWk2fLxM9UMSK64oEJDan8IXYtHzG4WAFz0+dec2E2sIkU6kXGkamHHiHi7ENmuZz58
         PVQ3EOPeaTGw6uN4wluUP7ilRaurp8FXIun6FY2R+e8wW4UPUXWoBDZXcRJibO89UN/1
         lNRtbMW9qyByNbf8n0vIK7Okp5qO6/LIGSaZrkUownl3PikBjeDthZLpoA1evtjMkhs7
         joZA==
X-Forwarded-Encrypted: i=1; AKwUvBzR8blYvrrFyPMsng0sBU6UMIEpIRQ+7lpvrOfnwFryBaJSQDcJRjJePBJslGv3GEHDtiPGkoRIQtSuMg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ12nSbpYJXnWvChyutSz0AGzUFv0XqLDQniLonrDFSG+EugUmj
	vT6qcYXwWIfoQK0yRo01BaTvO81ZPZqR19d46VRBP7OthBqOdxIg3qKzApF74zsuqqQ=
X-Gm-Gg: AYBFou0y6W7wDQmQx6TjbxOnX46n4hhbKd/0ZKNg33woJ4X5ilttMMu40Tg7kZJESSC
	EN1XtTVbGoONvTzhfb6gkd0tj5QVHzr99r7jz04RyXJMLNiRpUHGkAxjNVPZ5ZzPJtVQXI15ZHw
	aa0Y0CiZohoUEXJYhBf/C6i6m0jemJpxKqlMUReJNmNwl4TiblxwwigTWnpCFZxvDKg8X08eKvn
	YAq0PRIlQd3gOFIoCGHVMdyVAPE0Ya1Apweny42I3mdjdoHgLkTovTsenrHkZf56i3op9PRJ+sl
	zYkpazPxsKGA6H31sGEZNbTgOUdKqf40aDUwok1WM0x1XQL8MBjXDTXXBWHyc72ahj656gWM5g+
	hIp25NepSWmrrZi8tmtE+ekYov2fY6uKfVmvN4+CxN6pkA2wKYs7fWVWqC0aybADuqCLMk6KP7u
	5ICbtk+ePCSpa7DkJI893n5ibl3prFcIGRVOd95BVLgE2thxk2OFBE5PEGQ6ThRr+tY28ttXIqs
	6lFvjjUmU0MJs5SDCOUZAU6ZG/OZxLh6gc9pESvs1fRv7YXusBmbw==
X-Received: by 2002:a05:600c:83c9:b0:4a1:70f0:ac2 with SMTP id 5b1f17b1804b1-4a18e4ce9cfmr247499385e9.24.1791901430730;
        Tue, 13 Oct 2026 07:23:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:ef1f:5ab3:36fa:3ccb? ([2a01:e0a:106d:1080:ef1f:5ab3:36fa:3ccb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ae508ef8sm26764285e9.3.2026.10.13.07.23.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 07:23:50 -0700 (PDT)
Message-ID: <d716146b-6d84-48fe-b6f4-18fce93cfc4a@linaro.org>
Date: Tue, 13 Oct 2026 16:23:49 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 3/3] iio: adc: add driver for the MAX34417 Four-Channel
 High Dynamic Range Power Accumulator
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261013-topic-sm8x50-iio-max34417-adc-v3-0-d3604ae4a229@linaro.org>
 <20261013-topic-sm8x50-iio-max34417-adc-v3-3-d3604ae4a229@linaro.org>
 <sashiko-outbox-169896@kernel.org>
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
In-Reply-To: <sashiko-outbox-169896@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/26 16:19, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
> - [High] iio: max34417: silent truncation of 64-bit software accumulator
> - [High] iio: max34417: sysfs reads violate 1ms hardware UPDATE delay constraint
> - [Medium] iio: max34417: u32 acc_count overflows causing corrupted power calculations
> - [Medium] iio: max34417: device registered before hardware initialization completes
> - [Medium] iio: max34417: unprivileged log-spam DoS via non-rate-limited dev_warn
> - [Medium] iio: adc: max34417: data race and TOCTOU on cam_mode causes incorrect statistics
> --
> 
> commit ebd13d02bb2cfb7ea4951f2b1c27883dde2b138e
> Author: Neil Armstrong <neil.armstrong@linaro.org>
> 
> iio: adc: add driver for the MAX34417 Four-Channel High Dynamic Range Power Accumulator
> 
> The MAX34417 is a specialized current and voltage monitor used to determine
> power consumption of portable systems. The driver supports getting the channels
> voltage, average power and accumulated average power and energy over an
> I2C/SMBUS serial interface.
> 
>> diff --git a/drivers/iio/adc/max34417.c b/drivers/iio/adc/max34417.c
>> new file mode 100644
>> index 0000000000000..00d7f20cd9531
>> --- /dev/null
>> +++ b/drivers/iio/adc/max34417.c
>> @@ -0,0 +1,777 @@
> 
> [ ... ]
> 
>> +struct max34417_data {
>> +	struct iio_dev *indio_dev;
>> +	struct regmap *regmap;
>> +	struct device *dev;
>> +	struct mutex lock;
>> +	u32 input_correction[MAX34417_CHANNEL_COUNT];
>> +	const char *input_label[MAX34417_CHANNEL_COUNT];
>> +	bool cam_mode;
>> +	u64 acc_power[MAX34417_CHANNEL_COUNT];
>> +	u32 acc_count[MAX34417_CHANNEL_COUNT];
>> +};
> 
> [Severity: Medium]
> Will this 32-bit counter overflow during continuous long-term accumulation?
> 
> In Continuous Accumulation Mode (CAM), the hardware sample counter is repeatedly
> added to this variable across sysfs reads. At the maximum sample rate of 1024
> SPS, a 32-bit counter will overflow in approximately 48 days. When this
> wrap-around occurs, the subsequent average power calculation
> (div_u64(acc_power, acc_count)) will divide the large 64-bit acc_power by a
> small or zero acc_count, resulting in a corrupted power reading or a division
> by zero panic. Should acc_count be promoted to u64?

Eventually yes

> 
> [ ... ]
> 
>> +static int max34417_read_voltage(struct max34417_data *max34417,
>> +				 const struct iio_chan_spec *chan, int *val)
>> +{
>> +	u8 buf[MAX34417_VOLTAGE_READ_LENGTH];
>> +	u16 voltage;
>> +	int rc;
>> +
>> +	guard(mutex)(&max34417->lock);
>> +
>> +	/* In SMM mode, trigger a measurement cycle manually */
>> +	if (!max34417->cam_mode) {
>> +		rc = max34417_trigger_smm(max34417);
>> +		if (rc)
>> +			return rc;
>> +	}
>> +
>> +	/* Move the new UPDATE data into the SMBus read registers */
>> +	rc = regmap_write(max34417->regmap, MAX34417_UPDATE_REG, 1);
> 
> [Severity: High]
> Does this bypass the hardware's 1ms UPDATE delay constraint?
> 
> The driver notes that "UPDATE commands should be no less than 1msec apart for
> reliable measurements." While max34417_trigger_smm() properly enforces this
> delay, the sysfs read handlers for CAM mode unconditionally write to
> MAX34417_UPDATE_REG. If an unprivileged userspace process polls the sysfs
> attributes faster than 1ms, it might violate this constraint, potentially
> leading to unreliable measurements, missing samples, or bus lockups.

The 1ms update delay is only for the Single Shot Mode, not for the Continuous Update Mode.

> 
> [ ... ]
> 
>> +static int max34417_read_power(struct max34417_data *max34417,
>> +			       const struct iio_chan_spec *chan,
>> +			       int *val, int *val2)
>> +{
> 
> [ ... ]
> 
>> +	if (max34417->cam_mode) {
>> +		u32 acc_count;
>> +		u64 acc_power;
>> +
>> +		/* Retrieve all channels to avoid missing data for other channels */
>> +		rc = max34417_save_accumulators(max34417);
>> +		if (rc)
>> +			return rc;
>> +
>> +		/* Get current channel power, counter and reset them */
>> +		acc_power = max34417->acc_power[chan->channel];
>> +		acc_count = max34417->acc_count[chan->channel];
>> +		max34417->acc_power[chan->channel] = 0;
>> +		max34417->acc_count[chan->channel] = 0;
>> +
>> +		if (unlikely(acc_count == 0)) {
>> +			dev_warn(max34417->dev, "unexpected zero accumulator count\n");
> 
> [Severity: Medium]
> Could this non-rate-limited warning lead to a log-spam denial of service?
> 
> If an unprivileged userspace process repeatedly reads the attribute in a tight
> loop, it will extract data faster than the hardware's sample rate, causing the
> counter to evaluate to 0. This blindly prints a warning using dev_warn()
> without any rate limiting, which could flood the kernel log buffer and mask
> legitimate kernel messages. Should dev_warn_ratelimited() be used instead?

Perhaps yes

> 
>> +			*val = 0;
>> +			*val2 = 0;
>> +
>> +			return IIO_VAL_INT_64;
>> +		}
>> +
>> +		power = div_u64(acc_power, acc_count);
>> +	} else {
>> +		rc = max34417_read_acc_power(max34417, chan->address, &power);
>> +		if (rc)
>> +			return rc;
>> +
>> +		rc = max34417_reset_smm(max34417);
>> +		if (rc)
>> +			return rc;
>> +	}
>> +
>> +	*val = FIELD_GET(GENMASK_ULL(31, 0), power);
>> +	*val2 = FIELD_GET(GENMASK_ULL(55, 32), power);
> 
> [Severity: High]
> Does this silently truncate the upper 8 bits of the 64-bit software
> accumulator?
> 
> GENMASK_ULL(55, 32) explicitly masks off bits 56-63, meaning any accumulated
> value exceeding 56 bits is silently truncated and dropped before being
> exported to IIO userspace. Since CAM mode continuously accumulates readings,
> the u64 can easily exceed 56 bits in sustained operation, causing the
> userspace reading to wrap around prematurely. Should this use
> GENMASK_ULL(63, 32) or upper_32_bits(power)?

Value from register is 56bit, there's no truncation.

> 
>> +
>> +	return IIO_VAL_INT_64;
>> +}
>> +
>> +static int max34417_read_energy(struct max34417_data *max34417,
>> +			       const struct iio_chan_spec *chan,
>> +			       int *val, int *val2)
>> +{
> 
> [ ... ]
> 
>> +	/* Get current channel power and reset them */
>> +	acc_power = max34417->acc_power[chan->channel];
>> +	max34417->acc_power[chan->channel] = 0;
>> +	max34417->acc_count[chan->channel] = 0;
>> +
>> +	*val = FIELD_GET(GENMASK_ULL(31, 0), acc_power);
>> +	*val2 = FIELD_GET(GENMASK_ULL(55, 32), acc_power);
> 
> [Severity: High]
> Does this also silently truncate the upper 8 bits of the 64-bit accumulator?
> 
> Just as in max34417_read_power(), this GENMASK_ULL(55, 32) truncates bits
> 56-63 of acc_power.

Value from register is 56bit, there's no truncation.

> 
> [ ... ]
> 
>> +static int max34417_read_raw(struct iio_dev *indio_dev,
>> +			     struct iio_chan_spec const *chan,
>> +			     int *val, int *val2, long mask)
>> +{
>> +	struct max34417_data *max34417 = iio_priv(indio_dev);
>> +
>> +	switch (mask) {
>> +	case IIO_CHAN_INFO_RAW:
>> +		switch (chan->type) {
>> +		case IIO_VOLTAGE:
>> +			return max34417_read_voltage(max34417, chan, val);
>> +		case IIO_POWER:
>> +			/* In default mode, we return a single measurement */
>> +			if (max34417->cam_mode)
>> +				return -EINVAL;
>> +
>> +			return max34417_read_power(max34417, chan, val, val2);
> 
> [Severity: Medium]
> Could this lockless check of cam_mode lead to a TOCTOU race and return
> incorrect statistics?
> 
> Here, cam_mode is evaluated without holding the mutex. Concurrently, a sysfs
> write to in_energy_enable could call max34417_setup_cam_mode(), taking the
> mutex and setting cam_mode to true. When max34417_read_power() is then
> called, it acquires the mutex, sees cam_mode is true, and executes the CAM
> mode logic. This would unexpectedly return an averaged measurement instead of
> a single-shot reading, violating the expected IIO channel behavior.

Good catch

> 
> [ ... ]
> 
>> +static int max34417_probe(struct i2c_client *client)
>> +{
> 
> [ ... ]
> 
>> +	indio_dev->channels = max34417_channels;
>> +	indio_dev->num_channels = ARRAY_SIZE(max34417_channels);
>> +	indio_dev->name = "max34417";
>> +	indio_dev->info = &max34417_info;
>> +	indio_dev->modes = INDIO_DIRECT_MODE;
>> +
>> +	rc = devm_iio_device_register(dev, indio_dev);
>> +	if (rc)
>> +		return rc;
>> +
>> +	/* Reset mode and set accumulator width to Wide */
>> +	rc = regmap_write(max34417->regmap, MAX34417_CONTROL_REG, MAX34417_CONTROL_MODE);
> 
> [Severity: Medium]
> Is it safe to register the IIO device before the hardware initialization
> completes?
> 
> devm_iio_device_register() exposes the device and its sysfs attributes to
> userspace immediately. A userspace process or udev rule could open the device
> and trigger read_raw or write_raw callbacks before the hardware is placed
> into the correct mode (MAX34417_CONTROL_MODE) or its internal accumulators
> are reset. Should the hardware configuration happen prior to registration?
> 

Good catch

Neil

