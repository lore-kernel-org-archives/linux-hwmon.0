Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13283515CC
	for <linux-hwmon@vger.kernel.org>; Fri, 11 Sep 2026 14:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789138380; cv=none; b=l4g1OLB8hEtG0fXeQN2UoJUVpIXExYpGAeahZ/59GrilFoJgHLJ6+q2kTU/zMQjC5A9Et8grOuEzgilvmcGCMLHhwOO6+wGcmmMzX7ixgAzDEdikBWoWaV6RUnSXJNHmZaswJiW8A2TlM0yShPno3Fd70+mor8UEUyZ+yu/6srU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789138380; c=relaxed/simple;
	bh=fpmxr0cgb7peufCFX/fraHzTpsYDsX16E32Gu2HRJUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BSMoFjmAMUmy8Fj9Oi1D+JLJ4VKMXsE7o8uf74tbie8c5ITr462gUXzCRd1z9a+VQxZTxtp8TEUg8f1vpc7emG9vLEJYatnxQ5qwfLBlCSmpY2EaZEemDsj/bjBr9RZ+cFBVsPAeUl798wbhMR+CvXW2nYRuGIPv+qd8PjanC3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CP4n0Fok; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CP4n0Fok"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d6d28aa26cso7360155ad.2
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Sep 2026 07:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789138378; x=1789743178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LdoXE+ewf5jb6LQYyxh8lGBqTy0FzOqpYpBgqMKD8BI=;
        b=CP4n0FokueOIkLaqHEum6A2E1+govAVCb88p7EccdT3A2bXJxTbrThB21hzskyKVZE
         /Mw/FsmnsT74q/bL/RGdwuFHA1+KFVpG8UDqnQKGgYHWnhDAHAw1aYxFiJ+D/dxhIeQA
         AqqJJoLU6sQm5TB53nKxdsLmyeVKdGsExhC27PmWh5sT1BmBiMW0t4CuMMWlsBwHfh07
         xoGhmNDpC/pDfaD+JYZzWqZjQMUGLwetXXIv1mJFJrWhLzQz0HD6tICkfkZsoJ7OdSL2
         4AVJAie3Cny9VT8UYh8/h8SI6f9xRGBLkWhmTEda+KqzXJznHF9NucRQcNlozKL79Si0
         Wedg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789138378; x=1789743178;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LdoXE+ewf5jb6LQYyxh8lGBqTy0FzOqpYpBgqMKD8BI=;
        b=YHkOY+Za64xVaYjsmFE+rRRWNDixBf9M1XkclDudVSSBx9Cz0cMjn5aK6fV+Pc/RUd
         gTmlsa9s+5jWz3oO6pps7Ajfd0XGgsMyTYJTp0SloSNX93KI0uho2BBqRH7nOL2uHSHt
         wwb1RiHXbczLXgQKVlr85sdrk4TnL7YFj/yp69ILsGp913035hm4CkE8+qFgbAF+wxkX
         hvkDGJYyJtUZzfa1KYMJCMOLOUQnFydniQePwFnJ308V6KWJjn/xemlly3Wj6SI8nHIQ
         IpVhjMSLQR5njXZjQJBkglZjAYPnN+X3v5/vjjlRZIwH9TbYId6mXRuSXVjbYV98LWxk
         qrRA==
X-Forwarded-Encrypted: i=1; AKwUvBx2sk07xEtMc7TjZpKFyY+PGgcftKV3Ug7iwu7XQaQySjiMp0qSDbcbEhwD0RhUuuInUbBizKL2UhIWcw==@vger.kernel.org
X-Gm-Message-State: AFuF++nh6dVxKIbHn1UuRtE0jblM4OYpL/H2yRPbjNjUjUkBWpyjPHVk
	VWzFs/pNnzX4hm4U1kPqkUB7Lgq2CykkcpJuyQmdWLeis31MAgqIZzH9
X-Gm-Gg: AYBFou0e5HmctlaypzayAZwYV10yfdbG0IPX/EUyOwCAI+Hwx9rrHcrCLhm4EQ99XX0
	SjOiyZ+PZmwn9Id7IsgEz3Yl31zem24+cDq6OanGARwDWPYssUyN8eskYrEi8g3uK+590JqqzaJ
	wnz6ntrHH/AZLEezpiNotSIxmUQfjLohvqHWteSdP8YbHpnjUbdzWWp/SYGEAMI3nSyLL5/6rDA
	xq/cYfRA9wALrct2IdCP8OEoN8PysvvOZVRnQtJhbv8KAOUgUe/e8kue2LVL7POP9F/gTd2wEx/
	Jd0JW3+hkZzi3ZBpApuNIMnPN0HbxSz8Ga8JTJ/Rw+OHXxAY/jryW/8MOwRV40anKH9ExzsmFn2
	v/pJTXXzXVzcttabdYnD3GiZApm+VaSh31E9F1ndzKQtSrfhvmbIB2HW1Aaipj3b5PKhZ05J4Dg
	Z42cI9asKOCrp1oSC/GDBYZkFm3d6h5LKmZJgWtR2uWVj1B3GIbbW6yNHr2MDr9rf4T49Vt3ERr
	KwXQ3Xiq9N3B8bV+GWSoFa4599VbW7hictg6/QcLXDxwUYL
X-Received: by 2002:a17:903:1b4f:b0:2dd:40cb:a054 with SMTP id d9443c01a7336-2dd40cba32bmr20018355ad.19.1789138377973;
        Fri, 11 Sep 2026 07:52:57 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ccaceafsm12899705ad.9.2026.09.11.07.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 07:52:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <518aea33-277a-4d8f-8bf7-7469879f6f56@roeck-us.net>
Date: Fri, 11 Sep 2026 07:52:56 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] hwmon: add Axiado AX3000 and AX3005 PWM fan
 controller driver
To: sashiko-reviews@lists.linux.dev, Petar Stepanovic <pstepanovic@axiado.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20260903-axiado-ax3000-pwm-fan-v2-0-ef43df46163e@axiado.com>
 <20260903-axiado-ax3000-pwm-fan-v2-2-ef43df46163e@axiado.com>
 <20260903084844.D1CC11F000E9@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260903084844.D1CC11F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Petar,

On 9/3/26 01:48, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The interrupt handler incorrectly returns IRQ_HANDLED for unhandled device interrupts, potentially causing an IRQ storm.
> --
> 
> commit ac0edffb2c72d464c05c340c5df147fdcf10b0f4
> Author: Petar Stepanovic <pstepanovic@axiado.com>
> 
> hwmon: add Axiado AX3000 and AX3005 PWM fan controller driver
> 
> This commit adds support for the PWM fan controller found on the Axiado AX3000
> and AX3005 SoCs. It measures fan speed via a hardware tachometer interrupt and
> controls the fan via an external PWM signal.
> 
>> diff --git a/drivers/hwmon/axiado-pwm-fan.c b/drivers/hwmon/axiado-pwm-fan.c
>> new file mode 100644
>> index 0000000000000..ac153afded47a
>> --- /dev/null
>> +++ b/drivers/hwmon/axiado-pwm-fan.c
> [ ... ]
>> +static irqreturn_t axiado_tach_irq_handler(int irq, void *dev)
>> +{
>> +	struct axiado_pwm_fan_ctx *ctx = dev;
>> +	u32 status;
>> +
>> +	status = ioread32(ctx->tach_base + AX_TACH_INT_STATUS_REG);
>> +
>> +	if (!status)
>> +		return IRQ_NONE;
> 
> [Severity: High]
> Will this handler cause an IRQ storm if the hardware asserts an interrupt
> where the status is non-zero but AX_TACH_INT_PENDING is not set?
> 
> Since the condition only checks if status is zero, an unexpected bit could
> bypass the IRQ_NONE return path. The handler would then proceed to clear only
> the AX_TACH_INT_PENDING bit and return IRQ_HANDLED, leaving the actual
> hardware interrupt active and bypassing the kernel's spurious IRQ protection.
> 
> Should this explicitly check if the AX_TACH_INT_PENDING bit is set before
> processing the interrupt?
> 

Please address this problem, or explain why it does not apply.

Thanks,
Guenter

>> +
>> +	scoped_guard(spinlock_irqsave, &ctx->tach_lock) {
>> +		ctx->tach.count = ioread32(ctx->tach_base + AX_TACH_COUNT_REG);
>> +	}
>> +
>> +	iowrite32(AX_TACH_INT_PENDING, ctx->tach_base + AX_TACH_INT_STATUS_REG);
>> +
>> +	return IRQ_HANDLED;
>> +}
> 

