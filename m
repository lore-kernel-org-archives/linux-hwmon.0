Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C50D3F9284;
	Wed,  5 Aug 2026 09:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785922227; cv=none; b=IH9NNPkj8VDeM+nTz+1ppcNYEOUgK0es7qmy+/I8+5tskyUTWqf5OM+aAt3xOyj1fmiyWVsS+Mk1iDQci/KKH2f5FHFPOSlHSjOSphAF1W0EkoqcpyiKGTqEedxnYqMCLDUzeuVKl0zyprMetgjNRpU2Eg7uJggiTLxIiwjMQQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785922227; c=relaxed/simple;
	bh=3xD5onxRYd7uowprWyCo2IpC4yWiFAmpLHBZ+ljZqq8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I+rpYNlcetVyB70APQFcy2ADdgCIDZGLTdtPYWxG4fWnAAHDT4TFaynmbIFxUtk6mePIZ9UIayCIuTpQeO25HQVF9RiDnlWztAwFmyyFaAhl4hnRSfwL1FZDYcj7nQIPx8u4j8ZUkoKnToedHPLNcpXX48GBMWz3P50Gk1gHjOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aZSZKKV/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aZSZKKV/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D41B1F000E9;
	Wed,  5 Aug 2026 09:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785922226;
	bh=3xD5onxRYd7uowprWyCo2IpC4yWiFAmpLHBZ+ljZqq8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aZSZKKV/O0605UKNjDK0/+Pm4MUZLhg8sl1usnMI/PikmI6dEaxqdxYA2dXCevlG/
	 BFhklByqjx9zBehSePfGT90ndrh8X0zlTO/h2dzUyEtsRKgJ05J0lKEQaAppMe4CGy
	 UpgPiKIVj7w3nH0IaMUzc0eYIF7EkrOdYimH85yh/fyLlsEu4Yl6W5gMA4iTQVL1eh
	 5Ix/1Eg42nScqXQ7SF1kxj6MdU3IPXLhXdE5Dl51asLlSxsSlf+IiCnzIY3GaBMcYZ
	 5dpvWP1bTk9o1taZCvlmpvrzrvZhbGTkpVt9rrSaQ6xrj+eXUghTYYy43EDGM/TvFe
	 H9HLg2g7X91bw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/6] dt-bindings: hwmon: Add Sensylink CTF2301
Reply-To: sashiko-reviews@lists.linux.dev
To: "Troy Mitchell" <troy.mitchell@linux.dev>
Cc: conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260805-ctl2301-v3-3-b86c75d1c552@linux.dev>
References: <20260805-ctl2301-v3-0-fd4b8ffb5b0d@linux.dev>
 <20260805-ctl2301-v3-3-b86c75d1c552@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 09:30:24 +0000
Message-Id: <20260805093025.5D41B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add the Sensylink CTF2301 temperature sensor and fan controller to the
> LM63 family binding. The chip follows the LM63 register model and can
> provide a thermal cooling device when #cooling-cells is present.
>=20
> Do not provide a national,lm63 fallback because the CTF2301 is not fully
> compatible with LM63. It uses different conversion-rate encodings,
> extended local-temperature registers, additional fan lookup table
> entries, and device-specific PWM and ALERT/TACH configuration. An older
> LM63 driver would therefore not operate the device correctly.
>=20
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-ctl2301-v3=
-0-fd4b8ffb5b0d@linux.dev?part=3D3

