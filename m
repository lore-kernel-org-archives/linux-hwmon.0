Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C6A18DF64
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Jan 2025 19:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736450640; cv=none; b=l65DpVVWmNVstLtTSNiDGd5gqO8AYknJJLi64cNg8k4xiMnrkfEjOIyypSHVaJDHkvg5pP1BZEea1i5lAqWv+GPCfakZPyE2jC5HKCvnoQyXAZh9blDefAJ7vEPwudXYHYfylyQ6Vvzxn+vSTAieSEPh6wtOeeA0RjlEIzBxtxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736450640; c=relaxed/simple;
	bh=/wkcY+GvShGW8cYauzl4Ncm4Q0hNxkS0Aoqc9y2IOE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WplVUVsYLSkX8MHaNjNFZJo1QC2585Jor7u67+Ushrrg9XIfDZwdy66iwp2BvZVuys4c3bHOdhISTgxlpwtYpmfOwnb5WhPm+aw6l9ONpT7NT9IzT1CG+c8L7c9jGZipf+8JyicxE8xr6xk3/SX4PGUo2Fogm6nMAIM27RlHmdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Di7m9DQa; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Di7m9DQa"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2156e078563so18394815ad.2
        for <linux-hwmon@vger.kernel.org>; Thu, 09 Jan 2025 11:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736450638; x=1737055438; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bxb9p+3EkT038QlMSp7+IBMKJPNUziloZQmvYU3aM2U=;
        b=Di7m9DQa5PwK7QiiyZLrfw1Yrtvs3ZisqG76NCzeOimD+RZ8VXAKQmBM0tNAuwxsj7
         FxDqO76o/hLDrpWgLlu3HkU+zvzmzxel3VB46EweBkiUfFz5iEMU3yxlpMjXBFIXaqBo
         2AbXi8bcGjEieiDWwvUNo1Q0IYWPIyg5J/OgDdpseBcicJOLHJdTu164remx3fqXmGbf
         M7181iYlmj9sbEgLtOeExCLpkLm6zRaA67tZGhspncqR40Gb6qzAntLZWQxCMuMPn/c/
         lKjrUKxP5SkArdgOdOjW8XmugdWJ34Rbg7Wg7UV9LjwN4HyI9VHbaJA5un8kqmEurCDu
         fv8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736450638; x=1737055438;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bxb9p+3EkT038QlMSp7+IBMKJPNUziloZQmvYU3aM2U=;
        b=VYTFVPPfYFuhC4cmazUKI6whLfYVtF3sN5mRM2PuK69EiXLCu+uyo20TZR/dbWT895
         VWmhSdtdhM+6acPoZeHqEQLg2LbJ3dO0Lb8iI53mWSs3xWLcEfWFYgnjBlQ2Jy2QF5F8
         FC87lZw78SSZi1WR5hZrmoqN1qXzejQ6X4XuXP9gI1t0Rr3saSmmU7C3wIrkdVsqTQM4
         Bsdb7AOdDkZQnRTqVWHS4audRaF50tGI3TMfXcDGuh7S0IDGtnHLd1joS/vV7CCzCoeV
         xT26Smybp+LUQHEDuzGtG4aUtce5prYz9elYMY1jn08wEdqrMub35t/+/sIsXcnC69L0
         jZ4Q==
X-Forwarded-Encrypted: i=1; AJvYcCW62zzPF+s6n5IFVejeADlrlo4ZkFF6BHQ87+Y8akDmGlCYvlr4GObNOEd25chuKUugRtMB3dvpdVPbbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5vVB/Ky+WE3lmsusEL7WqUXwP166TJKJDXhrUXFwOS1DdcLTb
	/DTS3oZBZJVIqLN0gx2GqcGZIeIkXq/rWVyOqeH5+Jz4nuAd9qRV
X-Gm-Gg: ASbGnctN0Cqwn7c5vaD0QuadbsBUptr0YmdglvFxakrAm+dgAqWD36Ir994BaN6pi4T
	vtF/pvufHzsBHWCkrR2adwCSFdITNWyvalELMMAVZ++QAx6IkJ+U4GAhy/0saqjhjQ5bxvOqPRB
	kOBkOrDi0joEqHgaLNoP6+QIkGVpgrstj23pU1MhDmuvCar5jGtgmSHYemnMzdq3F8IWzMCZal9
	0eoMYxtcdBU5bvE6056AS2HUbjstqgDyxJ4C+N42Z/Z0Qt+jSeN7bv6CaHsZM6ABPy43Q==
X-Google-Smtp-Source: AGHT+IFs6v+fdpHypUMpxv6j2PZ/z5pE05dtHiuhIuPZP7dQulmTYx4isE1c5Ue5bgrSeZ7Zx9UR8Q==
X-Received: by 2002:a17:902:ce8c:b0:215:711d:d59 with SMTP id d9443c01a7336-21a83f33783mr103929115ad.2.1736450637600;
        Thu, 09 Jan 2025 11:23:57 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f21a032sm1379575ad.135.2025.01.09.11.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 11:23:56 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 9 Jan 2025 11:23:55 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH] hwmon: (core) Use device name as a fallback in
 devm_hwmon_device_register_with_info
Message-ID: <b6d7c70b-113d-413b-84a0-cfd24f33cdbd@roeck-us.net>
References: <1cb1c77b-177f-4b03-9fcc-9c892391e654@gmail.com>
 <51d9548f-3182-40b2-a832-b1c4afd117ad@roeck-us.net>
 <9a237886-ba5a-44b2-a607-e2677c17063e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a237886-ba5a-44b2-a607-e2677c17063e@gmail.com>

On Thu, Jan 09, 2025 at 07:24:32PM +0100, Heiner Kallweit wrote:
> On 09.01.2025 19:00, Guenter Roeck wrote:
> > On Thu, Jan 09, 2025 at 06:03:17PM +0100, Heiner Kallweit wrote:
> >> A number of network PHY drivers use the following code:
> >>
> >> name = devm_hwmon_sanitize_name(dev, dev_name(dev));
> >> if (IS_ERR(name))
> >> 	return PTR_ERR(name);
> >> devm_hwmon_device_register_with_info(dev, name, ..);
> >>
> >> Make this a generic fallback option and use the device name if no name
> >> is provided to devm_hwmon_device_register_with_info(). This would allow
> >> to simplify the affected drivers.
> >>
> >> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> >> ---
> >>  drivers/hwmon/hwmon.c | 5 +++++
> >>  1 file changed, 5 insertions(+)
> >>
> >> diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
> >> index 685d4ce8d..1fd3d94e1 100644
> >> --- a/drivers/hwmon/hwmon.c
> >> +++ b/drivers/hwmon/hwmon.c
> >> @@ -1170,6 +1170,11 @@ devm_hwmon_device_register_with_info(struct device *dev, const char *name,
> >>  	if (!dev)
> >>  		return ERR_PTR(-EINVAL);
> >>  
> >> +	if (!name)
> >> +		name = devm_hwmon_sanitize_name(dev, dev_name(dev));
> >> +	if (IS_ERR(name))
> >> +		return ERR_CAST(name);
> >> +
> > 
> > That introduces an undiscussed change: It handles an ERR_PTR()
> > passed as name parameter, not just NULL. Why would that be warranted ?
> > It may not look like much, but it introduces an inconsistency: Other
> > pointers (dev, chip) are not checked against ERR_PTR(). It is also not
> > immediately obvious to me why the driver would want to check if the
> > passed name is an ER_PTR().
> > 
> If a caller would pass an ERRPTR as name, we'd be in trouble in
> __hwmon_device_register(), when the following code is executed:
> if (name && (!strlen(name) || strpbrk(name, "-* \t\n")))
> 

Just like we are in trouble if the caller passes an ERR_PTR() as any
of the other pointer arguments. I see that as a bug in the calling code.

> By doing the IS_ERR() check outside the if(!name) clause we get
> a little bit more of argument checking for free, at least with
> no code overhead.
> 
> If that's not wanted I can also move the check into the
> if(!name) clause.

Please do.

Guenter
