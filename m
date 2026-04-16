Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5D01B4156
	for <linux-hwmon@vger.kernel.org>; Thu, 16 Apr 2026 13:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776345757; cv=pass; b=E8zjAepKBrRcWOMhRysNbT5BVRYkyoHQOa6+jnjQ3BBNZ/uDDJ/W0OWJxnqWf/oMTq7XpXP2OYzgoWIBFnCDtZomVXqnQwiwyhYQt/TTJ7cRVHQ9KcjkWtZlWMS9/25C2ZM1gsiCkAQ7+XgqhTOcazya/VSNc22zx/LSQklFbdE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776345757; c=relaxed/simple;
	bh=f3Z+4BHqD6MeOvKeK8Q6R3+N7O5qpXneON+iSIaOqzo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f3y5Nsdz1hQM/nIgdXyaF2roDD5EfenQSB9KEgUlM3tVokyRmc9nkIdYxKQ8wBCPiH4s0elsy+TlxdKh+gBK1OIZ0hp5jOTxPXzI1+Gtume8OajlMaUEfPdFsr7TnKRFo6OGu3ghlNtNsbrxFot5YCbiMrPWuqNUmvP5nGzlPNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fRSZGPjr; arc=pass smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fRSZGPjr"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4670464029eso4507174b6e.2
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Apr 2026 06:22:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776345755; cv=none;
        d=google.com; s=arc-20240605;
        b=iV9cvagUm4u7D70KpCX/nQqTAp1ppYyIOUPAKgfhPwI/kHrgachMDlNEF8KqVDLTe/
         tJkbgFa4LPZ1wR7EDZzNQQOESpv79d7u+xRIOwA54J/5/UStUhd8wnW0lYmr0LrklIbB
         7NEutGaH0PizXyXiRe23wv6iAjsSAUEX5mvu8YgRjFwspt7jWpOIez0m6YCa9V1ejlWA
         NyVZSjV3JyMfT7kNg1ixqnqAYSy8PUM9cv1f+M2xjJpWkfHZyhpepm1hdfNWA7Rs0HFg
         BVyv5MpDu8mq6E/1JC6JEtE3wsv+aKhMHc6gG4Qv1Zzw9xhLkhYcOhmbeQZfOynl8DQE
         vJGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f3Z+4BHqD6MeOvKeK8Q6R3+N7O5qpXneON+iSIaOqzo=;
        fh=LIRAVtNkvFebIJTmd3sXQRhyI56KpQNcHjhAac0CiC0=;
        b=asw58loDQ0u/1t3w4cvoLVgrzxl2wGYBIM8AVvjjlJBRQH3Gw/eTicFGnplyebDD1K
         SNMf6lu0KWiV/Mr1VwRVRmbSOddJ5H86gcePdDvJMOR0Ti8PYMHM5zvKAR1u5XGRjxps
         DdxbAwl+C9+gIFDkQB4Udfwt8pNUIRPCL+S9cP0mNsZ49Iaj8eSl3SHZUCWMFW3Uc07D
         hG7Eeb7YpLlWtXO7j4I4RUj74I5DWgIqnuOBxFv3AzqL6McwqsTifDdY5z1cus+mI1zu
         V/w4xwyTNcQ827gv2+XoSbpE2O5+zSmfW35A4iLgto+ykdCVzwDZ/VbKRq8w4EUq6/nz
         4L3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776345755; x=1776950555; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3Z+4BHqD6MeOvKeK8Q6R3+N7O5qpXneON+iSIaOqzo=;
        b=fRSZGPjr7rAODBd2WMKLOZHeKc4hKxkF26u/X5yPa02PXoK/jkCM+M21HHx9qduPA3
         EU3ySr8/Nc+D9ZFNw9vQgd5x6UBY29H/q9bJCU/DIOnOZBXkCflOkU7J4cn67cJVFMvq
         /uCMWJsYPFRwxE4R9eW/B5u1kUHeeGzdJi7KPe6IHqcdlrOYkC1LnvZUjSaY50ccg5Ag
         HWy0EoiNxKUxZPtk0TifHawOIx/XxpVJKdWVbsafo9DojNf9wSgfxzULPJf35S54v8EM
         0e3YdboEeOLBl4A/uKpG31/SMNkMIMn7Lw216f16yIr0Dn55Fckjw6i6Ud0PDCjBqK7g
         FA1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776345755; x=1776950555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f3Z+4BHqD6MeOvKeK8Q6R3+N7O5qpXneON+iSIaOqzo=;
        b=DtonuIwjFEnjRfX3CzITeY9g2sRwFM79PxuUgqFjW3cKUiuMJ+Aj4+GFvFZSzwQDbg
         2z7KN50i3Nm6+D6U4BVjcXTlNFiDRyFUFKAMpNCUiKzOSsa/7i3Ccf/0OqhjASej/BX6
         DTgJNHS72TNz/7GqKkGnM3984XGyHavKtzq+8x+Pku1b5vG97xMdyBz3UAtvp8sMpNQi
         H+cTtkHUFqInhwAhWqEAjFDiVBZYZHG5Q+8aqLm2gJbCm+xPrS9xzD7sBcwrl7YA8plT
         r/LnNPzQkFdArRgvdOXQd2sLfVVsEbElv86XFWJvc7UZB6o+jWfuzkG8QwCNsTEjKnAj
         WXzQ==
X-Gm-Message-State: AOJu0YzG/oHcnYvedrqRYHzYK8P3TXzZrwV3TH+LsgJTtzH5+Hf+10Xq
	Fa20YwRXI1BAFCDDuEwqv0tpIisHx4Wj2PgDSiUbwrV8eYcHE1xGzORFQNkWuBouQhARjZ0rxbQ
	a3hLLGv+T201N70cqbmHnHgZ36h7b2Pk=
X-Gm-Gg: AeBDietrTHMaTMOQOx29T24kFWtrPwvn9jbuoxOb2f3CSHQyqSUE/VIoCZXrlVXYgJz
	aFxRTmYk4pgr1QZE7oHCLt9/ev+Ev0kNVdQWotW287cdynJeaf5NcsjmxUMBYIV0d1XZBz7Ko88
	hUDFVlKmFgk1q8sQGf7XXEAjokG4y0A7rL8QE5JRL2SnUy3pStHGvE1TMbfF7LtXItwjfzXRHxd
	qajpKE4NWwDrd3q1QI4YFKdcXXwMg/E70mPYsqnP8x/jDZzWDXH+BZN4/S0vD9ubBMlngFei4VI
	dGus08M5H5VG2CwmIfoms7tvaR2Ai/lUeCRzIZAl211/kVVraeDEuI+Jy4+9OlZMgyei4+3oYiH
	Hkt7+enlNQWBETWeKYQUwCU9XeQ2q
X-Received: by 2002:a05:6808:6a83:b0:45e:f443:dc3d with SMTP id
 5614622812f47-4789d04388emr13732748b6e.13.1776345754673; Thu, 16 Apr 2026
 06:22:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260416090752.97392-2-hanguidong02@gmail.com> <20260416114435.061DFC2BCB3@smtp.kernel.org>
In-Reply-To: <20260416114435.061DFC2BCB3@smtp.kernel.org>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Thu, 16 Apr 2026 21:22:23 +0800
X-Gm-Features: AQROBzBoCcOhtuZ9hh_NvsyGiEh5G0MEM9h_zh9A6jMJHAtvEfEyHyfBlqaWoDM
Message-ID: <CALbr=Lb4v-eEh82eG-_BqESAWn6uaydzV5QEGeUpLwB6a=dg-g@mail.gmail.com>
Subject: Re: [PATCH 2/2] hwmon: (lm63) Add locking to avoid TOCTOU
To: sashiko@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 7:44=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Sashiko AI review found 3 potential issue(s):
> - [High] Pre-existing Torn Read Race Condition in show_fan() causes massi=
ve fan speed spikes
> - [High] Pre-existing Uninitialized Cache Read in temp2_crit_hyst_store()=
 corrupts hardware thermal limits
> - [Medium] Incomplete Fix: Unaddressed TOCTOU Races in temp2_crit_hyst_sh=
ow() and show_lut_temp_hyst()

Thanks for the detailed review.

I will add the missing locks for show_fan() and the hysteresis show
functions in v2.

The potential uninitialized cache read in temp2_crit_hyst_store()
needs further investigation. If it is a bug, I will address it in a
separate patch, as it is a pre-existing issue unrelated to this
series.

> --
>
> commit 1233dd514546736dfbbf09561bf360360c5933ca
> Author: Gui-Dong Han <hanguidong02@gmail.com>
>
> hwmon: (lm63) Add locking to avoid TOCTOU
>
> This commit adds locking to show_pwm1() and show_temp11() to prevent
> TOCTOU races when reading multiple cached values. It also states that
> other functions in the driver were checked for similar issues.
>
> Link: https://lore.kernel.org/linux-hwmon/CALbr=3DLYJ_ehtp53HXEVkSpYoub+X=
YSTU8Rg=3Do1xxMJ8=3D5z8B-g@mail.gmail.com/
>
> > Check the other functions in the driver as well. Keep them unchanged
> > because they either do not access shared cached values multiple times
> > or already do so under lock.
>
> Is this description accurate?
>
> Looking at temp2_crit_hyst_show(), it calculates its value by reading
> both data->temp8[2] and data->temp2_crit_hyst. Similarly,
> show_lut_temp_hyst() reads data->temp8[attr->index] and
> data->lut_temp_hyst. Because neither function holds data->update_lock,
> can a concurrent cache update cause them to fetch a mixed snapshot (e.g.,=
 a
> newly updated base temperature but a stale hysteresis offset), resulting =
in
> corrupted absolute hysteresis values returned to userspace?
>
> Also, looking at show_fan(), it accesses data->fan[attr->index] without
> holding data->update_lock. In lm63_update_device(), data->fan[0] is
> populated via two separate non-atomic assignments. Can show_fan() read th=
e
> intermediate torn state where the MSB is still 0, causing the calculation
> (5400000 / reg) to report massive, incorrect fan speed spikes?
>
> Finally, in temp2_crit_hyst_store(), data is retrieved via
> dev_get_drvdata(dev) without calling lm63_update_device() to populate the
> cache. If a user writes to the sysfs node before any sensor read operatio=
n
> has occurred, data->temp8[2] will be 0. Does this cause the driver to
> calculate the relative hysteresis based on a critical temperature of 0
> degrees instead of the real thermal limit, corrupting the chip's thermal
> protection configuration when written to the hardware register?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260416090752.97=
392-1-hanguidong02@gmail.com?part=3D2
