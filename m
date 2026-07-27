Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F7B3C3443
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 19:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785178853; cv=none; b=A404RKgZL8I7hW+MhYNu9c4zfhF1nlKcgMyJdZBVVXT1+J9dq+HS81A/lf9ukb+MYta6adzvKrYRFmOJOJXqFDrEtPMctN3i3ig/7PC+byDTOrnxyhmQ+sOtr26jy3EyKx7GjhcojvT2LX9mxnkFKVRGCdX9xeTc/h5lKsU98bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785178853; c=relaxed/simple;
	bh=pHqlPF2IXxFEfLsXucEr4nceLo+Hyd6ewjdSFK3jx30=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IwLDppn5i0zHd+dqF2M6F8juvMb2K2hjjLnWH4W0o4qGieKk3btUG1z6nfNx5sHivZLjxyJO6J+lrVfM+fM5v6bwsDbw8yAm/Qo08cR39FMnvdze5TJOaUhCUmHwXbS7MqBnBR8aik7eOKRYGJ68e/Ja5uuMb5R2M5GfUk+loPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ijgSIB+U; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ijgSIB+U"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso2321919a91.3
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 12:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785178833; x=1785783633; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d2RlGb9j3Wk/77P8KLAmYhgjh5HfM5b0+29LJClkrbI=;
        b=ijgSIB+UATCkey7/a1L/0CQ1rOUVAZGSSqIzRh2c43uGy+cDn8PlN/s3y5b88U3pPV
         66FuVQOcIgkLXAdawaFMs2KBkXxtROt0r2tyysMyJHnkJhr58a5EQJDHxOOLWM+zo3ez
         hMelQMqHO+p3j5Lb9cG1KLYcV5iArM7Poa4e4a/mfIpe8sCJO0/s9xJkIFBI1fVwfagv
         f/FxiMqBrPzFcaQ7OdVHic8CfQHF5AHK0BLLS82iKZ2paFf459Fqzuq80QwcaGRtlmCt
         tXpWdnyum2ruMBeEE5yDgpuB9AntDBVdSH9/I3RlVPu5P7oS1ydCTav6Kn5Py9zeJDtM
         l0Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785178833; x=1785783633;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d2RlGb9j3Wk/77P8KLAmYhgjh5HfM5b0+29LJClkrbI=;
        b=YZwQUGFvL17+hA/s9/JSrqQ+X1ca76RdCWKfgRbO54Q95MW2PC9TkbpxK2Yu+uaqXZ
         T+FHCl5KvNm7RMh6fEC+yfzhOYKL+SmvbWfX22Cgs6XVCCJ/2nvC6JgwafjN8wGjVQfP
         0XwhmHXHwrdvWYDcFG2bYtlIFKdA/IwabuiRSBXMYbAyszHw8HgKAwbMAn7L0z9/j835
         M56rKMvthYg4NpQTAy21knGvq42Rn2K+4ladXSA+896nR2rCbq4Uma/6Dr7XHjS1slVV
         zZJGX6BGQ7jimVl21npyo550tmWSm8ELE3Ozoc3YVMw3bLLrYvTXlytGbbMa6tdYg0nQ
         4xxg==
X-Forwarded-Encrypted: i=1; AHgh+RpTD4TWQwwJ78Gg37e4Yq0tSnZ4eC4AvJNIbJ1alFWl3Ff3xtlhLxDexjOCG0ue4g4WR2o6lhJLIWiXOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsuOwvzrAbuD9RfxI0zu1biKc6tJosypU53cQ/9t2Sdk/Eyl6x
	Qrltl8xUxWG/7hTUNAXUgDb/ZH9FfcFUmUaiGPdv/BpA6NQ3qgsozFEZ
X-Gm-Gg: AR+sD119WX5Kefx+kaDfAgIdexlS7ezoj9ztHjH2Pv7kvcEr+t2/Ag89eQvjhfQ+WxT
	IpNR7V+bB9VGT/FbYIFhZjVuMT/QaqfBeKyLEKE5u4MNF3K+YUOH+LRDTlPdfaley39TXGAfNbP
	4Ufp3vqmPduTNpFyHUUjKN2YqFN0qPou0ETdqqs3hsCmhulX3YtNP9JsZXDcRD/wspqBWFqm+XP
	+nPIDGiiM5C+ORaafaltTnXcLzLh/vDvD8PAtAnpA99MZ/BwtE6E3fYqehfjy0mSd5juqLK6/XD
	mzElN0dLsUrFdiPtIGz0Fs1aXt4dThb2YlcPi1HxIugbWjPdKLZiEQQjch0mqQuNjLGEb5WnM/b
	EgnIFzuB0IWFSYJUhBS3WlqYZfH3nabw+QJwXt7GfzgSRgaiIMZBxFRd3cMMUP1jIIgBpueBwHX
	CqbjFUbGRgTvDoGRuUy+jmfX5957kPMCH0WxCAnq/iL5tuzKkU03+IyREEI6CEPE3j9nn1mWy1B
	IbMsURneXhZjRljOf+mbQNhP/Blb0pwhi5juR6XZmAxSigPWA==
X-Received: by 2002:a17:90b:58f0:b0:37f:9ce1:735a with SMTP id 98e67ed59e1d1-38f29612520mr8994134a91.27.1785178833365;
        Mon, 27 Jul 2026 12:00:33 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e127asm57166786eec.2.2026.07.27.12.00.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 12:00:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f46d7852-41e8-4fba-ab06-b5fab49d2c9d@roeck-us.net>
Date: Mon, 27 Jul 2026 12:00:31 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [hwmon PATCH v3 4/6] hwmon: (adt7470) Fix swapped PWM3 and PWM4
 auto mode masks
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Darrick J. Wong" <djwong@us.ibm.com>,
 "Mark M. Hoffman" <mhoffman@lightlink.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260727-adt7470_thermalzone-v3-0-21424d550c3d@gmail.com>
 <20260727-adt7470_thermalzone-v3-4-21424d550c3d@gmail.com>
 <74eadbaa-0020-4628-bf82-29fca725fcb2@roeck-us.net>
 <CAJq09z5Etg_1LvEyN10ZmZMPJ602SDG3apdK+j8mDm1A8CoR=g@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAJq09z5Etg_1LvEyN10ZmZMPJ602SDG3apdK+j8mDm1A8CoR=g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/27/26 11:09, Luiz Angelo Daros de Luca wrote:
>> On 7/26/26 20:34, Luiz Angelo Daros de Luca wrote:
>>> The ADT7470_PWM3_AUTO_MASK and ADT7470_PWM4_AUTO_MASK macros are
>>> currently defined with swapped bit values.
>>>
>>> According to Table 22 of the ADT7470 datasheet, the Fan Control Mode
>>> Configuration for register 0x69 follows the exact same bit position
>>> layout as register 0x68:
>>> - 0x68 Bit[7] corresponds to BHVR1 (PWM1) -> 0x80
>>> - 0x68 Bit[6] corresponds to BHVR2 (PWM2) -> 0x40
>>> - 0x69 Bit[7] corresponds to BHVR3 (PWM3) -> 0x80
>>> - 0x69 Bit[6] corresponds to BHVR4 (PWM4) -> 0x40
>>>
>>> Consequently, PWM3 should use mask 0x80 and PWM4 should use 0x40.
>>>
>>> This typo did not cause any functional bugs because these specific
>>> macros are never referenced in the driver code. Instead, the driver
>>> correctly applies the configuration by relying on the modulo parity of
>>> the channel index (e.g., `channel % 2`) to selectively apply either
>>> ADT7470_PWM1_AUTO_MASK (0x80) or ADT7470_PWM2_AUTO_MASK (0x40).
>>> Since the bit layout is identical between the two configuration
>>> registers, the hardware is currently configured correctly.
>>>
>>> Fix the macro definitions to reflect the datasheet accurately and
>>> prevent future bugs or confusion during code review and refactoring.
>>> As this is a purely cosmetic fix with no functional impact, a backport
>>> to stable kernels is not necessary.
> 
> If you build with W=2, you indeed get tons of unused macros...
> 
> Initially, I intended to just drop them. However, just like the
> incorrect macro led Sashiko (and other bots) to assume the masks were
> swapped, keeping them correctly defined serves as useful context
> directly in the code. If we drop them entirely, anyone (or any AI
> agent/tool analyzing the driver) would need to fetch and parse the
> datasheet to verify the register layout. While the datasheet is the
> ultimate source of truth, reading PDF tables costs more than reading
> well-defined driver constants, to the point that agents might simply
> skip it.
> 
> We could certainly drop the unused macros and add a comment explaining
> the layout, or even rename them to better reflect their shared usage
> across channels (e.g., ADT7470_PWM_ODD_AUTO_MASK and
> ADT7470_PWM_EVEN_AUTO_MASK). That said, simply fixing the unused
> definition feels like the cleanest and least verbose option. What do
> you think?
> 
>> If the masks are unused, how about just dropping the definitions instead
>> (including the unused ADT7470_REG_PWM12_CFG and ADT7470_REG_PWM34_CFG) ?
>> That could be done as first patch of the series.
> 
> I'm almost afraid of touching anything else here! Fixing bugs in this
> driver feels like fighting a hydra: every time you address one, the
> Sashiko bot sprouts two more. :-) I already have seven.
> 
Good point. Normally a driver should only provide definitions which are
actually used, but for an old driver like this one ends up with a lot of
churn.

Note that you don't_ have_ to fix all the reported pre-existing issues.
It is very much appreciated if you do, and I tried to do it myself, but
nowadays I only fix (or try to fix) the issues marked as critical and/or
as security issues. All I really ask for is that patch authors fix all new
issues (and that they don't tell me that I should accept new issues because
the driver or some other driver is already buggy).

Thanks,
Guenter

