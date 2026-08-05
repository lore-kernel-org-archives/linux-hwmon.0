Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189D03E00B8
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 07:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785915036; cv=none; b=T6qRftMhiZKblJ9kN2Bp20VQwx1Z7etWekGhBZkFlXQB5iKUV+fFDwZdgOxVCnk0WV5mryXCnP6EjaH2bCUM6eFpeWFe6plt86mUsJTSsfzNSLZFH1SvJBCRty+ti8JHsfzHCAxuFA+wehYh9P5X5yqyC72y0pQCT3WnJNjm3so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785915036; c=relaxed/simple;
	bh=e3Dkpj/YyIHvMmdmL8L/oXEgfNtSYBjYYsycCXpIfRM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T8CNgm2xs6xeosyhzvjoPMJZRyor+FQy4knbig9aljzEZ/qswQL+I8dvPstmtYhGdlZx2v/zwQCxC6XMAaYPmCBy9D+bbfqGiXzHCurFhbDn9cZMsNJ6cwr3cCuEjPNcXRJYBVuT6Jhw1oGYWD8sLh5cP9iGwChH5EPGGdNPb1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oJaEGWXO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oJaEGWXO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C71C01F000E9;
	Wed,  5 Aug 2026 07:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785915035;
	bh=hnDiEt/gzHGueoouRAj5WhCI5d6KoiP6fcMY0rO9MsM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oJaEGWXOoPuBmy0QIpiWY2Xl4BrMa28oWtjUGm+3H8MAdtXmDbWrQhuql8Krwg+vm
	 5VndADyjPPdq/Gr5DXtatgRZOau97/E7kWEBDj0kiHDvonVfxUZFqj92rPvn0OgOL/
	 5CbM9ZTaGnTWbDK7nQqKTR2Qb415v9bm1LX8bqAxiY+XssEAXEDfP2lkVCYpg6iRSx
	 BXvmlGym+9NuZfzf5iS+EAkKQjjVX7yE5+7tACIyZP7n5/fgm4mnKeP5PqOUyscQx/
	 oZ6OKY76eCjuEkfW2/Rnsqmhg2L+yCb6baJQay6RqzKqItblyVpPfgOQCIQztBtm0t
	 AVWPPi6rQTFag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: corsair-psu: fix possible out-of-bounds access
 on missing string termination
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wilken Gottwalt" <wilken.gottwalt@posteo.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <anLj9gPWRoRDbQBV@monster.localdomain>
References: <anLj9gPWRoRDbQBV@monster.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 07:30:33 +0000
Message-Id: <20260805073034.C71C01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Data race on shared `priv->cmd_buffer` and `priv->wait_completion`=
 due to missing driver-level locking for debugfs attributes.
--

--- Patch [1]: [PATCH] hwmon: corsair-psu: fix possible out-of-bounds acces=
s on missing string termination ---
commit cfc2e894e816ca1d7330d9074123e16e3ad443b7
Author: Wilken Gottwalt <wilken.gottwalt@posteo.net>

hwmon: corsair-psu: fix possible out-of-bounds access on missing string ter=
mination

This commit limits the debugfs seq_printf() calls for vendor and product
strings to a maximum length of REPLY_SIZE. This prevents potential
out-of-bounds accesses if the strings are not properly null-terminated by
the hardware.

> diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
> index ce958cdaef58a..3c01ae3fc4af2 100644
> --- a/drivers/hwmon/corsair-psu.c
> +++ b/drivers/hwmon/corsair-psu.c
> @@ -701,7 +701,7 @@ static int vendor_show(struct seq_file *seqf, void *u=
nused)
>  {
>  	struct corsairpsu_data *priv =3D seqf->private;
> =20
> -	seq_printf(seqf, "%s\n", priv->vendor);
> +	seq_printf(seqf, "%.*s\n", REPLY_SIZE, priv->vendor);
> =20
>  	return 0;
>  }
> @@ -711,7 +711,7 @@ static int product_show(struct seq_file *seqf, void *=
unused)
>  {
>  	struct corsairpsu_data *priv =3D seqf->private;
> =20
> -	seq_printf(seqf, "%s\n", priv->product);
> +	seq_printf(seqf, "%.*s\n", REPLY_SIZE, priv->product);
> =20
>  	return 0;
>  }

[Severity: High]
This is a pre-existing issue, but does the lack of driver-level locking
cause a data race on priv->cmd_buffer and priv->wait_completion when debugfs
attributes are read concurrently with sysfs attributes?

Looking at print_uptime(), it calls into corsairpsu_get_value() bypassing
the hwmon core sysfs locks:

drivers/hwmon/corsair-psu.c:print_uptime() {
    ...
	ret =3D corsairpsu_get_value(priv, cmd, 0, &val);
    ...
}

This proceeds into corsairpsu_usb_cmd() where the shared buffer and
completion are mutated without any synchronization lock:

drivers/hwmon/corsair-psu.c:corsairpsu_usb_cmd() {
    ...
	memset(priv->cmd_buffer, 0, CMD_BUFFER_SIZE);
	priv->cmd_buffer[0] =3D p0;
	priv->cmd_buffer[1] =3D p1;
	priv->cmd_buffer[2] =3D p2;

	reinit_completion(&priv->wait_completion);
    ...
}

The hwmon subsystem requires drivers to implement internal locking for
attributes registered outside the core, such as debugfs interfaces. Without
a transaction lock, interleaved USB commands can corrupt hardware state and
result in mismatched telemetry data.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/anLj9gPWRoRDbQBV@mo=
nster.localdomain?part=3D1
