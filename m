Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3082690C0;
	Mon, 16 Feb 2026 12:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771244147; cv=none; b=X6YyJjQOpYtoBWa50VoG5cMZrUdtl8QXOFJ5iS6iy8PR0rNCe62U7p8LSgR/cxluBIJUh9Ez0buR4emQQgWzHk1rNR9WgFnUXp7GwZQqUj6gNd0vvR8cDP/xxQJbiCs+gGPHvsG32XyfVaChY9L5JPid9XexcowSEoIzTPjkhnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771244147; c=relaxed/simple;
	bh=P/0XkNFt6Y7qOtSbIlMVIVDPWkCJW8egWendUV2pzoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OIdLl45bGChVhWdLbNkLXT2OcKUcA3IA1Kf4rcBljR5rkzBLwDnmtvryOfcNamcuE7s0SqgW6WhFXI14fOqnXwo9Df777LdTAoF/V8Se8jJPZumJaW5zWzDwTt9lKWCPJ97QBvG9PQkwEOPSKx7mJLnj9UBvbXP7KXlbmSbFTB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1vrxVj-0000000006z-44Ze;
	Mon, 16 Feb 2026 12:15:32 +0000
Date: Mon, 16 Feb 2026 12:15:25 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] net: dsa: MxL862xx: don't force-enable MAXLINEAR_GPHY
Message-ID: <aZMKXavVQPelSXcG@makrotopia.org>
References: <20260216105522.2382373-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216105522.2382373-1-arnd@kernel.org>

On Mon, Feb 16, 2026 at 11:55:17AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The newly added dsa driver attempts to enable the corresponding PHY driver,
> but that one has additional dependencies that may not be available:
> 
> WARNING: unmet direct dependencies detected for MAXLINEAR_GPHY
>   Depends on [m]: NETDEVICES [=y] && PHYLIB [=y] && (HWMON [=m] || HWMON [=m]=n [=n])
>   Selected by [y]:
>   - NET_DSA_MXL862 [=y] && NETDEVICES [=y] && NET_DSA [=y]
> aarch64-linux-ld: drivers/net/phy/mxl-gpy.o: in function `gpy_probe':
> mxl-gpy.c:(.text.gpy_probe+0x13c): undefined reference to `devm_hwmon_device_register_with_info'
> aarch64-linux-ld: drivers/net/phy/mxl-gpy.o: in function `gpy_hwmon_read':
> mxl-gpy.c:(.text.gpy_hwmon_read+0x48): undefined reference to `polynomial_calc'

I assume this happens in case CONFIG_MAXLINEAR_GPHY=y and
CONFIG_HWMON=m, right?

None of the PHY drivers seem to adequately prevent such situations,
which in my opinion would be worth correcting, ie. by preventing any
PHY driver using HWMON from being built-in while CONFIG_HWMON=m.

> 
> There is actually no compile-time dependency, as DSA correctly uses the
> PHY abstractions. Remove the 'select' statement to reduce the complexity.
> 
> Fixes: 23794bec1cb6 ("net: dsa: add basic initial driver for MxL862xx switches")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

As there is no compile-time dependency, this change is fine.

Reviewed-by: Daniel Golle <daniel@makrotopia.org>

> ---
>  drivers/net/dsa/mxl862xx/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/net/dsa/mxl862xx/Kconfig b/drivers/net/dsa/mxl862xx/Kconfig
> index 4db7bab21a71..3e772298cc89 100644
> --- a/drivers/net/dsa/mxl862xx/Kconfig
> +++ b/drivers/net/dsa/mxl862xx/Kconfig
> @@ -2,7 +2,6 @@
>  config NET_DSA_MXL862
>  	tristate "MaxLinear MxL862xx"
>  	depends on NET_DSA
> -	select MAXLINEAR_GPHY
>  	select NET_DSA_TAG_MXL_862XX
>  	help
>  	  This enables support for the MaxLinear MxL862xx switch family.
> -- 
> 2.39.5
> 
