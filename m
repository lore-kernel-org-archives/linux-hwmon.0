Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E912AE8C
	for <linux-hwmon@vger.kernel.org>; Wed,  9 Apr 2025 14:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744209081; cv=none; b=WorIGqOpjhb6lxh5pJhq6fLXADtrBgk1JZrfw27lq89R1JA0mm0P3xHtMUZaJKj758vTsbf8FV+rXFZTy01NbdrlxfHh6zyhk30vH8Uu0PNp9oi9S7lgdKNDmLE8fQNk0IYafOQZ8HUCAvl1sM2Ob4/1p7IMk/7o89MVdrpJBBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744209081; c=relaxed/simple;
	bh=/A0/E6RW+zz/Q3F9MNhOyGXOFashPLIF47QpTHlLk50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jZn5qSCTll2CAu3vNNENcUNxFkWg6upzZA9MfjjcTHJi/sTGUSkKyUiXG2siZ3qWpy7V43oC1IrNgRC5HAJmKA9GimvoT0Z8qiKTQv7O9vsm5biMfUk7y5Vuhuc0HNPIfzeb7hagFGcY6ATIM33nRVHVrNmTVPRxa9sLYv1qgPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d8PzMpKA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d8PzMpKA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744209078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bWzyml1e3e0sFCXu/PTQRw2B8guy4dfIE5xDJUgcYCI=;
	b=d8PzMpKABuB3FlNEE84IaVyEjavXdYKg4wj4bMLGy10oxE0b+/Hs+t4suc5iSSX+881SsU
	cZrJ4DNUs6n2J+tDcNq401X7NZIxOvK0q8ztO+RFCyFXDnDxsgbA192xwR+mev7rfQCk+q
	3U1s4wjSF40PDN3jmk0x0MZT2uNwSN0=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-NffpMMneO12xZnTWS4dsRA-1; Wed, 09 Apr 2025 10:31:17 -0400
X-MC-Unique: NffpMMneO12xZnTWS4dsRA-1
X-Mimecast-MFC-AGG-ID: NffpMMneO12xZnTWS4dsRA_1744209076
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-2c84aead25aso295620fac.0
        for <linux-hwmon@vger.kernel.org>; Wed, 09 Apr 2025 07:31:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744209076; x=1744813876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bWzyml1e3e0sFCXu/PTQRw2B8guy4dfIE5xDJUgcYCI=;
        b=JVdiCirMqBH3QzOUu8mmEwZQeo0EVdoMPvlRflKdMNmj9e0VTpQfm2TAczW+1EupXK
         ToG/KEsZVs82p9j3ss5o4taRJjRhwD9bIaymE1nuYRj8rolERFbMnI5XLZvDiW1fNE1T
         RfZySLGrJkcRkqN1NmMkAm+lPPoofgyFnc+H3rOL/M1mjVu0aamFkvZAISByXmICMzXf
         l90gLmTI6uk5Pp3HhOO7kdAW9j4SJN0F7YgLDpklPvIz4NJ2s89821yptPCOdUUxeVDQ
         2LBXJ7+rgA/evcvo3sii6dBKmB31dZbvTZfRgbZ+LHRL4oQAVoOiepknla7WBv/SypSm
         M6bg==
X-Forwarded-Encrypted: i=1; AJvYcCVTWyG1gCNeNlzQUzLFRLgSfq7dqqO6IyOtPNkNtxv2+Az5oxPp44E0awKlny80ga/saVLwNkEfstqtkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyR1xA4NogWS+jdC+iTZxIqvRWHs8K1wJK3uz65Y+my8jgjLKJb
	h3hqg/EThYzTH0dvkeFXjWZMM5Y1BPAl7sXZ8RII2ZMCxqA8Ooz/iA4/jPDpwI9chnXKaIvw5Zn
	f/8ZsB5SVskx9bp0bod2aPXTDZL28olDSczvpPSY9YnuqNFXe5gDNT4aswCkm37Qriv35MwVLFU
	IpA3khgBquzb0ottFlV/u1cGAEaAjt9qXJjFU=
X-Gm-Gg: ASbGncugcInsdVm06kG8rntppLrWD+7BdEplHBIDHgBrW5PqxPXZZXTWYuDgJhTJJTY
	nfcI7iFZSp5hIwHt43iad/YoKhGTqGjPNlifqsT/v39Yhwy52gsMKLMuyHCWtOVUO+v7s
X-Received: by 2002:a05:6871:6184:b0:29e:32e7:5f0d with SMTP id 586e51a60fabf-2d08df909f5mr633849fac.10.1744209076144;
        Wed, 09 Apr 2025 07:31:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEj15/sfKzjsjKYtAN6/sg9JG469/cZB1MFteleubs5OfTolZvlG+wELSU/pYcsvOH+TTr8CnoX3erw61YVCr4=
X-Received: by 2002:a05:6871:6184:b0:29e:32e7:5f0d with SMTP id
 586e51a60fabf-2d08df909f5mr633832fac.10.1744209075809; Wed, 09 Apr 2025
 07:31:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409074529.2233733-1-ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <20250409074529.2233733-1-ciprianmarian.costea@oss.nxp.com>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Wed, 9 Apr 2025 16:30:58 +0200
X-Gm-Features: ATxdqUHzKWaL37Ln9vA_iKRnaJ2sqIT6FJHzwrfyAc7evIoEaSOKgMOMRDePQYI
Message-ID: <CALE0LRscnNFzo-tdjBdQQSi=1EdMveX-eSXyhpg_Bdp6EFiKgA@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon: (ina2xx) make regulator 'vs' support optional
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, s32@nxp.com, imx@lists.linux.dev, 
	Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>, 
	Eric Chanudet <echanude@redhat.com>, Florin Buica <florin.buica@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ciprian,

Many thanks for your patch.

On Wed, Apr 9, 2025 at 9:45=E2=80=AFAM Ciprian Costea
<ciprianmarian.costea@oss.nxp.com> wrote:
>
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>
> According to the 'ti,ina2xx' binding, the 'vs-supply' property is
> optional. Use devm_regulator_get_enable_optional() to avoid a kernel
> warning message if the property is not provided.
>
> Co-developed-by: Florin Buica <florin.buica@nxp.com>
> Signed-off-by: Florin Buica <florin.buica@nxp.com>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

I verified that using the following patch gets rid of the kernel
warning about using the dummy regulator, and that the driver continue
working as expected.

[    7.247679] ina2xx 2-0040: power monitor ina231 (Rshunt =3D 1000 uOhm)

So,

Tested-by: Enric Balletbo i Serra <eballetbo@kernel.org>

Thanks,
  Enric


> ---
>  drivers/hwmon/ina2xx.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
> index 345fe7db9de9..b79e9c2072b3 100644
> --- a/drivers/hwmon/ina2xx.c
> +++ b/drivers/hwmon/ina2xx.c
> @@ -959,8 +959,11 @@ static int ina2xx_probe(struct i2c_client *client)
>                 return PTR_ERR(data->regmap);
>         }
>
> -       ret =3D devm_regulator_get_enable(dev, "vs");
> -       if (ret)
> +       /* Regulator core returns -ENODEV if the 'vs' is not available.
> +        * Hence the check for -ENODEV return code is necessary.
> +        */
> +       ret =3D devm_regulator_get_enable_optional(dev, "vs");
> +       if (ret < 0 && ret !=3D -ENODEV)
>                 return dev_err_probe(dev, ret, "failed to enable vs regul=
ator\n");
>
>         ret =3D ina2xx_init(dev, data);
> --
> 2.45.2
>

