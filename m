Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1E537E2F5
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Feb 2026 06:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770186129; cv=none; b=ogqQz/BrhAETWSmiNYMmo3gGxl3oMlCcyYWH0SBosofXk01PKGHAkpf3OYz2HpOi9BDIwJDUZy3Ejlf+NUNIY3PdTVbO9ynBaLlbMy2Gt3AsQ0GuUYb1AS8hMyaBb+izrWINX68y+PxGgbkVP/qXvWURRs5/NUf6wPr1XIY7reE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770186129; c=relaxed/simple;
	bh=RYM4ym1v4m+W4Y2gxgBSW91ToK7VkbdkHII7AynNqbM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=AKd/WhR+SmlQw6Y27GyAdT8+mAjl1wG7CvGcJyLCJ2HB6UXE5an42MTPucSgfS5Io7qpoX737UotJF8dtlkyQvzdQnPzHrOuRP+SYNBMYMxbaC9kqtq7HkpB7hr4ZVZAdX9yxqT5kkTxEyjIlBsUQRa3jg6YbOMR8Nf8EWBQy14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JhZvHzLf; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JhZvHzLf"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5f53ba9c548so1954241137.1
        for <linux-hwmon@vger.kernel.org>; Tue, 03 Feb 2026 22:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770186128; x=1770790928; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bqTMQtbpuGjnaVDA2Ijvn9UnB/pCoTB96PGw8ds+gq8=;
        b=JhZvHzLf6RgU8eYqmXisHNje7S3kOnzF0xp08h+At0kXuxmHBCk7M6IK8Ln8mKB6Ye
         kVZ+RwYo4Yh889wCB8Ky5GoNaGQgZdF8ftsCAg5rDqYMsFfD8m6rwYJbZNj5/aYQZA+H
         TBZIqXoSD7EU+3CIxiE08yRkJU88EZQt77MsdWad47843FFWt36BZZ5eN1lDMb37byvx
         nfeEU5q1ck0al5SfYgSsJLBFpNwWYJvSBv+kXlLsGI+Esv6r+I4D+HwPzCSyTjtKhi3G
         jpiqiPcxO3mUfFdEme2lZMWaj1ijsKGSL5d24dATrZ3hiwtOPIGLmVxPIzUqq3NOh/rd
         kPmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770186128; x=1770790928;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bqTMQtbpuGjnaVDA2Ijvn9UnB/pCoTB96PGw8ds+gq8=;
        b=N1lgwqGX/bA7iFH5CGh24Qo+y+hErWaKjcSmxVkgo7D+jV1vVCqSoNXz/XIrhRquFE
         TH0TPWC0XHvhVsfm4Az/69QCa0RQDlSOKZTSMW0QzeiCWEa5N0AaM0Bsyfw/naymZkkF
         RJh0vj+ULago1k2AXVzluSdXY9aDFWFRHwJIoHe12mkZMT6ucadnErx3R6yozPuK6wgn
         jcbvClf+TUMHZfxnBcHTOoOr6ZdVChJ5Lcu3BrH1Rz+zw98tZK0ZLGkKuscazOjtaYCs
         glt9wkRSfx12+MEM04bXyHOqzQG/PINdKtK6UcGW5e/OUKgBB/qKcZ9s37P/gX6kdJ7R
         C1cQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxg7cOREx/lhzribtZMrcdJWX2lcFnH/HZSHt/L5ePxjqRan6CAx+JjinoW1xlwW4yuTSyJvAIXSAywg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwCXbghmti+5Wke2+YcbkYFOrRkayZjezI30QMMxE8SLuDwFhZ
	USwVTPnyf7RO2yiaUUAuql8IYJsf9scT2CfHjmgwy2IwgaNvqI3uDa7O
X-Gm-Gg: AZuq6aIuNE7avuzj76BbROMano6CJ6vTmSx313JwJQ/HzNHUkG0AFR7vm5/SO5WcPZN
	kjyQKODnx/0G06R/P4O4FX9OsIwTdwGXOCAsg2jmH7Tk0sp/IMvUESWlorD5FgjycFGMDaUXMpL
	AicMageQYJOPOmOwDuJTDr2LnwMExohI9Pz81wxplGBxuQgH4bgfo/6zhgmD4WWjaHM3qvKmG6f
	34lliXvmlwuP4p21lJqBOsFbUoFcXSrNbSjB1FvQ7T5yAQYa4dmvFKP2l9sEpVybTJOau7eIb6T
	xC66WUz+aXFy+Z5p/veLzXtV3PwO29M8sF4D6W0H3XLfqKO1jP7ufK8pnUZEWCeOroQ3uTb85nE
	XkMbbpDsYIsJFZavkZ2aUDNDr576RSDnjVZpHBpqyVJq7Wj7I7gLNWjtCz8tkVa8S4rMhKU5dgR
	5dxA==
X-Received: by 2002:a05:6102:2912:b0:5db:3b75:a2aa with SMTP id ada2fe7eead31-5f9394e41a3mr635310137.18.1770186128419;
        Tue, 03 Feb 2026 22:22:08 -0800 (PST)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-948dff5c022sm533367241.11.2026.02.03.22.22.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 22:22:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Feb 2026 01:22:01 -0500
Message-Id: <DG5YLXU5REKO.1LZSL9FL2ZU9W@gmail.com>
Subject: Re: [PATCH] hwmon: (spd5118) Explicitly enable temperature sensor
 in probe function
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Guenter Roeck" <linux@roeck-us.net>, "Kurt Borja" <kuurtb@gmail.com>,
 "Hardware Monitoring" <linux-hwmon@vger.kernel.org>
Cc: "Armin Wolf" <W_Armin@gmx.de>, "Tinsae Tadesse"
 <tinsaetadesse2015@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260131152048.2299403-1-linux@roeck-us.net>
 <DG5KLLWBJEF7.2H0M48M16C4SS@gmail.com>
 <9fcdbf1d-ab91-4330-88ad-7fb5d26cd5d9@roeck-us.net>
In-Reply-To: <9fcdbf1d-ab91-4330-88ad-7fb5d26cd5d9@roeck-us.net>

On Tue Feb 3, 2026 at 2:49 PM -05, Guenter Roeck wrote:
> On 2/3/26 11:23, Kurt Borja wrote:
>> On Sat Jan 31, 2026 at 10:20 AM -05, Guenter Roeck wrote:
>>> Instantiating the driver does not make sense if the temperature sensor
>>> is disabled, so enable it unconditionally in the probe function.
>>>
>>> If that fails, write operations to the chip are likely disabled
>>> by the I2C controller. Bail out with an error message if that happens.
>>=20
>> Hi Guenter,
>>=20
>> As I mentiond in the other thread, after applying this patch the probe
>> fails
>>=20
>> 	spd5118 17-0051: error -ENXIO: Failed to enable temperature sensor (wri=
te protected ?)
>> 	spd5118 17-0053: error -ENXIO: Failed to enable temperature sensor (wri=
te protected ?)
>>=20
>> This would be a regression in my platform because, even though the
>> register is write protected, I can still get temperature readings just
>> fine (even after the resume error).
>>=20
>
> Yes, but after the next BIOS update it might not work anymore, and
> it is impossible to suspend the system. On top of that, it instantiates
> the spd eeprom which can not really be accessed because that code _does_
> need to write into the chip.
>
> There is no safe way for a spd5118 compliant chip to be accessed reliably
> with write protection active. There is nothing we can do about that.
>
> Guenter

I see... I had the module blacklisted anyway :P but I can imagine future
regression reports.

Thanks for the explaination!

--=20
Thanks,
 ~ Kurt
