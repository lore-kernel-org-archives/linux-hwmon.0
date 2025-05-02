Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0D01D515A
	for <linux-hwmon@vger.kernel.org>; Fri,  2 May 2025 05:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746164137; cv=none; b=VKOvWG8tbsHnt6Wh5PqVc+d7wvoJ+Lr4v+kGDoyFloBUMzwhStCg25Dgmy8OEz+WPTgzwaah329htHIDpvu/H1tBczRzAvUYk0nL4pg+mmVEuZdsI/WeDbK6HILeN+5qKYYS/FgnoN+0Po2exS/2X72N8sZiv3XOpI2qHPBNpDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746164137; c=relaxed/simple;
	bh=2fKNAd0m/28SZvQm9wt/n28vAWZEcdn9JNM6XgU03NM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R50KQAdsJg1ybBnRKfU9leFzYkIzfPbX7bedAEpBmm81UvohOTzBSbYWkQOQzQHclOo3mylr8ilMiTpH1b0vhj1qK3Fq/v53Xu8WFHNZcKqMNtsvfCm5A8bmHfi8xMRWtOx7H88IsSgAm8MDm4NoZyBCRucBkx9pS29cqbde5+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QFuhHOub; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QFuhHOub"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b1f7f239b31so2331919a12.0
        for <linux-hwmon@vger.kernel.org>; Thu, 01 May 2025 22:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746164135; x=1746768935; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tz4yf40mtzEV4/YpTdm2/hirFctImt4in0cV4OGFkho=;
        b=QFuhHOub+uwLfAC3BKlmHncsmy0oQtKELmvLbyfZaWeHFKyJjPd0Wkli/YKuFx8uS2
         yAu3qZuMi/Mso6mNTL2slj6Xzw5s06kacWNDUuQoOf0PSGS4Bmkl3xBqoXoejbawMLOf
         b2pWR81sg1qcVqhrwKOxCh0luopqOlTt7Zjzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746164135; x=1746768935;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tz4yf40mtzEV4/YpTdm2/hirFctImt4in0cV4OGFkho=;
        b=ZGtrpTxWokUwdKZ2PdeUeIpZxOcEFgjE9DqT65n0uBxM4SuLi7jKgF5y26yx3p2fvm
         5BpSesfVthuTzLjKeWBd0QWdlo8s+4e6VM12ohhVJvXEk0hQeWF0xLjHuEaovfm4tyeI
         tFkzJVn7spYef6Q034vHMJbflRTaLGd+g72Murgfo5PASnFC0TQ8vOTIihyO2l42AQct
         rzVeb3AT7VMt/sYM1b2myDT0FR+kRoofYQ4MxJOiNXrPNxpl8v/gT/8TDUBCMz5ohE1M
         1/i+pEz74+zusrxMe3RQNandpCDdfl4kz62EClj+LOOGx8dTeM1HnOi3ocPrJ0FycUbi
         kmWA==
X-Forwarded-Encrypted: i=1; AJvYcCXGuaWWG84/itpklDlIX/U94cjIE8VVVfaD2AKbu2lHhqAmMOGLR/zooAXPSksQbgeMgEd/CBze/TicUw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7HC7aTRG7HQ8CiN/ttyCW1W29Yd2SoOYMbfOSVRMFqQfsac2V
	OCzolmPJ2Kw5fqolkkggRfxQc1f+EB65TSIVBFeZaIr//5uZcnWDk+iMI+vHMYw5XUOF3NBwi0o
	=
X-Gm-Gg: ASbGncv6MgwrfZgZKRBoq+H1rcJ9qeESv3oUYHMRJ5gURn/yTX7WEigePACgvzWXwCL
	TYUT2jBzqIuWDq4P99pdxvYcMTQfFYE0n+b6DruEGOk9/j+Fh7gR8G0DAm+zORz3CF28jWLO9Q8
	Uu1N2DWPfc3bGwWSUvnfitK0fBakcK4kLlYHIRqpOX2C2jU2znXonmVmCvONdPkySvH3FSHzCLE
	BUawnpXD/wxIbgUMuSBD6f68rNZN0GlqOJ9DNw+C8R7nFp1buKzZHX42YgX1t5d1w1MXoKmEwWG
	3Qe36VPM5geTBNTHUZpOROxt9YK6jaCuyA==
X-Google-Smtp-Source: AGHT+IF7WZbxLedaOYtnoAo4B+GdGFwceB1cOYhZurL9ySD5fBpkCR2CSB9s+2yvylGfqu1unwieKA==
X-Received: by 2002:a17:903:1c5:b0:223:5187:a886 with SMTP id d9443c01a7336-22e100b754fmr26447245ad.22.1746164134693;
        Thu, 01 May 2025 22:35:34 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:e66e:6e73:436b:6b0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e108fb8ebsm5785905ad.118.2025.05.01.22.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 22:35:34 -0700 (PDT)
Date: Fri, 2 May 2025 13:35:30 +0800
From: Sung-Chi Li <lschyi@chromium.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/3] hwmon: (cros_ec) register fans into thermal
 framework cooling devices
Message-ID: <4x3ouuawdtee3cbj7wwad5aazgfsjo2vbzsib5oxbmjcmny4re@kiseb26pciyj>
References: <20250429-cros_ec_fan-v1-0-a8d9e3efbb1a@chromium.org>
 <20250429-cros_ec_fan-v1-3-a8d9e3efbb1a@chromium.org>
 <ec2f7e54-0582-475d-af91-42d9be65cd3e@t-8ch.de>
 <aBGCB6_4XR4Z-vFI@google.com>
 <2518c6a3-6524-48b3-8e64-8990a61cc608@t-8ch.de>
 <63b2d985-92d4-40dd-b2b2-ab55796abc52@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <63b2d985-92d4-40dd-b2b2-ab55796abc52@roeck-us.net>

On Wed, Apr 30, 2025 at 08:38:06AM -0700, Guenter Roeck wrote:
> On 4/30/25 07:36, Thomas Weißschuh wrote:
> > On 2025-04-30 09:51:03+0800, Sung-Chi Li wrote:
> > > On Tue, Apr 29, 2025 at 10:45:56PM +0200, Thomas Weißschuh wrote:
> > > > On 2025-04-29 16:14:23+0800, Sung-Chi Li via B4 Relay wrote:
> > > > > From: Sung-Chi Li <lschyi@chromium.org>
> > > > > 
> > > > > Register fans connected under EC as thermal cooling devices as well, so
> > > > > these fans can then work with the thermal framework.
> > > > > 
> > > > > During the driver probing phase, we will also try to register each fan
> > > > > as a thermal cooling device based on previous probe result (whether the
> > > > > there are fans connected on that channel, and whether EC supports fan
> > > > > control). The basic get max state, get current state, and set current
> > > > > state methods are then implemented as well.
> > > > 
> > > > There is also HWMON_C_REGISTER_TZ, however it depends on OF.
> > > > But this patch looks very generic, so maybe it makes sense to implement
> > > > it in the hwmon core.
> > > > 
> > > 
> > > Hi, the HWMON_C_REGISTER_TZ is for registering a thermal sensor, and here I
> > > registered it as thermal cooling devices, so they are different. I followed
> > > other hwmon drivers:
> > > 
> > >    - gpio-fan.c
> > >    - aspeed-pwm-tacho.c
> > >    - max6650.c
> > >    - qnap-mcu-hwmon.c
> > >    - ...
> > 
> > Indeed, sorry.
> > 
> > > . These hwmon drivers also manually registered other cooling devices, and that
> > > makes sense to me, so I think it is good to just register cooling devices rather
> > > than make big changes to hwmon core.
> > 
> > The implementation does look like a lot of boilerplate.
> > If Guenter doesn't chime in, let's stick with the current approach.
> > 
> 
> Someone could make the necessary improvements to the hwmon core and clean up the drivers
> implementing that boilerplate today, but that should be a separate patch series, and this
> series should not depend on it.
> 
> Patches welcome ...
> 
> Thanks,
> Guenter
> 

Thank you, I will first complete this series, and see how to improve hwmon core
afterwards.
