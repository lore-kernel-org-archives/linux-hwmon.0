Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130AE3EE1C0;
	Tue, 14 Jul 2026 08:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784018090; cv=none; b=GL8GjE0gr1n+fesIvfNX8+D/CFqG0IMgV59SbI4Jl5QiVMC4rdqqC0zc9riy2xNehBrBmGGXnBxdngXjGfdMnEQcVhUmkEI/JpG0KQPEt8T2Lraqwn+/7LjYXh1FbOb3eKL1Jq5yTcb3sQVQMG4abTqCQ87TfHVtG39KR51Ny2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784018090; c=relaxed/simple;
	bh=DjfBhZQY1sM3lLMx4HqDC14ZO5aSdTBvc3y/h0eLb2Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ohBdv9mOzBMJwuKbcrEo8h6ytBS1s3AZ36/lW5KYuzALlYrnbnNcgJzYkPk7uckLGFO1cc4QPRRBFwaXYTJBGacZUDTReXtolYhPalifTi07AhuBiyr/gn2XqyP/CHW63Vd2Y8MY1vu1wF3qsf1JpdW3G0IdSu7kAfNsK7E4Rf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gSaMmeaV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gSaMmeaV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 212131F000E9;
	Tue, 14 Jul 2026 08:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784018085;
	bh=uWMLZJHeSuMasF4XDe7NHbd4TAcMov02TtIOov+he+0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gSaMmeaV2/UFnD2FnV1ic4WMh+XL9kWWKOv1OID46PkOvv66nW3LBwj1DEfWZw9yX
	 WKaABQ2qgIRn7GuahoB/vfPWXQuUdlxcPZkN+T6CWgseIltXIW1th97wgOqC3vOymF
	 3/gj5pHThT1UAQgQPaIUqDIUJFNWhzNlC0aTAqx1ce+ppkngyoUlyVNFQ3gLcnHR/u
	 661FPX7ug2v2ae9rLET+gVHmiN1PbLETtgyeB8PPC1+mhWPKtWn2xi+3Oo8vNueUsR
	 rDebMNJBnHhN3fHyqh7v7yMUxRhd6vR2KxJhU0Q29wtxuxdZnBE3u4bYngbuCQwym6
	 HIN4zwNn/yoUA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] hwmon: (kb9002) Add documentation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andy Chung" <Andy.Chung@amd.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260714-kb9002-upstream-v1-4-8fd2f0b135d8@amd.com>
References: <20260714-kb9002-upstream-v1-0-8fd2f0b135d8@amd.com>
 <20260714-kb9002-upstream-v1-4-8fd2f0b135d8@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 08:34:44 +0000
Message-Id: <20260714083445.212131F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The driver uses a private mutex instead of `hwmon_lock()`, viola=
ting hwmon core guidelines.
- [Medium] The driver unconditionally requires `I2C_FUNC_I2C`, permanently =
breaking support for SMBus-only controllers.
--

--- Patch [4]: [PATCH 4/4] hwmon: (kb9002) Add documentation ---
commit 929a2de2e63d6d8333f36707bf6da054f63aeab6
Author: Andy Chung <Andy.Chung@amd.com>

hwmon: (kb9002) Add driver for Kandou KB9002 retimer

The Kandou KB9002 is an 8-lane PCIe 5.0 retimer that exposes an SMBus
target with mandatory PEC. Add a hwmon driver reporting the firmware
aggregated maximum die temperature as temp1_input, with the firmware
version and boot status under debugfs.

> diff --git a/drivers/hwmon/kb9002.c b/drivers/hwmon/kb9002.c
> new file mode 100644
> index 0000000000000..2a3dffe52a62f
> --- /dev/null
> +++ b/drivers/hwmon/kb9002.c
> @@ -0,0 +1,473 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later

[ ... ]

> +struct kb9002_data {
> +	struct i2c_client *client;
> +	struct mutex lock;	/* serialises register accesses */
> +};

[Severity: Medium]
Does using a private mutex instead of hwmon_lock() violate the hwmon
subsystem guidelines? The guidelines mandate using hwmon_lock() and
hwmon_unlock() to serialize attributes registered outside the core,
such as debugfs, with sysfs and thermal operations. By discarding the
hwmon_dev pointer returned during registration, the driver cannot
correctly call hwmon_lock().

[ ... ]

> +static int kb9002_fw_read(struct kb9002_data *data, u16 reg, u32 *val)
> +{
> +	struct i2c_client *client =3D data->client;
> +	u8 addr[2];
> +	u8 rbuf[I2C_SMBUS_BLOCK_MAX];
> +	int ret;
> +
> +	put_unaligned_le16(reg, addr);
> +
> +	mutex_lock(&data->lock);

[Severity: Medium]
This isn't a bug in the locking logic itself, but shouldn't this code use
hwmon_lock() instead of the private lock to serialize I2C/SMBus accesses?

[ ... ]

> +static int kb9002_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct kb9002_data *data;
> +	struct device *hwmon_dev;
> +	u32 vid;
> +	int ret;
> +
> +	if (!i2c_check_functionality(client->adapter,
> +				     I2C_FUNC_SMBUS_BLOCK_DATA |
> +				     I2C_FUNC_SMBUS_PEC | I2C_FUNC_I2C))
> +		return -ENODEV;

[Severity: Medium]
Does unconditionally requiring I2C_FUNC_I2C prevent the driver from binding
on SMBus-only controllers?

Raw I2C functionality appears to be used only in a fallback path
(kb9002_enable_smbus_target()) to switch the device out of raw-I2C mode.
By mandating it upfront, the driver unnecessarily denies service on
legitimate SMBus-only systems where the hardware is already configured
for SMBus mode.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-kb9002-ups=
tream-v1-0-8fd2f0b135d8@amd.com?part=3D4
