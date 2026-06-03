Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5463ED3BC
	for <linux-hwmon@vger.kernel.org>; Wed,  3 Jun 2026 16:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780504828; cv=pass; b=uZwa/6OIyfexH1hcLImGgs0wBFcoKuZ/KQlL6mD6IdHQfbG1nFakdAChrWYafim/L301mnaw1AWC66BuqCM0YyfILW3Z+nSHTdGVNv4As1BzW6ut7jKpYDXvmJZau3+Fd8Aeia+/pGEQBfEfx0OPCzQukAOm3Gn56iRNxyZXrBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780504828; c=relaxed/simple;
	bh=eFUqVxv/9+80Nu9hearScbYWdYDMy+i5moXBBKkWcw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gSvG8sqCCPuNJhJglryxtpw7d4flfgbRh+nPOIvOSkzmOd2DblT6kDAfTsdRgIKX+fos6O7xxfBuTc12l8S2ItgkNxTTt9q2hArUntv+BGJzDUv86IacevwZufo/AJWD7du/ywZO/3y0JuuWglY+hAI6XQ0FTMJXrbQA0sYLQeQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=UC3shjdA; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="UC3shjdA"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-68ae265815aso2547399a12.1
        for <linux-hwmon@vger.kernel.org>; Wed, 03 Jun 2026 09:40:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780504826; cv=none;
        d=google.com; s=arc-20240605;
        b=OLAcJw8bO2G/DCCH9RvE18y6tbJvpIJS9Z7GT78SenHSpOmTXFz73M40k/Hps++unB
         GTmI9Tg8Z5a8yMrWSDhlpjLToXrv86uEf9PoBuaphUx8Bp5gB02Hj+G5X4wioW43K6PH
         VEfYrjWzJDgpK/5A6sOGlFw+0hWCDBIg99ptdowC9gk1UmQY3cYWiSoVE6wTx+5SGDnc
         2JoVk+fPRxjI7kQhiQth3Oq5Ob3UlZvmiqnpzptq9E4Y8mRPmfXLpPMVUTiuFnGm/ZyE
         y8Z7Y1pRT3kFpYUmiMKI62eQndgwVqfglHD+jAHHM5u8focxiUR73+lYuqOOJ/RzasNx
         ncHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pIETLp6KIfylYmsPsLeozIYxgNDP26FqYjHINKkCoJo=;
        fh=If/Qc8zvGB2FGvZCePQTtR246cBenpfWASzTiw4Kvfg=;
        b=hwZQg8WAFGAkZ1+aGoRlVAKc1KaPWIr5cHVUQqmSL9XwYTm68Dn9GtJ4DTvQL6zABF
         O0Gm+e53dLq+UXIaGLKaD29cP+Tc5T74pzpocw/eNcNmpBoHFjm1+0uUgENUfcnGCmA/
         v8/sqiKVSWp0jhcmgOiUeY+bo4gQoHAAEiErq7ciqfYdPNKBSn+nQKH2B1UmpLkBjJHA
         GMtsKaw786gn2P+kvJCor9Hq4l7NFVvu6+SOW+DNe2S+2bOhB1xR+Q/qUjcU8AvOs/o+
         hdjqoTXLZqwu6c5qv30UurBFZrXBYVS1o7Mk6RghvIygusGup7ob/pwCcYkPEQvTSN17
         HW1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1780504826; x=1781109626; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pIETLp6KIfylYmsPsLeozIYxgNDP26FqYjHINKkCoJo=;
        b=UC3shjdAayfiqRfNjBff88uXqzcfQMtmEvLryFHpn2VR/AK0HgYwlp68xYj6V1H/0f
         8VBPS01r2NZI46nvX8aGyGJsSr14YOFjhlJpzgPrKgPGhNRaWHsksQkR9juWOB2bcray
         WhdKidALLgNmud9kj7K19t16idcQSfcW4fZVJWTKpOz/9h18S3SewtDx4aF7C1Kms4o9
         4Pwg98R0Z/vWfcYqosm0vyCzvGhNyC914iCnFeniWMthVdk3702fQ26Q3ZcZvtdVK8dG
         x/R+CzvEMn6hL1QXxBcMyJC3FamUZcK0dKkNFZX8qbA4mJCtmrsgmp5OYbIoxBdZpWrs
         VjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780504826; x=1781109626;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIETLp6KIfylYmsPsLeozIYxgNDP26FqYjHINKkCoJo=;
        b=S/sF4L3gUVAtZjqlOWCkH0MYvAxym3iJ6sQf/fouZmr3dQGxhFBZw+AhJHxNGxuDJV
         hgExUC04NVsM29RYALs7qWUGq5lltFBxPfQg8f+P9k1aOXpezK/6GzkpKEOcvQOOi1QD
         JrGvhEpEbc9W9ui15dvVxdvrcFhzqY8S3htlKXKyC82Dn+s25AokM4ahbXr9aUGBLqPw
         3vJgtuJX843gU6OcpWXprYl3/93kHm/fO23R8GTHF8xRw04k/nfAc0g3TUaxTfds44l5
         vhmfkJyA/YncgAN84ufnXNi77S/qjOKi4J/bQJSdboZeAP7wlTToRuvOXWgYYGUNHHFA
         U8gg==
X-Forwarded-Encrypted: i=1; AFNElJ+UOoqGWgvZWYBtdiWdLKjux0FPMAHFcegBAnwzjOcFQDL5+rmLP8S20MLs3ZBWm9+upx+eundceF3M/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcUzQR2g1+jPfpoc88IMSUXDjhDgXQMWsKwy6JimB1fYJXRsk9
	NRYVyMtf8dnKG/wufbZjskMvCCt5/Sz1xdvMUqq2xJ0S+Iz2aXHqZFCQTkxh4m/XP59D3v0Br8h
	xqXwfZJPZeSCSYN7T3VrDxh3CGqn+LBkcSQCOsjd84Q==
X-Gm-Gg: Acq92OFuu3VoEdoRfQZcgFGthbgToMKgO1MMPugFjhw1S/gPuWdzefbLNW5XPTq1H7G
	IpK6NPyzGFpD1QuTwnQqBhW8hDfMpP9Apg6hwwXJaFedAwmVNW+yWCDiBEhOdSFT23iQLXYdOyL
	IUFl7mvO2hn5xb0BxMh2VPje/qBYDwja6JeMYRiBGu93DhqlMyPQ/F1q8ZBLQc87qeR/PTXSp+p
	1gF6dU7oEtgg5SIKxAYbHrF59RJgAQ9anMGTutE4IocKVQudsTufNmhSFKM5VoUJzjcpFkdyxv9
	c8YVJ/YmJ+vaRRrb/wB6QXw+su6pzzFM13STmjPE+pIh3ZDAG8Pwyr8pa3ryFFrGnCknwBbH4dE
	LRyghscM=
X-Received: by 2002:a05:6402:2681:b0:683:93a2:dfb9 with SMTP id
 4fb4d7f45d1cf-68e6f2cbeecmr2236369a12.1.1780504825758; Wed, 03 Jun 2026
 09:40:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603110127.23930-1-naresh.solanki@9elements.com> <20260603-deskwork-perch-ae4eaf92368f@spud>
In-Reply-To: <20260603-deskwork-perch-ae4eaf92368f@spud>
From: Naresh Solanki <naresh.solanki@9elements.com>
Date: Wed, 3 Jun 2026 22:10:14 +0530
X-Gm-Features: AVHnY4J_O1JkMI_4gzw8gRgkRgdM6PmCbsIr17Aw4fnyKw6IG6s36I5OjWTKSKg
Message-ID: <CABqG17jzv03U5=1zhVd57zDDWFXpt=mX030HVyLUpm5q0LRW1Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: isl68137: Add RAA228234 compatible
To: Conor Dooley <conor@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Grant Peltier <grantpeltier93@gmail.com>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Patrick Rudolph <patrick.rudolph@9elements.com>
Content-Type: text/plain; charset="UTF-8"

Hi


On Wed, 3 Jun 2026 at 21:39, Conor Dooley <conor@kernel.org> wrote:
>
> On Wed, Jun 03, 2026 at 11:01:26AM +0000, Naresh Solanki wrote:
> > From: Patrick Rudolph <patrick.rudolph@9elements.com>
> >
> > Add the compatible string for the Renesas RAA228234 8-phase PWM
> > controller, which shares the same PMBus interface as the RAA228228.
>
> Given this, and what the driver change looks like, why is a fallback
> compatible not used?
Are you suggesting that the binding should use renesas,raa228228 as a
fallback compatible, similar to how renesas,raa228942 and
renesas,raa228943 fall back to renesas,raa228244? Or is there a
specific reason you'd expect it not to be used here?

Regards,
Naresh

>
> >
> > Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> > Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> > ---
> >  Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> > index 8216cdf758d8..2988bc6300ae 100644
> > --- a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> > @@ -55,6 +55,7 @@ properties:
> >            - renesas,raa228004
> >            - renesas,raa228006
> >            - renesas,raa228228
> > +          - renesas,raa228234
> >            - renesas,raa228244
> >            - renesas,raa228246
> >            - renesas,raa229001
> > --
> > 2.43.0
> >
