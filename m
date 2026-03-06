Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8629437C104
	for <linux-hwmon@vger.kernel.org>; Fri,  6 Mar 2026 23:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772840019; cv=none; b=i0BmeRn6Ofgm0lGMYQ3HFWk9jqQFk0PVJZxqF4YEzbparYBw8xTkC+lCRUGPJkCGht/OeNXBy3J8TXvlJA4WWn4aNReUI933VoZViQs9AdF09TDqGGBeAPLuIO2Yt1Z7TjyUI/hMeAgm80P4BOwuQZVJVSwscpmbWlqvDn98h9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772840019; c=relaxed/simple;
	bh=plzyiDYL13gMDVwQr9Dj9f8cir0m0t5cKB6vFZUg2cY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FuEi0i166b9jt/89/fKAOEPLAW1bJ1/H7zL1b3/nRfiK3Q7Xu56OMzNWIyEM8XCaRj6cdVi2ipKB1a47SkOcYQ6jqz+mhQc3kkJjp2xrYR41NrbKnpSsKaRWiu1oghBvx4iOTz6Ng+mMgpoyfiF2FaSUbll4mrru1IglLflaZq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/wZENZC; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/wZENZC"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35980423087so3336478a91.3
        for <linux-hwmon@vger.kernel.org>; Fri, 06 Mar 2026 15:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772840018; x=1773444818; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A3n1MjNRco+xhIuiD22YqqFeZmP/U2HpmvCL9DYQOmg=;
        b=N/wZENZCtnWx8XFZ0kyLD+P1jMXI1eOOU4pu38Tub9fp/sFNmGx7bJ6qd13qqxBcd+
         9FxIPe26xE++UcdJThW6DFIdREb7TCRSAGOjb6V8a0HCiCpU70tT95TNpuRqal93lshz
         5vU67DX3D6ChDH+R/zzpwpvbFk9gPuz7Wg+Km8g8Aon1r5rnFJ+/xXlE6pXG9Qg34Thq
         pZBOW1J0CnrWpASKBSjPOtVzyascg0vhc/yEqdDpDvuXRBOa5tzst5rcOBdoft+lriaU
         kTtCKnDMNFjElDDX52pUfaqOQSWk4znRHWesOW63O4+fQLkSSIyQFUsNy094v+Vog9su
         GUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772840018; x=1773444818;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A3n1MjNRco+xhIuiD22YqqFeZmP/U2HpmvCL9DYQOmg=;
        b=EJkNyq88Q2zu5O8xWEDd/nUYxNVJvsduQ0q/tCUXRbDYyYxyW792LFNxfDbdWdxcHf
         jHcsfDuDJp74J2oo/rTYUmyjDBE2L1FZ9h8apWtiNS5hXYmQk9ThrYx6JEKCNuHwHsOq
         ulttlsm2jlvhcX5U4ByXlrQlYHSwR/cZX5iOqZqFzgPcdQK0fCoNhHmTDeXaebJ8D8id
         EA7r9O3fICE/Ac3C4Qf9ajcdQY4Z8cJEy9g9CCQrNLlo3pUbs9qhJrD48rsPfylzQB9e
         vK3H8Hgmd3dVcKrmc3A43vwVU6j6UlgWQJJrsy5nRpQq9eO1Q+UEKkko5gHbj3kLgZ1H
         GrDg==
X-Forwarded-Encrypted: i=1; AJvYcCU6kxBVoVtJVTSSBXVOukh9ezeKBeiSWwAfpij+I6K3HzvK2KgmHtFrUeBXygO7GkOI45xv42a882tPeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YztJhzSoZxpfozajSZCNS7MSL94cNmO8c/vuYtbE64qSPkPbXlL
	61riuE2mo6lZtwhEIVJP6f7ZfvM3l9bDThGQgY3QCquZjxo0cEppn2wV
X-Gm-Gg: ATEYQzxe5FwSDWMNlpmv2JhpBbiWXInXGY7rafLL02BYOsfi7hlc1hmYGRrFu22amw4
	LUtyMK8BWXbwG0E7Wh1VjrUJT3fz2JeOesdD+gJK/0eIi7Yddj6YvZLROhRtmQLLrpZY9Sa448/
	JbbpT2mWLMuAsdx5nxQ9DR9S2DimOyEiuOMlJHpY4xXtFRs+nC+odY+80EdB7SgZEj/3/hYMG+s
	Y++3teJ4rm/wxq+QnFgWZvPjS5uSTlRYeC9+bv/ywr2txerMN+//EE9vnVpddSbAVjNDmWlohDo
	K2hVbDYyTDMKaj5z18Y5oRJIWndYakBEa+Sz1CNAVR8kc7vjuNqjkvoG3j+xhgzNI5MwXHQlo1V
	wBKjWdYUXOIPTOPR2sHHGqZVMUUYXMh2bR+qsqH1L1xdeGOf7jvHSiygNzIGj5YF8nacn9jvIIb
	ekjvXjMFdJrFPKIg/DiRbrwxsMmWCC2DKxMepD
X-Received: by 2002:a17:90b:38c4:b0:32e:528c:60ee with SMTP id 98e67ed59e1d1-359be31746amr3476775a91.24.1772840017833;
        Fri, 06 Mar 2026 15:33:37 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2de79f6sm6579296a91.9.2026.03.06.15.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 15:33:37 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 6 Mar 2026 15:33:36 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Vineet Gupta <vgupta@kernel.org>, Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sre@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-leds@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 10/14] watchdog: convert the Kconfig dependency on
 OF_GPIO to OF
Message-ID: <07aa5d40-96b6-41a1-b8ce-22f2c2c94aed@roeck-us.net>
References: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
 <20260304-gpio-of-kconfig-v1-10-d597916e79e7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304-gpio-of-kconfig-v1-10-d597916e79e7@oss.qualcomm.com>

On Wed, Mar 04, 2026 at 10:02:31AM +0100, Bartosz Golaszewski wrote:
> OF_GPIO is selected automatically on all OF systems. Any symbols it

Actually, that isn't really true.

if GPIOLIB
...
config OF_GPIO
        def_bool y
        depends on OF
        depends on HAS_IOMEM

OF_GPIO also depends on GPIOLIB and HAS_IOMEM. I don't know why it needs
to depend on HAS_IOMEM, but the GPIOLIB dependency is real.

Guenter

> controls also provide stubs so there's really no reason to select it
> explicitly. We could simply remove the dependency but in order to avoid
> a new symbol popping up for everyone in make config - just convert it to
> requiring CONFIG_OF.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/watchdog/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index dc78729ba2a5d6e035ed3cbe5c2b631d11b76b20..ef200339a22a6f9c51a46c9c0b8466add74313e2 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -250,7 +250,7 @@ config DA9062_WATCHDOG
>  
>  config GPIO_WATCHDOG
>  	tristate "Watchdog device controlled through GPIO-line"
> -	depends on OF_GPIO
> +	depends on OF
>  	select WATCHDOG_CORE
>  	help
>  	  If you say yes here you get support for watchdog device
