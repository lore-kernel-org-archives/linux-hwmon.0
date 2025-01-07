Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121AA18A6B5;
	Tue,  7 Jan 2025 17:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736270696; cv=none; b=qYluczFPnqhhiKNti4WH2xOI2H0YOJ+QCSZLSUp+XOsMtV/55A9SvrRfSS5MbI0m70GvQ0hRMsq6pTjf4cumS8uuc/B0UUoCovLjLZjCV9o74Q5NS22bGNOAydgxIiHTcVmt5Lc9LhesPazvhJSkdUSKF3eeVwVeIjQVpLt5JUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736270696; c=relaxed/simple;
	bh=/Lhk3/zW57oyZuxzhk77ZSLqNihqx1lGbkDsIotFUO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KsGpAE1wxF4mOP0vLJLWcE89NXdD56oWuNx+1+JeF0+sStoh9dle7Ulz9Gq7NMGePBQP7OWjVncc4tR4CV7M14zJPT6xW55AC3nPljIeOtO5hZkqhEhaNgZg54MT7rI0wl82McfD9nsymTk1ivGrvtFMVPCITTbHZI3qp/iNVl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MsnsI3F+; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MsnsI3F+"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2163bd70069so41489085ad.0;
        Tue, 07 Jan 2025 09:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736270692; x=1736875492; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F/GOQ1rELjD2TTdLJMjJzFwPKALoURfuN3LaADbhDHU=;
        b=MsnsI3F+qXXy0Kj1jSxmGZUydhV/0xBJoy7twMPLFnwf6BmmrlBdygx8kE03jOIbVq
         0fWggZxiugBpX0TUtkGKZ7bTJkuvF7yqjDixNWWWD84hYDwRscdg0j2fCRpPEVh9C727
         SkTZ/R+SSevor6DUUnJC545RWz3Mcl6t7IpXUgUor3AhCRC6cHN+V/rHW3j8GfvRxudp
         ctkJpoQKsri4LP6N8lWIIwhqX0OuC4FWm6rphb+IuoPH5fWCpL3UaZ2QfIb3aNyz4Vf9
         k3hJxRhAps4X5jYn/MIiV2iELv4/WUjsGTwkciLcrEDt3uxhixImSEcSOSLsQ1G10f2K
         nkWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736270692; x=1736875492;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F/GOQ1rELjD2TTdLJMjJzFwPKALoURfuN3LaADbhDHU=;
        b=drpa3gxhhFwMzIx+ngiY2HP08ZUFHLP9+xkc+tva/j6XYAyrWyc5+RQ4XPHJAndpr+
         6X3xSJhEZMM/TKmcw3XcFQvbmBEPtUUooQbJMa5E4v4UxBn1qOt1NQohEADLdxHnDKwt
         2aixiza9ox2CqnSDZxWiv95haN2wVNPx68I0j5xQ/l41BL4yVspQ6oPciul5egPuX0YV
         pWucorUPk94E7vpoIjr7FRvszAb1hBvq+sQyfExGmPwfEecHWeYsyCkcZZFSVXboDUga
         IJqcgcjSiP6pOV9sJIJ7x5C1+fJ3niNmEEbLK/xuQOdaTa8jZ2HrAGGPx1QErlOfMR29
         pdlA==
X-Forwarded-Encrypted: i=1; AJvYcCUWnZD7gI0XSnC9n5sc514xSai5oaEXxqRKc9Utxam5ycHYVLL0Qi5kV+6kbE4EFlScj5u8wj+N7gW+eQ==@vger.kernel.org, AJvYcCWn1QlKlHf3Ey1vbFj6t5bpOUiqbHkZQgOqXcsgCOnyWPu+ffHefU5ZJAiPvBU3mvFjSaqMRG3PrtmLdKVM@vger.kernel.org
X-Gm-Message-State: AOJu0YxxITBv7wavqWfhW8G8RptX6SwxzHzTDJ8XC9exNtR1IwplzQh8
	ex2+JeDpZqDNs4GCjZvJ4BOKEOE2Iq5HPBvdSs6BeMTLrqi4Fdqt
X-Gm-Gg: ASbGnct8tzYBbF9Z22hU7uwb9LHoaus8Tc56GJvEnpF+UhYLRpapIr4w1WjO0ET5Lbe
	8QqPExaSlGgjpyTD9VBpiSqMdrttkWvLRWkzDhcukkKG6iibj4zpPo8VJje4q8mxLj7crqyEMKM
	ReRXQSDseeBvT+s6C/osVmPrMSjcDip/8oSDNtbVVJA4eK9oW2WM3eFdqMx1f8jlqLbh+0s2vXb
	VjfbYPeugqrmkQxmEOoitvthaHplCy+Z0fV3yZ42V+bViFMNDBTL242+wmPThU4Gsut/Q==
X-Google-Smtp-Source: AGHT+IE1AIfa3SZlOPLum72urJeLb+aYRvKjQn6x5PSsES4mVBCS+/Sqcm97+2iqat76K/p+O+NynQ==
X-Received: by 2002:a05:6a21:9985:b0:1e1:b183:2243 with SMTP id adf61e73a8af0-1e5e08432ecmr99161660637.39.1736270692329;
        Tue, 07 Jan 2025 09:24:52 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad830adasm33541715b3a.44.2025.01.07.09.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 09:24:51 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 7 Jan 2025 09:24:50 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: Derek John Clark <derekjohn.clark@gmail.com>,
	=?iso-8859-1?Q?Joaqu=EDn_Ignacio_Aramend=EDa?= <samsagax@gmail.com>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] hwmon: (oxp-sensors) Fix wording in code comment
Message-ID: <eaca7150-a259-40a7-8faa-b4ad7897f375@roeck-us.net>
References: <cover.1735232354.git.tjakobi@math.uni-bielefeld.de>
 <858c2a5b712eebdf2fc7c9c6e3a2d2f832a68dfc.1735232354.git.tjakobi@math.uni-bielefeld.de>
 <51006199-1de4-4bda-b579-181e19bd66e4@roeck-us.net>
 <7284955a-fadf-497c-a7e4-6c261c84d32a@math.uni-bielefeld.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7284955a-fadf-497c-a7e4-6c261c84d32a@math.uni-bielefeld.de>

On Thu, Dec 26, 2024 at 11:56:12PM +0100, Tobias Jakobi wrote:
> 
> On 12/26/24 21:52, Guenter Roeck wrote:
> > On Thu, Dec 26, 2024 at 06:00:18PM +0100, tjakobi@math.uni-bielefeld.de wrote:
> > > From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> > > 
> > > Despite what the current comment says, the register is used
> > > both for reading and writing the PWM value.
> > > 
> > > Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
> > > ---
> > >   drivers/hwmon/oxp-sensors.c | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/hwmon/oxp-sensors.c b/drivers/hwmon/oxp-sensors.c
> > > index fbd1463d1494..8089349fa508 100644
> > > --- a/drivers/hwmon/oxp-sensors.c
> > > +++ b/drivers/hwmon/oxp-sensors.c
> > > @@ -46,14 +46,14 @@ static bool unlock_global_acpi_lock(void)
> > >   #define OXP_SENSOR_FAN_REG             0x76 /* Fan reading is 2 registers long */
> > >   #define OXP_2_SENSOR_FAN_REG           0x58 /* Fan reading is 2 registers long */
> > >   #define OXP_SENSOR_PWM_ENABLE_REG      0x4A /* PWM enable is 1 register long */
> > > -#define OXP_SENSOR_PWM_REG             0x4B /* PWM reading is 1 register long */
> > > +#define OXP_SENSOR_PWM_REG             0x4B /* PWM control is 1 register long */
> > 
> > I think that, if anything, this is more confusing than before.
> > "control" is, for example, enabling or disabling pwm management,
> > setting automatic or manual mode, or setting the pwm polarity.
> > Together ith the next two defines, "control" would suggest that
> > PWM_MODE_AUTO and PWM_MODE_MANUAL are set through that register -
> > which is not the case. "value" maybe, but "control" is just wrong.
> Noted. What do you think about "target" then?
> 
> My main point here was that reading implies that this register is read-only.
> Which it clearly isn't. And the documentation (which could be certainly be
> improved in general) should reflect that.
> 

"reading and writing the PWM value". "target" implies writing. "register"
implies neither, so you could use that.

Guenter
