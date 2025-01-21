Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3C01F4E32
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Jan 2025 16:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737475813; cv=none; b=PSSf3IVUm+tsJXRFA3V2dHU9SGPDX89QAehUslihHzZZ1mhmTwBjCfgxSzNaQYOG5uPcKJlwtRF1rQg21EDtJYq6OfHhgViSxxXe1ulHjnhJI543rEkAYz0GuikgYDMDsDbFhM3QgCBjGY0EkUVaLqWyD+XbkUvdyLb1bdd6aKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737475813; c=relaxed/simple;
	bh=1CNdK0ZwziHDMvp49QtbvJhzEBFH52RSONQKTbg3vKM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fg1RX5mkuv86ilhuKD3SaU1TWN0DC7INwkPfxEkP/84FA0P0OuUh6PcQ6x6+5gxKLC+Gzf3jkrv5+d79ectT7CBR7RsS0Aic93lHhLJ9wp9m8bw+nVsToJvK5ZDhIPNqF7W8x0eqwR3unTYEliTSDpSPv7PZ+X2FYwBFQ8YWSWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:5400:5628:9df0:d4b4])
	by albert.telenet-ops.be with cmsmtp
	id 3sA82E00R3QiWAT06sA8kx; Tue, 21 Jan 2025 17:10:09 +0100
Received: from geert (helo=localhost)
	by ramsan.of.borg with local-esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1taGpM-0000000Dvvz-26kX;
	Tue, 21 Jan 2025 17:10:08 +0100
Date: Tue, 21 Jan 2025 17:10:08 +0100 (CET)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
cc: Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>, 
    David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
    Simon Horman <horms@kernel.org>, 
    Russell King - ARM Linux <linux@armlinux.org.uk>, 
    Andrew Lunn <andrew@lunn.ch>, 
    "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
    linux-hwmon@vger.kernel.org
Subject: Re: [PATCH net-next v2 3/3] net: phy: realtek: add hwmon support
 for temp sensor on RTL822x
In-Reply-To: <ad6bfe9f-6375-4a00-84b4-bfb38a21bd71@gmail.com>
Message-ID: <a8da8aaf-adba-dbc4-3456-faae86eccd1e@linux-m68k.org>
References: <7319d8f9-2d6f-4522-92e8-a8a4990042fb@gmail.com> <ad6bfe9f-6375-4a00-84b4-bfb38a21bd71@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

 	Hi Heiner,

CC hwmon

On Sat, 11 Jan 2025, Heiner Kallweit wrote:
> This adds hwmon support for the temperature sensor on RTL822x.
> It's available on the standalone versions of the PHY's, and on
> the integrated PHY's in RTL8125B/RTL8125D/RTL8126.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Thanks for your patch, which is now commit 33700ca45b7d2e16
("net: phy: realtek: add hwmon support for temp sensor on
RTL822x") in net-next.

> --- a/drivers/net/phy/realtek/Kconfig
> +++ b/drivers/net/phy/realtek/Kconfig
> @@ -3,3 +3,9 @@ config REALTEK_PHY
> 	tristate "Realtek PHYs"
> 	help
> 	  Currently supports RTL821x/RTL822x and fast ethernet PHYs
> +
> +config REALTEK_PHY_HWMON
> +	def_bool REALTEK_PHY && HWMON
> +	depends on !(REALTEK_PHY=y && HWMON=m)
> +	help
> +	  Optional hwmon support for the temperature sensor

So this is optional, but as the symbol is invisible, it cannot be
disabled by the user. Is that intentional?

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
