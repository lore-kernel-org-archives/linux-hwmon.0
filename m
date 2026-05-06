Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF453CF68F;
	Wed,  6 May 2026 15:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778081846; cv=none; b=qszeHLzW42i2f5dUrBkPMYPNF/Ja59md6d82+ye6ONJIa55CGvZT7SUZMr2LbWc/KFCZ4fQiIWAief5dy2+2AyHeeNK8R3v160DHxZTpwvcybYkZDUzFRrEu+U6Rzo7LryMqHho8SIb27kYeAimne7CZreifkDrr0mod3oBAFA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778081846; c=relaxed/simple;
	bh=Lh8IyNcOsvb3e/MfNcreMdBJXDLwuzXVxIKBw+0229w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KE2o6DLxR5lVs7uVLlBgV0RualSG2Hnwg1uTRIbsBowFF+aNPZdT9/gTDFwaKp6AiWZY84eWm7ewsL2kRA7rg6bJz5hJGwmZwGNywZBhowwlmXC1pF9RSoevEU0GD6mmTunusYTOOiqOazNEiEEagDDzz+v6y6G7iHf/LmCZ9VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lQvu6hdM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lQvu6hdM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7753DC2BCB0;
	Wed,  6 May 2026 15:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778081845;
	bh=Lh8IyNcOsvb3e/MfNcreMdBJXDLwuzXVxIKBw+0229w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lQvu6hdMapYt7LjfZiB8CbVxjsPgfnyYf2ve9VHEGRnVn//q3Xhcs+bexhSA6TfBc
	 0ORCKt9iT7NfpSzm5gqoBk9jJfYY+TwgMO/lmnG62pHXG1YyZLiQaTenLhcX32/N6X
	 uLEONELKPyXzh1Ln6h3F0UfxfSpLSLgGkY1QgfCncDPVmu01nf6LecNW9PaHG6KVCv
	 0oA5ui2FVrPmNFPMiiYeQ3+2rydIuZmZMUjPIGegDxvSNVjjfU2dx05CoQ14ynbDG0
	 z+lmCuK7me75kq8tsxAl+92ylH9XydjjhnZH4e5I3l907a3G/Km3Q5cLcYzufydkgQ
	 TwaZ/osjmiXLA==
Date: Wed, 6 May 2026 10:37:23 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marius Cristea <marius.cristea@microchip.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v10 1/2] dt-bindings: hwmon: temperature: add support for
 EMC1812
Message-ID: <177808184247.2172411.12359640916021641487.robh@kernel.org>
References: <20260429-hw_mon-emc1812-v10-0-a8ca1d779502@microchip.com>
 <20260429-hw_mon-emc1812-v10-1-a8ca1d779502@microchip.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429-hw_mon-emc1812-v10-1-a8ca1d779502@microchip.com>


On Wed, 29 Apr 2026 15:58:07 +0300, Marius Cristea wrote:
> This is the devicetree schema for Microchip EMC1812/13/14/15/33
> Multichannel Low-Voltage Remote Diode Sensor Family. It also
> updates the MAINTAINERS file to include the new driver.
> 
> EMC1812 has one external remote temperature monitoring channel.
> EMC1813 has two external remote temperature monitoring channels.
> EMC1814 has three external remote temperature monitoring channels and
> channels 2 and 3 support anti parallel diode.
> EMC1815 has four external remote temperature monitoring channels and
> channels 1/2  and 3/4 support anti parallel diode.
> EMC1833 has two external remote temperature monitoring channels and
> channels 1 and 2 support anti parallel diode.
> Resistance Error Correction is supported on channels 1/2 and 3/4.
> 
> Signed-off-by: Marius Cristea <marius.cristea@microchip.com>
> ---
>  .../bindings/hwmon/microchip,emc1812.yaml          | 193 +++++++++++++++++++++
>  MAINTAINERS                                        |   6 +
>  2 files changed, 199 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

