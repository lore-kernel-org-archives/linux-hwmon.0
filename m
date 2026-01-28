Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46392D063A
	for <linux-hwmon@vger.kernel.org>; Wed, 28 Jan 2026 10:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769594680; cv=none; b=DJ3PxLgX4IE2jNFeG2pphCd1hvRhydggM4llMqdBsYKLf+2aWaBFnBuPnJs00n7fD/h2jUTRdVqALbSvMFTgOTwrevy1SwJ3cB5YGnpkbo8C7aLWI/AogKI3kh/ecnScPy/0g84esc6J/BZNGAqksQ6Y8Bvu4YqQ09PUFpLxJ1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769594680; c=relaxed/simple;
	bh=Spqx017qfhJukx0SYKKBM9uy3xn32UHNxghw3m5M4cU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EV9H55T/7nsGzamb34FjuxibIn9IhjIui5mGkMdFGLh7O4fLozwoa5OrswbkBnGQRh4m100bCyKpW+Um0S3zwpLJ/HHDIXBPwcuQX2N2p4PROZW7VPahjNKSKt3CpaNtR5ua7LBNyEhDWZFIeLZe4KfzSaCgMnfpr78xDIdqxLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b4tzuRsA; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4tzuRsA"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-124a1b4dd40so481206c88.0
        for <linux-hwmon@vger.kernel.org>; Wed, 28 Jan 2026 02:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769594678; x=1770199478; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=yka4XvKsbPK175AozIx6h04IUtLi9QWdEcMSxR6cM6c=;
        b=b4tzuRsAu3jjpN5F8gzJVFWFeLvr73It+f8UR+3dgMxK5VAyL0LFqi4WsUWJhZsC+W
         Qfb34fz2Fe3RcyRvXEi+6iJv8g1EYfUBfdYN7E0Nn8huDafbBmGrj8D9MHALo8C3gYlL
         TgWBc51A3ItH7/ur6TNd67Ort0LTZcHuEvXKeSBVXZbKA/R3EIkNgIZYguECuFMQisiQ
         ZtngM3dwy6A6KAE4HvFRJbzIaX1+qohDXCiz/LzSB8t6bAJTXzQjn0vx83kPKbHodKUv
         a8AuGuzNRBVC9DM+H4O1XYT+3PQ+JhJ5Kz/ACEp9ED1FsA79Fd6ZqZP0ATtZMDf6trrx
         9oXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769594678; x=1770199478;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yka4XvKsbPK175AozIx6h04IUtLi9QWdEcMSxR6cM6c=;
        b=tE1qk+7/Bfw7xDVLrOWsMUa4kFCRnsUWZNrqI3KptAT4BH0SpDlrWLxTNUDAz78kQY
         0G1kVfZNa4DLPINI4osQx8YEamgYcqTdyFtdDF84PMUUOkSm5ysWGPem0AaVVHvY8Vk4
         N5kyKWB1vWkilYVFQKJJlEGia8WBnziKx8mxzvC6MgPtLzpd1UW1DsY1IXi/8AaUD5Mw
         DsgO5YNuHmx6fZ6MS5/LHrjvn7iHJmitJEjcpv4ntBR8Pc7iUu2zS3vxE3y16BJfslZK
         Y/8kPwzpH3ZM9J1klQICmD59HnVZUC2eRl1z0zEDScn0WzeG+yIVCITXXBQXx4i6QmUw
         Yezw==
X-Forwarded-Encrypted: i=1; AJvYcCWObN8Y2hj+QkhBXfEk7OyXTcRhg0TQgvRO+/i5Hu7vDtSyFXx0X6Gq9OppNKxLR2/HWiru0fFIESgLqg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy37s7WrlpnWHkIIPauwyzPzbIZPSU5XVHaNH0rNoWbKsS/iwYr
	PWfCXcQNqBb6nlj/hjYsKnaaFCQ1k1lnuuWK5sTXkuqm06HccJBfMue6
X-Gm-Gg: AZuq6aKxh+bBRHLk0o1w0lPTG0aQaGtNYNBA8deDByqTFTMZRY94deQqvvV9RxarUrp
	oG53Upq6V1CTAptxA7fICON4KwJduAU3z1AwMRqH0ckNkPjpTOBaCYFY4ARXuf/o/COM3TlRv3K
	MWXkedYE8zJ5wmWa/HfAg+xhPD+m/TCyJ9G6jZoBNhOB17ZvkcoWOwL6wn/0JSvf61J1Idb84u/
	PdMotWr7Jf3C4gIoB7JM6KScJQpfiC98FLRN8raA4jMwai3SmRfDqG2rvqRLIq9iMT04cnC1e/2
	JPo4ntMW1USziq9/v9xETvwbiJJt8u+5EDxYyj+V3BwLZvBgV9fZoiDiwXHctZJLUS1mAos2j51
	bbKjAVDzib8dl3Nt0wcwOJ3eBCl5FjsyRZ6f8OFGOaMjVHEL7Y2sns3U0gHo3Edd/NTEHkYATic
	tZkgSfv6YGpVXp2s32owSy8WhGb56y6nyKJQrekf8j1XtJvvIttG/C3FImYvQM
X-Received: by 2002:a05:7022:912:b0:11a:3483:4a87 with SMTP id a92af1059eb24-124a00684d4mr2885435c88.13.1769594677845;
        Wed, 28 Jan 2026 02:04:37 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9e0304bsm1734558c88.14.2026.01.28.02.04.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 02:04:37 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8efa188b-8b91-479c-ac10-3fba5b0cbb5f@roeck-us.net>
Date: Wed, 28 Jan 2026 02:04:35 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] hwmon: Add support for the LTC4283 Hot Swap
 Controller
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>, nuno.sa@analog.com,
 linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, "Rob Herring (Arm)" <robh@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
References: <20251223-ltc4283-support-v5-0-1152bff59a61@analog.com>
 <eed64bf1-93af-4b36-adf5-1476cb40edbb@roeck-us.net>
 <382e259ea3835ffbd2be9c36b529875f5a43f38b.camel@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <382e259ea3835ffbd2be9c36b529875f5a43f38b.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/28/26 01:44, Nuno Sá wrote:
> Hi Guenter,
> 
> On Tue, 2026-01-27 at 09:39 -0800, Guenter Roeck wrote:
>> Hi Nuno,
>>
>> On 12/23/25 04:21, Nuno Sá via B4 Relay wrote:
>>> This is v3 for the LTC4283 how swap controller. Main change is that I'm
>>> now using the auxiliary bus for adding the GPIO device (done depending
>>> on FW properties).
>>>
>>> Similar to the LTC4282 device, we're clearing some fault logs in the
>>> reset_history attributes.
>>>
>>
>> I ran the patch series through an AI review. Results are below.
>> Please take a look.
>>
>> Thanks,
>> Guenter
>>
>> ---
>> # Deep Dive Regression Analysis Log
>> Date: 2026-01-27
>>
>> ## Commit 5998c620fbd8: gpio: gpio-ltc4283: Add support for the LTC4283 Swap Controller
>>
>> **Context**:
>> - Adds a new GPIO driver `drivers/gpio/gpio-ltc4283.c`.
>> - Depends on `drivers/hwmon/ltc4283.c` for regmap and MFD instantiation.
>>
>> **Findings**:
>> 1.  **Typo/Naming Issue**:
>>       - File `drivers/gpio/gpio-ltc4283.c` uses `LTC42823_ADIO_CONFIG` definition.
>>       - `LTC42823` appears to be a typo for `LTC4283`.
>>       - `drivers/gpio/gpio-ltc4283.c:26`: `#define LTC42823_ADIO_CONFIG 0x12`
>>
>> 2.  **Logic Verification**:
>>       - GPIO direction and value setting logic appears consistent with bitmasks provided, assuming
>> register `0x12` and `0x11` layout is correct as inferred.
>>
>> 3.  **Regressions**:
>>       - No critical functional regressions found in this commit alone.
>>       - Code quality: Typo in macro name.
>>
>> ## Commit 82433332ce16: hwmon: ltc4283: Add support for the LTC4283 Swap Controller
>>
>> **Context**:
>> - Adds core HWMON driver `drivers/hwmon/ltc4283.c`.
>> - Handles I2C communication, regmap initialization, and MFD child creation.
>>
>> **Findings**:
>> 1.  **Critical Regression: DebugFS Use-After-Free**:
>>       - `ltc4283_probe` calls `ltc4283_debugfs_init`.
>>       - `ltc4283_debugfs_init` calls `debugfs_create_file_unsafe` creating files associated with
>> `st`.
>>       - `st` is allocated with `devm_kzalloc`.
>>       - **Issue**: There is no explicit cleanup of debugfs entries (e.g.,
>> `debugfs_remove_recursive`) and no `devm_add_action` to handle it.
>>       - **Consequence**: When the driver is unbound/unloaded, `st` is freed by devm. The debugfs
>> entries remain. Accessing them triggers a Use-After-Free on `st`.
>>       - **Fix Required**: Use `devm_add_action_or_reset` to remove debugfs directory/entries on
>> driver detach.
> 
> So actually a nice deduction from the agent but not accurate given that all the entries should be
> removed in [1]. If you want it to be explicit, I can add the action but given that the dentry is
> given by i2c, I would argue it's fair to assume i2c will take care of the removal. Thoughts?
> 

Good point. You are correct. I'll need to tell the agent about this.

> I'm also planning to pick this up again but was caught by something else. So hopefully next week.
> 
> On another topic, I also (you questioned it in another thread) looked around and I do have a ltc4282
> board with me. Given that I just need to power up the digital parts to access the i2c bus, it should
> be pretty straight to get a register dump. So if you're still interested on that, I should be able
> to do it.
> 
Yes, that would be great.

Thanks!

Guenter

