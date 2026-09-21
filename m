Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45445318B9B
	for <linux-hwmon@vger.kernel.org>; Mon, 21 Sep 2026 06:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789970491; cv=none; b=jrtGHPfEQVKFvk8/ehkFemYBtyvR9pI4TLwlvNmER+3zeCP7GLuPwGoWPi8f0i9Pk8qEenvJ0Nz4de+EC8g0H4tJ+9XDq8STdJyqgvra7rU/0glWmA+yL0w9lJBV1I4LsZjjbtosCdvdr2rKZ6wtKszjn9IOepO3fYU+qT7BHz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789970491; c=relaxed/simple;
	bh=NoR57CT68So56AKHlRH8D4uTDIjFpkos3KGHJmmtTqE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B0TkCOgUkrcbPCYypcT1nDBfeCnVX+JUeSILoEks0M2/io0DoxHxgLs5nRg7aqAZXrecuTG2n+R3i6n4Id84x+0QJX2daFs7/59AXEqH2Ll5IhDYe0eG/1WVUcMcACAmrAi07aUAbFeUNW281CWTK8K+5lyyuIw+1w0CXiLt4/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cqQWKpeD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cqQWKpeD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A850E1F00893;
	Mon, 21 Sep 2026 06:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789970489;
	bh=NoR57CT68So56AKHlRH8D4uTDIjFpkos3KGHJmmtTqE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cqQWKpeD4P9hkvP+nihsPSWn75cDxJB/q8WM1XwgDVS5UN4pL7+kvCgympDo0MEje
	 s7RkSXF/2dXnsvCfR7LE54/FkedeOY0djYJX+N7r9zTAejzIyZpwE22sUzAXXrcU/R
	 HqlP3EG1vW7+Smi+7GPfnge5wTiu+kOx/phbRp86gEeWKoSeZMcVxG3P0+0lZytf0v
	 MUMjYauWPY0TAdh5aLr8CcSlqMsp/eLexi+QgRIGZww4oPPEevrSDp6eVsMZC/gD6Y
	 ZzdKtj1WHl5gGk2na1i/wdli4wPGvbdraHJaCcBU3EnCUo+WZBG2Z/k2y+1F1Sj15H
	 hXE+m784agwpA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/8] hwmon: (k10temp) Stop matching Hygon devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lin Wang" <wanglin@open-hieco.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260921055603.25112-6-wanglin@open-hieco.net>
References: <20260921055603.25112-1-wanglin@open-hieco.net>
 <20260921055603.25112-6-wanglin@open-hieco.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 06:01:29 +0000
Message-Id: <20260921060129.A850E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> k10temp matches the Hygon F3 device, but derives the node passed to
> amd_smn_read() from the F3 PCI slot using the AMD fixed-slot mapping
> (slot - 0x18). Hygon PCI slots do not encode DF node identity, and
> their SMN roots are grouped by socket.
>=20
> The derived node number therefore cannot identify a valid Hygon SMN
> target or provide usable temperature monitoring. Removing the match
> does not disable a working monitoring path.
>=20
> Remove the Hygon PCI match and Family 0x18 branch. Hygon temperature
> monitoring will use the Hygon node and SMN interfaces in a separate
> series.
>=20
> Signed-off-by: Lin Wang <wanglin@open-hieco.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921055603.2511=
2-1-wanglin@open-hieco.net?part=3D5

