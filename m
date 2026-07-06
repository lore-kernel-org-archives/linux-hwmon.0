Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE038374A0A
	for <linux-hwmon@vger.kernel.org>; Mon,  6 Jul 2026 16:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783355601; cv=none; b=FqGKubb3Yzv6s8pJYgsqZAVuO8XV/nKKslNVQpiVZ8tWllfnXW7M3X/AoUrngaQYyfpGkyWmGdPWT/3k/bmVPV3RhnzncvuwZWOe0LJUFlrq+ze8VWNY5fXDap8VP0j1jwxbq/hA4PmDsCkULfHSxqhsd2oQusJm2RMf/O0ZdF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783355601; c=relaxed/simple;
	bh=wmTbh+3zPeru4hdOaJ6Rp4NGPLoXv8zFypxXQgIwrGY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JlMwurYim0JXq5YZ0HvXw/hQG0w6NpA5oCoAenjH+pbj2b2OoJR7qX86oTEEtK23BIXvlgqxVH9ScugoRYWdSrZofwLxjvzMVbSeUDy/J65a3uJM6l6RPIEBUIM9oOs8Fr4V+pAi32+Ci02ONcs2h5lM1/UP6r6E3/wBuoml/5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CsrIggYX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CsrIggYX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2867C1F000E9;
	Mon,  6 Jul 2026 16:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783355600;
	bh=g7VpzM4bjtg34TxWNxscGDZC7233OL8JOc2ZWDN+FPU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CsrIggYXhLqvE4clleRupTkjXSuR0aW+HD5Zp8ry60QSmfCqXqvd96QS2wZKk/MwA
	 TzR3E5e6VRSPrIOMNWZah9aM7FPWv+FrWX7w5q+IDAsKQslPli7hI2dht9j3Ti70wg
	 XCX76d3/1V5cTXHx542qIN7SrKIkRT7fWAwo3SoqtdoqBnnvG/ueGLXbr7wcocVr5n
	 va5CKfWWrl9YhSddS9ptpxTOt43vzKLAhGIijD4wu622qa/nKotHosU/iTpWZ23M9B
	 DUGVMb1LvwER+ZR5H2hSOZG5yjM3SjZjZi80gQNYZZSoGkI8ZJT6gVO8bTK9wYnkDd
	 bXGwaPc7sH7Dw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: emc2103: use min_t() for explicit type in fan
 target clamp
Reply-To: sashiko-reviews@lists.linux.dev
To: "Animesh Rai" <animeshrai853@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260706162519.6087-1-animeshrai853@gmail.com>
References: <20260706162519.6087-1-animeshrai853@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 16:33:19 +0000
Message-Id: <20260706163320.2867C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Clamping the calculated or user-provided fan target to `0x1fff` ov=
erlaps with the 'disabled' state, inadvertently disabling fan RPM control f=
or slow RPMs.
- [High] Lockless read of `data->fan_multiplier` leads to incorrect fan tar=
get scaling in `fan1_div_store`.
--

commit 78e3c12646374da73de8e3b7d0409be33a0d722f
Author: Animesh Rai <animeshrai853@gmail.com>

hwmon: emc2103: use min_t() for explicit type in fan target clamp

This commit replaces min() with min_t() when clamping the fan target in
fan1_div_store() to explicitly specify the comparison type and avoid
implicit type conversions.

> diff --git a/drivers/hwmon/emc2103.c b/drivers/hwmon/emc2103.c
> index 27dc149a3ed99..fbb1b4025eb7a 100644
> --- a/drivers/hwmon/emc2103.c
> +++ b/drivers/hwmon/emc2103.c
> @@ -348,7 +348,7 @@ static ssize_t fan1_div_store(struct device *dev, str=
uct device_attribute *da,
>  	/* update fan target if high byte is not disabled */
>  	if ((data->fan_target & 0x1fe0) !=3D 0x1fe0) {
>  		u16 new_target =3D (data->fan_target * old_div) / new_div;

[Severity: High]
This is a pre-existing issue, but couldn't reading data->fan_multiplier
locklessly to calculate old_div lead to an incorrect new_target calculation?

In fan1_div_store(), old_div is calculated as 8 / data->fan_multiplier
before acquiring data->update_lock. If two threads write to the fan1_div
sysfs attribute concurrently, won't the thread that acquires the lock
second use a stale old_div value, corrupting the hardware fan target RPM
state here?

> -		data->fan_target =3D min(new_target, (u16)0x1fff);
> +		data->fan_target =3D min_t(u16, new_target, 0x1fff);

[Severity: High]
This is a pre-existing issue, but does clamping to 0x1fff inadvertently
disable fan RPM control for slow RPMs?

Since values >=3D 0x1fe0 result in a high byte of 0xff, this overlaps with
the "disabled" state. When scaling the target beyond the 0x1fdf threshold,
or when a user writes a very low RPM value in fan1_target_store(), clamping
to 0x1fff instead of 0x1fdf seems to cause the fan to fall back to an
uncontrolled state rather than its minimum speed.

>  		write_fan_target_to_i2c(client, data->fan_target);
>  	}
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706162519.6087=
-1-animeshrai853@gmail.com?part=3D1
