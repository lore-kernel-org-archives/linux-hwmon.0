Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93432147E6;
	Mon, 24 Aug 2026 03:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787541916; cv=none; b=OjoAXEoGnsq75SkWS5tCoKzpp1FNOW2vVjgirCPaWCkzeYO5kw1tHNN5vfeU2cv/Bw8wb/9xRf+NZnX8okqeHxdw8y1HaaRfNR/ZmktrzxnGw1taxFn04XFsPCMRPh2cOIaKTFlBpw0PR1A6nsD1RknLzoYYo5x5Ihw0FW5Nlko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787541916; c=relaxed/simple;
	bh=+1BHCWsMJF0C+55svrbqFCiOqvsjzgW9u66b6wUUVZE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oH1L8aOnexdYEL+mSAkFep8piAY5BUS1KOUKkqOvN5iTa09jvm1z4esnVJnKZDRjEdEB+HsaR28hGRt8rG03ZQwiZcYBr7RZTWuHSQISoDYO3u+XekmljRBd85qaNsKjRiERfXlHQHtH4PzZFEfuH4OLDPccdJc5DMYh/rULCXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T7Plxdoc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T7Plxdoc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEBD11F000E9;
	Mon, 24 Aug 2026 03:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787541914;
	bh=+1BHCWsMJF0C+55svrbqFCiOqvsjzgW9u66b6wUUVZE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T7PlxdocvoId1p8w73PfbeiKZESsXsFDmfqRWwlIjDs0GZSHGb7ODnSsYbvphe5xr
	 pgmQdVAK/Mkd9/L13f6O7VtTs8TzBxrBa5KejSrBcIxxhwoOh1FGcQUFj9g6JvHPSS
	 Op5344n63xH/BRM8n5X006hX6lHEvJYjXJhqpseGWi7r37NnsJ8TseGAWMY4ccZcFN
	 AhTm8fZ0qqSeYsqDki0afdjwCVg37PXipQB2eWATGnZS29AaotOkDGKw5pWkH+meHy
	 Pa5ruiB0VC9HWY83r7QtwO2uUGEZ6NWM1IaZo3cs29KLUz6czJRJwGf1WDEUGzvkAZ
	 /SldVev+pSvng==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: Add starfive,jhb100-fan-tach
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260824030234.9321-2-changhuang.liang@starfivetech.com>
References: <20260824030234.9321-1-changhuang.liang@starfivetech.com>
 <20260824030234.9321-2-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 03:25:13 +0000
Message-Id: <20260824032513.EEBD11F000E9@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824030234.9321=
-1-changhuang.liang@starfivetech.com?part=3D1

