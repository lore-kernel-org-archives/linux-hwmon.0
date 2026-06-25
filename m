Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDB03DF01A;
	Thu, 25 Jun 2026 16:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782404475; cv=none; b=tdIN7uz+kycEVkSZV2idPR9dtxYx9xt72o79Sh/AhpgkoagVkeDmN0PKQ4He9aluNGhHBzsX6r3BKoLp0THotjJBRzalywgqXEp1Ae2wfSm9MMe3jJDraiLD8SW4l3zYGuJUZfNpaHSjtlTMA1/NP4H+awNEOLo07CZraiNUFL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782404475; c=relaxed/simple;
	bh=l7mCiyBi1SUQPTSuOemoxy28UrtPsJbcpE4owSTu0mg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nqYHzWNMwA7KHN/tSCV6QafKA+OLYnz/473J+OaOhnU6GpPTFpcuOi/Ql68DqE93m+lA3u29ajzynAHpY9tg53wWCl9SzOAhuqxuKrazZX96oOa2r5mmAWmKixwA3QbMNH4VUns35Up7GvpP3iSCSCx6RkYDqe09QX3UgAAotC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ERMjWq/s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ERMjWq/s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 417EA1F000E9;
	Thu, 25 Jun 2026 16:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782404474;
	bh=Ht6H7DFitAmtQKB4ICmd1sipRyMUQIeLpqDqtXHkH48=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ERMjWq/s0WFsi7kTuKTYy1E7hXj7Cg+shF8QOnNj1uOa9q8IcbtRviddZ7jmLvqE9
	 i3R7T40ICvmw/0kQhrpG79Dz0bw4SiwufAVqRMe/nq5IoY7YEH4PfHdWJMaQ7L8jpQ
	 ni39EBeFCN/5V9nYmRY4nM4dQ5BYdA3VCubGRI6BT/kfoSABBwXHe/AslaBfo/f3GF
	 YHENxt+JhcJyRwkt3wBu9fDppUE+2FV+wiDWP0T11qkEe3vsdgU8jjHbEd4BIl78sj
	 4wqJeVPZjYQr0o0KSO6daJSIs6DBy4yY72kN2hV38wLJRogMqVdI5h2z1fYvrNbvND
	 anlFUwhiEneiQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: chipcap2: Add label property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Flaviu Nistor" <flaviu.nistor@gmail.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260625160423.17882-1-flaviu.nistor@gmail.com>
References: <20260625160423.17882-1-flaviu.nistor@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 16:21:13 +0000
Message-Id: <20260625162114.417EA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The threaded interrupt handlers modify alarm state flags without l=
ocking, creating a race condition with sysfs reads that can result in lost =
alarm events.
--

commit 7c977021bab8a6a8bb249ac3b4ad711dbe88c4ff
Author: Flaviu Nistor <flaviu.nistor@gmail.com>

dt-bindings: hwmon: chipcap2: Add label property

This commit adds support for an optional label property similar to other
hwmon devices. This allows assigning distinct names to each CHIPCAP2
sensor instance on boards with multiple sensors.

> diff --git a/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.ya=
ml b/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
> index 17351fdbefce6..56b0cecfca5fb 100644
> --- a/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/amphenol,chipcap2.yaml
> @@ -45,6 +45,8 @@ properties:
>        - const: low
>        - const: high
> =20
> +  label: true
> +
>    vdd-supply:

[ ... ]

While reviewing the hwmon driver code for this hardware, I noticed a
potential locking issue in the interrupt handling.

> --- a/drivers/hwmon/chipcap2.c
> +++ b/drivers/hwmon/chipcap2.c
[ ... ]
> static irqreturn_t cc2_low_interrupt(int irq, void *data)
> {
> 	struct cc2_data *cc2 =3D data;
>=20
> 	if (cc2->process_irqs) {
> 		hwmon_notify_event(cc2->hwmon, hwmon_humidity,
> 				   hwmon_humidity_min_alarm, CC2_CHAN_HUMIDITY);
> 		cc2->rh_alarm.low_alarm =3D true;
                ^^^^

[Severity: High]
This isn't a bug introduced by this patch, but the threaded interrupt
handler modifies the min alarm flag without acquiring a lock. Could this
create a race condition where an active alarm gets overwritten?

> 	}
>=20
> 	return IRQ_HANDLED;
> }
>=20
> static irqreturn_t cc2_high_interrupt(int irq, void *data)
> {
> 	struct cc2_data *cc2 =3D data;
>=20
> 	if (cc2->process_irqs) {
> 		hwmon_notify_event(cc2->hwmon, hwmon_humidity,
> 				   hwmon_humidity_max_alarm, CC2_CHAN_HUMIDITY);
> 		cc2->rh_alarm.high_alarm =3D true;
                ^^^^

[Severity: High]
This is a pre-existing issue, but the max alarm flag is also modified
here without locking.

> 	}
>=20
> 	return IRQ_HANDLED;
> }
>=20
> static int cc2_humidity_min_alarm_status(struct cc2_data *data, long *val)
> {
> 	long measurement, min_hyst;
> 	int ret;
>=20
> 	ret =3D cc2_read_hyst_and_measure(data, CC2_R_ALARM_L_OFF, &min_hyst,
> 					&measurement);
> 	if (ret < 0)
> 		return ret;
>=20
> 	if (data->rh_alarm.low_alarm) {
> 		*val =3D (measurement < min_hyst) ? 1 : 0;
> 		data->rh_alarm.low_alarm =3D *val;
                ^^^^

[Severity: High]
This isn't a bug introduced by this patch, but the sysfs read thread
performs an unprotected read-modify-write on the alarm state flag here.

If a sysfs read of the alarm status evaluates the current measurement
over the I2C bus, and cc2_low_interrupt() concurrently receives an
alarm setting low_alarm to true, could the sysfs thread subsequently
overwrite the active alarm flag with 0 based on stale measurement data?

The hwmon subsystem documentation mentions that hwmon_lock() or custom
locking should be used to serialize sysfs operations with interrupt
handling.

> 	} else {
> 		*val =3D 0;
> 	}
>=20
> 	return 0;
> }
>=20
> static int cc2_humidity_max_alarm_status(struct cc2_data *data, long *val)
> {
> 	long measurement, max_hyst;
> 	int ret;
>=20
> 	ret =3D cc2_read_hyst_and_measure(data, CC2_R_ALARM_H_OFF, &max_hyst,
> 					&measurement);
> 	if (ret < 0)
> 		return ret;
>=20
> 	if (data->rh_alarm.high_alarm) {
> 		*val =3D (measurement > max_hyst) ? 1 : 0;
> 		data->rh_alarm.high_alarm =3D *val;
                ^^^^

[Severity: High]
This is a pre-existing issue, but the max alarm sysfs read also writes
back the max alarm flag without locking. Does this present the same risk
of lost alarm events if cc2_high_interrupt() runs concurrently?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625160423.1788=
2-1-flaviu.nistor@gmail.com?part=3D1
