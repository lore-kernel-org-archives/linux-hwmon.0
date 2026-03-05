Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341343E3D8E;
	Thu,  5 Mar 2026 18:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772735812; cv=none; b=sDg6Da5B7DClkAPX/OAnk+ShXa/Nb0/BcPw4MvLlrccLTVPDj3MllWXKCSXhdu2QfUTF2t4q3JREw5Lp+LFMU6rYrIG6Vkk7MD4Iu175pT/X2TUzsaLLzaNt52rbMqlnMRRqsSnlgOL/kBYZ67paPo1WFzMS1K0/IKB5KSGmI30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772735812; c=relaxed/simple;
	bh=Whg/hIZbOF6tXEF4F3csQFFHoNwEtpzfdvQw9QJy3NE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=peNzPjG/Xs4sCUk7QAE7V1h0st6Pu6K8blHmLVWxgqJ4LYa1kiDJhGccSflog+2jTLniix2ITuf2+tC+g6jFGvsF2lkJSmDZ2RwZlC2hgZ+61BpOPF5hZAubJIxJHogigNnLx+OJOQzUuMgHa14FgLLfwXOV5fhODfkEtuG/hpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A3yBbqKf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A3yBbqKf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1AE2C116C6;
	Thu,  5 Mar 2026 18:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772735811;
	bh=Whg/hIZbOF6tXEF4F3csQFFHoNwEtpzfdvQw9QJy3NE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A3yBbqKf8hHOCrLK69AVcL1vK6nXN29SSQUXo5wfitwELGJyX4BZj9LUIAhvvLnLM
	 Y9PONmBhNFlj/eIQO9KVF6FJfA1HKBOnh3+1qW3yrIXYzEyR0pnbrx+BWPcFLi8jFF
	 CagB9g4Rr9ivGLeL4HgS7MF87CWfLGUL4AYRB6UJfkQ64rsp8j4Wf77d6PwnRDOB2p
	 6lJXzZ0KjZqHjwaQqgdBQn+7eQcghrjC0t3g7xKRKcKLD0fFKHhzuUYmPpq7dpwRn5
	 tJ9oGRQAZ3DyoKUZ4OlC4vuJni6Vq9124loHGOeevn0qarbDqbxLl6m93fmyrLCkLx
	 lX3YA2+Rp/EoA==
Date: Thu, 5 Mar 2026 10:36:49 -0800
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
Message-ID: <aanNQSHxLh2OsbvK@x1>
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

I am wondering if there is any backwards compatibility issue but there
are no other users of this compatible in mainline other than th1520.
There is also the precendent 030d2a0ce5dc ("dt-bindings: hwmon:
moortec,mr75203: fix multipleOf for coefficients") having change the
property. I suppose it is a not a problem unless other people on the
list raise an objection.

Thanks,
Drew
