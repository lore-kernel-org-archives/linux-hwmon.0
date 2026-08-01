Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6063093A6
	for <linux-hwmon@vger.kernel.org>; Sat,  1 Aug 2026 15:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785598690; cv=none; b=tB7R3VljUbbjVDx+AQz0Px6keSszeq6zGqHporxM6KWBB4NK/kyQtyhyJ5HhnX49hRid++JakHQh+53kx5T/vvUaXinFMiPN7ZbUvkEjoAYK1okiWSu/QjNsl9Ul6AuzGiEmtRjzMefFbspyHs1Vh/IezQpCVXHi1NjnEkIgVbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785598690; c=relaxed/simple;
	bh=GnS9X6N7eYCJaOXPrz7PzCJ6ck3AbOSPpsDM7YZ4mRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KDBMGYdfURleAoZE2TmH4UFNryJryQNVs0OGGlFHZsBD7Z6zMhRvFbGK8PjWcn3xHjRnTqsfmd/GNPgs3rllGKNB13f/uNatXZ+H7Z+Kj1HZL7MZRIgJoKcejxAWBnG9M5U4wetFuoJwRjF44fSx8ZApvNLl3CkCb8j49kdw4ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=WwELzEaQ; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="WwELzEaQ"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6ab04bbcc11so604982eaf.0
        for <linux-hwmon@vger.kernel.org>; Sat, 01 Aug 2026 08:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785598687; x=1786203487; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qE/0Fro/2aXSJWzJhwc9xnKMpU6gA8+7NldcjgzN6ls=;
        b=WwELzEaQBz7JoNZHZTXsZ55Kdcsvib8kCGGDZKvFFA7EIGxYrfifkiUSzULM2I0rSs
         pf+qClrI02LEb1/birZKAMU7Ye5iubuNT/d16sED4YdoDmKn0T+cujI3lon1p/DWnSyq
         bfTtbvkl8w2joimnmnThAkOrNNDA0ffvmRePaRXeG2Tm4pnBDzwQSzUHEvzTF2ZbUHsO
         SG6d+kOE2IadsZtp3C1Q5LFjiEzI7ABnmzdJBfMa7Ce/XpiOn4aAKw8FSaxSgzz3MQLn
         jXYkkiCAH1hJEMuWCRftAI2/dgz0U1BCD41OS7UNtyCUbdem8aNzpMcIgNAz37rVx6N9
         PX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785598687; x=1786203487;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qE/0Fro/2aXSJWzJhwc9xnKMpU6gA8+7NldcjgzN6ls=;
        b=jr4o1avCm4hGaJQNxBRFZqQlRh/+YYG5HSxiv453bTtzkB5eSMe1BUO14inLsEyXfF
         l0VvtVwJk0s5+xqLMVdkHPzP+w0ubgQHYzlQlYsxbzq4OR7mcvND4tbOkXBKxArzsYpf
         kYpUovSS5vlqccOPW4rvpT4DXIFbvJD7uGxMIGLgI9iPSvsvef9IgPHQuk46rtSvubUN
         Dzt2zmV4NcI7PuowNr/KgDeH0NiCmF8pfENXrYiWTl4ztTQFvHgh47NGNh4xjdlRWhql
         Ng/GMLmS8nZs71PdtldjWMAWVUS7llueOsH1/vaZFvnc+tFHHBICVyDZ3gc2qAd7iV+5
         Mh2w==
X-Gm-Message-State: AOJu0YztYEPWZGKlsSf0JcVwX2Z/n40ksCejpgv4yRWgE+BjMAmqOFMN
	hrSjGSKVThsWv8eYd338lJcKF+HNKpKYcgiENgd5GPG2gxBR0yYBz1c9ZG8RlnNzBJNUsiKyJ4C
	cJ2PMWYA=
X-Gm-Gg: AR+sD12b5YuozKQO4yDpDjBSImlM/ftL5BOyPREfVPe8DaW1oR61nCid4vb+FT3XM2M
	v0y79mxnDvSOxgB+O7B8MTjS4FcCJxcB0/oWzm1cxleYLnn0a8r+MCGJncWuuHMmmfC6yHtQMjF
	Z2UvRadxny0ZUcRhVD4XtNGf63cN1imHLETZh82AC77guhH7LzXS8RCcJhB3rlrIChDHXFBRYhv
	iyn8hxnavgN99AnywyVpHYDGSyLmA2TWDUKYf7YSNNkS0SfYKBE05dTEAr8B3mzMmCzsoDqPIEI
	GbBJYN9T2mZTSIOkD5S3MLeRzBlz5Ns6fpRYz6fpitRxMiqsAnnw2ZN8KzGXoc5KIWK97AIDhs9
	PpQyPAgH45SEVS8prwe+j5xPylsx2VO/Oeu31TdOx43N5zO8ARLEnXQi5S2DDkMkTAMvaytm3bE
	L1zTNRlzzA79J+wgHskajrenAIlWpjfuX3LCGPpoWnfLahS6vi/Z0JY3CNVfpY7MAA4JC/mDaP5
	XpZ2aS1tzaISUTsKQrEyssvxNIUg9q+FyCysORbNzVHTzSwIQ==
X-Received: by 2002:a05:6820:1608:b0:6aa:da04:b56f with SMTP id 006d021491bc7-6ae43190592mr6646708eaf.3.1785598687021;
        Sat, 01 Aug 2026 08:38:07 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:359b:17f1:d4f9:4949? ([2600:8803:e7e4:500:359b:17f1:d4f9:4949])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-458f6764087sm4154729fac.17.2026.08.01.08.38.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Aug 2026 08:38:06 -0700 (PDT)
Message-ID: <21331e41-c972-432d-a55e-c6f6780113ae@baylibre.com>
Date: Sat, 1 Aug 2026 10:38:05 -0500
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] dt-bindings: iio: adc: add adi,max40080
To: Stefan Popa <stefan.popa@analog.com>, linux-iio@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jic23@kernel.org, andy@kernel.org,
 nuno.sa@analog.com, linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, ciprian.hegbeli@analog.com, siratul.islam@linux.dev,
 u.kleine-koenig@baylibre.com, joshua.crofts1@gmail.com
References: <20260730131738.822405-1-stefan.popa@analog.com>
 <20260730131738.822405-2-stefan.popa@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260730131738.822405-2-stefan.popa@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/30/26 8:17 AM, Stefan Popa wrote:
> Add device tree bindings for the Analog Devices MAX40080 bidirectional
> current-sense amplifier with a 12-bit ADC and an I2C/SMBus interface.
> 

...

> +properties:
> +  compatible:
> +    const: adi,max40080
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#io-channel-cells":
> +    const: 1
> +
> +  vdd-supply:
> +    description: Power supply for the device.
> +
> +  interrupts:
> +    maxItems: 1
> +    description: ALERT output for overcurrent/undervoltage threshold events.

More precisely, it is `ALERT_`.

> +
> +  shunt-resistor-micro-ohms:
> +    description:
> +      Value of the current-sense shunt resistor connected between the IN+ and
> +      IN- inputs. Used to scale the reported current.

Datasheet says nothing about IN+/IN- pins. They are RS+/RS-.

> +
> +required:
> +  - compatible
> +  - reg
> +  - shunt-resistor-micro-ohms
> +
> +additionalProperties: false
> +
