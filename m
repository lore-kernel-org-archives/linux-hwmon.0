Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EE7183CC3
	for <linux-hwmon@vger.kernel.org>; Sat, 23 May 2026 05:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779515058; cv=none; b=eJpmRrYC8Ad6FvtPbrU+n/q1EeLoqROJvbz+zBDZ2vycETQf3L8hdOlA67OxyiXLmOOK9aBcq5uvw7lqTRRjiDSfg0rBNVDPMyXrz9y1WkipAJXR8j/Anp/9XHUORtgFJLrhi2GTATkQK/gPkV3QTFcsAb453RYwj0WJByDj4uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779515058; c=relaxed/simple;
	bh=cPjTflN/ex3xY1+HQB/d8KPnvS3WpkWuDwjLnFbQx0o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=akg7EuArUMt9qVCebvqnZQ64jL8XmKf0CrCvkJHnN0KuspZ5ecAE4eqHHK7YxMfwhILFTx1OJFPgsfB2ZYudFAuxe/I7I8KaUtin7dBNaKgkPMk6i6H/FrABefOlHBd/vUbaEI9t5w0owaM2Qvg2pSImbFNP9xilCSa9P9S84io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=APTZNyvL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="APTZNyvL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C57E51F000E9;
	Sat, 23 May 2026 05:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779515056;
	bh=iUoYBb6hDkZ16yWsjULFzyet5/O0eZw9G14DeOZbi24=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=APTZNyvLFadnvSHPCzCaPSfCi+2XNrCMi52Myp2o9OSZzbyenBJX4/BmFscA9niQ0
	 6GdhXlsKpYtF08pg/0XeVbWQDa1lc6sO8EMctM7+nBLygDwBxcXZohmsDwjMLwuWih
	 ionr/3B5ap+z+eKDQfH1lbhKf472YIvGStYCW7PghVwPj3uqyysmJkgedTl4S4NfAK
	 sDrY/UB4oZMInJHc7fdf9k2QLGlc/uPX8SN89hxsoSiG9hBYl3a3q85vhs/YjycWDl
	 1cqnjdGw1eVCJmYTkagxRcbKf86tWkgrblRVBKz5ZBYfS/vGC7qYC+XmdhrIbkqOCA
	 m/j0VkeO5QV6Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (fschmd) avoid client->dev dereference in
 watchdog_release
Reply-To: sashiko-reviews@lists.linux.dev
To: Chen-Shi-Hong <eric039eric@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260523051117.9400-1-eric039eric@gmail.com>
References: <20260523051117.9400-1-eric039eric@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 23 May 2026 05:44:16 +0000
Message-Id: <20260523054416.C57E51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] A race condition in `watchdog_open()` allows concurrent module rem=
oval to cause an immediate NULL pointer dereference.
- [High] A TOCTOU race condition in `fschmd_remove()` allows concurrent wat=
chdog operations to restart the hardware watchdog right before the driver d=
etaches, causing an unpreventable system reboot.
- [Medium] `watchdog_trigger()` and `watchdog_stop()` silently ignore the e=
rror return value from `i2c_smbus_write_byte_data()`, masking hardware fail=
ures.
- [Medium] I2C read failures are silently truncated to `u8` and blindly wri=
tten back to hardware registers, causing silent corruption.
--

commit 39762c6966aa166ac2bc648c9e46734689cef97a
Author: Chen-Shi-Hong <eric039eric@gmail.com>

hwmon: (fschmd) avoid client->dev dereference in watchdog_release
   =20
fschmd_remove() can detach the i2c client while the watchdog device
is still open. If watchdog_release() later takes the unexpected-close path,
it logs the event with dev_crit using data->client->dev, which could trigger
a use-after-free or NULL dereference. This patch changes the logging to use
pr_crit with data->watchdog_name instead.

> diff --git a/drivers/hwmon/fschmd.c b/drivers/hwmon/fschmd.c
> index 1211fa2259e52..d1e7fc72e81f9 100644
> --- a/drivers/hwmon/fschmd.c
> +++ b/drivers/hwmon/fschmd.c
> @@ -834,9 +834,9 @@ static int watchdog_release(struct inode *inode, stru=
ct file *filp)
>  		watchdog_stop(data);
>  		data->watchdog_expect_close =3D 0;
>  	} else {
> -		watchdog_trigger(data);
> -		dev_crit(&data->client->dev,
> -			"unexpected close, not stopping watchdog!\n");
> +		if (!watchdog_trigger(data))

[Severity: Medium]
This isn't a bug introduced by this patch, but watchdog_trigger() and
watchdog_stop() silently ignore the error return value from
i2c_smbus_write_byte_data().

If i2c_smbus_write_byte_data() returns a negative error code (e.g., -EIO) o=
n=20
hardware failure, these functions still return 0 (success) as long as=20
data->client is valid.

Does this mask hardware failures? If ping commands consistently fail silent=
ly,
will the hardware watchdog eventually time out and cause an unexpected syst=
em=20
reset while the userspace daemon assumes everything is fine?

> +			pr_crit("%s: unexpected close, not stopping watchdog!\n",
> +				data->watchdog_name);
>  	}
> =20
>  	clear_bit(0, &data->watchdog_is_open);

[Severity: Medium]
This isn't a bug introduced by this patch, but I2C read failures appear to =
be
silently truncated to u8 and blindly written back to hardware registers,
causing silent corruption.

In store functions such as alert_led_store() and fan_div_store():

drivers/hwmon/fschmd.c:alert_led_store() {
...
	reg =3D i2c_smbus_read_byte_data(to_i2c_client(dev), FSCHMD_REG_CONTROL);

	if (v)
		reg |=3D FSCHMD_CONTROL_ALERT_LED;
	else
		reg &=3D ~FSCHMD_CONTROL_ALERT_LED;

	i2c_smbus_write_byte_data(to_i2c_client(dev), FSCHMD_REG_CONTROL, reg);
...
}

If i2c_smbus_read_byte_data() fails, it returns a negative error code like
-EIO (-5). Truncating -5 to u8 results in 0xFB. The code then performs
bitwise logic on this garbage value and writes it back to the hardware
register via i2c_smbus_write_byte_data().

Does this corrupt the hardware state (and explicitly modify reserved bits i=
n=20
fan_div_store()) instead of propagating the I/O error to userspace?

[Severity: High]
This is a pre-existing issue, but there appears to be a race condition in=20
watchdog_open() that allows concurrent module removal to cause an immediate=
=20
NULL pointer dereference.

drivers/hwmon/fschmd.c:watchdog_open() {
	struct fschmd_data *pos, *data =3D NULL;
...
	if (!mutex_trylock(&watchdog_data_mutex))
		return -ERESTARTSYS;
	list_for_each_entry(pos, &watchdog_data_list, list) {
		if (pos->watchdog_miscdev.minor =3D=3D iminor(inode)) {
			data =3D pos;
			break;
		}
	}
	/* Note we can never not have found data, so we don't check for this */
	watchdog_is_open =3D test_and_set_bit(0, &data->watchdog_is_open);
...
}

If VFS misc_open() has already resolved the minor and dropped misc_mtx, can=
 a=20
concurrent fschmd_remove() successfully call misc_deregister() and=20
list_del(&data->list) before watchdog_open() acquires watchdog_data_mutex?

If this sequence happens, watchdog_open() will iterate the list, fail to fi=
nd
the minor, and exit the loop with data =3D NULL. It will then unconditional=
ly
call test_and_set_bit(0, &data->watchdog_is_open), triggering a kernel pani=
c.

[Severity: High]
This isn't a bug introduced by this patch, but there is a TOCTOU race condi=
tion
in fschmd_remove() that allows concurrent watchdog operations to restart th=
e=20
hardware watchdog right before the driver detaches, causing an unpreventabl=
e=20
system reboot.

When removing the device, fschmd_remove() calls watchdog_stop() to halt the=
=20
hardware watchdog if it is open:

drivers/hwmon/fschmd.c:fschmd_remove() {
...
		if (data->watchdog_is_open) {
...
			watchdog_stop(data);
		}
		mutex_lock(&watchdog_data_mutex);
		list_del(&data->list);
		mutex_unlock(&watchdog_data_mutex);
		/* Tell the watchdog code the client is gone */
		mutex_lock(&data->watchdog_lock);
		data->client =3D NULL;
		mutex_unlock(&data->watchdog_lock);
...
}

The watchdog_stop() function acquires data->watchdog_lock, stops the hardwa=
re,
and then releases the lock.

Because the lock is dropped between stopping the watchdog and invalidating =
the=20
client, is it possible for a concurrent watchdog_write() (ping) to interlea=
ve
and execute watchdog_trigger()?=20

Since data->client is still valid at that exact moment, this would restart =
the
hardware watchdog. fschmd_remove() then proceeds to set data->client =3D NU=
LL.
Any subsequent cleanup attempts will fail to stop the hardware watchdog bec=
ause
watchdog_stop() immediately returns -ENODEV if data->client is NULL, leavin=
g=20
the hardware watchdog ticking until a hard system reset.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260523051117.9400=
-1-eric039eric@gmail.com?part=3D1
