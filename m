Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722F1233721;
	Sat, 14 Mar 2026 16:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773507389; cv=none; b=dPjPR5dYG1oAYZBpcuBaQiZT00vYy4PUVtJy1w90pY0wY+7hgvRmTQIJOWLJ0iTdCc/yI2RvIMYErc2c3jIrLgOIwq89GnYv7DRXDphWcXAcZqL5wFP+VnYzdUKWH6as66oXkO0HYa/nLwFFaDMBC0GlQPrghcyHDGq+A4ZMtBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773507389; c=relaxed/simple;
	bh=K2/51MC7bI/87I8mto05HaeOL1q9UD0Pz5lwJ/71o/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XDWEvyEXOW1rHs9697G0wFb9v4pyXlSTTnGFjHCRkaK6+X6WpRntjwMUvlgknA9N49PBkvqslSjRVmxZumjB5LCxb5VLeWsd1xhgPftvdUhFTN15IlpxTHRC3BhbeO/ai7tP89fxxIVmBjgbBxNIEs02fGQoEprXPRqXi4YjP98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UsJ+5EBH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UsJ+5EBH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC902C116C6;
	Sat, 14 Mar 2026 16:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773507389;
	bh=K2/51MC7bI/87I8mto05HaeOL1q9UD0Pz5lwJ/71o/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UsJ+5EBHkfaXYTFY7PI8OeYdt2u9isrCQDZ4tpK+CcWe3/Iqum+vK2TSUaJUtWi4I
	 KiDqjZXijttMtJsUrSPSAMIPwY6BPPyrDYeyPf8pzVAOnqnOL2lMzdS+HN9AphXA58
	 nkHrlvYUxMJ7nGDyb320oQamwGcjKwjypuNryunDbDwisHbMciB22vEKIySphyF3aI
	 pBtj5KfjH9r9DvDRUn5qF7BU9qhIUwd5wupk7aCk1ABHJPoEk6sEoLjbIqmcd2AfAo
	 3XT/f1G0ngCUCorEXlPj70ExYWaGAN3r4/imwUBcJB1qST7m0tClf1mXhq9FP6UeQI
	 z3oc99jzfi/aQ==
Date: Sat, 14 Mar 2026 09:56:27 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rahul Tanwar <rtanwar@maxlinear.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>, Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: moortec,mr75203: adapt
 multipleOf for T-Head TH1520
Message-ID: <abWTO7QBFIcjxKn6@x1>
References: <20260309162457.4128205-1-zhengxingda@iscas.ac.cn>
 <20260309162457.4128205-2-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309162457.4128205-2-zhengxingda@iscas.ac.cn>

On Tue, Mar 10, 2026 at 12:24:56AM +0800, Icenowy Zheng wrote:
> The G and J coefficients provided by T-Head TH1520 manual (which calls
> them A and C coefficients and calls H coefficient in the binding as B)
> have 1/100 degree Celsius precision (the values are 42.74 and -0.16
> respectively), however the binding currently only allows coefficients as
> precise as 100 milli-Celsius (1/10 degree Celsius).
> 
> Change the multipleOf value of these two coefficients to 10 (in the unit
> of milli-Celsius) to satisfy the need of TH1520.
> 
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> Reviewed-by: Drew Fustini <fustini@kernel.org>
> ---
> Changes in v3:
> - Added Drew's R-b.
> - Fixed some typos in the commit message and slightly reworded the
>   precision sentence.
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

I have applied this to thead-dt-for-next.

https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/commit/?h=thead-dt-for-next&id=eb4fd43ff6793681f0a0a8e8ac861142caba2b19

Thanks,
Drew
