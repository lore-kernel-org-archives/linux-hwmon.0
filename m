Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2637518C2C;
	Fri, 24 Jul 2026 00:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784851844; cv=none; b=iP5QHNtNzlF/un6+UkY68cTgFFDNFDtvfAwf5HtkXraWvt0uQoKGOHvDDaldui3CJKWo8IP1QZDhZ1q5UXlmDrF8f0Uv6aKNA97k1hSdlpQ4CnzpmV6k+p7nsXa7oBm44d5ayZQE1C245A8D57hPl2MeXutb2rdxz9S64ktF91g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784851844; c=relaxed/simple;
	bh=/XCGfZZryYqf2RL/9Bk7o8Rj8P8DEX1WJbP6Beezntg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C+xDd5iK72Lmx2CJUoKAxVDiyT3JkhsA0A29wDDdiJ56PxNmODiqf5Oa0c0VIOyLp85jlRdtcwgi4Mt3Cc1cgvZBimnwPfEHl9A532gnaCBpXIhA9L0IoS9+yAVy1pqO8HYAyYTFpvXw8s1Kxym24Enhg/2jOjxnyjnhh6pagL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DhGBvzLG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DhGBvzLG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C7F61F000E9;
	Fri, 24 Jul 2026 00:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784851842;
	bh=phfgCvD7Zr20r32BqBpd4JvtMbpPd+s7B27tAOBtStc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DhGBvzLG29tjsKUSBvv3GRfVO7S8CNfMClQkWZaPD8ciFZSNpZuTW+ArpLNex+vWM
	 00namJiqwl1bypjpLolPeIFm+HdtFNBvIQo6sax0qquRPfJg5GZ64BtAPB4ARXzdtJ
	 YvSRJRIwvCgqqjq6nCUetOKe83tkiLK9bIh9o0l1uaNjwYcrXjE8o+Bz4twS/Zy8WE
	 jBV6645PbbjvEeiz9h+QTuFQaL22SjPgwo3CKJKzojXqMcMtHNQGr2F1amxx/Ax42z
	 FaHbc+9KlDp/cW2vARyAv6fkoPyAnTPesDfjPnzAIrvvA7rP2cVu4e4mLxB8eokpKp
	 53AaA03jdTFRw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/3] hwmon: pmbus: event notification with alarms
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260724-mpq8646_v0-v5-1-5915b5ae9aa2@free.fr>
References: <20260724-mpq8646_v0-v5-0-5915b5ae9aa2@free.fr>
 <20260724-mpq8646_v0-v5-1-5915b5ae9aa2@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 00:10:41 +0000
Message-Id: <20260724001042.5C7F61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Using hwmon_notify_event() for PMBus temperature alarms silently f=
ails to notify the thermal subsystem due to an architectural mismatch.

Pre-existing issues:
- [High] pmbus_notify() calls sysfs_notify() on the parent I2C device's kob=
ject instead of the hwmon device, breaking userspace poll() on alarm attrib=
utes.
--

--- Patch [1]: [PATCH v5 1/3] hwmon: pmbus: event notification with alarms =
---
commit 3c1ad67c1176e741304b7aff4d177996b81ebe1a
Author: Vincent Jardin <vjardin@free.fr>

hwmon: pmbus: event notification with alarms

This patch adds an accessor for the hwmon class device registered by the
pmbus core. It is exported so chip drivers can use it to call
hwmon_notify_event() for alarm attributes in polling fallback routines.

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
Does using hwmon_notify_event() with this device successfully notify the
thermal subsystem?

Looking at how hwmon_notify_event() works, it relies on iterating over the
hwdev->tzdata list:

drivers/hwmon/hwmon.c:hwmon_thermal_notify() {
    ...
    list_for_each_entry(tzdata, &hwdev->tzdata, node) {
        if (tzdata->index =3D=3D index) {
            thermal_zone_device_update(tzdata->tzd, THERMAL_EVENT_UNSPECIFI=
ED);
        }
    }
    ...
}

Because pmbus_core.c registers the hwmon device using
devm_hwmon_device_register_with_groups() rather than
devm_hwmon_device_register_with_info(), and manually registers thermal zones
via devm_thermal_of_zone_register(), will hwdev->tzdata be empty?

If hwdev->tzdata is unpopulated, will thermal alarms signaled via this new
polling fallback silently fail to trigger the thermal subsystem?


[Severity: High]
This is a pre-existing issue, but does pmbus_notify() currently notify the =
wrong
kobject when SMBALERT# interrupts do fire?

Looking at pmbus_notify() in drivers/hwmon/pmbus/pmbus_core.c:

drivers/hwmon/pmbus/pmbus_core.c:pmbus_notify() {
    ...
    sysfs_notify(&data->dev->kobj, NULL, da->attr.name);
    kobject_uevent(&data->dev->kobj, KOBJ_CHANGE);
    ...
}

Since devm_hwmon_device_register_with_groups() registers the attribute
groups on the newly created hwmon child device (data->hwmon_dev) and not the
parent I2C device (data->dev), and sysfs_notify() does not recurse into
child directories, will userspace applications relying on poll(POLLPRI) for
these alarm attributes fail to wake up?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-mpq8646_v0=
-v5-0-5915b5ae9aa2@free.fr?part=3D1
