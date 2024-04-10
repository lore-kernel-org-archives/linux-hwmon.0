Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A02E16E885
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Apr 2024 15:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712761941; cv=none; b=YmtQBBIIHPJST9EYVvz6rFxq7CP2fF+053xFcwr18tBP9P+ILGeIr68DKSVryrjGu+QdaBrfBYc6eFjiKiBqMwJgy8fkb5BXmgWD29eoDzEKpOHAy8DkD8MW2zSDkD7O/AQWnAeP1ChRPGdj/R54LNWC09Pu0Lgm4W+xm/XS6M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712761941; c=relaxed/simple;
	bh=+MCZNG+9+LLgH0OJEKK9U3AUL2h4Y3TMInN0K5mXFq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=brrsDKjYdRG6zAyo3TgDrojiFjI18u8tGWojjZ4OKxY0S8m59/thLrIKOw04LJVIGQ5/Bk3W9PJf0fXOdQcoORijn7eFAgFa+3RprY8JghsrgpFSR+R8yPDVNFjst9wIgEL0RG2jqK+JFMElkKqVihjNQThaGK6Rl28UyYju+D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TCV0QBJg; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TCV0QBJg"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1e4f341330fso5932075ad.0
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Apr 2024 08:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712761938; x=1713366738; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mtyD6tkEhUPZyvX91xGGz4dEOCMghtm6UOvqSZja01A=;
        b=TCV0QBJgwWzIZ8bacuxKSDoABTsP/67cmdUKxe5UZr5UPDY2ZJqFEhscQtGWlnctsx
         MXC86yCaEixFl/oxfLlEek4iDPduf9g8yEMizWUN0JK4kGI9DsiljSBmyMfwoIf9go4C
         MHCvJlaPHneah5RqDDPJY9KgjC3VhK3fyDkgYuCkh1k44cTfL7eSO8E7XE5G+VnnFID9
         KFX7hPETFc9dxPmlXnWGoqoXgHhuC8OXRw4jtwCCN1yURHGdKJRBdQUxDqyTjYvL+B+C
         gApV5c0rEr5Th09mxvlvgM2DTyPiYzKYUzWhI0EDaIIl7n0NrlIc8uGVINA6YjhZKxtJ
         DtVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712761938; x=1713366738;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mtyD6tkEhUPZyvX91xGGz4dEOCMghtm6UOvqSZja01A=;
        b=Z0I0UJDCStCmndleUlDSUmjGzN0mxwEcDYZ8UxBrclAEFj7wQ0d5vzTz5rUeaSi3w0
         ul2pThKyihje7m1EvfTNe0zCdzSlS8T5d687kLOTKGhhvUpnv9KknDrBrVGnoPxJPgkM
         uZkmKaetCRacZ8/f+g6CcU0+GkMFvTmYK6xVvQVhJ/GrA56AQcAmrXAccyJ73QtZSqRr
         lAYjMODp7C3bhVgHnsVOYSAsoicfgYT4n8gCGce2mcvI5O7/P7DPSsrN2KFPUqNn8Yss
         YVEVXwvA7uorekt0fNKzyXgcjioGVg7A7GjnSJGSEcXMlZNnY3+RqLxSfKqRDLG/xaf1
         esIw==
X-Forwarded-Encrypted: i=1; AJvYcCXab6S4xEefl2U5+cJ3uxWQIapYRHpZpRw1ZI1KwsvZdr6lfAWice55o8KrvoT+TYqEfCoco7BQbtsQ2Lki7T0/TfqSh8m2mdtmcG8=
X-Gm-Message-State: AOJu0YxA2nFKEKLofd/FOM6JWJl+0cgWFd6aL5pKZ7aM1zhZECSYdXpC
	POgw3oF/DeJRpo8o8Bb51eOom1ewHxGxRS6oXZGIe3VLPHTe0GqV
X-Google-Smtp-Source: AGHT+IFWy4t+iq+6RxZYY4JsEOB7/ll4BMZ1iOw5bHL31toJu0TMrZSMiBykSH0rLrlP+l2+iosX8g==
X-Received: by 2002:a17:902:6805:b0:1e2:307f:d283 with SMTP id h5-20020a170902680500b001e2307fd283mr2666104plk.1.1712761938403;
        Wed, 10 Apr 2024 08:12:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d15-20020a170902654f00b001e0bae4490fsm11026705pln.154.2024.04.10.08.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 08:12:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 10 Apr 2024 08:12:16 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Frank Crawford <frank@crawford.emu.id.au>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v1 2/4] hwmon (it87): Do not enter configuration mode for
 some chip types
Message-ID: <a6eb2a95-d9a9-42f0-a50d-3034c694d977@roeck-us.net>
References: <20240401025620.205068-1-frank@crawford.emu.id.au>
 <20240401025620.205068-3-frank@crawford.emu.id.au>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240401025620.205068-3-frank@crawford.emu.id.au>

On Mon, Apr 01, 2024 at 01:56:04PM +1100, Frank Crawford wrote:
> Update the configuration mode entry code to allow conditional entry, and
> apply to all calls.
> 

This is just as wrong as the previous patch. Any such option
would have to be board specific, not chip specific.

Guenter

> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
> ---
>  drivers/hwmon/it87.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index 6eeba3a01e3c..396c2d3afbf7 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -117,7 +117,7 @@ static inline void superio_select(int ioreg, int ldn)
>  	outb(ldn, ioreg + 1);
>  }
>  
> -static inline int superio_enter(int ioreg)
> +static inline int superio_enter(int ioreg, bool noentry)
>  {
>  	/*
>  	 * Try to reserve ioreg and ioreg + 1 for exclusive access.
> @@ -125,7 +125,8 @@ static inline int superio_enter(int ioreg)
>  	if (!request_muxed_region(ioreg, 2, DRVNAME))
>  		return -EBUSY;
>  
> -	__superio_enter(ioreg);
> +	if (!noentry)
> +		__superio_enter(ioreg);
>  	return 0;
>  }
>  
> @@ -742,7 +743,7 @@ static int smbus_disable(struct it87_data *data)
>  	int err;
>  
>  	if (data->smbus_bitmap) {
> -		err = superio_enter(data->sioaddr);
> +		err = superio_enter(data->sioaddr, has_conf_biosopen(data));
>  		if (err)
>  			return err;
>  		superio_select(data->sioaddr, PME);
> @@ -758,7 +759,7 @@ static int smbus_enable(struct it87_data *data)
>  	int err;
>  
>  	if (data->smbus_bitmap) {
> -		err = superio_enter(data->sioaddr);
> +		err = superio_enter(data->sioaddr, has_conf_biosopen(data));
>  		if (err)
>  			return err;
>  
> @@ -2674,7 +2675,7 @@ static int __init it87_find(int sioaddr, unsigned short *address,
>  	u16 chip_type;
>  	const struct it87_devices *config = NULL;
>  
> -	err = superio_enter(sioaddr);
> +	err = superio_enter(sioaddr, false);
>  	if (err)
>  		return err;
>  
> @@ -3520,7 +3521,7 @@ static void it87_resume_sio(struct platform_device *pdev)
>  	if (!data->need_in7_reroute)
>  		return;
>  
> -	err = superio_enter(data->sioaddr);
> +	err = superio_enter(data->sioaddr, has_conf_biosopen(data));
>  	if (err) {
>  		dev_warn(&pdev->dev,
>  			 "Unable to enter Super I/O to reroute in7 (%d)",
