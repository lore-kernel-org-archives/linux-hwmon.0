Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD1628CF5D;
	Wed, 19 Aug 2026 15:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787154961; cv=none; b=ulET3J90aRr1wMyWHka6VxXjHTGPvUox07Kg/0GXc0TbTU3LcIN962EYpAHawSiZu2Fb8zrivkcrpTtEKsZKJXsz8DY+CwVR7nHmzMZGRNxpRzQqvC2+vCqHgwsDAYAhVMyGWK4fnsQOcLO3lG4T+wnSzQgfzX3EEJLJfC09Jqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787154961; c=relaxed/simple;
	bh=dLQgRkfHMIA/+qJYlwSAW4ErVqRZWq7hZ5qRlswLAXg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iBsNQDPSmX3NdodtP2kOxtuvBrS2CX3A4iCImcag+zvNgn6/aEbGH4Mbkfwy3ksBNKEVCeHshlDtv/tWySV5srlNECIeq1Xh/xrfp6eYROzcZnG6DCOxIKE1+C+zjNLXuaiFGWFwJOz7D6AEK/ZgNWZewQejIABl0XeDeWzO5z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LmC9jYmb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LmC9jYmb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB4101F000E9;
	Wed, 19 Aug 2026 15:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787154959;
	bh=dLQgRkfHMIA/+qJYlwSAW4ErVqRZWq7hZ5qRlswLAXg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LmC9jYmb05PY/dyE5mQ4MmH4thIwFdhr7RWJa1IPGpVvOc4Ozg8xnSDubfggMPkG/
	 nGiPr6bwamtTjzUW2REUFJ7n1gEd23vv3eHc7sYlUrbYddHLLnthJ7tLhGmA8wpRZX
	 ahFaP5otS1XkA80csps8jQHN7hios+ybKUJiq10jScQ6XBO0aKYfqaAhZxZ1YGq5rS
	 H+qpDeojJcdELkYLQKeWe59yXDMiORuhSh1Gz2ailtTRE/5FEuCeh4xUi0pQurvG6z
	 QDPH+cP8LItgmQB6szkAs5jAANocA7oMaSI1kbmpGbqz2VJ+U3WU+xOuskWwPUAy78
	 zz6FfG9kAmQcQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add starfive,jhb100-fan-tach
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260819091601.41077-2-changhuang.liang@starfivetech.com>
References: <20260819091601.41077-1-changhuang.liang@starfivetech.com>
 <20260819091601.41077-2-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 15:55:59 +0000
Message-Id: <20260819155559.AB4101F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add compatible "starfive,jhb100-fan-tach" for StarFive JHB100 Fan-Tach
> controller.
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819091601.4107=
7-1-changhuang.liang@starfivetech.com?part=3D1

