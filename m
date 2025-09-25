Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B339A2DC79E
	for <linux-hwmon@vger.kernel.org>; Thu, 25 Sep 2025 14:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758810747; cv=none; b=HXRl69soSvCSY8WKtJ2w15Us6VApw0y4XHedzFad2fq5I+WtF7kdDjkURTsVwAPSdE0/zH5/S5GDkYCpTHixwadU0d+mcd4qgoQE5jaTn73RSo+S1b9dyiNiwNhrMdKOkusfd9Wux2TUTV5TKtBhy0nWDm+ioVwe29CSFzUbcJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758810747; c=relaxed/simple;
	bh=a3eHXMsuFNWlqugS1mVxJZ5TpyBqt+o2aBCaTiA/Ha0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SBWD2JMkO9eX5QI0iC8vflnLI1mgP8ayZzgA2mQO37d2m7coQZTlnqhJ2C+Twy3iDwxQ1yEE+v9IDdXvCQdIK9jdPnhEch0BU23tP8Clt4SwFtt/9eboegAoOsbXZc0V+o6+cbzVSlWkJNYaXK7MFInp7HWXr/nWPvTmKPaUOJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IdT56ePb; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IdT56ePb"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2570bf6058aso15022465ad.0
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Sep 2025 07:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758810745; x=1759415545; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uNu4f91vx1JyBhQ6SCI1W3iAa/Ld0gsHPQbTIviSg64=;
        b=IdT56ePbNj2qhvnyd9ruau3B8XuTK2Xi/DR5PRwPbRL0c/8tt9c2gK2MFjep7VAAD3
         yn3TS4+CYUS3DCQktRAsV0vOm/Bthn8D2Cl61jmWtnVH7WSK2GfECxy0zyDD33MtEq79
         jYAtQ/Ivt9qtfcV1BPqSNcXeVoh5nL+dtE5uhabKSucjMPQSaacNn3mwwc4iMJ4HoPdE
         oFFTaANp/J7IuVvLy8v6X/y73VgxUFRCXPydlNBcnaRym3AvttqYFHoEw59s5NyHBFus
         BA5mNE01RwP29uLoORIya1JJaZETdwNEu9G37aYO/V5TtOUb9rc3lDoQ2bAKrlu5ldGo
         G/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758810745; x=1759415545;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uNu4f91vx1JyBhQ6SCI1W3iAa/Ld0gsHPQbTIviSg64=;
        b=Ogy1f5DLnQEYolCRWPs6Io5yMtRUAw2wstNjjWdRSjv4GZxzhftJbYM8VfJJqkLqex
         gZbcUw8VZPNifCcYXUQhYmOm1AHdtT2hkKBfZanjBOLPc/Aim4v0lhO9PMWbb+409fMv
         /6A4W2kwspbGQhenp7iRh4gkHHr9gfT7aGQf6k99WfnTAeoxmZV/mhvFGM810xXonA/t
         X16I52VPHBTyFm9pKv19NPi8KV7FwoJ4g9Y+NJaYEtXADmFUe1VStE9fat2ynVeH4sHm
         THIyzDs/4rTaj7Jsi+MGM040I1rMxCJE/W1AEqdXexr+0CvbSa9Xm78fiAlcKp0J3tpn
         7XKw==
X-Forwarded-Encrypted: i=1; AJvYcCXe28R9+P8Q8stbX6JHDIKIGadZpNJBcsMtgXMqgv+6u2sgzdKMSzDij5/mxDwFGaTuqgMlEZyR7ICj9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz508eLBZY1tSaSGMFod2Fx0clwYvgx5jMMW9+qoGsDPs6kj1go
	RVQJrxzH4+t6ROEG5AC+Gfm60ol2OVqaUkTOPl7KnEAhsX9JvsauZ+MZ
X-Gm-Gg: ASbGncspljgF7pwmal3Yk5z4cL/jCI5ID0G7nSVm92IjoMuPSarbQ4lt0VEJtn7cbXT
	bB0y4/SWowQSCEOCigjUj1ZgNa9Z05v0HHTpz+2oSjLwWkGBE0vgL947+6odH0eHnxRTQlp3lQB
	YdlM2DBi7v9Qrc9/nmHTIw0LqV7B1luFPDS/Hj3JwUOAR8O+iWvqZ5R+lVU3HIHlUCzycmZ3G0I
	QFqFPH47rpTlLThzI+NPQcyY5UmEvJKCZdgZFtL8MAHUdHR/+mj+uWAxnp+r4gHQMwgkfVONeUC
	ksv9EOGmrqz7YRW3kQ5/Sg8IBMRaxNuuIdcOZtx4KpWwKY4PT/JOAuadYfin8zVSz1uR+3qptys
	IOr44poxq8MKE7lFjLA0sClPYs5m+hVY8i5LVw1QkNBxbGg==
X-Google-Smtp-Source: AGHT+IEouWS18u5hzid+/58eqeK/Wz5H9vCOiw+suHDHfXTmYMG9kSe9BGY1UoAcE/k6e5ccR+b07w==
X-Received: by 2002:a17:902:e806:b0:267:e097:7a9c with SMTP id d9443c01a7336-27ed4a5ec6dmr34833405ad.53.1758810744759;
        Thu, 25 Sep 2025 07:32:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed68a0203sm26846475ad.100.2025.09.25.07.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 07:32:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 25 Sep 2025 07:32:22 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Marius.Cristea@microchip.com
Cc: jic23@kernel.org, dlechner@baylibre.com, linux-hwmon@vger.kernel.org,
	jdelvare@suse.com, nuno.sa@analog.com, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org,
	linux-kernel@vger.kernel.org, andy@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH 0/2] Add support for Microchip EMC1812
Message-ID: <36c4794d-2116-4d3e-8ad5-ac3ec764a7a1@roeck-us.net>
References: <20250917-iio-emc1812-v1-0-0b1f74cea7ab@microchip.com>
 <20250920123340.1b1d03be@jic23-huawei>
 <a97486df-9f15-4280-8cb3-d77f4cf223df@roeck-us.net>
 <e6ab5becf5908d83857fcfd57823ffd259e6db90.camel@microchip.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e6ab5becf5908d83857fcfd57823ffd259e6db90.camel@microchip.com>

On Thu, Sep 25, 2025 at 09:09:04AM +0000, Marius.Cristea@microchip.com wrote:
> Hi Guenter,
> 
> Thank you for the feedback.
> 
> On Tue, 2025-09-23 at 19:11 -0700, Guenter Roeck wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you
> > know the content is safe
> > 
> > On 9/20/25 04:33, Jonathan Cameron wrote:
> > > On Wed, 17 Sep 2025 15:21:56 +0300
> > > Marius Cristea <marius.cristea@microchip.com> wrote:
> > > 
> > > > This is the iio driver for EMC1812/13/14/15/33 multichannel Low-
> > > > Voltage
> > > > Remote Diode Sensor Family. The chips in the family have one
> > > > internal
> > > > and different numbers of external channels, ranging from 1
> > > > (EMC1812) to
> > > > 4 channels (EMC1815).
> > > > Reading diodes in anti-parallel connection is supported by
> > > > EMC1814, EMC1815
> > > > and EMC1833.
> > > > 
> > > > Current version of driver does not support interrupts, events and
> > > > data
> > > > buffering.
> > > Hi Marius,
> > > 
> > > For a temperature monitoring device like this, the opening question
> > > is
> > > always why not HWMON?
> > > 
> > > There are various reasons we have temp sensors in IIO but mostly
> > > they are not
> > > described as being monitors and this one is.
> > > 
> > > IIO may well be the right choice for this part, but good to lay out
> > > your
> > > reasoning and +CC the hwmon list and maintainers.  There is an
> > > emc1403
> > > driver already in hwmon, so perhaps compare and contrast with that.
> > > 
> > > I've +CC Jean, Guenter and list to save sending a v2 just to do
> > > that.
> > > 
> > 
> > At first glance it looks like the series is (mostly ?) register
> > compatible
> > to the chips supported by the emc1403 driver, so it should be
> > straightforward
> > to add support for the emc180x series to that driver.
> > 
> > Guenter
> 
> Most of the register address are compatible. The EMC181X is an update 
> (a newer generation) then the EMC1403.
> 
> The biggest improvement is that the EMC18XX has a continuous block of
> registers in order to improve the temperature reading (that means some
> addresses are overlapping with the older register maps) and a new set
> of registers to  handle the "Rate Of Change" functionality.
> Also the older EMC14XX has some hardcoded configuration/features based
> on the part number.
> 
> Considering all of the above I consider that the complexity of the
> EMC1403 will increase quite a lot without any real benefit and it will
> be harder to be maintained.
> 
Ok.

> I have submitted this as the fist iteration from a longer list of
> feature that I want to add to the driver, including events and maybe
> interrupts.
> 
> If nobody has anything against, I would like to add a separate driver
> for EMC18XX into the IIO.

IMO this should be a hwmon driver.

Guenter
