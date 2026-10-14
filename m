Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECD35650FA
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 18:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792001690; cv=none; b=ZLf0UOM+G8jg6BwGWjRkw4re7CLMln4OCRt3Ck1sfdbXfM4EYOx0NtdHYxAUfo1NzezyZlqBVDOKqaK1hDgxAiSLj8UeuXJgL4G7CEUHtOmzXIYej8A/C62v8xLcxSZ9lwD38rOtZKNfdlWZwMfNQNWEwtEJ8d9dhb3C2GkqV4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792001690; c=relaxed/simple;
	bh=9TyAMN2yWs02zy116mGBeVLef0SD8xZcF7ZLoAHwRcY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Ao/qlvlFour9ChSKGxfDbnWtUPZAUtBDnJg2IS/IXTulvWSpilt5sSVVSbpdue91LjIzQ+yMu6LBIk9BM+u5YvzVt7F56IbbXvv5qNBOP08wyh8yaMWLx8IYKMPQ2zRDa+bcyOwP8aSQjgxFQGhR6gIglYmeC7v4PzVy2W+luPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hg23RDfn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hg23RDfn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 437141F000C4;
	Wed, 14 Oct 2026 18:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792001689;
	bh=9TyAMN2yWs02zy116mGBeVLef0SD8xZcF7ZLoAHwRcY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hg23RDfnlLSkrbThFCAmLYg4SgAb3au5Ytx7qLVchSWP2hLu03G3D98rKb6M41ATE
	 Y0O30NrO8SMALU6pWjh28jQFq8vVYjE5iSdCMsoSmVBn4a81gQI1piI7bu0toUoNed
	 3vDQdeeY+gKJZR0w2QkUr/oaq3Mqwj0WmqVMVTCucr09nHno/cvwiiWBR0j3NQZLbV
	 XrdsfqitPLPvEDi82UT+DRLzTa5t9nCLhhdhvkr4dvCah8UDmILU5NAS/Wctg/a/v2
	 8cbPeCEWohJ8YFOjdsIO5JnsoVbdvRiDr4Y530meQkRG8Qhnf2BZJWtoz8bIuTlPeX
	 brpoDbBAdEQPw==
Message-ID: <sashiko-outbox-171681@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 04/11] hwmon: chipcap2: defer probe when IRQs are
 unavailable
Reply-To: sashiko-reviews@lists.linux.dev
To: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261014-chipcap2_locks-v3-4-27ebfc2c5b9e@gmail.com>
References: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
 <20261014-chipcap2_locks-v3-4-27ebfc2c5b9e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 18:14:48 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> This device can work with or without interrupts, but if they
> are provided and still not available, but if -EPROBE_DEFER is read,
> its value must be propagated to enable probe retries.
>=20
> Fixes: 3af350929e75 ("hwmon: Add support for Amphenol ChipCap 2")
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-chipcap2_l=
ocks-v3-0-27ebfc2c5b9e@gmail.com?part=3D4

