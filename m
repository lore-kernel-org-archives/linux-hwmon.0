Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37CB2D7DF1
	for <linux-hwmon@vger.kernel.org>; Thu, 23 Jul 2026 15:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784822368; cv=none; b=A7zsSpNcSglLdhfBiQmQEvl7fCclcU+mogH8A13m5T9L6j3ppR4RiTHu8LgHWgDXAdk9Ke4xLJ5FNUF3unpzzgflX6v4DhqvwpF/BQ2xsLn03HkKmcEfVW37YjidoCAR7TYUAkJE3oTJAYWjdbvB0hKLwLNqcIg3enTCZS/BGNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784822368; c=relaxed/simple;
	bh=U3SUFHppyFT1oVgNLISqFRpD1NZZVWPTRlS/etcl1fI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tVa4Qow3LGxhFzXzUhs/00wIv02p4LmS1dMDI5MgRCFZLC7IMKo3aOrUZenEijrIropCWVFC1G+7FvaJRt+4NnDc9OAJA7xqTEWMtN2e9Pq3gDNMEHcSw/fS3yDqODuyOUhaPYQ1fruxNPvEza4VxeYrhgtdithD06uVDCSq+zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NXI/nMkF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NXI/nMkF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13B771F000E9;
	Thu, 23 Jul 2026 15:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784822366;
	bh=DMPvHd1rzrdZtKA4CS868uGEzj1PZF3SxF9AjyfUqpc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NXI/nMkFqGTpxjhGkTWNPxHaxQugKhMqM+QHCH1JnhjdkCgVT1nhE8uxTPvqTJiwV
	 FracIjRBMXXAEVzZp5JoH+tzBRKpHgKiogTBqGAgGvjNz2fj2cYXcVKuV99wdrk/zv
	 uupchCiV4X+WuxoMulCDi2am+tHuLauasdFX+L0hrkVCCyTN7YnOuoWyQdLwdIE/ay
	 bz0omRK/2tAjMFUCnt0x8JKT9E0zyg191GniEE/ZMWXplm0Umhb9CEL4mLf+YwmiZt
	 H+ys6Kw7L5UIT+4flp/M0F8tnuB8YhYu7Tw9LZCiy861rvgUuM378hkFz4KawsR402
	 ZpEIOp6xRPfuw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/core) notify on the hwmon device, not the
 i2c client
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260723-fix_hwmon_notify_v1-v1-1-5a24c528686d@free.fr>
References: <20260723-fix_hwmon_notify_v1-v1-1-5a24c528686d@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 15:59:25 +0000
Message-Id: <20260723155926.13B771F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Type confusion in pmbus_notify() causes out-of-bounds read and dro=
pped hardware alarms.
--

--- Patch [1]: [PATCH] hwmon: (pmbus/core) notify on the hwmon device, not =
the i2c client ---
commit 4976d3d0a1b77e2b4e30c18177904c9cbbe066a2
Author: Vincent Jardin <vjardin@free.fr>

hwmon: (pmbus/core) notify on the hwmon device, not the i2c client

This commit fixes the event notification mechanism in pmbus_notify by
redirecting sysfs_notify and kobject_uevent from the i2c client's kobject
to the hwmon class device. This ensures poll waiters and udev listeners are
properly awakened on SMBALERT faults.

Cc: stable@vger.kernel.org # v6.4+

> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus=
_core.c
> index 3143b9e0316c4..0081f16c3a95a 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -2985,8 +2985,9 @@ static void pmbus_notify(struct pmbus_data *data, i=
nt page, int reg, int flags)
> =20
>  		if (reg =3D=3D sreg && page =3D=3D spage && (smask & flags)) {
>  			dev_dbg(data->dev, "sysfs notify: %s", da->attr.name);

[Severity: High]
This isn't a bug introduced by this patch, but I noticed a potential type
confusion issue here while reviewing the notification logic.

Does the loop in pmbus_notify() safely handle heterogeneous attribute types?

Looking at the start of the loop in pmbus_notify(), it unconditionally casts
every attribute to a struct sensor_device_attribute:

drivers/hwmon/pmbus/pmbus_core.c:pmbus_notify() {
        for (i =3D 0; i < data->num_attributes; i++) {
                struct device_attribute *da =3D to_dev_attr(data->group.att=
rs[i]);
                struct sensor_device_attribute *attr =3D to_sensor_dev_attr=
(da);
                int index =3D attr->index;
...
}

However, data->group.attrs can contain other types like struct
pmbus_samples_reg or struct pmbus_sensor, which only embed a base
struct device_attribute.

If da is a struct pmbus_samples_reg, dev_attr is the last member. Casting
it to struct sensor_device_attribute and reading the index field appears
to access memory past the end of the allocation, which might trigger a
slab-out-of-bounds read.

Additionally, if da is a struct pmbus_sensor, casting it causes the index
field to overlap with the page, phase, and reg fields. Could this produce
a garbage mask on little-endian systems that spuriously matches the target
reg, page, and flags during an alert?

If so, it seems this could prematurely clear bits from flags via
flags &=3D ~smask and silently drop legitimate hardware alarms before
reaching the actual boolean alarm attribute.

> -			sysfs_notify(&data->dev->kobj, NULL, da->attr.name);
> -			kobject_uevent(&data->dev->kobj, KOBJ_CHANGE);
> +			sysfs_notify(&data->hwmon_dev->kobj, NULL,
> +				     da->attr.name);
> +			kobject_uevent(&data->hwmon_dev->kobj, KOBJ_CHANGE);
>  			flags &=3D ~smask;
>  		}
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-fix_hwmon_=
notify_v1-v1-1-5a24c528686d@free.fr?part=3D1
