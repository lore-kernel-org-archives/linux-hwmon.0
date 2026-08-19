Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC5B37BE93;
	Wed, 19 Aug 2026 19:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787166660; cv=none; b=p7jGLmvQrmJGH95quQtZvOPW2igFrwOQi/68rxMPZRNSJS0mUFiyTVibphLxj+pUoFNUSH9EX1KVltFhLbp4ypfLt23weTAwbGg2T0EsJwq7+WbrOIH7DPfqEu4g/KALiA1O3nwpDZlwp/TibouDKfNySbzm5BkikJUlqvSNnEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787166660; c=relaxed/simple;
	bh=LPsjONqnYnyXVFnsGxnJsbh3Og7pqBrxusK/FenCw4Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SGdAJp9ZbxgnV8/NrMCB3gkfWn6KlQj+wtrE1fvFfX8GaCAb4g02ldDmPnh10pum5mIK0hmz9HKndvOqyyG1SXlGmDKYEoXuw3EsxxMogL4u0/s2BCD4C3czajpkHZv3EPQxi/e+c3ceVeHo4Pu1cgmdHaWglastKp5DLN9Kv9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ibk8StY2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ibk8StY2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A3C81F000E9;
	Wed, 19 Aug 2026 19:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787166658;
	bh=Dcc723rn+1ttrxxNUtvg9nDjftZMomopk4bIpJuOrMg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ibk8StY2ockBu7UazXFHaX2glAlNiYwdxRBjtkbsg9jMTEm/oEmzHzt/1Us6DOpZV
	 iVQh6/8qE+rySLhMzNZmYrFWyrVLVImdaFyqZzoz1Pk7EOPtoS1g2RQ0kEjO1Dlxlz
	 m6Dslfw3160nBkzkT0NRuilKg+D3aJbCrRCS4yYklYSb+mTyXcFXLk0M3oweRWI5TD
	 yUTeN2WY6m8yDo6owXll+fEqck1yyDf6owOerG4avanhU9tGqj4oau4pZWf7rZcT/t
	 n/oLrWRWZj1irnPOScdwdBKEzoIz2kAhh1Yv0HJ6E4SjNiCqhn4JvmdJHBKWYW7+TG
	 WlxiDuO9SpVZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH treewide 1/5] clk: ti: Make sure clk_init_data is fully
 initialized
Reply-To: sashiko-reviews@lists.linux.dev
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: linux-hwmon@vger.kernel.org, neil.armstrong@linaro.org, linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org
In-Reply-To: <e6f52b34163c8e708c1100107b437af0b3b049a6.1787165329.git.geert+renesas@glider.be>
References: <cover.1787165329.git.geert+renesas@glider.be>
 <e6f52b34163c8e708c1100107b437af0b3b049a6.1787165329.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 19:10:58 +0000
Message-Id: <20260819191058.8A3C81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
>=20
> _register_mux() fills in init.parent_data, and assumes that
> init.parent_names is NULL.  However, the latter in uninitialized, and
> thus may cause a crash.
>=20
> Make sure all members are fully initialized, to fix such bugs, and to
> avoid future breakage when converting drivers to a different method for
> specifying the parents.
>=20
> Fixes: 667f420c09f1417c ("clk: ti: mux: resolve parent clocks by DT index=
, not by name")
> Closes: https://lore.kernel.org/CAMuHMdU3yVqoyHC4eNF2NuYo8wy+6ODLoYat4R71=
X99Mxc_=3Dkw@mail.gmail.com
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1787165329.gi=
t.geert+renesas@glider.be?part=3D1

