Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF6815252E
	for <linux-hwmon@vger.kernel.org>; Tue, 23 Jul 2024 14:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721744667; cv=none; b=lhGnbOcE5krb/RQFP/PhwRSX6pXJz6nO2ef3XWOfouzG14b6RPK+/SuYpTH5Z5TErXpnS6jYycUsdK4gog/iqRJtm2VvRIEs4AqPz6EZ2UGOtVWMpZ+oWqUpOhxxXtKZOmVXg+r1RK3p+lDaqr8OPi12QXW5H/2JYkL3xVKqrGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721744667; c=relaxed/simple;
	bh=J5lICBvT3WOBFECYSlSMAQ8EhHKj7OiXOgRo7YjO0iE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fasEulvj6d6/3Jw9AuMcoNYAElG/7//OuhuY0IOiQhgWYvexY4TbMNP9LFH2/bXQ9rE40C3cjltuyBWLkSQ9Li4c4GJAxsmbJr53rxsJ26nl2aBGr91M/GbSwMFL9bvQEqRvZro6f6hr+4kk+LiJK/QMUHkpFiryrMVvwxUqdCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g6JWgr2o; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g6JWgr2o"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2cd48ad7f0dso1675581a91.0
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Jul 2024 07:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721744665; x=1722349465; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=laDa5giXzV9GsxAXlUFyrVDZq53TmGpEjtolRYTuW2Y=;
        b=g6JWgr2oqN9/9p7SNDY6g0/8i74heBhke/d/dP9DNNlJjIqBuIGA0C0j6yD7RSMMQb
         Q/bIq5jGBgtNlnYyuRYFGzseWNBxkIZ/Bnm1eJgdweMq37T+7g/Q+3IoercIHkz1In36
         /nIMhB+uDZborrS62tUFx0pQALgbnGuLC0960IN5VBTtwFImlmHz05z4b3QkWhMyXtqx
         Z7PkmSbvBc9DFJK7vbbibkutHVWb4ItfpfVpiWcnzYxSQSTlyDCr0m1ldvVuTVt2Z5bV
         mbUlzgitHEMrVvKnsF3s3WWju1z5An3LiyBb5Hk/NXwxwagU7XZ5UYofXMpiftQevqZk
         CZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721744665; x=1722349465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=laDa5giXzV9GsxAXlUFyrVDZq53TmGpEjtolRYTuW2Y=;
        b=YLJGaCTH8nehKde6cFCL6Z6mqckyGAcU/DWiUCLN/TryKqckST2SHQjiHpMB7p/MGc
         lmzSjLZXNQJLyQTR9g3hWXecQ1xBImV2p56jhqSe8OVOwxE+PUO/66UQhpAJHSL4aVDX
         Ylwj5VsgyLL8GnEW2RU3CUOebAGztwwGPEu+AwP/2svhMocwRNclwodAdYEIo3zW0uGP
         UIS7WwtzGylrYYnteiub6cKFz3V7YtsMamw5oiG3fSsS2W7M6ztIugWKRB6T+Ax1Zaq3
         Rxh/3KW/vrz3tBTprAjEMb3n1NkUc6aCc0FZgfUO6o2IoFoEF8P0RR/sNWQznzYYfSur
         jKmQ==
X-Gm-Message-State: AOJu0YwIESQXNjGPK21hTegsEAbXvMXw0ZWP2xh/ck0p1JNDob8Zsc90
	F/+D3alj3qPMaHH32dG2ZXa0/46rYqzfT4w2zEgwYn6rV0n6pF5U
X-Google-Smtp-Source: AGHT+IEoPr9kri5J9aobTq0lI1h0HJ01cwtlj78c9Oow7AVHYme/gPFHCZ5dQDQf/w+6h9Ykxg/WqQ==
X-Received: by 2002:a17:90a:df13:b0:2cd:40ef:4763 with SMTP id 98e67ed59e1d1-2cd40ef47bamr7287652a91.15.1721744664714;
        Tue, 23 Jul 2024 07:24:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ccf7b58882sm9245824a91.16.2024.07.23.07.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 07:24:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 23 Jul 2024 07:24:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 3/6] hwmon: (max6697) Use bit operations where possible
Message-ID: <7f4cd736-ba6a-4f04-af3e-e313ef4ac7ab@roeck-us.net>
References: <20240723005204.1356501-1-linux@roeck-us.net>
 <20240723005204.1356501-4-linux@roeck-us.net>
 <Zp9BlV3Hw00QNccD@google.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zp9BlV3Hw00QNccD@google.com>

On Tue, Jul 23, 2024 at 05:37:25AM +0000, Tzung-Bi Shih wrote:
> On Mon, Jul 22, 2024 at 05:52:01PM -0700, Guenter Roeck wrote:
> > @@ -32,20 +34,31 @@ static const u8 MAX6697_REG_CRIT[] = {
> >  			0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x27 };
> >  
> >  /*
> > - * Map device tree / platform data register bit map to chip bit map.
> > + * Map device tree / internal register bit map to chip bit map.
> >   * Applies to alert register and over-temperature register.
> >   */
> > +
> > +#define MAX6697_EXTERNAL_MASK_DT	GENMASK(7, 1)
> > +#define MAX6697_LOCAL_MASK_DT		BIT(0)
> > +#define MAX6697_EXTERNAL_MASK_CHIP	GENMASK(6, 0)
> > +#define MAX6697_LOCAL_MASK_CHIP		BIT(7)
> > +
> > +/* alert - local channel is in bit 6 */
> >  #define MAX6697_ALERT_MAP_BITS(reg)	((((reg) & 0x7e) >> 1) | \
> >  				 (((reg) & 0x01) << 6) | ((reg) & 0x80))
> > -#define MAX6697_OVERT_MAP_BITS(reg) (((reg) >> 1) | (((reg) & 0x01) << 7))
> > +
> > +/* over-temperature - local channel is in bit 7 */
> > +#define MAX6697_OVERT_MAP_BITS(reg)	\
> > +	(FIELD_PREP(MAX6697_EXTERNAL_MASK_CHIP, FIELD_GET(MAX6697_EXTERNAL_MASK_DT, reg)) | \
> > +	 FIELD_PREP(MAX6697_LOCAL_MASK_CHIP, FIELD_GET(MAX6697_LOCAL_MASK_DT, reg)))
> 
> How about:
> #define MAX6697_OVERT_MAP_BITS(reg)	\
>     (FIELD_GET(MAX6697_EXTERNAL_MASK_DT, reg) | \
>      FIELD_PREP(MAX6697_LOCAL_MASK_CHIP, reg))
> 

I don't think that works because FIELD_PREP validates that reg does not
have bits set outside the mask. Either case, I prefer to keep the more
complex version, though, because it is more complete. The generated code
should hopefully be the same.

Thanks,
Guenter
