Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A00C2EF67F
	for <linux-hwmon@vger.kernel.org>; Fri, 31 Oct 2025 16:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761928724; cv=none; b=gIQVHYHwtnjqh16MSR8y5enoCvivu6fBgFXu1N5WMqYStnB1m6YAU+C3filOWUH02sgzfeUA/A41SMstV7194GB6sV2fbAX64XTfmVvrD2g2COFLoHTFiQ+TxxPZTX3xyNE5aum1Gs+fyQlejsJtNC4mtbZCaIIHcVp+YwGIu1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761928724; c=relaxed/simple;
	bh=NNluwfpdsA26+gPsB5/AnOEGDLqICL27K25ESYNJAnA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kps9kOqQw5ccr2hHISHwFMXXTgBakmUQjjAvBaIwBdfSrdPYOcizSWKEdNTn1pAUPsxrIsfDoIHxAxyLa8i4AD6SNwnQvOPW2FsAt/kp8gb3o7IrXPzsZQIHBYcH96+kdGI4Ykx1ilpv7esYikjX4IFzDuxI2tu1yC3BWix3rV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=bSsf0rVq; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="bSsf0rVq"
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id A2374BDD4F
	for <linux-hwmon@vger.kernel.org>; Fri, 31 Oct 2025 18:38:36 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id D4C58BDCD8
	for <linux-hwmon@vger.kernel.org>; Fri, 31 Oct 2025 18:38:35 +0200 (EET)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id B56EA201B27
	for <linux-hwmon@vger.kernel.org>; Fri, 31 Oct 2025 18:38:34 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1761928715;
	bh=vYurqirQve9/a5aO1JzYrhU8itgV0sUSBiyRfLUlTA4=;
	h=Received:From:Subject:To;
	b=bSsf0rVq+B1L0OVwSINAUdej5vp7GEwEc53Da80mMfJeOd/IcYdYBdl1Ixnv9JsE4
	 WBE46l806EAL2dyNeVXpWoi7yhbM8yTEK1cXHqhTLX1BHZShaoWrmqTY4K7+wCiVat
	 5IiIZ2Lp8Ovxl4bl/f3SAQzaRA3p1GCTZUOBKivDOYMDpqkG2HaeCrbR84qI1pH83m
	 WqfAKCAE4zy9sdlT9LWQNEOzfOuHTE7rQ6S128xhp6nb4tNXLY9iHqm5uN4V7IFlpv
	 AljwT5yLn6dxuSJH8YdQMpfTEczekB6fzwR5e1faFvnjCZE4doUgBlYUKb9pYfzFBV
	 It2/DUwMx1sMg==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.176) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f176.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-376466f1280so31301861fa.0
        for <linux-hwmon@vger.kernel.org>;
 Fri, 31 Oct 2025 09:38:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUw99TupNz0d7ZOzfqbJwpWDumNMFuacu/p3D1idS/J+VH2tPoSuJ6WeTTurEMyrLc8MCaR8zCbw7R6Yw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPUZ6jgxO/z97pWbYHxlUSylaSodYToM3YmAwfEMcxgUaW2P6T
	xyLVuELN8QxHjeFzXzSk+cnD7h391fo7pfddBBUlcwS6xqlT/I89sHz+tE4cYWLldEWuDG2Y/Y8
	DzCdq+jKMpDHLZt3bhXeLTWtqKC495hQ=
X-Google-Smtp-Source: 
 AGHT+IFfCsCUm1dDa21cbpuFbjCe1k1ojogD+tE28Iv1A5p0JPMdEYf4rV/aPw9ZlxpB7cs3YdzdBVQZxVyb6hRNJro=
X-Received: by 2002:a05:651c:b2a:b0:36a:6540:3bf7 with SMTP id
 38308e7fff4ca-37a18d9b0d2mr16432791fa.18.1761928714107; Fri, 31 Oct 2025
 09:38:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251031163651.1465981-1-lkml@antheas.dev>
In-Reply-To: <20251031163651.1465981-1-lkml@antheas.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Fri, 31 Oct 2025 17:38:22 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwHk_wrS8zVRb9-QKpY5TrV1pkksxG5uO9-Db36N7RDo6A@mail.gmail.com>
X-Gm-Features: AWmQ_blnBmAcgxio7jFrhdMKYsqJ1-YkjaR-opcyMQwFHUHh8QiAmlMVUhDRquk
Message-ID: 
 <CAGwozwHk_wrS8zVRb9-QKpY5TrV1pkksxG5uO9-Db36N7RDo6A@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] platform/x86: ayaneo-ec: Add Ayaneo Embedded
 Controller platform driver
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Derek John Clark <derekjohn.clark@gmail.com>,
	=?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <176192871538.3955754.3660861245917692698@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Fri, 31 Oct 2025 at 17:36, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>
> This series introduces a platform driver for Ayaneo devices, ayaneo-ec.
> This driver provides hwmon support, power management, and module management
> (for the new Ayaneo 3 device). Module management is done through the new
> firmware attributes sysfs interface.

I resent this as V3 didnt I. Mmmm

>
> Luckily, all Ayaneo devices with an ACPI mapped EC use the same registers.
> Older devices also use a memory mapped region for RGB[1], but that is
> replaced by HID in the new Ayaneo 3. Therefore, this allows for a simple
> driver design that provides robust future support. The memory mapped region
> can be upstreamed as a different RGB driver in the future or remain
> out-of-tree[1].
>
> This change also allows cleaning up the oxpec driver, by removing Ayaneo
> devices from it. In parallel, charge limiting is added for these devices.
>
> [1] https://github.com/ShadowBlip/ayaneo-platform
>
> ---
>
> V3: https://lore.kernel.org/all/20251015084414.1391595-1-lkml@antheas.dev/
> V2: https://lore.kernel.org/all/20251015084414.1391595-1-lkml@antheas.dev/
> V1: https://lore.kernel.org/all/20250820160628.99678-1-lkml@antheas.dev/
>
> Changes since V3:
>   - Fix various non-functional nits
>   - On hibernation restore, use restore instead of thaw, switch to bools,
>     and restore fan pwm mode, but only after the first pwm write after
>     hibernation. Also, release pwm when entering hibernation.
>
> Changes since V2:
>   - Remove i counter from suspend hook by hardcoding the index
>     (we already allocate the maximum size for the cache anyway)
>   - Rename quirks to end in quirks
>   - Add missing includes to controller sysfs patch, use switch statement
>
> Changes since V1:
>   - Use plain sysfs attrs for magic module attributes
>   - Combine quirk for power and modules, so attribute tree is simpler
>   - Use switch statement in hwmon
>   - Add hibernation hook for charge bypass in last patch
>     - Restoring fan speed is a liability so it is omitted, see patch notes
>       Note that for EC managed fan curves, it would be acceptable
>     - Regmap comment: Using regmap is unprecedented for ACPI mapped ECs
>       and overkill for one value (> 100 LOC)
>   - fixp_linear_interpolate() comment: it requires importing an extra header,
>     is not used for static parameters in other modules, and expands to the
>     same equation for parameters used, so it is omitted
>
> Antheas Kapenekakis (6):
>   platform/x86: ayaneo-ec: Add Ayaneo Embedded Controller platform
>     driver
>   platform/x86: ayaneo-ec: Add hwmon support
>   platform/x86: ayaneo-ec: Add charge control support
>   platform/x86: ayaneo-ec: Add controller power and modules attributes
>   platform/x86: ayaneo-ec: Move Ayaneo devices from oxpec to ayaneo-ec
>   platform/x86: ayaneo-ec: Add suspend hook
>
>  .../ABI/testing/sysfs-platform-ayaneo-ec      |  19 +
>  MAINTAINERS                                   |   7 +
>  drivers/platform/x86/Kconfig                  |  16 +-
>  drivers/platform/x86/Makefile                 |   3 +
>  drivers/platform/x86/ayaneo-ec.c              | 582 ++++++++++++++++++
>  drivers/platform/x86/oxpec.c                  | 115 +---
>  6 files changed, 625 insertions(+), 117 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-platform-ayaneo-ec
>  create mode 100644 drivers/platform/x86/ayaneo-ec.c
>
>
> base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
> --
> 2.51.1
>
>

