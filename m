Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F7431BCAE;
	Wed, 20 May 2026 06:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779260176; cv=none; b=PHa5ZPrBXD9pQjiyF/RQffEYRVKO6TTdHLHSw8BNYyPDWzeIJQNcQL11TM4CPUgEFwMp3qZyamY+DevwpFGP/XCbNLi3iEgzvbZi36Np6TRaWLnCtdkXN2VNDTcvG4myTXnIHHxZyypZJnCk8UCN5izAGKXErkiv/DJ8kmNqr+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779260176; c=relaxed/simple;
	bh=pi5OKsBdbj2OzQRSP0LKV98aAYrZ5YKZjBXVeyyKGNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FFapf7RizBsyKlQUqAm1mYQbzYaXmoCGqxpHYReqFaC+gJJA90nKjBFz6uysnK19W79VMYIllXXdtFk6/w3TCFZEsQXsd33GG+1T3Roxu12X5mByxrpPIiYJQsv79ZvmYj9MBphJCXD8M18F3kJX61dJ0fCh9Ay5oR0fRd8JcSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C5DV6IEw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C5DV6IEw"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id E58081F000E9;
	Wed, 20 May 2026 06:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779260175;
	bh=OdjbfKUJSS/OXcOWlZh61jVoKbiGlQFsDDjYnB6xjpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C5DV6IEw/DcJwol8aobXLxCcEmOsW8BYneEG6fFbH6BcJFJVj1vSYu0OHdIQOYvo/
	 JCcNrSBFUYE5LEzu3VSdZTUQ4IvLXKNrpwLQTngxO059GBu3wmR9pv/LogqVhCe8la
	 SIStKoCEmXNHWiBz9wvTkpOMS/dD7zO67jkrMtfxHeNJc9kebj59ji9PVWht/AQwee
	 V9jnppsw8YfpxnN0HGlu/G9Ukk+47HRlOq5G+KLAOwQ7J9cLEG+J1i4noZqLwRHF7c
	 7r3c84MaH5Q6py3THbCmqDBH+vABU/YqOkHzLtBfVI+jT+NskTlULIHKvJLcSFsXpD
	 Kb0HU7aQ7iE6w==
Date: Wed, 20 May 2026 08:56:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: hehuan1@eswincomputing.com
Cc: linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, ningyu@eswincomputing.com, 
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com, luyulin@eswincomputing.com
Subject: Re: [PATCH v5 1/2] dt-bindings: hwmon: Add Eswin EIC7700 PVT sensor
Message-ID: <20260520-imposing-reindeer-of-painting-40a63f@quoll>
References: <20260515091942.449-1-hehuan1@eswincomputing.com>
 <20260515092056.466-1-hehuan1@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260515092056.466-1-hehuan1@eswincomputing.com>

On Fri, May 15, 2026 at 05:20:56PM +0800, hehuan1@eswincomputing.com wrote:
> From: Huan He <hehuan1@eswincomputing.com>
> 
> Add device tree binding documentation for ESWIN EIC7700 Voltage and
> Temperature sensor.
> 
> The EIC7700 SoC integrates two PVT instances for monitoring SoC and DDR
> power domains respectively.
> 
> Signed-off-by: Yulin Lu <luyulin@eswincomputing.com>
> Signed-off-by: Huan He <hehuan1@eswincomputing.com>
> ---
>  .../bindings/hwmon/eswin,eic7700-pvt.yaml     | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/eswin,eic7700-pvt.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

