Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB8035E95A
	for <linux-hwmon@vger.kernel.org>; Thu,  2 Apr 2026 10:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775126308; cv=none; b=Tv/GfVgqmIalId8WpkTptxrqHFMBSMSc3SEBtPVpjQDU6oG3LP5V7Kj57fdG2kCVCzfslNXIjWiJRFJE3wpFmKFUH4kARqrSHOLqD1tOQEoKiao2wqEqK2Viq5op+L6w16GEBOS2xoVHxDCzst2riByy0K8rsdwjWxcA+IizILY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775126308; c=relaxed/simple;
	bh=AVKjDab6bK6ZsKM8zazG+7m2550/Pk15eEN9/XSkp8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FTW/xh502/ZwJBgLoaYrSsAwOcp0zJkGHUKtwNPTVLhjkknis4VE/4uNj+Jgluzz/5+om8MZntF1S42zQnhXiFLjvDpWIlq2uFp5kjiSkpZPsCt4O16uEssbh9eOloz/91MCRT0/yBgKct+jOqI8RLzgwfvz4HW0zZn5w5XBR+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ht2E7sZF; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ht2E7sZF"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2c7e5f38b37so1047019eec.0
        for <linux-hwmon@vger.kernel.org>; Thu, 02 Apr 2026 03:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775126303; x=1775731103; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=QqamXqtOxzBeur4HdUAmKeC/dpeaPCUYwmBwWWj8JfE=;
        b=Ht2E7sZFt+97q3Ct3fmkbCQXDpYqsACsotIZFfTwXQC9GSahXW8HlcldOYr6ULlWuM
         A/SvSZSkjXraL26R0NFfK6nuwmhG2Sipt7ewUonV+CsdL4k87nFHfWWK+TYXYqtdunv+
         xp16AwZP+ci331cnYP5Q1IvSJTxbl7/BH76oIZGMQ8/dde+qSlG5CPhlNoJVQwIEjTQS
         mtY24VhjT8CS9bA5756NGzTihwJCUJvnlyXqRfwwecQW2CjDZrbSqT2kFzsMRu4JZBD0
         +C83qprdSPjqMk0N3/5kB9xxQqJA1ZSZhrqka7huJyRr30dOlPiWmyiKl5/MhUXrzBQV
         7b1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775126303; x=1775731103;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QqamXqtOxzBeur4HdUAmKeC/dpeaPCUYwmBwWWj8JfE=;
        b=G/L6gTZRIPdwkeDppwCZPx6RgDvmZ2RjN25pzDhi9kTVZVL1ysIZUZHniMEEwTJbQU
         7zqOX0FJlG/UniiItvlgnQohNF3zeHnBpHt/w1H96vrg/AkJaQOIp7JxmVi1MbKp6FfD
         yXvZaM7vJv9GplzH/N3Q7BD07z1TAVf0h6sMPnunhYudY7gY1pNXulfBJ2cc/phsRLZ4
         /T27wsJJWV9N0CoP8X0AD6QfX22VZUjNkegnXbdaj61VaCg99j9DbgV6+XsQzdb435di
         IuvKUVWv+g+3zd29hPH3pycPYRBsBQSR/FMrcEo/Cuknk2MxRUGcUuixqV7ZF5pt6LeE
         mklQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNYGmXRgZclXawa1/WBJm5kzKh7oTSKCUeUIT93b/nOMPRrIkMK43qlWewGIDmc29UzwGhjVTXNbAkfw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9L2CQGf1RIT66Lc1dcRwfJDRfSnZ/7af88YXZJFG6vOWTQyYR
	e7ZT+Iw77pLqE2kfs8zECYNr09AxSjQqmW1kgnerPSqVAxQfMBAK0Kwv
X-Gm-Gg: ATEYQzzHO855zaOI16O/eCSQZQdN1wQoC2diFuabVYqecty6kq3FJ9rSyEDucnALKv4
	D5+B2dluHixsrjwSYG1P6jLLWa1IeLnc+Ev7FwH6/M8pvHyJFuciJIcaK1g8hJFuEnasyTubRUU
	25zj7vvifN39ViKN/vNmKcZv3l/DNcrg57o/QzQCOkTwrjl7L9kjYyVgcEKbBsp79J8fBydCmp8
	PGuBR0XayzJon/zfCSQyNiFj6CpUDNtdSvk0cldwkG0RVzY95JYpe4iSd3yMpw5gKPHwr5cVfBI
	OMweNJb7aQ0n1IPMSMg+Vw+GKCAUB9yuRCPLMzsCYVxrpLkTDNZ4Gres9nmGFsA4PELpOIHbGUg
	04wNeoiaz7XWXRDkp9NEbJDKjCD5XU8eHD8q/7vC5dG401reY1EFRsaoly2XIeFPYAsCplP+n5V
	+CDoXuB3/OcY3BC9tuxunmjHNC/Iz+aHGIaPpPp8gL19SOBs1oJsY64BWtxNM11EIedaUfwOEs
X-Received: by 2002:a05:7300:a90c:b0:2c1:27c:7598 with SMTP id 5a478bee46e88-2c9330aff2emr3510807eec.30.1775126303009;
        Thu, 02 Apr 2026 03:38:23 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7ce0075fsm2245141eec.24.2026.04.02.03.38.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 03:38:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <cce0e8c4-8df3-408c-b3ac-6ede3c4b2cf0@roeck-us.net>
Date: Thu, 2 Apr 2026 03:38:20 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] hwmon: pmbus: Sony APS-379
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260402024101.4136697-1-chris.packham@alliedtelesis.co.nz>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260402024101.4136697-1-chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/1/26 19:40, Chris Packham wrote:
> This series add support for the PMBus hwmon on the Sony
> APS-379 power supply module. There's some deviations from
> the PMBus specification that need to be dealt with.
> 
> Chris Packham (2):
>    dt-bindings: trivial-devices: Add sony,aps-379
>    hwmon: pmbus: Add support for Sony APS-379
> 
>   .../devicetree/bindings/trivial-devices.yaml  |   2 +
>   Documentation/hwmon/aps-379.rst               |  58 ++++++
>   Documentation/hwmon/index.rst                 |   1 +
>   drivers/hwmon/pmbus/Kconfig                   |   6 +
>   drivers/hwmon/pmbus/Makefile                  |   1 +
>   drivers/hwmon/pmbus/aps-379.c                 | 178 ++++++++++++++++++
>   6 files changed, 246 insertions(+)
>   create mode 100644 Documentation/hwmon/aps-379.rst
>   create mode 100644 drivers/hwmon/pmbus/aps-379.c
> 

Sashiko still doesn't like it.

https://sashiko.dev/#/patchset/20260402024101.4136697-1-chris.packham%40alliedtelesis.co.nz

- Yes, "extracted while probing" is no longer accurate.
   Maybe add a comment explaining that the exponent is constant.
   Maybe even use a define ? That would make struct aps_379_data
   unnecessary.

- Rejecting virtual registers: Why indeed ? Is there a reason ?

Thanks,
Guenter

