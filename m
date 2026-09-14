Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E883D9DB1
	for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 11:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386902; cv=none; b=AMZsSE/WcW/v2PtfAJiuQEx0uwdU8QbvbUIg+xAkez38bxyeMU5No9uH6HC/e4hItxFtuUCN1FK4baKOpHIkVqptpVkDdw2qhrm2OvsPUPBwPn58s+F8uOjkUX/uPv6I+qwaUYm8qE5CMOwMUZ91E0LufcESp3lwoFynlvZKpV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386902; c=relaxed/simple;
	bh=ld9A26SqQN1lVgq8lzuhQCSXMCTt+XvGo1LR9CKMKkM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ctpXcPXgt5ISbL5TIke/ax9LGvX44R7Khy6SUAmQ+3leGbjzg+i0zFp0Ndo1bFVBFYkMgHYMA6ReYSaAOacWl8RLebh+UG8pbPuhcQXDPlsswftbRZOKNWni3TxpziWKkZSIZGKTRP6Z+1+Yf2AvVa1JR1f3tkOlD+5FYMKxGQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ivRRYdKg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ivRRYdKg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AC9C1F0089C;
	Mon, 14 Sep 2026 11:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789386900;
	bh=imPMqOZOw7gRpXZn9Jr3Ro3jOMD4qxo2hGxpY7Zp3Pw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ivRRYdKgKyvqL1FIZhyx+EpdMv794Hbscrw07ZqlzFV9T+15de5aieWIwwNTUop+d
	 F53sR1PXB73Jq4vPUoPvEqX13r/qWJhDfLN/o108OHr5jaVUPAA3jHeF1w/8wjF8Rw
	 ficHt4N+zunf2dzSCl1roSf4y038qw+l5wZHLGUZwaSxeYIGXIe56hd5Icsyh9P0Rg
	 KAAhs+SbqXTLnNDVMeBgp6CyJ6x50XuV4tnYkNQYQ7T5OQ90tFUYmQKYa1V6x1sGGk
	 2x/LIB5OT2OE6oxBDFXVWMBUSwrN2Kp+8Sh95WajnMzMJdqcizzRyGc0vFNq9ZAkje
	 Xjt7ZZ4RKBaVw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] hwmon: (gpio-fan) fix pm_runtime imbalance for
 alarm-only fans
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cong Nguyen" <congnt264@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260914113856.1987128-1-congnt264@gmail.com>
References: <20260914113856.1987128-1-congnt264@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 11:54:59 +0000
Message-Id: <20260914115500.6AC9C1F0089C@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] If pm_runtime_resume_and_get() fails during probe, the devres clea=
nup path drops a PM reference that was never acquired, causing a runtime PM=
 usage counter underflow. The patch attempts to fix early probe underflows =
by adding a `pm_enabled` guard, but prematurely sets it to `true` before su=
ccessfully acquiring the reference.

Pre-existing issues:
- [High] Sysfs attributes are exposed to userspace before runtime PM is ini=
tialized, allowing concurrent writes to interact with uninitialized PM stat=
e and corrupt the PM usage counter.
- [High] Treating non-fatal errors from `pm_runtime_put_sync()` (like `-EAG=
AIN`) as fatal errors leaves the driver's software state permanently desync=
hronized from the hardware state, leading to subsequent PM usage counter un=
derflows.
--

commit 394e1be2ff739d7471e6b17d6005457a66be35ae
Author: Cong Nguyen <congnt264@gmail.com>

hwmon: (gpio-fan) fix pm_runtime imbalance for alarm-only fans

This commit registers the PM runtime disable cleanup before
pm_runtime_enable() is called to fix an imbalance for alarm-only fans.
It also adds a pm_enabled guard and a mutex to protect the enable block.

Link: https://lore.kernel.org/r/20260901111903.660681-1-congnt264@gmail.com

> diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
> --- a/drivers/hwmon/gpio-fan.c
> +++ b/drivers/hwmon/gpio-fan.c
> @@ -528,10 +529,21 @@ static void gpio_fan_stop(void *data)
>  	struct gpio_fan_data *fan_data =3D data;
> =20
>  	mutex_lock(&fan_data->lock);
> -	set_fan_speed(data, 0);
> +	/* set_fan_speed(0) drops a PM ref; only valid once PM is enabled. */
> +	if (fan_data->pm_enabled)
> +		set_fan_speed(data, 0);

[Severity: High]
This isn't a bug introduced by this patch, but non-fatal errors from
pm_runtime_put_sync() appear to be treated as fatal in set_fan_speed().

When set_fan_speed() turns off the fan, it physically stops the fan and then
calls pm_runtime_put_sync():

set_fan_speed()
   ...
   if (fan_data->speed_index > 0 && speed_index =3D=3D 0) {
       ret =3D pm_runtime_put_sync(fan_data->dev);
       if (ret < 0 && ret !=3D -ENOSYS)
           return ret;
   }

If the PM core returns -EAGAIN, set_fan_speed() returns immediately without
updating fan_data->speed_index =3D 0.

The hardware is now OFF, but the software state remains ON.

A subsequent sysfs write to turn the fan off will cause set_fan_speed() to
call pm_runtime_put_sync() a second time, dropping a PM reference it no
longer holds.

Does set_fan_speed() need to update the software state even if
pm_runtime_put_sync() returns a non-fatal error like -EAGAIN?

> +	else
> +		__set_fan_ctrl(fan_data, fan_data->speed[0].ctrl_val);
>  	mutex_unlock(&fan_data->lock);
> +}

[ ... ]

> @@ -586,16 +603,22 @@ static int gpio_fan_probe(struct platform_device *p=
dev)
>  			return err;
>  	}
> =20
> +	/* Lock so a racing sysfs write can't double-take a PM ref here. */
> +	mutex_lock(&fan_data->lock);

[Severity: High]
This isn't a bug introduced by this patch, but this lock doesn't fully close
the race window.

Sysfs attributes are exposed to userspace before runtime PM is initialized:

gpio_fan_probe()
   ...
   fan_data->hwmon_dev =3D devm_hwmon_device_register_with_groups(...);

A userspace process can immediately write to the pwm1 attribute, triggering
pwm1_store() and set_fan_speed().

If the user writes 0 during this window, set_fan_speed() calls
pm_runtime_put_sync() while PM is disabled.

This unconditionally decrements the usage counter and causes an underflow.

Does this lock need to be taken earlier, or should PM be initialized before
hwmon registration?

>  	pm_runtime_set_suspended(&pdev->dev);
>  	pm_runtime_enable(&pdev->dev);
> +	fan_data->pm_enabled =3D true;
>  	/* If current GPIO state is active, mark RPM as active as well */
>  	if (fan_data->speed_index > 0) {
>  		int ret;
> =20
>  		ret =3D pm_runtime_resume_and_get(&pdev->dev);
> -		if (ret)
> +		if (ret) {
> +			mutex_unlock(&fan_data->lock);
>  			return ret;
> +		}

[Severity: High]
If pm_runtime_resume_and_get() fails here, does it lead to a runtime PM
usage counter underflow?

Because fan_data->pm_enabled is set to true before the reference is
successfully acquired, a failure from pm_runtime_resume_and_get()
(e.g. regulator failure) will return an error, triggering the devres
LIFO teardown.

The teardown calls gpio_fan_stop(), which checks pm_enabled and then calls
set_fan_speed(data, 0).

Since the initial state was active, this calls pm_runtime_put_sync(),
dropping a PM reference the driver never successfully acquired.

Should pm_enabled only be set to true after the initial PM reference is
successfully acquired?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914113856.1987=
128-1-congnt264@gmail.com?part=3D1
