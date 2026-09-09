Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B469D3939B6
	for <linux-hwmon@vger.kernel.org>; Wed,  9 Sep 2026 22:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788994682; cv=none; b=Osk2B1PyEKHh4LQxQuVrCYfIZhNfaU90mJ9/GAPZ46pMEGIdoChIQkxmu9Hnyny3JfeBaqMjViwdsx4wyrDqB6IWbtfyVQ6kTwuLXYNTWx0PnEbmySou66rr13oBalj055leeuPW+nKz1lmiz2JbhwkoqZOI/gxswR7X6x7T76U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788994682; c=relaxed/simple;
	bh=VVw+tXLBW9KeVi8qZgkr/TbXEDvpCSTdrh5VXxDHSFc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gKQ6n6TYfyhnDh+smq6cwBOmpbdVuvtoShgWPSHQExBnU84x3vLuFjkF6Hxlb+NEXf/dhJax/VdROgn+Ma8DhC5z7revc+NP25+bauXnV/pOd4Jret6/O2JYOqBn5FqnhVBEBBj5tCNtTmkxpZT3ft6TpKG7QmTiOUj6LVNoUBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B85e2U/Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B85e2U/Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62C951F000FF;
	Wed,  9 Sep 2026 22:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788994676;
	bh=S1fKoaMwJRrAknny56DqY/3PXChzk+1aifNqJu+03cA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B85e2U/ZqKWM+gAVGeE0gyJ9yP4sxXQ7116+oJnNFUZRKFIGDX0tNcr2FjErIXtbT
	 OGIhxba/QXQqp5Y5qLncviPRG57w22j0x+ZoiMUENjf4uWJYWnsuO3v+22T/ZFS0/Y
	 idEXH9SBLlfKvofhWL+tI2Pveq02dgWIf5DNbcsXp+ZAfLlej+Jzcyb7hVyStLm7tN
	 c9993JzIrImMCOmbz8YiIGaZg0hGd4Hn/7kb7woyT8JMcajX0CI3cHeAmVwlJG7BS8
	 1OF09M0zbfLwZmUx7PPiojEXirSZiMdFEKNLQ9Oe5+UXE+iWHyqh35k4yiCq8K+ivH
	 7gYU8USJfL95w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 3/6] eth: fbnic: cache hwmon sensor readings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zinc Lim" <limzhineng2@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260908225737.3034403-4-limzhineng2@gmail.com>
References: <20260908225737.3034403-1-limzhineng2@gmail.com>
 <20260908225737.3034403-4-limzhineng2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 22:57:55 +0000
Message-Id: <20260909225756.62C951F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Hardware monitoring functionality is implemented directly within t=
he network driver instead of as an auxiliary device in drivers/hwmon/.
--

commit 4fa7201fcb9ec899fe4c2586948bbac1ad1bc36d
Author: Zinc Lim <limzhineng2@gmail.com>

eth: fbnic: cache hwmon sensor readings

This commit adds a caching mechanism for hardware monitoring sensor readings
to reduce the number of firmware mailbox messages. It seeds the cache with
a sentinel value and caches both temperature and voltage readings returned =
by
a single firmware response.

> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c b/drivers/net/=
ethernet/meta/fbnic/fbnic_hwmon.c
> index 38bb26cb8e6cb..c8e7ff1d36fc1 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
[ ... ]
> @@ -107,6 +118,10 @@ void fbnic_hwmon_register(struct fbnic_dev *fbd)
>  	if (!IS_REACHABLE(CONFIG_HWMON))
>  		return;
> =20
> +	/* Seed cache with sentinel so the first read always refreshes. */
> +	fbd->hwmon_cache.temp_mdeg =3D FBNIC_SENSOR_NO_DATA;
> +	fbd->hwmon_cache.volt_mv =3D FBNIC_SENSOR_NO_DATA;
> +
>  	fbd->hwmon =3D hwmon_device_register_with_info(fbd->dev, "fbnic",
>  						     fbd, &fbnic_chip_info,
>  						     NULL);

[Severity: High]
This isn't a bug introduced by this patch, but is a pre-existing structural
issue that was explicitly flagged by the subsystem guidelines.

Should this hardware monitoring functionality be implemented as an auxiliary
device driver residing in drivers/hwmon/ instead of directly within the
network driver?

The hardware monitoring subsystem guidelines state that for devices where t=
he
main functionality is not hardware monitoring (such as a network interface
controller), its hwmon functionality must be implemented as an auxiliary
device driver in drivers/hwmon/. Registering the hwmon device unconditional=
ly
here in fbnic_hwmon_register() using hwmon_device_register_with_info()
bypasses hwmon maintainer review and breaks subsystem layering.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908225737.3034=
403-1-limzhineng2@gmail.com?part=3D3
