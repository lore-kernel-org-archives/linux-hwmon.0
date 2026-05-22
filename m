Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF1639DBDD;
	Fri, 22 May 2026 05:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779429326; cv=none; b=WNs/4FDTJBftPhqetR/MFeMJNI8DOtPTfUF081TDYoXQ4A5KJhay9/hUMDYwJzDpIU+6Viaj5Xu74a2TL2x+eNXgDGI7JZCcRD2h4MDAncyhAfHteZ6464A98thLqxRxqIGN1cwdWJ9/kjUSFkZRfuSs1/2KibCfR+z00695/0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779429326; c=relaxed/simple;
	bh=9S3Am5zlSDxIPy9JoMBjGoTMZN3NGySSG/6keJHKyOI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t5THQCev8AOmiVQ2tYgHUBODZvwwL8fLVH4y+lLxwly/G1shXr8PpWfUpJmlpB2H6/zTAsTPZl2XzIlKT0/V+b7b8xDZT6AqkIdrFfdYIVWguYBNYFZ8IRvvKgSCPEq5HLtf0ieXLMJ7MZYiiPUVKtHB9/v0EJWstRtYUHSJfYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CTPJf1Se; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CTPJf1Se"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C86311F000E9;
	Fri, 22 May 2026 05:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779429325;
	bh=Rm6dtuuYj6/GdbVvh2/gOXnU8R+0AFSWCl9ecrBIjZM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CTPJf1Se6LmHHAcb75Ne7HSbCcFey85v/NtDoibYQIPUz9YTSJg49gj3JO5H5j27D
	 f24mKEGLAsZKkbHrL9Uy+yQb5Wyf8LpVqaxmYAx3MZcflL/l2u21r5RF760rJB2OQt
	 89tkomqEQbQ0C9ysQ2le68DvOkX8kvwxM4etONNPHKlaewZsaRXIyUsWMTHDzBIdLf
	 eTY86IDwUHcdQBfAjTGRFhq60oTHg13Ut9XEwmDFC57tIb9VNOMJPjMe5gT9GPMwZ7
	 iS4PHSoISr6KscNCVhpArFyBiYL2H0zKXxgUz4lOatsVPk/z7gLDD/ZpjEMdNvC1ju
	 a2HSQAR+QMzag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 3/6] pinctrl: core: Make pin group callbacks
 optional for pin-only drivers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleksij Rempel" <o.rempel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260522044855.1772639-4-o.rempel@pengutronix.de>
References: <20260522044855.1772639-4-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 05:55:24 +0000
Message-Id: <20260522055524.C86311F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing mutex lock in pinconf_groups_show() leading to potential U=
se-After-Free during debugfs access.
--

commit 3be3569fd20f9c647f76233cee1c7285d9ad8584
Author: Oleksij Rempel <o.rempel@pengutronix.de>

pinctrl: core: Make pin group callbacks optional for pin-only drivers

This patch relaxes the requirement for pin-only drivers to implement
.get_groups_count and .get_group_name callbacks by making them optional
when no muxing or group pin configuration support is provided. The core
and debugfs helpers are updated to check for these callbacks before
invoking them.

> diff --git a/drivers/pinctrl/pinconf.c b/drivers/pinctrl/pinconf.c
> index dca963633b5d1..81686844dfa5f 100644
> --- a/drivers/pinctrl/pinconf.c
> +++ b/drivers/pinctrl/pinconf.c

[ ... ]

> @@ -348,8 +348,13 @@ static int pinconf_groups_show(struct seq_file *s, v=
oid *what)
>  {
>  	struct pinctrl_dev *pctldev =3D s->private;
>  	const struct pinctrl_ops *pctlops =3D pctldev->desc->pctlops;
> -	unsigned int ngroups =3D pctlops->get_groups_count(pctldev);
>  	unsigned int selector =3D 0;
> +	unsigned int ngroups;
> +
> +	if (!pctlops->get_groups_count || !pctlops->get_group_name)
> +		return 0;
> +
> +	ngroups =3D pctlops->get_groups_count(pctldev);

[Severity: High]
This is a pre-existing issue, but does pinconf_groups_show() need to hold
pctldev->mutex while iterating through pin groups?

Drivers such as pinctrl-lpass-lpi dynamically remove groups via
pinctrl_generic_remove_group() during device unbind (e.g., in
lpi_pinctrl_remove()). This deletes the radix tree node and frees the
group memory via devm_kfree(). Because the controller is registered
with devm_pinctrl_register(), the debugfs entries remain fully accessible
during the driver's remove() callback until devres cleanup runs later.

Could a concurrent read of the pinconf-groups debugfs file race with
this group removal, causing pinctrl_generic_get_group_name() to perform
an unsafe radix_tree_lookup() and dereference the freed group struct?

Also, since pinconf_groups_show() eventually calls pin_config_group_get()
which acquires pctldev->mutex, would wrapping the loop in
mutex_lock(&pctldev->mutex) cause a self-deadlock, thus requiring
unlocked internal accessors to fix properly?

> =20
>  	seq_puts(s, "Pin config settings per pin group\n");
>  	seq_puts(s, "Format: group (name): configs\n");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522044855.1772=
639-1-o.rempel@pengutronix.de?part=3D3
