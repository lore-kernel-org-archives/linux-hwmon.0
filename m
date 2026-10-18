Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE6B2D738F
	for <linux-hwmon@vger.kernel.org>; Sun, 18 Oct 2026 04:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792299425; cv=none; b=k9ltx1G9MEtP+oWUe+S+9Us6vmuocsNNJI/XV/GixO18hazNJ9hwFR09JAzoiLbAiiBApNv4zQQu/nqLEfwqmGcXQqkMSEJy0iAqBb+93QxjS7mLoBWuAyZdfVGMKQlcMg9srm7tkw0TE62GcaewjHrqOM8NE7+Fsk9AKY4smwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792299425; c=relaxed/simple;
	bh=BlumoHc9AcJnM6Rj+S58WavvxQC/2LsKOsdkPevXAw4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=PJM4xH4evHLzf7/K0FKokUgq1tPQpNPKBXBiiY7XRlCGG1fSVMGMz3e+iUgAQj+6R1+XnM+WZ6tFRQQqxLolLCYOXi6qHUE/edQhhA71TIlFDueDn3VN1kxHKq4iVSziHU2RiGGFZMiw0ZrwZl/nAjGxqLh2DyM7V72E7O5n/Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U6nw9Tw/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U6nw9Tw/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A86B21F000C4;
	Sun, 18 Oct 2026 04:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792299423;
	bh=BlumoHc9AcJnM6Rj+S58WavvxQC/2LsKOsdkPevXAw4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U6nw9Tw/Am0z219lqjMZ+lvXYSF/fJYGj/UDuxqo3BwK8PfDmmXVvHXAjSzqIQvTr
	 7pBW9PIxq3EB30EsYJXp2+2TDDDKUzXIMnyTxsJdLx4VwMVCI1nSMk+MHNQqXuFa1H
	 Z0F6mR7IxGzPVIJrNOL5jXuh977ByMFmJ4/R8inyrcHULfUarMEkHvijJjZ8UQEaHq
	 Cs+SEli7OQ6ZVt+pW76WcD36LmkxYMy07Mge0VpbZBJ1mwwh2VEiJSp59DcPRvD/gE
	 I7POGLZTA6CVDVhnT1NxliTKEqTqItIymP1YUj1kAeu4AH2EUFMMjh3ggSxUR6CFvO
	 4r/50c2038dpQ==
Message-ID: <sashiko-outbox-175943@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Label the fans on Kobol
 Helios64
Reply-To: sashiko-reviews@lists.linux.dev
To: "Igor Velkov" <iav@iav.lv>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261018-helios64-fan-label-v1-2-69a3f96d4efa@iav.lv>
References: <20261018-helios64-fan-label-v1-0-69a3f96d4efa@iav.lv>
 <20261018-helios64-fan-label-v1-2-69a3f96d4efa@iav.lv>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 04:57:03 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Igor Velkov <iav@iav.lv>
>=20
> Name each fan after the header it plugs into, so that userspace can
> tell the two apart through the hwmon label attribute.
>=20
> Assisted-by: LLM
> Signed-off-by: Igor Velkov <iav@iav.lv>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018-helios64-f=
an-label-v1-0-69a3f96d4efa@iav.lv?part=3D2

