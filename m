Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D64138B130
	for <linux-hwmon@vger.kernel.org>; Fri, 22 May 2026 21:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779485423; cv=none; b=WKVxcek7kXlb3vFpyX+CISmqHOUweA4bQQUXxI6PuOwikGBo7/IfJ8Yyi8YssrlDAqO6P4QSIT24fW9PuJAr0QnTGRGm8vk0wXuoq341uDdWHBmKSLi67VcnIcmkh8puv40F09PtyrKJrvJGsI6hVg/jIE9NqHVIp+w0lmcvpPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779485423; c=relaxed/simple;
	bh=a3M3dp5H2TrupoJNwz3FV9d/JTN4Vjdel7lPgLBTL+g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gpR7WapWaq4w8XZDapSukctUM2x43ABcFUtaXjGjdDHWPMIumCWHk4PErI57Nz/o2/tcaxsCiyOQCIX1+Cnzzae8r9ivV14VJnszbYqSrWyKC13rbhzYYtH31KkdwCe5CbDlUfXuTvmhNkXj1QimWgOcxByX82EiHtLHu1dHMmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hgTIVYGU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hgTIVYGU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23D3B1F000E9;
	Fri, 22 May 2026 21:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779485422;
	bh=jORBXugX4WV7shsTjM2eQ0mYWlQ3R0Iw79DsOwVoaSc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hgTIVYGUJRkkrzCi1VEtj8edpga63Y7mqF6VNxj+/vR0TurpOsO8I1W9KhPkQtUcg
	 leWje3yvr8bX/2pLMluySnASZwCDO0aclr+lhmKF5Ji12hVgO+Ftr8437+Ur/CFEju
	 z3rpRUuk+x/6onZ9voebOtSRhSx6avhb6VOwC1zYxZOdtPTXnycP83FbIDmVSWyT2H
	 Og6QZIdzgiUwERtOQjXT4Qt2zZ90lvqVn2GfyWRY9Xde8Koc7rHxwHlJqoox6g8me4
	 5J9FHX+H7aLvsl9e+gELjH+kYFBV9EOhW0TeC5AAZn1cbp6poO0KCPl7VR8DgJJrSE
	 9A3ttSC+9k7Vw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v02] mailbox/pcc.c shmem map/unmap in callbacks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adam Young" <admiyo@os.amperecomputing.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260522205220.237355-1-admiyo@os.amperecomputing.com>
References: <20260522205220.237355-1-admiyo@os.amperecomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 21:30:21 +0000
Message-Id: <20260522213022.23D3B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unlocked read-modify-write on potentially shared PCC registers (e.=
g., doorbell or command update).
--

commit b67c701fcb8eb6ced91271505440c781fa1718bc
Author: Adam Young <admiyo@os.amperecomputing.com>
Subject: mailbox/pcc.c shmem map/unmap in callbacks

This commit moves the shared memory mapping and unmapping out of the
request and free channel functions and into the startup and shutdown
callbacks. This aims to prevent race conditions where a late interrupt
might write to unmapped memory or a channel is requested after its shmem
was torn down.

> diff --git a/drivers/mailbox/pcc.c b/drivers/mailbox/pcc.c
> index 636879ae1db76..c5873f9f2b919 100644
> --- a/drivers/mailbox/pcc.c
> +++ b/drivers/mailbox/pcc.c
[ ... ]
> @@ -462,9 +441,15 @@ static bool pcc_last_tx_done(struct mbox_chan *chan)
>  static int pcc_startup(struct mbox_chan *chan)
>  {
>  	struct pcc_chan_info *pchan =3D chan->con_priv;
> +	struct pcc_mbox_chan *pcc_mchan;
>  	unsigned long irqflags;
>  	int rc;
> =20
> +	pcc_mchan =3D &pchan->chan;
> +	pcc_mchan->shmem =3D acpi_os_ioremap(pcc_mchan->shmem_base_addr,
> +					   pcc_mchan->shmem_size);
> +	if (pcc_mchan->shmem  =3D=3D NULL)
> +		return -ENOMEM;
>  	/*
>  	 * Clear and acknowledge any pending interrupts on responder channel
>  	 * before enabling the interrupt
>  	 */
>  	pcc_chan_acknowledge(pchan);

[Severity: High]
This is a pre-existing issue, but I noticed a potential race condition when
calling pcc_chan_acknowledge() here.

The ACPI PCCT specification allows multiple subspaces to share the same
doorbell or command update register. When pcc_chan_acknowledge() calls
pcc_chan_reg_read_modify_write(), it performs a non-atomic read, modify, and
write sequence on these mapped registers:

drivers/mailbox/pcc.c:pcc_chan_acknowledge() {
    ...
    pcc_chan_reg_read_modify_write(&pchan->cmd_update);
    ...
    if (ioread32(&pcc_hdr->flags) & PCC_CMD_COMPLETION_NOTIFY)
        pcc_chan_reg_read_modify_write(&pchan->db);
}

Since the mailbox framework only serializes operations on a per-channel
basis using the channel lock, could concurrent calls to pcc_send_data() or
pcc_chan_acknowledge() for different channels that share the same register
race with each other?

If this occurs, could it clobber the register bits belonging to other
channels, resulting in lost doorbell rings or lost ACKs?

> =20
>  	if (pchan->plat_irq > 0) {
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522205220.2373=
55-1-admiyo@os.amperecomputing.com?part=3D1
