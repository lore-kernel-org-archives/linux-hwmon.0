Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E52217F27
	for <linux-hwmon@vger.kernel.org>; Tue, 13 Oct 2026 13:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896558; cv=none; b=qugF8XWG6XW7CUami6T/hsAT/PTSu1k7j4eIWnjK0ziK2xwtvNiwGYmmvXwmrZDeBS7TvZQBiVmy1p6IvEHlf5qEtOBYIx4nfVTKfeGR+/s/Ns5qsNhjWUaw7HifOHPsXjUCt1OtQ6EQ+qUuwlCaWFB8wzkY6LF7VzvrYCeKCIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896558; c=relaxed/simple;
	bh=TWR0tVAISI/KPl9mqaK/91CMjhweDfFe/qg5/kTwmIw=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date; b=gj3zzzJoPYoZXGEH2kwsplMzIXQM8hPOubsVQYWAZaovA/Zi0WyTAmZnfsUiy0FsIZLhifIv3juxWW0LLqNLkagkVdKfuGoYhFjb7zdUsZr2Rui3H28FRuKwNeUp2PcsECXW0hqb3WRjiD4DjUOAj4zQj6Xx9jIZQqtR61aUNBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ws/jXFEd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ws/jXFEd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 761A21F000FF;
	Tue, 13 Oct 2026 13:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791896557;
	bh=TWR0tVAISI/KPl9mqaK/91CMjhweDfFe/qg5/kTwmIw=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=Ws/jXFEdLkiNkrZU81WlDeWnnGMcBuYNFkYBikjF7+s+phP2LFU+cd12fqXyv5V2w
	 CpY1HHw85lU7pRRjzNWXlcql/49+EBneryZP7Fs+4zauYwMJ31l3nEvcwGVGCqFxju
	 p4ynxV1q17fKrGpaI4s8oP7RH2L76VON/pljhr3A6sBRj8BuoLkvix/vj2dnTACYHm
	 JHcy4G98lQ7wmCs3Mps2Uye93KpIucpUT5n5Sdh4g9gEdslavICTWI12AVlSWa8kvM
	 ZVvOZvKFGKDMLenO5aDVz5zQdMFaQAyDTkMunmu6p7Wi0U6gz9H2ta5Qadd9GAJ2cS
	 zzbYtu7W7cfvg==
Message-ID: <sashiko-outbox-169768@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/6] hwmon: sparx5: add LAN969x fan monitoring support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Marko" <robert.marko@sartura.hr>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261013125735.1542349-3-robert.marko@sartura.hr>
References: <20261013125735.1542349-1-robert.marko@sartura.hr>
 <20261013125735.1542349-3-robert.marko@sartura.hr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 13:02:37 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> LAN969x contains a tachometer input alongside its Sparx5-compatible
> temperature sensor.
>=20
> Use match data to map and initialize the additional fan controller
> register region only for the LAN969x hardware-monitor compatible. Read
> the optional pulses-per-revolution property from the fan child and expose
> the measured speed through fan1_input.
>=20
> Leave existing Sparx5 and LAN969x temperature-only device trees
> unchanged.
>=20
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013125735.1542=
349-1-robert.marko@sartura.hr?part=3D3

