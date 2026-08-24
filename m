Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8833859DF;
	Mon, 24 Aug 2026 18:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787597418; cv=none; b=ESOvK+S/p/oNNkZEcTPSTOE/v4VYWEFEEVMnrx2cep+3eLfMViTKTCzUDbOFN+tVdGIMILthlxr3BMHoUJOLthJexNQfb2WA5yCq5Q0oHLkUOAhxu/pgynbgblpmwQMc4tbqBN6UkeBHPmWdpFZ15mERWiLZ3iMD9bgU2TxRxFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787597418; c=relaxed/simple;
	bh=kteYizVa0NhEB1/u76aL61O6seX1deWa8kud/Ose5v8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i2b+EUMbbNUH6U7QLnd7Lwp/Vgta/6vjuBdK10V/xVbRoSszMMhnIfsgzLObgHfDbNDqTgeBTre9rvfexgv4DBsy9W2HXHAGSRTb09p8tAyrLnRscUmtJ93n7YHrXmHtNm7yzbiASo/+0hbL+CD1GcTFKTKN5dfQsou8bFwUML8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O8KlB8v5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O8KlB8v5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 541E51F000E9;
	Mon, 24 Aug 2026 18:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787597416;
	bh=JLLa0V7ArszBwHQZirdy5sjsLynh1NI1QtQiMIxweLA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O8KlB8v5ULk7kyWndBwmsPc6pqIfJKZjl85QQ7VfO6HDfm0SpOcwL3JfegTkz8wFV
	 sl6pQ0fpAnjfZwhtEPs3UaTiF5fUuWrBHsbnGsMuI//qbmsnPvuM8oBMbytfU9akAI
	 JqbeIJR/3cTK5fxCBw285H176yMVP3TkaYWS4UmSm80Vb/Cd5THPXlXuubqWCYuW37
	 ueAhCwWLpVRPS1v+8BmG8Et/89RTKmSSjNfPyL4Yl/H71K+ZwRZNyRUr1wcS9cqtu+
	 i/7gqo1DJeeLJDqKdaxPtXhfoohVDxi5VyOuo6jPbBR3FLNMc5/Ce4xrEcL2oTgHj2
	 n2eh1OkjM558A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: (lm90) Reject channel 2 on chips with only
 one remote sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Flaviu Nistor" <flaviu.nistor@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260824183900.8983-3-flaviu.nistor@gmail.com>
References: <20260824183900.8983-1-flaviu.nistor@gmail.com>
 <20260824183900.8983-3-flaviu.nistor@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 18:50:15 +0000
Message-Id: <20260824185016.541E51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Setting the temperature offset for channel 2 during probe clobbers=
 the device's hardware configuration register because `data->config` is use=
d before it is initialized.
--

--- Patch [2]: [PATCH 2/2] hwmon: (lm90) Reject channel 2 on chips with onl=
y one remote sensor ---
commit dbe7fc3f39616fac014beb08a22b533d36d4c54b
Author: Flaviu Nistor <flaviu.nistor@gmail.com>
Subject: hwmon: (lm90) Reject channel 2 on chips with only one remote sensor

This patch validates firmware channel definitions against chip capabilities
and returns -EINVAL when channel 2 is configured on devices with 1 remote
channel.

> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
> index 1c603272538aa..3faeb2c6ab01b 100644
> --- a/drivers/hwmon/lm90.c
> +++ b/drivers/hwmon/lm90.c
> @@ -2712,6 +2712,11 @@ static int lm90_probe_channel(struct i2c_client *c=
lient,
>  		return -EINVAL;
>  	}
> =20
> +	if (id =3D=3D 2 && !(data->flags & LM90_HAVE_TEMP3)) {
> +		dev_err(dev, "channel %d is not supported for this chip in %pfw\n", id=
, child);
> +		return -EINVAL;
> +	}
> +
[Severity: High]
This is a pre-existing issue, but I noticed a potential problem when channe=
l 2
is valid and has a temperature offset configured.

In lm90_probe(), lm90_parse_channel_info() is called before
lm90_init_client(). If the device tree specifies the property
temperature-offset-millicelsius for channel 2, it invokes
lm90_set_temp_offset() further down in lm90_probe_channel().

For channel 2, lm90_set_temp_offset() calls lm90_select_remote_channel():

drivers/hwmon/lm90.c:lm90_set_temp_offset() {
        ...
        /* For ADT7481 we can use the same registers for remote channel 1 a=
nd 2 */
        if (channel > 1)
                lm90_select_remote_channel(data, true);
        ...
}

Because lm90_init_client() hasn't executed yet, data->config is still 0 from
its initial allocation. This causes the driver to write 0 directly to the
hardware configuration register, which might clobber the original
BIOS/bootloader configuration before it is ever read and saved.

Could this silently overwrite the chip's thermal alert masks or run states
during device probe on systems providing the offset property?

>  	err =3D fwnode_property_read_string(child, "label", &data->channel_labe=
l[id]);
>  	if (err =3D=3D -ENODATA || err =3D=3D -EILSEQ) {
>  		dev_err(dev, "invalid label property in %pfw\n", child);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824183900.8983=
-1-flaviu.nistor@gmail.com?part=3D2
