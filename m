Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED5E40EBA0
	for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2026 12:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784549517; cv=none; b=Anc97zJgpRYRRwUy/HIPfhC3lioVz+MhCtq2uT7ZGFpimHgonOgxis5FQ62obMv4/x8T9rTNDRH0bhrbND0EP8LFJllzNZhQbNubxrA2YbEBio5W+Fnl9avSRYLgza81RIwQAqmRzPofidcVtvi+vDvF48+SEWuc0gDmuKi600k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784549517; c=relaxed/simple;
	bh=CyPgQFmNpKT5hmwTnifsufdjeFoxnY+gN5yPAPeqRvc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eh4tAFbim0V/iEz/s3iXhg3VMc0ifmUbs//IBgORvE+SYUvnGT3m5hAcLpxw4ij1YQJRIQUkZVKsYffgcX0bxL7iibyFx2NA5KXDSlioA3CRdD4/UMqBnm1iUclHfwgO6IOt4063pIt91KnvMZD9Z5zlzT7HSY8KABXqw4gDIWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BRV16mTg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BRV16mTg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B55671F00A3A;
	Mon, 20 Jul 2026 12:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784549515;
	bh=eW8Pf4MwS5nLar+1NofUU70v6UL2r2FmraXJ+yJC3Qg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BRV16mTg18zyrop/nA6EfrYEOpbB5UDk0XDn80YpvvIZxY/2/2oeIEYUKbKiOqGFQ
	 K9jUY+nYHaDJK9ux8UOlRxNVDojRhrSdwi7VBOS5nCiN3bWhM5hJCXHEvS7oOF1+En
	 rjhOPoCuMtZXE56qdElryrZnpqNfCk5Ryowqoc9bzZeY9qjRyg4VL2vDdpNiIPCBfk
	 qD527I1d6/JMv0fy+n/5ASe/D3JAS/ZzeVoK/+2Aaj07MUPWryGqXM+ImpIQ/ZXEIe
	 XCfoqSS9jvWqi03VIRrDxQ+uYmtsctNkpXP7RhuxyNwv3WPNrOAIbQCEVtbFD9FePt
	 HeNVzbu2N8gTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] hwmon: occ: validate poll response sensor blocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengpeng Hou" <pengpeng@iscas.ac.cn>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260720115826.14813-1-pengpeng@iscas.ac.cn>
References: <20260720115826.14813-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 12:11:55 +0000
Message-Id: <20260720121155.B55671F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Repeatedly toggling the `occ_active` sysfs attribute leaks memory =
due to `devm_kcalloc` allocations.
- [High] Validation of sensor block size is insufficient to prevent OOB rea=
ds because it does not verify `sensor_length` against the expected C struct=
ure sizes used by sysfs readers.
- [High] Lockless reads of the response buffer create a data race leading t=
o torn reads for multi-byte sensor values.
--

--- Patch [1]: [PATCH v2] hwmon: occ: validate poll response sensor blocks =
---
commit 04905329085b910b887e74baa72bc72f52624e45
Author: Pengpeng Hou <pengpeng@iscas.ac.cn>

hwmon: occ: validate poll response sensor blocks

The OCC poll response parser walks a counted list of sensor data blocks.
It used the static backing-array capacity as the parse boundary, but a
transport response makes only data_length bytes current and valid. A
truncated response can therefore make the parser consume a block header or
block extent outside the current response.

Link: https://lore.kernel.org/all/20260706093317.80867-1-pengpeng@iscas.ac.=
cn/

> diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
> index e18e80e832fd3..175208d712b06 100644
> --- a/drivers/hwmon/occ/common.c
> +++ b/drivers/hwmon/occ/common.c
> @@ -1052,32 +1052,49 @@ static int occ_setup_sensor_attrs(struct occ *occ)

[ ... ]

>  		old_offset =3D offset;
>  		offset =3D (block->header.num_sensors *
>  			  block->header.sensor_length) + sizeof(block->header);
> -		size +=3D offset;
> =20
>  		/* validate all the length/size fields */
> -		if ((size + sizeof(*header)) >=3D OCC_RESP_DATA_BYTES) {
> -			dev_warn(occ->bus_dev, "exceeded response buffer\n");
> -			return;
> +		if (size + sizeof(*header) + offset > data_length) {
> +			dev_err(occ->bus_dev,
> +				"exceeded OCC poll response length\n");
> +			return -EMSGSIZE;
>  		}
> +		size +=3D offset;

[Severity: High]
This isn't a bug introduced by this patch, but is the validation of the
sensor block size sufficient to prevent out-of-bounds reads?

The validation uses the device-provided sensor_length without verifying it
matches the expected C structure sizes used by sysfs readers.

For example, sysfs readers like occ_show_power_a0() use native pointer
arithmetic based on static C structures:

drivers/hwmon/occ/common.c:occ_show_power_a0() {
    ...
    power =3D ((struct power_sensor_a0 *)sensors->power.data) + sattr->inde=
x;
    ...
}

If a compromised or malfunctioning OCC device returns a poll response with
a maliciously small sensor_length (e.g., 1) but a large num_sensors, could
sysfs readers read beyond the validated bounds of occ->resp.data, leaking
adjacent kernel heap memory to userspace?

[ ... ]

> @@ -1107,6 +1124,9 @@ static void occ_parse_poll_response(struct occ *occ)
> =20
>  	dev_dbg(occ->bus_dev, "Max resp size: %u+%zd=3D%zd\n", size,
>  		sizeof(*header), size + sizeof(*header));
> +	occ->sensors =3D parsed;
> +
> +	return 0;
>  }

[Severity: High]
This is a pre-existing issue, but can lockless reads of the response
buffer create a data race leading to torn reads for multi-byte sensor
values?

The hwmon subsystem core locking rules mandate that drivers registering
attributes via groups must implement their own locking for those
attributes.

In occ_update_response(), the response buffer is updated under occ->lock,
but callers drop the lock before consuming the data. For example, sysfs
readers directly access parsed multi-byte sensor data without locks:

drivers/hwmon/occ/common.c:occ_show_power_a0() {
    ...
    val =3D occ_get_powr_avg(get_unaligned_be64(&power->system.accumulator),
                           get_unaligned_be32(&power->system.update_tag));
    ...
}

If concurrent sysfs reads trigger occ_update_response(), which overwrites
the shared occ->resp buffer via an underlying bus transfer while another
thread is reading from it, could this cause torn reads and wild spikes in
reported statistics?

[ ... ]

> @@ -1138,10 +1158,12 @@ int occ_active(struct occ *occ, bool active)
>  			goto unlock;
>  		}
> =20
> -		occ->active =3D true;
>  		occ->next_update =3D jiffies + OCC_UPDATE_FREQUENCY;
> -		occ_parse_poll_response(occ);
> +		rc =3D occ_parse_poll_response(occ);
> +		if (rc)
> +			goto unlock;
> =20
> +		occ->active =3D true;
>  		rc =3D occ_setup_sensor_attrs(occ);

[Severity: High]
This is a pre-existing issue, but does repeatedly toggling the occ_active
sysfs attribute leak memory?

Each activation calls occ_setup_sensor_attrs(), which uses devm_kcalloc()
to allocate memory on the parent device:

drivers/hwmon/occ/common.c:occ_setup_sensor_attrs() {
    ...
    occ->attrs =3D devm_kcalloc(dev, num_attrs, sizeof(*occ->attrs),
                              GFP_KERNEL);
    ...
}

On deactivation, the hwmon device is unregistered, but the devm_ managed
memory is tied to the parent device and is never freed until the module is
removed.

Can a user with write access to the hwmon sysfs attributes repeatedly write
'0' then '1' to the occ_active attribute and cause an unbounded memory leak
leading to system OOM?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720115826.1481=
3-1-pengpeng@iscas.ac.cn?part=3D1
