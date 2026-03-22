Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08395474F
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Mar 2026 14:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774188605; cv=none; b=V9A50CoXSSPsWoLB6OXRrDwr+qKVx9A852fd1wCdNm9HYN38BhIvJrW3a/4LgJfRsYZd90Hoe1sqRbBKdQZMqaEaugOWlneU6hMvGMfhYbPEyEFbLsJHeFhTNKy0TASwgvK2Ug6gJY+bnoZtjtAt533eddDB3+6QVb3IuKdXFwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774188605; c=relaxed/simple;
	bh=wYM7rFD0Aily77SHukDAbLc20kppynNkynaBv6rhwDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RfR5oK1VAB50Y7zhxxUTFfStzjoLg0U1eUgVrj0K2lkXY4BffvTgdJ5MWvfkwAGluugz/B7rFKcXS17Ty/X2Py25KfhOVPVepXHIfazNWP96DyYPa+u/HjiZdbyqIm5XUg+uAbTGf4ja58djCv5RvkMGS2zoK1d2ky7B5IRingw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=id6n4njQ; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="id6n4njQ"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2b4520f6b32so4237192eec.0
        for <linux-hwmon@vger.kernel.org>; Sun, 22 Mar 2026 07:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774188603; x=1774793403; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=8mdNj/DvPq3mNb+2oWEDziL/aWG+5kHGL1UMe9SoS10=;
        b=id6n4njQLlp9vG5PgOzfH6PcgoCnkzCG9N34TNxv3I8ZDdyRbeMF3Sp0OcQk8FVswP
         TFZM/8yRIXm/8Ec1KPlRpD98z4RrllnKDMgRc5zz/V2jUuVscJypSNMjf9vR4HY42xMn
         XlfNiC52io+oXIPBK8LSBOjEhNfUC/+dI+9L18leGnANookXrvMCcHrh4HMsZiQx12VR
         BlGydsWBVGECHHcGbb056I/pwMyT1VrwDvfZ4gr23x2LqGg16EN5+CyRk5nssCYcvIrH
         KqwyW55OmPoZhlHbf1B5iqIibYpYTKR/9C01P753xdRiojzgifFqwcI3Nm+FEL0rs5Oa
         7dIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774188603; x=1774793403;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8mdNj/DvPq3mNb+2oWEDziL/aWG+5kHGL1UMe9SoS10=;
        b=JidxJ7+g8GKuOv2ssYAlckQfIbN6aMOrW91bAgKrdlTWXET3BILpDNRddYR7sRDtAB
         cUGdsXhLV9zocHV595PiZ7sF38J3jvAcskQlYcawULclON+t04j71bmcsY5yC33263KP
         BPuq+mNjyhCptvSL54iCFN99W2qO1HeWmV3pZDzYVsWvv8lGQZY/fEDCfNHVVt2TlW/r
         4NEYd3LrwoEVIt7fpUL2therQxU8OC2OiKcZDj4f1naUQmYaR30cJdqwgCKw68jv+qdT
         vwxA891nZXWluaaITtHe8agiom4KZamOaplV/mUwfBHvuoWH+tJgOLcQXOU/Qsro+ZHh
         nxew==
X-Forwarded-Encrypted: i=1; AJvYcCUsnmJaXa/cRIgolPH3EiylqcuJHj3lNMyphXUgDmcsBjMp7DFnTDL20oa07xkvRPUTSTLMMhgAJCNCgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNaR+PcWmTdNw8M8iw0pQfSXj8OAeRIaz6qKILcUUS0kf/3pzi
	v71a8/Krt68bSnKjrZcIvLuxqS1wF08e6Fqkx2cs+kPpjWFGmjua5dAm
X-Gm-Gg: ATEYQzylE+CzGp97w/ZoO88mkCA+eOn1wFiJHhu23rlnGbNB+/bqfcvSZMjN+zQI4n6
	zRS0GskbpTQ1sm5mJifx/2//DvIFAEtEPksjDTWMqtKGhN6nnx3NKR6sDTxctnN7LK6rUMWCoWK
	qmUX/sxW0pghc1qZa6V+mCaPJO991h0byCMb7PtTPU9oZu+71qkzpAZEyJ99qIBKi6Ec0QAk147
	p66fK8Fu7pqorm1WqwsVGyICEqpoD3ojjAJDMpTlnbU471SJ7hJ84EuYgjWXfDtRzqXAuPE3g8s
	oqrKjE/9zOE/EI7ZDaIWZ+wPLpLYLmWE/yze0Cf61zlsN499vRGKXI4bewwVeLIICCU5Nna/PDX
	LKsFV+9ZnhKYTvN6KDYFDYiEzxs1eV1h8NKIXbb1LQ3cU3LBS8awy2leaoRDOeaa9slqK4GiDlY
	9R62+ZrdIJ2aUmLGHjqspOEXH/XyGAkUMyTpTa1OmtLdYI3RIkJcpdLvoT4OHaqKZ9DgF1h4rA
X-Received: by 2002:a05:7301:6704:b0:2be:ca4:e13f with SMTP id 5a478bee46e88-2c10975fa26mr3701226eec.23.1774188603046;
        Sun, 22 Mar 2026 07:10:03 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14cadbsm12025311eec.3.2026.03.22.07.10.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2026 07:10:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <67747945-4009-4f56-a931-5057729c199b@roeck-us.net>
Date: Sun, 22 Mar 2026 07:10:00 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/7] mfd: Add support for NXP MC33978/MC34978 MSDI
To: Oleksij Rempel <o.rempel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>
Cc: kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>
References: <20260321065146.3918882-1-o.rempel@pengutronix.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260321065146.3918882-1-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 3/20/26 23:51, Oleksij Rempel wrote:
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
Sashiko has a number of concerns with this series. See

https://sashiko.dev/#/patchset/20260321065146.3918882-1-o.rempel%40pengutronix.de

for details. I did not check the non-hwmon code, but the concerns raised with
the hwmon patch seem real. Please address.

Thanks,
Guenter

