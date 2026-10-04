Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562F0369D74
	for <linux-hwmon@vger.kernel.org>; Sun,  4 Oct 2026 15:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791129268; cv=none; b=koXp44u8XrczWTww6RaB9D02vS0sxWcX+ITG8nt/FhQ58GXId4iVZUd/s76ilsLxeA/ZjIyvxN5ubZTE6KdWYF8wUnmqio8U1ByCgUTx+YH04bIR6auPjAIvaqBe6yYl7GUZG/ypEQRceUCHcfFP1SR19++YBmxyxa0q0Ff4Dqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791129268; c=relaxed/simple;
	bh=e55ZiqNAXoI+BwdDFpq3Bsi5mrL0YLSsq6YNcBTYYGU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VmgntIElAvns4/NblwySP3FiNu7sCA5khcL0Q7Ui4AAFLV+xgmdgbF1adtrYq85FTIVWNs3K3oKzyVAApt9myTGVzujeF8D5u8fOBRJDhOrLjsIL7o1dGqGeb3WDtBhs42RvPILSDxPIq4gQbSWS8W8K21ttzymvoUFl7+Lv/ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SYJYzdCu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SYJYzdCu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35E421F000FF;
	Sun,  4 Oct 2026 15:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791129264;
	bh=e55ZiqNAXoI+BwdDFpq3Bsi5mrL0YLSsq6YNcBTYYGU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SYJYzdCuEnM/BZEcTpGbAonEBLdGgAfRL8C564tuhW3LF1a4szHnkie0fRHxObtTe
	 PKOdHiZH3VtLh6BNGxCrYMMI056ohHdGyZpX/vjXhzNT8RawxwsboROZCFP4uTTlpI
	 7itQiyGXt9CbFcM9kR9L85k02xmzkrD7S9eL9DVKYyfSBFZa82NL+1cNSFQncClh2U
	 EcRJvOHJZRwTk7KGjpLmqAUg+h80fxPDNXiIcGQINwLF/qgvCFTOE5plWnMr8JOgU8
	 nvyCnrDhiCqMXaex/asNJQGfW4vhExWv7zGi4uS64DPS/ROnBoWPvnboTM7HyXwZqZ
	 sLchkdBhCM7dA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] hwmon: (nct6683) Report the duty cycle of
 NCT6687D-R system fans
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hamza Mahfooz" <someguy@effective-light.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261004153250.516730-2-someguy@effective-light.com>
References: <20261004153250.516730-1-someguy@effective-light.com>
 <20261004153250.516730-2-someguy@effective-light.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 04 Oct 2026 15:54:23 +0000
Message-Id: <20261004155424.35E421F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Recent MSI boards (customer ID 0x20d) use an NCT6687D-R. Its system fans
> are connected to channels 10-15, which have no fan output configuration
> register, so their duty cycle is not reported.
>=20
> According to a reverse engineered register map, the duty cycle of these
> channels is reported in register (0xe00 + channel - 10). Report it for the
> system fans that are present, so that pwmN matches fanN. To do so,
> support up to 16 pwm channels, indexed by fan channel.
>=20
> Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261004153250.5167=
30-1-someguy@effective-light.com?part=3D1

