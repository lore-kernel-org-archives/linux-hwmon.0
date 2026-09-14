Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58543EAC84
	for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 07:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372251; cv=none; b=SxqATy3iqqxvJlcEec1RnqEXh/gJ7dLGkri+Vp5zOk02TdQgJaTxIpJmpqV0mLGBUbojUoXNt49Malyhb5O1hNupMnmrUccyNmPmUhr7dt36ceE9DcShplJpU9sTsUOCy40cr/JNOcVrfRcABbbLfywjIqgQaXWgtHkqF5ZZDyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372251; c=relaxed/simple;
	bh=0XjOZu/uRpIg82J2ruWlbLkZXYCFkAahPVlvrFguvI8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VPmbOPARtQfDyKXZOlp8EDMO7lItMVbhQLyYUJGT+846UvP/HOQkPPKPXdP/MA65cCfrb9il1whJ4q4hhzJcslw9ndtJ3O8XPdi/na+rNl4GRVigmhdxIrVcl57z5BG/LbDGh7p3uPp5rC2oldFOMva9tj9VSOdlOGwjBfOqcDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mjEMKXGs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mjEMKXGs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 280AE1F000FF;
	Mon, 14 Sep 2026 07:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789372249;
	bh=uwYe9ezu15gKS8b+FEwYrdmrLOzm7MGBLo/afqDWw+s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mjEMKXGsqyhSzgwiBhd2oLGH2DzFUCQGNgmyaz2Rc1zX7P/3F/+1vyf6Pb8mzAHo0
	 buS4SZuN0hbTzQ8t2hMvR8agySS2hnUs4YGymC9foKnxbTVnp5oxbteU8A5k0LuTLe
	 Sod/7d9D0L7YNAMEhNMiho1drtwFSFDNaj8aG6ggCDo7j8N+o6i+vFziDvXJeMbBAD
	 TmaePU50EYBE4kJHLiA89k3M6Xsd5sqIr/sdh7IS1ldevZ7MfuR3/k3FM8KoBzEg1X
	 U38yFQI0iN+E8u1z78YrIbPkCYwUrtlYvJJRBdm87TIY9V1FSkfxJQlYcwdtzBxhvA
	 TLxvQPDRXGBKw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (w83793) release probe data through kref
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <lgs201920130244@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260914073638.1662500-1-lgs201920130244@gmail.com>
References: <20260914073638.1662500-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 07:50:48 +0000
Message-Id: <20260914075049.280AE1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but there is a NULL =
pointer dereference in watchdog_close() when logging unexpected close after=
 device removal.
- [High] This problem wasn't introduced by this patch, but there is a data =
race and hardware bank corruption due to inconsistent locking between hwmon=
 and watchdog.
--

commit 62e1b0f8c7da574fa35b600e27a4223020469380
Author: Guangshuo Li <lgs201920130244@gmail.com>

hwmon: (w83793) release probe data through kref

w83793_probe() manages driver data lifetime through kref, but the probe
error path frees data directly with kfree(). This drops the initial
reference without a matching kref_put(), leaving reference accounting
unbalanced. This patch drops the probe-owned reference with kref_put()
instead and lets w83793_release_resources() perform the final free.

> diff --git a/drivers/hwmon/w83793.c b/drivers/hwmon/w83793.c
> index a548586369e1d..c6ef04c69856e 100644
> --- a/drivers/hwmon/w83793.c
> +++ b/drivers/hwmon/w83793.c
> @@ -1928,7 +1928,9 @@ static int w83793_probe(struct i2c_client *client)
>  	for (i =3D 0; i < ARRAY_SIZE(w83793_temp); i++)
>  		device_remove_file(dev, &w83793_temp[i].dev_attr);
>  free_mem:
> -	kfree(data);
> +	mutex_lock(&watchdog_data_mutex);
> +	kref_put(&data->kref, w83793_release_resources);
> +	mutex_unlock(&watchdog_data_mutex);
>  exit:
>  	return err;
>  }

[Severity: High]
This problem wasn't introduced by this patch, but there is a NULL pointer
dereference in watchdog_close() when logging unexpected close after device
removal.

If the w83793 device is unbound or removed while the /dev/watchdog file
descriptor is open, w83793_remove() clears data->client to NULL:

drivers/hwmon/w83793.c:w83793_remove() {
    ...
		/* Tell the watchdog code the client is gone */
		mutex_lock(&data->watchdog_lock);
		data->client =3D NULL;
		mutex_unlock(&data->watchdog_lock);
    ...
}

When the user subsequently closes the file descriptor without writing the
'V' magic close character, watchdog_close() executes the else branch and
calls dev_crit(&data->client->dev, ...) without verifying if data->client
is still valid:

drivers/hwmon/w83793.c:watchdog_close() {
    ...
	} else {
		watchdog_trigger(data);
		dev_crit(&data->client->dev,
			"unexpected close, not stopping watchdog!\n");
	}
    ...
}

Can this lead to a kernel panic (Oops) due to a NULL pointer dereference
when the unguarded data->client is accessed during teardown?


[Severity: High]
This problem wasn't introduced by this patch, but there is a data race and
hardware bank corruption due to inconsistent locking between hwmon and
watchdog.

The W83793 chip uses a paged register system selected via W83793_REG_BANKSE=
L.
Hwmon sysfs accesses use mutex_lock(&data->update_lock) before calling
w83793_write_value(), which modifies data->bank and updates the active chip
bank over I2C:

drivers/hwmon/w83793.c:w83793_write_value() {
    ...
	new_bank |=3D data->bank & 0xfc;
	if (data->bank !=3D new_bank) {
		res =3D i2c_smbus_write_byte_data(client, W83793_REG_BANKSEL,
						new_bank);
    ...
		data->bank =3D new_bank;
	}
    ...
}

However, watchdog functions perform I2C operations via w83793_write_value()
while holding ONLY data->watchdog_lock:

drivers/hwmon/w83793.c:watchdog_disable() {
    ...
	mutex_lock(&data->watchdog_lock);
	if (!data->client) {
		ret =3D -ENODEV;
		goto leave;
	}

	/* Disable Soft Watchdog */
	w83793_write_value(data->client, W83793_REG_WDT_LOCK, 0xAA);
    ...
}

Will concurrent execution of a watchdog operation and a hwmon sysfs
read/write race on data->bank and the hardware BANKSEL register? Does this
allow operations from one context to be inadvertently executed on the bank
switched by the other context, corrupting hardware registers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914073638.1662=
500-1-lgs201920130244@gmail.com?part=3D1
