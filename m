Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC91111CBA
	for <linux-hwmon@vger.kernel.org>; Sat,  2 May 2026 18:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777745983; cv=none; b=f+Qy0N1AcEQP0JR4xYAtUBd4zCNdM0osc0JZ9IKotoDf+762G2Bl6XvTqpFsoqjdZZoA11lFVXQhQ4w4J6QkDXGEHFQKr5G8PVIpHV5oQluwFxlTxosmIJtdndXA5voq+414EqKlsg0XeZuc8p1DND0KjP3tRokQX0xnp07KJao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777745983; c=relaxed/simple;
	bh=RxLFBRYkgk/QA3nC9iYvzs7LsPqgN8lCT66yeMMnAR8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FCXnxSkOIREBRLhIZ+GWplO4YPAnXAm+4EdvYMygoCvnb7BYZwnD9w6RIK78DYJyHmCi+uu2gf7De1koVgfNSbgyx3xdzAe6dihXB2KzHx+mamqxbA0F/bSxcaqY2J/E2ie46NJvb1b0oFTIziUq67KBY4p3i6dfVa3TWOoy1qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ORuq1M4r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ORuq1M4r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1857CC19425;
	Sat,  2 May 2026 18:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777745983;
	bh=RxLFBRYkgk/QA3nC9iYvzs7LsPqgN8lCT66yeMMnAR8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ORuq1M4rfZnuB39xM/5u83oI6HAfYuPEEja3iUjEaspyEf8+SM+cOfIDx+J4fbaWO
	 2N1NfohOasZwr8OITjy+EJxGTpyLG+349gjVvgTa+HNFhjqjKBF93zIegP+JfCmpco
	 mEEsgdsEZTsSQbRPKbMI73awcSnrtXexMdjkclxvmC8+t3hg/zOT2lwL+xx5oobKzC
	 AsL/9jcdbzxkarDdWqndo825CchMxzhkenR435+8iSPBO8+txwHKFRNAXjCQDffPzb
	 f8YoPLrJPCZbXvDNpXkQyy61W1VRRMqoKBYDwNkZcZHK/hp2mydkdapE4uoVbcIKS4
	 1ikfDw3TBQxZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] hwmon: (lm75) Fix configuration register writes.
Reply-To: sashiko@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260502173207.3567876-3-markus.stockhausen@gmx.de>
References: <20260502173207.3567876-3-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 02 May 2026 18:19:42 +0000
Message-Id: <20260502181943.1857CC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Applying this fix without correcting the 16-bit sensor masks cause=
s `tmp112` and `as6200` to be severely misconfigured during probe.
--

commit 0da1c5266106ec86191304203df47a352a002b92
Author: Markus Stockhausen <markus.stockhausen@gmx.de>

hwmon: (lm75) Fix configuration register writes.

This commit fixes a bug in lm75_write_config() where set mask bits not
defined in the clear mask were being dropped. It ensures both masks are
properly combined for the regmap update.

> diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
> index 7efcef7768cd..8b74cc314196 100644
> --- a/drivers/hwmon/lm75.c
> +++ b/drivers/hwmon/lm75.c
> @@ -353,7 +353,7 @@ static inline int lm75_write_config(struct lm75_data =
*data, u16 set_mask,
>  				    u16 clr_mask)
>  {
>  	return regmap_update_bits(data->regmap, LM75_REG_CONF,
> -				  clr_mask | LM75_SHUTDOWN, set_mask);
> +				  clr_mask | set_mask | LM75_SHUTDOWN, set_mask);

Will applying this fix without correcting the 16-bit sensor masks cause
sensors like tmp112 and as6200 to be misconfigured during probe?

I2C temperature sensors transmit and receive the MSB first, but
i2c_smbus_read_word_data() and i2c_smbus_write_word_data() read and write t=
he
LSB first. This causes the driver's memory representation of the configurat=
ion
register to be byte-swapped, with the sensor's physical MSB in the lower 8
bits and the physical LSB in the upper 8 bits.

The set_mask for tmp112 (0x60C0) and as6200 (0x10C0) are defined assuming
native byte order. Prior to this patch, the logical bug in
lm75_write_config() silently dropped the set_mask bits because they were not
in clr_mask, leaving the sensors at their power-on defaults.

By fixing the helper, 0x60C0 is actively written to the byte-swapped regist=
er
value. Due to the byte-swap, the 0xC0 byte is applied to the lower 8 bits
(sensor MSB) and 0x60 to the upper 8 bits (sensor LSB).

For tmp112, the device receives 0xC0 as its MSB and 0x60 as its LSB. Does
this configure the sensor to 11-bit resolution and 1 Hz sample rate instead
of the intended 12-bit, 8 Hz configuration?=20

Could the endianness of the masks for 16-bit devices be fixed simultaneously
to avoid this regression?

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260502173207.3567=
876-1-markus.stockhausen@gmx.de?part=3D2
