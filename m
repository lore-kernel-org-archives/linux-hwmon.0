Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF244C97
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Nov 2025 03:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763696288; cv=none; b=WAIIpsfj86xt5KvwjYSm4M2gq8WzjRdq6CECEkYy8wtG9RLFRCxXt9w4Bwbufi4PTVLFzPyQz4EqUi/JyQUUM+bIDwWDBWR0+WvsdYy73Eh9aa+kA0ygj9gpfOk3MM3mInW/WgH2rmGkKpWPeSlTUA7gKhyT6hQhFfaav82XBL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763696288; c=relaxed/simple;
	bh=VAFkQ1nwzctxrJsda1Pemo5hKIDedJnXWLzf52b8f10=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qA5kHgsAZU5x4C3Zna4NPC30NtYNTYgC5kNCt7BAyzST2KVSBIFNuH9wxoByuukQqe8Xn1tVKV2lnYjdoT/s2duBr7TGBmzJG8EsAVV34WIR0K1AbERKTvAA3ofACcevaQxXtGTIt5N+5rLiKuKoClEJ3srPXQsjxPhin+ED49o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=itZwDqvo; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="itZwDqvo"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7baf61be569so1847947b3a.3
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Nov 2025 19:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763696286; x=1764301086; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=AwZoSam1/OrjnyRLGJiIBVP09PKNcQ9+d8b42MoA618=;
        b=itZwDqvoKc2NasAgNwN1SRiN4Nqxaob8OO85cwI5CaVRGIJGhTULc6okeYz8Xvl7n4
         F7qrr7T4iK/ytpSGbxAtKSAQJWV3eQqTIZP09YN5kpIuCbnZEDFETeXdvB92dHFNlZ4l
         aZoZ18k8k/bysuxUqBAE1/THpqC4UFtiECrzwqa+zR92VwlMAAjlzE5RFtLZ4VXlm61e
         rbRBnjeitu9350MAnqzLvz3GNosEZVUfwS5G4rKs3AkArDjKWPG/gBJawgZhIFNFlhp9
         DJyIODTtI8Hi5pHTVGsUDuAZNb7DuU03J7IiptXL81+NeHQaLV5ik6oVzHG1Md2nRnbw
         cUEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763696286; x=1764301086;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AwZoSam1/OrjnyRLGJiIBVP09PKNcQ9+d8b42MoA618=;
        b=pes8o7ZYfZG5hZAWlUsgjz8LoNO941cIsZwPylIYOYcTT8KmFupc+C9glSEaDwP9Ib
         haLFJaoNWy4WTHBZPM+iY8n17Ltwm/9ChWFkVtXwWnnbR+IEftJgaz0Trc2qj/UwBmzC
         LVrUaX2BKJJtG6tHliOfSSQZuAlkBVdV/YOm/B1ykIecGaGieGrIaZrSCi7eNeZTnEBt
         NGtTb1omJ7XBQopIiR6KbEFL6oe3bbZSmYw3fg1dHlwJ5AlqDbijPd/ZtPizh+J7Cosq
         w2EKWcNaMCDVuwgyzfl3VhGpJbn2b+NoZWXaeqFpWPFb0XXShTXqri6kM+iUU66FTcbd
         epbg==
X-Forwarded-Encrypted: i=1; AJvYcCW6nxHZJUCnyPTq6sObLsb4qYXQaToKyHxxZeOu5fh5XOxRDWxfde5XWE2lSyRT2hYxYsIolXerkiR1tw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6QZlF0gGtdmM01P86PriVtS6z6r+z16e4TfntEiDdVolhViPa
	XCJ00XWaPGcQybhimt5lVEcv9Onng8S28mKyrgjJg/xV13eG/xr3mbc7jVmlgQ==
X-Gm-Gg: ASbGncupFD04/b1qngUt39naJObza19VXc3wAEj8cJKqWpOJQtw8A9UYQmGUkGXp/x3
	jVvEoCwKOm6d3TFGf7IvLe9jYYMr09CMeqazNOeBLSS8jvsZ0CLMYnvjFdtcvNLlBUEBKN5gtv9
	gcycJJfX2SOABMj3adTYmjk6P71FJOzkmbzVCY6ff8xgzfMKJ+4Pxl1B+W5ibUxTTE4Shnfg/4i
	pv+RJH4p/KPNKjXTJKxCnwHM3ZixWdVSUgUJz7Bb9RStkF1J4i/b1DYGLlKPCs/bwizLKGMoSe8
	2P+KnclSL7BG6W9q9Uhc1yN9pBB7ab7Cy12lPeDawbX2SwmOJ4TmuyVnEcU1lJaFYIhV8NYXmA5
	jBnugbEcpu2F/x72YnPh2QryOQAhc94n0iS/7+mIkyhU3wM00cVu8EooNaLCgVm83wteIPdezZC
	O0mJSTQD2maj2qoQC9Gd0HP80UME8vZIsifiDA0d5JBm1K8YYjr8Rt39yxKuA=
X-Google-Smtp-Source: AGHT+IEapBYrYqGi0l+FxL2lroF+BL/ZAb9NBzGHVrMaySF1Ulqp+LcWXSYKiDa7ebJZ9iwHaqKSHA==
X-Received: by 2002:a05:7022:629f:b0:11b:9386:a3bf with SMTP id a92af1059eb24-11c9d87286fmr428269c88.42.1763696285707;
        Thu, 20 Nov 2025 19:38:05 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93e6dbc8sm17699267c88.10.2025.11.20.19.38.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 19:38:05 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <343a1f8c-1033-40a1-bc7b-ef8868913bea@roeck-us.net>
Date: Thu, 20 Nov 2025 19:38:03 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: spd5118 driver occasionally produces erroneous values
To: =?UTF-8?B?5bCP5aSq?= <nospam@kota.moe>, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org
References: <CACsxjPbcjDPLVfnVncumKVAL16fgBXr4kUGbH4hW+cZiJTe_0w@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CACsxjPbcjDPLVfnVncumKVAL16fgBXr4kUGbH4hW+cZiJTe_0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/20/25 05:57, 小太 wrote:
> Hello, I have just set up spd5118 for my Asus Pro WS TRX50-SAGE WIFI
> motherboard and v-color TRA532G72D834Q RAM
> 
> However, I've encountered it occasionally producing unrealistic
> temperature values.
> See this graph collected over 10 minutes - note the temperature scale:
> https://files.catbox.moe/yt8uqp.png
> 
> I wonder if this is a known issue with the driver? Or maybe it's some
> quirk with my system?
> It kind of feels like a race condition...

The driver gets data from the hardware, through an I2C interface.
If the hardware, or rather its I2C controller driver, reports an error,
it passes that error to userspace. If hardware (or, rather, the I2C
controller driver) does not report an error, the driver does not know
that there was an error and can not report it.

That also applies if, for example, ACPI accesses the I2C controller
and/or the SPD data as well. The controller driver should handle that,
but I don't know if that is the case here. Either case, this is not
in the control of the spd5118 driver.

> If I boot Windows and run HWiNFO, it does not exhibit this behaviour
> 
> Note that spd5118 does not automatically attach to the I²C devices, so
> I have to manually do it
> 

That is interesting, because it _should_ attach automatically. Looks like
the DIMMs are connected to an I2C controller which does not support that
detection. I don't know if that is a motherboard feature or a feature of
newer AMD chips. I guess we'll have to wait for someone with such a system
to submit a patch to add the auto-detection.

Guenter

