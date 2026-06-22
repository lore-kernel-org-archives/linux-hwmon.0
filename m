Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365D63B636C;
	Mon, 22 Jun 2026 14:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782137086; cv=none; b=gmK07fisbwdMVGwjwgDTklXTBpuMby5Pt+dSJFihPKiVX9DIyia4275rHq5czFP0Fy3s12vk8kHrIrMRcplW5nYv8twzPkNXZchSwam5ElvbTjKLiVV5UVcQMs/LJHCKx4aezy2JJKPoBi+SS6NK3PVMjl97FxeNdqKEY2aKHuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782137086; c=relaxed/simple;
	bh=kPu0G9drcGQNFYrqeARHo4jJWje2ZFFv8LWo8XIXWOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kez4nnD7PCg0AuWdik8ryNk+XJv8TqfwYaW+xtaFO2+Netae8U5sXqpp0R7WHbNsADa9xb9/o8/B+JIC1P0EsXSqvy5jkeR4tm5kVBnP4/dyUEC9tSn2DOWez7xAOTbJhGhZvxyQCEURkfNasAiwn0T2hVzBEQXBatREpvNni8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gOaf0e+i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gOaf0e+i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9B151F000E9;
	Mon, 22 Jun 2026 14:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782137084;
	bh=NSaTYW1U3Zu8sVqcPnl+PcYx4Cegn7jfmW3jS/rMxOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gOaf0e+iwG4tOqNFlr1HG+saaIIx9Z3Z7R0prUyInLsB2/H6gW1kQXsKtpaKQRKiv
	 w4hubLY0JwR/Ih85EGf6Sg7nL6vFVTqHlGYQtJaKKX+uS28OlG3GzGvNUhAD4f2V+b
	 fYSic0lPdmM29bv2xCXDUysNf9mR0rQoBKVJcz58JVe28I2EiDrFNBAUnCdYykGSfs
	 z7+prgv3gTxPOLHWVIhqmvcg2iAYAYgw5kqtyLJeuaclZb3NH8Y9L5glDD2dPIzPtK
	 PZrs7SSJrEmUT1aWr4fU6aETkbTBzu1LGFFQuz0Jkk7HdK97GgzVrGvUWR8GGmRE6M
	 UUE3dQBF1kePA==
Date: Mon, 22 Jun 2026 16:04:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: tze.yee.ng@altera.com
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, 
	Mahesh Rao <mahesh.rao@altera.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: hwmon: add Altera Stratix 10 hardware
 monitor binding
Message-ID: <20260622-benign-ammonite-of-greatness-a4ff3d@quoll>
References: <cover.1781861409.git.tze.yee.ng@altera.com>
 <ac5a118394e96f707823463fedd32b6a484c1ceb.1781861409.git.tze.yee.ng@altera.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ac5a118394e96f707823463fedd32b6a484c1ceb.1781861409.git.tze.yee.ng@altera.com>

On Fri, Jun 19, 2026 at 02:38:52AM -0700, tze.yee.ng@altera.com wrote:
> From: Tze Yee Ng <tze.yee.ng@altera.com>
> 
> Document the device tree binding for the Altera Stratix 10 SoC FPGA
> hardware monitor, including temperature and voltage sensor nodes.

Also:
A nit, subject: drop second/last, redundant "binding". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

Best regards,
Krzysztof

