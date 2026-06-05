Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027203DC86E
	for <linux-hwmon@vger.kernel.org>; Fri,  5 Jun 2026 18:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780684994; cv=none; b=HFKJOp1/lOkhzLrLIrA1UWcm6lyQJBIQfd9G2xMnvmdMN29OPynLcmYq90bst/w3tO0DqAdu1bYwtBM7f86pX+VaUsq2u8aZAQH8R34uk/UtUdfi3PB+iuN9bfEE+aPYSlA5TP9a2lgBaDbzahNZOdpgV38xj/d9i/HJd0AZPA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780684994; c=relaxed/simple;
	bh=z2qv2/4b0WxI32naut0ao+QxRTOvUyczOiKIoUeT3W0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QsJzhl3bINd32SJpMIuCsoRqIfUksOK3fXI38nVuIPgxT9r/1FmR/3Qtalj2xm63W3QbhMV+LYd5dFja3Puo+m4BgonIfJw9kvO4jy28YnZH2lV4/Vc+mhiYME8xudLNzI+M/bHYreGLARrY3FatoqKu0cpS3as8GIqZ7/ic4gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ds13nR9h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ds13nR9h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 834EF1F00893;
	Fri,  5 Jun 2026 18:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780684991;
	bh=IBwYPLKkeq1MSSTed4QcO/RQID000FD/N8Q1Qt1W7kE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ds13nR9h+N+Vve2LgXxZUqygQssdsOgBktSpE4Qj07fqzm8Zu69EvfDEzM9EM6RyD
	 9EmNyvzcoIqTlwInWsUmzMsOAhxcbxBYpuc6oKmDDKWvJ8mbzVQZtTbZFq2ivU0o3z
	 s6qjfQFd9aKcyKGF5qQx25eMRrgNA/WX6Pledddwe5JKRqy6ad7PpwXmau4VJ72yGs
	 He9eUEmR9j0l1iB6AL+ZHd15Gztevb4vx4yJAeszVkmR3Aica+zxmgn6OuvASKx0CH
	 qT0bgOl0r76wKSDaIgX+iAB/zTs06ehIfTHxQ36nJJroWU9BPpNTy5iSLqJvy4nao4
	 Y3+6V5v9oB59Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/9] platform/x86: dell-smbios-wmi: Use new
 buffer-based WMI API
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260605181433.188847-4-W_Armin@gmx.de>
References: <20260605181433.188847-4-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 18:43:10 +0000
Message-Id: <20260605184311.834EF1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] If the ACPI WMI method succeeds but returns no data (an empty obje=
ct), `wmidev_invoke_method()` sets `output.data` to `ZERO_SIZE_PTR` and ret=
urns 0 (success), ignoring `min_size`. `run_smbios_call()` then uncondition=
ally calls `memcpy` with a large `input.length`, dereferencing `ZERO_SIZE_P=
TR` and causing a kernel panic.
- [High] Use-after-free on character device ioctl/read when the WMI device =
is unbound while file descriptors remain open.
--

commit e4e7d2c981c6b6b6f52809fa5e1bc882f8e6a92c
Author: Armin Wolf <W_Armin@gmx.de>

platform/x86: dell-smbios-wmi: Use new buffer-based WMI API

Use the new buffer-based WMI API to also support ACPI firmware
implementations that do not use ACPI buffers for returning the
results of a SMBIOS call.

> diff --git a/drivers/platform/x86/dell/dell-smbios-wmi.c b/drivers/platfo=
rm/x86/dell/dell-smbios-wmi.c
> index a7dca8c59d602..64d0871b706e5 100644
> --- a/drivers/platform/x86/dell/dell-smbios-wmi.c
> +++ b/drivers/platform/x86/dell/dell-smbios-wmi.c
> @@ -50,38 +50,32 @@ static inline struct wmi_smbios_priv *get_first_smbio=
s_priv(void)

[ ... ]

> -	status =3D wmidev_evaluate_method(wdev, 0, 1, &input, &output);
> -	if (ACPI_FAILURE(status))
> -		return -EIO;
> -	obj =3D (union acpi_object *)output.pointer;
> -	if (obj->type !=3D ACPI_TYPE_BUFFER) {
> -		dev_dbg(&wdev->dev, "received type: %d\n", obj->type);
> -		if (obj->type =3D=3D ACPI_TYPE_INTEGER)
> -			dev_dbg(&wdev->dev, "SMBIOS call failed: %llu\n",
> -				obj->integer.value);
> -		kfree(output.pointer);
> -		return -EIO;
> -	}
> -	memcpy(input.pointer, obj->buffer.pointer, obj->buffer.length);
> +	/*
> +	 * The output buffer returned by the WMI method should have at least th=
e size
> +	 * of the input buffer.
> +	 */
> +	ret =3D wmidev_invoke_method(wdev, 0, 1, &input, &output, input.length);
> +	if (ret < 0)
> +		return ret;
> +
> +	memcpy(input.data, output.data, input.length);

[Severity: High]
This is a pre-existing issue, but can this memcpy() cause a kernel panic?

If the ACPI WMI method evaluates successfully but returns no data (an empty
object), wmidev_invoke_method() in drivers/platform/wmi/core.c sets
out->data to ZERO_SIZE_PTR and returns 0:

	obj =3D aout.pointer;
	if (!obj) {
		out->length =3D 0;
		out->data =3D ZERO_SIZE_PTR;

		return 0;
	}

Since wmidev_invoke_method() returns 0 (success) and bypasses the min_size
check, the check for ret < 0 here passes. The memcpy() then unconditionally
dereferences ZERO_SIZE_PTR (0x10) for output.data with input.length, which
will trigger a fatal page fault.

> +	kfree(output.data);
>  	dev_dbg(&wdev->dev, "result: [%08x,%08x,%08x,%08x]\n",
>  		priv->buf->std.output[0], priv->buf->std.output[1],
>  		priv->buf->std.output[2], priv->buf->std.output[3]);

[ ... ]

[Severity: High]
This is a pre-existing issue, but could there be a use-after-free if the WMI
device is unbound while file descriptors remain open?

In dell_smbios_wmi_probe(), the driver uses devm_kzalloc() and
devm_get_free_pages() to allocate priv and priv->buf:

	priv =3D devm_kzalloc(&wdev->dev, sizeof(struct wmi_smbios_priv),
			    GFP_KERNEL);
	...
	priv->buf =3D (void *)devm_get_free_pages(&wdev->dev, GFP_KERNEL, count);

It registers a misc character device and ties its deregistration to devres.
If a userspace process has the device open when the WMI device is unbound,
devres will execute misc_deregister() and free the memory.

However, misc_deregister() does not revoke existing open file descriptors.
A subsequent ioctl() or read() on the open FD will access the freed priv po=
inter
and its buf in dell_smbios_wmi_ioctl():

	struct wmi_smbios_priv *priv =3D filp->private_data;
	...
	ret =3D dell_smbios_wmi_do_ioctl(priv, input);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605181433.1888=
47-1-W_Armin@gmx.de?part=3D3
