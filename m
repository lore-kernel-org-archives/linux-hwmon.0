Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8054A13A4;
	Thu, 23 Jul 2026 13:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784812441; cv=none; b=sj9w4hg1hLXUA0zwhaKDmiDNFzWWYEux31ZEGKNk//iez/uV2EUsXYC6e8zhdOOLio11EtBVKdSnMowh6peTZpGL+4VxsxSFyzu6NX7mENK3gj6kkk6hQY1ei2nUB6rj94QdlYQdhNlUByQCbBj33+2/GuOliyfdQ+sJdw2Geq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784812441; c=relaxed/simple;
	bh=P3r1jYQUDGy1LAXJKnVOi+8SHtHX6gUY1a00yDSbDZU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CdyJWgWfD2+FxKO+S2kgIhhMv7U4VZyRUHys8J2VwS5/lnVOk23ba/sC2GjKmmi7jIcFs/BRd6aSjRweYLdEt5NqX5Fp3mU/NYoRp17OtIZ5KNBKkpNyHTAktQOiIKQOvmONXT7wQhxzToYh4EVdz7B7wHHe+qU0LT/pKZVTrUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 182B61F000E9;
	Thu, 23 Jul 2026 13:13:52 +0000 (UTC)
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] hwmon: pmbus: event notification with alarms
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260723-mpq8646_v0-v1-1-14363c75916f@free.fr>
References: <20260723-mpq8646_v0-v1-0-14363c75916f@free.fr>
 <20260723-mpq8646_v0-v1-1-14363c75916f@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 13:13:22 +0000
Message-Id: <20260723131352.182B61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] PMBus core's pmbus_notify() calls sysfs_notify() on the wrong kobj=
ect, silently breaking sysfs poll() and udev events for hardware alarms.
--

--- Patch [1]: [PATCH 1/3] hwmon: pmbus: event notification with alarms ---
commit 2d27260577dbfaf59cc5dfe956f36d8429cbffb8
Author: Vincent Jardin <vjardin@free.fr>

hwmon: pmbus: event notification with alarms

This commit introduces pmbus_get_hwmon_device() to allow PMBus chip drivers
to retrieve the hwmon class device for an i2c_client. This enables drivers
to call hwmon_notify_event() on per-sensor alarm attributes during work-item
polling when SMBALERT# is unavailable.

> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus=
_core.c
> index 3143b9e0316c4..6ba00ad732973 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c

[ ... ]

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
> +

[Severity: High]
This is a pre-existing issue, but while looking at how hwmon devices are
exposed for alarm notification, I noticed that pmbus_notify() might be
sending notifications to the wrong kobject:

drivers/hwmon/pmbus/pmbus_core.c:pmbus_notify() {
    ...
    sysfs_notify(&data->dev->kobj, NULL, da->attr.name);
    kobject_uevent(&data->dev->kobj, KOBJ_CHANGE);
    ...
}

Since the hwmon attributes are attached to the hwmon device rather than the
parent I2C device, does sysfs_notify() fail to find the attribute and return
silently?

If so, this could prevent userspace processes polling on hardware alarm sys=
fs
attributes from being awakened when a hardware fault occurs, leaving alarms
unhandled.

Would it make sense to update pmbus_notify() to use data->hwmon_dev->kobj
instead to ensure poll() and udev events work correctly?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-mpq8646_v0=
-v1-0-14363c75916f@free.fr?part=3D1
