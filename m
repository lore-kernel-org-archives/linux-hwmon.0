Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792487915;
	b=OfkioCnetCX5jiepcJ5FrHm9M+DWR5Q/Lq5bgMnjkaUOFCQQgTXSKAjwjm1sMlWpsRsr
	 1uj93fD8+prBDpqz3oTmIoTAO/RLd1BoGsbnIGkAMX+DNRZzUatIHs9YfTcM3QM2pnzX+
	 PkA7L4noV7KlQ+mra2bvV6UbZq+BNdTsGRyqXsneHfd3E52dvXA2Ncb59zYFgPDf2NJyy
	 IIY8W2KVLLjbjTE7bUIJm3LS4/A7bLZtLVcG2zJUuyeBUw92PJhgw5Yk3JY//Likws3JT
	 UQ0FdRJeYjtFC7R4r5cgzQZJDyenPhQ5UIT7/mS3FaIDN+r5/hm6f41/h3KUKFpk77Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792487915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=RXrka+trTKfbRU3hvw3qF/+2ovmjJPpFg2SNwUFDjw8=;
	b=RC5rI2l24iYNgVDd6q0LgBBXiJa+6ym5Ihq1HO5h6Qu1LRXTlznG0TYB5oEv2A9s6MEl
	 yumPUSOGopDl2mywh1Uzuq/ir28+ShcUG55TQ/GWIPUCWfmwcWaX88FozJjhSwaTANxDy
	 pyPq8G6Zf+KHQZn5FEvpDeTVcGGJDh5x3vuj4gqQXSEReOratSJys4GJvW8J9O/xWY0+z
	 3/ok3xAvaTOnk4ZwLDzBHa8CW3y9U1huMPGW3qIJNTcpTzfyDLT8e6gRFrsFL1JQzptlX
	 01ynl4qY7I1qhyqFATxN4UkWi3raRY3jmQXrjmDLDlqWT08H097YvSK/G9xuhEX8O2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RhZ1CaEM;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5C5606A31B
	for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 09:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D5C5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=RhZ1CaEM
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1cef0439aso32921995e9.0
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 02:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792487913; x=1793092713; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RXrka+trTKfbRU3hvw3qF/+2ovmjJPpFg2SNwUFDjw8=;
        b=RhZ1CaEMgo0wRYmx5UlbvTIcS6kzMbbAv5ELwleWExr6XzoB6dnfBTZm082W44w6Oy
         KWXtmxlb87YKvzSQ4lEwWlMEmGCkdC3xCrSbzG3I0Va+pSfJtJ/YBOTb2FtkZSfQkwzv
         jM3eD9Oxq2VE2eG2y1smILL/hA0RBl0mW0vV1raXRhLISVG+vDaKdBDHLzxkJtzg+xvb
         P755Bbk6LTRpEONZAfiJQd5SOPm5T8tvKptDsmd0CxDyCzcag6Hm3ofzGMvCW7aMmdHL
         bDJfaLIih/h4Cx63PrY6dfa9KskTIm+oiFwGOW5vp5jB9tSGkStqeL95JLmwjfgoWxYI
         dFIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792487913; x=1793092713;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RXrka+trTKfbRU3hvw3qF/+2ovmjJPpFg2SNwUFDjw8=;
        b=egxyNnzbgFzOx5lGOV9c+p9KmK3HXW7uh/UVA+jVg0sVyBOs0RwopyhVoFQJpT2YrN
         LciwCuwdO68Q8bTDynpaOxE4WU8c7PEj3wJxMyQv6dBJhGAA38tYjIWWT+SYGiIYs7Bj
         T6dNnIn2P0gVMRkheMbYRLLtGPDWv58xpbUXnGKdxenSJhUcQEVeOf24zmPtS8nFEarV
         q72Z95pYEYqcrWFc8l/fERzwbWGbVukn3CLKJAywF7nr/VEtvASJBmWs0gbucu5rKInr
         yvfD6xqK4ttJd7q+U7VHrsZWCifEnX3hDXCTwPLiIEzDC4pvvbIVJOyGZ/7DOdbeb01V
         NW+w==
X-Forwarded-Encrypted: i=1; AKwUvBw5HLabVaShVkEn3YyLnxLDdgRLUXiFkHPmbUMXTT3FQ4RTyy7XAm1Q96z1wlZ3MuHn78i0/ZzeBZA4qw==@vger.kernel.org
X-Gm-Message-State: AFq9FYL1I56dnBn/Dot+bj8K75EX4TblrcHCmHkAdugH8qghEZgn1HMV
	P7WzgLpgxVerpNc1ZsPNjMMnqNhWHJl/Yx94Ra9wEKH526aP5+koknPJO4Su8elxE/VvFnJ3laW
	bsrit
X-Gm-Gg: AYBFou0CN0vtdJKMEvY451pL6jo/jwNF8dAaPD7mq7dx3vt3nm18el3RuULk5+ym/QW
	+fcDklyLNqD0KuQIxhDabYz2kOZ9YnQHn42XI7qPf+DcMGW82Y45u6XJNvRVZs5aBukv2fSwPbc
	sWzgSKQpYrTFx78wiMjCBh3/BXAS2IkHS3lqYIOCZc1VhxthT5AeBWsouMwf0tEWfNwKeufjpEw
	VV5wanLQl0c1OLbn9tD+Aup1AJO1/kxg6I1xA6iEql/zbS0ZVcAYKCqc5ZznfFPGLe8TBXmyZYL
	cyZ6TuyUOV2qG42aVe0k38rhn+fm12hYpEKWoYPd4pqfh9FxAJ2dzggE1N1oFJ3lbPUi381UM5G
	r8T7uFNnO15MESDWnOcG88JTVQJL2/dw4EzWow87WitOJFHNeZ7JPhbmCScrwsPtff+wR9NNMR9
	nF2fEPEDtwzOOukYQC5wZFo1EHsosrRGDkiOAuELgDVo4DlSjZXe6iGsXaJNw1RmGLaoqLO1eo5
	g1cNU8v/9l7NeWBrA/ywkKAxvz2NPVpW/RQ7beLHpQWD7wD6W9KEg==
X-Received: by 2002:a05:600c:674f:b0:4a1:8efb:c9ae with SMTP id 5b1f17b1804b1-4a1d760d2fcmr198847445e9.23.1792487912614;
        Tue, 20 Oct 2026 02:18:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:e3a1:1a65:a394:be54? ([2a01:e0a:106d:1080:e3a1:1a65:a394:be54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2ca3597sm56737215e9.2.2026.10.20.02.18.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 02:18:32 -0700 (PDT)
Message-ID: <729d7100-56b5-4826-be86-358e96be2882@linaro.org>
Date: Tue, 20 Oct 2026 11:18:31 +0200
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
Subject: Re: [PATCH v3 3/3] iio: adc: add driver for the MAX34417 Four-Channel
 High Dynamic Range Power Accumulator
To: David Laight <david.laight.linux@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org
References: <20261013-topic-sm8x50-iio-max34417-adc-v3-0-d3604ae4a229@linaro.org>
 <20261013-topic-sm8x50-iio-max34417-adc-v3-3-d3604ae4a229@linaro.org>
 <20261020101312.47d2eaf0@pumpkin>
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
In-Reply-To: <20261020101312.47d2eaf0@pumpkin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/26 11:13, David Laight wrote:
> On Tue, 13 Oct 2026 16:07:13 +0200
> Neil Armstrong <neil.armstrong@linaro.org> wrote:
> 
>> The MAX34417 is a specialized current and voltage monitor used to
>> determine power consumption of portable systems. The driver support
>> getting the channels voltage, average power and accumulated average
>> power and energy over an I2C/SMBUS serial interface.
>>
>> The MAX34417 datasheet only specified on how to calculate the
>> accumulated average power, but with the Sample Per Second rate
>> we can easily get accumulated Energy in mJ.
>>
>> By default the IIO driver only supports single-shot Voltage
>> and Power sensing, but the accumulation can be enabled by
>> enabling the Energy IIO channel which then enables the
>> Continuous Accumulation Mode.
>>
>> The counter is common to all channels, so when reading a single
>> channel we will copy all accumulators to registers, so in order
>> to permit reading individual channels we must accumulate the
>> other channels in the driver when Continuous Accumulation Mode
>> is enabled.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ...
>> +#define MAX34417_POWER_READ_LENGTH	8
>> +#define MAX34417_POWER_READ_OFFSET	1
> ...
>> +static int max34417_read_acc_power(struct max34417_data *max34417, unsigned int address,
>> +				   u64 *acc_power)
>> +{
>> +	u8 buf[MAX34417_POWER_READ_LENGTH];
>> +	int rc;
>> +
>> +	rc = regmap_noinc_read(max34417->regmap, address, &buf, sizeof(buf));
>> +	if (rc)
>> +		return rc;
>> +
>> +	/* Ignore byte0 */
>> +	*acc_power = get_unaligned_be56(&buf[MAX34417_POWER_READ_OFFSET]);
>> +
>> +	return 0;
>> +}
> 
> I was thinking:
> 	struct { u64 pad:8; val:56 } buf;
> then using bswap64(buf.val) >> 8 on LE.
> But why not just:
> 	u64 buf;
> and be64toh(buf) & (BITULL(56) - 1)

Right, I mean all this could work but I would like to keep using something
simpler and get_unaligned_be56 matches all this.
I don't think the need for performance is enough to use complex ways to get
the value.

Thanks,
Neil

> 
> David

