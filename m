Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57E11F1537;
	Sun, 30 Aug 2026 03:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788062196; cv=none; b=BaPZnrcvo9EfaU7qiPrk4VE7qAqJiF7EsG9W6QnVotjtoPwoVJ48p7VfHYzxgOp/3ZTViNMnoxKI5yJd2LLuPutPgpkf475lHfe0DT9MaRwPtCOJYTncAd0G1VeHXxCYFtgbK1E5OnbfKA5+Ft2TsUalR864/aOh9BXfClrXnso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788062196; c=relaxed/simple;
	bh=B8UKP50GbFPcFmeB9QSNvznuk9bUT4JgvSX8H6lm7BI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nKgBVdM7J2bXdhVV+iY1Ze8peciy6BLgA4kKClNdqsJdTqYdcFkcc4LWtsh3xDwn6S6oIwPLRwx/4ahJWlk9+nLIblZPncbCRxxxqDrij1DbYcJJVJ/G+x/o7mHTe9nUuXKKRU9UuyCe9hS+vbbZaJM8F4xJa70R4nzrQJptDVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H+yKZOus; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H+yKZOus"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C22C91F000E9;
	Sun, 30 Aug 2026 03:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788062195;
	bh=B8UKP50GbFPcFmeB9QSNvznuk9bUT4JgvSX8H6lm7BI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H+yKZOusGXJTpDfNx3ePjnzemJ8FZqyRNFiaJclwLQode51HG/f5pwrF+mGohF4Or
	 2DUUwrDvwCBLNAyZ1+ctc9fjpHlZ4kWHS/s742MG/skXqhYR+Ki4m0d02rW76tGKlA
	 gjEtBBuyjV1RXOcjbxO5SNNT5MajPNDJ0Dcnt5azrQzdx8BqhN4FQFGJ6lyP2sYTck
	 2ispwCxOKqqZHqFzaj8JqRgMmENbur/3vNuyTjacJRBpLulv6gD35wr4qQap7wDQG8
	 RdX0SUiHxvrx1deHAgq2x5utQL9xdkOCClZfQGSJHBesPFBmUD1xCNhOAeR0K2qD9i
	 3RWje3f1ADVWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: Add starfive,jhb100-fan-tach
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260830011941.40199-2-changhuang.liang@starfivetech.com>
References: <20260830011941.40199-1-changhuang.liang@starfivetech.com>
 <20260830011941.40199-2-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 03:56:34 +0000
Message-Id: <20260830035634.C22C91F000E9@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260830011941.4019=
9-1-changhuang.liang@starfivetech.com?part=3D1

