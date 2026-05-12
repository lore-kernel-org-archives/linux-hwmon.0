Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DA81FC7
	for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 00:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778544190; cv=none; b=sfGZbjFFLrtTXP8Glvp3/OxCFHijIrJIqbFI7e0az+wuSM6hQ5C/mWX1jyTCUetd8jccp0o/WVY7bsBL7qEKGbwhPQHQyik7t3PNSoyp0XTc+hQhoyF9vKFqz06DiK3sc/Tn2lvJ5nIPGFTJITP7khUVkBYTHFEluVKO5uy4PEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778544190; c=relaxed/simple;
	bh=QzDRPbeNE+WBuMB8kUX5KyWM3U2wsFavNN5RyQrC9yM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XMKDcVMjZhW4SKHAW0Md6J+gfqN3a6XpjGdiKoB8hI33e2/dVCVG18EjYgc7w378R9aRlIJFiDooVfIVkNTmc+N89seo9grnZeTw7raVkDF0zLDRiWxGp8f9uJheh+QBEFy3a+U0UvbXiK6GvkyWiFAdtbtfJot4wBiS8HR0qp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cxll5ZLZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cxll5ZLZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B736AC2BCB0;
	Tue, 12 May 2026 00:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778544189;
	bh=QzDRPbeNE+WBuMB8kUX5KyWM3U2wsFavNN5RyQrC9yM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=cxll5ZLZdsPgvSFS+y4HziUul8o/5viH0C88hy4AybU01FZ5e48m5v2kSjMHSnbie
	 nBCNESTTE0ywfT3Ij0jCswEI1E+eQTZ9lZZ6fmYdDJmlBsjHOnuJhNt74/vz5b6fj8
	 NekClyNmClmM/XoyC6NKKMHjzMPXEoghtjhtvG2p2UA1qqmrCnxoFkqLzclge0f4qa
	 ulAsu/WgEgJKoABBRFeH1cXli4rCXvexZiSTTePB+t1jvnA0D/vZfRBLIXTl009M+v
	 62zFSjrtWkbEVu7wufWwF4UeTMGhux0uj6T7XxxlVap1a9n0rXDVKOxxFxEVl2UdDG
	 9TEWpviSujv5g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/5] hwmon: (pmbus/adm1266) add clear_blackbox
 debugfs entry
Reply-To: sashiko@lists.linux.dev
To: "Abdurrahman Hussain via B4 Relay" <devnull+abdurrahman.nexthop.ai@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260510-adm1266-v2-2-3a22b903c2f1@nexthop.ai>
References: <20260510-adm1266-v2-2-3a22b903c2f1@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 00:03:09 +0000
Message-Id: <20260512000309.B736AC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `adm1266_clear_blackbox_write` debugfs attribute modifies hard=
ware state without holding the required subsystem locks.
- [Low] A zero-byte write to the `clear_blackbox` debugfs file unconditiona=
lly triggers the destructive blackbox clear command.
--

commit cd08cab7d449e0fd299c995ec4c83c7a5b860128
Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>

hwmon: (pmbus/adm1266) add clear_blackbox debugfs entry

This commit exposes a write-only debugfs file to issue the clear-blackbox
sub-command for deployments running in single recording mode. Writing any
data to the file triggers a 2-byte block-write to READ_BLACKBOX.

> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
> --- a/drivers/hwmon/pmbus/adm1266.c
> +++ b/drivers/hwmon/pmbus/adm1266.c
[ ... ]
> +/*
> + * Clearing the blackbox is required when the device is configured in
> + * single-recording mode (BLACKBOX_CONFIG[0] =3D 0): once the 32-record
> + * buffer is full the device stops recording until cleared.
> + *
> + * The clear is issued as a 2-byte block-write to READ_BLACKBOX with
> + * payload {0xFE, 0x00} per the datasheet.
> + */
> +static ssize_t adm1266_clear_blackbox_write(struct file *file, const cha=
r __user *ubuf,
> +					    size_t count, loff_t *ppos)
> +{
> +	struct i2c_client *client =3D file->private_data;
> +	u8 payload[2] =3D { 0xFE, 0x00 };
> +	int ret;

Does this code trigger the hardware clear even for a zero-byte write?
The VFS layer can invoke the write handler with count =3D=3D 0. Should we
verify that count > 0 before issuing the I2C command?

Is locking required here to prevent races with other device accesses?

The hardware monitoring subsystem guidelines state that drivers must
implement locking (e.g., using hwmon_lock()) for attributes registered
outside the core, such as debugfs files.

If a write to this file occurs concurrently with the multi-step read loop
in adm1266_nvmem_read_blackbox():

drivers/hwmon/pmbus/adm1266.c:adm1266_nvmem_read_blackbox() {
    ...
    for (index =3D 0; index < record_count; index++) {
        ret =3D adm1266_pmbus_block_xfer(data, ADM1266_READ_BLACKBOX, ...);
    ...
}

could it clear the hardware buffer mid-read and cause corrupted data or
I2C errors?

> +
> +	ret =3D i2c_smbus_write_block_data(client, ADM1266_READ_BLACKBOX,
> +					 sizeof(payload), payload);
> +	if (ret < 0)
> +		return ret;
> +
> +	return count;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510-adm1266-v2=
-0-3a22b903c2f1@nexthop.ai?part=3D2
