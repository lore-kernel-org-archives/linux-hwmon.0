Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA843E123F;
	Thu, 23 Jul 2026 21:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784843450; cv=none; b=SZjR7z1MnX4UYGV+c5/qd4BMtAtrXRDccj9IaRxIsbNdUXMQiDnhF+VrHZNlNE0BvDqMpQ8OhR36oVyjaHEJpM4tKKm0O4E4T09E0IXQ7Tyc+Avdb6BO9seVU20wGUWym/JnivStJYifH2FxCqspvdUwDuotW2RgsLj7BDpOjQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784843450; c=relaxed/simple;
	bh=HYa/vRk+i7KhK/DlzZ31NP4qV6Jvam9P+qX4OZyuhXc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Z2hMsjzcYLDc9mhZVbvFX7ia1zSu0F1OnNcFIZr5XUq6tUO5N8AWM0tl332a/UxP9ac86PBINM8zPZBN/zH7abzvA1W4DpdHWCXeeUDHIdQa8r16gT9INgm/7KVKA7ofi+hSUeos8Plm4U6u24Hx0CAkQKsyaaxpf8KCz0/vHWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y/9S25e5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y/9S25e5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA8901F000E9;
	Thu, 23 Jul 2026 21:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784843449;
	bh=MHFEWyjrnMVsm3i7VM3fBhPEg8PewQZB3jrQDpfrnik=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y/9S25e5BUsYfPYa0r4Rxn+frYfpf+1U5eqpfD8uAXEZBCYogV1xZDYbvKFCqQeBM
	 8NEgHUpelYYFPQ0if1TBhHI0K57aOzV5dotFPLcn7NaF+LFXiuvS7RJp/PAx/sFAyc
	 N4ik48QmFzk0J0EiJUw6kyv6irO8JrZkSZjb6mm+hIVYmXpRdIFBjVug3GIQrmqqvk
	 RLNOHenoB9vfSC7/mTEXh9rYmWMpHbSYUH/U7A84dDh3WDExz+IhHn4/tICHBjs2K5
	 DS5wpRigRBzZGdJmJ5cjocvhRoyWdEJKiCUb4ofUksdVwUdbNreGA7RqWiOw/9W3IF
	 pSebGgO3N3zNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] hwmon: pmbus: event notification with alarms
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260723-mpq8646_v0-v4-1-b6323d5fc524@free.fr>
References: <20260723-mpq8646_v0-v4-0-b6323d5fc524@free.fr>
 <20260723-mpq8646_v0-v4-1-b6323d5fc524@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 21:50:48 +0000
Message-Id: <20260723215048.EA8901F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the PMBus core n=
otifies the wrong kobject when hardware monitoring events occur, functional=
ly breaking IRQ-based notifications.
--

--- Patch [1]: [PATCH v4 1/3] hwmon: pmbus: event notification with alarms =
---
commit eeca7812901a45049c95eb874da22e86da04ee7e
Author: Vincent Jardin <vjardin@free.fr>

hwmon: pmbus: event notification with alarms

Let's add an accessor for the hwmon class device the pmbus core
registered for an i2c_client. Export it with PMBUS so chip
drivers can call hwmon_notify_event() on per-sensor *_alarm
attributes from the driver's work items.

The needs: for boards when the chip's SMBALERT# pin is
not available for the CPU, pmbus_irq_setup() cannot deliver
poll(POLLPRI) wakes or udev change@... events on the inX_alarm
files. So the drivers can install a delayed_work-based polling
fallback (like the lm90 driver) that periodically reads STATUS_WORD
and calls hwmon_notify_event() on 0->1 transitions.

> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus=
_core.c
> index 3143b9e0316c4..6ba00ad732973 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -695,6 +695,14 @@ const struct pmbus_driver_info *pmbus_get_driver_inf=
o(struct i2c_client *client)
>  }
>  EXPORT_SYMBOL_NS_GPL(pmbus_get_driver_info, "PMBUS");
> =20
> +struct device *pmbus_get_hwmon_device(struct i2c_client *client)
> +{
> +	struct pmbus_data *data =3D i2c_get_clientdata(client);
> +
> +	return data->hwmon_dev;
> +}
> +EXPORT_SYMBOL_NS_GPL(pmbus_get_hwmon_device, "PMBUS");

[Severity: High]
This isn't a bug introduced by this patch, but the PMBus core notifies the
wrong kobject when hardware monitoring events occur.

While this patch adds a way for polling drivers to notify the hwmon device
properly, does the standard interrupt path silently fail to notify userspac=
e?

When an interrupt is triggered, the event propagates through
pmbus_fault_handler() -> _pmbus_get_flags() -> pmbus_notify().

Looking at pmbus_notify() in drivers/hwmon/pmbus/pmbus_core.c, it appears to
notify the I2C parent device's kobject rather than the hwmon device:

drivers/hwmon/pmbus/pmbus_core.c:pmbus_notify() {
    ...
		if (reg =3D=3D sreg && page =3D=3D spage && (smask & flags)) {
			dev_dbg(data->dev, "sysfs notify: %s", da->attr.name);
			sysfs_notify(&data->dev->kobj, NULL, da->attr.name);
			kobject_uevent(&data->dev->kobj, KOBJ_CHANGE);
			flags &=3D ~smask;
		}
    ...
}

Since the sysfs attributes are registered on the hwmon class device
(data->hwmon_dev), doesn't calling sysfs_notify() and kobject_uevent() on
data->dev->kobj prevent userspace applications from receiving POLLPRI or ud=
ev
events when an interrupt triggers an alarm?

Could this be fixed to use data->hwmon_dev instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-mpq8646_v0=
-v4-0-b6323d5fc524@free.fr?part=3D1
