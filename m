Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155393B893A
	for <linux-hwmon@vger.kernel.org>; Mon, 22 Jun 2026 14:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782137501; cv=none; b=reNx1Y5bxSYvzNGrTSg25dempZvyZO/rY1AlOVOEDR53KOCQklaxpCOS3hHJUc9G7eY0wFZBELr7CeI0e5/TFV2i27t28Nn3t/tKOkjqjM2bYABLlmhCgpzJFJP5Nq7MmNeaaNKeWoZiPrP2WvNd8wnvJgLndsCQs0BBdubmWwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782137501; c=relaxed/simple;
	bh=1kjTudxSH6+sPCaLB6FHXamXUAzfC5vfA0yl6X+Y+So=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g82iMx0JcIt1A+sYQgy1nVyfBhqFZfhQFLMKjvrVWDy1rWek4OBQ00GMqgz8Jv0Vb/mNCAVsD9jfcHV+avfmEbyMLEmv1S8q5ZDxfzKoXuDLwLU5zrOZE6eEyFeVKHTvKRnOjxvVNkgvr9JnILlyuXsANjJwrTNz61eLONKBof4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D1KNZOGP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D1KNZOGP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DFF21F000E9;
	Mon, 22 Jun 2026 14:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782137499;
	bh=tyqNl0s7tR68vZBXrzkBDDhhw9NL0q+xM0UK2weyuhQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D1KNZOGP6r8CaBRzMk1y1N/v5/BxWaa/YD9eRSIoMDF8SHGOagFbvSqd90BNXqaI+
	 LmVI20EweakL9nykLc06tmE7nU0BTTYTTIlf234JZ9vDC7kHnfJbfTo6A8tXidtWHY
	 ICQQ1MYD2Mc2XNG242F6bNOMwB5k4HTPjGYKvgflfpN7c/ca3KJGLltSNPV/AiROVD
	 /X7sJ1Z8SnAQLaAPc36QBeoTEcFfvoCvX3VvQ4FrwDCo2eRyWLr2s89jWCy0IWZvQ5
	 ldfgGSSNxM1tLVdEci2X+a6DFt9QsYj/YE8fyY4sTHb707N3FHUMPR9k/ffVyV8bag
	 wwu93fq7jS8KA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/8] misc: amd-sbi: Consolidate Common SBTSI Probe
 Path for I2C and I3C
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akshay Gupta" <Akshay.Gupta@amd.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260622135821.2190260-5-Akshay.Gupta@amd.com>
References: <20260622135821.2190260-1-Akshay.Gupta@amd.com>
 <20260622135821.2190260-5-Akshay.Gupta@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 22 Jun 2026 14:11:39 +0000
Message-Id: <20260622141139.8DFF21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The auxiliary device ID (`adev->id`) is set directly to the bus de=
vice address, causing sysfs naming collisions on multi-bus systems.
--

commit 30f30dcfe1c0110443187a8e9e5a7a6452445301
Author: Prathima <Prathima.Lk@amd.com>

misc: amd-sbi: Consolidate Common SBTSI Probe Path for I2C and I3C

This commit refactors the shared probe procedures into a new common
function, sbtsi_probe_common(). This consolidation ensures that I2C
and I3C probes can share the bus-specific allocation and device
configuration logic.

> diff --git a/drivers/misc/amd-sbi/tsi.c b/drivers/misc/amd-sbi/tsi.c
> index dfdd730b906af..a4c7e1be5624d 100644
> --- a/drivers/misc/amd-sbi/tsi.c
> +++ b/drivers/misc/amd-sbi/tsi.c
> @@ -84,25 +84,35 @@ static int sbtsi_create_hwmon_adev(struct device *dev=
, u8 dev_addr)

[ ... ]

> +static int sbtsi_probe_common(struct device *dev, struct sbtsi_data *dat=
a)
> +{
> +	u8 val;
> +	int err;
> +
> +	err =3D sbtsi_xfer(data, SBTSI_REG_CONFIG, &val, true);
> +	if (err)
> +		return err;
> +
> +	data->ext_range_mode =3D FIELD_GET(BIT(SBTSI_CONFIG_EXT_RANGE_SHIFT), v=
al);
> +	data->read_order =3D FIELD_GET(BIT(SBTSI_CONFIG_READ_ORDER_SHIFT), val);
> +
> +	dev_set_drvdata(dev, data);
> +	return sbtsi_create_hwmon_adev(dev, data->dev_addr);

[Severity: High]
This isn't a bug introduced by this patch, but is it safe to use
data->dev_addr directly as the auxiliary device ID here?

Looking at sbtsi_create_hwmon_adev(), it assigns adev->id =3D dev_addr. This
causes sysfs naming collisions on multi-bus systems. While the existing code
comment assumes unique static addresses per socket, this breaks down on
topologies where identical sensors reside on independent I2C controllers.

Furthermore, if an upcoming patch introduces I3C support and sets this
address from the I3C dynamic address, collisions are virtually guaranteed
on multi-bus I3C systems. When a collision occurs, device_add() will fail
with a duplicate sysfs kobject name error, causing the probe to
deterministically fail.

Should this be updated to use the ida subsystem (e.g., ida_alloc()) to
assign guaranteed unique auxiliary device IDs?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260622135821.2190=
260-1-Akshay.Gupta@amd.com?part=3D4
