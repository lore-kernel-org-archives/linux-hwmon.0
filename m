Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561F325C818;
	Tue,  5 May 2026 21:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778016771; cv=none; b=CGsiyyH+0tyi7gLIRUSiVS6a7WhBcfFfP64hucdKOZrywLfo/M1en+9NhQimDpKF2l8+vGoJh1KVkXIJB/rRu3iSdCiK01v27uidskCqpWFyXuE2hv3bs2/DTHVWmwCE6l4PL8zegJ4cKhU7nG/pi8rXfh20Q8FfzdgbqQDTwFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778016771; c=relaxed/simple;
	bh=mlvEEAk17e5BxmwUSgibM9qoq/iMOYUgH8N0bxjBL+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sTkOMqE/20Ga4JOJyYDkAOXe65Nyc6PMJ8/q0FlCGR0sehJg3bU1c4uRI5nC53hqVwQHfDE/3GKwR9tgrM/Gblg/Kq4q+nT3FI978TlIGFcC9qUAIWaZwaEgreiaz/RfUCoczFeVaY1kzfmR5GH4T2wB5LcB6Ty4IhGeouUWjGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gkq7dWOr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gkq7dWOr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05899C2BCB4;
	Tue,  5 May 2026 21:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778016771;
	bh=mlvEEAk17e5BxmwUSgibM9qoq/iMOYUgH8N0bxjBL+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gkq7dWOrSuULmIV6OtK2UjD/KTvrTL+08r3OdlAbIugbQx/1xoDSzUHUOIB994uNW
	 iAj4ASB7J+xFs8p1dfGMa+gaB1ZsW0IaTz9FYOzUeP8MUX85vm6aX5qdatArc4XucC
	 cJU2m7oZEDOWCI4UE+N3yN0k30M9xtxcA8qtUkBOOxhe2BZUdwdpParUCzhwjW0Fdy
	 5M0amcqIQGmh377R63AYr7RJlrnW2kjWrbyHv95k5htc1SvMSaXWypyFOtaVtpwzFg
	 ArW5Nr79g8fR06J2dej4ugqUr29BbGYXRL6Cn1Z0W5piuKsSq+ktuAUuXAcVR6Or4f
	 U2qBRti79iBSg==
Date: Tue, 5 May 2026 16:32:48 -0500
From: Rob Herring <robh@kernel.org>
To: sashiko@lists.linux.dev
Cc: Akhil R <akhilrajeev@nvidia.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 01/13] dt-bindings: i3c: Add mipi-i3c-static-method to
 support SETAASA
Message-ID: <20260505213248.GA4000045-robh@kernel.org>
References: <20260423085718.70762-2-akhilrajeev@nvidia.com>
 <20260423112311.E2902C2BCAF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423112311.E2902C2BCAF@smtp.kernel.org>

On Thu, Apr 23, 2026 at 11:23:11AM +0000, sashiko-bot@kernel.org wrote:
> Sashiko AI review found 3 potential issue(s):

Does anyone read replies to the bot? If so, why was everyone hwmon list 
dropped?

> - [Medium] The `mipi-i3c-static-method` schema incorrectly enforces `minimum: 0x1`, preventing devices from declaring no static address assignment support.
> - [Low] The `assigned-address` property description is now inaccurate and contradicts the new capabilities.
> - [Low] Missing macro definition for Bit 2 ('Other CCC') in `include/dt-bindings/i3c/i3c.h`.
> --

This should go below the quoted commit msg.

> 
> commit dbfc3abafb12042fa0c42239f7ff49c55d30eb3d
> Author: Akhil R <akhilrajeev@nvidia.com>
> 
> dt-bindings: i3c: Add mipi-i3c-static-method to support SETAASA
> 
> This commit adds the 'mipi-i3c-static-method' property to specify which
> discovery method an I3C device supports during bus initialization. The
> property serves as a bitmap where each bit indicates support for methods
> like SETDASA or SETAASA.
> 
> [1] https://www.mipi.org/mipi-disco-for-i3c-download
> 
> > diff --git a/Documentation/devicetree/bindings/i3c/i3c.yaml b/Documentation/devicetree/bindings/i3c/i3c.yaml
> > index e25fa72fd7857..225844abdd1fd 100644
> > --- a/Documentation/devicetree/bindings/i3c/i3c.yaml
> > +++ b/Documentation/devicetree/bindings/i3c/i3c.yaml
> [ ... ]
> > @@ -147,6 +149,27 @@ patternProperties:
> >            through SETDASA. If static address is not present, this address is assigned
> >            through SETNEWDA after assigning a temporary address via ENTDAA.
> 
> Does the description for assigned-address need an update here? It currently
> states that if a static address is present, the address is assigned through
> SETDASA. This seems to contradict the new capabilities allowing SETAASA.

Yes.

> 
> >  
> > +      mipi-i3c-static-method:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 0x1
> 
> The description below states that "0 indicates lack of support", but this
> minimum validation prevents setting the bitmap to 0. If an I3C target has a
> static address but relies purely on ENTDAA, how can a developer override the
> default value of 1 to specify that no static methods are supported?

0 is referring to the bit values, not the overall value. However, 
whether 0 should be allowed is a valid point.

> > +        maximum: 0x7
> > +        default: 1
> > +        description: |
> > +          Bitmap describing which methods of Dynamic Address Assignment from a
> > +          static address are supported by this I3C Target. A bit value of 1
> > +          indicates support for that method, and 0 indicates lack of support.
> > +
> > +            Bit 0: SETDASA CCC (Direct)
> > +            Bit 1: SETAASA CCC (Broadcast)
> > +            Bit 2: Other CCC (vendor / standards extension)
> > +            All other bits are reserved.
> [ ... ]
> > diff --git a/include/dt-bindings/i3c/i3c.h b/include/dt-bindings/i3c/i3c.h
> > index 373439218bba6..8409addff0115 100644
> > --- a/include/dt-bindings/i3c/i3c.h
> > +++ b/include/dt-bindings/i3c/i3c.h
> > @@ -13,4 +13,7 @@
> >  #define I2C_NO_FILTER_HIGH_FREQUENCY    (1 << 5)
> >  #define I2C_NO_FILTER_LOW_FREQUENCY     (2 << 5)
> >  
> > +#define I3C_ADDR_METHOD_SETDASA     (1 << 0)
> > +#define I3C_ADDR_METHOD_SETAASA     (1 << 1)
> 
> Since Bit 2 is documented as "Other CCC" in the binding and the maximum value
> allows combinations up to 0x7, should there be a macro defined for Bit 2?
> Adding one could prevent device tree authors from needing to use magic
> numbers to represent this capability.

Yes.

Rob
