Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7BB3AFAF8
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 17:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000228; cv=none; b=iQX1p3IVBA9SVQrOL/m1KFv0AwJNbowCR15HNAf8FhE4yQ/mPvNKpKrXn0HchBt7SL048dtutt4MtAdNOW+SVQ3ds10c/xZ6XsBoTikqkAuBU6CHXt/7xpmebY89R3vwSo6T5J1/Y6XLutZRKq1GDw1jzI6TLlI7vmzzHE1DSvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000228; c=relaxed/simple;
	bh=8Q117BgN9Bmmn/k1WzORZpdqWGkMjMju0X4GBiaRKOo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=qTpmkSlfSaEDBCIeb9QoNmvIHY5Tp8cu901DWiXVT+9Ptuy2ONbED5+xxWtMbgPTQfFIqhim7JqBgM3GDNLEGLIkpFZWK4455HD5d3ENrT3iuDeBbkMj2lqO5ADpvmV++E0EB1lz3oCienkOt/hs3a7/C+6V0EI1nvMes6nz6QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jCAzifD1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jCAzifD1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BFA21F000C4;
	Wed, 14 Oct 2026 17:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792000227;
	bh=8Q117BgN9Bmmn/k1WzORZpdqWGkMjMju0X4GBiaRKOo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jCAzifD1WAGZNaXwRGbFbQ/twzjyzdrKzwR6Sk/raTDjM2e06o90a0NPIS2CgXF/W
	 gpL+B6D5r8LaDsmztxiYh5SCLmc3oYRjCHsOBhVeZJZMVWm1k/8BjizSwJBqvTD0Q8
	 ZR0Zs482yxP0FpeAIetO3yBOYcKKSP3OSUqnIkngZLxk8xu1saxI25Ep2VkZn4mJeX
	 xM4aeN1JjmSTWn9LlfCXqCWltAy5kDb0vHmDyCzrWLhbLh/wSwA50O7WnjVrA/hbYG
	 kFth9j/QLhNGe94+3d7g8KK444B4+xbtZ7g5h6x3TtGIdpg4F9VvhmLCOjMmINkCbL
	 0Kr8YAw31ue9A==
Message-ID: <sashiko-outbox-171606@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 01/11] hwmon: chipcap2: fix command error diagnostics
Reply-To: sashiko-reviews@lists.linux.dev
To: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261014-chipcap2_locks-v3-1-27ebfc2c5b9e@gmail.com>
References: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
 <20261014-chipcap2_locks-v3-1-27ebfc2c5b9e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 17:50:26 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The command response field only contains bits 1:0, while the
> error flags are stored in bits 2:5. The existing diagnostic
> checks test the extracted response field, so they can never report
> an error flag.
>=20
> Test the full status byte for the error flags, and check the
> configuration-load flag instead of RAM parity for the last diagnostic.
>=20
> Fixes: 3af350929e75 ("hwmon: Add support for Amphenol ChipCap 2")
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-chipcap2_l=
ocks-v3-0-27ebfc2c5b9e@gmail.com?part=3D1

