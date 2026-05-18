Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF97541C2F3
	for <linux-hwmon@vger.kernel.org>; Mon, 18 May 2026 12:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779108070; cv=none; b=QNCm6kpfNMveY6OcsmixjhciQ2bxsMDYA5JeRbY8mN2o59WPhli6E5aFw5o4aCQmliV+5Cjt/fklKXzmbxCK4xFzzTGRdvdptVIt6e07HukalGxz4GJG2whv9BfCnlnPBcf9s7Ht5vIq0nm8gaIhNvJEx6A2/0s+uhAH/75FfSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779108070; c=relaxed/simple;
	bh=tx9NkS+I8fqIhMmmFfEtn5idwpXo7OCEAnSmOp/YZV0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a43IVvU8xENvTscL2xi+hZRatvO2iH1CbV87XD70t3wkGyGkrTahjo70gajw1344z3nFZ9bgxffog6aXRYBC7LG1Fnv4JKiWEEd3kgOq3du/Y1ryDRpGAUD+vQyFpWJgaaGpujXSV4NSMSDFsq+GtQXcJCNPGIgY+U+3GDaTvl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W2GW/dml; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W2GW/dml"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEEA9C2BCB8;
	Mon, 18 May 2026 12:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779108069;
	bh=tx9NkS+I8fqIhMmmFfEtn5idwpXo7OCEAnSmOp/YZV0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=W2GW/dmlGyRg4AHIzLXnCpNSUvCTNruGsavfB98kJFJ80bkU2FpRZGz8oyIC+Z5NA
	 gMNjqrZ3tl6Yk7EZfnb39gdp9SIKT9XzCoHzVYIu7metqZTjRuk5ASpOc0aABD9g2a
	 sDMWEjZ6p22t3s1z/4ZU6SeHOEgk8PjLacr4sDj475HEBtkVp2P3uL66B8sa0npsR+
	 P4aGcUMZW5uuYMUacL5rbE8tV/bJ691BK7T7aiH48stSj6g+D781FHoAi/kO0So6PR
	 aGH3Vd/wacAJmXuf53gWq5JILlfWLGDDIJYiGri/I3ZtYLkOIeQ1v7LKT0pPzOULGW
	 UI9cZQg+D4RGA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (tmp102) Drop unnecessary __maybe_unused
Reply-To: sashiko-reviews@lists.linux.dev
To: "Flaviu Nistor" <flaviu.nistor@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260518122210.10288-1-flaviu.nistor@gmail.com>
References: <20260518122210.10288-1-flaviu.nistor@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 12:41:09 +0000
Message-Id: <20260518124109.BEEA9C2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Removing `__maybe_unused` without also removing `of_match_ptr()`=
 resurrects a build warning on `!CONFIG_OF` builds.
--

commit 48f4abeb993e88df34017f1f7dacc66c48dc3d0e
Author: Flaviu Nistor <flaviu.nistor@gmail.com>

hwmon: (tmp102) Drop unnecessary __maybe_unused

The commit removes the __maybe_unused annotation from the tmp102_of_match
array. It states that the array is used unconditionally in tmp102_driver.

> tmp102_of_match is used unconditionally in tmp102_driver, so there is no
> need for __maybe_unused.

Is this description accurate? Looking at tmp102_driver, the array
assignment remains wrapped in the of_match_ptr() macro:

static struct i2c_driver tmp102_driver =3D {
	.driver.name	=3D DRIVER_NAME,
	.driver.of_match_table =3D of_match_ptr(tmp102_of_match),
	...

When the kernel is compiled with CONFIG_OF disabled, of_match_ptr()
evaluates to NULL and tmp102_of_match is left completely unreferenced.

> diff --git a/drivers/hwmon/tmp102.c b/drivers/hwmon/tmp102.c
> index 3aa1a3fbeaa92..23f66f70d5a9a 100644
> --- a/drivers/hwmon/tmp102.c
> +++ b/drivers/hwmon/tmp102.c
> @@ -400,7 +400,7 @@ static const struct i2c_device_id tmp102_id[] =3D {
>  };
>  MODULE_DEVICE_TABLE(i2c, tmp102_id);
> =20
> -static const struct of_device_id __maybe_unused tmp102_of_match[] =3D {
> +static const struct of_device_id tmp102_of_match[] =3D {
>  	{ .compatible =3D "ti,tmp102" },
>  	{ },
>  };

Does this removal resurrect the -Wunused-const-variable build warning
on !CONFIG_OF builds?

To safely drop __maybe_unused and make the usage truly unconditional,
should the of_match_ptr() wrapper also be removed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518122210.1028=
8-1-flaviu.nistor@gmail.com?part=3D1
