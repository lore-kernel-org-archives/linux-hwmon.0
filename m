Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3B0431A4C
	for <linux-hwmon@vger.kernel.org>; Fri, 31 Jul 2026 15:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785512507; cv=none; b=DDkL/O2sU4xCJ9yNP6FEt0nQzeBlTYpW5PgnPH2BXXMPejLNMYPY4+2lG4XNKi4iLXp+ZwpH3zioHQkJwJ9lyZvhHtkGnNidBDupe6DVgykrzaErcb/duDnHtFBR9q/SrUS6FM/QQv6Vu9o1h8SOl1zhQQVJKD2ACI/T8OjDJtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785512507; c=relaxed/simple;
	bh=S4jWNwVoxryXpmJIFJfRQm2pWsgWhn1eAO+Cz/kh2xs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QFLf/C23gMArJadFhbtbcaUxhdknTyLvNbrt+VKnqyCCQ72cshqs3aIU4oJpPntbLbHiRR1/mfkztvqJqJ0KG1bWrXFguk5I3mUZNidkgmdeBhqy9Hc6lrOs/x7umq8EJQb9WURkPz590PtdHdpsAJi/Zka9T088mbrN5SZQb1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=acu1wPhu; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="acu1wPhu"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so881467f8f.2
        for <linux-hwmon@vger.kernel.org>; Fri, 31 Jul 2026 08:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785512504; x=1786117304; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3K9wxTq+qtlIZodCkySxOtPkp6Ej9MjKQ2UkyW9Dq8A=;
        b=acu1wPhuStqPRmTRw1Mc9EAaai9PUJNQa/yNvXrUghkmsp/32skJFF+sUOssbvNANa
         dEMuegtMjFOWEtuPB1zrGytddxXmZncAEmq502rJWAG47Kqnaf9G/lGxemXLr64GIiMj
         lwZ+cXt0obUUjSEI/QLcbonth93RZCF2FHM1wEQaaTZLVXRgez5UlQq0Fgc+rkpUgdi/
         qbYkM3BlZYK8CqpdBAEMGqmMQIiFZlFR1wqMQHbw23nzPkgXNUoUQ+lfiJDlARbN4qkH
         GH4Rkax6FXZ+N6j6PtVTdJiY+KH72qwDGb4InFqLvBIoudY7nuhiZHEKm17eu9H7vfjp
         0Wxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785512504; x=1786117304;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3K9wxTq+qtlIZodCkySxOtPkp6Ej9MjKQ2UkyW9Dq8A=;
        b=aluJ7r0GGdhbXB3+KhoM2ZpATdGoUjWhaj0/zPK7clOY0toAZNMclIyJCzfOSKDftA
         TF+PBmBYXVk6R1EUm0ZluBpTaJ01c55qgg65sTQsKp+vLGlIlEqZihIVLvQwuBUZtWIM
         3lZg2eKlLfMSPU3TK2cpyGH7gDnH0ggwC7GpAPAQxlB8M3Nz0DCL4XoNNnPURy3iYeYK
         IYGfOpfoq7e/2JXeVg+sNsq8f353JxbP8rkEV9EU9x+wRLPIsSSAX42jAHbK7BGm/lBR
         VL6ZO6UHqstyHk24xvEeqXY9kmlzMV3xk/UoesEWrK1+Olcdxjhl+pu0JMGj2/q2TEAz
         3ICQ==
X-Forwarded-Encrypted: i=1; AHgh+RqsjYffWNPm0fo66RyKN3Z7w3Pl42HE/p+KaRgas+2p+JHScb19hZVQ8DXGD0mbxTMMCucnb/df/i1t2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKDNsDt3jjf174AO3l8D0GrvQC6VfxV/xUwlbyFIu2ms4wT35S
	FZ3xJ6j7DWnNOMlB5qv2A9IxW/iD0TlZ0W7yDCO+eJfeVTtMjb5ZDnkH
X-Gm-Gg: AR+sD108+iTvZjrQGsIurMPUBBg118VaWziG8WS83NsVB7gN2eD4Q3qMoYgAoi0P//f
	F5/2AwfvB/3t0K7U6WCc2vC6RK/DUzwrdg53YFQjz+zGIEB55Kdj7flCsWnEcqvWWjRmcngKeAO
	hjFvgKTTS1vDvK1ULol2HyMJwComqoL6IfMeNBvzyd8Rv5jT1XwDp611vAhGZptIgPhSHrrVvEz
	9UYdTP6itIbYAQvPzOZp06QVR4X8nnBSQecF55un8NfsODa1PytG9PjaS6TM2E97/SYQzzT3KMh
	afgzqiEhr+vQKAh3HUDfPT7gIKCCahNSjwpSpUTyca3kBq6xl6injABveoxGZQk5ZbivWzjlE0D
	Xz95EEX7QimyIkxGGLwoX1pdEXC69P1gCFT51FGk+fRBIXUGzdCP9i8QKJ8r3PVaDjmiju+9JEU
	XwtJPaH4KQEZg+ZpFQW4nYvygiZwLVK+vKcK6Bi0pmD8Ymq5Mw8TaP
X-Received: by 2002:a05:6000:38c:b0:47f:4fbf:7b21 with SMTP id ffacd0b85a97d-47fd729e5d4mr328900f8f.12.1785512504593;
        Fri, 31 Jul 2026 08:41:44 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41cfdc6sm6066261f8f.8.2026.07.31.08.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 08:41:44 -0700 (PDT)
Date: Fri, 31 Jul 2026 16:42:53 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: nuno.sa@analog.com, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Alan Tull <atull@opensource.altera.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 3/5] hwmon: (pmbus/core) Add mapping function to
 pmbus_read_block_data()
Message-ID: <amzB2aw_4y6ji9zs@nsa>
References: <20260728-hwmon-max20826-support-v1-0-224766e0acd1@analog.com>
 <20260728-hwmon-max20826-support-v1-3-224766e0acd1@analog.com>
 <c3e143ed-af08-4a0f-a630-96a255df838d@roeck-us.net>
 <amtewh9lOgWz0-Nh@nsa>
 <e37df572-1ca9-4c56-a16e-faa44f1ff1cd@roeck-us.net>
 <amtqPQSM6zsiCh4B@nsa>
 <6287e749-04f5-4a03-a91c-fcc705df269c@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6287e749-04f5-4a03-a91c-fcc705df269c@roeck-us.net>

On Thu, Jul 30, 2026 at 08:54:25AM -0700, Guenter Roeck wrote:
> On 7/30/26 08:19, Nuno Sá wrote:
> > On Thu, Jul 30, 2026 at 07:47:37AM -0700, Guenter Roeck wrote:
> > > On 7/30/26 07:27, Nuno Sá wrote:
> > > > On Tue, Jul 28, 2026 at 02:05:53PM -0700, Guenter Roeck wrote:
> > > > > On 7/28/26 09:03, Nuno Sá via B4 Relay wrote:
> > > > > > From: Nuno Sá <nuno.sa@analog.com>
> > > > > > 
> > > > > > This is in preparation for adding support to a device which needs to
> > > > > > use it's own read_block implementation.
> > > > > > 
> > > > > 
> > > > > The chip-specific implementation calls i2c_smbus_read_i2c_block_data().
> > > > > I'll need to know if this is a chip limit or a controller limit.
> > > > > If it is a controller limit, a chip specific override would be
> > > > > inappropriate.
> > > > 
> > > > I'll reply from top of my head (did not looked at the driver again).
> > > > IIRC, the biggest reason we need the chip-specific implementation is because of
> > > > the RAIL selection logic (mainly when not in page mode).
> > > > 
> > > 
> > > Yes, I have seen that. Question is why you use i2c_smbus_read_i2c_block_data()
> > > instead of i2c_smbus_read_block_data(). The rail selection logic would not
> > > require that.
> > 
> > IIRC the reason was because the i2c controller on the raspberry pie does not
> > support i2c_smbus_read_block_data(). So I guess this:
> > 
> > https://elixir.bootlin.com/linux/v7.1.4/source/drivers/i2c/i2c-core-smbus.c#L220
> > 
> 
> Hmm, I think we really need a common solution for that problem. Not all
> controllers support i2c_smbus_read_i2c_block_data(), so you are just moving
> the problem from one controller to another.

Yikes. I actually though i2c_smbus_read_i2c_block_data(9 was more widely
supported (if not always). Not sure if you have something in mind but
one straight way would be to choose different implementations (for
read_block) depending on i2c_check_functionality()

> 
> One key example is the PIIX4 driver. Your new driver does not support the
> majority of PC style systems with AMD CPUs.
> 

I see!

- Nuno Sá

