Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F8B286D60
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 22:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773785536; cv=none; b=T+7wdb6DE2OLO+oDsk4fHVSCgp+8cBllx49TjeK38rL5SaSQEiaXaeBlo6NKkwKvvveEFZqH8ruzm9sog8bO4uFzhduyOrrkkqaSPN52yAV526AlIV2P9wP+gu8O3bGOMdMdhU1XCQsoSqDlssvLiF9EKJBs3zN5pTpfOB0hnmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773785536; c=relaxed/simple;
	bh=aDskIJCWt1Cotn/uz1e4RCkLkmxOycrzYvVi2AlMKHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kKC25r9DMaPkFLLz8MH1efBNlpdcS3w7+DWJdk69G0IBP2BcZPlDkUHvKYuwF8wd4cuDHVIsGjW3tF81MgfSzD0pPN3IBEbw+qmtMy0URdYCkVsUPkzOq0ZFuVHkZ3gwXVKXzAnHy3WDQbNqt8LU0S2KDTKvx4GvOqQ7cGJ2SVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RpMi3zKI; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RpMi3zKI"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2c0b7eda342so2957674eec.1
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 15:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773785534; x=1774390334; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=7xBuRuceptPr4bIHh1Wb5aB1apx9U1M2agptNZkcOgE=;
        b=RpMi3zKI5HIJJQDvij2QTFocQQ3R2aiGx/tcEm/a24mXM2DgTVV3Cp+vCLApv00k1q
         GQJdv0UcKi6322GHnua51tRzmhuJ7m5+e44bXY0snQdsjScW9qdn7vGytx9KqiLpPiNF
         ytswyWfyOxNYZ8C2EuYwyBhtr+bgRojVWFxIJm9hq79Ms7Df+glp1tsfYb1lHX9+AIvg
         D/rVQE6Olf1GhYhJBhsorzGCkbdeW4ZtuzNlN+GZ+fVtDch0a5WEYUzrMtWkKRVuU0+s
         MrmzebzrKd6S8D5xkmLAsP+aASvkIt5goPnDEVTaGD91skZUCHPMIWGi/f3RqU794bhl
         bQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773785534; x=1774390334;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7xBuRuceptPr4bIHh1Wb5aB1apx9U1M2agptNZkcOgE=;
        b=JjPwnaiym5RSrODQkoR8MBzuBxKBquqhqrxJ8HEYR05RuyOvUq24UMZe+EjzAYfORU
         ZZo4rCqX0cXUCu78kWSjHohhsifQ/GlBL7cGzuNI4/lH3OC0S1jwslOQNaZwsR2vztUK
         sULnTNaeUjrWaQ+gT6ZwMk91z45QlIj0fJhqqGR0IqDQHrKxcWPhx14q0JKvqMJIa+H/
         iNFTHaEhl9i3iBo6XfnAOHYQKYH2A7JTJ5o2K4cdQaMOKe5hTsM39mcJuCHzXh4kS67A
         CfiJ7ak0pnbZ4Lq6og+rBwHwfHNmVfNyW3qL9S1fjGy+yOucMlfcuBUfW9P0hLR3iD8f
         tdTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKRyDKCdpnPjP415gAqc3WmAF+6HX9n63iG8S1SZDomUPKshs98xH+4ZmEX/s/5Ao/kBGklwYP27u3ig==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlVoQ1QjhOuqabJOyhR4/LQ4gSrBEQoVltbkSmbMi56/KzyETx
	y5mAFQc5Ng9KfqzsHWUlXpYtY2DuZqWGGSz+JwjOmwlNvDKdigQMZuiE
X-Gm-Gg: ATEYQzxHLWD8znW7O5BvgvpXpz0JOLpi9Q/FIbopbhMwwkLw3bpsG3mh7fbVCYOBBFV
	t90pg1LosRYXW6gYiqC0FctUxpchQNdjQQvSQz0p3VU0QeS5HoRg5E5TwAuITR9s7bCDb6iJeq4
	os/0Xm8Wp4hsc/IHdJMjAp+7JftquCo5+yiOD7BUXLvGs4xGIV18ZIS3SdQtImE2uwbkMK4u6MO
	NCwvQyTZAlsW1CODePhizujEB8yIEajIKyVTdMFjpxbekvMdLxrtCNf5vhxb81xSQsX1yx/ImSB
	B8uTWPBP9mEDTqGGE6qNDf2BSJZPHuCAgsfih8dlFqut+vfZgsHNhyNUtQXovk9euvExnxtLMk4
	BMiMuaV/0v545/auR91lq19HaJwM/NJwqtg5u7sLZdHp5tKEa7QPdOBdh5EblUB4Oy4x5EwtP0T
	4kVVXSFXzgkkTJ3stazGkb/71SVq7fHX0v77PVWVIZ7sahIeJvKLu+VUzwuC0M61ULPDKa3uzC
X-Received: by 2002:a05:7300:3724:b0:2be:2b16:b99f with SMTP id 5a478bee46e88-2c0e501b742mr584410eec.13.1773785533931;
        Tue, 17 Mar 2026 15:12:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e55a489bsm1277770eec.23.2026.03.17.15.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 15:12:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e2466bab-4147-4fb3-99ba-68d36c0f18c1@roeck-us.net>
Date: Tue, 17 Mar 2026 15:12:11 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] mfd: Add support for NXP MC33978/MC34978 MSDI
To: Oleksij Rempel <o.rempel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>
Cc: kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>
References: <20260316140514.1406588-1-o.rempel@pengutronix.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260316140514.1406588-1-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 3/16/26 07:05, Oleksij Rempel wrote:
> This series adds support for the NXP MC33978/MC34978 Multiple Switch Detection
> Interface (MSDI) via the MFD framework.
> 
> Architecture overview:
> * mfd: Core driver handling 2-frame pipelined SPI, regulator sequencing, and
>    linear irq_domain. Harvests status bits from SPI MISO MSB.
> * pinctrl: Exposes 22 physical switch inputs as standard GPIOs. Proxies IRQs to
>    the MFD domain.
> * hwmon: Exposes thermal limits, VBATP/VDDQ voltage boundaries, and dynamic
>    fault alarms.
> * mux: Controls the 24-to-1 AMUX routing analog signals (switch voltages,
>    temperature, VBATP) to an external ADC.
> 
> Initial pinctrl implementation by David Jander, reworked into this MFD
> architecture.
> 

Please have a look at the AI review feedback at
https://sashiko.dev/#/patchset/20260316140514.1406588-1-o.rempel%40pengutronix.de

It didn't run on all patches of the series, and I don't know how accurate
the feedback for the non-hwmon patches is, but at least for the hwmon
patch I agree with its findings.

Thanks,
Guenter

