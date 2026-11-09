Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794217945;
	b=zYbpiwMMl2XEI6q3CCC5fTEXR6OmIpyF+ujN/sAP0HZvBymNYnmnh3uDJCsD9QIm58Zq
	 vTVkKkUY/6lGmdwaPNc14+UjBLbOsVxVcyILH99QN+UCTuvHOW11i8T8jZKuGlBJ1N+gW
	 iR8SZtjKzSDY/ftm89L0iEvLsKuGGOdjjzj5GGSoLwzPsJD6YAcxcKPLAl42kbQdAd8ax
	 jvAWV31BKiSH8oj3FRu+8UQ3L6NRN1MvUFMtmRy/XiXgrVL1wXoSFBJyAU9W9rVPCLjYi
	 u27tje7jOizm+SWGlQWYGBOCp2wtm4FOXc9MNEbITErQFNacP9qlyv1tpwG692t0/0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=wtoCZMcVn2T9YB+j55mhrbVUyFtxMXctjTorVf5q3Y4=;
	b=ANyHsmy5wM+2aA0xGJnsY65aBhAWM8yUq7iqsaP54+Bnbp/glTsAo4kz6WYnvF8Q7GyI
	 8WrFCbsI9rY4MtuJKeyy8e2w1GPAYO+G2buEzn+eE3t0q2bpkpIX9BiiJbXnshN0uekCM
	 T3XdBhziLK2ub0pboIGQcIqBKUBwdRklHHvouVFg6v4IjIgE3ftiM1Cq0X9AAOz+DRshd
	 PcA6rAmpQ1+WPYrJfnSQp6x3kIj6mOvVMPtHogsiyHe38vZtogyhrJ4Q5gg5khObfBmKA
	 DeUSQCPdDJre3aj5kEUMym3kxfmAIxA2jmUtmcfXaddJ9SXbdVWDPeNZEX1bahq9lhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nJ5FeZwy;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D7A606A33D
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 09:52:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74D7A606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nJ5FeZwy
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so397745f8f.3
        for <linux-hwmon@vger.kernel.org>; Mon, 09 Nov 2026 01:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794217944; x=1794822744; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wtoCZMcVn2T9YB+j55mhrbVUyFtxMXctjTorVf5q3Y4=;
        b=nJ5FeZwyu5udRK6QHO1ZH8265aQKl07zwAD0rqFlT+v7K7Xz6RSKCyxKTd0SmMc5kw
         /2IToIaHSYBJJnrp2VaI3L+0SYoF3eNrwzm7exCOhiKOUXgyze/S23B6DFBi3LN/HhW/
         UoT8P3gl3iGOSTD83jFBhzMufriexVwUB22DlabS/L4RaKSE5EdF6KEthjE9MSw5x8NV
         12PbHjIRCpMFgRayD3nApzQCtil1dHlSyqpnmQcidgsjC5CAGUsDKwMBFz8lYCwiFLvj
         4tHoneMTDio9tdnLDTexY+E0QlUAsgWNIqNADu6s9SfzH3fUh/K/Hghgqntn0rqX+bMP
         QjCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794217944; x=1794822744;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wtoCZMcVn2T9YB+j55mhrbVUyFtxMXctjTorVf5q3Y4=;
        b=eHINY0X5gLLC7J25afCrCEaYb+8qvK2JUXsKW+gOxRDgQa+TUXHwl/Aq0gWC2uMOhe
         6VXDlnrSAE2+69XGMcdRc+X3bazAq+LnyRllIiUfDcZ4PpO9qSfhNadRXmwNJ0AIoPmK
         GrXxrM8zHpjSrtaQkowLuQIgr+vmePAihRfdFX597h8CdT/nPoXk9LR40CCENvAGnjfy
         eYZjk0lgHIHLpygb589Sh+4raWDg916OKiuzzl/Ml+gTLPf0IKXgEOeZt2lpUxs2KpHt
         I+7xDLmDjlCPKhclFOtfb32CGYNzjq1DDcjfwLF8LOWK20GlDrkUFWQqDB3tdcj4/Dvl
         zAEg==
X-Forwarded-Encrypted: i=1; AL+hErF1Ltax4bXNYMIVoCr55Xg9PSWjYZUFjRtCt0nKQ0wZYQc+uLSe/jHBYXR9Qcnu/uYkafwHDSKlXN5now==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Z0mb/qxoZxx9dzOXlTLV2SZfOr2f8r35oAJ05PpMtf830dLrb
	4ALT8tMK4wwxZD2vHoeIGFhv/ZTliXjdGFecBZ5d4nGNkTsxVSYq392vv73M7M7wJFo=
X-Gm-Gg: AYBFou24XE57UYzLS91ZNA+yG+nTEg4EIgBsJScaSfU/08ktCakrdZH0+8m14bgEGAy
	gdpxLCXtp7hFeaAYX3k99+HFrgtDB9VeQXyPaNXxAyTc2s9W+u9QTuDfV443u6pDQT1mlbm2pyv
	7aIDqy/gaOIT8+GVcu6V7I7IowXzGQvx0xIiAhuvZzt/IWcQcGURknMHoNf16VnxsqL4srxs3o5
	GEYSmJRMn13u/v1QJrXj8aqwxXMIu/D6X6bjf4hjzQ33WgPfeQhE9IcO00115Xbz/VTezFiyyMW
	rCatL9o2W8NcDhhm+bJYZVOz1xrwzs7ZnIN1iUMmL/VxRJ2FQvxqM8PL4MbqQ6p0pzqGTTrwONI
	eo2khF2o6MJ3Oh/04VIDAYGb3tNoxPP4rRshHOfcTFgI4RYi+R3Gjvo6cxDRHG0aytWVWCU8Nq5
	z/+7/9Iyq6xtYYni5Ssfvb6uAqJLvlWWHpyTd2GK6C5tqnOz7QsSJag/n1hfM5/6umNbRwhuxlR
	PCi2LVesIBjyy9uAo4DJvzLCal0bOxX/0Vlazns5RfhWOaLgspKTiklrWpJhFw17JVeORDt8NJB
	PTeNDL2nsC1hnDhmrbTe3Bnt+I7j/cVpgfLYz4EHdXrhQLMrgjfXmzTzqNUE9oe/0YeVS2ZL4cg
	x3u8WiTFh
X-Received: by 2002:a05:6000:26c6:b0:48e:66d0:664c with SMTP id ffacd0b85a97d-49582e8e524mr7178441f8f.15.1794217943707;
        Mon, 09 Nov 2026 01:52:23 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:6762:47bb:1e06:ff70? ([2a01:e0a:106d:1080:6762:47bb:1e06:ff70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959011c995sm8903729f8f.0.2026.11.09.01.52.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 01:52:23 -0800 (PST)
Message-ID: <51eaa37a-9634-42cb-9aac-4c842ab2af07@linaro.org>
Date: Mon, 9 Nov 2026 10:52:22 +0100
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
Subject: Re: [PATCH v5 0/3] iio: adc: add support for the MAX34417
 Four-Channel High Dynamic Range Power Accumulator
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux@analog.com,
 Conor Dooley <conor.dooley@microchip.com>,
 Marius Cristea <marius.cristea@microchip.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20261102-topic-sm8x50-iio-max34417-adc-v5-0-0ffa5e5f2d5c@linaro.org>
 <20261104021700.14e69abb@jic23-hlaptop>
 <01fe2a71-ba6f-470b-b6bf-e536a1013b09@linaro.org>
 <20261107230925.5e66b234@jic23-hlaptop>
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
In-Reply-To: <20261107230925.5e66b234@jic23-hlaptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/8/26 00:09, Jonathan Cameron wrote:
> On Wed, 4 Nov 2026 09:45:02 +0100
> Neil Armstrong <neil.armstrong@linaro.org> wrote:

<snip>

>> But for the other reports:
>> - [Medium] iio: adc: max34417: shared accumulators clobbered on CAM power/energy read
>>
>> This is a tough one, today if either we read power or energy, we erase the accumulated
>> power+count in the context, the context accumulator is only here to make sure we don't
>> loose data from other channels, like if we had a single HW channel.
>> This simulates this, if we had a single HW channel, at each UPDATE we would get back
>> to 0 in hardware anyway if we did read the power or energy.
> 
> 
> I'm only half understanding this.  Let me see...
> 
> I'd expect userspace to see accumulated values since we enabled the channel
> rather than since last read.  I think that's the final suggestion from
> sashiko.

Oh this changes quite a lot of things.
How do we handle overflow in this case ? we disable the channel and enable again to reset the state ?

> 
>>
>> - [Medium] iio: adc: max34417: missing 1 ms delay between UPDATE commands
>>
>> It's unclear if we need to wait 1ms in CAM mode, I think we should but should we block
>> from the read if we are under the 1ms ?
> 
> I'll go with probably?

Ack

> 
>>
>> - [Medium] iio: adc: max34417: scale truncation and mJ unit in max34417_read_raw()
>>
>> Ok this one may be real, should we return Joules or milliJoules ? If so we could
>> fix our precision issue.
> 
> Units in the ABI are joules, so if you want to return in millijoules you will need
> scale to incorporate the extra factor of 1000.  Hmm. The comments suggest
> that today it is using milijoules?  If so that needs fixing.
> 
> Our units are a bit messy as many years ago I started with what hwmon had before
> concluding they were tricky to keep insistent. So what the base units are tends
> to be dependent on when the channel type was added.  More recent ones are the SI
> unit in most cases.

Ack

> 
> 
>>
>> - [Medium] iio: adc: max34417: missing UPDATE before CAM in max34417_setup_cam_mode()
>>
>> It's highly improbable, but I'll fix it.
>>
>> - [Low] iio: adc: max34417: reuse max34417_reset_smm() in max34417_trigger_smm()
>>
>> I'll check if it's worth it
>>
>> Thanks,
>> Neil
> 

Thanks,
Neil
