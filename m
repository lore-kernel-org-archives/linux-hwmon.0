Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678760;
	b=Ta3QX+jVxjDWBcE3q51zXtaJPD9X5fg1Ab01TQvVyIbaz7NRXVze/TfsMooBu9N290jL
	 3Hu1bN18+11/HwPq9z7f5TYgcdoIT+m03E0wzjSjSe3vIxORBT1kKwMJ9dPzYDRwRTdQ8
	 uYh6JnXqcwleTGKmsvZi8kVBsBfAaJTrhr0fLZ/5P1oIxQ1z+tm5e1PLeUpb0cJqIPYHt
	 XSSM8/6DYXeeK1civVzAwtRRjQoH9dhe05djOii8todc14ji1KcCtyFMuQj2Eorn9EZuD
	 /YQ5pTLJI4pxEY29kKOCQ09Bpstz8/NCoROkfOAX0pMvC4ybWpz7QKgsdW2MZH9Ucig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678760;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yHJ+NrdqJ4gucJH2UDarjTHL6ZJZl0a3UGuFc84fU+U=;
	b=yX67/Msh0pG3QT5uu14NmCYMR87RHRMe/9dIelnP8nNtqvZ4xaGPwt4gkxSL0X0juKw6
	 EBjeBP9lDgFN4J2R27r4hYr5LrBkKTA1wFINJ/Im54JOy8z3Ohl0vVUe58JhGbqsWk6I6
	 L4aV2fXi5rd6ipTag1Y23j/eosj5QlT4rvjQN+fsIprv4LmPUQyccdMuaBbm4i1yQRcHE
	 a85nf6NZnrWjRaoBC1jCdlJTqS1RMfYptAOLiolBsd0697C02wuMQot0WGVXt7Br/r/xU
	 pVPGY2Yo/auF/XD1GuC+vw8vcy736KHt4THa0mau1pDoRn9LxulmX4Yqf038Q6+5/nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NlaNq5ex;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3191A606A323
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 17:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NlaNq5ex
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B135E1F000C5;
	Sat, 14 Nov 2026 17:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794678759;
	bh=yHJ+NrdqJ4gucJH2UDarjTHL6ZJZl0a3UGuFc84fU+U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NlaNq5exV2nOnIsUGMoaUiu6RYzEJ9SEuTZj0cpYcDdQw/8kkUG9DbqUam88PgxdQ
	 sVtBUKKp3AeA4YvKAh4fysH+U6eUGn26tXEc8uNRsdL9Y3c/KS3Eboz9bBmGJ/bsMR
	 a2HwzQ3bmtUuOZXhA0MfnEzRttb1dup5GAcMFgOnKvXYGMOdm32969RS0FSXk5FPqo
	 BUluj5/hUB0R+iFjNxT2CkjHvzCO0SgyOV4kPrE5VTcncrRpuxgG1exXbVyF7jmx9L
	 56HrEErjxi0k7QlP6IUHi7igc9+H2AJucQGTJw9t3RheG9yTnCAo6SSNgM4twO94Eu
	 qHxS9G0XeqopQ==
Message-ID: <sashiko-outbox-214857@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/7] hwmon: (marvel-env) Notify userspace of
 environmental events
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matt Turner" <mattst88@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261114-marvel-env-v1-7-890328e4b7e5@gmail.com>
References: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
 <20261114-marvel-env-v1-7-890328e4b7e5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 17:52:39 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] hwmon: marvel-env: incomplete alarm notifications in
  marvel_env_event_work()
- [Low] hwmon: marvel-env: private mutex used instead of hwmon_lock()
--

commit d84479ee83faacee9e88f233e9993cccd529e1af
Author: Matt Turner <mattst88@gmail.com>

hwmon: (marvel-env) Notify userspace of environmental events

This commit registers a machine check notifier to refresh all sensor nodes
from a workqueue and notify userspace of alarm status changes via
hwmon_notify_event().

> diff --git a/drivers/hwmon/marvel-env.c b/drivers/hwmon/marvel-env.c
> index cdc7e059e17bb..3dd2ea658fa3b 100644
> --- a/drivers/hwmon/marvel-env.c
> +++ b/drivers/hwmon/marvel-env.c

[ ... ]

> @@ -460,6 +469,72 @@ static const struct {
>  	{ hwmon_power, HWMON_P_ALARM | HWMON_P_LABEL },
>  };
> =20
> +static const u32 marvel_env_alarm[hwmon_max] =3D {
> +	[hwmon_temp] =3D hwmon_temp_max_alarm,
> +	[hwmon_fan] =3D hwmon_fan_min_alarm,
> +	[hwmon_in] =3D hwmon_in_alarm,
> +	[hwmon_power] =3D hwmon_power_alarm,
> +};
> +
> +/* Reread everything after a system event and report changed alarms. */
> +static void marvel_env_event_work(struct work_struct *work)
> +{
> +	struct marvel_env_data *data =3D
> +		container_of(work, struct marvel_env_data, work);
> +	unsigned int i, k;
> +
> +	mutex_lock(&data->lock);
> +	for (i =3D 0; i < data->nr_nodes; i++) {
> +		data->nodes[i].valid =3D false;
> +		marvel_env_refresh(data, &data->nodes[i]);
> +	}
> +
> +	for (k =3D 0; k < ARRAY_SIZE(marvel_env_hwmon); k++) {
> +		enum hwmon_sensor_types type =3D marvel_env_hwmon[k].type;
> +
> +		for (i =3D 0; i < data->nr_chans[type]; i++) {
> +			struct marvel_env_chan *c =3D &data->chans[type][i];
> +			u8 status =3D env_status(c->node,
> +					       c->pkt + env_status_off(type));
> +
> +			if (status =3D=3D c->last_status)
> +				continue;
> +			c->last_status =3D status;
> +			hwmon_notify_event(data->hwmon, type,
> +					   marvel_env_alarm[type], i);

[Severity: Medium]
Does marvel_env_event_work() miss notifications for hwmon_temp_crit_alarm
and hwmon_fan_fault while emitting notifications for attributes that did
not change?

In marvel_env_read(), temperature channels expose both
hwmon_temp_max_alarm (via env_status_alarm(), which is true for
ENV_WARNING and ENV_FAULT) and hwmon_temp_crit_alarm (true for ENV_FAULT),
and fan channels expose both hwmon_fan_min_alarm and hwmon_fan_fault:

drivers/hwmon/marvel-env.c:marvel_env_read() {
    ...
		case hwmon_temp_max_alarm:
			*val =3D env_status_alarm(status);
			break;
		case hwmon_temp_crit_alarm:
			*val =3D status =3D=3D ENV_FAULT;
			break;
    ...
		case hwmon_fan_min_alarm:
			*val =3D env_status_alarm(status);
			break;
		case hwmon_fan_fault:
			*val =3D status =3D=3D ENV_FAULT;
			break;
    ...
}

Because marvel_env_alarm[] only maps each sensor type to a single
attribute, a transition into or out of ENV_FAULT never calls
hwmon_notify_event() for hwmon_temp_crit_alarm or hwmon_fan_fault, so
userspace polling tempN_crit_alarm or fanN_fault is not woken.
Conversely, a transition between ENV_WARNING and ENV_FAULT leaves
env_status_alarm() at 1, yet notifies tempN_max_alarm, fanN_min_alarm,
inN_alarm, or powerN_alarm even though their values did not change.
Transitions involving ENV_UNKNOWN or ENV_NOT_PRESENT also trigger
notifications even when env_status_alarm() does not change or the channel
was hidden at probe time by marvel_env_is_visible().

> +		}
> +	}
> +	mutex_unlock(&data->lock);
> +}

[Severity: Low]
This isn't a bug, but the hwmon subsystem prefers hwmon_lock(data->hwmon)
and hwmon_unlock(data->hwmon) over a driver-private mutex when
synchronizing asynchronous work with hwmon callbacks, since the hwmon core
already holds the device lock across .read and .write ops.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-marvel-env=
-v1-0-890328e4b7e5@gmail.com?part=3D7
