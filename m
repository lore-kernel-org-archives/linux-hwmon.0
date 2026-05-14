Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E2E2FD69A
	for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 01:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778720529; cv=none; b=fJ/G5FWdLr1y6dGmLU24Ttacxs1biYAeKFy8RspLQ776iooAA9ykBkg2ruBwNeymN2hR6uCtF67QWosuDhK8qdy7Uh9x/4rnKMwwX8JqZA7dyrgH4xlIwZRi8sO6pH0OD2rl0KADhaGhsSOemrOdTzEbwxQIeHuJiMqSF1qYTq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778720529; c=relaxed/simple;
	bh=DnH3fhyJCIN4Gbts01zgYwXmpoa71WrYFFa5xC9vJ4o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cxkFmKt7pmy9MnjGwkFZnq8i2/z3z8s/wcEd67RFKmzkvfODpG6DUVQsaCu88YOtHwWoo7nkQ4r+G+bZKa/0ERXXUfVQjiNlAlO0hj+UFm193CwmiVkgDi8dPP09WoL8Bt7ZgTQDj/pgaDyGmx6L3d5LXwjifQKvZ6MktaH5DLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g+u9ncLh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g+u9ncLh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C3ABC19425;
	Thu, 14 May 2026 01:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778720529;
	bh=DnH3fhyJCIN4Gbts01zgYwXmpoa71WrYFFa5xC9vJ4o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=g+u9ncLhFl07JKCWYXf2tU32CRwJcxW7eqYW5ln27p6CqVBZ32+ZgdTPfppey5F7Q
	 IZ5aW0cSP3mL2Nc77ODDKGYEzs2jFG6tf1Ji+xfyuF5LCDnlpiCntUi4O80FBM9Lwv
	 7mxZPrD61FC6gMntlf9Gg0lVgie20Viuv2Goyus8VybwqtI9HL93Mr+4tZuxqQ7URa
	 /lNKRf4Y/ph7O0tHx9hQLSZXfhYVIojICsGca5VHQ+Vf19yspdJsVZmzDFhiujjMlR
	 nm/mR2ZfjaLCiQ1VT7CR6CtQGVRzRQSQipJOAzQ+CuyLrCb94S8Xd5iFIgUlQrjqfd
	 4dPKYShag8FrA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] scsi: mpt3sas: add hwmon support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis Sautier" <sautier.louis@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260512214703.655633-3-sautier.louis@gmail.com>
References: <20260512214703.655633-3-sautier.louis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 01:02:07 +0000
Message-Id: <20260514010209.5C3ABC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unprivileged user-space processes can flood the HBA firmware with =
synchronous configuration requests, contending a shared mutex and causing a=
 Denial of Service (DoS).
--

commit 12785f6156b64bc1ece9061e087614ba8f75d567
Author: Louis Sautier <sautier.louis@gmail.com>

scsi: mpt3sas: add hwmon support

This commit adds hardware monitoring support for LSI / Broadcom SAS HBAs,
exposing IOC and board temperature sensors. The readings are obtained by
querying MPI IO Unit Page 7 and exposed to userspace through standard
hwmon sysfs files.

> diff --git a/drivers/scsi/mpt3sas/mpt3sas_hwmon.c b/drivers/scsi/mpt3sas/=
mpt3sas_hwmon.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/scsi/mpt3sas/mpt3sas_hwmon.c
[ ... ]
> +static umode_t
> +_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
> +		  u32 attr, int channel)
> +{
[ ... ]
> +	if (channel =3D=3D 0 && h->ioc_present)
> +		return 0444;
> +	if (channel =3D=3D 1 && h->board_present)
> +		return 0444;
> +	return 0;
> +}
[ ... ]
> +static int
> +_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> +	    u32 attr, int channel, long *val)
> +{
> +	struct mpt3sas_hwmon *h =3D dev_get_drvdata(dev);
> +	Mpi2ConfigReply_t mpi_reply;
> +	Mpi2IOUnitPage7_t page;
> +	int r;
> +
> +	if (type !=3D hwmon_temp || attr !=3D hwmon_temp_input)
> +		return -EOPNOTSUPP;
> +
> +	r =3D mpt3sas_config_get_iounit_pg7(h->ioc, &mpi_reply, &page);

Could exposing this read to unprivileged users lead to excessive firmware
requests and mutex contention?

Since the sysfs files are world-readable, any local user can read them in a
tight loop. Every read directly calls mpt3sas_config_get_iounit_pg7(), which
issues synchronous requests to the firmware over the PCIe bus and acquires
the shared config_cmds.mutex:

_hwmon_read() ->
    mpt3sas_config_get_iounit_pg7() ->
        _config_request() ->
            mutex_lock(&ioc->config_cmds.mutex)

Does this allow an unprivileged user to starve other storage subsystem
components that rely on this mutex for administrative tasks or device
discovery?

Could we implement a caching mechanism (for example, caching the readings
for a short period using jiffies) to rate-limit these firmware requests?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512214703.6556=
33-1-sautier.louis@gmail.com?part=3D2
