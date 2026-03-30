Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83604377EA1
	for <linux-hwmon@vger.kernel.org>; Mon, 30 Mar 2026 16:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886855; cv=none; b=mXvTNmJFjxtE32Y6hZbieht5Xd3UzYTZ2ONh7CUCkiF+gFIxPgcZAGPu5FQ18lOIJRqTTUwsQD+oN0Oozu0J1Ofgzr3NgrJI9aKJe1i7Hed67xgXeLipiqHdmLphUyyTs6HCl4n5llj48N/5JOoBTDQvw88rkT7aFDPSPeLFdus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886855; c=relaxed/simple;
	bh=bG7U93jJf53GxXgWUyzlK9V1bJxy4rRb8t7Xb1QpP7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FKLTDd8Jk1pZJdvdQlhR6DsbF9PLwFHbt5qgNRkmPIvq6V7lWdNUOJn/fw/GqZO3Wsl/eTrLBTcZiirEu9i0XaJXIlwqZu5x2/hF2Bl3M5cK2ic6GqP2jgzgU02gDpH6vWImj5m5bZnp0n+kmMPxN831I6f3akW53gDKl6Qpl0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BUyRiZa5; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BUyRiZa5"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82a646c96bdso3775679b3a.2
        for <linux-hwmon@vger.kernel.org>; Mon, 30 Mar 2026 09:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774886854; x=1775491654; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=CoAPxD37anoko/TCW1YUH9YUv+N7gf3al0lJPj7Y+Uo=;
        b=BUyRiZa5DbvD3B7lKTOjom4qNrl5Kh5ljKeZRNIlhHLWFNOpGg6PlAIQfQJ3Y70HH1
         rsGMmgXX3YWXK326CWKrwkAi4lZ05Q/I92JUN19TU480tOC/NiKs/Y4iKBIuNtjUOxRY
         gJgfaNWW8/yICuJZNuhhCK6lZ+2oz+2vCsEx0xrX4esVJj3rKwNjHfmza2QyKg9h4Gfj
         hoRjK+ba3Ms9YMwf209RgKSvJvvnvuZvfQQ5CjAKP4hMovM3t/HoFMFw0J6lOdqCREXT
         1raGMcv7s5GyRaGFIqaN1Mzkl+aheLIMwLU7pSe9pNn8DZkXU1wY3JuA6IiOm6neH5yr
         y4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774886854; x=1775491654;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CoAPxD37anoko/TCW1YUH9YUv+N7gf3al0lJPj7Y+Uo=;
        b=naCG0coHcauGL96wXEK5/Ld938mf5lLS0T4+sFNVyK0XgRaSsmEp0MSmUMAOsywKmy
         6KXCrKbCkYaH1nTobJCw4EfxaPgHdS8jF9AWQMxQFdS4vpnWGiJhJp3n2WJYJyajJPpR
         teP3tvrqjNdSpHLQrZkzJ04244SCRHTF6HisdU+d4MGDtOS5pYvk05rqrLA95rzk7kcA
         3ozkOnj+4/k7nOAd0tko7/p0StUeNZ+/FpuYm2mGIc7Pmxge2FjpIG2rgOHlwNHdg93O
         AYwXLKAARyutByLoQU+sbFxEK67bn8q3k4RfbAKTzvd2Umbt/iorCzGCMrSlfe3lKjbZ
         nIug==
X-Gm-Message-State: AOJu0YwHlzNRZf/k0PPcF4usGzntMDYJlPYvrSxqJdE2/OlSFzW8dXW4
	7z2xWnEoc8kaiSP8bLGcOwCQA3eqqTvAEoTv6hIGL1fQHgPsUFjDUrq6
X-Gm-Gg: ATEYQzwns6EjgFxLLN4VLzPSLphQt3oc6K4dJgwIoWH2kjBxx8MoxOcUZFFilnMSW9m
	u6i3AqcE+jl0a7ys3KOCcv/Icrt9e8Lqmq8eyOzDxAiiXJ4hRQ/06ilgijnPsybFZ8wxOm2XhUu
	/Dy5WbKwZ/UmNntyvB0cXdfNZKb+jDl6wwMywvshIaKChMBiTedFzsTcVerTwnVUYbcal5ziYGk
	6+DQWBqbE9Nxf81gFw5RACJuH5D7W5HuCIQx4yHoBpgSU97ltf4sQX+6BjOBhi8QMavmtjTGw1O
	sCIubMcP3EM9y7zDiy5kU+hM4JqvIIjZtPTxR2YCpfJGAcwuoBUMGEG2jCfF3MzkoFBg5zOYAk6
	tQeA3+pvy1lot8rsToURficAwR87ikUMSTXVDNHpbN/5coq76EWnAO+FEJAhZ6JokRVSAuUaswz
	Da7avjZ6gvTKHWjsJo7Cud1xpvC+wHfHb42vFfg2titMLrIdKkMbCiKvY7BygQM1hoOesIk56G
X-Received: by 2002:a05:6a00:4212:b0:82c:6aee:b21a with SMTP id d2e1a72fcca58-82c95efc9e9mr13106113b3a.45.1774886853736;
        Mon, 30 Mar 2026 09:07:33 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca85ef0a9sm7490696b3a.43.2026.03.30.09.07.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 09:07:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <67a5d1c1-a9c5-47fb-a0ec-5b69a991b01e@roeck-us.net>
Date: Mon, 30 Mar 2026 09:07:32 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] Add support for Texas Instruments INA4230 power
 monitor
To: Alexey Charkov <alchark@flipper.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260330-ina4230-v5-0-eeb322d95b3a@flipper.net>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260330-ina4230-v5-0-eeb322d95b3a@flipper.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/30/26 08:14, Alexey Charkov wrote:
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
> ---
> Changes in v5:
> - Reworded per-channel subnodes description in the binding for clarity (Sashiko)
> - NB: Sashiko's suggestion to allow interrupts in the binding sounds premature,
>    as the alerts mechanism is not implemented yet and there are no known users
>    to test it. If anyone has hardware with the alert pins wired to an interrupt
>    line - please shout and we can test/extend it together

The bindings are supposed to be complete, even if not implemented, so I am not sure
if the DT maintainers will agree here. We'll see.

Thanks,
Guenter

