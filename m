Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F9730216D
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 14:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785162474; cv=none; b=iYSd3sW6Veeo0w1b54M1IOCC0i0HUG5f1FMPkx4nYnUnqnysBsuYB9u0AtS5R4t2U2XbAswC/6/hs0d2UWe4jHOt/h74/Gja+3Ly/7B3+1utNaDbyBOxsbVdhwmL68E0I2khqnTOCr2BpgydAaWOkWzUWtgb17bH0VcFM3Xtwu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785162474; c=relaxed/simple;
	bh=apuFk0nZwSfRqXS5CBFDSIhd+9oJlZeaDj7XBHusRJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DVhIYHGtFBltDV3O+luzrCRy2ERSUfxG2E/y+H+CT4zb7BwpGNT/SzKAqFT/XCxhe3WU5zzzTyMl+725eiA8smAHT/42AXtyPbQfcG+b/fVHXF0ksQm5vGYneOIyEx8c4KXm76zkRH5FfJT6Si51vJDZ7M9lP5PjntI6a2NfK9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UY9Vm3yV; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UY9Vm3yV"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cb5a6aa8760so1594532a12.1
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 07:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785162471; x=1785767271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Li5tZuE717tlYEzUliD4boes1/6PgXx531SlUxh8t2g=;
        b=UY9Vm3yVx3kue2X4pMqs+Q/3ACKdcVTdVyNJUNDhdkNaySkmrSyzzEtWJ/55TyzkH/
         J8Zhk/4OqWU6iLr8vJsCaD/4JYEE8dBMMMM4W3YZm7w2ZAmvOYjExm8POe8FCS8sEKYP
         pS2X/ZL6DEnSB6Ky64fb7Gq/DZALwdba8SJsoPnjtFzsWdDc+sIqXh0m4tuKjnVex6NO
         g0xLGFrDJa2MoAEKNDGNjGIB7wDt9yzuT/iLPGT4X0c0pXfVkDsVFYr3lIo37Kw5NMhQ
         VvP5XS/5iqYK98bs47wum6m118nLTNpsP6zEEXNosNP2gsmyW4Odj6gVrMqPOw3OKZI/
         VgtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785162471; x=1785767271;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Li5tZuE717tlYEzUliD4boes1/6PgXx531SlUxh8t2g=;
        b=CCvLNVDN1J1SThDjTxB9rXTAdUU0aFsmYRfnVYAaD5QPw1I8uquNMijc+Fag39TgnX
         w+3p5Bn1xpvB2rxY8mWc/4lvT5HhMZLL7yqQl1xP/mge3vB1xzFjDofUXMrb5bm4QKN+
         6p9R5KXZooVjbxZv3EZUcwBqDAeMbyJKqDLevdQBDFZP1ZxPU2iDK1FsSv3/YaUarQfy
         ZTLcLEf0Vu66sAiEqzVX2XzizqT9Tj/fnXRoSfMHQoGLfJoRm15Ub/ES9uEhnCGjKqGX
         bBGVd6na+Pto/R1oYlNt9FuspMvhq55cNSxblGQgKeVOXSF5xSWDydNjKwcIo9VJY+UF
         qluA==
X-Gm-Message-State: AOJu0YzSl1Y9dMI5xKu67W0kKdbbTBnWvedbNdOeq8XSodGdzThsoSgA
	VuiGYj6OICwb+pLrvZhzPTixUNlYkMi5Mf43Rns2xNHe9EyTVXl5ROCv
X-Gm-Gg: AR+sD10Hwz5EePTzl5E9nx/6N3T6l/CI2ddATBi+2tI7xJnKZFkcQAQ9zqVprGd7oel
	+m2i3xHjaypTpBzSezxq4YSjrqWizbZpD08etjaXPDNhfsXCjfKhUkWttzlY/j9heRGOnpkDfSj
	+VHrLMTvVZnVsJqaGb375y8WD0zqgRviZAyjhDE3dcjav32U2DsANkLLi06LoOFwaGUhLE/EA3w
	B/+8h+JUTWc/GaNGfmPjI3qLlErg+yzqZRxi74JimKApKmCS80Emx4wk9p6jXgCwfIMPLOYA6vj
	7QMCk69miuoBNsgSccjm5MTOXw573X074CRZMyB1UKfgaN6w/wQRmLDbkvuTNogSArpA1v1/RKS
	Ghz/NFwyRb9gzf7XJ5ZJJwmnjlXnRIrtIxftRJa+F+/7/GJgUkZlgpPNiuAUUDgx6Xo+SpGCq3c
	u6GRnoqxOhZebjrulp2uKicMnLb1OA9DC+L5zLft3NJvSKssxaefA=
X-Received: by 2002:a05:6a21:6494:b0:3c3:9aff:7a5b with SMTP id adf61e73a8af0-3c67df803fbmr7678921637.50.1785162471051;
        Mon, 27 Jul 2026 07:27:51 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc59cfb4sm32311682eec.26.2026.07.27.07.27.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 07:27:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <74eadbaa-0020-4628-bf82-29fca725fcb2@roeck-us.net>
Date: Mon, 27 Jul 2026 07:27:49 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [hwmon PATCH v3 4/6] hwmon: (adt7470) Fix swapped PWM3 and PWM4
 auto mode masks
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Darrick J. Wong" <djwong@us.ibm.com>,
 "Mark M. Hoffman" <mhoffman@lightlink.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260727-adt7470_thermalzone-v3-0-21424d550c3d@gmail.com>
 <20260727-adt7470_thermalzone-v3-4-21424d550c3d@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260727-adt7470_thermalzone-v3-4-21424d550c3d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/26/26 20:34, Luiz Angelo Daros de Luca wrote:
> The ADT7470_PWM3_AUTO_MASK and ADT7470_PWM4_AUTO_MASK macros are
> currently defined with swapped bit values.
> 
> According to Table 22 of the ADT7470 datasheet, the Fan Control Mode
> Configuration for register 0x69 follows the exact same bit position
> layout as register 0x68:
> - 0x68 Bit[7] corresponds to BHVR1 (PWM1) -> 0x80
> - 0x68 Bit[6] corresponds to BHVR2 (PWM2) -> 0x40
> - 0x69 Bit[7] corresponds to BHVR3 (PWM3) -> 0x80
> - 0x69 Bit[6] corresponds to BHVR4 (PWM4) -> 0x40
> 
> Consequently, PWM3 should use mask 0x80 and PWM4 should use 0x40.
> 
> This typo did not cause any functional bugs because these specific
> macros are never referenced in the driver code. Instead, the driver
> correctly applies the configuration by relying on the modulo parity of
> the channel index (e.g., `channel % 2`) to selectively apply either
> ADT7470_PWM1_AUTO_MASK (0x80) or ADT7470_PWM2_AUTO_MASK (0x40).
> Since the bit layout is identical between the two configuration
> registers, the hardware is currently configured correctly.
> 
> Fix the macro definitions to reflect the datasheet accurately and
> prevent future bugs or confusion during code review and refactoring.
> As this is a purely cosmetic fix with no functional impact, a backport
> to stable kernels is not necessary.
> 

If the masks are unused, how about just dropping the definitions instead
(including the unused ADT7470_REG_PWM12_CFG and ADT7470_REG_PWM34_CFG) ?
That could be done as first patch of the series.

Thanks,
Guenter

