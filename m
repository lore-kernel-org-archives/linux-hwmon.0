Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A21B30EF6B
	for <linux-hwmon@vger.kernel.org>; Thu, 23 Oct 2025 12:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761224123; cv=none; b=rAMHlc8HSAPCKFimxa40883ytuZzITKnG+dyE2Mua0zQsmqN/+RN9/ce9QtQSKdxGgZ59dMskWmJQLIvNEDUaDDGro9NZi+kpIXxM9+cMfd+A2ksiDviUL2+9vg04kDFDZ6UV5lmfj3s1gP2EFWdOORKKZtKAjcHvlJwetcPbM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761224123; c=relaxed/simple;
	bh=EVTagyqNhFiyLAemMH3mmpGfmO5zCC1M2qik2CwJLjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PAy4XbOI+IVp9mz9hBVK3g9g7CuoHA7EpQ2D6SWvcNmi5iOGKMKZXG1S+Zy2UsRYempcTCozQrBOdjQSBC2bcZn5fAduS71LquDiU0J1j4+51uxfwHGpdF6WvffWGN9AcZQxYqEPhMCSpoNiijvX49GErVGn18Qp4cf4Tsjr4wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FTauvhe9; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FTauvhe9"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-28a5b8b12a1so7967375ad.0
        for <linux-hwmon@vger.kernel.org>; Thu, 23 Oct 2025 05:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761224121; x=1761828921; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ASWAVqY9k9riShYHA9c4yv4PgU9rmPYL0SfM1V+LeDk=;
        b=FTauvhe9smUzHYpq4Nwe61mw8U6tzuKkXTfvrlU3WZETxGZju3Z5MFtStM033edCdR
         69vOSdI7BQl4mUYSrJ0r/O7SxM5NPgmpv+N1h/7N1D3FyhOmBnMqiAS1mDNG38mxUcl8
         5hg6GTrLJir19Hez7XQsQqr0n0Ir2J5R7XPK9IpPf7I70F9cdKIDAXdAXGRpWWoT9MSm
         4zihRsq61gJlMhebJccTGdZxRp2LIctSyuv4d7HtFyOJs6gOyMOJfzCJY+lsKET5qV+I
         s/FfuQdK4drkjIvzKuE8tA3XAJ/8RSm68zSrkf5KSk3tPVuWHGKjxUh2TJmzYMAdLqR5
         3n+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761224121; x=1761828921;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ASWAVqY9k9riShYHA9c4yv4PgU9rmPYL0SfM1V+LeDk=;
        b=OrnW/zOGeFkF86OlMfW5UER63jvF+k9N9EpbZ30nKWwnj7Cg8l4jOf/wAZdyREq7T0
         IL9O7hRcECObLxYD1EwILnEsBV+y5gfLbdfB8t5yztnBXuq01suztJ8yUlDxeWd54ur4
         +qu9DSPQaPPNz5gGNDDdxq84eGftR8YptKwCCT2ijGD81mP0TYXQl7nGeIptcXwxJKa2
         uAgcFz05naUg23SjuCUJCzigMniVAmaDkUBWmvEkfFw1Nt8M6WhSpV+eDatfkZDiXLuk
         9iYFQCcRWvovvu/A6yklnkEV8ToIny/4vziyLXlhPj5ZEgWwCb6CItBSq36jQ8gyJpzp
         Ychg==
X-Forwarded-Encrypted: i=1; AJvYcCUqaaau0+9h98VaZlBI9dsmcfCuD9zkLRKX3giYCcn2yjCQCmxfXb0MLrD1NMMNVFN7wS1Zv4680W+1nA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVS0wWtrgE49ujU8qAt/PxvxJXIE6YLmS2+K3mYrz7O6OFsQK6
	A4YCSWFU3+z0IlRGK5I1FgXzDUrbHj+c/ujBe7db9CI9r0vNZsn1JODr
X-Gm-Gg: ASbGnct1FX7G6fgXgUh/iIkFrS5xxuT/3xqxFq+K2xvFKOXIMJ34DZZYg6IihGdHHh1
	iHNTyqxX7+AmkWnC7lQtSAz6E1sTT0eZuP8KhL9k5M1b7cWHvGP6z4u6qV680ZuG3fUSmsUQTUf
	JqF3MRV8JGt2Nzscghnv/K34K54BZeSN+Uhfwbcz636CW06zfuBnGwKo4x7LBv7rtO5IsxZ7GU0
	J2D3qxwG20X5h2JAJA5Ysd4HCjHaDwqTMGSvfg/tVt+Uoha8nqkJ/Kt5rxVoVDSYyRKObMIlx55
	J0Ojxx5wtZJQbISoRYkNmUOwct7c6kvLL2sz2LS8ecnmR474Gn94Ppc3MhrN/GKc2TbLmE32f8S
	np5CANcVfTRbXu7jcSbYXZiPxdPLLAVWiniBnVEVoF/uCuBHxuPTk6lGgww/LxeF489ovPF0y3B
	bmPqfIAO08/RTQ/g+zuQE6Kk3P/gtO8PAtRA==
X-Google-Smtp-Source: AGHT+IFlM93HSaK/NP7A35B/3WN3MTp6LhxIIWar04bWFUVpNF5QQd4VVvlw7hDSQJ2i5iOtzexD4A==
X-Received: by 2002:a17:902:db11:b0:240:48f4:40f7 with SMTP id d9443c01a7336-290cba4efc9mr373999375ad.39.1761224120623;
        Thu, 23 Oct 2025 05:55:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4c053absm2044988a12.14.2025.10.23.05.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 05:55:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 23 Oct 2025 05:55:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Igor Reznichenko <igor@reznichenko.net>
Cc: conor+dt@kernel.org, corbet@lwn.net, david.hunter.linux@gmail.com,
	devicetree@vger.kernel.org, krzk+dt@kernel.org,
	linux-doc@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, robh@kernel.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH 1/5] drivers/hwmon: Add TSC1641 I2C power monitor driver
Message-ID: <cea96330-5d7a-4fdc-8fc6-0067769a0b2c@roeck-us.net>
References: <be691214-bac6-43d4-be62-daa57c833fe7@roeck-us.net>
 <20251023075050.254998-1-igor@reznichenko.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023075050.254998-1-igor@reznichenko.net>

On Thu, Oct 23, 2025 at 12:50:50AM -0700, Igor Reznichenko wrote:
> Guenter,
> Thanks for the detailed feedback. I will address it.
> 
> > Please send a register dump.
> 
> Here's register dump after init during run: 
> 
> tsc1641 1-0040: 0x00: 0x003f
> tsc1641 1-0040: 0x01: 0x0253
> tsc1641 1-0040: 0x02: 0x0dc0
> tsc1641 1-0040: 0x03: 0x0053
> tsc1641 1-0040: 0x04: 0x0250
> tsc1641 1-0040: 0x05: 0x0033
> tsc1641 1-0040: 0x06: 0x0000
> tsc1641 1-0040: 0x07: 0x0000
> tsc1641 1-0040: 0x08: 0x01f4
> tsc1641 1-0040: 0x09: 0x0000
> tsc1641 1-0040: 0x0a: 0x0000
> tsc1641 1-0040: 0x0b: 0x0000
> tsc1641 1-0040: 0x0c: 0x0000
> tsc1641 1-0040: 0x0d: 0x0000
> tsc1641 1-0040: 0x0e: 0x0000
> tsc1641 1-0040: 0xfe: 0x0006
> tsc1641 1-0040: 0xff: 0x1000
> 
Great, thanks a lot!

> > > +
> > > +	/*
> > > +	 * Disable alert mask first, then write the value and enable alert mask
> > Why ? 
> 
> The idea was to prevent potential previous alert from propagating when changing 
> the value, plus to only enable alert when crit/lcrit value is non-zero. 
> But given your response below this is not the right thing to do.
> 
> > Disabling alerts if the limit is 0 is wrong: The limit can be set
> > to 0 on purpose. Only unmasking the limit if a limit is set is just as wrong.
> > Either limits are enabled and reported, or they are disabled and the attributes
> > must not be generated. Mis-using the ABI to declare "If the limit value is
> > 0, mask the limit. Otherwise set the limit and unmask it" is unacceptable.
> 
> Thanks for clarification. So would you recommend then that all alerts should 
> be always on/unmasked for this chip or to add custom sysfs attributes to control 
> them, since it has this capability?
> 

Almost every chip has that capability. That does not warrant a custom sysfs
attribute. I'd suggest to just enable them all.

Guenter
