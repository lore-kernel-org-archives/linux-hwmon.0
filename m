Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F1E3F99EA;
	Mon,  6 Jul 2026 06:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783320055; cv=none; b=Kjqeyo18rPaMmJW9FWXjGy1s3UQTfvhndcpIbV+7yXKxzZCgz22HF9DhPPckbcKZezAQU/tjf3R1yb5iGJ3f077CumvH6+0eMiyfY1TVWdTD6c12agoN9s/ffuLVJ3Tbr+BvF6n1k6L4Hc8mWbnXBMuw+UOslu8b1xHORpPtPhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783320055; c=relaxed/simple;
	bh=EfeC6xCemxNveVDmaUafIdp2sJnX+4EfPNNYlhqRDxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KGzGPRwDiu8Izr0465hNP2RXLuiTR8JA+Zkabpp1K7pePXVsk6TxPrco6EH8HYtU7NcTQAFIlxXtTbeEIEq1lKibcNjIZTGHeTf7GiSU6dRjABhLNHXyr6RE/HIEc2uIJzTs2zu3qRzDadDM6iEDbJN1aRovIwawZh8bYzwOL40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c8xg32Ni; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c8xg32Ni"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9D601F000E9;
	Mon,  6 Jul 2026 06:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783320043;
	bh=EfeC6xCemxNveVDmaUafIdp2sJnX+4EfPNNYlhqRDxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c8xg32Niw4KbPhHwe7xnwd+uNFNpmQV12KbwAmx0QBdNKdX/WM5QTi6BXPNNbu1BF
	 CjPRNDwhpk1QpGDeB7GT55ybj+L6f80Bk+e06Rs0G1R7PSIVBqdmJlpgT73vDDXoCF
	 Dpfe6fk314G4V93Ps23saNRfXBtbPhATzU5bykJHMetFSywBi8G59Dkt3j+c8jWgRE
	 9uOzGZPOeK+LHx8zoC2Kyf36QzRgrRndwGDL/nQXqwZqqqCJZ0ujGkdzNN/Gi42QmB
	 tV/mM4Hxu0GnKTBWNIJI+OxELgpNQqYzQrIifUnc0mmux52sWKtOTrePgNboIZ6trE
	 gZztML2UvHglQ==
Date: Mon, 6 Jul 2026 08:40:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 4/5] dt-bindings: hwmon: (pmbus/max20830): add
 max20830c and max20840c support
Message-ID: <20260706-abstract-apricot-platypus-b932ff@quoll>
References: <20260706-dev-max20830c-v2-0-37761e89bb5f@analog.com>
 <20260706-dev-max20830c-v2-4-37761e89bb5f@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260706-dev-max20830c-v2-4-37761e89bb5f@analog.com>

On Mon, Jul 06, 2026 at 10:08:44AM +0800, Alexis Czezar Torreno wrote:
> Add compatible strings for variants of MAX20830 which are MAX20830C
> and MAX20840C. These devices have the same register functionality with
> MAX20830 but with a longer IC_DEVICE_ID.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

