Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF401A256B
	for <linux-hwmon@vger.kernel.org>; Sat, 17 Jan 2026 15:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768664635; cv=none; b=gGeYJT38kU2fsvhy4cyZhteUCTE8w/INAylo0aqoAGXcwkJaxaC0NJ8usA+8+Cv4b60LoSFcPv/og9HCdohNkEYfvwvqXYsyBKST4ZVicOfM3iGGD+wFXfppkPpv/Mc6+oIfyQ/b5uzmUKzsXPwWEzEl7fJ/6vnWwkUR/Rocf5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768664635; c=relaxed/simple;
	bh=zGVqiUZbExuJp8HPc2yTb+NFpNh3b3ieYwXH1xIDW3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MoZdjSvQG33Co0LUfaZt9UueI2MyP5weHbzmS2VDLn2Pkl3zusxmxOfe9I6hOdE5a9xC4xSLqaxa1obhInlqhcCj0kKHzTDinAhJ/69fWLbqSWfYfL9m2OXWKYFyor2IDHrKv47fZTEqglOYSSVsQD8qcrftd8C/ovoOK8r2t9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=evx2pCjQ; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="evx2pCjQ"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1232d9f25e9so5717358c88.0
        for <linux-hwmon@vger.kernel.org>; Sat, 17 Jan 2026 07:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768664633; x=1769269433; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=eOiA/l4ZrHwITLtT0Hu7f0cQ0Aja3092QLlw2Z57TmM=;
        b=evx2pCjQaZft7bRoxlfqYAfmhtyTS3WOajLif9W71JqAfYgCw6IhlJDb+t9b+dWNbs
         ME5zXs2TjZDSkrrO41HnXgEtRIcZ2+qAUl/c8MooRVHI4pMUxSYtjMibfgkmngt2o7fV
         1gogfMP9Fk9vwTvQOHNoRmBXD2DqyCH5+OpdA++KgmqYaf9BYE+6IztvTv39nS6WIrZ0
         qq7KiEb7HpSQ95Objla3DLw3j4bsceKacoxIjv/BUiG10pdHM0Ojc8K1YklsGdkjb7Nd
         NIqApi954DurXVLHbZF9Uc+bEXXpH4ktlRAKvhMql2Gwx0aUP10nB0pWjbHSRfE7I4W9
         lOWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768664633; x=1769269433;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eOiA/l4ZrHwITLtT0Hu7f0cQ0Aja3092QLlw2Z57TmM=;
        b=GWz6Q5rhsALu5XVki385RIFUgk9uhEpVo87EMuGs21JEoFhRsMHRzjDkIOlNMtiUX+
         8V5E/Ib9NtIU/UmRKfVdU9t/8ZiV4NxAOYfopy3tRn2NlZlMDEOZ+RnnO+2kfxmhRDHV
         dfO3DbOw9QqhqE0VYce2+FqpPk/QqaDxvoWNmLw6s7TLCfsxSqXlKGo7uDeGhq2iJhFz
         47aXQB1cgGJTbQ+32rSknpyZ7bvf2fMavQBnSoFnnqLP2ndSE6zvoypGZT0sGtwCBZsJ
         rb1Uf+YEqIQi7OYIi1u59HpIK28PyWc1edRwGY1LxxCVwpMLXKpB7m4gQTKspfL2TyTV
         hIdg==
X-Forwarded-Encrypted: i=1; AJvYcCXJbO5UONF1f1HjKIFDVkbRAeJAMTKfsjs3SWwFI5rlDO/sEwDNjuO9Y5CqAvM2udKgPtgdzH5AdLXiSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YygOsOmoKU91FQir/7jGWpOHwQ3pFmc+RCEJ6RsEuG8FFpRy7nu
	B2Hy7wTIKi+Qnyf3ASq+c0MGWsk+E+hbTiNsB5UivAUCxtkpvvQLhk6+CLxWqA==
X-Gm-Gg: AY/fxX6vWloGZOIo90T1joi+VsJhLqqoGy6Z3dZNkEFggJU1sZc/tm5LOen8FMMmC8I
	ZB+whDMubahb/Cer7ekA6nKe4hXAb6pXlugB8qV0e5owjTj+urA7Dp5O4rG9sg+ozpc2SAv80Nf
	FPgANRNE07+t8+FTckWnaATrDKJUEUXVKtwwlC1bnDxbLkJA8CTUhmHqWjODP77wjESZ28L68PS
	UTTT9gKVnsuDJ3lWzeUw0FWUIb5ZwyQuREMmrjwH/pyKnFk1bI5LOMBmDnINk4DlWPM2/hqhA/b
	pFs6ifk7CYbHDwHUM6AcnvqfBjaBFdzfpdkp6CX93ommMHFuGo518vCtxhnUbLjqku9zRi4wlIQ
	/VFT5VSYTnjobE9iaJ24sUJitHq+6pe6DtXMd85kStCl786YFme8HeUOv40V70sqoX7DtJQE/gl
	FGg4ouDma8xv7gCQL8tqEfV1IzrgjQciblPojzxewfKCEGuR0Pmj0DDMfg1OSZ
X-Received: by 2002:a05:7022:2204:b0:11e:3e9:3e99 with SMTP id a92af1059eb24-1244a7bbf8dmr6647517c88.49.1768664632816;
        Sat, 17 Jan 2026 07:43:52 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ac6c2besm7817777c88.5.2026.01.17.07.43.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jan 2026 07:43:52 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <bc9701f5-8873-4778-b5b0-1e538de1f38b@roeck-us.net>
Date: Sat, 17 Jan 2026 07:43:51 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: hwmon: nct6683 ASRock B850 (customer ID 0x164a) PWM write blocked
To: tech@biorez.de, linux-hwmon@vger.kernel.org
References: <b1a782b4731c1e04b49cd3173340cdd0@biorez.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <b1a782b4731c1e04b49cd3173340cdd0@biorez.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/16/26 13:52, tech@biorez.de wrote:
> Hello hwmon maintainers,
> 
> I'm testing the nct6683 hwmon driver on an ASRock B850 LiveMixer WiFi board and ran into a limitation regarding PWM fan control.
> 
> Hardware details:
> - Board: ASRock B850 LiveMixer WiFi
> - Super I/O: Nuvoton NCT6686D
> - Customer ID: 0x164a
> - BIOS: ASRock 5.35
> - EC firmware: 1.0 (build 10/29/24)
> - Kernel: 6.18.5 (Fedora 43)
> 
> The driver detects the chip correctly and exposes temperatures, voltages, and fan RPMs. The nct6686 device shows up under /sys/class/hwmon/ and pwm1-pwm6 nodes are present, but all pwm entries are read-only (0444), so fan control is not possible.
> 
> Relevant dmesg output includes:
> Enabling support for unknown customer ID 0x164a
> NCT6686D EC firmware version 1.0 build 10/29/24
> 
>  From looking at the driver, this seems to be expected behaviour for unrecognized customer IDs. I wanted to ask whether customer ID 0x164a (ASRock B850 LiveMixer WiFi) could be enabled for PWM write access.
> 
> I'm happy to test patches or provide additional information if needed.
> 

pwm write access is only enabled for Mitac boards. Adding the customer ID
would not change that; the only difference would be that you'd no longer
have to provide the force module parameter.

If you can test patches, I assume you can write them as well. Please
feel free to submit a patch adding the new customer ID to the driver.
However, again, that would not enable pwm write access.

In case you wonder why pwm write access is not enabled: The NCT668X chips
are programmable embedded controllers. The controller software varies
from board to board, as can be seen by the customer ID and firmware
version. The API between main CPU and the EC is not well defined,
and may differ from board to board. It may even differ for different
versions of the chip used by a single manufacturer on different boards.
For all but the Mitac boards, access is only possible due to reverse
engineering and guesswork. While that is good enough for read access,
it would be way too risky for write access.

Thanks,
Guenter

