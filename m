Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48F33515C5
	for <linux-hwmon@vger.kernel.org>; Fri, 28 Aug 2026 16:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787932887; cv=none; b=c5oQIgO86YAKYoL8us/P5+stWzGzIf/aL1pACcFD6sTUDzJdgRVZ2ZOGaRIR4a5zc496nO5joKh7kaiXCsCX0O/fFIzBldiLAXK5rYBphfUxvIqxGMEDvMvODDzUpanEZ/FvEJ19Pdvb8MwpL8ayTrRNiiq7N7X2XCTDOiEOzFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787932887; c=relaxed/simple;
	bh=oQqNEQbcnXBTfUIv5IgxbO7DhuJL8CYmkSWZxLpRWX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UkAqQ37w+Wpb2RkRP4zqER2XRnTHtJQgiN9kcZbYnhQ3WYgF9lT3Ad7vknrtDyw45OKskuVHbZa5Jm8ttLBX72rrjycq9M8sF1blfqiNHuOXFO5t8qb1703qVoqLu0GES9fylaNyjCBe1WU4YGC6y8xdI3bTR/W20nvalGHiBv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AAol8pGk; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AAol8pGk"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3964e76d0f4so1103416a91.3
        for <linux-hwmon@vger.kernel.org>; Fri, 28 Aug 2026 09:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787932886; x=1788537686; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Il4EamAEW7KbExBmjcSAYVqBQdsFVVnM7I2Ys4LmgiQ=;
        b=AAol8pGkbBiMVKHRDeIgjuRS0IR85mMNNKN4BAfCdl0EV3cvTAKuxo93b7Syn9k+bA
         z20ewJr0yqn4Vzrncb8Xx9nF3mhwxZeHf63NwcZujW1fU8+OCOpcaNkxWdKR0oCGpfJQ
         2Vf/Es2lYS7FPplcc7RnIQIcLSA0u5A0NUSNvr6zAuOI0az8hLcyOTdMLljRxwYZva5W
         f6/eYWPDQz4tq1V4fj23PBhsdur7asCwzlop5pYuGYR8/USQTw6Zur+LJNi0GVJVj9cs
         hLn9hoj1XaBv3vpBb8NE20MdH8W4iqRVnTdGYDqD3EreOGF1ZaENfzkcAQM1Ah05nLCZ
         zNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787932886; x=1788537686;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Il4EamAEW7KbExBmjcSAYVqBQdsFVVnM7I2Ys4LmgiQ=;
        b=LmLJP1+1nQAH4U+ba9XjLZ7nDuaV64SMZvyTDFRMdMtxZDsuYYeyx4R72+q0TOuMTA
         viSqy/5r/i5hKPggaMXRByYD/zYicuASd3FoyTlOd5f+o7Y2oBg1jaIQQYYctv5/3ucV
         MM6TMSwksTJfYd0+ZuIknvB2qL29Y3dK+4rPxAn/3/nRLq19HX38krn/GHY1h8aW3+Aa
         G0CBpYvSHrBSZS79op1Mt3sw+Pq0MizGoDa8OPCfMRs7WJ1kQNEUrJzu83tNcghXTOUT
         unPJ1Eh3H+Aa3Q+roJK+52wQIfoJw/Sc5if+wMn1lLLBYKeKlSv2/pE3z0Ge1tmYUE9t
         /JLA==
X-Gm-Message-State: AFuF++mNq9WBTnLoyKfInjzKJ0b1x5IvojGnZTLJTsXGqwshf4Dwu7HS
	bTJBOUUxOxkDSvvdSr0Z7V6chO/vPz/atqAfYH3Vt/TxiFyC0fFKv/bX
X-Gm-Gg: AR+sD1268FtmW2Y7Tb8Se9ytDt7DoDjjQvAkzs8oUK3sbX1Gy98nBtlPbRbDkgVR4Us
	AN5tsLk/3QDBc6A5IuFI2xL4S61i+Ie7nwb9453QVgV5bYsr2DKJgymYAP5zGZfn4IrO3iCqqzl
	1ROaxXjk5REACTw1WLANcTHhGdD6nDlsVzFfDazisB/1kSo8O6LY/pOvE1MjnrdYdrMUMXknYSu
	5eMSZ8NQ9Gd+qGUoC7oVI27Hg90NKOaSC5tD1NQdtWCy7idkM+cVVkFDoUxdZnAsNcKkh8b2vct
	/TL2Q/jfaSZM6SujNSf986pIxt25OSn1fNLLaqcdxz82RURRX3vXz14c2BZw9oMHVrme8yk4GgG
	YRmNmJRdQ+8LB2Ho5IRIUZHaDUqkDe75n9H7SvCwoNZZHVuysoCBoK64feb/fRJIUWjknTV73kq
	m2Yp7ys77CnAnIj8kWz3mXGxdkjZRzYiHGOaH1PZhLvF68nrHbvMcwnIwBmCjGOnYPRPg5GMLgq
	vmY23xgDnhtbdUKu2DDT50Zaof/Pc1xNNEWLw==
X-Received: by 2002:a17:90b:4a06:b0:38e:9045:bac0 with SMTP id 98e67ed59e1d1-396d0ea50b4mr14347664a91.5.1787932885607;
        Fri, 28 Aug 2026 09:01:25 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-398a14d3e83sm79670a91.10.2026.08.28.09.01.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 09:01:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0ad5b673-d800-4ea1-8239-223404eb88f8@roeck-us.net>
Date: Fri, 28 Aug 2026 09:01:23 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] hwmon: Add Minisforum UM780 XTX EC monitoring and
 fan control
To: sashiko-reviews@lists.linux.dev, =?UTF-8?Q?Sebasti=C3=A1n_Peyrott?=
 <speyrott@gmail.com>
Cc: linux-hwmon@vger.kernel.org
References: <20260825184107.355980-1-speyrott@gmail.com>
 <20260825184107.355980-2-speyrott@gmail.com>
 <20260825185125.A82D51F000E9@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260825185125.A82D51F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/25/26 11:51, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Missing Kconfig dependency on ACPI_EC leads to undefined reference errors at link time.
> --
> 
> commit 95c2944ab1799dbc9f42157b5a4c6a9050da57ae
> Author: Sebastián Peyrott <speyrott@gmail.com>
> 
> hwmon: Add Minisforum UM780 XTX EC monitoring and fan control
> 
> This commit adds a DMI-gated hardware monitoring driver for the embedded
> controller used by the Minisforum UM780 XTX. It exposes CPU and system fan
> control temperatures and tachometers, utilizing the ACPI EC transport.
> 
>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>> index 81a9a1d40eec8..45ac04c89b23d 100644
>> --- a/drivers/hwmon/Kconfig
>> +++ b/drivers/hwmon/Kconfig
> [ ... ]
>> @@ -1490,6 +1490,22 @@ config SENSORS_MENF21BMC_HWMON
>>   	  This driver can also be built as a module. If so the module
>>   	  will be called menf21bmc_hwmon.
>>   
>> +config SENSORS_MINISFORUM_UM780XTX
>> +	tristate "Minisforum UM780 XTX EC hardware monitoring"
>> +	depends on ACPI && DMI && X86
> 
> [Severity: Low]
> Does this also need to depend on ACPI_EC?
> 
Yes, it does, which also explains the build error reported by 0-day.

Thanks,
Guenter

> If a user configures the kernel with CONFIG_ACPI enabled but leaves
> CONFIG_ACPI_EC unselected, will this driver fail to build? It appears this
> would lead to undefined references to ec_read, ec_write, ec_transaction,
> and ec_get_handle at link time.
> 
