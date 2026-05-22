Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C973438A2;
	Fri, 22 May 2026 07:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779433758; cv=none; b=DoGuMGMRyBNh/VsvqNtdCbIisrvyQgQSDkO0NqZCKztFz9jim0g22DJNC/cArS/ZfvwKeA0eJPCXbBhGJJ1vOOaUyQPH6vPhDhT2CJt5/lNLuWfGpPXqMbSn0O3x/SAQMRmjUlYDqUqxBvgnCG21Bw+APvXU6B+R6h3eT9VHAOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779433758; c=relaxed/simple;
	bh=sYYawOsqMxJrgNzIzOVjInyziezUh7UG8OSvPbC7KwI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VDMxYTB9unIaC7pyDr0An6ve0oxq5+AkofXRRRAwtGMFJJp4BB0AjtxVsihBMtp6rW4YdHmidzkl8VZW1MntcWnDPQpc/n/TCD1z/LgqWeUtEeLPJvnAfLp1EnBeN+4bVCFlxvg5aA9Qxi0HqQPa9YeRdsoyq83cLcGspdCOQVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bib42g5H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bib42g5H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 729DC1F000E9;
	Fri, 22 May 2026 07:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779433756;
	bh=sYYawOsqMxJrgNzIzOVjInyziezUh7UG8OSvPbC7KwI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bib42g5H3tbpaB3qQlHxZO42Fj6uHKVO85Jhmjz3Qq/GCvBm7gB9y/fcuVQp34xdc
	 5TuEa1EAcnoem9o5TMlboGI0V3LuwTaSqP9KWyxk7Xaq+ML+4U8NO1/1ZqOlO/N+L+
	 cEZ8G1odCSYxMQmjKcOF4O2Mflr3j5kLXgqH+yFmt06qKTimQrwMp0x87ThjCVTJut
	 m4UOqoDbIrxycHYkv5T9yX8pqsyx/dBKbBnDctJ+clVrDDFx8+hkjHzoNAVHaDkC+O
	 A/jzhrxGFPMzYhegcm/P/Hty4iJNYsUkHLI0NppKNxojebo+OUNNqkBEMu4mic7iPT
	 fu36VEevUESFA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 6/6] mux: add NXP MC33978/MC34978 AMUX driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleksij Rempel" <o.rempel@pengutronix.de>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260522044855.1772639-7-o.rempel@pengutronix.de>
References: <20260522044855.1772639-7-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 07:09:15 +0000
Message-Id: <20260522070916.729DC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add a mux-control driver for the 24-to-1 analog multiplexer (AMUX)
> embedded in the NXP MC33978/MC34978 Multiple Switch Detection
> Interface (MSDI) devices.
>=20
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522044855.1772=
639-1-o.rempel@pengutronix.de?part=3D6

