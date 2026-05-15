Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F4F3E2AA4;
	Fri, 15 May 2026 19:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778872027; cv=none; b=I7N9Pd2HfiJqiCrHxfghN21Gnsf+B+jCBjeQ7nhLEX8G4i0MWhGV5doIVs++hhEp0xfyXpui5vJbhfwl49g54LW8xCP87OuHht0UEunB/y6Uz/k823+4uy0mrtg3jhWHxucq5ovMv7ZzSq4J2/MOo3hPa6WngotaXwlVOAj3Pwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778872027; c=relaxed/simple;
	bh=UCSgOFk/WDNB3yJPWIDDr0ElsDABRh5hBg/X+bFtSAk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EsvfheB4SVzK6HMC82NjRmqkhsT6yLKSLMbNhCSYkaQB7nieff13FHwPJqTQQalCCfWobdxTWPmYkdzY1xYo3gt31+daBrTTdVbToFmKsKiImdTHsyLbBuRGokPXdfr/28yoDDZfWB6BV7WijNkYdDbgMdRWqlS0o++BkeL1zHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TS83HECS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TS83HECS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 033BDC2BCB0;
	Fri, 15 May 2026 19:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778872027;
	bh=UCSgOFk/WDNB3yJPWIDDr0ElsDABRh5hBg/X+bFtSAk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=TS83HECSN6sNoqtBW6RbhrTTWDcbck71aDL7qDBJSZZcPnIH5mH3V+2PZN9zK6uZY
	 CZUBIwTfQ4ENVgKmOWq+mtQwKOyRLVEQZ2i3xkYIbC+fxiLjQs0D5G4c1xJSGAQw3j
	 Hq3UzOnGCQAx36SLrHuDa1k0QKXpSnUTRtjBAOu5UXmagKPrfkXzqS5H16Xaakj5li
	 /VUfXQDc2LbGlnKR8ZA6t3uKF1ETPj818nVwmNwyBWF0DMwhKyKohDGNcLTeCeAtGG
	 krFfFRAZPj4r9vOBgl2uwi55H3k22bL84CNfEE0z5c7clCaIz+p0YBQRuy9T0PnLdP
	 DBME6VyKDPsPw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 6/6] mux: add NXP MC33978/MC34978 AMUX driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleksij Rempel" <o.rempel@pengutronix.de>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260515160537.115808-7-o.rempel@pengutronix.de>
References: <20260515160537.115808-7-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Date: Fri, 15 May 2026 19:07:01 +0000
Message-Id: <20260515190707.033BDC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add a mux-control driver for the 24-to-1 analog multiplexer (AMUX)
> embedded in the NXP MC33978/MC34978 Multiple Switch Detection
> Interface (MSDI) devices.
> 
> Assisted-by: Gemini:gemini-3.1-pro Sashiko
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Reviewed-by: Sashiko <sashiko-bot@kernel.org>

