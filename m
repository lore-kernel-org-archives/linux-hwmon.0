Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B30A3B14B2
	for <linux-hwmon@vger.kernel.org>; Mon, 22 Jun 2026 14:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782137848; cv=none; b=mlLMZ82RmJeW2feDyBvhpUbXJ5L6Gb06cw8tkyvMC7ICOX8+Y3G8vSkz5LlWNq4cP3G6ZC3pIXiwbMgJ6VAUjUaEdK5jc29Gf1j7ADPMf1/Otf+gjhn1LFucyqqhL9jI56MF3RGxBG2Twrdo8wb2qLKMV4oa+XooAWmtmKQoPfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782137848; c=relaxed/simple;
	bh=MAQ/X7iA6RP4moDjocki8NfpS5Rqa8RrWkorXQH9Tgk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BLj9KUJRwx7yZlzN0HAfhzd0VlCSsF87wjELrARxxABbh26/frz0BhXMc3MduESzCCF4iiJkow8LyQbne8U/f+SiUjLVGnFHCUzdvxu5HTNLF/2yut1Lg/c7FSDpx7uhre2zo49SCmz8ADf+kTUNrWU4wdO6Qp7B8WJT6gySCzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BG/j04Dm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BG/j04Dm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D5E41F000E9;
	Mon, 22 Jun 2026 14:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782137846;
	bh=W4jGScxU9J8gQWMEGm9XyfI0e3sF25cKy08eUSvXSxA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BG/j04DmdTXVUnlLEl9gRaQib8pCV3f+eydMD7TfD7mouzzxW8DdqesoSL9F1A7qL
	 vJ7vLkyzU9n7cd4sJXPszdLztefcZuSiUqdu4ybuFoNSjq5BA747Dm8eB7+oGZgRge
	 /oqiZQcu7WZyscxRPOlHLejWFGZXrZDD8XLNecB89qfYNOPqTfPiwSplNYJ723XFOX
	 WI0OOffHjtB1Z7Cpezz+RpRox+OFGMyF51KzXd4iI7zH/IAyZmivpzcyeJdNdt+VQL
	 6h69CIekMQ32Je82qfrsCJ3GNUzwSlb9kj/FYCh3oc60HB7mtY/ptlRCSJf/VJbWzf
	 V1pXYnG0+SpIw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/8] hwmon: Add mutex protecting for sbtsi read/write
 through hwmon
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akshay Gupta" <Akshay.Gupta@amd.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260622135821.2190260-8-Akshay.Gupta@amd.com>
References: <20260622135821.2190260-1-Akshay.Gupta@amd.com>
 <20260622135821.2190260-8-Akshay.Gupta@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 22 Jun 2026 14:17:25 +0000
Message-Id: <20260622141726.8D5E41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Unsafe DMA buffer allocation risking memory corruption due to cach=
eline sharing in I3C driver.
- [High] Use-After-Free and resource leak on the probe error path due to mi=
ssing devres rollback.
- [High] TOCTOU race condition in IOCTL leading to Use-After-Free of underl=
ying I2C/I3C device.

Pre-existing issues:
- [High] Signed integer overflow when setting extended temperature limit re=
sults in minimum limit instead of maximum.
--

commit 73c231fb30add9ba7fc881d929121fb0a885ff0d
Author: Prathima <Prathima.Lk@amd.com>
Subject: hwmon: Add mutex protecting for sbtsi read/write through hwmon

This commit adds a mutex using guard(sbtsi) around the SBTSI read and write
paths in the hwmon driver to serialize bus transactions.

> diff --git a/drivers/hwmon/sbtsi_temp.c b/drivers/hwmon/sbtsi_temp.c
> index d7ae986d824c4..11c8108d69b2a 100644
> --- a/drivers/hwmon/sbtsi_temp.c
> +++ b/drivers/hwmon/sbtsi_temp.c

[ ... ]

While reviewing this patch, I noticed a few other issues in the surrounding=
 code
and the core driver.

drivers/misc/amd-sbi/tsi-core.h:struct sbtsi_i3c_priv {
	struct sbtsi_data data;
	u8 buf[2];
};

[Severity: High]
Does this buf array risk memory corruption during I3C transfers?

Because buf immediately follows struct sbtsi_data without explicit
cacheline alignment (____cacheline_aligned), it shares a CPU cacheline with
the trailing fields of struct sbtsi_data.

When the I3C master controller maps this buffer for DMA, it flushes or
invalidates the cacheline. Will concurrent CPU access to the adjacent
sbtsi_data fields (like data->detached or data->lock) during the
transfer cause cacheline bouncing, leading to either silent loss of state
updates or corruption of the DMA buffer?


drivers/hwmon/sbtsi_temp.c:sbtsi_write() {
    ...
	if (data->ext_range_mode)
		val +=3D SBTSI_TEMP_EXT_RANGE_ADJ;
	val =3D clamp_val(val, SBTSI_TEMP_MIN, SBTSI_TEMP_MAX);
    ...
}

[Severity: High]
This isn't a bug introduced by this patch, but can this code wrap to a nega=
tive
value when setting an extended temperature limit?

If a user provides an extremely large value (e.g. LONG_MAX) to maximize the
limit via sysfs, the val +=3D SBTSI_TEMP_EXT_RANGE_ADJ operation could caus=
e a
signed integer overflow. In the kernel, this wraps to a large negative numb=
er.

When subsequently passed to clamp_val(), it is clamped to SBTSI_TEMP_MIN
(0). Does this mean attempting to disable or maximize a thermal limit sets =
it
to 0 instead, potentially triggering unintended hardware thermal throttling
or system shutdown?


drivers/misc/amd-sbi/tsi.c:sbtsi_probe_common() {
    ...
	err =3D create_misc_tsi_device(data, dev);
	if (err)
		return err;

	return devm_add_action(dev, sbtsi_misc_unregister, data);
}

[Severity: High]
Could this error path cause a use-after-free and leave the misc device
registered?

devm_add_action() is used to queue sbtsi_misc_unregister. If
devm_add_action() fails to allocate devres memory, it returns an error but
does not execute the action. This causes the probe to fail and devres unwin=
ding
to start. Devres then executes previously added cleanup actions, such as
sbtsi_driver_unref, which drops the kref and frees the data struct.

Because sbtsi_misc_unregister was not executed, the misc device remains
registered globally with its private_data pointing to the now-freed data.
Should this use devm_add_action_or_reset() to ensure the cleanup executes
if action registration fails?


drivers/misc/amd-sbi/tsi-core.c:apml_tsi_reg_xfer() {
    ...
	if (data->detached)
		return -ENODEV;

	if (copy_from_user(&msg, arg, sizeof(struct apml_tsi_xfer_msg)))
		return -EFAULT;
    ...
}

[Severity: High]
Is there a race condition here that could lead to a use-after-free of the
underlying I2C/I3C device?

The driver checks data->detached before acquiring data->lock and before
sleeping in copy_from_user(). If the device is hot-unplugged concurrently,
the devres unbind path executes sbtsi_misc_unregister():

drivers/misc/amd-sbi/tsi.c:sbtsi_misc_unregister() {
    ...
	misc_deregister(&data->sbtsi_misc_dev);
	data->detached =3D true;
    ...
}

This sets data->detached =3D true without acquiring data->lock and completes
device unbind. Completing unbind drops the device reference and frees the
i2c_client or i3c_device structure.

When the IOCTL thread wakes up, it calls sbtsi_xfer_ioctl(), which takes the
lock but does not recheck data->detached. Will it then access the
already-freed data->client?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260622135821.2190=
260-1-Akshay.Gupta@amd.com?part=3D7
