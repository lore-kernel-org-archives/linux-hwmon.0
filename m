Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9017D36493F
	for <linux-hwmon@vger.kernel.org>; Fri, 15 May 2026 01:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778807917; cv=none; b=lM8rafXJE4J3Wi4//l3NcZiKYbs5A1WkbfYRchW8Gm0iLjRc8IUPvMJ08fx9VposSCHTz6feMno7CLhcwKFVWbBoy5mSBf4W7E/+yZhgkkIAf9qtuKlZjDPmPMpSSDTr6My2Ji/I2axbfU4WwuoweArnd3l5BhvbPo/8upMtrUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778807917; c=relaxed/simple;
	bh=Wc6HMrEI113avE7fP4NuJK3s6tNe3/PlejngrYGzpGY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TvU03l+Vog5gG+fTnV717rTOTnYMl58bQVXSfwIrDjxJFZQyWsEJkKXSklrtZEqTPOGskQ1AP9oNALocNzCeqht5KIpYufsOxe3v5A3WUYWmDWq89Vkx38kk0SbVG0m2ucCaXZHGI8/RY00n7dFoFdj6r1JJBsy8NjfcdBitIe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KNanTxRI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KNanTxRI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54DECC2BCC6;
	Fri, 15 May 2026 01:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778807917;
	bh=Wc6HMrEI113avE7fP4NuJK3s6tNe3/PlejngrYGzpGY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=KNanTxRIDKL6jGI6kpmIJ+D5UAHJu9QLIKd0jeTusQ5yO1L3LOj8YEBqHXXoM4mkH
	 VD+s16ioTTY26lp+rVw4IphOp4Kfb7pbRvb5mj1ASZUKtK2yPocwxjzAek9WZb4l8c
	 zVAx5uW01nP0YTHslVLly9ijQFG2wvCOPvv6sNsZN7Dy+jRFKKWfIWNThkPxTU6Wlv
	 YhS8W8XcR7VglgIvBS1vZRvFsJdaVFVyqU9emBNOTBPbTVyaCF8yLXqjNpM4RgTb6h
	 sQJ5ojzXVdGGuezJqKemzyzkaQhUkkAPG1xPRI2phGp51t/FjEUK1faClKtoQJUoyd
	 tY/ZWNK05nb0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (lm90) Add lock protection to lm90_alert
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260514235626.1403695-2-linux@roeck-us.net>
References: <20260514235626.1403695-2-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 01:18:36 +0000
Message-Id: <20260515011837.54DECC2BCC6@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] Race condition between sysfs reads and devres teardown (`lm90_=
stop_work`) leaves delayed work enqueued after the data structure is freed.
--

commit a26cbd27d33d410e7909a5d68c680507e329f297
Author: Guenter Roeck <linux@roeck-us.net>

hwmon: (lm90) Add lock protection to lm90_alert

This commit adds hwmon_lock protection to lm90_alert() to prevent
concurrent sysfs writes from overwriting hardware register modifications
made during alert handling.

> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
> index 08a568f7b56f9..9d0c23420842a 100644
> --- a/drivers/hwmon/lm90.c
> +++ b/drivers/hwmon/lm90.c
> @@ -2944,6 +2944,7 @@ static void lm90_alert(struct i2c_client *client, e=
num i2c_alert_protocol type,
>  		 */
>  		struct lm90_data *data =3D i2c_get_clientdata(client);
> =20
> +		hwmon_lock(data->hwmon_dev);
>  		if (!data->shutdown && (data->flags & LM90_HAVE_BROKEN_ALERT) &&
>  		    (data->current_alarms & data->alert_alarms)) {
>  			if (!(data->config & 0x80)) {
> @@ -2953,6 +2954,7 @@ static void lm90_alert(struct i2c_client *client, e=
num i2c_alert_protocol type,
>  			schedule_delayed_work(&data->alert_work,
>  				max_t(int, HZ, msecs_to_jiffies(data->update_interval)));
>  		}
> +		hwmon_unlock(data->hwmon_dev);

While this isn't a regression introduced by this patch, could a similar race
condition cause a use-after-free during driver unbind?

In lm90_probe(), the hwmon device is registered via
devm_hwmon_device_register_with_info() before registering the teardown acti=
on
lm90_stop_work(). Since devres actions execute in LIFO order,
lm90_stop_work() runs while the hwmon device and sysfs attributes are still
accessible.

lm90_stop_work() sets data->shutdown =3D true and completes
cancel_delayed_work_sync() without acquiring hwmon_lock(data->hwmon_dev).

Could this race with a concurrent sysfs read operation in
lm90_update_alarms_locked()?

CPU1 (sysfs read)
hwmon_lock(data->hwmon_dev);
// checks data->shutdown, sees false
// preempted before scheduling work...

CPU2 (unbind)
lm90_stop_work()
    data->shutdown =3D true;
    cancel_delayed_work_sync(&data->alert_work);
    // proceeds to unregister device, blocking on CPU1's sysfs read

CPU1 (resumes)
schedule_delayed_work(&data->alert_work, ...);
hwmon_unlock(data->hwmon_dev);

After CPU1 releases the lock, CPU2 unblocks, finishes unregistering the
device, and devres frees the data structure. The incorrectly enqueued work
timer will then fire and access the freed memory.

Should lm90_stop_work() also acquire hwmon_lock() when setting
data->shutdown =3D true to serialize against concurrent sysfs operations?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514235626.1403=
695-1-linux@roeck-us.net?part=3D2
