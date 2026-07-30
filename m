Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB93A449B35;
	Thu, 30 Jul 2026 16:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785427415; cv=none; b=b1qKCHg8KnTuaYvHiZOdIk/cAwGjrTfrxosCds0Tiq/c+XP78VIRZk4aFtl9JKDDIo2k0744vt4nhfg4712a3otAg2CTb6+IPFBrLa22erZWwLFgpm2JhXVdNmf6ublbqSvrTzkp2e/ylLCcsBkcCOPZhvCymnKqUPT3MSWunnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785427415; c=relaxed/simple;
	bh=ceEe461xnkPr7KVo3Q/8xQYbBkQdxxrp7f8TIeSjez4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C3qOSIwagYruTRUvzldLF9JPtTgJX/A1isF0ImkGlEnzV+0uO6/2E36sI+44hxF2hemwWJwSanaCymumZEjV96Y8TCijRY+wxL2mz4grI4suANmgYQC18Uz0O7kMNDveFN/cMD8i55SB8UVPyoYoC5DCZXX2yNl0pPnEOquSr0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l6Ieme5t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l6Ieme5t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC5D1F00A3A;
	Thu, 30 Jul 2026 16:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785427413;
	bh=mT6jpMPoiUXp90l9UyfSzAJa+9jo1OUsisnALTf5JSI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l6Ieme5t1w+tpLcPWieC39dFmGAWTqAK0JMxQEv2lsD23MzcHO3VPn6OM8BgVrVdD
	 IbsqjJUETIkCdYPbagSOgnrtxBo0L8ZXabkK4bytaDSW/r5mXUQ8UJHL1lFUWkKXXa
	 LjDKsx1QBYcTuWU9hDrR7NgbU5G01EicRUBqvuqXYI8fUHdg3iBBR/dnbd+QB2hF2v
	 QNU0rOQ7GUcHU6CS8PKseM1N90LyNImWypAfq39rY/YPke56SBAHATcWqi+7VrDYPF
	 VmldkGYwOpceMFvyrVOzZO9YP/QEo+9BMFtA6o75Jf3S6AfvueLXC06SzXkrQ5TKpP
	 oyLLMaxjwB8yA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/4] hwmon: pmbus: add MPQ8646 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260730-mpq8646_v0-v7-3-e7c7ad768d5d@free.fr>
References: <20260730-mpq8646_v0-v7-0-e7c7ad768d5d@free.fr>
 <20260730-mpq8646_v0-v7-3-e7c7ad768d5d@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 16:03:33 +0000
Message-Id: <20260730160333.6FC5D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `alarm_poll_interval_ms` variable is accessed and modified conc=
urrently without any locking or atomic primitives, leading to a data race.
--

--- Patch [3]: [PATCH v7 3/4] hwmon: pmbus: add MPQ8646 driver ---
commit 013992e945508f7fa55c531019d24aec0d1d90cd
Author: Vincent Jardin <vjardin@free.fr>

hwmon: pmbus: add MPQ8646 driver

Add a new driver for the MPS MPQ8646 that is a PMBus device. Includes an
in-driver alarm-poll fallback for boards without SMBALERT.

> diff --git a/drivers/hwmon/pmbus/mpq8646.c b/drivers/hwmon/pmbus/mpq8646.c
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/mpq8646.c
[ ... ]
> +static int mpq8646_dbg_poll_interval_set(void *data, u64 val)
> +{
> +	struct mpq8646_priv *priv =3D data;
> +	bool was_off =3D !priv->alarm_poll_interval_ms;
> +
> +	priv->alarm_poll_interval_ms =3D (u32)val;

[Severity: Low]
Can this result in a data race when accessed concurrently by the polling wo=
rker?

If a user writes to the debugfs file while mpq8646_alarm_poll_work() is
running, the worker thread reads this same variable to determine the next
delay:

drivers/hwmon/pmbus/mpq8646.c:mpq8646_alarm_poll_work() {
    ...
    schedule_delayed_work(&priv->alarm_poll_work,
                          msecs_to_jiffies(priv->alarm_poll_interval_ms));
}

Should these accesses be protected with WRITE_ONCE() and READ_ONCE() to
prevent KCSAN warnings and ensure safe concurrent access?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-mpq8646_v0=
-v7-0-e7c7ad768d5d@free.fr?part=3D3
