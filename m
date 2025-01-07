Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CBC17B50A;
	Tue,  7 Jan 2025 17:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736271193; cv=none; b=HBkn40aYnDMzEU8sVmgSXQ8k4bWUa7n+7iDFQTwUDLSwgIN4g2EpxK5NmOPZTV/zQBbvKrJDav+BNpPxSyB1upinMFCiMwHzegHKAb1D8Td8paFImkZcPKdq6ppEPjAttLCkBJ0wzK4roqt+hm3cbUNkACGKewMrJFIWzoAJMDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736271193; c=relaxed/simple;
	bh=Uu4aS35RsXsuPU4mJhtVB+V+uLetK1CT6NpczWC5pro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZ3Jh6VYawCJc3f+KYP7XvHuNLt2bfYyBHBwUsZKDMmszRWOn7vsjyxBnkMdLYfkEeYeaUqmD9prMqFJa6EYw0QkM3NytC4bAIhxhWkoRc4NOGoGPsVu8/d3ZqVqfuswoOxbUTn8GVJb8HrjT5HkCZo9jaar78IuP6if+zyow2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXApRiKI; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXApRiKI"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21675fd60feso38753485ad.2;
        Tue, 07 Jan 2025 09:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736271190; x=1736875990; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hD16GrJFxL9Tk/XxIn9ycC4BVzZ+hiuK0rsNa+VYoGE=;
        b=eXApRiKI8kKaz+XhESGzp/jFqcBm2eIy1L/fn33zGpST/MJc2cOI+P7yl4DfzB5pWy
         grdT8no6+cOeKvpfoKyuCpcf/P8B2Igli7b6N1z3QIbL9l0MhJhrAnYg5C22WDT+VqX2
         kt3bzHMIvLCIZI5IwGEUtRfdx6IxVN/R5eSOGR79pZBvFoTXw1ySUj9ahXSs+y6VI3+7
         cJClAxB4ZyB3RvIyPMSlnUbXdEEeIOBJBLY/zJbw0iE4kpzCVSgYky10nN37MRBvriKi
         T7/bX6CqCH3ft0EapwJSucW674pFJdupjpbn3t8LZbOupu7h4VZPNiywfUEOvDxs+k1x
         6Xjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736271190; x=1736875990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hD16GrJFxL9Tk/XxIn9ycC4BVzZ+hiuK0rsNa+VYoGE=;
        b=WJaRTqy3Vye0wWLBw2bU1vBixfcb4XHdOfh3H3wKapRg2E+O2y0lnn532cxmW7KQMo
         9msPvgEAbBMdvVH1nA0Js8hLJ0Ap3Nv+nD6roVZ/spn3lJyg3s9zHy099KCGnXu++y5c
         s2sq8qKvD0G3sqY4vcns3o+u55+Dgvum3jZy4LbcvCs3FXz81i4XifjdWCgwb+2qcsa/
         w/Qn8ocm9sQ9VJjKaJeJCQH3GVBGJMFyxtb25o5RAAJJuMcl86pvLXyT1h04csGbAR0x
         lv8Sf6UMie+eh38GTr+my48l7K+sOn8nlNe01Q0Bb8Fq69yuI+l11EA1m8c9BGxM+Dlm
         UlEg==
X-Forwarded-Encrypted: i=1; AJvYcCWmV7lnmUruRG8ZRuwihAKnqVkt1Fw78hA3THMZIegB6mEEfqNOfB7cnF8XpoVwCLXN9H0ZdfMVGHem8N+8@vger.kernel.org, AJvYcCXSYTcNkfeU78bY6sNIUqw1dbW3C8uzL2c2IdfETCtPLsXjPDCJvq5AfNnCI0bu0xwGAy+zUqrUIkyNfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXxMXCgTUY3E7fetlEckM2TRn63wLSSWnna+hsfRG7bvDDFpOT
	WRjhR8214UzJyLvGWYrIuKo5ZoVrTo1YrI3ixN1YviONwWSEfy8j
X-Gm-Gg: ASbGnctGrQH6nKocddDDaDXphxOGeX4q9jkvWPFXTQK55X2b9ozU9WIlxCympml3OxH
	5+DkGRncjRZT0j8dloBGmVK0lbYXpIr8a1YfF7Vs7DfsSjijlNpGeM6VbySfAtsPw/JrBM3sWye
	G/g7PzjONdn56FPqjkESafhdNetKqSQoZKbll39nSYFulfbAf/3hiBCRQ3sCdJkl7HJdzwQxFEz
	UnDvnl6hhi6bxmlHo+4+DOccowff6e+diopf2BjLgvo2wfCvkm5hEO1hKjBu9EhBNvZBg==
X-Google-Smtp-Source: AGHT+IEo9On794DedOcgCKiRRke3HBv44JvO6xZ8Gz65Y6Fl6+2UR+QHL6dy1S2/DofjAKwEYzM1ZA==
X-Received: by 2002:a17:902:ea11:b0:216:4016:5aea with SMTP id d9443c01a7336-219e6ebaf1amr935108645ad.29.1736271189768;
        Tue, 07 Jan 2025 09:33:09 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca01924sm313297205ad.246.2025.01.07.09.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 09:33:09 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 7 Jan 2025 09:33:08 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: Derek John Clark <derekjohn.clark@gmail.com>,
	=?iso-8859-1?Q?Joaqu=EDn_Ignacio_Aramend=EDa?= <samsagax@gmail.com>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] hwmon: (oxp-sensors) Separate logic from
 device-specific data
Message-ID: <be6d995e-e1b5-4201-804e-ebedf05839e2@roeck-us.net>
References: <cover.1735232354.git.tjakobi@math.uni-bielefeld.de>
 <daa7571b0731e203b5a86e484da8083fd034601e.1735232354.git.tjakobi@math.uni-bielefeld.de>
 <90a41ea2-9a83-4245-88c7-b8dd97f5aabf@roeck-us.net>
 <080bad40-6676-4369-9601-d2d200ae3ea2@math.uni-bielefeld.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <080bad40-6676-4369-9601-d2d200ae3ea2@math.uni-bielefeld.de>

On Thu, Dec 26, 2024 at 11:59:53PM +0100, Tobias Jakobi wrote:
> On 12/26/24 21:54, Guenter Roeck wrote:
> > On Thu, Dec 26, 2024 at 06:00:16PM +0100, tjakobi@math.uni-bielefeld.de wrote:
> > > From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> > > 
> > > We currently have large switch-statements in all functions that
> > > write to EC registers, even though the bulk of the supported
> > > devices functions more or less the same.
> > > 
> > > Factor the device-specific data out into a struct oxp_config. This
> > > only leaves logic in the corresponding functions and should make
> > > adding future devices much easier and less error-prone.
> > > 
> > > Also introduce struct oxp_data which is going to be used in a
> > > later commit to cache device state.
> > > 
> > > Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> > > ---
> > >   drivers/hwmon/oxp-sensors.c | 517 +++++++++++++++---------------------
> > >   1 file changed, 215 insertions(+), 302 deletions(-)
> > > 
> > ...
> > > +
> > >   static const struct dmi_system_id dmi_table[] = {
> > >   	{
> > >   		.matches = {
> > >   			DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
> > >   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A1 AR07"),
> > >   		},
> > > -		.driver_data = (void *)aok_zoe_a1,
> > > +		.driver_data = (void *)&config_aok_zoe,
> > 
> > I have not looked at hte rest of the code, but the whole point of
> > void * is that a tyoe cast to or from it is not necessary.
> > 
> > Guenter
> I'm also not happy with the cast. But it's either the cast or a warning,
> that the const qualifier is lost.

Your code is introducing that const qualifier.

> 
> I'm open to suggestions here. But I don't think that leaving warnings around
> is a good idea.

Overriding a const qualifier isn't really a good idea either.

You could have used an array such as

static const struct oxp_config config_oxp[] = {
	[aok_zoe_a1] = {
		...
	},
	...
};

If multiple devices, such as aok_zoe_a1 and aya_neo_2, really don't need separate
feature flags, the unnecessary ones are just confusing and should be removed.

Thanks,
Guenter
