Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1BE23A562
	for <linux-hwmon@vger.kernel.org>; Wed, 31 Dec 2025 14:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767190711; cv=none; b=nHe2jVKur53LM+auYip3vgkrCHSqvy4FOq1DBuJUUaohxG3uOlqijFRioVo7ROee+GHpf4g2SulItG8RhRn3qteMa+U+jcIWcV7nARy7RSJVuDNgAlV52xslO8Vr32WEdBmosA6+vXiePwg9o25cRZvb2UaGQQO/3uQsZgmdVWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767190711; c=relaxed/simple;
	bh=bMo6D2vfzSF/l7vfhuXH46dTpj32l/qEMFUna2eeHSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DYyJ6h/+78EzUG0JyW3XDW4sbPW/zBeiKfaETlpnVwZTBY8Yk70ivcbBWpPt4ELhsbTC+1RV7Amapza8wACKTYG/KZbYh8CBUBLXVOJwdWgtg/+aMXMj1hCscjpsfGF0ByecWelOXOLkyKpwUwGH/ND194M/qGZ7ZPDKgAjUQEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FvWBpzja; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FvWBpzja"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7bb710d1d1dso15344357b3a.1
        for <linux-hwmon@vger.kernel.org>; Wed, 31 Dec 2025 06:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767190709; x=1767795509; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sBqH6S/0RlXFPmX265PUBJNYKV+Ni6YZkY3nzq641q8=;
        b=FvWBpzjaaMuREMrgwz5iOpdUNtghzhhRo52krY0BFcUpalW81nFKR55WMF3NoMXJYL
         rAfTIGCI80awM80gq2QnW3Lfcs0WogXWNWgYv0HHqFsJcBF62HaZkiD2jZtA4frnlic7
         pEaIXsJWWfMdDVdhc3lNn8y3kgJB6HUJUYGmwum6CBpWYptoplaUSg9d0RrixQfzGfOP
         0kLR7md9Cyz0F7JqnNjR1LuuPfMSFDt2Iv3xkMjTcgsKq4PcZb/p0HNYD0/ERsCdBb+8
         INN8/i3VytFUzNsN38jsE3fTFgezwW1xpvGx+NI3ERSuHzmSGqV1s/INZF5Dx4Bc55ly
         WxNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767190709; x=1767795509;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sBqH6S/0RlXFPmX265PUBJNYKV+Ni6YZkY3nzq641q8=;
        b=malpfLvyAqlWDe5qIyEiJrLwsT0YEqRPdXSzw+HGaWEkhjYdjhzz8UAOWDiNnCtfxs
         P1yypjaGOI5iARyDp1JYJPtOn6eZxCcm0G2fB/svMts/p9Qdn9fdtz5sL/3Szw41xy3U
         IcJY2Q7qsmDl/rvZKTFHE+WNLJ+b/LPAjw2ZQNBCIiPmbPSW4MMU4gf4CZgr/a3Csfw7
         o+DLf8Ho4VQJGGuQplVFWB6IwP/DioIcyVRYBzWCEtD92vLJQQkIkbJLQCWQMyy5+g9Z
         IxbqXktVQwL/C05MuohEO2SUxdtabyJreeBRs17cjXHe2cjPEVJ6vjNpeq2iiyWXAfWW
         DSwg==
X-Forwarded-Encrypted: i=1; AJvYcCXCZbTGl/1lehjUwu/mu6OYoVbv3tmRU3OsXa8pKxiFRRpHSnOUChP0QS+QeJyk6g0beiQmv5JQJjPGeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRoEE72vRtcKlh1lFy0y1o7PSyHNncaP8nDhSwlSwuDH5+An10
	LUVCzRNqFjafruie1+LJItf1v7KqfmoOvbqrsX9TM7VtXHxmzCVtQwP8
X-Gm-Gg: AY/fxX6eI3Nw3QddCqrUKP9WxzBDb/ECx8WtA+/DEaeRwu5/jU1PDxABpHbhBT71zTI
	zgQsdVns6fwYbfN+TYAZwNoI0JS/biwdLgSO0wUHAVDpuQ2Gs2cC3SfkIBNW1KKO5YG2/IUs07f
	ZOeZvpkkqIYs7vlKW4HJ50jJWmORurzWGIQ0Mqn/5pduG4vi7g9PjHSGMZwtfyHKxn5e4ijfYpf
	0avCEdflnpAyoamnACozJZ6fk7wFrRTekekdiZTsLFtyvqslTpAsvIbhKkYs5bLrsT7TL3NMsEc
	rjrlieHi9JKg7OOpbyXTDihvaCKlKqSbzGB/IOZmS2QGGtl7zxJ+mmuAeLWR5UDwXrxfJIZFJCF
	WdkDLm+x8pRxTY77gsoF2yZf/hs91fzqBSk+f3iUdG7hX1bC/hLoPALU5ptRyQaDp1llUDxgnGH
	DYD0GehgInvioXf6p/WwA8R+B6uaV8xW8r1Qo=
X-Google-Smtp-Source: AGHT+IG43HNIT9aj3O42EF/+ZUT5/76kYBY0OEEbZJI6Mta8sGxJLto2coIUWm4QlzOuBgmoPEhtyQ==
X-Received: by 2002:a05:7022:4284:b0:11b:9386:7ed3 with SMTP id a92af1059eb24-1217230b84amr38554922c88.48.1767190708463;
        Wed, 31 Dec 2025 06:18:28 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253bfe2sm105036159c88.10.2025.12.31.06.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 06:18:27 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 31 Dec 2025 06:18:26 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: David Laight <david.laight.linux@gmail.com>
Cc: SeungJu Cheon <suunj1331@gmail.com>, ray.huang@amd.com,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon:fam15h_power Use div64_u64() for 64-bit divisor
Message-ID: <695493ae-f8ef-4e25-a194-361436bd7779@roeck-us.net>
References: <20251230120959.199139-1-suunj1331@gmail.com>
 <20251230232357.00222b64@pumpkin>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230232357.00222b64@pumpkin>

On Tue, Dec 30, 2025 at 11:23:57PM +0000, David Laight wrote:
> On Tue, 30 Dec 2025 21:09:59 +0900
> SeungJu Cheon <suunj1331@gmail.com> wrote:
> 
> > tdelta is u64, but do_div() truncates the divisor to 32 bits.
> > Use div64_u64() to handle the full 64-bit divisor correctly.
> 
> Looking at the code I think that tdelta is a time interval and will
> always fit in 32bits - so the code is probably fine.
> 
Agreed.

> Also I can't see anything that requires jdelta[] be an array.
> Neither can I see the justification for MAX_CUS being 8.
> 
Also agree.

Guenter

> > 
> > Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
> > ---
> >  drivers/hwmon/fam15h_power.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/hwmon/fam15h_power.c b/drivers/hwmon/fam15h_power.c
> > index 8ecebea53651..5e3692606516 100644
> > --- a/drivers/hwmon/fam15h_power.c
> > +++ b/drivers/hwmon/fam15h_power.c
> > @@ -241,7 +241,7 @@ static ssize_t power1_average_show(struct device *dev,
> >  		}
> >  		tdelta = data->cpu_sw_pwr_ptsc[cu] - prev_ptsc[cu];
> >  		jdelta[cu] *= data->cpu_pwr_sample_ratio * 1000;
> > -		do_div(jdelta[cu], tdelta);
> > +		jdelta[cu] = div64_u64(jdelta[cu], tdelta);
> >  
> >  		/* the unit is microWatt */
> >  		avg_acc += jdelta[cu];
> 
> That could be:
> 		jdelta *= data->cpu_pwr_sample_ratio * 1000;
> 		avg_acc += div64_u64(jdelta, tdelta);
> (or even 1 line...)
> 
> 	David
> 
> 
