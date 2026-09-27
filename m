Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8A73B637E
	for <linux-hwmon@vger.kernel.org>; Sun, 27 Sep 2026 06:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790490680; cv=none; b=ZOgJu0gKLwle63OBTcg4Dq4h5mD8CXSnYhi5hGmMvqEP7yrea04+uvUA99lkIXQ9BcJzFIW2qfUrCtaDQG1dA8F+Jy+w3zztjL8OKttoXQWAWsqUyfLLJQvj8O96eTd5271phnMwTrF+h6E74aWjWpdI8d5ruUz0ViH+dB3lvgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790490680; c=relaxed/simple;
	bh=AFVICFN4chX62VI8nPVeK5uJPzcrbrWeDjC5hZXZc+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dAU8oT/dzwkvyG8q/DhUlRPWooBnKIKW0WLQ/3OyfdhAbrcKzMz+iWa2k5znZdHTxPMOJAHraoHsXBYM0Sgka/Ai57Vg6oc+w1evPSrVyKANKCM/SEoVgP9a3y626gm6V16U0zz1KP0CTUzhCDJR5rI3PW5PFMnOO9dYweDYaYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ihFU0X74; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ihFU0X74"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e83a388f8so15007025e9.1
        for <linux-hwmon@vger.kernel.org>; Sat, 26 Sep 2026 23:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790490677; x=1791095477; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G98IODEmjwEPHfQZb5jDWlDo2HGYU0z05SG8co7Iw9U=;
        b=ihFU0X74tUij6HHnWANbCm2IrL6ZXvnx05GenDJYNXJ6srIgqtGGS6CCHBai6S2Buw
         F/vsGzZJX1a7uIEJDFh2xy2Hti12QQRRwUEFfyigA/RAV83LsmEKG0mLptv15ibd9QXr
         M0VJSUvq7FzTJTgpX5IWt8oIC4xN24RY4wJa6UXo88a/9cmfgVx8YrccDcALQZlJotiy
         C5QAe3wcVjMQ96fLJwcY9/KU0QzM+5JVHSlf1iqu+9oq5G7iaMRIB9YmTWUzkCID6gkq
         5bX4TdYsmhhMDIPryBqNtJI0pZTmBKIiG6BYx1aKQwF5WquhhfaN7F8A3y0Qh7BshjdZ
         K/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790490677; x=1791095477;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G98IODEmjwEPHfQZb5jDWlDo2HGYU0z05SG8co7Iw9U=;
        b=zBCZC8XaEVPkrS2RiLrOohSv835IZiyLCG79Hx87RZ5g0V5ySRfIXP7eD+uqVizGhI
         Ex4u1UMhMzQZ4gpD+vY0h5H9WIRDe0D3OLosHa3d5Qjv4iuRO9VQ61UoUUhfqhdOu7nB
         PBmkRMw9Db1EHjSyfaFv1BJbxchKtZsIg3JEIoRTNt4pelRSNRagsrHUWj6bF/ZzA4E5
         veaqIh4BBsiwOU1vkSgb3+mTMP3osdRZHaRXYAqBMA4mBSH/36HW9XTW8oQcIwyGMgxz
         IwQivoxaD/B1h8yIRZtMU5EEuP+yHvh/kSrgR9Vt6OVICAcABUFz0eYOCnyjKgrbp49D
         ck9g==
X-Forwarded-Encrypted: i=1; AKwUvBweDndLQEx1GOCvdkEZ+cMUU6FEUNr9ZB0K80XBsBp/4gyftUHnjGXEp/PrLjdCGWyM1mABvHxkwPi53w==@vger.kernel.org
X-Gm-Message-State: AFuF++lddl0m0jWTOouyjja+s75hw85felovlkhwj1dIQ0bIlrySJNdL
	XxquiKLea60jw/cGVHoiaUn5wiu7G4gfO38GnqVCXq/f3NpGsopEbT5i
X-Gm-Gg: AYBFou2CW7VeANvLTPYOXS+U6FOU/a8HsPSByILZwoGY1QIy2x49MXJfoe2DsaaRvfG
	5EQZhIbUPq24QXLCuvDK2nvFdg0unGNcxzptt4HhoJmk/asL7FWsaC1C0J+2oGB12LzWbMK5oWt
	nCD5JAbYHDARfbMPK4jkKhkJGA3btO+cQFeuj6QKjgkI0ocp93BI+ekcnsGr7BjbjGME4K7qWCG
	QMsWRA5sCTqB0FhBitl5+NoUel/IDUr+dOrbYqUV/HNRoHyaEENpZY51GsfJxwNk3mZ0Mf/MtAm
	KTBym/4D+9cy3hPXupzD24Im/0jVm+bcyUYtp8Di6yVACPswQZJhPL8DWgvyYtNGJVKyy5U8It5
	DvKX4PInHR7/cxEVhEn2wT34bhJPnw30AzoU9i3Rid+ZZd8DptVyh59F5R5HPxVyB1vwJINaJxa
	m5KxDyv4myGOfWluaCDT4JKFZg/NszzrSF/86VQvP7yEtRHv302+0qyFReCaDtnYoOPJ5BOQdy+
	DD7rJ8LiS5nEsGlGQhDX2+eeMQw043SeY8=
X-Received: by 2002:a05:600c:4f41:b0:49f:fe5a:522f with SMTP id 5b1f17b1804b1-49ffe5a56c9mr49760925e9.23.1790490676934;
        Sat, 26 Sep 2026 23:31:16 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef6186a6sm142933845e9.4.2026.09.26.23.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 23:31:16 -0700 (PDT)
Date: Sun, 27 Sep 2026 07:31:15 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Christian Lamparter <chunkeey@gmail.com>
Cc: Ridham Khurana <khurana.ridham222@gmail.com>, Guenter Roeck
 <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Lamparter
 <chunkeey@googlemail.com>, Alexander Sverdlin
 <alexander.sverdlin@gmail.com>, Nikita Shubin <nikita.shubin@maquefel.me>,
 Shuah Khan <shuah@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>, Brigham
 Campbell <me@brighamcampbell.com>, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] hwmon: (lm70) Fix rounding of negative temperatures
Message-ID: <20260927073115.15110623@pumpkin>
In-Reply-To: <f28a5470-0d9e-4045-9c64-5614e0e88de2@gmail.com>
References: <20260924205326.1739229-1-khurana.ridham222@gmail.com>
	<f28a5470-0d9e-4045-9c64-5614e0e88de2@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 25 Sep 2026 20:03:06 +0200
Christian Lamparter <chunkeey@gmail.com> wrote:

> Hi,
> 
> On 9/24/26 10:53 PM, Ridham Khurana wrote:
> > temp1_input_show() drops the low bits of the temperature register by
> > dividing the raw value (raw / 32 on the LM70). These bits are not part
> > of the temperature: the LM70, LM71, LM74 and TMP122/TMP124 always
> > return some of them as 1, and the TMP125 fills them with copies of the
> > temperature LSB. Division rounds toward zero, so a negative temperature
> > with any of these bits set is reported one LSB too high.
> > 
> > For example, the TMP122 returns 0xffff for -0.0625 degrees C, which the
> > driver reports as 0. The LM70 returns 0xf39f for -25 degrees C, which
> > the driver reports as -24750.
> > 
> > Use an arithmetic right shift instead, which drops the low bits and
> > rounds down. tmp421 had a similar problem with negative values, fixed
> > by commit 724e8af85854 ("hwmon: (tmp421) fix rounding for negative
> > values").  
> 
> For the TMP125 yes:
> 
> Reviewed-by: Christian Lamparter <chunkeey@gmail.com>
> 
> 
> > Fixes: e1a8e913f97e ("[PATCH] lm70: New hardware monitoring driver")
> > Fixes: a86e94dc946d ("hwmon: (lm70) Add support for LM71 and LM74")
> > Fixes: cd929672a9ef ("hwmon: (lm70) Add ti,tmp125 support")
> > Signed-off-by: Ridham Khurana <khurana.ridham222@gmail.com>
> > ----  
> I wrote a little test program by hand (see below) and ran it on x64.
> No idea if different archs behave differently or if
> a clever unsafe math optimizing compiler flag will
> convert the  "/ 32" to a " >> 5" but I doubt that...

A compiler will convert an unsigned divide to a shift, but can't
do so for signed divides.

But you'll also get flagged because C doesn't define right shifts
for negative values.
I think they are actually 'undefined behaviour' (UB) if clang detects
that your code is UB it silently just stops generating object code.
	(int)((val + 0x8000u) / 16u - 0x8000)
might safely generate the correct value.

David
