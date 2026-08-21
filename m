Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F76A46A607
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 10:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787307772; cv=none; b=hC+DYXE19s/VYDEBen57/meb8NOcy53c44pICIEDAaJd9+s7D9tJJza/skWpd+XYPe0M+XZhX/i2uCM4M6zMx1nQkVv/5gqleldT06eeOzhiBhO8u6KT3NCCN1AzMeC9l/RLQF4D6Pt+I4APIZf2YaF7zYAZOwFYRkJDwsyr1ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787307772; c=relaxed/simple;
	bh=TajKrkP7iAilCm/Wf9qOw7yL7OS5AMPI8Bf5cDTLAK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 Cc:Content-Type; b=f2KMHHT99iNklM8VTj2jUz6jpbjG8nLZO+aM7LvGaPiRKCt2f+Ix32T9GaKtu34nT5EjwQJCkOgbkMhx/guhwwRhOkRq3yBByzNtiQj1xPONy8iYP+ebYrSAD6m06Er90qf1KmOkDUovIqZWDELn6A+3XVAkhzkIgEO20D10ZRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-977168e4f3dso620758241.0
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 03:22:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787307765; x=1787912565;
        h=content-type:cc:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NZ9qFWwtyy0CyLFBazZArycje1mFKlJigB1GC39CAP0=;
        b=s3EmI4eBZuFfBy/u1zdOPsB5OC49k5tLxs3uyUhyGuLCMWc3q0KevS6rDBtoUEAsnB
         NngRtLRkmkaQS1hW0NzH4vOIDy06HIfW+sL3x37oXz8R6fMCRNt2nXDJeK/ad6wNiLJt
         hm/xLN2CWb8Ma+kxMy8b0k0gUWg+QeSePAsJB7g7XviJnS6g0us/cs+5yf5Pt9OKkQov
         oGxNY5CzqTTfTHVeaGVWfrng1cO+l6t2D5dJzO/omsvfvyzm+Bej/tgKqMlFL4g295rB
         VhI0D+vNEQMukqgONyjtg5vA1UkdzZo925iCqlmk8ohN8EmT30HIS9mw2HVLTZFyqH0s
         WGjg==
X-Forwarded-Encrypted: i=1; AHgh+Ro5uaPXGwtzT0aOaU0kSleCwYbflmKhpO+Cdr/0DDQ/1B26fEAEgYXaLy3rz9Fhgj4qXukFm9oo/GjtoQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mbTfb52YwcI0GISKVz7wAtUn3O11YnGryeJbeH8LUt7r9+pEIo
	FsfwaloEO2JExytY/IJeJHjEE0t00bSX8biJKfYJEkNKGQDWjNiPW/3+L4SB4zZ+
X-Gm-Gg: AR+sD1018Uh+2bWuSCUeDQc0o6nV2OyTXJARoL8bI5dHK0zszDCcH9aPbVIUi9bgp0m
	TuVQAmU5N7I6aKyVEUq/Agw3ZJ0dbUumGUh8s/TcF5SfVLuwQWP+Nmr1DTwwtDGUohZPUNJ5dwE
	mI1YDwvcB/+1Yw9MrGXuMb+3RSgmca6GytfKIFJCkFVcFhvWO3lCZS6cU/TRIHY8Kmwem310g9x
	PqYXdGfvqZ5ZQXA+kn9jsGSzDfhaqVPtAV91Hqwm3Sv0sARm4cKy7kpvBDYxud/YyILzlcxRRJv
	3BQwa+9jft34xrup98sjQ+AhM/faXjquyQkYHp2bzjdqFlNXrtPS0fxMKIgS/UwC0tUygDiNURe
	u4CGUpmzpPOqWqXjEua6oBN7X5T/FSHQ43Wlu/3ZqjCuUsNoVxJBKvqfrH18won5xQlvjXO/BGg
	r5lih6iYFxPjVXyxjY5lUYP/clKbBqqdg0KwS37daH9F/VMXqcUzsyyAg7VD9C0R91BT5juh99+
	NFsLmmR9rInFR04kyC0pPARzw==
X-Received: by 2002:a05:6102:f8c:b0:77a:7cd:8473 with SMTP id ada2fe7eead31-77a62847969mr2347479137.4.1787307764648;
        Fri, 21 Aug 2026 03:22:44 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-777daea8e4bsm8606529137.2.2026.08.21.03.22.44
        for <linux-hwmon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 03:22:44 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-97622cc1f40so476878241.3
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 03:22:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RramIRODdsxYlv6Sj4gKsw6MAJuPJ6s7MC2p3Z0z7Yt5AReh5uSNlgSZnxswytuAwwf0mKyNSqylIGbmQ==@vger.kernel.org
X-Received: by 2002:a05:6102:8682:20b0:77b:b38:6f44 with SMTP id
 ada2fe7eead31-77b0b3874afmt761030137.5.1787307416387; Fri, 21 Aug 2026
 03:16:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787165329.git.geert+renesas@glider.be>
In-Reply-To: <cover.1787165329.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Aug 2026 12:16:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXaxV9K8=yQ3KU-V2dV-eFqFqMR9WDyt2RVKADLS51Dcg@mail.gmail.com>
X-Gm-Features: AcwNN1XMP476J77X05DStUZ6YHTKoquM1cTbXZSuVIS6ygsja8ReRo486qzyWdY
Message-ID: <CAMuHMdXaxV9K8=yQ3KU-V2dV-eFqFqMR9WDyt2RVKADLS51Dcg@mail.gmail.com>
Subject: Re: [PATCH treewide 0/5] clk: Make sure clk_init_data is fully
 initialized (part 1)
Cc: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Nuno Sa <nuno.sa@analog.com>, 
	Guenter Roeck <linux@roeck-us.net>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Antoniu Miclaus <antoniu.miclaus@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Sunny Luo <sunny.luo@amlogic.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
	Mark Brown <broonie@kernel.org>, Kees Cook <kees@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, linux-omap@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org, 
	linux@analog.com, linux-iio@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Aug 2026 at 21:05, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> The clk_init_data structure contains three mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  When commit
> fc0c209c147f35ed ("clk: Allow parents to be specified without string
> names") added the last two methods, this was done in a
> backwards-compatible way, using a priority-based scheme:
>   - .name, .ops, .num_parents, and .flags must always be initialized,
>   - if .num_parents is non-zero, .parent_names must be initialized,
>       - if .parent_names is NULL, .parent_data must be initialized,
>           - if .parent_data is NULL, .parent_hws must be initialized
>             and valid.
>
> However, not initializing all members may cause subtle issues, which are
> only exposed when CONFIG_INIT_STACK_ALL_PATTERN or
> CONFIG_INIT_STACK_NONE is enabled.
>
> Hence this series makes sure all members are fully initialized, to fix
> such bugs, and to avoid future breakage when converting drivers to a
> different method for specifying the parents.
>
> This (small) series is part 1, and fixes all cases that I identified to
> be real bugs:
>   - The first patch fixes a crash I saw on BeagleBone Black,
>   - The other patches are only compile-tested.
> All patches in this series can be applied independently.
>
> Part 2 will be much larger (touching 185 files), and will fix the
> remaining cases that are currently harmless.

FTR, I split part two in 13 subparts, per subsystem:
  - "[PATCH 0/2] ARM/soc: Make sure clk_init_data is fully initialized"
    https://lore.kernel.org/cover.1787239869.git.geert+renesas@glider.be>
  - "[PATCH 0/3] ASoC: Make sure clk_init_data is fully initialized"
    https://lore.kernel.org/cover.1787239902.git.geert+renesas@glider.be>
  - "[PATCH 00/45] clk: Make sure clk_init_data is fully initialized (part two)"
    https://lore.kernel.org/cover.1787239813.git.geert+renesas@glider.be>
  - "[PATCH 0/2] drm: Make sure clk_init_data is fully initialized"
    https://lore.kernel.org/cover.1787239944.git.geert+renesas@glider.be>
  - "[PATCH] i2c: bcm2835: Make sure clk_init_data is fully initialized"
    https://lore.kernel.org/9f82f37e6d6c069cd44326bcd5e5a2a8069a13a9.1787239980.git.geert+renesas@glider.be>
  - "[PATCH 0/2] iio: Make sure clk_init_data is fully initialized"
    https://lore.kernel.org/cover.1787240005.git.geert+renesas@glider.be>
  - "[PATCH 0/3] media: Make sure clk_init_data is fully initialized"
    https://lore.kernel.org/cover.1787240035.git.geert+renesas@glider.be>
  - "[PATCH] MIPS: Alchemy: clock: Make sure clk_init_data is fully"
    https://lore.kernel.org/3610b51df642abb1fbb39f5bd93fddea43f8f164.1787240060.git.geert+renesas@glider.be>
  - "[PATCH 0/2] mmc: Make sure clk_init_data is fully initialized"
    https://lore.kernel.org/cover.1787240090.git.geert+renesas@glider.be>
  - "[PATCH net-next 0/3] net: Make sure clk_init_data is fully initialized"
    https://lore.kernel.org/cover.1787240118.git.geert+renesas@glider.be>
  - "[PATCH] peci: controller: aspeed: Make sure clk_init_data is fully"
    https://lore.kernel.org/48aa77c45e109f78ccd806bc3b7bf380c5bc5e71.1787240145.git.geert+renesas@glider.be>
  - "[PATCH 0/2] phy: Make sure clk_init_data is fully initialized"
    https://lore.kernel.org/cover.1787240165.git.geert+renesas@glider.be>
  - "[PATCH 0/5] rtc: Make sure clk_init_data is fully initialized"
    https://lore.kernel.org/cover.1787241693.git.geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
