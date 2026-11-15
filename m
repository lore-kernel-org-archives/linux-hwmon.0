Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794710649;
	b=pNF126IF6z69IlVHrUG/vD13S0UvxFvhfJ4VIpY6FMHlThH0sYEb3ZFQabUgcyhkSlB8
	 cm0u3aNruVfIZ5fEIxK57Nl4cTkNQo8ltIvroZCIGIx1wYlL6Bh9F9JJdokE/FHfo4Pyc
	 ekILA38UknyNX4tE5gBknrL7iwB9lEWRp4EEAgZ4c+Ujntq+5yX7HNt5RMFT7QihsYBxq
	 4nFu2vLV0awhy0m26qqLlUgnY0yuSbuFS903WQrF7j6DKXOsv2Kw8ZZ+TC+CaeoYM1Bye
	 wdNeFbPQQvsVgbPGDCcukuC3g35f+Z1+2gE3gZWNxvJmB1U7p3kCdd85v2SsZ3bqWqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794710649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WImIugUvsCB3dULRzrcWqUtpzfjQNdC7aiK6me5zFHM=;
	b=XXETlu//bETK2tSGkbgnn9qJM7rOoYZlLeLuc71fD5FMXPBD8TWTRYS9b4d8M99pPtA/
	 gTjuESdRE+/uBCZT4E8XaEsLO4YUG+VLr2C8SB/JKoBtmeDgazYftP7kBmINfgT31Mp7W
	 WbM2KAXw8aGTGIdL0BFvbJBICCgb19w98PLpR4XJhHdExO4HZLaQu2zSt7U3GAnzznjdc
	 vPMxpfnnsvm+BX5nlHfRBOgmBYarjHfIp4W0MchmQNggVMMIXWP6GApxe19/HYr4bYRSW
	 hmcK2PpCFOBJoddDWVHu9GvG5edZtPDw4CUS6rHp14M3MmJaPsrq7TvK2ph/tsA75FQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RJnm5XLx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644CC606A32C
	for <linux-hwmon@vger.kernel.org>; Sun, 15 Nov 2026 02:44:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 644CC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RJnm5XLx
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3adfe77d35aso25253351fa.1
        for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 18:44:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794710647; cv=none;
        d=google.com; s=arc-20260327;
        b=BW2dIEX8YY9aZKXTAnzoB5JFJDfAxshrHvsnB72luVLgwGdGrG26adQZ5UKAcBxkVG
         P2EPLSRMnppguMD4cesSe5mEQTny5jHJn6EGT4/mfzm+9ex6SjNNMEl1aRJDPaCbU13k
         bIsAekw1IQaM0B8EKXCF7KG6dH4PokDyWQWwttVY0CvAm/26LHunVm8dxjRBe6jnXZbd
         FM37eOtrtGxuT4cP3vo8Zt6KpiiHB2e3nQxDFU89i3wvvzUu28PlXrBVitIexaSeLsHr
         jg/u6euTDOKUhKTK4pURXu7SaehjZ6SE6AdP8poJEei5esfTf6RJcA/Z2B5bFMRennfH
         pizw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WImIugUvsCB3dULRzrcWqUtpzfjQNdC7aiK6me5zFHM=;
        fh=5fgpikO2IJ2b9LI4vas6AUSXBMRxKJQZEkmyq4ZosKU=;
        b=YfoTAMQC7Az+OcXftY3/NijvOMtjkSQL9g+bxxXfrpoC/sl7ctPNkrrZWo6yoj66sF
         tdll8vuvKw6j4ktPUZOUPT4xKi96ayRLACpQA9p6AD+GDJN2nb066G7csjQn/fYr0MdS
         YnjQc9yOSFoAQ7Xc/Cnq81nIZCdXz1GSNnrbeyeDh3XtwBpHNKaVoeUiQZ/uW6s93Jz8
         QvuhMQ/dvNE3FpEFJ7MqbcZ9Rwbs96hOML4EpfIrdAveQ7bE3G9NXe9eCfFdJNd1i2Aq
         o3FvG/cPaSVNFkTLHpDikcMA5ajWdg6NQxw1j2/EFeIs1Ol3GEwARukmj22X10XTOxuc
         wjCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794710647; x=1795315447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WImIugUvsCB3dULRzrcWqUtpzfjQNdC7aiK6me5zFHM=;
        b=RJnm5XLxoNK866TvF2CkdY9AW+tb0cJ1wYfWzlZZh4X3OnWmWeykxS1NvAKwM8nW4T
         R0GTMYqQAqdx2m+VPUhijNqDi8cWar7oJaJKzJJHy3fk2ZhupkgqBuEO2Dm1/9fLTVli
         B4TTFx8z1iautbvXT5v2AYyLPiC1D5IFu0cThMCSZq2yjUxVximJ9/eQK3h4Y8PNalZJ
         T0bhpinyLP3mCG8jD9SPRJAwIQG6O46nBkuNR5hDYOKD8kgPQNHFOx2jEmOVhY8xIlii
         X65pjY/kWAjU8ccru4oBjZFJoMbyWVKnyH3W5/nrAP0JqE/t4MtEabZ0HgYpG0dll8c1
         OYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794710647; x=1795315447;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WImIugUvsCB3dULRzrcWqUtpzfjQNdC7aiK6me5zFHM=;
        b=dO03nt+Zr2YPlScgOImZSAhknzxhRuSGjVbllTRoF4OMveC2Q2sWNwc38OnFlL8uCR
         0VutvLDD2Y5QRU/llDWj6UwmRea2brc22RTrfxkBT69QPiV5/OyYcMlkkTzjfXQxToEz
         QqX0FNq7fvIZ3oNANGvGAx178p5i7tI2AGXbzkMN9xZvZJ88bfBDvyzFJ1CxYFqP0Cl7
         JyRuc/GFvJS4PjQ+Zumfkabg3tH0OVj92zS0gg0MhdoR+4kcH9AN96hISlmKX/LUZm60
         2YbjfSw4aUI8887UplXOtLmp6bRUpyK80b0rEIBD/I0zMG95rDIMkPOu3M6FaCY05TBc
         pYvQ==
X-Forwarded-Encrypted: i=1; AL+hErG+azWgo2pF5E7DOwg7bHkB7iIGZEM0nTE8t6vjXM/aFtLCzyRKMan3j0fgw8Se/AzhGjCA/pstKFCR7g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9TIUDCHbhaQe6Van08WaUX1BOqKksZPXZ0JQhOBz2sLGRSpYD+
	sqtvSjX8nrWM9mwG5TKnS91z7etm5myz9QuLpwYNFapxsemmfJ/+zc8cK1aU3lb2n7ci95OqHXH
	BRI6TNhj9sgnXxMKcTCNDdqTGuZIXBjM=
X-Gm-Gg: AYBFou2GgTZjgmozZi61h5X2x8UL4RQRI+iLDq41EuxG7y85lLPjjJ5/G+GuauN0reA
	VqudB5fAZipw3hDJg3y8eflB8MFlHMgGTSMHqcVzT0T5JH/Qx1pcYC3mYxPTwUbzIV3PgUltfnp
	7zlj/s1XwRc+QimSqSTOLNm6ZT1lO3zEJxnK+fcyr100lXcGniO/cugmngoSZOUOEkTJ+MhlvNc
	uBBaPGyebjPpPjg8L90mCSNRzW7L18f9gOW7DJESxD26HQYcpWL2Zz66yaHDvTKYz3jgwueWOjF
	pfENXcaJZv/zp0s+/FXoZfXde6rrXDPXnpD61xrCwpkN5/otfL4gfVLGgrfp6qui7zqrw9oX2iW
	GqX8PoLDqu/zHDNyrN35pREa5o/AxPoWS7OTnwbbELuk1uq5MWZMLHOddDtlD07eUGqH53LjCuM
	b1qOv81y2vdd+//aTv5+VY
X-Received: by 2002:a2e:bc90:0:b0:3aa:ee7a:5466 with SMTP id
 38308e7fff4ca-3ae2b4f52f0mr22163651fa.16.1794710647252; Sat, 14 Nov 2026
 18:44:07 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
 <20261114-marvel-env-v1-1-890328e4b7e5@gmail.com> <4d69d3e9-9e05-485d-87e2-428616cd5d9d@roeck-us.net>
In-Reply-To: <4d69d3e9-9e05-485d-87e2-428616cd5d9d@roeck-us.net>
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 14 Nov 2026 21:43:55 -0500
X-Gm-Features: AclHuK-rDAmxPKOpteTkagDnbYP3PTwmOyt-Q5uXcex0poBTc5yw5ifEj6zGwJs
Message-ID: <CAEdQ38E=+Yb2hJs3L1KHgR1Kbe796NDD2z=n=7YytQ+uiJJWEg@mail.gmail.com>
Subject: Re: [PATCH 1/7] alpha: marvel: report environmental events without VERBOSE_MCHECK
To: Guenter Roeck <linux@roeck-us.net>
Cc: Richard Henderson <richard.henderson@linaro.org>, Magnus Lindholm <linmag7@gmail.com>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 6:01=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 11/14/26 09:39, Matt Turner wrote:
> > The service processors report temperature, fan, voltage and power suppl=
y
> > alarms as system event (0x680) logout frames. The frame is already
> > classified as reportable, but without CONFIG_VERBOSE_MCHECK only the
> > header line reaches the log, which does not say which sensor or what
> > happened. Print the subpackets unconditionally.
> >
> > Assisted-by: Claude:claude-opus-5-5
>
> For all patches: This is obsolete. Please base your patches on the latest
> kernel and ask the agent to follow AGENTS.md.

Sorry about that. The series is on v7.4-rc1, which already has the
removal, so the trailer was my mistake rather than a stale base. In v2
I've dropped it from every patch and mentioned the tool use in the
cover letter instead.
