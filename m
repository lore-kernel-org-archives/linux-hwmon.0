Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437F626159E;
	Wed, 25 Mar 2026 08:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774427053; cv=none; b=pvqk52eD04bXM3nhvm7V0cgKz0pMdz7oZ8IycPdpdpGs5c6/t7Tc/AZ8NyTkNzs+liaJBih5wZsJN5SehK4Cfzh6ONyHNCxWy+pe2X8D2HspFVX0NuJjK8Zzzv1NrN3IQ+JTz8e9pBeTLngMBphvenWBVqvifq2pqNyvGWatkb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774427053; c=relaxed/simple;
	bh=k5PHQe3iVJCGlsRJbm6qyUMIgyWVPZaZc+XjwC2x4pY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HKbZS46i72fFx3NsIi2d4RLc2+Wg3Uz14Wsp4XBzoVXCDDkyTEijqGselUlyUO/qmJLNKm/soP+Uvb/9pdtaROX1/2YGpF7iugKKrNCLsIbjL2ZqkB3UnBPAOF53uhxfggzA0Ogk2UdGT0rRWKUJVdDaJuDoLjpCnZw9BeKjMns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=syG3GYCG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="syG3GYCG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29F43C4CEF7;
	Wed, 25 Mar 2026 08:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774427052;
	bh=k5PHQe3iVJCGlsRJbm6qyUMIgyWVPZaZc+XjwC2x4pY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=syG3GYCGUrAo6xDxvXSh3i3GQltOpzzWe/0ZVL8WwF8kzDWOWEK0GqQOU73IXgcKD
	 HSRhpjEGvKGrtCk9+ipuM+9fcReH48CiGqJ8FryxjPtAw3v5EiTmuw20qdIDGf6G17
	 7DZcim8TEAsq0ZRnv0yAQHYlEpgICuhXFCqtz85xRu422M+CMG0M4jOwiG6/p+hRTy
	 64guK7ZRaSKRkkXWdVW9y0w8uYy8NdOZ/3SeVmBei6a9Z3L4+XVZIvWGuYoitTgpSF
	 Jfn1FbZkmQCpD81OU8jZXl+0PQIMGSvbiJLQj1Thu8vl/FFe3Der8bJliLWHZwQuHy
	 RvBGiqrtCjeRw==
Date: Wed, 25 Mar 2026 09:24:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dawei Liu <dawei.liu.jy@renesas.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Grant Peltier <grant.peltier.jg@renesas.com>, Linda Xin <linda.xin.jg@renesas.com>, 
	Tabrez Ahmed <tabreztalks@gmail.com>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: isl68137: Add compatible
 strings for RAA228942 and RAA228943
Message-ID: <20260325-intelligent-auk-of-tempering-64cad0@quoll>
References: <20260325041728.68-1-dawei.liu.jy@renesas.com>
 <20260325041728.68-2-dawei.liu.jy@renesas.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260325041728.68-2-dawei.liu.jy@renesas.com>

On Wed, Mar 25, 2026 at 12:17:27PM +0800, Dawei Liu wrote:
> +      - items:
> +          - enum:
> +              - renesas,raa228942
> +              - renesas,raa228943
> +          - const: renesas,raa228244
>  
>    reg:
>      maxItems: 1
> @@ -149,3 +156,13 @@ examples:
>          };
>        };
>      };
> +  - |
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      regulator@60 {
> +        compatible = "renesas,raa228942", "renesas,raa228244";

No need for new example - does not differ from the rest.

With example dropped:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

