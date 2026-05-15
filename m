Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47744C77CC
	for <linux-hwmon@vger.kernel.org>; Fri, 15 May 2026 16:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778863745; cv=none; b=mxiyeD3Z01O9U+uAOtTg/n6Q06Mn4t3k6zixofXxqiNdtsGFd4wrJKkyhw+dkTG3g6Bn8RBkA1NiNCXJSmFHy/3nYTGXqfMTdwmeIXd/5NTRw2jvstTYQv8Y6fGKxuedi7WOgvbpTteYUhY/1T6eM5DPUVgFLPAxLkypj3LeG3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778863745; c=relaxed/simple;
	bh=KI7lLxSUgnY3MUbKb98hQPulgspHYcli4AOWR1mObQw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OKnEMZZqQSsw68Js4bVIUloUexImqPtM2uBGpRbLJPYNJsnKaBW51mSpz0MDo68I3C4zbncmDFW7owso4SUDBcyEi48Rq3PXIQTDZ3yUyYrYwV7SQZz1FS3cDs0ckC89UTRznUs22izpWPvyisbZsW9e9H8cuZxzbKCsRm7iwxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FtPW3rpa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FtPW3rpa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 337DAC2BCC9;
	Fri, 15 May 2026 16:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778863745;
	bh=KI7lLxSUgnY3MUbKb98hQPulgspHYcli4AOWR1mObQw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=FtPW3rpapCPlcKcE0F1Riy5ucUNKkZ3ZnOa+EqyXHkRCyS+iYZ0QpKNXeYtqxDsFk
	 5V1XSKDVvixpVOoYAjI5y10yIJAbKB58uT0gE+BhR6dYX019RBOaqKxQ2uru4H8HYF
	 V/Rk3m7e2+tJVfVpNV00WqJGMrDoiBQjlhpYFXRjyYIn5HETvk3Ih4lzd6k7lyYJrL
	 vSmuDhrl3iAECHrf3wyhMUHELb2kITR7KbkT4uIRnL/Cevep/cX7IIzb3sbBmILPq3
	 jlpQ2ic88YEEVUNzrMQpHK8USnaabb3fWm4OW46hyk3xAeBwPrMGeQ7uwRYgZwsu7a
	 9Bq00TaMOKSyg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mailbox/pcc.c move shmem unmap to teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adam Young" <admiyo@os.amperecomputing.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260515161001.699470-1-admiyo@os.amperecomputing.com>
References: <20260515161001.699470-1-admiyo@os.amperecomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 16:49:04 +0000
Message-Id: <20260515164905.337DAC2BCC9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Double Unmap / iounmap(NULL) in pcc_mbox_request_channel error pat=
h.
- [High] TOCTOU Race Condition in pcc_mbox_request_channel leading to panic.
--

commit b19a3a11311850c88f208492b1f19cd0503eefd7
Author: Adam Young <admiyo@os.amperecomputing.com>

mailbox/pcc.c move shmem unmap to teardown

This commit moves the shared memory unmapping from pcc_mbox_free_channel()
to the pcc_shutdown() callback. This is intended to fix a race condition
where late interrupts could write to unmapped memory if the channel was
torn down while the IRQ was active.

> diff --git a/drivers/mailbox/pcc.c b/drivers/mailbox/pcc.c
> index 636879ae1db76..7fa2f6b5c492a 100644
> --- a/drivers/mailbox/pcc.c
> +++ b/drivers/mailbox/pcc.c
[ ... ]
> @@ -488,15 +478,22 @@ static int pcc_startup(struct mbox_chan *chan)
> =20
>  /**
>   * pcc_shutdown - Called from Mailbox Controller code. Used here
> - *		to free the interrupt.
> + *		to free the interrupt and unmap the shared memory.
>   * @chan: Pointer to Mailbox channel to shutdown.
>   */
>  static void pcc_shutdown(struct mbox_chan *chan)
>  {
>  	struct pcc_chan_info *pchan =3D chan->con_priv;
> +	struct pcc_mbox_chan *pcc_mbox_chan;
> =20
>  	if (pchan->plat_irq > 0)
>  		devm_free_irq(chan->mbox->dev, pchan->plat_irq, chan);
> +
> +	pcc_mbox_chan =3D &pchan->chan;
> +	if (pcc_mbox_chan->shmem) {
> +		iounmap(pcc_mbox_chan->shmem);
> +		pcc_mbox_chan->shmem =3D NULL;
> +	}
>  }

Will this cause a regression with a double unmap and an iounmap(NULL) call
during the error path of pcc_mbox_request_channel()?

If mbox_bind_client() fails during its startup phase, the mailbox core
automatically unwinds by calling mbox_free_channel(), which invokes this
updated pcc_shutdown() callback.=20

When control returns to pcc_mbox_request_channel(), it sees the failure
and executes its own error path:

drivers/mailbox/pcc.c:pcc_mbox_request_channel() {
...
	rc =3D mbox_bind_client(chan, cl);
	if (rc) {
		iounmap(pcc_mchan->shmem);
		pcc_mchan->shmem =3D NULL;
		return ERR_PTR(rc);
	}
...
}

Since the pointer was already set to NULL in pcc_shutdown(), won't this
unconditionally execute iounmap(NULL)? This violates kernel API contracts
and can trigger a stack trace on architectures like x86, or potentially
cause a kernel oops. Should an explicit check for pcc_mchan->shmem be added
to the error path?

Additionally, there appears to be a pre-existing regression in
pcc_mbox_request_channel() that wasn't introduced by this patch.

If two threads request the same subspace simultaneously, can both observe
chan->cl =3D=3D NULL without locks and proceed to map the shared memory?

drivers/mailbox/pcc.c:pcc_mbox_request_channel() {
...
	if (IS_ERR(chan) || chan->cl) {
		pr_err("Channel not found for idx: %d\n", subspace_id);
		return ERR_PTR(-EBUSY);
	}

	pcc_mchan =3D &pchan->chan;
	pcc_mchan->shmem =3D acpi_os_ioremap(pcc_mchan->shmem_base_addr,
					   pcc_mchan->shmem_size);
...

Both threads blindly overwrite the shared pcc_mchan->shmem pointer.
When both threads call mbox_bind_client(), one thread will successfully
bind and begin using the channel, while the second thread will fail
with -EBUSY.

The second thread will then enter its error path:

	rc =3D mbox_bind_client(chan, cl);
	if (rc) {
		iounmap(pcc_mchan->shmem);
		pcc_mchan->shmem =3D NULL;
		return ERR_PTR(rc);
	}

Doesn't this unmap the active memory mapping for the winning thread?
The next time the winning thread interacts with the hardware, won't it
dereference the NULL pointer or access unmapped memory, resulting in a
kernel panic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515161001.6994=
70-1-admiyo@os.amperecomputing.com?part=3D1
