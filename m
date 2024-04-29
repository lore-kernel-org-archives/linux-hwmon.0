Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDC0168DD
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Apr 2024 08:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714378783; cv=none; b=GfcezurrGoMZH4s1+EwF5mdW2YS6eEj2O2zaJhKUXNoKfvbGcfc77kdgIFvmWJu1BtR/IZkNmTw6rY6grp4Hu4NMhEhL+udXdvg2D36rIEsy/1aH+mzNLosDDKPhGru2L1syBBSADBl/QMrLsHCPWP8X2OAqbpWfOfyuzTL3Qr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714378783; c=relaxed/simple;
	bh=Po0tXE9Xskn5T/v0Ju783bkp3KwXGfxsxL0+wrC+g14=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fmX31MLwZ9uQWGvJgDk6Zqt6bzdtHe/lP7xZJhzb1scHFpeyk98zsW9Ip6/3l8wVDvl5ILirsqSAq01/U060DzsspRYPPjXuMge9SAkNPIl7U3Wi8xLcQZ6/zczxQR90tRnWHcfEs+YSq1Bi4S7oBGYUd395L7xOYI1wiLJAyEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=UmPk4XYC; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="UmPk4XYC"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5e4f79007ffso2684541a12.2
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Apr 2024 01:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1714378781; x=1714983581; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HJCrgcZhDrCnnlgKgbh0+Alkxqfdxg/GoVvgeTAkMbU=;
        b=UmPk4XYCz3rLX2OUD+1tUx6Feky0f+h3xL4GvwnO9OJeWHhM9CsNhRMuKV4x+LqcVJ
         GG/tsNe03aBiu83F2dSorLPDwL/EQWiXYIWT8UcX5g5lEKrWfqxiAzrmx9oVhlqHXcRF
         9cIE2NCDNzS2JsSSYvRjujr1bpBvLtD5smenUljj5nLPnqq84UiId2h4O/80+0OvisnP
         jNHY+KNF+VnTJMW/NS8XSFRz3xccFujvq+43gfUenR1Td9iHU0dHww8yEtUdUQNWJsT7
         nJv0sLnNnERY0xak1oZldefY/as+trK2hoidocPzWYUg2ShLRYLQAD1jC/pgvJ3ixPTS
         cNJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714378781; x=1714983581;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HJCrgcZhDrCnnlgKgbh0+Alkxqfdxg/GoVvgeTAkMbU=;
        b=p/NEWS+A1x5OwYyTkpEzA9pVJNfkoFMw9N+x/7A/vfZu2zLjwMHKyz8yfYZaWGQ+L0
         a+KUB7yaQd6v3GVlRubse6+87yIM8yOZx2fbx8eVBCcN01LV7M0aBsP3jA38TzjWZJq6
         GesPoF5ooGz5n0NJFxJ4pdU8ib+XYmlEZYl/pNJffSa2oeNSay6+V8K7UjqIXz8BTe3x
         qjIRUT9Rl6sjabIcjxOzRM79ZT1HKepFx86O3GCcvTFcCl/F/zi1lpdtbHumkWnhkBPY
         QZRgvPzj41MrkRaz//rDh6A+ooxJwGwP/0DZYqW8O8PISJmLzz5aWWfk8Ntc9k/noU2m
         M1zQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcDrSwddrjTREodeANIV6jafcg6Z+oLRgD9W9JwcVsstiOrpfBEiNhVTGUejUzD5Jfq7x7gzptX3oq2X7QHBSEIfidnf9SKOdbLBY=
X-Gm-Message-State: AOJu0Yzj4UtVpZ5B+wUuptOuUnjw8/YWhp07+eK4DdWw3oT8StorRhF2
	BtveMReZTTgwPtqbeA2t/U0vNyIGl3SHg47Iis3i0/FAV97+WB/35tBGni/0Bu6apQqXOcD9M1x
	zUoHmmhgWdldcNRbC30z7UP1kwaACEVdJb133Ww==
X-Google-Smtp-Source: AGHT+IEZwteBBB8yXUtpDrs8v6BWSN+dxFs8QO3VieMsFx61Slke5Fg8H3/5PejA8AbrcAGjpYhKnp10p/zhLDXhyiI=
X-Received: by 2002:a17:90a:d397:b0:2ac:86c6:fe with SMTP id
 q23-20020a17090ad39700b002ac86c600femr9473425pju.1.1714378781371; Mon, 29 Apr
 2024 01:19:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240416171720.2875916-1-naresh.solanki@9elements.com>
 <65607114-89f8-4f48-83fc-b89d87fee247@roeck-us.net> <CABqG17jveAdxN+tCcPq4hNqWDy1YCJ1z0+kLpM+ect0XEyqBcA@mail.gmail.com>
 <116aeea1-c648-4abe-9ab2-693bf64000fc@roeck-us.net> <CABqG17jHYymH02hAH0z-uqk2HjemL_-aLr9EyOUNR=uQ7U_wtA@mail.gmail.com>
 <6d779d5b-b622-4e20-9449-64307b9b9582@roeck-us.net>
In-Reply-To: <6d779d5b-b622-4e20-9449-64307b9b9582@roeck-us.net>
From: Naresh Solanki <naresh.solanki@9elements.com>
Date: Mon, 29 Apr 2024 13:49:30 +0530
Message-ID: <CABqG17inSB8stBf=ObaYKj4FREpXKWSy=7XXO9O3RhEx_v74vg@mail.gmail.com>
Subject: Re: [PATCH 1/4] hwmon (max6639): Use regmap
To: Guenter Roeck <linux@roeck-us.net>
Cc: krzysztof.kozlowski+dt@linaro.org, u.kleine-koenig@pengutronix.de, 
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Guenter,


On Sun, 28 Apr 2024 at 22:48, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 4/25/24 02:50, Naresh Solanki wrote:
> ...
> > This driver has 27 regmap accesses. Except volatile registers, others are
> > cached by regmap.
> > Some function which only access volatile registers will not be able to take
> > advantage of caching. This is also the case in various other drivers for similar
> > devices.
> > Also regmap offers bit handling which makes the code much cleaner.
> >
>
> Maybe I need to make it explicit in documentation. I will not accept regmap
> conversions unless local caching is dropped. Yes, that means that volatile
> registers will not be cached. I consider that a positive.
I agree with you. Regmap conversion wouldn't make sense if local caching
is present.
Correct me if I'm wrong, but in this context, local caching points to the
various variables in max6639_data ?
i.e.,
    bool valid;     /* true if following fields are valid */
    unsigned long last_updated; /* In jiffies */

    /* Register values sampled regularly */
    u16 temp[2];        /* Temperature, in 1/8 C, 0..255 C */
    bool temp_fault[2]; /* Detected temperature diode failure */
    u8 fan[2];      /* Register value: TACH count for fans >=30 */
    u8 status;      /* Detected channel alarms and fan failures */

    /* Register values only written to */
    u8 pwm[2];      /* Register value: Duty cycle 0..120 */
    u8 temp_therm[2];   /* THERM Temperature, 0..255 C (->_max) */
    u8 temp_alert[2];   /* ALERT Temperature, 0..255 C (->_crit) */
    u8 temp_ot[2];      /* OT Temperature, 0..255 C (->_emergency) */

    /* Register values initialized only once */
    u8 ppr;         /* Pulses per rotation 0..3 for 1..4 ppr */
    u8 rpm_range;       /* Index in above rpm_ranges table */

Are you asking for removal of all these variables & each read sysfs
attribute read should access regmap cache directly ?

Regards,
Naresh
>
> Guenter
>
