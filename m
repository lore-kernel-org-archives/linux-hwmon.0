Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687192F531B
	for <linux-hwmon@vger.kernel.org>; Sun, 24 May 2026 22:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779662969; cv=none; b=avUYfjItdt9LwvJ7ZsE7r1INxPF//kr7fiFKj/I3541+fSBxHWXvbLMFYJE1OwPpNB2SNN/AGEdQWg9rkZNNfK7pMBM3G2bpPredU/MByIihKKQryfoLjyXN0S4wPrGtBWLJKECZKPzGv7G3Hx6FQ747cNtxnpibc5JjTGs1UNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779662969; c=relaxed/simple;
	bh=/v7MUx4hixFtwMLy9kC0sltePyhUrOMEKUfK8gjsP/E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iYI12a04uR6/+OmiugibUOGG0zL45zFXOzgi+3QtDXkmKuGY5taOLIrVgqEPAGsttN364mZTkYsu901ZuEb+LbtDRa/5cY803+i16WF/lBJIBZOTRspTid4F5y82x1hZVr+ji6LrogblRatCLh62GkYewt7atQA/vfe/XYE06fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lkXncYnC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lkXncYnC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA8CB1F000E9;
	Sun, 24 May 2026 22:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779662968;
	bh=wl5b1DJX0xKBWAH7MmPssbJX4h37QtqCPgM5K1uNSSc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lkXncYnCW4wMWOhGilbz2XoMhgBo1EeKyhWyug/+uuod+rSTg4DGqdXj4L1k2GhH+
	 QjWIwn7S/DWGnzALVJD9lcHfVFPeJ3PKZ8mZIyAJmMnRzXPs3hh/dzFZi6ZkIK1nQ6
	 xMr5l++QSJpCNRp9V4peqCXMuCTZUizLMMS69FxXZvdbfzp52Q8FwEfOWbrKL6Qikr
	 aQocYdQ4nT7wUkPJbN+7bSz1Lxn6DqPnYXwzT6LCw1nbpnLv7iwWRLbSN1nkicF7ZS
	 6cJNigzpKWAemT0R62QPupXQHlRe7L8MzUmzMVtVTfqp2SUr79l1JyL/rHZd6YsqOA
	 2/Uf/hWqS3siw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] scsi: mpt3sas: add hwmon support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis Sautier" <sautier.louis@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260524210545.1333637-3-sautier.louis@gmail.com>
References: <20260524210545.1333637-3-sautier.louis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 24 May 2026 22:49:27 +0000
Message-Id: <20260524224927.EA8CB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Local variables `mpi_reply` and `page` are allocated on the stack =
without initialization before being passed to `mpt3sas_config_get_iounit_pg=
7()`.

Pre-existing issues:
- [High] Data race on `ioc->config_cmds.status` between process context tim=
eout path and interrupt context reply handler, which can permanently break =
firmware config requests.
--

commit 0a8c15a13aecbcd080b4e88615e9f0ee4d3be366
Author: Louis Sautier <sautier.louis@gmail.com>

scsi: mpt3sas: add hwmon support

This patch adds hwmon support to expose the IOC and board temperature senso=
rs
of LSI/Broadcom SAS HBAs. It reads sensor data from MPI IO Unit Page 7 and
registers an hwmon device.

> diff --git a/drivers/scsi/mpt3sas/mpt3sas_hwmon.c b/drivers/scsi/mpt3sas/=
mpt3sas_hwmon.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/scsi/mpt3sas/mpt3sas_hwmon.c

[ ... ]

> +static int
> +_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> +	    u32 attr, int channel, long *val)
> +{
> +	struct mpt3sas_hwmon *h =3D dev_get_drvdata(dev);
> +	Mpi2ConfigReply_t mpi_reply;
> +	Mpi2IOUnitPage7_t page;

[Severity: High]
Could these uninitialized stack variables lead to memory corruption or
information leaks?

If the firmware completes the config request without a reply frame payload,
the underlying _config_request() returns 0 but skips populating mpi_reply.
The subsequent config read request relies on mpi_reply.Header.PageLength
and mpi_reply.ExtPageLength to compute the DMA memory allocation size.
Using uninitialized stack garbage for the size might lead to unpredictable
dma_alloc_coherent() behavior.

Additionally, if page is not fully initialized by the hardware response,
stack garbage might be returned to userspace via _hwmon_to_mdegc().
Should these structs be zero-initialized?

> +	int r;
> +
> +	if (type !=3D hwmon_temp || attr !=3D hwmon_temp_input)
> +		return -EOPNOTSUPP;
> +
> +	r =3D mpt3sas_config_get_iounit_pg7(h->ioc, &mpi_reply, &page);

[Severity: High]
This is a pre-existing issue, but does calling mpt3sas_config_get_iounit_pg=
7()
expose a data race with the config_cmds state machine?

In the underlying _config_request() code, there appears to be a data race on
ioc->config_cmds.status between the process context timeout path and the
interrupt context reply handler (mpt3sas_config_done).

If wait_for_completion_timeout() expires in _config_request(), it resets the
state machine:

    ioc->config_cmds.status =3D MPT3_CMD_NOT_USED;

If a late firmware reply concurrently triggers mpt3sas_config_done() in an
interrupt context, it uses non-atomic read-modify-write operations:

    ioc->config_cmds.status |=3D MPT3_CMD_COMPLETE;
    ioc->config_cmds.status &=3D ~MPT3_CMD_PENDING;

If _config_request() writes MPT3_CMD_NOT_USED during the interrupt's
read-modify-write cycle, the interrupt's write can clobber it, leaving the
status as MPT3_CMD_COMPLETE.

Future calls to _config_request() check if the status is MPT3_CMD_NOT_USED
under a mutex and would return -EAGAIN, permanently locking out all future
config requests for this adapter. Can this be protected with a spinlock or
by using atomic bitops?

> +	if (r)
> +		return r;

[ ... ]

> +int
> +mpt3sas_hwmon_register(struct MPT3SAS_ADAPTER *ioc)
> +{
> +	struct device *parent =3D &ioc->pdev->dev;
> +	struct mpt3sas_hwmon *h;
> +	struct device *hwdev;
> +	Mpi2ConfigReply_t mpi_reply;
> +	Mpi2IOUnitPage7_t page;

[Severity: High]
Similarly here, can the uninitialized mpi_reply and page variables cause
the same issues described above during the config page request?

> +	int r;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260524210545.1333=
637-1-sautier.louis@gmail.com?part=3D2
