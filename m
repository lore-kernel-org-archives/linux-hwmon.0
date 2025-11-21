Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391592DC76F
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Nov 2025 19:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763754077; cv=none; b=mCEu7PE4Wolt6kDrTPV2XjWgx9JizOC7y8ZhYHyml5M28jdXQlqZjj6ahhJ2iLMgy6CScpUVu2oBJI43q1p8r0SZiHzV1E2zh+k2vXk7ltSr7HGM6iYcBNrhMLu1ds3zAcYa0+u9MabRaxYcqjmQmiecrJlDI7wjpEwY6qAx5/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763754077; c=relaxed/simple;
	bh=pPAOUglscEHk0LAsq6ENKclK0mBrXFzepJ3l1K7wgvA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DGHX9hpxsxp0SwakAgnk7yY4VgR+85X9N/Uhk+GQpEU4JYPKFqYds8nsJ/f46yxWB5L3hqtzYxcLE/ge6c9BqFKmvK2s42PjgLCD1Ep8rFOMmPbTxJNVtUUmA8yANCqbevkVXV06EPbohjxY59jg0AaNh5gS2vO8kHATmzdNyAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c1jrSYaM; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c1jrSYaM"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7baf61be569so2734650b3a.3
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Nov 2025 11:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763754074; x=1764358874; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=3pjutzIK0WiW+XdulceENNLOK4Jz7zwNzHoou3tlA8o=;
        b=c1jrSYaMaOJyWfmlicD/u2wyZ9fIDJEv565I7j010e9R3yzBkK6ojYbkld+2cp2gl2
         TRSfay9RqIT4CEbznXTx8q1oGmIvClTMqK1rAeviB8BNwYJczljubsNa9zDCFvwZHvWK
         tSJrF2ICaaBgRJS+ELfccpZPThlyWObERIgz/b3asn9kU5Mh4YQR4RfbSEjByxf9S6cN
         rYs6i/FZU95xJKx67Y0yOxLAln1CJSyN0svFAptTDHyP9IszzmwbXMFrU7W0D5HHS+ce
         HmWH8k94ktCMCpXiQCF6JzadeFqur6cLwLeOrv4GV6gqCxDOVBp24OwWpBmPiZ1K3gK/
         GYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763754074; x=1764358874;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3pjutzIK0WiW+XdulceENNLOK4Jz7zwNzHoou3tlA8o=;
        b=k5U7IRAZN4+FIhxE3un4ofNGobQYV9FLbTfBfNEzdQiduwaD/4UEdATREqvcuEF8LX
         o4G9FD1wyJq9NRhXBqLsewsxX9pZudK1KldGPPyQiGlErMvrAttnu7wYCVVxB9Z+5MJc
         nIVW5gXGvq6KHh8z+0YPy+YT816yCaMoU1Cu7i0djaIpgnkRFpJZR5D7I/lZqM9LXIuF
         4VPD5ql8bMVrzg84NUNEl67BWN4v55DJ6XqHRN0pSLCgnfcZIXAuwgdFiLQxJxQ6C2Ma
         WFcCqUWWXbg71JkNYzfq7/aTFfDkRPChUoLpybHBGC6HExsUtjAQ7vQAInk57zJgZ7ui
         cOuw==
X-Forwarded-Encrypted: i=1; AJvYcCVDO8YA34sDDZbTgKF/nTN3IY1bRGkqSoMPdE++XhSVQkWipRMNwu62SSri5naO/ybBF4MWyxaLI/JXpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJlm6TXz1Pyemi1SxdsCL4X6/G5L8fwd87pL3bZO40zIgasUp5
	u5xOZHE5nzBbmYTPWKXcFtYbkvMqqTBAACEw9jiJ1H9XNHPB2GEzb5Zyxwa4YQ==
X-Gm-Gg: ASbGncvPSVWYRBfs7vifmZZM1mljT6nXCw40Kn7eaiurEYcdxPnMpWgMXLuUj7DpQBo
	gTnum+HJY6O184P42PDewdRdoWH+RHyKJ1ZVwtWOlSEDck1Jtbfe+M4+sMOJHtW8+nPP3anDrPV
	TzJOJXOu8D8ZXWoMA7vhFL/75eZtQgJD9o8OtrOuqFKWzSOiVFxBIg8nx70nB694A2sSHI4D+aM
	Rh77qL3iDFD/TvtA1WrFfbw6eK5Yc5T1tzU3u3Ex9NZhULMA2cqaB5kxFGN56lisGBBCfv5vm6d
	3R5LRhgmSv4qkGkrMZx9WKO0BhiR81tTeogJTEP4MhsgU+O9ReRxR74SZ5xaCFzzZWXn8pVodTK
	eSB4bNuNyjvVpx20WGfef9PeDqW1UM1n6KDXd/Xiw9XTqV2OVctMPEWFcYQYImOUoXLYD4ErWEk
	V4c3e3WfUpGo2XyVXJkQD4BUU3idZXjw21kijbRCFYqQKShgAdR3FtkzLLDY8=
X-Google-Smtp-Source: AGHT+IHY1z0vN1Yg2jzSCnnDF9UTvJwtbV2yMkhtK+Tyyjw8SkThZabl5ZGv6acwZj+Q+7hVyNuZtw==
X-Received: by 2002:a05:6a20:6a09:b0:34f:99ce:4c31 with SMTP id adf61e73a8af0-36150f2bcaemr4034462637.46.1763754074306;
        Fri, 21 Nov 2025 11:41:14 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f02423f6sm6840255b3a.39.2025.11.21.11.41.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 11:41:13 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1420d635-5d12-402f-91c6-12cb79304352@roeck-us.net>
Date: Fri, 21 Nov 2025 11:41:12 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] hwmon: add support for MCP998X
To: victor.duicu@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, corbet@lwn.net
Cc: marius.cristea@microchip.com, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20251120071248.3767-1-victor.duicu@microchip.com>
 <20251120071248.3767-3-victor.duicu@microchip.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAmgrMyQFCSbODQkACgkQyx8mb86fmYGcWRAA
 oRwrk7V8fULqnGGpBIjp7pvR187Yzx+lhMGUHuM5H56TFEqeVwCMLWB2x1YRolYbY4MEFlQg
 VUFcfeW0OknSr1s6wtrtQm0gdkolM8OcCL9ptTHOg1mmXa4YpW8QJiL0AVtbpE9BroeWGl9v
 2TGILPm9mVp+GmMQgkNeCS7Jonq5f5pDUGumAMguWzMFEg+Imt9wr2YA7aGen7KPSqJeQPpj
 onPKhu7O/KJKkuC50ylxizHzmGx+IUSmOZxN950pZUFvVZH9CwhAAl+NYUtcF5ry/uSYG2U7
 DCvpzqOryJRemKN63qt1bjF6cltsXwxjKOw6CvdjJYA3n6xCWLuJ6yk6CAy1Ukh545NhgBAs
 rGGVkl6TUBi0ixL3EF3RWLa9IMDcHN32r7OBhw6vbul8HqyTFZWY2ksTvlTl+qG3zV6AJuzT
 WdXmbcKN+TdhO5XlxVlbZoCm7ViBj1+PvIFQZCnLAhqSd/DJlhaq8fFXx1dCUPgQDcD+wo65
 qulV/NijfU8bzFfEPgYP/3LP+BSAyFs33y/mdP8kbMxSCjnLEhimQMrSSo/To1Gxp5C97fw5
 3m1CaMILGKCmfI1B8iA8zd8ib7t1Rg0qCwcAnvsM36SkrID32GfFbv873bNskJCHAISK3Xkz
 qo7IYZmjk/IJGbsiGzxUhvicwkgKE9r7a1rOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAmgrMyQFCSbODQkACgkQyx8mb86fmYHlgg/9
 H5JeDmB4jsreE9Bn621wZk7NMzxy9STxiVKSh8Mq4pb+IDu1RU2iLyetCY1TiJlcxnE362kj
 njrfAdqyPteHM+LU59NtEbGwrfcXdQoh4XdMuPA5ADetPLma3YiRa3VsVkLwpnR7ilgwQw6u
 dycEaOxQ7LUXCs0JaGVVP25Z2hMkHBwx6BlW6EZLNgzGI2rswSZ7SKcsBd1IRHVf0miwIFYy
 j/UEfAFNW+tbtKPNn3xZTLs3quQN7GdYLh+J0XxITpBZaFOpwEKV+VS36pSLnNl0T5wm0E/y
 scPJ0OVY7ly5Vm1nnoH4licaU5Y1nSkFR/j2douI5P7Cj687WuNMC6CcFd6j72kRfxklOqXw
 zvy+2NEcXyziiLXp84130yxAKXfluax9sZhhrhKT6VrD45S6N3HxJpXQ/RY/EX35neH2/F7B
 RgSloce2+zWfpELyS1qRkCUTt1tlGV2p+y2BPfXzrHn2vxvbhEn1QpQ6t+85FKN8YEhJEygJ
 F0WaMvQMNrk9UAUziVcUkLU52NS9SXqpVg8vgrO0JKx97IXFPcNh0DWsSj/0Y8HO/RDkGXYn
 FDMj7fZSPKyPQPmEHg+W/KzxSSfdgWIHF2QaQ0b2q1wOSec4Rti52ohmNSY+KNIW/zODhugJ
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251120071248.3767-3-victor.duicu@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/19/25 23:12, victor.duicu@microchip.com wrote:
> From: Victor Duicu <victor.duicu@microchip.com>
> 
> This is the driver for Microchip MCP998X/33 and MCP998XD/33D
> Multichannel Automotive Temperature Monitor Family.
> 
> Signed-off-by: Victor Duicu <victor.duicu@microchip.com>
> ---
...
> +	if (priv->run_state) {
> +		if (priv->wait_before_read) {
> +			if (!time_after(jiffies, priv->time_limit))
> +				mdelay(jiffies_to_msecs(priv->time_limit - jiffies));

mdelay (busy wait) is kind of brutal.

> +			priv->wait_before_read = false;
> +		}
> +	} else {
> +		ret = regmap_write(priv->regmap, MCP9982_ONE_SHOT_ADDR, 1);
> +		if (ret)
> +			return ret;
> +
> +		/*
> +		 * In Standby state after writing in OneShot register wait for
> +		 * the start of conversion and then poll the BUSY bit.
> +		 */
> +		mdelay(MCP9982_WAKE_UP_TIME_MS);

Even more so here, where the busy wait is a whopping 125 ms. Please either use
usleep_range() or explain in detail why the busy wait is necessary. I can not really
imagine a situation where the power savings of running in OneShot mode would outweigh
125 ms of active CPU time.

Guenter

> +		ret = regmap_read_poll_timeout(priv->regmap, MCP9982_STATUS_ADDR,
> +					       reg_status, !(reg_status & MCP9982_STATUS_BUSY),
> +					       (mcp9982_update_interval[priv->interval_idx]) *
> +					       USEC_PER_MSEC, 0);

This is puzzling: There is no final timeout, meaning if the chip is stuck for some reason
the code will be stuck as well. At the same time, the code _will_ sleep here for a full
update interval befor echecking the status.

All this warrants a detailed explanation.

> +		if (ret)
> +			return ret;
> +	}
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_input:
> +			/*
> +			 * The Block Read Protocol first returns the number of user readable
> +			 * bytes, held in buff[0], followed by the data.
> +			 */
> +			ret = regmap_bulk_read(priv->regmap, MCP9982_TEMP_MEM_BLOCK_ADDR(channel),
> +					       &buff, sizeof(buff));
> +			if (ret)
> +				return ret;
> +
> +			*val = get_unaligned_be16(buff + 1) >> 5;
> +			*val = (*val - (MCP9982_OFFSET << 3)) * 125;
> +
> +			return 0;
> +		case hwmon_temp_max:
> +			if (channel)
> +				addr = MCP9982_EXT_HIGH_LIMIT_ADDR(channel);
> +			else
> +				addr = MCP9982_INTERNAL_HIGH_LIMIT_ADDR;
> +
> +			return mcp9982_read_limit(priv, addr, val);
> +		case hwmon_temp_max_alarm:
> +			mask = BIT(channel);
> +			*val = regmap_test_bits(priv->regmap, MCP9982_HIGH_LIMIT_STATUS_ADDR, mask);
> +			if (*val < 0)
> +				return *val;
> +
> +			return 0;
> +		case hwmon_temp_min:
> +			if (channel)
> +				addr = MCP9982_EXT_LOW_LIMIT_ADDR(channel);
> +			else
> +				addr = MCP9982_INTERNAL_LOW_LIMIT_ADDR;
> +
> +			return mcp9982_read_limit(priv, addr, val);
> +		case hwmon_temp_min_alarm:
> +			mask = BIT(channel);
> +			*val = regmap_test_bits(priv->regmap, MCP9982_LOW_LIMIT_STATUS_ADDR, mask);
> +			if (*val < 0)
> +				return *val;
> +
> +			return 0;
> +		case hwmon_temp_crit:
> +			return mcp9982_read_limit(priv, MCP9982_THERM_LIMIT_ADDR(channel), val);
> +		case hwmon_temp_crit_alarm:
> +			mask = BIT(channel);
> +			*val = regmap_test_bits(priv->regmap, MCP9982_THERM_LIMIT_STATUS_ADDR,
> +						mask);
> +			if (*val < 0)
> +				return *val;
> +
> +			return 0;
> +		default:
> +			return -EINVAL;
> +		}
> +	case hwmon_chip:
> +		switch (attr) {
> +		case hwmon_chip_update_interval:
> +			*val = mcp9982_update_interval[priv->interval_idx];
> +			return 0;
> +		default:
> +			return -EINVAL;
> +		}
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int mcp9982_read_label(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +			      int channel, const char **str)
> +{
> +	struct mcp9982_priv *priv = dev_get_drvdata(dev);
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_label:
> +			if (priv->labels[channel]) {
> +				*str = priv->labels[channel];
> +				return 0;
> +			} else {
> +				return -EOPNOTSUPP;
> +			}
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int mcp9982_write_limit(struct mcp9982_priv *priv, u8 address, long val)
> +{
> +	int ret;
> +
> +	/* Range is always -64 to 191.875°C. */
> +	val = clamp_val(val, -64000, 191875);
> +	val = (val + MCP9982_OFFSET * 1000) << 5;
> +	val = DIV_ROUND_CLOSEST(val, 125);
> +
> +	switch (address) {
> +	case MCP9982_INTERNAL_HIGH_LIMIT_ADDR:
> +	case MCP9982_INTERNAL_LOW_LIMIT_ADDR:
> +	case MCP9982_INTERNAL_THERM_LIMIT_ADDR:
> +	case MCP9982_EXT_1_THERM_LIMIT_ADDR:
> +	case MCP9982_EXT_2_THERM_LIMIT_ADDR:
> +	case MCP9982_EXT_3_THERM_LIMIT_ADDR:
> +	case MCP9982_EXT_4_THERM_LIMIT_ADDR:
> +		val = val >> 8;
> +		ret = regmap_write(priv->regmap, address, val);
> +		if (ret)
> +			return ret;
> +
> +		return 0;
> +	default:
> +		put_unaligned_be16(val, &val);

What is this supposed to do ? Trying to avoid a local 2-byte buffer ?

> +		ret = regmap_bulk_write(priv->regmap, address, &val, 2);
> +		if (ret)
> +			return ret;
> +
> +		return 0;
> +	}
> +}
> +
> +static int mcp9982_write(struct device *dev, enum hwmon_sensor_types type, u32 attr, int channel,
> +			 long val)
> +{
> +	struct mcp9982_priv *priv = dev_get_drvdata(dev);
> +	unsigned int previous_interval_idx, idx;
> +	bool use_previous_interval = false;
> +	unsigned long new_time_limit;
> +	u8 addr;
> +	int ret;
> +
> +	switch (type) {
> +	case hwmon_chip:
> +		switch (attr) {
> +		case hwmon_chip_update_interval:
> +			previous_interval_idx = priv->interval_idx;
> +
> +			/*
> +			 * For MCP998XD and MCP9933D update interval
> +			 * can't be slower than 1 second.
> +			 */
> +			if (priv->chip->hw_thermal_shutdown)
> +				val = clamp(val, 0, 1000);
> +
> +			idx = find_closest_descending(val, mcp9982_update_interval,
> +						      ARRAY_SIZE(mcp9982_update_interval));
> +
> +			ret = regmap_write(priv->regmap, MCP9982_CONV_ADDR, idx);
> +			if (ret)
> +				return ret;
> +
> +			priv->interval_idx = idx;
> +
> +			/*
> +			 * When changing the interval time in Run mode, wait a delay based
> +			 * on the previous value to ensure the new value becomes active.
> +			 */
> +			if (priv->run_state)
> +				use_previous_interval = true;
> +			else
> +				return 0;
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +		break;
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_max:
> +			if (channel)
> +				addr = MCP9982_EXT_HIGH_LIMIT_ADDR(channel);
> +			else
> +				addr = MCP9982_INTERNAL_HIGH_LIMIT_ADDR;
> +
> +			return ret = mcp9982_write_limit(priv, addr, val);
> +		case hwmon_temp_min:
> +			if (channel)
> +				addr = MCP9982_EXT_LOW_LIMIT_ADDR(channel);
> +			else
> +				addr = MCP9982_INTERNAL_LOW_LIMIT_ADDR;
> +
> +			return mcp9982_write_limit(priv, addr, val);
> +		case hwmon_temp_crit:
> +			return mcp9982_write_limit(priv, MCP9982_THERM_LIMIT_ADDR(channel), val);
> +		default:
> +			return -EINVAL;
> +		}
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * Calculate the time point when it would be safe to read after
> +	 * the current write operation in Run mode.
> +	 * If, for example, we change update interval from a slower time
> +	 * to a faster time, the change will become active after the
> +	 * conversion with the slower time is finished. If we read before
> +	 * the end of conversion, the value will be from the previous cycle.
> +	 */
> +	if (use_previous_interval) {
> +		new_time_limit = msecs_to_jiffies(mcp9982_update_interval[previous_interval_idx]);
> +		use_previous_interval = false;
> +	} else {
> +		new_time_limit = msecs_to_jiffies(mcp9982_update_interval[priv->interval_idx]);
> +	}
> +
> +	new_time_limit += jiffies + msecs_to_jiffies(MCP9982_CONVERSION_TIME_MS);
> +
> +	if (time_after(new_time_limit, priv->time_limit)) {
> +		priv->time_limit = new_time_limit;
> +		priv->wait_before_read = true;
> +	}
> +
> +	return 0;
> +}
> +
> +static umode_t mcp9982_is_visible(const void *_data, enum hwmon_sensor_types type, u32 attr,
> +				  int channel)
> +{
> +	const struct mcp9982_priv *priv = _data;
> +
> +	if (!test_bit(channel, &priv->enabled_channel_mask))
> +		return 0;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_label:
> +			if (priv->labels[channel])
> +				return 0444;
> +			else
> +				return 0;
> +		case hwmon_temp_input:
> +		case hwmon_temp_min_alarm:
> +		case hwmon_temp_max_alarm:
> +		case hwmon_temp_crit_alarm:
> +			return 0444;
> +		case hwmon_temp_min:
> +		case hwmon_temp_max:
> +		case hwmon_temp_crit:
> +			return 0644;
> +		default:
> +			return 0;
> +		}
> +	case hwmon_chip:
> +		switch (attr) {
> +		case hwmon_chip_update_interval:
> +			return 0644;
> +		default:
> +			return 0;
> +		}
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static const struct hwmon_ops mcp9982_hwmon_ops = {
> +	.is_visible = mcp9982_is_visible,
> +	.read = mcp9982_read,
> +	.read_string = mcp9982_read_label,
> +	.write = mcp9982_write,
> +};
> +
> +static int mcp9982_init(struct device *dev, struct mcp9982_priv *priv)
> +{
> +	unsigned int i;
> +	int ret;
> +	u8 val;
> +
> +	/* Chips 82/83 and 82D/83D do not support anti-parallel diode mode. */
> +	if (!priv->chip->allow_apdd && priv->apdd_enable == 1)
> +		return dev_err_probe(dev, -EINVAL, "Incorrect setting of APDD.\n");
> +
> +	/* Chips with "D" work only in Run state. */
> +	if (priv->chip->hw_thermal_shutdown && !priv->run_state)
> +		return dev_err_probe(dev, -EINVAL, "Incorrect setting of Power State.\n");
> +
> +	/*
> +	 * For chips with "D" in the name, resistance error correction must be on
> +	 * so that hardware shutdown feature can't be overridden.
> +	 */
> +	if (priv->chip->hw_thermal_shutdown)
> +		if (!priv->recd34_enable || !priv->recd12_enable)
> +			return dev_err_probe(dev, -EINVAL, "Incorrect setting of RECD.\n");
> +
> +	/*
> +	 * Set default values in registers.
> +	 * APDD, RECD12 and RECD34 are active on 0.
> +	 */
> +	val = FIELD_PREP(MCP9982_CFG_MSKAL, 1) |
> +	      FIELD_PREP(MCP9982_CFG_RS, !priv->run_state) |
> +	      FIELD_PREP(MCP9982_CFG_ATTHM, 1) |
> +	      FIELD_PREP(MCP9982_CFG_RECD12, !priv->recd12_enable) |
> +	      FIELD_PREP(MCP9982_CFG_RECD34, !priv->recd34_enable) |
> +	      FIELD_PREP(MCP9982_CFG_RANGE, 1) | FIELD_PREP(MCP9982_CFG_DA_ENA, 0) |
> +	      FIELD_PREP(MCP9982_CFG_APDD, !priv->apdd_enable);
> +
> +	ret = regmap_write(priv->regmap, MCP9982_CFG_ADDR, val);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(priv->regmap, MCP9982_CONV_ADDR, MCP9982_DEFAULT_CONV_VAL);
> +	if (ret)
> +		return ret;
> +	priv->interval_idx = MCP9982_DEFAULT_CONV_VAL;
> +
> +	ret = regmap_write(priv->regmap, MCP9982_HYS_ADDR, MCP9982_DEFAULT_HYS_VAL);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(priv->regmap, MCP9982_CONSEC_ALRT_ADDR, MCP9982_DEFAULT_CONSEC_ALRT_VAL);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(priv->regmap, MCP9982_RUNNING_AVG_ADDR, 0);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(priv->regmap, MCP9982_HOTTEST_CFG_ADDR, 0);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Only external channels 1 and 2 support beta compensation.
> +	 * Set beta auto-detection.
> +	 */
> +	for (i = 1; i < 3; i++)
> +		if (test_bit(i, &priv->enabled_channel_mask)) {
> +			ret = regmap_write(priv->regmap, MCP9982_EXT_BETA_CFG_ADDR(i),
> +					   MCP9982_BETA_AUTODETECT);
> +			if (ret)
> +				return ret;
> +		}
> +
> +	/* Set default values for internal channel limits. */
> +	if (test_bit(0, &priv->enabled_channel_mask)) {
> +		ret = mcp9982_write_limit(priv, MCP9982_INTERNAL_HIGH_LIMIT_ADDR,
> +					  MCP9982_HIGH_LIMIT_DEFAULT);
> +		if (ret)
> +			return ret;
> +
> +		ret = mcp9982_write_limit(priv, MCP9982_INTERNAL_LOW_LIMIT_ADDR,
> +					  MCP9982_LOW_LIMIT_DEFAULT);
> +		if (ret)
> +			return ret;
> +
> +		ret = mcp9982_write_limit(priv, MCP9982_THERM_LIMIT_ADDR(0),
> +					  MCP9982_HIGH_LIMIT_DEFAULT);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/* Set ideality factor and limits to default for external channels. */
> +	for (i = 1; i < MCP9982_MAX_NUM_CHANNELS; i++)
> +		if (test_bit(i, &priv->enabled_channel_mask)) {
> +			ret = regmap_write(priv->regmap, MCP9982_EXT_IDEAL_ADDR(i),
> +					   MCP9982_IDEALITY_DEFAULT);
> +			if (ret)
> +				return ret;
> +
> +			ret = mcp9982_write_limit(priv, MCP9982_EXT_HIGH_LIMIT_ADDR(i),
> +						  MCP9982_HIGH_LIMIT_DEFAULT);
> +			if (ret)
> +				return ret;
> +
> +			ret = mcp9982_write_limit(priv, MCP9982_EXT_LOW_LIMIT_ADDR(i),
> +						  MCP9982_LOW_LIMIT_DEFAULT);
> +			if (ret)
> +				return ret;
> +
> +			ret = mcp9982_write_limit(priv, MCP9982_THERM_LIMIT_ADDR(i),
> +						  MCP9982_HIGH_LIMIT_DEFAULT);
> +			if (ret)
> +				return ret;
> +		}
> +
> +	priv->wait_before_read = false;
> +	priv->time_limit = jiffies;
> +
> +	return 0;
> +}
> +
> +static int mcp9982_parse_fw_config(struct device *dev, int device_nr_channels)
> +{
> +	unsigned int reg_nr;
> +	struct mcp9982_priv *priv = dev_get_drvdata(dev);
> +	int ret;
> +
> +	/* Initialise internal channel( which is always present ). */
> +	priv->labels[0] = "internal diode";
> +	priv->enabled_channel_mask = 1;
> +
> +	/* Default values to work on systems without devicetree or firmware nodes. */
> +	if (!dev_fwnode(dev)) {
> +		priv->num_channels = device_nr_channels;
> +		priv->enabled_channel_mask = BIT(priv->num_channels) - 1;
> +		priv->apdd_enable = false;
> +		priv->recd12_enable = true;
> +		priv->recd34_enable = true;
> +		priv->run_state = true;
> +		return 0;
> +	}
> +
> +	priv->apdd_enable =
> +		device_property_read_bool(dev, "microchip,enable-anti-parallel");
> +
> +	priv->recd12_enable =
> +		device_property_read_bool(dev, "microchip,parasitic-res-on-channel1-2");
> +
> +	priv->recd34_enable =
> +		device_property_read_bool(dev, "microchip,parasitic-res-on-channel3-4");
> +
> +	priv->run_state =
> +		device_property_read_bool(dev, "microchip,power-state");
> +
> +	priv->num_channels = device_get_child_node_count(dev) + 1;
> +
> +	if (priv->num_channels > device_nr_channels)
> +		return dev_err_probe(dev, -E2BIG,
> +				     "More channels than the chip supports.\n");
> +
> +	/* Read information about the external channels. */
> +	device_for_each_child_node_scoped(dev, child) {
> +		reg_nr = 0;
> +		ret = fwnode_property_read_u32(child, "reg", &reg_nr);
> +		if (ret || !reg_nr || reg_nr >= device_nr_channels)
> +			return dev_err_probe(dev, -EINVAL,
> +			  "Channel reg is incorrectly set.\n");
> +
> +		fwnode_property_read_string(child, "label", &priv->labels[reg_nr]);
> +		set_bit(reg_nr, &priv->enabled_channel_mask);
> +	}
> +
> +	return 0;
> +}
> +
> +static int mcp9982_probe(struct i2c_client *client)
> +{
> +	struct hwmon_chip_info mcp998x_chip_info;
> +	const struct mcp9982_features *chip;
> +	struct device *dev = &client->dev;
> +	struct mcp9982_priv *priv;
> +	struct device *hwmon_dev;
> +	int ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(struct mcp9982_priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->regmap = devm_regmap_init_i2c(client, &mcp9982_regmap_config);
> +
> +	if (IS_ERR(priv->regmap))
> +		return dev_err_probe(dev, PTR_ERR(priv->regmap),
> +				     "Cannot initialize register map.\n");
> +
> +	dev_set_drvdata(dev, priv);
> +
> +	chip = i2c_get_match_data(client);
> +	if (!chip)
> +		return -EINVAL;
> +	priv->chip = chip;
> +
> +	ret = mcp9982_parse_fw_config(dev, chip->phys_channels);
> +	if (ret)
> +		return ret;
> +
> +	ret = mcp9982_init(dev, priv);
> +	if (ret)
> +		return ret;
> +
> +	mcp998x_chip_info.ops = &mcp9982_hwmon_ops;
> +	mcp998x_chip_info.info = mcp9985_info;
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, chip->name, priv,
> +							 &mcp998x_chip_info, NULL);
> +
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static const struct i2c_device_id mcp9982_id[] = {
> +	{ .name = "mcp9933", .driver_data = (kernel_ulong_t)&mcp9933_chip_config },
> +	{ .name = "mcp9933d", .driver_data = (kernel_ulong_t)&mcp9933d_chip_config },
> +	{ .name = "mcp9982", .driver_data = (kernel_ulong_t)&mcp9982_chip_config },
> +	{ .name = "mcp9982d", .driver_data = (kernel_ulong_t)&mcp9982d_chip_config },
> +	{ .name = "mcp9983", .driver_data = (kernel_ulong_t)&mcp9983_chip_config },
> +	{ .name = "mcp9983d", .driver_data = (kernel_ulong_t)&mcp9983d_chip_config },
> +	{ .name = "mcp9984", .driver_data = (kernel_ulong_t)&mcp9984_chip_config },
> +	{ .name = "mcp9984d", .driver_data = (kernel_ulong_t)&mcp9984d_chip_config },
> +	{ .name = "mcp9985", .driver_data = (kernel_ulong_t)&mcp9985_chip_config },
> +	{ .name = "mcp9985d", .driver_data = (kernel_ulong_t)&mcp9985d_chip_config },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, mcp9982_id);
> +
> +static const struct of_device_id mcp9982_of_match[] = {
> +	{
> +		.compatible = "microchip,mcp9933",
> +		.data = &mcp9933_chip_config,
> +	}, {
> +		.compatible = "microchip,mcp9933d",
> +		.data = &mcp9933d_chip_config,
> +	}, {
> +		.compatible = "microchip,mcp9982",
> +		.data = &mcp9982_chip_config,
> +	}, {
> +		.compatible = "microchip,mcp9982d",
> +		.data = &mcp9982d_chip_config,
> +	}, {
> +		.compatible = "microchip,mcp9983",
> +		.data = &mcp9983_chip_config,
> +	}, {
> +		.compatible = "microchip,mcp9983d",
> +		.data = &mcp9983d_chip_config,
> +	}, {
> +		.compatible = "microchip,mcp9984",
> +		.data = &mcp9984_chip_config,
> +	}, {
> +		.compatible = "microchip,mcp9984d",
> +		.data = &mcp9984d_chip_config,
> +	}, {
> +		.compatible = "microchip,mcp9985",
> +		.data = &mcp9985_chip_config,
> +	}, {
> +		.compatible = "microchip,mcp9985d",
> +		.data = &mcp9985d_chip_config,
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, mcp9982_of_match);
> +
> +static struct i2c_driver mcp9982_driver = {
> +	.driver	 = {
> +		.name = "mcp9982",
> +		.of_match_table = mcp9982_of_match,
> +	},
> +	.probe = mcp9982_probe,
> +	.id_table = mcp9982_id,
> +};
> +module_i2c_driver(mcp9982_driver);
> +
> +MODULE_AUTHOR("Victor Duicu <victor.duicu@microchip.com>");
> +MODULE_DESCRIPTION("MCP998X/33 and MCP998XD/33D Multichannel Automotive Temperature Monitor Driver");
> +MODULE_LICENSE("GPL");

