Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF79324B20
	for <linux-hwmon@vger.kernel.org>; Sat, 27 Jun 2026 16:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782579142; cv=none; b=kxLsD0uasbLqYDC/DUpafNs4pK6RFu+Z2AEy0aQ61VgTE8oYrD37HArSRAs1E99yeAphX1BtxLmauCUq4R707mX4G0yKIm0etzdEywbUIW/lL7MPyNz/jhcMuwHzbvZMNrSaNzhLWESqF0A3qK5zNKKxwXMtK9xieVsGDxCwTBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782579142; c=relaxed/simple;
	bh=XgXQ5Ljbbrvt5pZvgJzLZKshNYks+yU3mhmbuECBmNU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tWrpdtBWrRdmPpei9t7EtRXXfWdGrncfQ7Q0J8GsvyCayt9QZxXxutBOai/y8E9oQsIk7ZWFM7q7YJbbM0v8N6na+eYtQnWeh9SU6u8ZQSpwSNwg9NTjr+nr+3151NR7zFfDP+NOQNORJxW+5uaSxylvC2AThfOcKpez0ADob6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F3giIPk3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F3giIPk3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73FB31F00A3D;
	Sat, 27 Jun 2026 16:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782579141;
	bh=DtqwDyJQIwN8v46+7oycOxSQaZT5Klu7CdMteQzVNGg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F3giIPk3v6B6SMQuG6CpwTIS2ODNLiiLgW3bq6rtdp6BHGpWgGMTHrunxb9VkVZga
	 jQMS4OTltnttm13Qp1szETjHE3szRvZt1wzwZ8us1OOVnPJEcPF/mj3nFI+yJpH6VU
	 pO4Ed50C0lEvCf1k7FUb6f5QEM6Z/JSB12+jfM/sX88hSkC4z6Lc0bqmdhwSSyDkAq
	 ASUnxu46mbuNxlwMuIiHaYbyuZmgmTxv3S3j5diRLLp6ijMLjS9C8zvKT4PRt+CpM6
	 0VPMaw3DaNpMQW833G6lc6GzVN+hea/wx3HWQ3mLQHWzVgxFCe0i2VXh3xUuq0LLfr
	 aPJRdDIi6bhDw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/6] hwmon: xgene: Stop writing PCC shared memory
 signature
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sudeep Holla" <sudeep.holla@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260627-acpi_pcc_signature-v1-2-c1b7268d4fdc@kernel.org>
References: <20260627-acpi_pcc_signature-v1-0-c1b7268d4fdc@kernel.org>
 <20260627-acpi_pcc_signature-v1-2-c1b7268d4fdc@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 27 Jun 2026 16:52:21 +0000
Message-Id: <20260627165221.73FB31F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-After-Free and Race Condition in Module Teardown
- [High] Asynchronous Alarms Erroneously Intercepted as Synchronous Respons=
es
- [High] Endianness Corruption and Direct I/O Memory Dereference
- [High] Hardware State Machine Race via Improper PCC Memory Ordering
--

commit b2acc53f504dcc4234ad2b3494e6b67787941414
Author: Sudeep Holla <sudeep.holla@kernel.org>
Subject: hwmon: xgene: Stop writing PCC shared memory signature

This commit stops rewriting the generic PCC shared memory signature before =
each
command in xgene_hwmon_pcc_rd(). This ensures the platform-populated signat=
ure
is preserved as per ACPI 6.6 clarifications.

> diff --git a/drivers/hwmon/xgene-hwmon.c b/drivers/hwmon/xgene-hwmon.c
> index 11c5d80428cdf..38b140c23c88e 100644
> --- a/drivers/hwmon/xgene-hwmon.c
> +++ b/drivers/hwmon/xgene-hwmon.c
> @@ -133,10 +133,6 @@ static int xgene_hwmon_pcc_rd(struct xgene_hwmon_dev=
 *ctx, u32 *msg)
>  	init_completion(&ctx->rd_complete);
>  	ctx->resp_pending =3D true;
> =20
> -	/* Write signature for subspace */
> -	WRITE_ONCE(generic_comm_base->signature,
> -		   cpu_to_le32(PCC_SIGNATURE | ctx->mbox_idx));
> -
>  	/* Write to the shared command region */
>  	WRITE_ONCE(generic_comm_base->command,
>  		   cpu_to_le16(MSG_TYPE(msg[0]) | PCC_CMD_GENERATE_DB_INTR));

While reviewing this patch, I noticed a few pre-existing issues in this fil=
e.

drivers/hwmon/xgene-hwmon.c:xgene_hwmon_pcc_rd()

	/* Write to the shared command region */
	WRITE_ONCE(generic_comm_base->command,
		   cpu_to_le16(MSG_TYPE(msg[0]) | PCC_CMD_GENERATE_DB_INTR));

	/* Flip CMD COMPLETE bit */
	val =3D le16_to_cpu(READ_ONCE(generic_comm_base->status));
	val &=3D ~PCC_STATUS_CMD_COMPLETE;
	WRITE_ONCE(generic_comm_base->status, cpu_to_le16(val));

	/* Copy the message to the PCC comm space */
	for (i =3D 0; i < sizeof(struct slimpro_resp_msg) / 4; i++)
		WRITE_ONCE(ptr[i], cpu_to_le32(msg[i]));

[Severity: High]
This isn't a bug introduced by this patch, but does this ordering violate t=
he
ACPI PCC specification?

It appears we write the command register and clear the PCC_STATUS_CMD_COMPL=
ETE
bit before actually writing the payload to the PCC communication space in t=
he
loop.

Could this allow the platform management processor, if it's polling the sta=
tus
bit, to observe the command as ready and execute it using stale or partially
written payload data before the loop finishes?


drivers/hwmon/xgene-hwmon.c:xgene_hwmon_pcc_rx_cb()

	struct acpi_pcct_shared_memory __iomem *generic_comm_base =3D
							ctx->pcc_chan->shmem;
...
	msg =3D generic_comm_base + 1;
...
			ctx->sync_msg.msg =3D ((u32 *)msg)[0];
			ctx->sync_msg.param1 =3D ((u32 *)msg)[1];
			ctx->sync_msg.param2 =3D ((u32 *)msg)[2];

[Severity: High]
This is a pre-existing issue, but is it safe to directly cast and dereferen=
ce
the __iomem pointer generic_comm_base + 1 as a native u32 *?

The PCC shared memory specification relies on little-endian encoding. Since
X-Gene supports big-endian architectures, wouldn't directly dereferencing t=
he
native pointer cause the fields to be byte-swapped on big-endian systems,
potentially failing all MSG_TYPE checks and causing synchronous commands to
unconditionally timeout?


drivers/hwmon/xgene-hwmon.c:xgene_hwmon_rx_cb()

	/* Check for sync query */
	if (ctx->resp_pending &&
	    ((MSG_TYPE(((u32 *)msg)[0]) =3D=3D MSG_TYPE_ERR) ||
	     (MSG_TYPE(((u32 *)msg)[0]) =3D=3D MSG_TYPE_DBG &&
	      MSG_SUBTYPE(((u32 *)msg)[0]) =3D=3D DBG_SUBTYPE_SENSOR_READ) ||
	     (MSG_TYPE(((u32 *)msg)[0]) =3D=3D MSG_TYPE_PWRMGMT &&
	      MSG_SUBTYPE(((u32 *)msg)[0]) =3D=3D PWRMGMT_SUBTYPE_TPC &&
	      TPC_CMD(((u32 *)msg)[0]) =3D=3D TPC_ALARM))) {
		/* Check if platform completes command */
...
			ctx->sync_msg.msg =3D ((u32 *)msg)[0];
...
			/* Operation waiting for response */
			complete(&ctx->rd_complete);
			return;

[Severity: High]
This is a pre-existing issue, but does this conditional block improperly
intercept asynchronous alarms?

If a thermal alarm (TPC_ALARM) fires while a lengthy synchronous sensor read
is pending (ctx->resp_pending is true), it looks like the driver would match
the TPC_ALARM event, complete the read with the alarm data, and return earl=
y.

Wouldn't this cause the async alarm to be silently lost instead of being
routed to the async workqueue, while simultaneously causing the active sens=
or
reading to evaluate to corrupted values? This identical logic appears in
both xgene_hwmon_pcc_rx_cb() and xgene_hwmon_rx_cb().


drivers/hwmon/xgene-hwmon.c:xgene_hwmon_remove()

static void xgene_hwmon_remove(struct platform_device *pdev)
{
	struct xgene_hwmon_dev *ctx =3D platform_get_drvdata(pdev);

	cancel_work_sync(&ctx->workq);
	hwmon_device_unregister(ctx->hwmon_dev);
	kfifo_free(&ctx->async_msg_fifo);
	if (acpi_disabled)
		mbox_free_channel(ctx->mbox_chan);
	else
		pcc_mbox_free_channel(ctx->pcc_chan);
}

[Severity: High]
This is a pre-existing issue, but is there a race condition during module
teardown here?

We call kfifo_free(&ctx->async_msg_fifo) and cancel_work_sync(&ctx->workq)
before disabling the hardware mailbox interrupts with mbox_free_channel() or
pcc_mbox_free_channel().

If a late hardware interrupt arrives after the structures are freed but bef=
ore
the channel is disabled, wouldn't the RX callback (xgene_hwmon_rx_cb or
xgene_hwmon_pcc_rx_cb) enqueue data into the freed async_msg_fifo and
schedule work on the canceled workq, leading to a use-after-free and
potential crash?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260627-acpi_pcc_s=
ignature-v1-0-c1b7268d4fdc@kernel.org?part=3D2
