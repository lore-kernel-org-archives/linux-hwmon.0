Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80309350A05;
	Mon, 24 Aug 2026 22:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787609862; cv=none; b=kB0CzGD3m08ms2OcFd/vSqWPezHqyLO8qBc6D/mfTckyEzXYqIt8Vsb0Uj8sR+f3IYFobtUEYhUYNzDiWAZ9wfhdl1OUcz2/bvQanPdJSgC7zcp3ZKaVC/hfEH2IkVghddfhIoBDO3zIJwKhH82469T4F3/uMDFstEmA/I15OXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787609862; c=relaxed/simple;
	bh=oiKA4Iv5jE48394zc10Q9LdjZPcHPdfXCNEZBnZSdpk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=btGYfoAXci2mrqcuLU9Gl+4qKMnm/r46WvHJBXBO3+cQAFGHcdCuK5bKSbc3FAlxd6dNz7gdBmW5Uva60kSvgP5I9F/y8ESuEPbu3ett0F9WPisnHVgnJrZOAUfls05CIOFqXt9x3wFe/07AHfgfU5UAzg9eGHyYm+viiXnOqyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bk1/ve7f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bk1/ve7f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B08161F000E9;
	Mon, 24 Aug 2026 22:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787609861;
	bh=nnVzNDRQP36j5OEY66NP5xqug6Pk8zZOX9NrgHspxD4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bk1/ve7fgBj0mxKKf3URN3qAXOtQbIDi58mwl8KpnlfqYqdHzxdUnII2RsopTRK5k
	 Rt6xMwyjiPq6BTiDVaptvjKcIrvD3/a0V0TKCRXzfIgi6U82j+eWVzitgjxJ2INopI
	 H1vpeREARaYVWMReoNANUZIDKxHDUFIj/TA0e6t+gnCbfwdC688aPzS0FY30+ts/+l
	 iEDmLM0Z8dliFowozMndjhyTH2+wW4REJV6fTgLWLHZe7pariQoADwhJ9zYzMXH2k6
	 F//Dz00BrSLmaP/SxEFXNHPOQlCseNwdkQYyAFx2vs4JrFB6ZwGvNUjcF/DcQC5BrH
	 1n5Vk4acjr5ZA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dt-bindings: hwmon: ti,tmp401: add
 #thermal-sensor-cells
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260825-for-upstream-dt-tmp401-vcc-tsc-v2-1-cbc360ec51d9@free.fr>
References: <20260825-for-upstream-dt-tmp401-vcc-tsc-v2-1-cbc360ec51d9@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 22:17:40 +0000
Message-Id: <20260824221740.B08161F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Vincent Jardin <vjardin@free.fr>
>=20
> The property is missing, so a board that uses it with a thermal zone fails
> with dtbs_check:
>=20
>   tmp411@4c (ti,tmp411): '#thermal-sensor-cells' does not match any of the
>   regexes: '^pinctrl-[0-9]+$'
>=20
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825-for-upstre=
am-dt-tmp401-vcc-tsc-v2-1-cbc360ec51d9@free.fr?part=3D1

