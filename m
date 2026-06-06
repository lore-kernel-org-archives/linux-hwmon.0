Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C61C13E41A
	for <linux-hwmon@vger.kernel.org>; Sat,  6 Jun 2026 19:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780773793; cv=pass; b=PqYXF8O0nh3pvqwOXqD7YpFnFEpaKJcbhDW8Ucbq3V1ywAx855Fx6OgyciVToCZEBYDzGBsPoQa4WjZRxxcD8mt2Gv8Ne39CZ6lbbXM2Y7Efia/eAQhSavqPeKx1X81xp1gRI6HtDy22qcB7hOh5LflR7d/If+YqT/HO3iXhWZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780773793; c=relaxed/simple;
	bh=tC9AmXFGMiYnO+kkrcnOWspPb5mHT3MiBIYbAb8diNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JoupATUyeMKctICmabO/HwU55cpYVXyW42FKEwJvtKyFXgxJpxkOU84AA4WCfaGUQZSNNE1sXtGgupBWBjPzeUwm5jWWjhul8sF9q+LIRL34WNHz3uhVpXZu0yxGtow27ZG3sd4wnO7aqPadR5ifimR0JGqld4wEfWYm7b2cX7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mb8Uv6/P; arc=pass smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mb8Uv6/P"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8ccf6a63a45so37828446d6.3
        for <linux-hwmon@vger.kernel.org>; Sat, 06 Jun 2026 12:23:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780773791; cv=none;
        d=google.com; s=arc-20240605;
        b=JtotxUDa04UFwnCgv6qjDb598waTpg0e8WE0u2gCPEFazECdrt2t7RfrDDgyp1MVlr
         AbaxOhIcNl1oYjmdY7pw0z+utC6kKd11VbLurm9MATBB5zPEKVCzo7qRiKOFebVWGFT9
         IVcZNyjMoRea30pA/bIZihSPn76+FhC4RDyPu+TWMghploBtiV2/t6ZO7c22pphAAZdD
         mBB3UIcuV+mDZQIVT5P1tWx/zi4oR5690AaIxBj/qz/vEbbdF8tZcPDybdjMCYk6BlJx
         q2eRflIaz7U5tJM4nD7pITKQAqfZWSPkjN3eV/WQvm27oc1s1NZh3ckfIgBv/qHVIdSo
         dpVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=io0r5B0j52Irbk9ChnrlA/qf6LQqs0TXhH3ThOwHuhU=;
        fh=oa4FpuZ2NGCP52u3dRn/GlEOU7/Xw0f+Q5/MDUXszjw=;
        b=TeheyP6+cQlEQx/Ln95bCjuG+l+b0+EQJvybUnUH6oVUKkWMjv95jSy1EWW235G9JX
         tzjiAR820YUrx0GHAruJYMHqacGcCEUEceCxZcgdYCQvu8A0b5kCcio3qp4CjjL/itUq
         GtFDmC1QwctOHcrjQ4xhwQoWt6wjrpv1N0jOIEcP+Q06+lfq2VuYC9FwSk7kJWmAeJ4q
         umDedRNlrK1jNRWYBl4b7y145f+Qsz1DPCPq8YxndA7i37UwpAOM4qpRBNmDXv+dB8hG
         MJTJamiElpvYLJvNGt/ToyBb7jXFVhPY6GkevlZB2UOlYdJ4SrHhuw3xMUWtPV2FMjgT
         GsVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780773791; x=1781378591; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=io0r5B0j52Irbk9ChnrlA/qf6LQqs0TXhH3ThOwHuhU=;
        b=Mb8Uv6/Psy2leWYOoz4yFv2tX+tUn5YEiUUVxx2eyoGa3D5XnBZwEOkt+mWlAZLn6m
         j/rBhP7a1JBmbAWqwvPH8ans5bzZnd83axemnylYCQvIOWQXpoI0wXbmlY1vkq8ctu2Z
         s4xGhhNDNJg0wq6Fv8tHwx5SiPAOAxWaSUkr0YABWJ7ed4leA+LnRvTQFA24pV0xMZ07
         LzhGV77sHdzvgU1tGfGcRHRkoWnMjZZN3K4d+iqSR5M2Y0IG4tvJoC7kCYYCIXlo0UfB
         G7OPtxSFIadjyKjPbsDIRp5kklnZtQ06DcxXSUYtQcPuN/aLt/Rea76m2PSqYX7fp4CF
         9vvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780773791; x=1781378591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=io0r5B0j52Irbk9ChnrlA/qf6LQqs0TXhH3ThOwHuhU=;
        b=tQeQW53NIJIgNhre3B1rBTlBhKGI0G+unev5Ogil1laLAPwmaYu6hjeF7Zg+R6TASD
         ++DyYXDwLX70Nr2oqOrwGnyU0pasXJlje32YNmXUEvFOkdUeI2SM4wd/gfISuZeP3Opo
         054hw/wmZew511IctJbEOPlCtnqozbpqyxo2x54miOeea+LUTS/FI5jgcM5y23RKUczd
         cru+TsBiao6QOlrzr/656uuAjeACR47vN5YaMZQx6nNrUnCTh+sYzB+h8GwQJrT7Xa5N
         Xk1l7JKUep13JaUH8MJtgdbp2F5SYItthV6RR348enXI8DGPfMZIOeGIOS/uKk25xc5e
         p8qw==
X-Forwarded-Encrypted: i=1; AFNElJ94KPA7Ads0aLTlxEfBYaaGGQU9PwzGjjru1fT71xpx0M/6dpjDcVTGvCKYnsLqFgFsItgWQ+FZz/Fqew==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqRGFeuYo2usrFKZXBEyr+Cay8Q/niW8hqpfgAYzs+dshInyEk
	nFdbWlG0aUulRM5jF3MjBbLh2zf6HM7tOYpItmDf8NJDew3rAkuWU9NMXyjtrelGhv2lKPX8Z4i
	QYYLG1uIlKRVN9p9fcR+T2ZS/aRz3LRw=
X-Gm-Gg: Acq92OFpxkPinf21Ed3HlMZPtVIxjFdWbUGtnGJO1iXe7WzXqDzjIhok/qkORvBjm60
	shpXrcrjVox5c+F2101z+xZDgbQ5vsNpxlXuJe8NlON5M3NL3d71j5/0ZFFtkHspHu0m087Qev3
	IGuK5HyJCWNAqokVFHVgs0fXU952lhVoyniOfsKMVlBj0CV/Hq+P92KqiNt+ZazyoLFSrjWbtOF
	ECM0gKhO9uOZon8HJCxqwwZoSrPlNa8gwyWG/K0yMshihAn90awXpmEJlMM3sQeVGwtjiuyTy7J
	V6b3dvkf0KJ0x5L1cNmRuJpKPz065+9QSQ1uYmOKz1VPazbs6Q==
X-Received: by 2002:a05:6214:54c7:b0:8bb:786d:c429 with SMTP id
 6a1803df08f44-8cee626f38bmr140909676d6.31.1780773791392; Sat, 06 Jun 2026
 12:23:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530221353.159461-1-manishbaing2789@gmail.com> <20260530221353.159461-8-manishbaing2789@gmail.com>
In-Reply-To: <20260530221353.159461-8-manishbaing2789@gmail.com>
From: Manish Baing <manishbaing2789@gmail.com>
Date: Sun, 7 Jun 2026 00:52:59 +0530
X-Gm-Features: AVVi8Ce1BJWKALnCBkpRK6J64zUW6IfjDwfQJFIsaHzh61-ipsSznkIWXoEJySs
Message-ID: <CAJvdc_c0CkJPs3F+yRXx7_=Q1Q2eKUMQhdYBYPfUst2jDKUf6A@mail.gmail.com>
Subject: Re: [PATCH 7/7] hwmon: it87: Use zero-initialization instead of memset()
To: linux@roeck-us.net, jdelvare@suse.com, nuno.sa@analog.com
Cc: abdurrahman@nexthop.ai, bartosz.golaszewski@oss.qualcomm.com, 
	linusw@kernel.org, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, me@brighamcampbell.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

The Sashiko AI bot flagged that replacing memset() with empty brace
initialization {} here might leave padding bytes uninitialized.

 How would you prefer to proceed?   Please let me know in case I need
to send a v2 to address this.

 Sashiko AI review =C2=B7
https://sashiko.dev/#/patchset/20260530221353.159461-1-manishbaing2789@gmai=
l.com?part=3D7

Thanks & Regards,

Manish


On Sun, May 31, 2026 at 3:44=E2=80=AFAM Manish Baing <manishbaing2789@gmail=
.com> wrote:
>
> Reduce the scope of 'struct it87_sio_data sio_data' by moving it inside
> the for-loop and using empty brace initialization (=3D {}). This ensures
> the structure is safely zero-initialized on every iteration, allowing for
> the safe removal of the explicit memset() call.
>
> No functional change.
>
> Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
> ---
>  drivers/hwmon/it87.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index 5fd310662ee4..f3f8d835ff92 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -3777,7 +3777,6 @@ MODULE_DEVICE_TABLE(dmi, it87_dmi_table);
>  static int __init sm_it87_init(void)
>  {
>         int sioaddr[2] =3D { REG_2E, REG_4E };
> -       struct it87_sio_data sio_data;
>         unsigned short isa_address[2];
>         bool found =3D false;
>         int i, err;
> @@ -3789,7 +3788,7 @@ static int __init sm_it87_init(void)
>         dmi_check_system(it87_dmi_table);
>
>         for (i =3D 0; i < ARRAY_SIZE(sioaddr); i++) {
> -               memset(&sio_data, 0, sizeof(struct it87_sio_data));
> +               struct it87_sio_data sio_data =3D { };
>                 isa_address[i] =3D 0;
>                 err =3D it87_find(sioaddr[i], &isa_address[i], &sio_data,=
 i);
>                 if (err || isa_address[i] =3D=3D 0)
> --
> 2.43.0
>
