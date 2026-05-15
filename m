Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC39237180
	for <linux-hwmon@vger.kernel.org>; Fri, 15 May 2026 00:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778805424; cv=none; b=DgYAgvcxaz5prjpXR73hBxPNdbRKehZiaGVJOuYi4Z5NQMRM1RVe4b6VtxJb1opT8e/J4MJkC1PmjMWRsEVc/7LkgWEpl70yccmFUqnpslMYX31gkZSY+asS+HtNN05HpT+Ex/1fEaWMXD0/5saSu9xQsG8V+bH/iFI3qnqietg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778805424; c=relaxed/simple;
	bh=A8kuj8uymlubhLZxfnTyV1GmDrdFcRY9U9JQCFx7zx8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CaHBvIks4UKU+cQiPLsBPrsqaeY/BtoALSNt+b5QWG/bczH7CUUqBRmaSIH4z1pWgG/9vu6rN0p64TlzgerbUYNb4lI83lTWRqPozbztXV7YcJ0cS+6G2qLiWxGM116ZjIaEM8937ic6uA52MZtQkSd8W25hpxvorJGRnqDA14I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UVqngT5d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UVqngT5d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CC5BC2BCB3;
	Fri, 15 May 2026 00:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778805424;
	bh=A8kuj8uymlubhLZxfnTyV1GmDrdFcRY9U9JQCFx7zx8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=UVqngT5d2WyHZWWuTzQgC0B0Gs+XQMfDtwU/RYvBzYPdYpTL4xg1sl9O5UL1KUmy5
	 d8x9kL8d+/B1uGKT6FSiJy4tb57wSWMJktMgCNZQrEefdDi8ZO1Vw+JeDGkw3CSeRB
	 gRmmNlpVT1BGOJkcsgkRVLRRr2qMXswyJ6Bxco0MeFNVbyydgE/sMslCBUPKfwDDVd
	 i7P7CVpGDitTAyKiu2io6S/t5t2MxySfRVlG/S/WK+8vOQGrv8R91qqQSTnlk/ntkp
	 YaOJF61pLuCLntYyJnpdogjHzZCMic+kBSdXdRdVmqvZd1eFKd+2jXvw/Vr9b7h1XW
	 2HPLURJbnZfWQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] hwmon: (lm90) Stop work before releasing hwmon
 device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260514235626.1403695-1-linux@roeck-us.net>
References: <20260514235626.1403695-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 00:37:03 +0000
Message-Id: <20260515003704.0CC5BC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Race condition in `lm90_stop_work()` allows canceled workers to be=
 re-armed via concurrent sysfs accesses, leading to a Use-After-Free.
--

commit e9b97015cb5267aa1cbf5c4dd89535d551b6b503
Author: Guenter Roeck <linux@roeck-us.net>
hwmon: (lm90) Stop work before releasing hwmon device

This commit fixes a use-after-free issue by canceling the workers after
registering the hwmon device and before registering the interrupt handler.
It introduces a shutdown flag to prevent workers from being re-armed during
device teardown.

> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
> index 3c10a5066b53d..08a568f7b56f9 100644
> --- a/drivers/hwmon/lm90.c
> +++ b/drivers/hwmon/lm90.c
[ ... ]
> @@ -2584,15 +2588,21 @@ static void lm90_restore_conf(void *_data)
>  	struct lm90_data *data =3D _data;
>  	struct i2c_client *client =3D data->client;
> =20
> -	cancel_delayed_work_sync(&data->alert_work);
> -	cancel_work_sync(&data->report_work);
> -
>  	/* Restore initial configuration */
>  	if (data->flags & LM90_HAVE_CONVRATE)
>  		lm90_write_convrate(data, data->convrate_orig);
>  	lm90_write_reg(client, LM90_REG_CONFIG1, data->config_orig);
>  }
> =20
> +static void lm90_stop_work(void *_data)
> +{
> +	struct lm90_data *data =3D _data;
> +
> +	data->shutdown =3D true;

Can this race with a concurrent sysfs read, allowing the workers to be
re-armed after they are canceled?

Since devres unwinds in reverse order, lm90_stop_work() executes before the
hwmon device is unregistered. This leaves the sysfs attributes fully
accessible.

If a sysfs read happens concurrently, the hwmon core will acquire the hwmon
lock, and the driver could call lm90_update_alarms_locked(). Because
lm90_stop_work() sets data->shutdown without acquiring hwmon_lock(), the
concurrent sysfs read might read data->shutdown as false before it is updat=
ed.

If the sysfs thread blocks on I2C reads, lm90_stop_work() could set
data->shutdown to true and call cancel_delayed_work_sync(). Since the work =
is
not yet queued, the cancellation returns immediately.

When the sysfs thread finishes its I2C transfers, it could call
schedule_work() or schedule_delayed_work(), successfully re-arming the work=
ers
after they were supposedly canceled.

As the devres unbind continues, it unregisters the hwmon device and frees t=
he
data structure. When the newly scheduled work executes, it would dereference
the freed memory, causing a use-after-free.

Should lm90_stop_work() hold hwmon_lock(data->hwmon_dev) while setting
data->shutdown to synchronize with sysfs reads, releasing it before calling
the sync cancellation functions to avoid deadlocks?

> +	cancel_delayed_work_sync(&data->alert_work);
> +	cancel_work_sync(&data->report_work);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514235626.1403=
695-1-linux@roeck-us.net?part=3D1
