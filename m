Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF3E37BE7E
	for <linux-hwmon@vger.kernel.org>; Wed,  9 Sep 2026 17:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788974823; cv=none; b=f+i38TB1k/kT3lso35dMX1+ywSdpbNG+08IQfJ3pjW7N5ol8C3V2Z0tGybWqTmR17WE0/0+ZsQjF89gaZdv9o0ndjqzxtfS4TNMLqbGKlCKcA4fXcGpN/orvUuYzukH/vD+C6uoNJzZU5izjt8sgIsXcyXT8J0TjfPZxO9LTNqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788974823; c=relaxed/simple;
	bh=SUxP5gT1ZaOy4mmgP6chw0Cr8VRY83cgnbGtN/GeIrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Juba0PEXZLUnv5bkxUONe2kx0MkAELpdJM4IJ6oA4Ev5GeJdzMl39vhC5tJ7Qktne4uw8wdBnNE+rZObQrIfWrZFZW+kMl9M27PAV8HW66VIDTA4EGjuCpuEssc4D2Wb+anS8tHuazrpTkfGsKMWUSd+azwpmLFh2ynnACbgodo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jI6Ly9NO; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jI6Ly9NO"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc149372c14so3225147a12.1
        for <linux-hwmon@vger.kernel.org>; Wed, 09 Sep 2026 10:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788974821; x=1789579621; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BxkJmMQiuFGLIVhYvP7iekSRoJyyqxrT2LFSLJP0a4Q=;
        b=jI6Ly9NOhS1CJVDcDoKjwgjST/iQVlVpolh/hifxBJGV2nz6t+8GlFWLZ4bzANtEHt
         /Gubm7aHSBwsXnEHDwS28/J38FGObVki5RAT4+MKtWxDxCzdeulLhOlDre6S80gl/1TC
         7EygHVvY8rB9EzbY4vuEGBvLIXgnThM7ofFVrmOOyUnxK3+Cw8/lUB1Qrw2zcQyD28sq
         aOwfF4Jak4nLrwlBRcrBmxMV3zq77fRSSDlQwIxXNAn/g3MvLudGjEbIzxRGELLjSs75
         zSMaaTiP34sWBjEuq0+gSjLhjHao2DyO1AI08J/NXT1fTMGf7TSzj1Dp3m+TJmQDgi3k
         TF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788974821; x=1789579621;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BxkJmMQiuFGLIVhYvP7iekSRoJyyqxrT2LFSLJP0a4Q=;
        b=jY4BGHTc3otPJV5ZGpypsDADGmn8sgIJYJ+dTTGgAe14vIXRkUe2QXeChNqvWHSBTb
         J0C8KqwQ6wF8PE0wEaskqS+3cbfvLxe/ZkXXofd9iWKv49W1VP/ALsVa1B5DWiuctwXH
         Zv3ar89HqHFv0qhugxU/9zVithqYXnCSE9cNr/zywuuo46nMhxZMpSID0/5ITmzwSrKK
         AWv3+9B6ceMbrzAfH0Y/osZ0Ce35Ni/Y+xSR1Bnl+8UmYskcDULwC3klGxN+CPShE5I9
         9txELNr68KeGjwmv3laTJe3mEOFzz9meano39+e2GqU2zSvUrHrbFDbPnjNM7b3YFcih
         szEA==
X-Forwarded-Encrypted: i=1; AKwUvBzUUeK4lqfrbuYQoPcQ6R8zIezBrxuvUTSd1iABEomriULS+SI287qH248XtAD0lgcueku1tsi593DzFA==@vger.kernel.org
X-Gm-Message-State: AFuF++kPU4ZlMjzP/YYSWzt6f3CdpuGBFS6mHwZyEONqI7VNIzanX2NS
	Sv9/CIs6h0+S5YLmLrmpZ4hFBYbZ2DK/CzcdR/Gm2rhKE9yPDBVTokhq
X-Gm-Gg: AYBFou2tLccOn9scUnolHDWgYv7rlbXN28Mncy/ZQeekfKWBvqX3AaL3Jqo/EsedDDm
	0YkG9RLVtfKkmv1fCYartWUKw4YxZXN8jZfXTEWt1BrScizUWY1Tm8k564hpKpwzHjUY0g+2N2J
	Q6qyhIMd80m43mVFxqm3V+s8yEw80/Qi0SU52NAlj/hA+vWpsnPly6CYCr7ZLUxPGig5RTp4Soz
	32NqRdy5bBVG/3IlkFNINwJjvtkw7kmb4wKRJ5JZdKRlwVft9wjw6Kyq4YnOdtdHgGqfoIidVle
	w3ld7tuLE4TYnO7sJfgnyLMtgDgFnBesGc09GuCgMe9VkQTYeug+K/YYKAQ2w2fmJMwV+dLCWgC
	By2PimrG12SZdN6hE5YYiU7LtJB4YhH3DJgaEtEtveRJKEOKSnWNpHMSGQCRa7T79ihI58aRiGm
	yA85FzkHPOB2R5oSMy+YS6lVoPB8eduHYX/IsKuztJ/PsUgGvcopP6hcWUGENlogOgcGGj4t8tv
	lQQr0PyUOU13vs8wmtU87xNsXu43zp/M2T3gESNNsWoWZYJRnWG
X-Received: by 2002:a05:6a21:9d84:b0:3d3:af85:eb98 with SMTP id adf61e73a8af0-3da3a16a579mr57975715637.26.1788974820346;
        Wed, 09 Sep 2026 10:27:00 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:2d43:5153:5c50:643e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm52422943eec.7.2026.09.09.10.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:26:59 -0700 (PDT)
Date: Wed, 9 Sep 2026 10:26:55 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Arnd Bergmann <arnd@arndb.de>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Michael Hennerich <michael.hennerich@analog.com>, 
	Support Opensource <support.opensource@diasemi.com>, Sebastian Reichel <sre@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, patches@opensource.cirrus.com, linux-watchdog@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH 00/14] mfd: unused driver purge
Message-ID: <aqGWjAuGXq_JHvxk@google.com>
References: <20260909132153.1596191-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909132153.1596191-1-arnd@kernel.org>

On Wed, Sep 09, 2026 at 03:21:37PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> As part of my cleanup of old platforms, I had a look at all drivers that
> may have become unused because the last platform_data or DT definition
> was removed, or because of unmet Kconfig dependencies.
> 
> These are all the mfd drivers I found. The first ten in the list
> actually turned out to have been unusable long before my series, and
> I have added explanations on how I determined this in each patch. The
> last four patches are still in use in linux-7.3 but become unused after
> my series [1] that I hope to get merged for 7.4.
> 
> Somewhat unorthodox, I took a shortcut here and remove both the mfd drivers
> and the corresponding subsystem drivers (gpio, hwmon, iio, input, led,
> media, power, regulator, rtc, video, watchdog, asoc) in a combined patch,
> to simplify the interdependencies: removing just the mfd driver would
> leave unselectable or broken drivers in other subsystems.  I also have
> additional patches for each of the other subsystems, currently a total
> of 300 patches, many of which still need better testing or proper
> changelog texts.
> 
> Please let me know if you all think this approach is ok, or if I should
> explode this further and turn these 14 patches into 70 individual ones
> by splitting them per subsystem.

Sounds good to me, especially if Lee makes an immutable branch from this
pull so we can all pull it in...

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com> # for input

Thanks.

-- 
Dmitry
