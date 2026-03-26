Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055B719C542
	for <linux-hwmon@vger.kernel.org>; Thu, 26 Mar 2026 23:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774568977; cv=none; b=Yb1pQVkXNGVlskraEJRM2a3t7zfM5QRtXAjbYqto2rW5LGAXagNmiON2THZZ3EBPs48/FzWnLQgakJCCpXpZErVHUdEIGDjqwNMFLsYGRFPbEHrjQXr+J97erZ0R7wgl/QWO5tPX4/lK+1nEN7rIp7gVPkixBtL9vSB3Kcy9XfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774568977; c=relaxed/simple;
	bh=uGmspR4vNrQNvr3HOt0tgKPG2uwz1AjlwYP0U944fes=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lGkb3FcxtkAyfXP5OraAa/79uTjxoO3eZD2nl8/argzhJAxs3wTZNoTwTZTJVy61JeSfmxYfhUr/tvhLqkFixqOH++yOlAvzoEQ2/JuYvdWJAwJSLuYxRTjmzdJYjBdwV1oFIu8/CvUpHzkVrvrrnwx2sRRs1Y1ZYLRhM292Fk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S4T5KOJN; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S4T5KOJN"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so2944233eec.1
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Mar 2026 16:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774568974; x=1775173774; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=vGvYVB6qrroywI4wxkAFEjT+jivzJm3L/OcASEJMVhM=;
        b=S4T5KOJNBdd9EeUzrn0UgN8q1vlByEUBz0XfPOVJjpbSAblJMZSVsUJgw4nDzOVOpi
         vP0amK5dEMSN/yeXgKJESKvaG94RBGn4r5VwxB7Y/bKjVYoqgGcCLfLhhRmQBmDIQHma
         yrFT7lunJ5uZVw2mWpmAqnOSDMDjKW92voMmBraaYvtGVqiiIcvwlHlWGOtihnqKNnsd
         h5rXIFSvzuZXMlilg42943YJ2Q1BpkjCvjaA62M2jwHr05a2QKwsHA/GKeYuBRyUbtnU
         VeGo2dM67CIpY9WzSvWpbNOVb9oo0qdR5k0kYZH/YctpScpb6BtTXafObIIwNLF8P1Am
         GUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774568974; x=1775173774;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vGvYVB6qrroywI4wxkAFEjT+jivzJm3L/OcASEJMVhM=;
        b=OikJMeUhzIN3Bu7lFz+oHoInVIHrHDUjPOjcGb85U6p2PyQop92NEfS3YRh1FPxbuq
         G0xsyUKGIiIEZqTKj2nlSJF+7EfWmRwyYeodS+AFIGuk6UNpZx2/aU+PIoI2bvmMA6Xs
         a019tVmF5DMuH33lm4uMOlMTB/Bk4gVYY3fVlWyus3rzYnCM2BS29mf9r6KvKtMndBwD
         CTyS5XKKWqWkxD76BVQgBr7pxGEU81iBv0mZZH+nmr7F0aRh6iYUDTW7X0GIcSRABOBY
         mfl0KnyXjNVfkea1sxuxF1+LQDya3jvMiQP/H5sVZ7vKatq09OaHEmo2rij44kYRaVJd
         leUA==
X-Gm-Message-State: AOJu0Ywiez9Whny1u9hEueF6KvAMCcPxI9xmaBLl0OcVoUJGUqPPHKuc
	ryCShvueuEHDXrukop4jw+bGg0Y+u4DIApLljHRfO4Ize412paYRs2mf
X-Gm-Gg: ATEYQzyTQYe7JYRgE2mV7zkUEliwpgNJGXX27pOCR9qzQ9jjJVVHemMPPpcjoJ8SYc0
	wEHEJ929MKY+ZMWNGOH+Bvucl9SZqtgSsfSjyfrPlDN3Ech8lVyA79rSQpWHh0TeW/T90vM+VK0
	Yol5kSoSk5oJOjQ8M6v7/sxk2oEojF8azXU4zhissXPhjn0HqIvLRsz3ydMTPw5FGVPLGbFQZK0
	GlRVTfrikKwdgwFngq/EjOvl8a6O/X3ksBeIxMg0XiZ4dMfKNbDr/s901ITYikeIqK3uH1N8btY
	cRQkGD7xwp7CUkrE3pltJ8U5BEjbQsmLXPnab5/KHVFZnIiGJu/DVfxhs6vmzM0rEp7YO0+V7Xg
	rwvJybprhF2aOO63MZt8Qy8hx8z7R1a77v1a8ffs1WMENFFzsL8Kdcj8sMRNKh0qsOm2ygZREKk
	n5kiePP8QH0Yx0t4UU4HUmZuFvXLhBI27ch5B3klayUdHkNc+lSh1rdVAWq7Iryx/d1rfCbbio
X-Received: by 2002:a05:7300:fb8b:b0:2ae:5bde:a5c5 with SMTP id 5a478bee46e88-2c185fac4d3mr319695eec.30.1774568973944;
        Thu, 26 Mar 2026 16:49:33 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ec258c6sm3903961eec.4.2026.03.26.16.49.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 16:49:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d374b465-0d57-4154-8cba-7b7d1144db1d@roeck-us.net>
Date: Thu, 26 Mar 2026 16:49:31 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Add support for Texas Instruments INA4230 power
 monitor
To: Alexey Charkov <alchark@flipper.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260326-ina4230-v4-0-c1e312c09de7@flipper.net>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260326-ina4230-v4-0-c1e312c09de7@flipper.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/26/26 12:58, Alexey Charkov wrote:
> TI INA4230 is a 4-channel power monitor with I2C interface, similar in
> operation to INA3221 (3-channel) and INA219 (single-channel) but with
> a different register layout, different alerting mechanism and slightly
> different support for directly reading calculated current/power/energy
> values (pre-multiplied by the device itself and needing only to be scaled
> by the driver depending on its selected LSB unit values).
> 
> In this initial implementation, the driver supports reading voltage,
> current, power and energy values, but does not yet support alerts, which
> can be added separately if needed. Also the overflows during hardware
> calculations are not yet handled, nor is the support for the device's
> internal 32-bit energy counter reset.
> 
> An example device tree using this binding and driver is available at [1]
> (not currently upstreamed, as the device in question is in engineering
> phase and not yet publicly available)
> 
> [1] https://github.com/flipperdevices/flipper-linux-kernel/blob/flipper-devel/arch/arm64/boot/dts/rockchip/rk3576-flipper-one-rev-f0b0c1.dts
> 
> Signed-off-by: Alexey Charkov <alchark@flipper.net>

More feedback from Sashiko:

https://sashiko.dev/#/patchset/20260326-ina4230-v4-0-c1e312c09de7%40flipper.net

I can not comment on the devicetree feedback, but the driver
concerns seem real. Please take a look.

Thanks,
Guenter

> ---
> Changes in v4:
> - Aligned the maximum value of ti,maximum-expected-current-microamp property
>    in the binding with the one expected by the driver (Guenter Roeck)
>    "2147A ought to be enough for anybody (c)"
> - Actually requested the optional vs-supply regulator in the driver (Guenter Roeck)
> - Program the ALERT_POL bit according to the value of ti,alert-polarity-active-high
>    even though the alerts themselves are not yet implemented (Guenter Roeck)
> - Added a check for manually disabled channels in the is_enabled() function to
>    avoid reading invalid data from them (Guenter Roeck)
> - Dropped support for the single-shot mode as its operation is not clearly
>    documented in the datasheet and there is no pressing need to support it (Guenter Roeck)
> - NB: AI feedback regarding regmap_noinc_read() producing incorrect byte order on LE
>    hosts is incorrect, as its implementation does a byte-wise read and doesn't care
>    about the regmap value width or endianness flags, so it produces a 4-byte output
>    buffer in the same byte order as the device returns, which is BE in this case
> - NB: AI feedback regarding fail-path pm_runtime_put_noidle() potentially being
>    unbalanced if the probe loop failed early is technically correct but practically
>    irrelevant, as the driver will simply fail to load, and the usage count won't
>    decrease beyond zero anyway. The alternatives are cumbersome for no real benefit
> - Link to v3: https://lore.kernel.org/r/20260310-ina4230-v3-0-06ab3a77c570@flipper.net
> 
> Changes in v3:
> - Updated the description of the ti,maximum-expected-current-microamp property
>    in the binding to clarify how it is used, and drop the irrelevant mention of
>    the PMbus (Guenter Roeck)
> - Use div64_u64() instead of do_div() for the final division in the calibration value
>    calculation to avoid overflows in the denominator (Guenter Roeck)
> - Avoid overflow while scaling the voltage values on 32-bit platforms (Guenter Roeck)
> - Use regmap_noinc_read() instead of regmap_raw_read() for reading the energy values
>    to ensure that the regmap / bus driver don't wander off to adjacent registers
>    during the read operation (on INA4230 the whole 32 bits should be read from
>    the same register offset) (Guenter Roeck)
> - Remove redundant call to ina4230_set_calibration() in the current read path,
>    as the calibration value is already set when enabling the channel and restored
>    across PM changes via regcache_sync() (Guenter Roeck)
> - Add missing write_enable() function to make hwmon_in_enable writes work as
>    advertised in is_visible() (Guenter Roeck)
> - Add a check for disabled channels before calling pm_runtime_put_noidle() on them
>    to avoid refcount underflow due to imbalanced get_sync/put_noidle calls (Guenter Roeck)
> - Dropped unused include of linux/debugfs.h
> - Add missing return checks on regmap_write() calls
> - uO -> uOhm in the error message to avoid confusion
> - Move probe-time calibration after enabling runtime PM to avoid it being reverted
>    by the PM sync
> - Link to v2: https://lore.kernel.org/r/20260302-ina4230-v2-0-55b49d19d2ab@flipper.net
> 
> Changes in v2:
> - Replace u64/u64 division with do_div() (kernel test robot)
> - Add an example with ti,maximum-expected-current-microamp property in
>    bindings (Krzysztof Kozlowski)
> - Include the newly added binding in MAINTAINERS file (Krzysztof Kozlowski)
> - Use dev_err_probe() where appropriate in the driver (Krzysztof Kozlowski)
> - Switch to devm_regmap_field_bulk_alloc() instead of an open-coded loop
> - Add a bounds check for the calculated calibration value,
>    and a corresponding error message
> - Link to v1: https://lore.kernel.org/r/20260225-ina4230-v1-0-92b1de981d46@flipper.net
> 
> ---
> Alexey Charkov (2):
>        dt-bindings: hwmon: Add TI INA4230 4-channel I2C power monitor
>        hwmon: Add support for TI INA4230 power monitor
> 
>   .../devicetree/bindings/hwmon/ti,ina4230.yaml      |  134 +++
>   MAINTAINERS                                        |    7 +
>   drivers/hwmon/Kconfig                              |   11 +
>   drivers/hwmon/Makefile                             |    1 +
>   drivers/hwmon/ina4230.c                            | 1032 ++++++++++++++++++++
>   5 files changed, 1185 insertions(+)
> ---
> base-commit: 66ba480978ce390e631e870b740a3406e3eb6b01
> change-id: 20260219-ina4230-74a02409153d
> 
> Best regards,

