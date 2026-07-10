Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065C42E1C4E
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 14:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783692101; cv=none; b=CJrluDEjHHitDvlKYrEXtgZY3jJwJXr0al9QAOjhbBCE78eo8rjuFUBb5/jyolNrNJLqGdFbp2Hl03P4HGXrRXJ6bVT7shMzcld8H0krPsKSkA5lcS+Kt2H03Di/bnX4KEAbXYKYSeDh91fWCtUR276H/QpgqzoWcSvW3mOF60c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783692101; c=relaxed/simple;
	bh=J5KhfHbAcCyPwu8i6GaPe5TFLUQwg3eDvMY0dJ8fI98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oUP3JgqPpfUvenLcioRVtRuJX55jCyzS9D2od+CHzxEE3kw+bnfNuJ3CDSGqYPbOQwrqVWHAQqHFVIBtFs1LzrelA2qMMo602nP82rr7nn+NIazOe4puBCPZbFKtvvr/kUK4lgk4Sh55I+HFI5jgfmyLwgPfxj32u4tC7RO/40M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gsjvXh7v; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gsjvXh7v"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c999f162c9aso523664a12.3
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 07:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783692099; x=1784296899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Q+blbOuY4CPEX29G3F1xX+mj+/hhPJrs7ehYrVQ3zs=;
        b=gsjvXh7vIk1KtSlpaYWXcQsNxGYWMbK/0cT25wjn52bXOmb+5SG4i3cNqDvwX8znl9
         r6FcEmCK3Gx11mo8l8HF5p99VC3FFfIEiRcNsBbzAHwoHpfQrTNj7zUEcoJGTRt8XyDT
         PkUJqoYvKRSMAlupnR9b0X1LtnTXRC0anIM5ibIuyQztoQizItFvGPgYBV1gUeb0pG1X
         wqUgZM1eHEJSsYhy6KCX1vTgNIupFJ0rsfKcJok3sIVG22cXVJjmMOOjMzjqXPxM6oay
         KKzdEFhCEkaxHLLBXPgEWNyH62sRwgBUSEXHbP2+BIx6D0MJfaOdWxLgfFcn4kzs6hLF
         zCBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783692099; x=1784296899;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1Q+blbOuY4CPEX29G3F1xX+mj+/hhPJrs7ehYrVQ3zs=;
        b=FdBdPmxSTnFXTMtM13K/D+F9ThO/vlgj9OfVnpINsvHY0ffWLylz6U8mU9JXJtm8QE
         Ax5csHDFc69ripE0epH7H64p43IAUnM575E7zyH8dcscPc5ObJNBpsBa3s7yaZrHJmTb
         dQloP9nR97gNeL+bRC1mp+zCt0EqBTwE/KRZEJ+uglsPmMn3OnaynDbt3OnREPSYthAD
         Yk7/+cjdiiDZIm80lnuJ89zfHDd2FwdGaQU8gkLGUUkzD36tQP5sToZSEIbCPbwrhUU6
         GKZao2c9kdkpwUo8BjKEDBrCoATQgb+nP2D5fj57AXVqhn0GmWlED+z3ROklHGIh/3DS
         JiSA==
X-Gm-Message-State: AOJu0YwEdPMGDDjuYHKND1o/XCiipsU4vAyldYPSECbyJTmwOp7J9uEd
	j+ftzjaTf7oSoO6HpsE3l6XE0PGYjG4ZWAyHJtCcaf4dOjwzzVn5Qawz
X-Gm-Gg: AfdE7ckF5fJCf4Xm6EpaaohwGXdiQOgzbPqMf/UBLA1r4X7RMvHsxAb/R8g/WE65kTR
	vqY0XKpTk3b94U97J9Lqqr3LWDJi076p95VFVJ3E87BAy7yhL8D1YcecEcCqyd3vQpr1zX2Gl5u
	HPkezrhJahEA2kCUBvnzIt2kx6gWQhO5IW1du/M1RUVuYb75WnCZ1BHs9GiqJ9gwSJspXuh/NBa
	1T7MTsOBBhWvHWSmrTUOMrcBuCMaL4+DweUb3IVqNnmNr7j0HWfPBEmRlAfH4RCeq2XVQFzI6mG
	5ZUEU0KoVd7d0vR7vr6QICqJ9B7p7rF4t40Z3kje5DYzuAEcK//A4iO1WNkp4urkmxu954o6Cw5
	8rQ1D3CjixRI8edZAxjjxnbars6NGnhrC7bZAzNqNp4DLrTONRqjYzg3KEp4uNi4k48Nh8R23sA
	XrKhS2kaPlFx7BI8zmrvusL4CCv7sAPpK/kIjq2SN9Wj663wphFg0me1iM4an8/A==
X-Received: by 2002:a05:6a20:6a21:b0:3c0:9c1a:8939 with SMTP id adf61e73a8af0-3c0bccbae8emr13775826637.65.1783692099125;
        Fri, 10 Jul 2026 07:01:39 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b31628c1sm5136553a12.19.2026.07.10.07.01.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 07:01:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <99c83d9e-129a-4db1-b0bc-dba75c07708e@roeck-us.net>
Date: Fri, 10 Jul 2026 07:01:36 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] hwmon: (applesmc) Convert to
 hwmon_device_register_with_info
To: Shih-Yuan Lee <fourdollars@debian.org>,
 Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260710123236.10508-1-fourdollars@debian.org>
 <20260710123236.10508-2-fourdollars@debian.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260710123236.10508-2-fourdollars@debian.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/10/26 05:32, Shih-Yuan Lee wrote:
> The legacy hwmon_device_register() function is deprecated and triggers a
> warning in dmesg during driver initialization:
> 
> [   24.706091] applesmc: key=620 fan=0 temp=37 index=36 acc=0 lux=2 kbd=0
> [   24.706270] applesmc applesmc.768: hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().
> 
> To silence this warning, convert the driver to use the modern
> hwmon_device_register_with_info() API.
> 
> Because the driver creates all its sysfs attributes dynamically on the platform
> device, we define a minimal struct hwmon_chip_info with a single temperature
> channel and implement a visibility callback that returns 0 (hidden) for it.
> This satisfies the new API requirements while keeping all existing sysfs paths
> and attributes completely unchanged, ensuring backwards compatibility.
> 

Novel, but that would completely defeat the purpose of the new API.
NACK.

Guenter

