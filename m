Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A989338593;
	Tue, 28 Jul 2026 16:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785255588; cv=none; b=Yds/pBcr6hikP7sTpWUP7YW2w/SW3yTkgU9Cye9ttm9RQh+0ETGK5iomng7LS2r2zqWCSw4IBlUXgtZ+9jIVUD286Y+wB1VdMgVwDXIrHQpPM10HaayCzio9/yoMoV7duD5XeXxMNtaOr/x+ERUb8NQkUhYWVlkkAV8T7oe9VOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785255588; c=relaxed/simple;
	bh=pRFM2W+QHzaeOrdnHeLu9jo8QQD8fR0QCSiQjIgnJ9w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=adA+NDC/Q2ImdK4PyydRE4ERor8B1FihJ6aDuO9oxoHgWZahTkQFZmxutN5X2JEPQ7k4fiXG520ykQwGuVp6U4lW+QtMR+bljQ6N8qVCH2b22yaaP1Dtn8dXmOWnUSzRntTqHBBREYe2F7TmVpgsaZjSLcKDbI1ASdmGYdhQN7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nx1sSo3H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nx1sSo3H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B9E41F000E9;
	Tue, 28 Jul 2026 16:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785255587;
	bh=pRFM2W+QHzaeOrdnHeLu9jo8QQD8fR0QCSiQjIgnJ9w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Nx1sSo3HR6zMCD5r0NnQmCt0W/eTrro2LYPfE+KIb2sdGovKM79DDZn53FvsVGeCF
	 AsElwTS9acC+yig2dIL1yz9NH3k4rRLoSb39priT8lJPhmSyfiTM+r01znTwnjMh2P
	 iIKC7+uh7Cb2801QS39bNtRjbcHugLUJ+648B6QY0Da+9ebTL+cwXVfuINapBpjaKS
	 W/7kM9fd75NjBVjWxXxZBnU6N4lIBYukpxe9zEH/lYEQoVBPqQ9ucl4kQ0IrzaeAIa
	 /nCaOyul5e52rLCwauiEIkOH+Cy0bUs35RkgkgbPkDUHmgf/HN6HR9qzxWamZLTDYa
	 4qp/DNSvT0LDQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] hwmon: (pmbus/core) increase number of phases and
 add new mask
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TnVubyBTw6E=?= <nuno.sa@analog.com>
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260728-hwmon-max20826-support-v1-2-224766e0acd1@analog.com>
References: <20260728-hwmon-max20826-support-v1-0-224766e0acd1@analog.com>
 <20260728-hwmon-max20826-support-v1-2-224766e0acd1@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 16:19:46 +0000
Message-Id: <20260728161946.9B9E41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Nuno S=C3=A1 <nuno.sa@analog.com>
>=20
> Increase the number of phases to 16 as a new upcoming device supports
> such a number.
>=20
> While at it, add a new mask for controlling the source of the output
> voltage.
>=20
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-hwmon-max2=
0826-support-v1-0-224766e0acd1@analog.com?part=3D2

