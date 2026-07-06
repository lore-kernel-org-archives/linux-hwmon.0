Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAC24C6F04
	for <linux-hwmon@vger.kernel.org>; Mon,  6 Jul 2026 09:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783331282; cv=none; b=RVZarlKA4vJPU60U4vCfttZcYAvTB+bee4Go6/Zn+Ywe5TszAA/QUjk1mKTYiw10WeD7NwgJ9K1Z9rhipb8sk4n8D7lXdEIGLOspWUjJ2g7iV7wW8fKWIbgSQXEEam5bLoIBpb6Q9ounzptzH/iL8WuB5SizgyUKPC6YMkbKIqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783331282; c=relaxed/simple;
	bh=Q5iIDhpM0V0eQef3U8yc4V3A0hhhrJmwxo3fLZPAsL0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bvoQxVa6Ct7t/9ZPiKlwFeEbaG9g5CWzD/PnFvyLLiRh1EKTwRD69XKi5CgwhztUbYSSFJeLNpgOcpuyN/26LXjeVdoBITEHTa68fCtpq4WSwnBbogtt3fY0alhUmK4gEuOHPgYdWZioYjkxHUrT8kk8VM1Dk9ys4oUpMVDQzlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ii1kStdt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ii1kStdt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A22A81F000E9;
	Mon,  6 Jul 2026 09:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783331279;
	bh=J3PQoM1Yid6CBpFoT/KhKMYHbST3r9Ud8d/vBJBIfIo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ii1kStdtvRr5uAeoK16P8Gxv3lRtola/uZafE5dftzkVEhTJ6PcmzuJ8a6SA1yOlb
	 LV8j59o1zq+nfnq8KAEqSguW14J72Kk5C07J5UeeQ5XiveJNGiM3IOMw47P8DfKOWn
	 H++T3jP+ifs37G3CsKjhN0+kHijgb+lWLREjvtzjx8jL54Z6r0ofHEKqIiFEazPJYY
	 rlrD7l+MYOR9wKnzN+g3p3I6QH9comyB8bg+Z70w9Xw0aDuNqhG/PGB+OxzOw7bltY
	 3toEdbJ1vwaYTPwd/Rjrc4T+IGUoDm8ZbkxEAVNtTJd5zYX91L9EZlZ9SXG7hQFZEF
	 2f2wGBaBxJnWQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: occ: validate poll response sensor blocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengpeng Hou" <pengpeng@iscas.ac.cn>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260706093317.80867-1-pengpeng@iscas.ac.cn>
References: <20260706093317.80867-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 09:47:57 +0000
Message-Id: <20260706094758.A22A81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unvalidated `sensor_length` from hardware allows arbitrary out-of-=
bounds memory reads via sysfs attributes.
- [High] Repeatedly toggling the OCC active state via sysfs causes an unbou=
nded memory leak, leading to potential OOM.
- [High] AB-BA deadlock between kernfs active reference and driver mutex du=
ring OCC deactivation.
--

commit 5011dae8782f4b544aacd0d5b80a4b2e7ed11706
Author: Pengpeng Hou <pengpeng@iscas.ac.cn>

hwmon: occ: validate poll response sensor blocks

The OCC poll response parser walks a counted list of sensor data blocks.
It used the static response buffer size as the parse boundary, but the
transport only guarantees the bytes declared by the current response
length. A malformed or truncated response can therefore make the parser
read a block header or block payload beyond the current response data.

> diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
> index 42cc6068bb08b..b2e59a1cb73ff 100644
> --- a/drivers/hwmon/occ/common.c
> +++ b/drivers/hwmon/occ/common.c

[ ... ]

> @@ -1057,21 +1058,34 @@ static void occ_parse_poll_response(struct occ *o=
cc)
>  	struct occ_poll_response_header *header =3D &poll->header;
>  	struct occ_sensor_data_block *block =3D &poll->block;
> =20
> +	data_length =3D get_unaligned_be16(&resp->data_length);
> +	if (data_length < sizeof(*header) || data_length > OCC_RESP_DATA_BYTES)=
 {
> +		dev_warn(occ->bus_dev, "invalid OCC poll response length %u\n",
> +			 data_length);
> +		return -EMSGSIZE;
> +	}
> +
>  	dev_info(occ->bus_dev, "OCC found, code level: %.16s\n",
>  		 header->occ_code_level);
> =20
>  	for (i =3D 0; i < header->num_sensor_data_blocks; ++i) {
>  		block =3D (struct occ_sensor_data_block *)((u8 *)block + offset);
> +		if (size + sizeof(*header) + sizeof(block->header) >
> +		    data_length) {
> +			dev_warn(occ->bus_dev, "truncated OCC sensor block header\n");
> +			return -EMSGSIZE;
> +		}
> +
>  		old_offset =3D offset;
>  		offset =3D (block->header.num_sensors *
>  			  block->header.sensor_length) + sizeof(block->header);

[Severity: High]
This isn't a bug introduced by this patch, but does this calculation allow =
an
out-of-bounds read later?

If a faulty or malicious OCC device sends a poll response with a large
num_sensors and a small sensor_length (e.g., 1 byte), it passes the bounds
check below because the total calculated block size is small.

However, the driver's sysfs show functions (like occ_show_temp_2()) index
into the buffer using the fixed C structure size:

occ_show_temp_2()
    ...
    temp =3D ((struct temp_sensor_2 *)sensors->temp.data) + sattr->index;

This pointer arithmetic could index far beyond the validated block boundary
and the bounds of the OCC response buffer, leaking adjacent kernel memory to
userspace.

Should we validate that sensor_length matches or exceeds the expected
structure size for the given sensor version?

> -		size +=3D offset;
> =20
>  		/* validate all the length/size fields */
> -		if ((size + sizeof(*header)) >=3D OCC_RESP_DATA_BYTES) {
> -			dev_warn(occ->bus_dev, "exceeded response buffer\n");
> -			return;
> +		if (size + sizeof(*header) + offset > data_length) {
> +			dev_warn(occ->bus_dev, "exceeded OCC poll response length\n");
> +			return -EMSGSIZE;
>  		}
> +		size +=3D offset;
> =20
>  		dev_dbg(occ->bus_dev, " %04x..%04x: %.4s (%d sensors)\n",
>  			old_offset, offset - 1, block->header.eye_catcher,

[ ... ]

> @@ -1127,10 +1143,12 @@ int occ_active(struct occ *occ, bool active)
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
This is a pre-existing issue, but does repeatedly toggling the OCC active
state via sysfs cause an unbounded memory leak?

When transitioning to active, occ_setup_sensor_attrs() uses devm_kcalloc()
to allocate arrays for occ->attrs and occ->group.attrs tied to the parent b=
us
device.

When transitioning to inactive, occ_active() calls hwmon_device_unregister(=
),
but the devm_ allocated memory is not freed because the parent bus device is
never removed.

Repeatedly writing '0' and '1' to the occ_active sysfs file could continual=
ly
allocate new arrays without freeing the old ones, exhausting system memory.

[Severity: High]
This is also a pre-existing issue, but is there an AB-BA deadlock between t=
he
kernfs active reference and the driver mutex during OCC deactivation?

When deactivating the OCC, occ_active() acquires occ->lock and calls
hwmon_device_unregister(), which blocks in kernfs_remove() waiting for all
active references on the hwmon sysfs files to be released.

Concurrently, if userspace is reading a hwmon sysfs file, the sysfs core
holds the hwmon kernfs active reference and invokes the show function
(e.g., occ_show_temp_1()).

The show function calls occ_update_response(), which blocks trying to
acquire occ->lock.

This creates a deadlock where the unregister thread holds occ->lock and wai=
ts
for the hwmon active reference, while the sysfs reader holds the hwmon acti=
ve
reference and waits for occ->lock.

>  		if (rc) {
>  			dev_err(occ->bus_dev,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706093317.8086=
7-1-pengpeng@iscas.ac.cn?part=3D1
