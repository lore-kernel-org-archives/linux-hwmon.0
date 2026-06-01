Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8248A36B061;
	Mon,  1 Jun 2026 11:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780315094; cv=none; b=j5q5o78itTvv1YbPMXYr19SaneXGavMxUrfQ2dJ2HXiEXyrp5T6/jGDNw/xrXi71pUy8gyKsJ548qrx6Xcyj+OYLtP3qZqm86qkFNabt5g8PuNOiLNxvfFaCb2aDzk9uY+ItiLm3zUTC8CqBBPyE4RrZwSdwC3ysM1WnUEJN5R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780315094; c=relaxed/simple;
	bh=oMvrVfiVtG9MWcMNaKhhqdtR2sSWBNcUcTApQwLz9Ko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aGYu3pIhqO5B7wglj1x1y0MUL8DG7O4BrzN+AuvhE0eoZuuxj1GfQVyuSQGoRXs1MUl7FFWLSuW5gCo6a70pWbcTfR5fkaXightgipqUcCuYSIZXs4CchN2bqekFqeuspPczhIysOxCXilxV+s+ewLI8Wfl+VyRvcCt9eG7Izv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iTJFzsG5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iTJFzsG5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 028761F00893;
	Mon,  1 Jun 2026 11:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780315093;
	bh=+SI1uKcTCYm5hNuk0j9Q0dod3ydBGuJaQIkghYKeFq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iTJFzsG5nXaiCsCiheLWVTpX+8jyCvXxIhmU6+gQdG0Ayobk2bLl+5zwiMW5Uv7qf
	 hkItqqavKrBPLNur8NONDP84BRCLOt0mzJv561nJfeNcPMcnBo3Sfl02Kq6q8d6b9d
	 S8tclAsg834ZlLmK3SnCU3GUsGE0MC/ZCby6idSbZxqgR/xo7UN/z/bjLI2klk6zKX
	 WtUgV/uoOmHlwNy1ps89oY/cdcoWqWuwNlsjh3TSLm9CB7AP1Bmk+bfKGrpkhkdDcC
	 VV81x3vHRgO7r2e80A3cyOstymQEK8aIuNNn3Fgd5vJLsSB2e8xECLpkhO0yJ2AH3r
	 y6Psb7oMWaK+Q==
Date: Mon, 1 Jun 2026 13:58:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: ASHISH YADAV <ashishyadav78@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon/pmbus: Add Infineon xdp730
Message-ID: <20260601-first-attentive-puffin-d7ca66@quoll>
References: <20260601090925.3781-1-Ashish.Yadav@infineon.com>
 <20260601090925.3781-2-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260601090925.3781-2-Ashish.Yadav@infineon.com>

On Mon, Jun 01, 2026 at 02:39:24PM +0530, ASHISH YADAV wrote:
>  required:
>    - compatible
> @@ -50,10 +58,23 @@ examples:
>          #address-cells = <1>;
>          #size-cells = <0>;
>  
> -        hwmon@11 {
> +        efuse@11 {

Explain that in commit msg.

>              compatible = "infineon,xdp720";
>              reg = <0x11>;
>              vdd-vin-supply = <&vdd_vin>;
>              infineon,rimon-micro-ohms = <1098000000>;  /* 1.098k ohm */
>          };
>      };
> +
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        efuse@12 {
> +            compatible = "infineon,xdp730";
> +            reg = <0x12>;
> +            vdd-vin-supply = <&vdd_vin>;
> +            infineon,rimon-micro-ohms = <1098000000>;  /* 1.098k ohm */

It's exactly the same as previous example, drop this hunk.

> +        };
> +    };
> -- 
> 2.39.5
> 
