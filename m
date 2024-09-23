Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2417219E995
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Sep 2024 16:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727110392; cv=none; b=fngbeS5vJH6wZUnqDscp6e+6cwSIppkSoHO18DyWsWKT1lgc7wNZB0cAJAQQ20z8ir/LvzYBDXKGtVTiH07ohwaK4TA4VoUQ2SrXoMwC6ebtB7H2+Ij+RvWtXxcYiGaNYPeUranBc46u/GSRC01kjdJMLwkzRz1jqHI7K4NziBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727110392; c=relaxed/simple;
	bh=OrByib6QyQXs78enEosOj5JJXpFtGcxdzlumnoE2lss=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IkXbtlyqmDAeKg+y3Zz1NVCktv3trvmhBPzJTQTa3W4oXER0HWHmZB3PI0BZaFqEZtLMQSLRirfKfvFieAU5/+9ypjgyv6SNi+0OK3Fd4T+ODJ1+eIpPZvLgTaLpYMJoImPNfdYBDKZvKYebJq0Lm2C0HyS22fd/wm5cbk/hAy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=q2YNrH2J; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="q2YNrH2J"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42cafda818aso44693955e9.2
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Sep 2024 09:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727110388; x=1727715188; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+BQ8AKpdvW/WPM2kjR9dzh+1cjMp4pgt7p83yXQ1+sA=;
        b=q2YNrH2JP5G6Yt886li5A+CMcs9mMMQL8CzgklB+NGHCg3gUH4SxjggwvS6n47pa/x
         GTKW7avK5H/8QtQDZ4Z7b+9Mcd3ZcdUiXSwO2LvOix6KAMAc+nt9QopBpKfv2yfcZN0O
         LpXctI+WZTur2SSXM065YUFefcwEpaNoP6ybNwPAAJD6bfFvT3A3uYgpRM2bhmSYYfzq
         QabVVB2I8844EeI6r86Aud6AEQdvUTlVqA2nBXzDd25tvocuMUMeI3C9+/wltcZGfX4q
         y0KZernEJOX3OBWyCm+6TQxVNjxrA7H2kK7l7g8cTW6ieAXrPxSI2KhSGRw7xByAUiOY
         /NkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727110388; x=1727715188;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+BQ8AKpdvW/WPM2kjR9dzh+1cjMp4pgt7p83yXQ1+sA=;
        b=hUXFVGnxQOMbcgfB9SZEY78d4hDLe3iHJIA4OdeYeH/3evs5kpr4vMfbSpaqG2VYen
         dBGKxekiUDCgvUm5QOjBkHyncqXE8C39t6si+SXY+7OUMZhLvzC84J30ZMv+gTqw/kKf
         mJOyXOHlG9bYgMtyPs/X/WxgH31Vz5emDdNK0du/pIEHdgTBSd/VC0HngzIxJSQ8s4m9
         Gcwwx+UTBIzWERInQzOsuSXoU7Bm0eThKOwYRG2qrPbQd19TdXPH2MHGDJzameBsyXZG
         zQxuD8LdEIPBJbb/dcK2VOyjR19VcK+ig2PHC1tDsFDonY6zcplk/Kbztqg2HTJFGhlZ
         74OA==
X-Forwarded-Encrypted: i=1; AJvYcCUJnxDxT/tm+im55qck8K1bl1lrIA97nKmNDq3oXcLJs7HCSp0NU36KoxXuZDDQP2hdZwytkKtS8t/lpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBeM4ojSodnoM2girN8784J0nTs1J5In3zL5kOfty+sK9Z5Jsd
	QquvN646cqIPycrLG5rspSNL7DXfh7zFr25a2MIwvp/x9p7sEgRgQSmSphP3ziM=
X-Google-Smtp-Source: AGHT+IH3ZltojwN2arF//ed1/wiTJ1j3O3wgJsmq7dF/AZJPxUrxJvg9xnS0Grg5Q982ZRh5aHuFQg==
X-Received: by 2002:a05:600c:4fc8:b0:42c:d084:ed7e with SMTP id 5b1f17b1804b1-42e7c159b9bmr82031065e9.4.1727110388380;
        Mon, 23 Sep 2024 09:53:08 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:885c:440c:fff5:ed00])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e754a6f82sm133009945e9.37.2024.09.23.09.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 09:53:08 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,  Liam Girdwood
 <lgirdwood@gmail.com>,  Jean Delvare <jdelvare@suse.com>,  Jonathan Corbet
 <corbet@lwn.net>,  linux-kernel@vger.kernel.org,
  linux-hwmon@vger.kernel.org,  linux-doc@vger.kernel.org
Subject: Re: [PATCH 4/5] hwmon: (pmbus/core) improve handling of write
 protected regulators
In-Reply-To: <ZvFdYtwlqsr4mLym@finisterre.sirena.org.uk> (Mark Brown's message
	of "Mon, 23 Sep 2024 14:21:54 +0200")
References: <20240920-pmbus-wp-v1-0-d679ef31c483@baylibre.com>
	<20240920-pmbus-wp-v1-4-d679ef31c483@baylibre.com>
	<4052294e-7b7f-4238-9b47-92727de4d516@roeck-us.net>
	<1jsettz1hh.fsf@starbuckisacylon.baylibre.com>
	<2f3cec6e-7b05-4510-8c62-244ed114ad17@roeck-us.net>
	<1jo74hymsh.fsf@starbuckisacylon.baylibre.com>
	<ZvFdYtwlqsr4mLym@finisterre.sirena.org.uk>
Date: Mon, 23 Sep 2024 18:53:07 +0200
Message-ID: <1j7cb2z4zw.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon 23 Sep 2024 at 14:21, Mark Brown <broonie@kernel.org> wrote:

> On Sat, Sep 21, 2024 at 06:49:34PM +0200, Jerome Brunet wrote:
>> On Sat 21 Sep 2024 at 08:22, Guenter Roeck <linux@roeck-us.net> wrote:
>
>> > In other words, if always-on is _not_ set in
>> > regulator constraints, I'd see that as request to override write-protect
>> > in the driver if there is a change request from regulator code.
>
>> That's very much different from what we initially discussed. It can
>> certainly be done, what is proposed here already does 90% of the job in
>> that direction. However, I'm not sure that is what people intended when
>> they did not put anything. A chip that was previously locked, would be
>> unlocked following such change. It's an important behaviour change.
>
> The general approach we take for regulators is to not touch the hardware
> state unless we were explicitly asked to do something by firmware
> configuration.  The theory is that this avoids us doing anything that
> causes physical damage by mistake.
>
>> >> This is something that might get fix with this change [1]. Even with that
>> >> fixed, passing init_data systematically would be convenient only if you
>> >> plan on skipping DT provided constraints (there are lot of those), or
>> >> redo the parsing in PMBus.
>
>> > I disagree. I am perfectly fine with DT overriding constraints provided
>> > by the driver. The driver can provide its own constraints, and if dt
>> > overrides them, so be it.
>
>> That's not what the regulator framework does. At the moment, it is DT
>> and nothing else. After the linked change, it would be DT if no
>> init_data is passed - otherwise, the init_data.
>
>> If a something in between, whichever the one you want to give priority
>> to, that will have to re-implemented on the caller side.
>> This is what I meant by redo the parsing on pmbus side.
>
> Right, and I've got a feeling that any attempt to combine constraints is
> going to need to be done in a case by case manner since what's tasteful
> is going to vary depending on how much we trust the various sources of
> information.
>
>> It goes way beyond what I'm proposing.
>> The only thing done here is something you simply cannot put in DT
>> because DT is static. Following init, if the chip write protected,
>> REGULATOR_CHANGE_STATUS should not be set, regardless of what is in DT.
>> If it is not set, I'm not adding it.
>
>> Also, what I'm proposing does not get in the way of DT, or anything
>> else, providing constraints. What I propose allow to make adjustement in
>> the HW based on the constraint, if this is what you want to do. It also
>> allows to update the constaints based on what the HW actually is.
>> If the chip cannot be written, regulator needs to know.
>
> So, I know we talked about this a bit on IRC but I didn't register the
> specific use case.  Now I see that it's coming down to the fact that the
> chip is simply write protected I'm wondering if it might not be simpler
> to handle this at the ops level rather than the constraints level.  When
> registering the driver could check for write protection and then instead
> of registering the normal operations register an alternative set with
> the relevant write operations removed.  That would have the same effect
> that you're going for AFAICT.  Sorry for not thinking of it earlier.

Actually I thaught about it, that was my first idea.

There is tiny difference between the 2 approach:
* A regulator that does not provide enable()/disable() is considered
always-on, so it is not really checked if it is enabled or not
* A regulator that does provide enable()/disable() but disallow status
change will be checked with is_enabled()

In the second case, we will pick up on regulator that is disabled and we
can't enable. In the first case, I don't think we do. I don't know if it
is a bug of not but that makes the 2nd case more correct for what we do
with pmbus regs I think

The other thing, although is more a pmbus implemantion consideration,
is that the type regulator is opaque in
pmbus_regulator_register. Different types could be registered so
manipulating the ops is tricky. That's where a callback is helpful 

If building the ops dynamically is the preferred way, I'll find a way to
make it happen. I'll need to way to identify which one need it, loose
the 'const' qualifier in a lot of place, etc ... that will be a bit
hackish I'm afraid.

>
>> > We should not try to override devicetree constraints.
>
>> I don't think I am. I'm just reading the chip state and adjusting the
>> constraint. Even after implementing what is suggested above, it will
>> still be necessary to readback and adjust the constraint based the
>> read protection. Unlock is not guranteed to succeed, the chip may be
>> permanently lock. Some provide the option to do that.
>
> I'm not familiar with this hardware so I'll defer to the two of you on
> what's tasteful with regard to handling this, based on the above it
> might be a per device thing depending on how reversable the write
> protection is.  It looks like currently we don't change this at runtime
> but I might not be looking properly?

At the moment, it does not. With this patch it might but only a
registration. We've been discussing other modes but it would not impact
regulator I think.

-- 
Jerome
