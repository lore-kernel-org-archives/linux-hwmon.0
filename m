Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066C0499F04;
	Wed, 19 Aug 2026 19:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787166893; cv=none; b=AHV40rt0295InR16B0fL0q3p0nyZXTvqeR+1dFrb4FEQM8Qr18xa0OhvF+EbdE5SgESX2ZL6sf5dnzA+yzXqdJ6d+N7Wk3uEexV/w34jsUf6Jr1yGzVuwkv49noZVcFBBhGn9qr2O5GK2ddKW4kvursxVEKJAT9VATnK7WlhxTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787166893; c=relaxed/simple;
	bh=LbH7kn88/xKq8MnEbDSrscOZlbpSyREdZR1tJGJWQFk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PTpAWTMuyxLF/2rYT8aoFw6KMjyvtfJR9EiXbJbT6tBMk+0JG1G2qpnRinQh15+rllOsEnqLgtkJJzHBedkC24K1sYMVRC0jVuNjMNka7vFby02kd1Cn62u3I036h0UcJxYzxFNPL7C578FXrsFSwfxswpG2pkFulUdDCGFTYvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M+03ggsc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M+03ggsc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C8A91F000E9;
	Wed, 19 Aug 2026 19:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787166889;
	bh=5gWeIj/0e14fYOrOsZrZtjZfZ/2+j7qPQ9iKAH6by/E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M+03ggscnWlxK0ufvE1a+wvl8PkAOVwc2hh8bjdqTn2R1lSOhSH3HPiCvySV1SOZ6
	 TW6Y/F4S+IANZ2VhvqWLiKUYVnn455S5igLwYYuzxgB5sXvcDeq8a66Qb9Ij9t+6OK
	 tM6z013lM/XkOl8HEsbPnpkoFGukUDfi1bSQ3s99pIGbmJ9Kg3VHw9zbA4MbtWkNJ5
	 HOSHeLWMS2S+8Euy6RWUSOldARL+qUKQsrYNZ0HpaJorTN79on7ElHrssdU9g+AXPG
	 aF2zymTEHPBn2TgWmj7udETh9grFMC4gINesa/vSuDOF3VI12atfl1ft+nkhCQzCSo
	 ko/3GWR+P6Tuw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH treewide 2/5] clk: visconti: Make sure clk_init_data is
 fully initialized
Reply-To: sashiko-reviews@lists.linux.dev
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: linux-clk@vger.kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, linux-hwmon@vger.kernel.org
In-Reply-To: <42dd7be99acbbea1343e2fcc0ba4ffb91f8517ca.1787165329.git.geert+renesas@glider.be>
References: <cover.1787165329.git.geert+renesas@glider.be>
 <42dd7be99acbbea1343e2fcc0ba4ffb91f8517ca.1787165329.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 19:14:48 +0000
Message-Id: <20260819191449.3C8A91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] visconti_reset_status() incorrectly uses the bit index directly in=
stead of a bitmask, resulting in corrupted status checks.
--

--- Patch [2]: [PATCH treewide 2/5] clk: visconti: Make sure clk_init_data =
is fully initialized ---
commit 61772ea3c610a3b3ebf435b199e400c1c5aaee4c
Author: Geert Uytterhoeven <geert+renesas@glider.be>

clk: visconti: Make sure clk_init_data is fully initialized

The clk_init_data structure contains several mutually-exclusive members for
different methods to specify the possible parents of a clock. Not
initializing all members may cause subtle issues when uninitialized members
are unexpectedly accessed. This commit ensures all members are fully
initialized to zero.

> diff --git a/drivers/clk/visconti/clkc.c b/drivers/clk/visconti/clkc.c
> index d0b193b5d0b35..4018d1298880d 100644
> --- a/drivers/clk/visconti/clkc.c
> +++ b/drivers/clk/visconti/clkc.c
> @@ -81,9 +81,9 @@ static struct clk_hw *visconti_clk_register_gate(struct=
 device *dev,
>  						 u8	rs_idx,
>  						 spinlock_t *lock)
>  {
> +	struct clk_init_data init =3D {};
>  	struct visconti_clk_gate *gate;
>  	struct clk_parent_data *pdata;
> -	struct clk_init_data init;
>  	struct clk_hw *hw;
>  	int ret;
> =20

[Severity: High]
This is a pre-existing issue, but while reviewing the visconti clock and
reset driver changes, I noticed a potential problem with how rs_idx is used.

In drivers/clk/visconti/reset.c:visconti_reset_status():

	spin_lock_irqsave(reset->lock, flags);
	ret =3D regmap_read(reset->regmap, data->rson_offset, &reg);
	spin_unlock_irqrestore(reset->lock, flags);
	if (ret)
		return ret;

	return !(reg & data->rs_idx);

Is this reset status check operating as intended? Since rs_idx is a raw bit
index (0-31), would it be more accurate to mask the register with
BIT(data->rs_idx) rather than the raw index value?

Masking with the raw index seems like it could produce incorrect status
returns. For example, if rs_idx is 0, the mask would always evaluate to 0.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1787165329.gi=
t.geert+renesas@glider.be?part=3D2
