Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AE23F4129
	for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 23:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778801428; cv=none; b=ThTpAwN2iqENoN7X1sM0qfJ+rDSiAk+zwckXoV6dMpWVNx/4orGNFZLQd9qhHzAuKWSpAhDEjVZUs3dkMcQfs8O2uz0DV5FsPOQXIwR9X2g+v4ZJ5RxWkR6Rt2Gc1v0h5XMFUmyUEnPH1j9x4LPZgUcoxQIasVQ6gNgiFKpfFYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778801428; c=relaxed/simple;
	bh=8AfZIYVibqAcAjJ0ykXSUMov5VracSqUMdq1eL9vCu0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QJgWUmsHa6ifdmXV/KWonwaZ+d5jHEgNVsRMynQQJJ0FqHNW0j5TEDj9JFsPcd31i/u/dGQ8Mj9ZAktuhhnIhxT0XBwX65gIcyQSmgXPOByqtHkBegYVzjBgdpTXb6xP05FFs5bqasJsfjMuzP7d9IH6pfvtmYvc4ikNjI1KHi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gWfmdISZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gWfmdISZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A6E9C2BCB3;
	Thu, 14 May 2026 23:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778801427;
	bh=8AfZIYVibqAcAjJ0ykXSUMov5VracSqUMdq1eL9vCu0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=gWfmdISZ7dSAhq5Ftw+rzyPODHwVfiu7UQJw0NxFtzBOVOuXgJv5J9Ds+Y0/0U9E3
	 K3D8NgPD4ljAePgmzA/FBwQrURhiRwKMOL92x3V2/F0kWnT2XI82k5km9C951J5Cjb
	 /CoGFXYsqmK1/CflX0kRu7w8jIoSACVERXAvDE8B1Jt1Em+bi2DCCYVnbRKpGV3u/B
	 YaCktjx08pNhC7SBJYfmE3ujdGYE7xJ7A9n7V24g++tatenJALkQS9StBNWaAizoMz
	 Mkf9np6FcYExS1hBg3hbwSCLvbRLyqm07KqkqPm7OsWj4o4IxaJbPGuDRrV8QmQObr
	 znxYFT/CFre6A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: (lm90) Add lock protection to lm90_alert
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260514220214.1380831-2-linux@roeck-us.net>
References: <20260514220214.1380831-2-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 23:30:27 +0000
Message-Id: <20260514233027.7A6E9C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] Use-After-Free due to incorrect devm teardown sequence
--

commit 8b53a979a14111ccbfe05e43369fd3214a55c211
Author: Guenter Roeck <linux@roeck-us.net>

hwmon: (lm90) Add lock protection to lm90_alert

This commit adds hwmon_lock protection to lm90_alert to prevent concurrent
sysfs write operations from overwriting the alert handler's modifications.
This solves an interrupt storm problem when an alert interrupt occurs
concurrently with a sysfs write.

> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
> index 50b30d7192256..6658c743659b8 100644
> --- a/drivers/hwmon/lm90.c
> +++ b/drivers/hwmon/lm90.c
> @@ -2939,6 +2939,7 @@ static void lm90_alert(struct i2c_client *client, e=
num i2c_alert_protocol type,
>  		 */
>  		struct lm90_data *data =3D i2c_get_clientdata(client);
> =20
> +		hwmon_lock(data->hwmon_dev);
>  		if ((data->flags & LM90_HAVE_BROKEN_ALERT) &&
>  		    (data->current_alarms & data->alert_alarms)) {
>  			if (!(data->config & 0x80)) {
> @@ -2948,6 +2949,7 @@ static void lm90_alert(struct i2c_client *client, e=
num i2c_alert_protocol type,
>  			schedule_delayed_work(&data->alert_work,
>  				max_t(int, HZ, msecs_to_jiffies(data->update_interval)));
>  		}

This isn't a regression introduced by this patch, but it exists in the
driver's device teardown path. Can this workqueue re-arming lead to a
use-after-free of the data structure during device unbind?

In lm90_probe(), devm_hwmon_device_register_with_info() is called before
adding lm90_stop_work():

drivers/hwmon/lm90.c:lm90_probe() {
    ...
	hwmon_dev =3D devm_hwmon_device_register_with_info(dev, client->name,
							 data, &data->chip,
							 NULL);
    ...
	err =3D devm_add_action_or_reset(&client->dev, lm90_stop_work, data);
    ...
}

Because devres executes actions in reverse order of addition,
lm90_stop_work() runs first during device unbind or probe failure. This
synchronously cancels both alert_work and report_work:

drivers/hwmon/lm90.c:lm90_stop_work() {
    ...
	cancel_delayed_work_sync(&data->alert_work);
	cancel_work_sync(&data->report_work);
}

However, at this point the hwmon device is still registered, meaning its
sysfs attributes are fully accessible to userspace.

If a concurrent sysfs read occurs to a file like temp1_input, it will
invoke lm90_temp_read(), which calls lm90_update_device() and subsequently
lm90_update_alarms_locked().

If alarm conditions are still met, this path explicitly re-arms the
workqueues by calling schedule_delayed_work(&data->alert_work, ...) or
schedule_work(&data->report_work).

After the sysfs read finishes, devres proceeds to unregister the hwmon
device and free the lm90_data structure. The incorrectly re-armed work
will eventually execute in the background using the freed data pointer.

> +		hwmon_unlock(data->hwmon_dev);
>  	} else {
>  		dev_dbg(&client->dev, "Everything OK\n");
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514220214.1380=
831-1-linux@roeck-us.net?part=3D2
