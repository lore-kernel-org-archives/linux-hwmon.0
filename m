Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485599;
	b=N/wWdtET02vtp3Sr+w+hm7Zp38aOLhzbzXyo22byP2YV6IPnKhdxUqX0nSQxo6Sjkb7e
	 Qd2bgl/yq7iQe9VPQhFiGFouxaN6pf86PfbsJSr6/U/lchgI1FhLZCV56JCCcnqqKODZ3
	 JxkFF+3p9uN61kziOiDMTkCUE/R2gLbHSm4oMKa2bjDzV/WU2LD89yRQiA096epAcOkc9
	 95Ds6GeEPCwAB4uM71dt6FsM80ItV+f4Dfodtph0aIAvhr/MMCDmOyFoH1lVnRRFU3y/y
	 0NqpNDszGWgt1MiHOhl+ODBGds8B/1pdx2EkYePfSQ92E6XeYNF8Q095QWirvkee00w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485599;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yeaRr+UZ45rJI/jCwW/yt7JWK9TcgA5/qqfSIXwd1t0=;
	b=AVIqbqIIn11gdkvfFEoQoiimCsZ47xmRQh0RKhMaFDzXVjl2rrQbHZaXGFiVSddeAndr
	 plEZfssgCqBSfis7SP5F1bt/Px+W/G8eiRsIMg1IjtpcHBYl2F+OqGc9sMzEVzvvFzDpu
	 2ABXZC7bAUnswdQFGoIuh3sx2LuVNUGIfxVf7rFIoxcpJ2c2WXXm2nTsCi/YxttkrvUgB
	 1fGR9xaOni9sCrwsdYSv900sMz2VeoNSRNw/MbbhOYFO3JfztO/b4AIQLuhiyRrbr42Pw
	 V5RwlpT1+LYCw6EuUB8OBCwQCI68A5A9VYX5eIuIXEZtspbChIjHA2JLJUdZIJ6Njcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NJyHnrYh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4471606A31F
	for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 08:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NJyHnrYh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C2541F000C4;
	Tue, 20 Oct 2026 08:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792485598;
	bh=yeaRr+UZ45rJI/jCwW/yt7JWK9TcgA5/qqfSIXwd1t0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NJyHnrYhvLROw90HBkr7iL6Dgg/IVJzEzgVjHXV5SFisZ/D+sn3cO61pUsmtb/2CF
	 WyyBZYPfFCqxRasOn/MumWd6BQ+fTcJVY6xCSIsSFwdgisThyXxOllXpokDMCzb+l+
	 WRrpCpM+hNa1R/kKNRxQHjEStErd8JgW9xcvaja2+7KJ2eVzn1bKluwUl7SVvCdSR0
	 WFniuKE0s/pbU6hHTCg/ZUWKbglOtTFsKqxosxgiqRA6DYnVpcPaQTVqdCXkzoXd0a
	 d8amTkUsklpbAMjjcNTKx++ZMKZmZ36ygy1HjX1qyzFt013trDdr/E3/yybvbOA6pc
	 NpMEApO48YNtA==
Message-ID: <sashiko-outbox-178592@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: vendor-prefixes: Add TDK
 Corporation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v2-1-3396c3a08251@nexthop.ai>
References: <20261020-hwmon-pmbus-fs1412-v2-0-3396c3a08251@nexthop.ai>
 <20261020-hwmon-pmbus-fs1412-v2-1-3396c3a08251@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 08:39:57 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Add the vendor prefix for TDK Corporation, the maker of the FS1412
> point-of-load regulator.
>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-hwmon-pmbu=
s-fs1412-v2-0-3396c3a08251@nexthop.ai?part=3D1

