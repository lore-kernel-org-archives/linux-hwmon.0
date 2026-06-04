Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085C12571B8
	for <linux-hwmon@vger.kernel.org>; Thu,  4 Jun 2026 20:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780606169; cv=none; b=kQAtW5ezvXqQ3ftXwkzUStHYdcjNpBEcMJ8+iEVf/fpPmuZnGL2iVDTINhndn02V+QmZhDgPSyWZVEbwwc+24jGXROttLbx1WWkisR8hq4E4eGNp7SQVa6QBbJMlRH9i4aUQDd9o+01yCo+55hsl9NR2yiuPl4ZO9i2cVP0P524=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780606169; c=relaxed/simple;
	bh=Z6caB6rSyLIxpIMdxR5ouNsEiirAcpwTRwWKzuR5rPQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nlaVOil//4U/mgKpZK7vOGLZ4r/gSV7XO5WiZkpAwMq1MX/rc7Ji6Ls6rfy1uCfaHDPDDthr4ilC0Qk8wQd8zSzwksazMj7F5XvvURpW7qSHwe9z4Sr7VSlYxqQ1WayyXdmjPMc4A0WeSEL7NYZQVLJoLT5mShW1RPn0clLeqNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GuHlBbt+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GuHlBbt+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C70841F00893;
	Thu,  4 Jun 2026 20:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780606167;
	bh=2Ip/TxAiYex3bIu6FRgtpdPAJli13jkZBsE4Cxg55/c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GuHlBbt+Xhe02g8eiSX0T7IxTar1IvmI8tubT7fQe2N0od/yM1a1B4xYEsSp8IRMt
	 3ME9u02n7sxlHgE+R+CM1jYpz/LPxik8Gh+M3Owy7PLjqu+Aj5k8Lf6kVAJD2QjcgA
	 KF1gZUy2xGtjUB3ahSXhWFBSTO5AJPEoo03Xv3QN7K3Zb8zUqMIJpz5eAkt/QQwmVv
	 StA1aDOHCuM+oSjJ/D4lFmS/HnwWrJTWVVXzPv7vb3mv0uxPD591+WK1xyFHgl7LZy
	 3MrN9+VT34DCWLrzVs4GmF1nPSEaQKVjEZ9//CzrEV44/O2lD02B9gH+etbp7f5Fdx
	 faHpR6SFKULJQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v01] mailbox/pcc.c:  add query channel function
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adam Young" <admiyo@os.amperecomputing.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260604203749.168752-1-admiyo@os.amperecomputing.com>
References: <20260604203749.168752-1-admiyo@os.amperecomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 20:49:27 +0000
Message-Id: <20260604204927.C70841F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Medium] Uninitialized `mchan` field in the user-provided output structur=
e.
- [Low] Dead code in `IS_ERR(chan)` check provides a false sense of securit=
y.
- [Low] Commented-out `#include` directives left in a public header file.

Pre-existing issues:
- [High] Use-After-Free (UAF) vulnerabilities due to missing driver teardow=
n on unbind.
--

commit a70542fb899e92a284eaf8ce05841d6088a0dece
Author: Adam Young <admiyo@os.amperecomputing.com>

mailbox/pcc.c: add query channel function

This commit adds a new function to allow drivers to query PCC channel
information before creating a channel. It also exposes the PCC channel type
to the client by adding it to the channel records.

> diff --git a/drivers/mailbox/pcc.c b/drivers/mailbox/pcc.c
> index 636879ae1db76..30577c6beefaa 100644
> --- a/drivers/mailbox/pcc.c
> +++ b/drivers/mailbox/pcc.c
[ ... ]
> +int
> +pcc_mbox_query_channel(struct pcc_mbox_chan *q_chan, int subspace_id)
> +{
> +	struct pcc_mbox_chan *pcc_mchan;
> +	struct pcc_chan_info *pchan;
> +	struct mbox_chan *chan;
> +
> +	if (subspace_id < 0 || subspace_id >=3D pcc_chan_count)
> +		return -ENOENT;
> +	pchan =3D chan_info + subspace_id;
> +	chan =3D pchan->chan.mchan;
> +	if (IS_ERR(chan)) {

[Severity: Low]
Is this check effective? Since chan is initialized in pcc_mbox_probe() as t=
he
address of an element within a devm_kcalloc allocated array
(&pcc_mbox_channels[i]), it seems it can never be an ERR_PTR. Also, IS_ERR()
would evaluate to false for a NULL pointer.

> +		pr_err("Channel not found for idx: %d\n", subspace_id);
> +		return -EBUSY;
> +	}
> +	pcc_mchan =3D &pchan->chan;
> +
> +	q_chan->shmem_base_addr =3D pcc_mchan->shmem_base_addr;
> +	q_chan->shmem =3D NULL;
> +	q_chan->shmem_size =3D pcc_mchan->shmem_size;
> +	q_chan->latency =3D pcc_mchan->latency;
> +	q_chan->max_access_rate =3D pcc_mchan->max_access_rate;
> +	q_chan->min_turnaround_time =3D pcc_mchan->min_turnaround_time;
> +	q_chan->type =3D pcc_mchan->type;

[Severity: Medium]
Does this code leave the mchan field uninitialized? If a caller allocates
q_chan on the stack without zero-initializing it, the mchan field will reta=
in
uninitialized stack memory.

If the caller subsequently checks mchan or mistakenly passes the structure =
to
pcc_mbox_free_channel(), could this bypass null-checks and cause arbitrary
pointer dereferences?

> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(pcc_mbox_query_channel);

[Severity: High]
This is a pre-existing issue, but could this lead to a use-after-free on
driver unbind?

The platform driver lacks a .remove callback and does not set
.suppress_bind_attrs =3D true:

static struct platform_driver pcc_mbox_driver =3D {
	.probe =3D pcc_mbox_probe,
	.driver =3D {
		.name =3D "PCCT",
	},
};

If the driver is unbound via sysfs, the driver core automatically frees all
devm_-managed memory, including pcc_mbox_ctrl, pcc_mbox_channels, and
chan_info.

However, pcc_mbox_probe() uses mbox_controller_register() instead of
devm_mbox_controller_register():

	rc =3D mbox_controller_register(pcc_mbox_ctrl);

This leaves the controller registered in the mailbox framework. Subsequent
attempts to request or query a channel would then access the freed
chan_info or pcc_mbox_ctrl.

[ ... ]
> diff --git a/include/acpi/pcc.h b/include/acpi/pcc.h
> index 840bfc95bae33..8d0fada6e31fb 100644
> --- a/include/acpi/pcc.h
> +++ b/include/acpi/pcc.h
> @@ -8,6 +8,10 @@
> =20
>  #include <linux/mailbox_controller.h>
>  #include <linux/mailbox_client.h>
> +#include <linux/acpi.h>
> +//#include <acpi/actypes.h>
> +//#include <acpi/actbl.h>
> +//#include <acpi/actbl2.h>

[Severity: Low]
Are these commented-out include directives intended to be kept? Leaving dead
code in a public header file can clutter the API.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604203749.1687=
52-1-admiyo@os.amperecomputing.com?part=3D1
