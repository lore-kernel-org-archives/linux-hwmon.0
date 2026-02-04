Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6476127A465
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Feb 2026 23:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770246682; cv=none; b=O6A/6y+War1IEpPVnERvsLJYFAHAs8nkUZ9twwIp2wrTnwcEPlZudR+wItecg/DHNfL4uZVGJcE1aDZnQ9VbD5dB2C/eZBROB4iIBiM3X6jPFAOAzmOD48boqgq63zxwhnJyTBLe6543aQzG3NOoEUIHWP3fHKXibxFje4Lx6V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770246682; c=relaxed/simple;
	bh=TckyB6iYYm5KkotT2QCxxNU8AROlGiDTb9yeOnCuepQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dv0yX3acNZKYnkn+JI9L7/cmCxVQQKcoF1Y9oZWeathV1NGVbUbIRyP2cGhbE04ctM15opUCvZejRiTj/PzMylQp33VI9vJQdRriGghdogee34aAAslusT2w3kTkhl/fRA1XDnxVYoevyOFUQvARL4QPVtwMoa0K2+eelVlkdss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ifltekv/; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ifltekv/"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a93210fcc2so2636785ad.3
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Feb 2026 15:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770246681; x=1770851481; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iWhpbv6Q42QiCNT5/Rgn0nRmR7PDJhGNLJ7XTMjk+9s=;
        b=Ifltekv/y5s3OkEWhkIrW53Ux8WqDT072z2iZG6BCJnp06yzy/opW/GsLdKlo48GVW
         1+77PSoFDmLhjI+Tx0N2hKZpK3tJPVKhWYGlJAs/X3/6jnPGdaBitKN6+dsXd0aEBJeF
         oDWkMFVqVGJF6vj5B3Vovt8NnG9vQY2oIioWDD+wYew15dirrj/oEW3ujD8VeNbY/GtY
         hS4UvAniyiZSWhw4vBQLsHlF8lNo8yZvhgH9pHxShYHgon54sV2uztXSRxBGs/th3tX7
         baLV5gCiFNv8EwptRRA9GN+Fjj2rI+L1RocMcqJoyohr7YOj7s1gZ9e1qdLx5WdgfAV+
         HDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770246681; x=1770851481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iWhpbv6Q42QiCNT5/Rgn0nRmR7PDJhGNLJ7XTMjk+9s=;
        b=dglMF4Uqgu+lE1FyxWV4nK3i2Q+SzIsT/QrXD9O0Nc8K8iuaKKzAOEqwfuUurbAyyw
         CV0vLpdautUFGAXitCK1vQfwzlRyZ1zMPu7G1dskyqqa5JMNLJnJKRRGYxKfQrm62gSR
         RQPhbRZzD0IlIT913at3SVTthT+5KVhL43i20Oz7ruCzDKG4GODUyS7+Yn5W7zC1Wxuj
         6ShGpx0CPmCVtpkLHoAmumPh8MkAioiIhjGgmklocRp8ofNFs3Atv9huSUN79TuUnrVH
         aoofvTtZ8Uffavpmlp0g04oM+TPKBzn77Puu1/pDd8inilG+ioGVOJt++iKtE1EGsyGI
         MDqw==
X-Gm-Message-State: AOJu0YwGWUeRHFhEdZLW9+qHPVt5kYlZlUu7MDsPXedTNWHLnVfU1f8B
	BtFHVJ02IPku0PqYeK/UBe6RvrIymrz/yUaUCvg9NAJnb35wTaPyUhJdI5jhkIaB
X-Gm-Gg: AZuq6aLczdAIOw+xunZy/y7/gVOGdth5cOx17CPHSN9v8X05sit0QBm4bTwyKG+1eX4
	D6Uuy6oB0uuGSTh2Zgy19j0cEJTSRsiLFuNhMgGdaE03e3ecjxoU9PKe9WIARnBC5GbIvY9kK3d
	JE00zhsL1ExBKI4Iocz9RYADaeqU/TSlGwdrxLbDb6AlW0dOe3nxWt+ctvU+PtahWCYJ0YPVEr4
	KgsOXvWXVtnNJJT+/pI/Ujj+Jaq6+MUgwkJWLDI9ytBHWw56+tUHgYuBNVdghsStyvSv7Uf0Ltr
	e3M0PHNOUhXkh+rPS39Dj8JiFwRqowtHnxjl0FnlZIqNOSAIAkkDDHiKF8r/k1ID//JCsuXdVX5
	CwY7xaBscXoGb8omxyFz5kt4nuXVzrc5ImRwQ8hQBPtmYAMDUS78QMvp6CW5S04BLvqt6PKQYOu
	IxP/GZVt6eESWzQN05RnLPGAqJ
X-Received: by 2002:a17:903:2447:b0:2a0:b06d:1585 with SMTP id d9443c01a7336-2a933ea08d3mr44655865ad.34.1770246681372;
        Wed, 04 Feb 2026 15:11:21 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a93394e635sm36036235ad.52.2026.02.04.15.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 15:11:20 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 4 Feb 2026 15:11:19 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Joshua Peisach <jpeisach@ubuntu.com>
Cc: linux-hwmon@vger.kernel.org, Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] hwmon: nct6683: fix memory leak in
 nct6683_create_attr_group
Message-ID: <bbbfacab-8cec-4ab1-969f-f7ba4a5fd837@roeck-us.net>
References: <20260204211543.70029-1-jpeisach@ubuntu.com>
 <3887feb9-344a-43e3-935e-8d651f9b923b@roeck-us.net>
 <DG6JQFD4244G.2DXHNWR3VQ1TL@ubuntu.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DG6JQFD4244G.2DXHNWR3VQ1TL@ubuntu.com>

On Wed, Feb 04, 2026 at 05:55:16PM -0500, Joshua Peisach wrote:
> On Wed Feb 4, 2026 at 5:09 PM EST, Guenter Roeck wrote:
> > On 2/4/26 13:15, Joshua Peisach wrote:
> > > If allocation fails, free prior allocations before returning.
> > > 
> > > Not tested on real hardware. Did not update rest of file for style
> > > changes, only updated the NULL conditional checks.
> > > 
> > > Signed-off-by: Joshua Peisach <jpeisach@ubuntu.com>
> > 
> > Allocation is with devm_kzalloc(), so the memory is released after
> > the driver is unloaded, which happens immediately because the probe
> > function is about to fail.
> > 
> > > ---
> > >   drivers/hwmon/nct6683.c | 16 +++++++++++-----
> > >   1 file changed, 11 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
> > > index 6cda35388..365f6b99d 100644
> > > --- a/drivers/hwmon/nct6683.c
> > > +++ b/drivers/hwmon/nct6683.c
> > > @@ -431,18 +431,18 @@ nct6683_create_attr_group(struct device *dev,
> > >   		return ERR_PTR(-EINVAL);
> > >   	group = devm_kzalloc(dev, sizeof(*group), GFP_KERNEL);
> > > -	if (group == NULL)
> > > +	if (!group)
> > >   		return ERR_PTR(-ENOMEM);
> > >   	attrs = devm_kcalloc(dev, repeat * count + 1, sizeof(*attrs),
> > >   			     GFP_KERNEL);
> > > -	if (attrs == NULL)
> > > -		return ERR_PTR(-ENOMEM);
> > > +	if (!attrs)
> > > +		goto out_free_group;
> > >   	su = devm_kzalloc(dev, array3_size(repeat, count, sizeof(*su)),
> > >   			  GFP_KERNEL);
> > > -	if (su == NULL)
> > > -		return ERR_PTR(-ENOMEM);
> > > +	if (!su)
> > > +		goto out_free_attrs;
> > >   	group->attrs = attrs;
> > >   	group->is_visible = tg->is_visible;
> > > @@ -481,6 +481,12 @@ nct6683_create_attr_group(struct device *dev,
> > >   	}
> > >   	return group;
> > > +
> > > +out_free_attrs:
> > > +	devm_kfree(dev, attrs);
> > > +out_free_group:
> > > +	devm_kfree(dev, group);
> > 
> > That defeats the purpose if using devm_kzalloc().
> > 
> > NACK. There is no problem.
> > 
> 
> Ah - I didn't see that was how devm_kzalloc works. Should I write some
> documentation in devres.h to clarify its behavior, so this doesn't
> happen again? Once I found it in the header it made sense :)
> 

The whole purpose of all devm_ functions is to avoid the need for cleanup.
This is already explained in detail in driver-api/driver-model/devres.rst.
While that document might benefit from an update (there are lots of devm_
functions which are not listed), I don't see the need for another document.

Thanks,
Guenter
