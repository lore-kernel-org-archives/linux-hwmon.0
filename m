Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FB3493649
	for <linux-hwmon@vger.kernel.org>; Sat, 22 Aug 2026 11:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787399269; cv=none; b=CHyS45J1t5wCHTHzI5mwaklzaDsoCNGH7m4MhAk2IUqXvtB2+DkSuDxwUCoGPYPhbYcuCIFey/HrNXUFfqTblCrJShh/wbPzMIyvEhepWTUX3BShVu8KU2/XDFWKtGtCsaFzhsoshEtW6ZSKssNp+Ho2iB9+aDC8mnkfUxUCqRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787399269; c=relaxed/simple;
	bh=fE3RYxQW8xy3DcVdjoFMeQzg8LNSsSM0wiK17xFVMas=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KleIRZwRIVqEzWhXfWhe1DWtN+oH+tbvUiA0pfYIRSHFQL4pqKZPvJPqXflSZzpmNYsqGLMj6gcS9x7hBzuekX4xi5Q6PcQhyUbdziM1CnmsjtEtAQdaryeMZlC0jOhJXkxF/MY1iMzg0K3AajsjfKnzuyqwuK6bxlWXvHfOVmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aEBQPywQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aEBQPywQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B46471F000E9;
	Sat, 22 Aug 2026 11:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787399266;
	bh=/ZmIX1u2GcbQaeT6gd0VsGHm/DQp4b4WzKweLJeHnSc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aEBQPywQzlo+x8nCbJhF1Ue/g7e3WuZGgXxvEMYRSxh8UQFeu2VkT4qgoy/aRKVwp
	 jgnlaibyVfuwSmNgB/RVvf4oJ3BZkjHH6J2Pc6UJh8YtU+hHYHmhEmsCwe1MSBPBMr
	 dEcifnV3t6hQz7pEJqZtWuxfQFRHIEMHxgaP49vlJCadKd2A/4yWb5PsGJ/kytuM/p
	 zwv8zV8vVV89K3Zz3cbJ2IjcuiungBmpF789WQidPV+tkj9qudIDmEH4BbwyIo8NSU
	 iD82SjYiuMmjwd5nNEk5+YI5PAVU6f37LiGrE2h4V5eiWbI7hSnyT5bBFLC0oLuzQD
	 GxoXLACNNpEzQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] hwmon: (aquacomputer_d5next) valid the data size
 before reading the sensor data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Edward Adam Davis" <eadavis@qq.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <tencent_CE16CF998D9A25B20DEF1275DDCEDDB61907@qq.com>
References: <20260822092616.B9B121F000E9@smtp.kernel.org>
 <tencent_CE16CF998D9A25B20DEF1275DDCEDDB61907@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 22 Aug 2026 11:47:46 +0000
Message-Id: <20260822114746.B46471F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the patch's atte=
mpt to fix the out-of-bounds read is incomplete. The newly added `aqc_raw_d=
ata_valid()` deliberately skips bounds checking for special-case sensors (l=
ike `leakshield`, `aquastreamult`, and `highflownext`). An attacker can sup=
ply a HID report that passes the initial generic length checks, but is too =
small for the special-case offsets (e.g., `LEAKSHIELD_PRESSURE_ADJUSTED` at=
 offset 285). The switch statement in `aqc_raw_event()` then unconditionall=
y reads these out-of-bounds offsets.
- [High] This problem wasn't introduced by this patch, but a malicious HID =
device mimicking `aquastreamxt` can trigger a NULL pointer dereference in `=
aqc_raw_event()`. For `aquastreamxt`, `priv->fan_structure` is deliberately=
 left uninitialized (NULL) during `probe()`. The patch author added `if (!p=
riv->fan_structure) goto flow;` in `aqc_raw_data_valid()` to skip checking =
it, but missed that the loop in `aqc_raw_event()` will still execute becaus=
e `priv->num_fans` is 2. The loop unconditionally dereferences `priv->fan_s=
tructure->speed`, causing an immediate kernel panic.
- [High] This problem wasn't introduced by this patch, but there is a missi=
ng bounds check on `hdev->maxcollection` before accessing `hdev->collection=
[1]` in `aqc_probe()`. A malicious USB device can present a HID report desc=
riptor that defines 0 or 1 collections, leading to an out-of-bounds array r=
ead when the driver checks `hdev->collection[1].type`.
--

--- Patch [1]: [PATCH v4] hwmon: (aquacomputer_d5next) valid the data size =
before reading the sensor data ---
commit 78df709d4519cd7ca51246e494c81774b1f7c3ae
Author: Edward Adam Davis <eadavis@qq.com>

hwmon: (aquacomputer_d5next) valid the data size before reading the sensor =
data

The user-forged sensor data is only 65 bytes long; however, aqc_raw_event()
fails to handle cases where the sensor data length is too small when reading
the data, resulting in [1] during the read process.

Add a data size check, if the size is less than that required for the
specific data item to be read, abort the sensor data read operation.

Link: https://syzkaller.appspot.com/bug?extid=3D9ee5f5dc18673d6b2f37

> diff --git a/drivers/hwmon/aquacomputer_d5next.c b/drivers/hwmon/aquacomp=
uter_d5next.c
> index 1ca70e7262988..89c9fc0c77e52 100644
> --- a/drivers/hwmon/aquacomputer_d5next.c
> +++ b/drivers/hwmon/aquacomputer_d5next.c
> @@ -1324,6 +1324,107 @@ static const struct hwmon_chip_info aqc_chip_info=
 =3D {
>  	.info =3D aqc_info,
>  };
> =20
> +/* aqc_raw_data_valid()
> + * Does not support special-case sensor readings data size check
> + */

[Severity: High]
This problem wasn't introduced by this patch, but the patch's attempt to fix
the out-of-bounds read seems incomplete. The newly added aqc_raw_data_valid=
()
deliberately skips bounds checking for special-case sensors (like leakshiel=
d,
aquastreamult, and highflownext).

Could an attacker supply a HID report that passes the initial generic length
checks, but is too small for the special-case offsets?

For example, LEAKSHIELD_PRESSURE_ADJUSTED is at offset 285. The switch
statement in aqc_raw_event() then unconditionally reads these out-of-bounds
offsets:

	case leakshield:
		priv->speed_input[0] =3D
		    ((s16)get_unaligned_be16(data + LEAKSHIELD_PRESSURE_ADJUSTED)) * 100;

> +static bool aqc_raw_data_valid(struct aqc_data *priv, int size)
> +{
[ ... ]
> +	/* Fan speed and related readings data size check */
> +	if (!priv->fan_structure)
> +		goto flow;

[Severity: High]
This isn't a bug introduced by this patch, but could this cause a NULL poin=
ter
dereference?

For aquastreamxt, priv->fan_structure is deliberately left uninitialized
(NULL) during probe(). The check above skips bounds checking when
fan_structure is NULL, but misses that the loop in aqc_raw_event() will sti=
ll
execute because priv->num_fans is 2.

The loop in aqc_raw_event() unconditionally dereferences priv->fan_structur=
e:

	for (i =3D 0; i < priv->num_fans; i++) {
		priv->speed_input[i] =3D
		    get_unaligned_be16(data + priv->fan_sensor_offsets[i] +
				       priv->fan_structure->speed);

Could a malicious HID device mimicking aquastreamxt trigger a kernel panic
here?

[ ... ]

[Severity: High]
This is a pre-existing issue, but is there a missing bounds check on
hdev->maxcollection before accessing hdev->collection[1] in aqc_probe()?

If a malicious USB device presents a HID report descriptor that defines 0 o=
r 1
collections, could the driver perform an out-of-bounds array read when it
checks hdev->collection[1].type:

drivers/hwmon/aquacomputer_d5next.c:aqc_probe() {
	...
	if (hdev->collection[1].type !=3D 0) {
		ret =3D -ENODEV;
		goto fail_and_close;
	}
	...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/tencent_CE16CF998D9=
A25B20DEF1275DDCEDDB61907@qq.com?part=3D1
