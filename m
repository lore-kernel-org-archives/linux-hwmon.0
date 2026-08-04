Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E768B42A170
	for <linux-hwmon@vger.kernel.org>; Tue,  4 Aug 2026 08:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785830404; cv=none; b=YJkGUUgxmmeNRow2p8j7WcBT9kI17TjqqZIaKYI3oLOjdIlxT2C+zlBac1cDdigl99EIBsS1W1WSyiYptxQ/vGCKcxamgC/fqmefFV5dTl79a0Qli2PBiOd8+XGKvM2L04rGc2v6oqjR8LXaydXV7tDKB5ipd5Ba+tgFcbU66q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785830404; c=relaxed/simple;
	bh=zNSDyELmF04J6wF8CJ4XujBlic3aK9PAdDjPVBT/Pns=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OQ8pt7xtFPhaUH6u77eV32pfwWWMXAXWnt52oU8j+/f5M1Fgb1jVrxZNP57JEbyNnC6AtfzCZcxeeI6yDzkYhzZKUHCvVKcQJeB311jVG5XebiINQpKtDdZeUMGK471SzcQkkVApFzMsRnIU6L2TYKFzvXbT3IC4aIcf8yCB+nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VfKL3rc2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VfKL3rc2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 570A61F000E9;
	Tue,  4 Aug 2026 08:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785830402;
	bh=4ubmjwzFpoK/6w4SqrxzA8RaEu/P1PfMaI2YcuYtbbE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VfKL3rc2O3D5y5xrJu6ip+gbXYWljwzryJySgU++RpS1zhmRNX2y9VcfaPRd+/l9u
	 velpWEHiLCPKyvaI2wl+iEcOlU5dfnxA0Lyf//5BN1VtE0mW/bZVlAw5lQI9nD0O1J
	 8bf9JbVHIqFLBg0V2YPGS0eafxPMkRnr0OH8+F/khVuCrujweLzewMTORAA3ye7dqR
	 qYnoDs2ZPn5zLXHsrnJkmphuxBhwRE5TodggTrHKnu7Pm3cv7DnEOkPOQGHB02CZsV
	 GPR5Wt1F/1/CEwc+9W2PS7ByikwOlW3Nu0dte0whVnBmo50UVcZBCiiX4tZD3QgPjM
	 UQrqoFqPA5awA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (nzxt-smart2) Check return value of
 init_device() in probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qingshuang Fu" <fffsqian@163.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260804074842.505923-1-fffsqian@163.com>
References: <20260804074842.505923-1-fffsqian@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 08:00:01 +0000
Message-Id: <20260804080002.570A61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Sysfs read and write handlers wait indefinitely for hardware repor=
ts without providing a mechanism to break the wait on device disconnect, ca=
using the device unbind thread to deadlock.
--

--- Patch [1]: [PATCH] hwmon: (nzxt-smart2) Check return value of init_devi=
ce() in probe ---
commit 18435050bb0408be0aa1e570c7a2976a468d52c0
Author: Qingshuang Fu <fuqingshuang@kylinos.cn>

hwmon: (nzxt-smart2) Check return value of init_device() in probe

This commit updates the nzxt-smart2 driver to check the return value of
init_device() during probe. If the hardware is unresponsive and initializat=
ion
fails, the driver now correctly aborts rather than registering the hwmon
device in an inconsistent state. This safely utilizes an earlier fix that
stops device IO before closing the hardware.

> diff --git a/drivers/hwmon/nzxt-smart2.c b/drivers/hwmon/nzxt-smart2.c
> index ff0c0bee0e839..efc78a8f58c88 100644
> --- a/drivers/hwmon/nzxt-smart2.c
> +++ b/drivers/hwmon/nzxt-smart2.c
> @@ -754,7 +754,11 @@ static int nzxt_smart2_hid_probe(struct hid_device *=
hdev,
> =20
>  	hid_device_io_start(hdev);
> =20
> -	init_device(drvdata, UPDATE_INTERVAL_DEFAULT_MS);
> +	ret =3D init_device(drvdata, UPDATE_INTERVAL_DEFAULT_MS);
> +	if (ret) {
> +		dev_err(&hdev->dev, "init_device failed: %d\n", ret);
> +		goto out_hw_close;
> +	}
> =20
>  	drvdata->hwmon =3D
>  		hwmon_device_register_with_info(&hdev->dev, "nzxtsmart2", drvdata,

[Severity: High]
This is a pre-existing issue, but does the driver handle device disconnects
safely while blocked in sysfs reads?

If a userspace program is reading a sysfs attribute (like pwm1_enable) and
blocks in nzxt_smart2_hwmon_read() because the device hasn't sent the
required report:

drivers/hwmon/nzxt-smart2.c:nzxt_smart2_hwmon_read() {
    ...
    res =3D wait_event_interruptible_locked_irq(drvdata->wq,
                                              drvdata->fan_config_received);
    ...
}

If the device is suddenly disconnected, nzxt_smart2_hid_remove() calls
hwmon_device_unregister() without waking up the wait queue or signaling a
disconnect. Will this cause a deadlock in kernfs_drain since the sysfs
thread never wakes up to finish its read?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804074842.5059=
23-1-fffsqian@163.com?part=3D1
