Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4599634A784;
	Sun,  8 Mar 2026 17:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772989226; cv=none; b=F7+p1CieARAWux4ZeRZefaWXvQc9vnXXcq/PusPo2yRQ3y72LMOUktcs6inVV+gdT9kXNkMr+RKg8arRVy3GKoCH8r2KqxRJnTS50fMHS0KlMqKKqmfnlSvLM/4ha7T2iwq98cjbWAK9zgLs48HbKqhUeLC3yg/ibM4mnatzZmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772989226; c=relaxed/simple;
	bh=IWoJ+2WT1ISgb/UKfnuzPpHQqGWj/SikHRdtgBbkoJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pOq+G07AmVzWV9XKtjoI8/nXSwk5OyuHCXJU8+naeRxr3mP2zXOMGxY9VScL3o7FtMXv0p+MtI9hqIbjjspUB2nT5LHMXmF7fOx+yrDH9NIoNrWnFYzrlCswDihbvUFHhSUhX/S+hcwbQvm7Fjkaf03R5w50+TMI3NjMft60FqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jhj7Sg1K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jhj7Sg1K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6617AC116C6;
	Sun,  8 Mar 2026 17:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772989225;
	bh=IWoJ+2WT1ISgb/UKfnuzPpHQqGWj/SikHRdtgBbkoJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jhj7Sg1KPb8kVRk8MjelzUm5XoMgGaFXkhNjMkQ0KaYcylHDOGfPiCFrufCTPgdK/
	 hFJd6tw6RctBxgm4AUG4JZj2cXZr9m9tFvG6O5btH/Myi9kqJ/GjphHxmexmz/FWRf
	 +YNfbnfPCO27+oM4J+ftQB5BJx14JrXo+cFaPrzI5fjE1nU3kmIvAhm3Flpu4Slj3I
	 h2a8RNEcyw7gcjKCe2ATiqugs0nJelsEzFrvU7K2MLSYOUwVN0nt0f5LOlFy+MJV5H
	 +7k412XTH90UIQmAZvlqf5K+gjGXtyaPL+rKdtdFMyv1HPm2keZaoYKrVB2EBW9+cK
	 xDLkYVi1T6//g==
Date: Sun, 8 Mar 2026 10:00:24 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rahul Tanwar <rtanwar@maxlinear.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: moortec,mr75203: adapt
 multipleOf for T-Head TH1520
Message-ID: <aa2rKMGPnCc8lGow@x1>
References: <20260305144044.44208-1-zhengxingda@iscas.ac.cn>
 <20260305144044.44208-2-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305144044.44208-2-zhengxingda@iscas.ac.cn>

On Thu, Mar 05, 2026 at 10:40:43PM +0800, Icenowy Zheng wrote:
> The G and J coefficients provided by T-Head TH1520 manual (which calls
> them A and C coefficients and calls H coefficient in the binding as B)
> has the 1/100 degree Celsius bit (the values are 42.74 and -0.16
> correspondingly), however the binding currently only allows cofficients
> as precise as 100 milli-Celsius (1/10 degree Celsius).
> 
> Change the multipleOf value of these two cofficients to 10 (in the unit
> of milli-Celsius) to satisfy the need of TH1520.
> 
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
> New patch in v2.
> 
>  Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml b/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
> index 56db2292f062d..7d57c2934a8a1 100644
> --- a/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
> @@ -105,7 +105,7 @@ properties:
>        G coefficient for temperature equation.
>        Default for series 5 = 60000
>        Default for series 6 = 57400
> -    multipleOf: 100
> +    multipleOf: 10
>      minimum: 1000
>      $ref: /schemas/types.yaml#/definitions/uint32
>  
> @@ -131,7 +131,7 @@ properties:
>        J coefficient for temperature equation.
>        Default for series 5 = -100
>        Default for series 6 = 0
> -    multipleOf: 100
> +    multipleOf: 10
>      maximum: 0
>      $ref: /schemas/types.yaml#/definitions/int32
>  
> -- 
> 2.52.0
> 

Reviewed-by: Drew Fustini <fustini@kernel.org>
