Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216533B7767;
	Tue, 15 Sep 2026 09:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789463114; cv=none; b=QpswTbO0VXWOZnquWBfxMjyjpUsdkXyEf8/SFGeDYc3bVsxA/bkfYXH5P/qDQG6T6+uyGHXXDxlaDeDzXucSf1LNXVVTDb1kAaX2bHK4a8XdkiAQmLICRmoDBV/usAZMIFTH0NzHMnYT2XWkzLwhCTxMsdOa/TEmjJnOyo7PWA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789463114; c=relaxed/simple;
	bh=y/vUqzrKeu/r7XdZR4ORRSmgFmJFbw3RdKT2VQhAyi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nAlKNXgeSr5HldrPKrDktYPLQ1yj97EVJHfyeH3a444iYoLmtrtfD5/bNiDLonrtFScA98MCv9uNzLi/8ke5vodoYILlcy9qAfjiuzQcDzO5ZLYYAEe+mH4M4gyzjlbBv3unD1Ah2xIL3XCN1dPp919XMh9MbCWkEJPdPwDhFqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JOmntclh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JOmntclh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1876F1F000FF;
	Tue, 15 Sep 2026 09:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789463112;
	bh=DJ0y64alg7jGYdmLdKrHS632yEcH2PEJo6faH44x4cU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JOmntclhVD5AGN4cYEQa6rgCkMfFEXrRaYFqUBZbQ8f4ogIEybqKN4tGn8UpWi49/
	 YsUNjkl0/8sAv4SUgDrSMUckib1MqTiVA24YdqbSyZEB8jEHdn+ui+P21Ob478ONXE
	 cK5c+CW4I0nqFreZIMp8bm/qa1lyZFQC4Bt2l2eIBntnBNtzF0R4UJDy/koOM0JkBH
	 x5cLquISXKUrmsQ599V6spaFG3prgfqiqRuoHlNlMbNmoPZBDxPYrnlkrU9gIrOG4l
	 lAtt7U+RYboJicMyBeVofxR613HxXjxqr0iqPZ1GJDzDpJr92EFGWE0q5Pqa0O+W7v
	 EJC29/N/KFu6Q==
Date: Tue, 15 Sep 2026 09:05:10 +0000
From: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 6/6] riscv: dts: spacemit: Add CTF2301 on K3 CoM260
Message-ID: <20260915090510-GKB266329@kernel.org>
References: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
 <20260914-ctl2301-v5-6-522def70acb4@linux.dev>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260914-ctl2301-v5-6-522def70acb4@linux.dev>

Hi Troy,


On 16:18 Mon 14 Sep     , Troy Mitchell wrote:
> Enable I2C6 on the K3 CoM260 module and describe the Sensylink
> CTF2301 temperature sensor and fan controller at address 0x4c.
> 
> Override the I2C6 pin power source at board level because the IO rail
> voltage is board-specific.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
> ---
>  arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 

Reviewed-by: Yixun Lan <dlan@kernel.org>

> diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
> index 37627963a6492..92dea86397798 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
> @@ -58,6 +58,23 @@ serial-number {
>  	};
>  };
>  
> +&i2c6_1_cfg {
> +	i2c6-1-pins {
> +		power-source = <3300>;
> +	};
> +};
> +
> +&i2c6 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c6_1_cfg>;
> +	status = "okay";
> +
> +	temperature-sensor@4c {
> +		compatible = "sensylink,ctf2301";
> +		reg = <0x4c>;
> +	};
> +};
> +
>  &i2c8 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&i2c8_cfg>;
> 
> -- 
> 2.55.0
> 

-- 
Yixun Lan (dlan)
