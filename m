Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A383368BD;
	Tue, 21 Jul 2026 06:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784616627; cv=none; b=oKUhqBO03OgFfSl7yVirqfCo6gE+OPYM3P//o1CszwAokRQxStf562cah51XEVh9c5WIH3dzCR6OpX/4eyT6K7i5NmOKmKnqOMlTDYAuZCsSl0gifRcC3i5B/3sVJ9kHqWwp2Du1HxWhHpZLIbtAU6l1oSALnAf/K9Of3uBfwLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784616627; c=relaxed/simple;
	bh=zeIWo/F7Lyteeu4uHDZXjgOl0PfAA/GJNtBIiawg0pc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rvzIrGZHJQj9Rga2x3ZBhJ59PQYmswn22LUPl4+yc81bL5MZCVQ6wdFA5m1/c8MYn8A00mV1baijxXshO/JMoVmmxFJIZJIedv2DamjqgMNcQBzv/oxW+bTYA8GD9DM4YgIbBvuJUGMg+Q1tR9NBWyBowMqrh8pBCjiZ+HyIkS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eV2HCaNc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eV2HCaNc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 028431F00A3A;
	Tue, 21 Jul 2026 06:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784616626;
	bh=zeIWo/F7Lyteeu4uHDZXjgOl0PfAA/GJNtBIiawg0pc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eV2HCaNcHKhxyckUObzNQYa+gDoIbi89plR3icJVxvmT7u1zaiOmSYFg80RZnFEq5
	 aEupp5Lt+/+lurDOLQdJmvCNRKea00vd5Ff7VaRSP+ddJSlnBmqmmPfX6up3cXYnJN
	 H7WrF+dAbO9HBFKRYq3ieE67WWDKn/ddJ3B70VZWmqVrF4f2qK+NuC1rkz9uvDaFbz
	 3eTvmY3sC/sF2I+Ur03YrbyoPpVeoGklDsd7apXAVsT5+nMnLpo3SykF2V7CFlSD0h
	 5gX6O9BLKLjf90abCuF7Lvfrah4n2oPDh54htANkQhQogw/1eLQsfxukiuUDBQQTkI
	 WQJTTrNwNvXNA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: hwmon: Add Kandou KB9002
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andy Chung" <Andy.Chung@amd.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260721-kb9002-upstream-v3-2-70563922be8d@amd.com>
References: <20260721-kb9002-upstream-v3-0-70563922be8d@amd.com>
 <20260721-kb9002-upstream-v3-2-70563922be8d@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 06:50:25 +0000
Message-Id: <20260721065026.028431F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Andy Chung <Andy.Chung@amd.com>
>=20
> Add device tree bindings for the Kandou KB9002 PCIe 5.0 retimer, an
> SMBus target that exposes an aggregated die temperature.
>=20
> Signed-off-by: Andy Chung <Andy.Chung@amd.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-kb9002-ups=
tream-v3-0-70563922be8d@amd.com?part=3D2

