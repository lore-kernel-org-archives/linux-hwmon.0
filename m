Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303C127AC31
	for <linux-hwmon@vger.kernel.org>; Fri, 16 Oct 2026 03:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792120731; cv=none; b=TcQ38d6qpjJq7+vNVZPsFbef27+lqRT4uFsnsGDRNEEu3h00YfnyyfzHBbw1E3nN+sYYU0C5Wr8w1M9BGGiiUDCeH3jmhtmdAt3OEqWW/ObdnmyCUnhiCIhTRr/msJqnZJU6WVKa0DQdozS1PpjkMLEuNh9FSoP43ldSan2hC0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792120731; c=relaxed/simple;
	bh=QSi2XbzPFGU4Gurl//8WN0QHNabwKNnFTbK8MTz2TIg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=MkrFSJnGLF2NSMr6YJWAmeu9hCuWNCxjOwIaRBdqR9DawYqYtyEqA9k+1kR5UHp9j/n6fXUK6XDmweP1YYr9RY3r2AKNxRGR7TnxBidVvoGTkAy1qAVfeDTVebUMTuaENjhep0WrJ5ujzBYAWXBfmgyGL9syEEdA9Ihp0odCouU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Udnq2YJ0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Udnq2YJ0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9854A1F000C4;
	Fri, 16 Oct 2026 03:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792120729;
	bh=QSi2XbzPFGU4Gurl//8WN0QHNabwKNnFTbK8MTz2TIg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Udnq2YJ0SOsqPsKz+kKXBoIPgjZ3tcG9MFL6baeW0o2xCVGINfgqKdsgnrCcNHizt
	 K/vkbzq64AF2VOP+dmhyv0w4dQY7aFaL46suc9zUOgkdmK9ImpwsihPBCzY1Ls+Cf9
	 McN7y0sEqUtfNcOQCF5tiyPLpD4raH+AkDIXYdFJ1J2UBuqp8CgEo0FIVJVF0dgHBn
	 I32fM0uy5S5hVE1ysCQr56kCel8uHfTMLmHGvQGJrNhcOmE/b61y5HH2uCu2Kv5KiN
	 zWoHO4agQu+MNQHBTX9/Gk3TsUsXd9BBQiZiLudXy3BO6aTVjnwTA9qk//04cU9Tad
	 SqZaxCIHHak1w==
Message-ID: <sashiko-outbox-173661@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (sht15) Stop deferred work before releasing its
 resources
Reply-To: sashiko-reviews@lists.linux.dev
To: "Myeonghun Pak" <mhun512@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261016030749.3689266-1-mhun512@gmail.com>
References: <20261016030749.3689266-1-mhun512@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 03:18:49 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> A measurement can return while read_work still accesses GPIOs or
> re-enables the IRQ. Regulator notifications can likewise leave
> update_supply_work using the regulator after it is released.
>=20
> On removal and the applicable probe error paths, disable and drain
> read_work before freeing the IRQ. Unregister the regulator notifier
> before canceling update_supply_work.
>=20
> This issue was identified as part of our ongoing research while
> reviewing kernel code.
>=20
> Fixes: 251eb40f5ccd ("hwmon: sht15 humidity sensor driver")
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016030749.3689=
266-1-mhun512@gmail.com?part=3D1

