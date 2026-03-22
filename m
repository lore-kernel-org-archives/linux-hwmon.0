Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026EE31F9B4
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Mar 2026 22:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774218369; cv=none; b=JqGHgWVW9El5CUOL9r+pTWE7unpPExh/EFsFxU04ZbMXMVzLFGmF4Vir1zM2MaIFtw6DckRm5zntxrnIk0MOQpNpSBV0RzyBQ+fc1ZxNwp7lQP/jDGW2VoWPOizWop1Ufi0N4zPo9IbXWkgmA+zhtpKUPMKqmtQcPp7gLzK6CZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774218369; c=relaxed/simple;
	bh=ELcx204Cby/dJnsY8H4NrZVX+UUsPAla3X1U1xwxuPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V7K6Fgw9INwCyY7oQPQ7cl8oEPZ7riZ4OSDKHqhaDZ2PnxfQ2PeDhlRGcGtudO7NvpUbXmTTsF61u/aH9+NdQXngo147CRpWwtPqbOOE8l4r2ebDZcaVz54RV6AjlnGFPAE8SZwDNUgrC8D/6BBBaPdDHQ5eMMikm/D6uPmvRco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h6+E9+uL; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h6+E9+uL"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2ba895adfeaso3911360eec.0
        for <linux-hwmon@vger.kernel.org>; Sun, 22 Mar 2026 15:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774218367; x=1774823167; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+mst3cEdRUvZvV8FPAK+ab6xPtMgdVjX2HSYh8y/2ug=;
        b=h6+E9+uLA8xRXNgJferHczQafyyNfWNDUBvAT4x0tADovM1UnNssK7ZVWrjyvYG82n
         Am2bw6wx3hSf2XkDhk8z93gIdfdRT5bMOzuapMmK2n3Xp+aSv8B3jQf5lliuOAeM6BaO
         YaUtkUyAay0I8wYaSqZPGvsoQ7M5JmNqQkcfNrIwVbwfIzAGeW3o8GGYwyvDCr+RK3TW
         wus0I234JZvMLDHBR7LSi/4r//62KExFUSPOXXndjXv3DfrX04UBwt4PAs+sMNQ0yJ3c
         +5uTEUOkVhomhMkKraS7iP5Iz84IhS0t6NqKzSJBOs16ht0izRnh8okWM4aR/76An0ch
         Hvhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774218367; x=1774823167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+mst3cEdRUvZvV8FPAK+ab6xPtMgdVjX2HSYh8y/2ug=;
        b=QcPV79aFOsw03HQ/xo1Pcmp6KIA/BPG305xTky282m4JA+J6naYdpU+cTk/l0wtRzf
         HSxmnQIl6d6q4j5FESuRastcvC9o7wVBJ/hTBL6rHEcWVi6a0Jm6mNo+s5yvep3j0dk/
         rCl/GwWMcm12x17hpeCORijb6lOky+8/EfuZEbQyayBUgDubl81H1DYmtY82Ydt/y2T7
         YaA8cXiSoLwIlzzB0NTqZ5yFDIHKGSNmcoKD3u8utQgFQAQQOsdpMGW4vrxlPxp2HlAQ
         7OnHcrc4exT+JtWitzUHsKvyz05paw/CGsiA8mSIQ5Iu25chgP78dzv9Of/mmKQPtNR1
         Y9AA==
X-Forwarded-Encrypted: i=1; AJvYcCXhuLkHqFyqLDGpm6qLCCCiCr6ZM0a8/nyykgzTd74p4fR+sBMoPkSlNywftigR4jhqvX/rx7LkXyuIzw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9Xk/mI+xoqGeJoavX4+hQYbAvgTMzfvy5TYOTLNe/8MQ7QPx/
	2ZvWJkscdn2PAFKP0H98UYbQJqS6PwGngeChMkeW6XYUmQSpTMWRzPJvs4tlU/Hs
X-Gm-Gg: ATEYQzx72O11N6faUIxqIY9HyjipEVyLBH2Ii0BTqYrEyfO7yRXtNakBpVNCM55eA1b
	ZWQpJyBfaGaa08+/9+vmRW0BUK4IpnZO4MzCYR/M9gauVN3FjmtRQTvGhcrl0odEpls5WkdtgW1
	xKgyPUvgs7pwnGIlpM/AtDyNx2338Uz2nux4vBuEQnSB8jaB6pcpp/9PAaWFc5Nv3H6iS2NNyvW
	zDPp/QFXNCYHV+0W4NybgaW54Uc0FfB53ZoFFL2E+DtPyAg9IZnf9iDQjM7ZI+W7RItqlMgq9jM
	yeBl+rFZB4KyioAdmWfYn5uIjBAZ2JHYJ/zVVlrD00eUbSRPWZC09bfWVQ0SnmqBj/hO14jA7cZ
	i+sd9ahPF1RaUBBHYTFUl9e+KrWCw7JApttgXLEmYHAgC4wqa4jojs8o43/YHHzimrwP/xA7A7h
	NSLLZ9fvL01LZGO+g6KBlIw51DTUxmpMy0ss1mNyp0OEZCkttjKZmFT+fdQ+lDJh43
X-Received: by 2002:a05:7300:aca2:b0:2c0:be45:6815 with SMTP id 5a478bee46e88-2c10981e483mr3694786eec.32.1774218367042;
        Sun, 22 Mar 2026 15:26:07 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:b768:22ed:3eba:aeb3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b31bef1sm13678234eec.26.2026.03.22.15.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 15:26:06 -0700 (PDT)
Date: Sun, 22 Mar 2026 15:26:01 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Romain Gantois <romain.gantois@bootlin.com>, 
	MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Guenter Roeck <linux@roeck-us.net>, Peter Rosin <peda@axentia.se>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Mariel Tinaco <Mariel.Tinaco@analog.com>, 
	Kevin Tsai <ktsai@capellamicro.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Eugen Hristev <eugen.hristev@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Sebastian Reichel <sre@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Hans de Goede <hansg@kernel.org>, Support Opensource <support.opensource@diasemi.com>, 
	Paul Cercueil <paul@crapouillou.net>, Iskren Chernev <me@iskren.info>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Matheus Castello <matheus@castello.eng.br>, Saravanan Sekar <sravanhome@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Casey Connolly <casey.connolly@linaro.org>, 
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v2 2/2] iio: inkern: Use namespaced exports
Message-ID: <acBsI0PxvxDGymCa@google.com>
References: <20251209-iio-inkern-use-namespaced-exports-v2-0-9799a33c4b7f@bootlin.com>
 <20251209-iio-inkern-use-namespaced-exports-v2-2-9799a33c4b7f@bootlin.com>
 <20260111170222.43aee69a@jic23-huawei>
 <20260322122529.62093f12@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322122529.62093f12@jic23-huawei>

On Sun, Mar 22, 2026 at 12:25:29PM +0000, Jonathan Cameron wrote:
> On Sun, 11 Jan 2026 17:02:22 +0000
> Jonathan Cameron <jic23@kernel.org> wrote:
> 
> > On Tue, 09 Dec 2025 09:25:56 +0100
> > Romain Gantois <romain.gantois@bootlin.com> wrote:
> > 
> > > Use namespaced exports for IIO consumer API functions.
> > > 
> > > This will make it easier to manage the IIO export surface. Consumer drivers
> > > will only be provided access to a specific set of functions, thereby
> > > restricting usage of internal IIO functions by other parts of the kernel.
> > > 
> > > This change cannot be split into several parts without breaking
> > > bisectability, thus all of the affected drivers are modified at once.
> > > 
> > > Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com> # for power-supply
> > > Acked-by: Guenter Roeck <linux@roeck-us.net>
> > > Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > > Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>  
> > Ideally looking for a couple more Acks.
> > 
> > If any of the maintainers of other trees who haven't already replied
> > have time for a quick glance that would be great.  I'll spin an
> > immutable branch but I'm not really expecting any non trivial
> > conflicts unless there is a new user in flight that I've forgotten
> > about.
> 
> At this stage, given I'm still waiting on replies from a couple of
> subsystem maintainers, I'm thinking we'll do this next cycle and I'll
> provide an immutable branch based on rc1 for anyone to grab if they
> run into merge conflicts in linux-next.

Sorry, I just acked the input bits in the patch, but in general I feel
these kind of mechanical changes in consumers do not require an ack and
you can just go an apply such changes.

Thanks.

-- 
Dmitry
