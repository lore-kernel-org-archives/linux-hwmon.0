Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10AB234973
	for <linux-hwmon@vger.kernel.org>; Sun, 23 Aug 2026 18:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787508377; cv=none; b=HWtWbvGgeKwUCYmrFt1RKL3VzSFDlSfqYjC4vHkH3EOBtoXT5ksadUKCZse0keDipPjwJpLMbMLSzIW/AhMXlMpAQwNc/DJ3ksAteYAGbMkDV2/1lIRPAncjAhP0IsrqraJOPvceOCHNYDnw3Ca78T9u+z6Tg+Bb4n1WOCb7Qwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787508377; c=relaxed/simple;
	bh=opWzfTEFHwu+2PUSkUlCsF0FrsgGrwm22Ujui5M35/4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lc4/Mlz1lp3O4fW7AKlx50vQnRg44ZjGS0ArIesui6MLRK+tLdkz1BCw5A1R2Is3w7aWvnxGzL1lLRbVqe9MuricwDbICVgSWBxh6T4/a9bOvQ0KhvyrWREL4mjGj8OWZHWw06VLQZ695VcRco/pJZuh8YGWsavdeXTN0VLCXd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KJFPbEaE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KJFPbEaE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D53D1F000E9;
	Sun, 23 Aug 2026 18:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787508376;
	bh=0jWA7gbITwxVCWS3pEgFHf1GjuQkGhDdI408N2q8sSg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KJFPbEaE/eDX/vVvsadPj7GbyhPe0eWB0GyzOm9yme0C2QiXrcXJtF0FjGrys4AAA
	 6A9FgRAaE1fgUuq8u2nAefegWyfrZsVr22OrOxWJXBlwleLVZUDZxmYGrwIIBgDVTW
	 KMOMWPEZ43XteleLyt7V1ktNoHK3bqta3ZoVXBO98bB+ATo4JcR9+7fJJEST1vXTLz
	 8ysd6NwOKHb7WepbIMo0qMbOi5GpqVH1EAnD3h4mCODuVC93Fq20O37N9jt3wIC5dX
	 7inn9MeSDgCPjvZcT9EOztYZdG9eGSXEWaCVVP1wfPpE9Mjg/EKm2rTAwunLWeK0HD
	 STqc20WfYfwKw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] hwmon: chipcap2: serialize access to
 low/high_alarm indicators
Reply-To: sashiko-reviews@lists.linux.dev
To: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260823-chipcap2_locks-v2-4-6a26c8e9e2fc@gmail.com>
References: <20260823-chipcap2_locks-v2-0-6a26c8e9e2fc@gmail.com>
 <20260823-chipcap2_locks-v2-4-6a26c8e9e2fc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 23 Aug 2026 18:06:15 +0000
Message-Id: <20260823180616.1D53D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `scoped_guard` macro is improperly terminated with a trailing =
semicolon, resulting in an empty critical section that leaves the alarm sta=
te updates unprotected.
--

--- Patch [4]: [PATCH v2 4/4] hwmon: chipcap2: serialize access to low/high=
_alarm indicators ---
commit a0d28bd8208a1d69e597290c8ebb0fdf0731e68b
Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>

hwmon: chipcap2: serialize access to low/high_alarm indicators

This commit attempts to serialize concurrent access to the hardware monitor=
ing
alarm indicators. It introduces scoped_guard usage within the threaded
interrupt handlers to protect the low and high alarm state updates.

> diff --git a/drivers/hwmon/chipcap2.c b/drivers/hwmon/chipcap2.c
> index 57d22d65612c2..0a56c55e93942 100644
> --- a/drivers/hwmon/chipcap2.c
> +++ b/drivers/hwmon/chipcap2.c
[ ... ]
> @@ -495,9 +495,11 @@ static irqreturn_t cc2_low_interrupt(int irq, void *=
data)
>  	struct cc2_data *cc2 =3D data;
> =20
>  	if (cc2->process_irqs) {
> +		scoped_guard(hwmon_lock, cc2->hwmon);

[Severity: High]
Does this trailing semicolon create an empty critical section?

Because scoped_guard expands to a for loop, placing a semicolon immediately
after it makes the loop body empty. This means the lock is acquired and
immediately released.

The subsequent assignment to cc2->rh_alarm.low_alarm executes entirely outs=
ide
the lock, leaving the data race unmitigated. Should the assignment be wrapp=
ed
in a compound block without the trailing semicolon?

> +			cc2->rh_alarm.low_alarm =3D true;
> +
>  		hwmon_notify_event(cc2->hwmon, hwmon_humidity,
>  				   hwmon_humidity_min_alarm, 0);
> -		cc2->rh_alarm.low_alarm =3D true;
>  	}
> =20
>  	return IRQ_HANDLED;
> @@ -508,9 +510,11 @@ static irqreturn_t cc2_high_interrupt(int irq, void =
*data)
>  	struct cc2_data *cc2 =3D data;
> =20
>  	if (cc2->process_irqs) {
> +		scoped_guard(hwmon_lock, cc2->hwmon);

[Severity: High]
Does the same empty critical section issue apply here for the high_alarm
update?

> +			cc2->rh_alarm.high_alarm =3D true;
> +
>  		hwmon_notify_event(cc2->hwmon, hwmon_humidity,
>  				   hwmon_humidity_max_alarm, 0);
> -		cc2->rh_alarm.high_alarm =3D true;
>  	}
> =20
>  	return IRQ_HANDLED;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260823-chipcap2_l=
ocks-v2-0-6a26c8e9e2fc@gmail.com?part=3D4
