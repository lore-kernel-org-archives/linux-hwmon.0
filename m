Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E4E3EB0F4
	for <linux-hwmon@vger.kernel.org>; Thu, 25 Jun 2026 16:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782406796; cv=none; b=f6DW8inJtL9udf+Cb/3B2Yxihn7bX9OhMjoMgVnkeNX7m5LYCXaei7HgASP3t/TJjkZIqSE6lmQOW2Zvs7NDQRvrVohpHkZa60Ug0C9CP5xz5crC8x0kKAFslXH2bZmwROZlNgU6IwE6nJUgNvyciD4IzdRDF80FK0OFc21Ksuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782406796; c=relaxed/simple;
	bh=zV9d8AItHFg684bqybM1tDzvLtUnpZpfoH54jwp2UZU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tbsHZCfWn+Z/O04uNzeXTEL4KEnSrAW3Yy38RAblIItASnPz5xZcGcsXOtpYkpDVfMdRDw5pFAQ6bcKQpaxSLX9+WGBgi6fkUnSxMKenvi04T6XxEztCldcKIKR6zvyoE2g6BIXNZGszc3b75HGkNj9JeXFUz7WR51M0fu7LtuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PUW1vl1L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PUW1vl1L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7A301F00A3A;
	Thu, 25 Jun 2026 16:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782406794;
	bh=oo2CUbYUmYIqZZhdYgUQ5WLIFKsJbGRuqimHYFccrT8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PUW1vl1LzZK/+L2WFfx/wFw3gJKBh2BbxSb44aBTMV+4G/lBaf+yZzbLr8dCiYiSx
	 KA/8GCTuuMjdpMUafxmlmVQ2g8YcDuduE4fNsG6+fKZl4GCwwdcXfTK4vsD364bYgt
	 U2sEdJuyq80Y9mXexPBhTdCeAsGHPVGBAMRy0G+7e0hiEucBuGvXf3OV2SU5aZmPk8
	 RyDymVZjLG8kySbd2+fVu0Ze2MdKLiJsWxQIhKxZviQkbCj/u9bXhk98XfKQZ7pllx
	 5n1kZORlXL71WB/6XXA9Q+7dSVWmMATCRB+FXtxUnIl1xqWz0BbeHSrrCDhTtBE9/p
	 a3UG3jWKLAKUA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/1] hwmon: (occ) Fix sysfs device unreg deadlock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ninad Palsule" <ninad@linux.ibm.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260625164700.2797362-2-ninad@linux.ibm.com>
References: <20260625164700.2797362-1-ninad@linux.ibm.com>
 <20260625164700.2797362-2-ninad@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 16:59:54 +0000
Message-Id: <20260625165954.B7A301F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Releasing the driver lock before unregistering the hwmon device in=
troduces a data race on the shared `occ->group` structures.
- [High] Pending sysfs reads execute hardware access via `occ_poll()` after=
 the device has been explicitly deactivated due to a missing `occ->active` =
check.

Pre-existing issues:
- [High] The exact same sysfs unregistration deadlock fixed in `occ_active(=
)` remains unfixed in `occ_shutdown()`.
- [High] Repeatedly toggling the OCC active state via sysfs causes an unbou=
nded memory leak due to `devm_kcalloc` allocations that are never explicitl=
y freed.
--

commit 834d342f5072edda5a28c9ccd24f73161c2356f5
Author: Ninad Palsule <ninad@linux.ibm.com>

hwmon: (occ) Fix sysfs device unreg deadlock

This commit addresses a deadlock when unregistering the hwmon device by
releasing the driver lock before calling hwmon_device_unregister(). This
allows pending sysfs operations to complete without blocking unregistration.

> diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
> --- a/drivers/hwmon/occ/common.c
> +++ b/drivers/hwmon/occ/common.c
> @@ -1149,15 +1149,22 @@ int occ_active(struct occ *occ, bool active)
>  			goto unlock;
>  		}
>  	} else {
> +		struct device *hwmon_dev =3D occ->hwmon;
> +
>  		if (!occ->active) {
>  			rc =3D -EALREADY;
>  			goto unlock;
>  		}
> =20
> -		if (occ->hwmon)
> -			hwmon_device_unregister(occ->hwmon);
>  		occ->active =3D false;
>  		occ->hwmon =3D NULL;
> +
> +		mutex_unlock(&occ->lock);

[Severity: High]
Could releasing occ->lock here expose the shared occ->group structures to
concurrent modification?

If one thread unregisters the device while another thread concurrently
activates it, the activating thread calls occ_setup_sensor_attrs() which
dynamically reallocates the attributes:

occ_setup_sensor_attrs()
    ...
    occ->group.attrs =3D devm_kcalloc(...)

Since the unregistering thread is simultaneously iterating over occ->groups,
does this risk a NULL pointer dereference in sysfs_remove_file() due to
reading an uninitialized pointer?

> +
> +		if (hwmon_dev)
> +			hwmon_device_unregister(hwmon_dev);

[Severity: High]
Since occ->lock is dropped before unregistering, could pending sysfs access=
es
now communicate with deactivated hardware?

If a sysfs read or write is waiting for occ->lock in occ_update_response() =
or
occ_set_user_power_cap(), it will wake up once the lock is released here.
Because those functions do not verify if occ->active is still true after
acquiring the lock, will they proceed to call occ_poll() or send_cmd() on a
device that has just been deactivated?

> +
> +		return 0;
>  	}
> =20
>  unlock:

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but does the exact same deadlock
still exist in occ_shutdown()?

Looking at occ_shutdown():

occ_shutdown() {
    mutex_lock(&occ->lock);
    occ_shutdown_sysfs(occ);
    if (occ->hwmon)
        hwmon_device_unregister(occ->hwmon);
    ...
}

Since this continues to hold occ->lock while unregistering the hwmon device,
wouldn't a concurrent sysfs read waiting for occ->lock in
occ_update_response() cause an AB-BA deadlock during driver unbind?

[Severity: High]
This is a pre-existing issue, but does repeatedly toggling the active state
via sysfs cause an unbounded memory leak of occ->attrs?

When the device is activated, occ_setup_sensor_attrs() allocates arrays:

occ_setup_sensor_attrs() {
    occ->attrs =3D devm_kcalloc(dev, num_attrs, sizeof(*occ->attrs),
                              GFP_KERNEL);
    ...
}

Since these are devres allocations, they are only cleaned up when the platf=
orm
device unbinds. When occ_active is toggled to false, they are not explicitly
freed. If a management script repeatedly writes to the occ_active sysfs
attribute, will this continuously leak occ->attrs and occ->group.attrs?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625164700.2797=
362-2-ninad@linux.ibm.com?part=3D1
