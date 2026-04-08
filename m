Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB87B364EB7
	for <linux-hwmon@vger.kernel.org>; Wed,  8 Apr 2026 06:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775629815; cv=none; b=rhh0fJ1wMN4t1JwJ/jVM/STPMBhMxAb7aqnNJm/H94C0hD/v1f+sLBGlvqGrTe0bmC2iik3hzoqL1DC8wqo/tb6JPXYdPgtqvGsvJKSRXDiAjzYNZfinqqdflzbLWXhjwx2nBCVgjcCGrqxr3hNNSZ9MVpZ4GGTKzyzcMHJRdBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775629815; c=relaxed/simple;
	bh=cFTF8Y+3FyEKgxN0vaR51PLjQngxuF4J0a/yQ20JV34=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ld7zAoWQnCJCULq8m4W/S0dK8Kzkpdd/gf6IjeM0xQ+RkNfJP6m0KVBooeBhgj6VXRzWHDoz71/9BRqLqMI+B2d7H/hKUHngPL2+ccIuumP8CwquW2EGnqOtYpYhb2j9OYBgxhOcB2kE5rs7PJKP13nyz33R68E56JmQfjIac4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lz3MAX8Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lz3MAX8Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEACFC19424;
	Wed,  8 Apr 2026 06:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775629814;
	bh=cFTF8Y+3FyEKgxN0vaR51PLjQngxuF4J0a/yQ20JV34=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Lz3MAX8QoynHrQM3364Pap6dP9Pb4CMSosGC3KdC5Id3IEWePRSVReoI3hHjWstMq
	 yrNbvA9XZMMiBIucffmWMEbXmM6Uc0XH1D1RBOwn+ZHSVjY60/b89u/icCGV9wgYLU
	 3hpk0S1HDYyup6G+Ggfw06KqB5fMlAnlLwjNluThkfEZbE6lpbhGU1LNWSymWFJUTi
	 61Xeu9Zyne/c7jvb+KhlqVc6OxBWT2Way5wMHWHvQRgSuRsMmZ5cq2E04hVetASIB7
	 KZoZ5s6JpKTgwaK0vXLD80EEEJZlIVBtl0RzLzimKgRFuz7uFSvx7c8/SQS8kyC01u
	 iZAz4M/ZgHapA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] mfd: Add Host Interface (HIF) support for
 Nuvoton NCT6694
Reply-To: sashiko@lists.linux.dev
To: Unknown <a0282524688@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260408053037.1867092-3-a0282524688@gmail.com>
References: <20260408053037.1867092-3-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Apr 2026 06:30:14 +0000
Message-Id: <20260408063014.AEACFC19424@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 8 potential issue(s):
- [High] devm_request_threaded_irq() with IRQF_SHARED and a NULL primary ha=
ndler unconditionally fails.
- [High] Writing a Linux virtual IRQ number to the SIO hardware register co=
rrupts interrupt routing.
- [High] Use-After-Free during USB disconnect due to incorrect teardown ord=
ering of the IRQ domain.
- [High] Direct DMA to stack variables causes kernel panics.
- [High] Missing endpoint count check allows out-of-bounds array access.
- [Medium] Unbalanced release_region() and unsynchronized hardware access d=
ue to ignored superio_enter() return value.
- [Medium] Devres teardown ordering creates a window for an unhandled inter=
rupt storm.
- [Medium] Unmapped hardware interrupts invoke the handler for Linux IRQ 0,=
 causing system instability.
--

commit 60375817e31ea4cd313c9492ef71c36123f2e1d1
Author: Ming Yu <a0282524688@gmail.com>

mfd: Add Host Interface (HIF) support for Nuvoton NCT6694

This commit adds Host Interface (HIF) via eSPI for the Nuvoton NCT6694,
introducing a new transport driver while reorganizing the core and USB
driver. It provides common read/write functions and shared memory
interrupt handling.

> diff --git a/drivers/mfd/nct6694-hif.c b/drivers/mfd/nct6694-hif.c
> new file mode 100644
> index 0000000000000..7560754e74810
> --- /dev/null
> +++ b/drivers/mfd/nct6694-hif.c
[ ... ]
> +static irqreturn_t nct6694_irq_handler(int irq, void *data)
> +{
[ ... ]
> +	while (intr_status) {
> +		int irq =3D __ffs(intr_status);
> +
> +		generic_handle_irq_safe(irq_find_mapping(nct6694->domain, irq));
> +		intr_status &=3D ~BIT(irq);
> +	}
> +
> +	return IRQ_HANDLED;
> +}

If the hardware sets an unexpected interrupt bit that hasn't been mapped,
irq_find_mapping() returns 0. Does passing 0 directly into
generic_handle_irq_safe() inadvertently invoke the handler for Linux IRQ 0,
causing system instability? This applies to both this function and the USB
interrupt handler.

[ ... ]
> +static int nct6694_irq_init(struct nct6694 *nct6694, int irq)
> +{
> +	struct nct6694_hif_data *hdata =3D nct6694->priv;
> +	struct nct6694_sio_data *sio_data =3D hdata->sio_data;
> +	unsigned char cofs_ctl2;
> +
> +	/* Set SIRQ number */
> +	superio_enter(sio_data);

What happens if the request_muxed_region() inside superio_enter() fails and
returns -EBUSY? If the return value is ignored, the driver might proceed
with unsynchronized hardware access and later call superio_exit(),
releasing an I/O region it never successfully acquired.

> +	superio_select(sio_data, SIO_REG_LD_SHM);
> +	if (!superio_inb(sio_data, SIO_REG_SHM_ENABLE)) {
> +		superio_exit(sio_data);
> +		return -EIO;
> +	}
> +	hdata->shm_base =3D superio_inw(sio_data, SIO_REG_SHM_BASE_ADDR);
> +
> +	superio_outb(sio_data, SIO_REG_SHM_IRQ_NR, irq);

Could writing the Linux virtual IRQ number here misconfigure the hardware?
The irq parameter comes from platform_get_irq(), which returns a
dynamically allocated virtual IRQ number rather than the physical ISA or
eSPI IRQ line expected by the Super I/O chip.

[ ... ]
> +static int nct6694_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	ret =3D nct6694_irq_init(data, irq);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D devm_add_action_or_reset(dev, nct6694_irq_release, data);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D devm_request_threaded_irq(dev, irq, NULL, nct6694_irq_handler,
> +					IRQF_ONESHOT | IRQF_SHARED,
> +					dev_name(dev), data);

The IRQ subsystem explicitly rejects shared interrupts without a primary
handler, as the default primary handler unconditionally masks the shared
line and starves other devices. Will this devm_request_threaded_irq() call
unconditionally return -EINVAL and fail to initialize?

Also, devres actions execute in reverse order during removal. Since the
hardware interrupt is enabled via nct6694_irq_init() before the IRQ handler
is requested, the handler will be freed before the hardware interrupt is
disabled during teardown. Could this create a window for an unhandled
interrupt storm?

> diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
> index 8ce2c4985aaba..903a0a7f0694c 100644
> --- a/drivers/mfd/nct6694.c
> +++ b/drivers/mfd/nct6694.c
[ ... ]
> +static int nct6694_usb_read_msg(struct nct6694 *nct6694,
> +				const struct nct6694_cmd_header *cmd_hd,
> +				void *buf)
> +{
[ ... ]
> +	/* Receive data packet from USB device */
> +	ret =3D usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), b=
uf,
> +			   le16_to_cpu(cmd_hd->len), &rx_len, NCT6694_URB_TIMEOUT);

Child drivers often pass pointers to local stack variables as the buf
argument. When passed directly to usb_bulk_msg(), does this cause a kernel
panic if CONFIG_VMAP_STACK is enabled, due to performing DMA on a stack
variable? Would it be safer to allocate a bounce buffer for the payload?
This applies to nct6694_usb_write_msg() as well.

[ ... ]
>  static int nct6694_usb_probe(struct usb_interface *iface,
>  			     const struct usb_device_id *id)
>  {
[ ... ]
> +	interface =3D iface->cur_altsetting;
> +
> +	int_endpoint =3D &interface->endpoint[0].desc;
> +	if (!usb_endpoint_is_int_in(int_endpoint)) {
> +		ret =3D -ENODEV;
> +		goto err_irq_domain;
> +	}

If a malformed or malicious USB device presents an interface with zero
endpoints, will this direct access to interface->endpoint[0] result in an
out-of-bounds read?

[ ... ]
>  static void nct6694_usb_disconnect(struct usb_interface *iface)
>  {
>  	struct nct6694 *nct6694 =3D usb_get_intfdata(iface);
> +	struct nct6694_usb_data *udata =3D nct6694->priv;
> =20
> -	usb_kill_urb(nct6694->int_in_urb);
> +	usb_kill_urb(udata->int_in_urb);
>  	irq_domain_remove(nct6694->domain);
> -	usb_free_urb(nct6694->int_in_urb);
> +	usb_free_urb(udata->int_in_urb);
>  }

The child MFD devices are registered using devm_mfd_add_devices(), which
means they will be unbound by devres after this disconnect function returns.
If irq_domain_remove() is called here, will the child drivers attempt to
access the already-freed IRQ domain during their devres cleanup routines,
leading to a use-after-free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260408053037.1867=
092-1-a0282524688@gmail.com?part=3D2
