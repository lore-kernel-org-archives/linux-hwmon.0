Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B2633BBCD;
	Thu, 10 Sep 2026 06:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789021868; cv=none; b=K3WKm7d01DoIgB8bPD7eaLNINJ3Hs9X7ocWLyUjHLxGiEEOtE54W3BjsFPQdpoBwF3mRGq3ujWimopO4Q7XFoPMplN4KbkxRI3qKLI814QlSAjfskZgtiXQJy940ONIr6vnarxEXOlZ9kt7iP5+kXD5i1x/QHCgz1uWxpS0mufQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789021868; c=relaxed/simple;
	bh=XPt/ZMV6fQTCtpTEpvUBwdx1DO7yY3PzULQf11vhq/c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ONTptH5umxNgGhVCSQMIvlFVCrg0JWsricR5j7wUeELeRWID14thdbsxggWt5aCIThUGNtu/qCyPCdkqKK06701V/nMbNqem8+fv/RzyYhZyI9hspHOOQ+ke61jwbNKNYfW4CWfEVyFZHv/BzMfMA6npLoGvm/sZSFD9UyrXBs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KrTpr/4X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KrTpr/4X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ADEB1F000FF;
	Thu, 10 Sep 2026 06:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789021865;
	bh=+Qcfe64i4YBT15C2r5+ZwdoiuWDP1+o5rGvD3i7WT1s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KrTpr/4X8xB+hWZyfqAi6LyRIUTclOCyOOsfVY77phX+pftXH/ubrLeZMB44snHB8
	 7FdS74TpAWkqJgKjgsTsdtSlAcrE6wFZHBrcuTBYoV2U80CwuAfJfRbytsJamBGuKN
	 QJU2nlUvyGTaaIq+m0IaCa2AO9pSnEMRklTj2rrry5ey1w/W56YdZpEvseuI/W82A4
	 At8WToXjG9sN8scrJYNOyKpVB4qb1BiiF7fEf+filLTh2KhURmlTUWh6UCDx6jmMjG
	 Kmi+98sDhhdnT6B6sLu1SCbxurT7b1mIjlUcZN59W+WcDsBx9fWVxms/WbsLQiCk7u
	 3SfFhEsxnlmhQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] hwmon: (pmbus/tda38740) Add driver for Infineon
 TDA38740/TDA38725
Reply-To: sashiko-reviews@lists.linux.dev
To: "Colin Huang" <colin.huang2@amd.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260910-add-tda38740-and-tda38725-v3-2-3e87637da3d6@gmail.com>
References: <20260910-add-tda38740-and-tda38725-v3-0-3e87637da3d6@gmail.com>
 <20260910-add-tda38740-and-tda38725-v3-2-3e87637da3d6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 06:31:04 +0000
Message-Id: <20260910063105.0ADEB1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The driver intercepts PMBUS_READ_VOUT to apply `vout_scale_micro` =
but fails to scale VOUT limits during reads and completely omits a write ho=
ok, leading to dangerous unscaled hardware writes.
--

commit 1abfb85e1a82a16c8ba7229d3c9657b7d232835d
Author: Colin Huang <u8813345@gmail.com>

hwmon: (pmbus/tda38740) Add driver for Infineon TDA38740/TDA38725
   =20
Add a PMBus driver for Infineon TDA38740 and TDA38725
single-voltage synchronous buck regulators.

> diff --git a/drivers/hwmon/pmbus/tda38740.c b/drivers/hwmon/pmbus/tda3874=
0.c
> new file mode 100644
> index 0000000000000..df5173d8da0c1
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/tda38740.c
[ ... ]
> +static int tda38740_read_word_data(struct i2c_client *client, int page,
> +				   int phase, int reg)
> +{
> +	const struct tda38740_data *data;
> +	int ret;
> +	u64 scaled;
> +
> +	if (reg !=3D PMBUS_READ_VOUT)
> +		return -ENODATA;

[Severity: High]
Does this bypass software scaling for all VOUT-related limit commands?

By returning -ENODATA for anything other than PMBUS_READ_VOUT, the PMBus
core falls back to unscaled hardware reads for VOUT limits (e.g., in1_crit
or in1_input limits).

Should this function also scale the limit registers when they are read?

> +
> +	ret =3D pmbus_read_word_data(client, page, phase, reg);
> +	if (ret < 0)
> +		return ret;
[ ... ]
> +static int tda38740_probe(struct i2c_client *client)
> +{
[ ... ]
> +	memcpy(&data->info, &tda38740_info, sizeof(tda38740_info));
> +	data->vout_scale_micro =3D vout_scale_micro;
> +	data->info.read_word_data =3D tda38740_read_word_data;
> +
> +	return pmbus_do_probe(client, &data->info);

[Severity: High]
Is there a missing write_word_data hook here?

Since the driver intercepts reads to apply vout_scale_micro, writes to limit
registers currently fall back to unscaled hardware writes.

If a user writes a 1.5V limit for a board with a 2x voltage divider, the PM=
Bus
core writes 1.5V directly to hardware without scaling. The hardware then
regulates or triggers a fault only when the pin reaches 1.5V, which corresp=
onds
to 3.0V on the board, potentially causing physical damage.

Could we add a write_word_data hook to ensure VOUT limit writes are scaled
correctly?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-add-tda387=
40-and-tda38725-v3-0-3e87637da3d6@gmail.com?part=3D2
