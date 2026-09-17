Received: from mail-lr2-f40.google.com (mail-lr2-f40.google.com [74.125.230.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403B42E737E
	for <linux-hwmon@vger.kernel.org>; Thu, 17 Sep 2026 01:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789608049; cv=pass; b=R4xRWFouWMHymDxfsdqDXB/h+4rORk1q1CP21vyfm7WS1ZewYkesdOyDD7N6kL5/9PCCvpqRcTL5zh2zZ/x0oUGin6EBp6E2GkXQ/C8C7DB3yr3h84DNm0J9bzTsMxxnppL2vWlFqqJhAheRRMATmxPMJrFUT4kJ1NMC+PSEXP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789608049; c=relaxed/simple;
	bh=JE6JhFt7uwibX+/JwtwXQf+od6j4Kxf+0SEGWI7CQAQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p3st6OpRZcKP76meU/lju488JPHa3QhcaKAtMZde+xNPDdRP5EQNlWWniwPnl+jo0ZhSkPLp4ug6hsycecT21aZrdefbfFy9FOj1xCeJzkcCA/gW5bs/LU/1W+k7R6XfzJuf1MTadtkzLCdBBXyZ9VUTZRPjtJeGXEWAhiHQbOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dvgdmQjr; arc=pass smtp.client-ip=74.125.230.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dvgdmQjr"
Received: by mail-lr2-f40.google.com with SMTP id 38308e7fff4ca-3a5da7416f9so2532101fa.2
        for <linux-hwmon@vger.kernel.org>; Wed, 16 Sep 2026 18:20:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789608046; cv=none;
        d=google.com; s=arc-20260327;
        b=mmOI4hge/QhejTYlwTR2D27Uf8puTagWlxgNiAmte30rfjnVPHls99/m1KE470zq96
         XtNSwSdZQAoWB1OLoGArvF/x8h9jQUEIld631jh3crfwJyIBmb7GYv0gKnuwAclJTfkI
         zJBbXUVB/Qd/trRfhuNWSU1cItB1sPziAhetfYIEIpK/H365lBY8ZxiO53aOpAoBAkiH
         aBZ18FoakQdxtHvhIO0V3G4/oS3Dq3KLQjgMlTWMtSjatyF1j9CQevlisiusW3nd3TgM
         fKk1kK9n9mHuSeIUJgHaSPqY2d5A0RiX5yMBlk3jnbWZebwmmKyKk09Dd8ZNeTMnbk8q
         mmRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nOOMHObQRBAIss4LauCRNXpDdTW1eSIKzzXC9H3Alhc=;
        fh=Api1M4IRGx9r+LYDQLoTpZctpBiHaYmKwzyAQHBPOhc=;
        b=V6Gwpe0K495CTM4K5HWNT2ZlgyQikTuZZmKhDAzjNh8zj4OCgJ2AOAv6OJ8mPPdTUo
         vgP2nTt7Fn56+2ICVqfjowpCZjARqVJ0kZZlLwZMe4Qp2Eo80yVToALpPQ8q9+yT5U7c
         VIwuKKAjAP98Cd920d2yfbvT6rTjbu9UXaOvtTCUxE/xYkLkb4IFqxRKtmdE9q+DHs60
         2wf4l+MHl/fAmIhrqjMRT1P0yaV/SMmtXy/q61WKPU7nlathxX80Hf4rahR4SfcunTOT
         +hIQsLqtv/3B0m9biuyIWaU7wmgctQ03dE9QDsh925GcqiFj8DVxGWXAexieRjlDF1OR
         tK6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789608046; x=1790212846; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nOOMHObQRBAIss4LauCRNXpDdTW1eSIKzzXC9H3Alhc=;
        b=dvgdmQjrb1SXh7DQfch2NI+Wmlnb/4wTBgmBRnr7A8k/LlGOtY2X2bSagtfGEzJq6l
         fRDRuk/dhYSQ/QpTgzK/wgEFGDuSQzuLeCHKBrYW4YS+8nylX7Fd7IM9dFdLmSx3K2FI
         NGrw31WenG4IQ3MMICRGJuTMEF56Cthio/+kt4SBV8PeFnn6xezAtOoClYQpseo50uax
         2UhKzRqYg5qn1lvTqmcJXY5/ZdnCGc/kBLiZbReqSqFraGDqGXaLRCBV1Hii8soQadr6
         frT2sNCtv5uJzKNL98ZDHFbrTpAcYIW982z/+ZumgSe7fL4ooX58xxriv9KipAtraGaH
         TWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789608046; x=1790212846;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nOOMHObQRBAIss4LauCRNXpDdTW1eSIKzzXC9H3Alhc=;
        b=fn0yS+ALETBEj/bs80pZ6LMepIMM6EiJDsg6/AOy1knLgqJXTPtqJfS3nUdffTcJ98
         it21rreYkql6JDrNSBl0zK2hjTY9ej+IfGCWwRsf2fznMN6DD7g2xSuQ1sQ4xkCoi6qG
         Hl/aFq2kVXAEhskxVyL05+crxcyHSfTLxUKDMaLdxH9abOi5bIewxh5MPzLfG9FI6IHF
         KXaZDA0M9A3O6jt+3j4b2S9Z9PyvNwT+tas++MLCOwZqRYUAN7b55ECbhqDg6wa3miCq
         Le7Z9mk/R2ggz2HD9BKRPeFLaTwAFEbGwkp1/jTigUhknAQaXSEtrU6Vd0tqEGEj5bix
         3SHQ==
X-Gm-Message-State: AFuF++mGunISqC6EDmWAnhK7AtbAYoSdtmRj4fbGlVrpfPBsvAnDOyul
	Kri1BKT2mmb9T6fW5fpacvVMkOGnWVMLJ1bpbmEk24jXAB2YHBU017K0Jo0Jy0QwCXwDjT2RgQo
	9ZANz488vnx8hiZ22/Qz3+ogZMTQ0Yyo=
X-Gm-Gg: AYBFou1wqXCVvhy5dSe797WpqpBkn6S1XAcC7g6dHI3+jQWWsEVPCqAi2ArANnVL/6i
	xbsMcXxt1uAPUFUkAJ0GrHNTqSvkcP6c9nE8f5sd2yTs0VQmlL4VnNG7b7LE2675ueTRzyDVVHx
	3aTszD16rb1mv7rKswJn2QJVaxHk7qQZpW4iRKytVAkJMLVUHOBRB6kDj9BNdMWlg6GuTgkOKWG
	FpQbkxzcHC+tzj1goJMmhsk6knorRvCTsW2/38L2nIkNBp7IQLGCuERMHij5XgRfj5Nm9kW+5cU
	+V3z7b2nOdlzyXa9eall4oFwfJl9wYT0U2oDntITYuL6st4yPDljas5p1SZ2fo60m1pp/pb2IGi
	iHBVVpCSFDoqQmg==
X-Received: by 2002:a2e:bc1e:0:b0:3a5:f041:d7c4 with SMTP id
 38308e7fff4ca-3a5f041da54mr299311fa.17.1789608045973; Wed, 16 Sep 2026
 18:20:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915052021.6959-1-syhuang3@nuvoton.com> <f60a440e-1b9d-457b-865f-b3c4778d966b@roeck-us.net>
In-Reply-To: <f60a440e-1b9d-457b-865f-b3c4778d966b@roeck-us.net>
From: Sheng-Yuan Huang <hsyemail2@gmail.com>
Date: Thu, 17 Sep 2026 09:20:33 +0800
X-Gm-Features: AcwNN1UXSRHVsaDtbTNimMW42Y1gjHq9uS4TxC2W27XMSX28femBTxPDTsjGqk0
Message-ID: <CACW=pY7u2wOzgc05gHfRVJFx12CXGvZe7fCwgPZ_y8dSo02PSQ@mail.gmail.com>
Subject: Re: [PATCH v3] hwmon: (lm75) Add support for Nuvoton NCT7715
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Sheng-Yuan Huang <syhuang3@nuvoton.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jean Delvare <jdelvare@suse.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Guenter Roeck <linux@roeck-us.net> =E6=96=BC 2026=E5=B9=B49=E6=9C=8815=E6=
=97=A5=E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=8810:37=E5=AF=AB=E9=81=93=EF=BC=9A

> > @@ -1129,7 +1147,8 @@ static int lm75_suspend(struct device *dev)
> >   {
> >       struct lm75_data *data =3D dev_get_drvdata(dev);
> >
> > -     return regmap_update_bits(data->regmap, LM75_REG_CONF, LM75_SHUTD=
OWN, LM75_SHUTDOWN);
> > +     return regmap_update_bits(data->regmap, LM75_REG_CONF,
> > +                               LM75_SHUTDOWN, LM75_SHUTDOWN);
>
> Drop this change.
>

Thank you for pointing this out. I will address it in the next patch.

Thanks,
Sheng-Yuan Huang
