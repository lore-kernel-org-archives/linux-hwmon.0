Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C873FE34D;
	Mon, 18 May 2026 12:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779106503; cv=none; b=jwk3qEuqOKV5wZfWs3Ur9JExBd3dxOqYBvyRE1N3FvxwveRyMEsQit/NqMc3t4Y53T+XQz/4uDS2Pc1r8UWJQ2qVUxDsT5o4y1R4LwBSvXXg8wve7xYsU3CwJKefmcKd2W5+MV6eoDIPrlrOZYD1L3rD8vu4XWz5u0dSj9blQZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779106503; c=relaxed/simple;
	bh=X3GigOM2u4KI51FwnzMMnvpD7nABhS3JcQX5+WHADl8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fJ87bBYD3vJ/JZSn0G0TuD61qaahKyJmm3EvnFGsYuvED7LMM/xsaN0/IvwTgZcNu62RNWKgd1enc+C+CBUaD19g6vOWci+dFtfuu6HIa46ft2xeXiHTBzpgI1RZO1/abModx6TT7VLTba1N3bcGfr20DGKM1UTdkdaHkcmxJog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VbgSEgM6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VbgSEgM6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A558C2BCC7;
	Mon, 18 May 2026 12:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779106503;
	bh=X3GigOM2u4KI51FwnzMMnvpD7nABhS3JcQX5+WHADl8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=VbgSEgM6SBT3UNvGn/kjE3YkFPFJh2/lET1sRBNQ07ah1EsnToU1YDDwbmdTm36DA
	 4/2jHm7SftznDfJXS2WHZ636UlJW3SMPUnYgOTIeE1/pJjrPH6yPlhIurntOlz3Q2g
	 chQMdHacyQGk0s0q/+7KrACfsoT8m+PlKQ5KsUOOgw8x2HIG4QPjo9ul3baifcN5B8
	 5B+XQirYAie642sCfJ5UcwAaRzuRZDX4GxNRvLTL7Z9QyJBnMlkzh23kab8OlwGkW2
	 krZzi4duZxLqxxpXpTNCZQ/HIasXBYr4yWXwJkI7dNzDQz7TahenwSKcEv8IwEgjBC
	 7+biN4/O3cX9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 5/6] hwmon: add NXP MC33978/MC34978 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleksij Rempel" <o.rempel@pengutronix.de>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260518100054.3552143-6-o.rempel@pengutronix.de>
References: <20260518100054.3552143-6-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 12:15:02 +0000
Message-Id: <20260518121503.4A558C2BCC7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Background polling worker unconditionally re-arms itself during te=
ardown, leading to a Use-After-Free.
--

commit 120174fd926c55b417dcd675badea0f431859a73
Author: Oleksij Rempel <o.rempel@pengutronix.de>

hwmon: add NXP MC33978/MC34978 driver

This commit adds hardware monitoring support for the NXP MC33978/MC34978
Multiple Switch Detection Interface (MSDI). It implements an edge-triggered
interrupt handler paired with a polling delayed workqueue to manage persist=
ent
hardware faults.

> diff --git a/drivers/hwmon/mc33978-hwmon.c b/drivers/hwmon/mc33978-hwmon.c
> new file mode 100644
> index 0000000000000..bd4dd25b3b20a
> --- /dev/null
> +++ b/drivers/hwmon/mc33978-hwmon.c
[ ... ]
> +static int mc33978_hwmon_update_faults(struct mc33978_hwmon_priv *priv)
> +{
[ ... ]
> +	ret =3D mc33978_hwmon_read_fault(priv, &faults);
> +	if (ret) {
> +		hwmon_unlock(priv->hwmon_dev);
> +		dev_err_ratelimited(priv->dev,
> +				    "failed to read fault register: %pe\n",
> +				    ERR_PTR(ret));
> +		/*
> +		 * Always retry on read failure. If we drop the heartbeat during
> +		 * the initial fault before caching it, the edge-triggered IRQ
> +		 * will never fire again and permanently stall fault monitoring.
> +		 */
> +		rearm =3D true;
> +		goto out_poll;
> +	}
[ ... ]
> +	rearm =3D !!alarm_faults;
> +
> +out_poll:
> +	/*
> +	 * If any alarms are currently active, the global FAULT_STAT bit remains
> +	 * asserted. The hardware will not generate a new rising edge interrupt
> +	 * if a secondary fault occurs, nor will it interrupt when faults clear.
> +	 * Schedule a poll to detect both clearing edges and secondary alarms.
> +	 */
> +	if (rearm)
> +		/* Use freezable polling to pause while the system is suspended. */
> +		mod_delayed_work(system_freezable_wq, &priv->poll_work,
> +				 msecs_to_jiffies(MC33978_FAULT_POLL_INTERVAL_MS));
> +
> +	return ret;
> +}
[ ... ]
> +static void mc33978_hwmon_action_cancel_work(void *data)
> +{
> +	struct mc33978_hwmon_priv *priv =3D data;
> +
> +	cancel_delayed_work_sync(&priv->poll_work);
> +}

During device removal, devres calls mc33978_hwmon_action_cancel_work(), whi=
ch
uses cancel_delayed_work_sync(). If the work is concurrently executing,
cancel_delayed_work_sync() will wait for the worker to finish.

Inside the running worker, mc33978_hwmon_update_faults() attempts a
regmap_read(). Since the device is being removed, this read is likely to fa=
il
or return persistent physical faults, setting rearm to true. The worker then
calls mod_delayed_work() and queues the underlying timer to fire again.

When cancel_delayed_work_sync() observes the completion of the execution, it
returns without canceling the newly re-armed timer. The teardown sequence t=
hen
continues, freeing the devm-allocated priv structure.

When the timer expires, could this cause a use-after-free when the kernel t=
imer
subsystem dereferences the freed priv->poll_work.timer memory? Should there=
 be
a state flag to prevent re-arming the work during teardown?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518100054.3552=
143-1-o.rempel@pengutronix.de?part=3D5
