Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6169116DC28
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Jan 2026 21:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769461424; cv=none; b=hhfcjOcKXLn7tC0trlVozu4j+vBZeuvWOGlpXPxBXz+rxFc0vnmLicKK6R8hdHofefISGpVgRhDKCUBGgFGADu9zTb+d7WYi0kngdsNLnSn0HvgcfqmwN876DmI6R5+PBP9Vd9QPd0KHlJwldZgvwZmzo09TzTzjILTrvbwJoAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769461424; c=relaxed/simple;
	bh=WqSXMgwN1bj6WlKNWD0giAIg11OWSEsUWJe5KbkBJ/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D2fN9t663YdiHBtT+1c+U9pGUBMQyW0r/DsaRj+DirRfOfrgahoye6qjJYkt6/61CDgfWK3sMnnM4ltdbWY13RoFMHbE8YY+gWtH85rUlLLUoEPWwHN/WXN5bgwpG+LAtLawU0PeODxctnf5eraAtCFgeN6oQTLv9lmhmNaCjtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ee6Gsqfg; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ee6Gsqfg"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56641200d6eso3007531e0c.0
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Jan 2026 13:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769461422; x=1770066222; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iCW3LI0lwZJMRrEDS+3kqbUxY3kv4Hh4/Y+P85JSc/0=;
        b=ee6GsqfgrVsbLhGC8x1D7sDOqjJqz0CKQKCGyFFEmT7OuP36rcsifCz2+rpuX32ykP
         cD172SeKzzLyg2qskyNDWANC1LveSmFmnTydykcVopgNYTHNA8puNkpFYXQanz7epyVD
         sscYecgl7xjBu0ecj2pOOoPO1XoYFZsm1mimjBXSVIl6/zzTE6+0hv0TKbeRDdZWSFgr
         /T507SIbtN7MdUMcEFmPwpIOwG7oAHXxEHVYv1RuvSp9/GgnTrfIn0cEdW1ovcnPULZ6
         ruDvWtfB1NiAXoWEWTSLhViVUwaMKP+GPR4smRfJi5ipjiBo5xTJ1jY4DPsYoP9ppFhr
         XF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769461422; x=1770066222;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iCW3LI0lwZJMRrEDS+3kqbUxY3kv4Hh4/Y+P85JSc/0=;
        b=B+9nPWG8INckl3VsIv24h6fk4U2ofrDeaE+Q4eq284OTJ7oHqvALNXR/RZ81977GOB
         Wf38IIINMyJ/lye3tH20n42NwIdQ1XWQBAyTfkPTaCqMEZfT6t53e87PPqbp9wF2/YLZ
         m+XqZ0q/OUPOYth/ZVjG3hszWt7hXacLDq9edmblphpeY4H8h9chcW+IO4YVBvGNsAC6
         9zO6RW8fg2lmVbdFim5DLH3y6hcHRfMJriOOfD8z/jL14bVydMAHVeVi7+vLBC+UcOvC
         JNttEqVYAJNr9hiBgO/BhzDyGRnCO/zdF8hc1gLeV3JVi0T1BEDpnkpyPgSQS+lhOw/H
         IaxA==
X-Forwarded-Encrypted: i=1; AJvYcCVC16juDkT3ySe01W7/94QaSB0JfAaVsFTkhfpoPweO6Xz9WtC7oobSCoILdYglg/z+5gc6hRFGbGAEtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBjh7EflPY2c1zlEtL/NPmlgLc8kmPSiuRZ/HW1RrA3cwGQQYZ
	xS1foDm2eK7Wd2uFBMFgSZCugvui5rrb1y5BsXcxnakohBOsXcagSdP1SqV7gw==
X-Gm-Gg: AZuq6aK4GgLl0oDUAygO8KbZJMghezTNQKZpan+Q4I3PEciVrhh1ov12fjD0HRmVgv6
	ySxMKE1zpVscMeyPKZ12HayBVEuYIKvJ8UZ/Dt52qWdU5QjB2DkVeyGZd4gv2fYp9ulrnCY6bF+
	KHJkZUUCDOOoPCtzvhpq2SunrI0hZsIPFap12pafHk3HD38V8RA7ENAHu5wvXe/m9dfd/XNxDJm
	oPv9dzOKOfngBG813Bq0ewOnOjdHo1CtcBf5HeyRO03NQhOMgPs0W5tRZFwRIYsWYOT4pn+/IyA
	RHyCQ5AKj4NWx86qV5V0cCkMzQy08nLsos0uB1orP2fP9uDo8DKMYlttfr9RtgNuynxbI29V+M4
	khMJijyTxqq2i5tuGp8wg8mgntnIDR7xwMRjrbb7UKsxJSUQQqqeClamal8v79IvMRQvEPHbukm
	bU9whtRPDLgDdm1Co7ldveHtDaNFBO85NGJR7EYc/Ayl7bv52NHR6/FiGQ411dspU=
X-Received: by 2002:a05:7301:1003:b0:2b0:5028:bafd with SMTP id 5a478bee46e88-2b7642198c5mr2076868eec.8.1769454774472;
        Mon, 26 Jan 2026 11:12:54 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:cb35:17f5:7e82:90c4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b749e301f0sm13452476eec.35.2026.01.26.11.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 11:12:53 -0800 (PST)
Date: Mon, 26 Jan 2026 11:12:49 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Christopher Ruehl <chris.ruehl@gtsys.com.hk>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, Vincent Huang <vincent.huang@tw.synaptics.com>, 
	Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Frank Li <Frank.Li@nxp.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Fix emails with spaces or missing brackets
Message-ID: <m5ckxhpvhtjcc6fzlsz7y5sjxvzlbx6n7vel264hbw47joivi6@iwchebcbyjod>
References: <20260126164724.2832009-1-robh@kernel.org>
 <9a3d4ae8-b57e-450e-971b-d09fc923eee1@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a3d4ae8-b57e-450e-971b-d09fc923eee1@roeck-us.net>

On Mon, Jan 26, 2026 at 09:21:15AM -0800, Guenter Roeck wrote:
> On 1/26/26 08:47, Rob Herring (Arm) wrote:
> > Fix email addresses with spaces or missing brackets. A pending
> > dtschema meta-schema change will check for these.
> > 
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> 
> For hwmon:
> 
> Acked-by: Guenter Roeck <linux@roeck-us.net>

For input:

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

> 
> > ---
> >   Documentation/devicetree/bindings/hwmon/sensirion,shtc1.yaml    | 2 +-
> >   Documentation/devicetree/bindings/input/syna,rmi4.yaml          | 2 +-
> >   .../devicetree/bindings/media/samsung,exynos5250-gsc.yaml       | 2 +-
> >   Documentation/devicetree/bindings/pci/mbvl,gpex40-pcie.yaml     | 2 +-
> >   4 files changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/hwmon/sensirion,shtc1.yaml b/Documentation/devicetree/bindings/hwmon/sensirion,shtc1.yaml
> > index 3d14d5fc96c5..7b38f2182ffa 100644
> > --- a/Documentation/devicetree/bindings/hwmon/sensirion,shtc1.yaml
> > +++ b/Documentation/devicetree/bindings/hwmon/sensirion,shtc1.yaml
> > @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
> >   title: Sensirion SHTC1 Humidity and Temperature Sensor IC
> >   maintainers:
> > -  - Christopher Ruehl chris.ruehl@gtsys.com.hk
> > +  - Christopher Ruehl <chris.ruehl@gtsys.com.hk>
> >   description: |
> >     The SHTC1, SHTW1 and SHTC3 are digital humidity and temperature sensors
> > diff --git a/Documentation/devicetree/bindings/input/syna,rmi4.yaml b/Documentation/devicetree/bindings/input/syna,rmi4.yaml
> > index f369385ffaf0..8685ef4481f4 100644
> > --- a/Documentation/devicetree/bindings/input/syna,rmi4.yaml
> > +++ b/Documentation/devicetree/bindings/input/syna,rmi4.yaml
> > @@ -8,7 +8,7 @@ title: Synaptics RMI4 compliant devices
> >   maintainers:
> >     - Jason A. Donenfeld <Jason@zx2c4.com>
> > -  - Matthias Schiffer <matthias.schiffer@ew.tq-group.com
> > +  - Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> >     - Vincent Huang <vincent.huang@tw.synaptics.com>
> >   description: |
> > diff --git a/Documentation/devicetree/bindings/media/samsung,exynos5250-gsc.yaml b/Documentation/devicetree/bindings/media/samsung,exynos5250-gsc.yaml
> > index 878397830a4d..9196cf5dac0f 100644
> > --- a/Documentation/devicetree/bindings/media/samsung,exynos5250-gsc.yaml
> > +++ b/Documentation/devicetree/bindings/media/samsung,exynos5250-gsc.yaml
> > @@ -9,7 +9,7 @@ title: Samsung Exynos SoC G-Scaler
> >   maintainers:
> >     - Inki Dae <inki.dae@samsung.com>
> >     - Krzysztof Kozlowski <krzk@kernel.org>
> > -  - Seung-Woo Kim <sw0312.kim@samsung.com
> > +  - Seung-Woo Kim <sw0312.kim@samsung.com>
> >   description:
> >     G-Scaler is used for scaling and color space conversion on Samsung Exynos
> > diff --git a/Documentation/devicetree/bindings/pci/mbvl,gpex40-pcie.yaml b/Documentation/devicetree/bindings/pci/mbvl,gpex40-pcie.yaml
> > index d286b77921e0..8f5d33050348 100644
> > --- a/Documentation/devicetree/bindings/pci/mbvl,gpex40-pcie.yaml
> > +++ b/Documentation/devicetree/bindings/pci/mbvl,gpex40-pcie.yaml
> > @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
> >   title: Mobiveil AXI PCIe Host Bridge
> >   maintainers:
> > -  - Frank Li <Frank Li@nxp.com>
> > +  - Frank Li <Frank.Li@nxp.com>
> >   description:
> >     Mobiveil's GPEX 4.0 is a PCIe Gen4 host bridge IP. This configurable IP

Thanks.

-- 
Dmitry
