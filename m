Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA0534FF50;
	Fri, 21 Nov 2025 18:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763748247; cv=none; b=ae6e3cdb4TKMM7mCFpny0+3aLG6poh9GGhWBY9k7RIIbqRVNWGZ3QXX2Rxy3Mcsdi7/WaUcUvDUxBV+mqQ/ggXvtfxD2ErEiMpwY73zt8fzBpwt5Gz7ABuj2Dx55/ni+XHc39eNshnAWg57H2mOUWp0HLt8h+8b6UGPV2fYZ4Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763748247; c=relaxed/simple;
	bh=3QgOc9vFpKAThsDu88K7b5Pzpr6OZoSFTyD1bjmAiXQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=t/btgg8r5fyq+g8Qf+Svn7lu2On9uRRNCVwjwEBnN/WGR4BzyR9wT33XlwwkUeeNo+dJdVm5a0vE5ZBXv3dRagsajKVyqBOcQZco7vjqrXc9GkGfrOb7NQ+CsP8YCYI8aqQ6gFOjWvH0AtKtAUxL5biZvH+vh7n8uOO5qIrrlzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gQxPFzWa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gQxPFzWa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7CBEC4CEF1;
	Fri, 21 Nov 2025 18:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763748246;
	bh=3QgOc9vFpKAThsDu88K7b5Pzpr6OZoSFTyD1bjmAiXQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gQxPFzWaDHj64LqIDJY5xz0of2/TjheRsmP7Fykqvwh/K5L0cm4CXTufZQQe8Q7Xt
	 ud3jO/hOOLclYMd+YnEOgfw0rbq9wZAhlKimJ8ZyDK76X0UtJeVcf8EINLcIFrvSIt
	 bxwuopH4apWCpEA+1n+pT0bSWNFCGgYb2jOfxsfboGO4QHgdL7X+cb6fPWWscL+GB/
	 J8BZHiMSr653ytwEdr0hoR1VrXdNSzrPLalltcd/lfzhRRRFkqcIjSv6h+ifd13uRS
	 5D/FroVA56jKw3PbZDhDmjXoZEHr/TaCGGG2sRstFVprF9yKg8TUDp7/euKiu9Sxux
	 jvMsjpO9t3jnw==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Guenter Roeck <linux@roeck-us.net>, Andreas Kemnade <andreas@kemnade.info>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20251115-fp9931-submit-v3-0-92f5d0772b68@kemnade.info>
References: <20251115-fp9931-submit-v3-0-92f5d0772b68@kemnade.info>
Subject: Re: [PATCH v3 0/3] regulator: Add FP9931/JD9930
Message-Id: <176374824456.73617.6524061972788557743.b4-ty@kernel.org>
Date: Fri, 21 Nov 2025 18:04:04 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Sat, 15 Nov 2025 07:50:48 +0100, Andreas Kemnade wrote:
> Add a driver for the FP9931/JD9930 regulator which provides the
> comparatively high voltages needed for electronic paper displays.
> 
> Datasheet for the FP9931 is at
> https://www.fitipower.com/dl/file/flXa6hIchVeu0W3K
> 
> Although it is in English, it seems to be only downloadable
> from the Chinese part of that website.
> For the JD9930 there can be a datasheet found at
> https://e2e.ti.com/cfs-file/__key/communityserver-discussions-components-files/196/JD9930_2D00_0.7_2D00_JUN_2D00_2019.pdf
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/3] dt-bindings: vendor-prefixes: Add Fitipower
      commit: 0d360d54ea6d0fb3928205d6c67801d1719dd958
[2/3] dt-bindings: regulator: Add Fitipower FP9931/JD9930
      commit: 80bbdefdfb4174ff7e5d4f17658c845ef8f0b623
[3/3] regulator: Add FP9931/JD9930 driver
      commit: 12d821bd13d42e6de3ecb1c13918b1f06a3ee213

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

