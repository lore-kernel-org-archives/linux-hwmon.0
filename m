Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D342224FD
	for <linux-hwmon@vger.kernel.org>; Mon, 21 Jul 2025 01:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753062262; cv=none; b=lLro9l5P900zr+Vu6xl89IDwElO+gQ5mwLPSEYjnxOmnHYnKqfD5ZTXIuFtE/dJ1Gvk3gh52ioYvgVJhnzP/PK+AeAKySHqdORoRnDB01ssgjDS+/iIo+NeGiWPiW/UNr+brOXmEzH5p37K3tlfniiEpOsjP4XkGUNU122Ik3OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753062262; c=relaxed/simple;
	bh=L0Z9t9Wh/A4zDDhS1MGR1fwaP7pno+4uy6OTqGnwfSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dSqZbWsFk1JpyJ8ViEw1yLRhp703rfNtvtpOLj2pdxDcxrbkx33D9IoOrFfhChij6LmfBicSIMfzL3IDtpLmM/MQ4W2qQUsm6EdSIw62e7sDnupKDYqP2U7UfyNHg/RYnsdpKn343HdMghe3+pVcCwIHXG1MUjlcXEAJRV8pLLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UDIkX8q8; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UDIkX8q8"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-23c8a5053c2so34709815ad.1
        for <linux-hwmon@vger.kernel.org>; Sun, 20 Jul 2025 18:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753062260; x=1753667060; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tHBrdYq45/4WdF0whEY2tHmY6Z0msFU6dYk6tOWf77k=;
        b=UDIkX8q8yOmYyKQIfapdj1Uh8+eJP7VxIQPGXoiEYXpw/cBI3JlLBCpx2vw6+LVsWO
         mRpjFqcH5lmVguVxWJicDpg/TWo03L0F4bwyU0S3Mr0xAcwDHtBq4e6gsDuRLNbzmXlE
         I9tpYXyGnh+qmmquACC8Lyfl3X4M07VXg72Zk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753062260; x=1753667060;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tHBrdYq45/4WdF0whEY2tHmY6Z0msFU6dYk6tOWf77k=;
        b=uhDu9uPJrxiF7+KESxX+HR9KOdRzVVbNNF0508bUbZ1WDqD6kwTj4DTb6DtlNZAUZ3
         Fp61WRAeN6bHNsZxl/Vm9n8OIVNyTVMH5xiHozvT5bOizA3AgnJ7F3bQ4nUTmKJ9hbd7
         nv46+pTFwhWuIpunq3xlAFJ91fo/fjF6lQrylh7dYdsMDGEQozjBSvW0NaJsAyuwFvTS
         fk+Bzq1jM8flFhagFDNqeZpn2Y+Ht4Rqts7zV/p4jj+ZrYwv5y3khyxWKrrO8sWTyf2o
         5vG6b2KAgscx29uahoAkQL1O/UI2xNSN61B1VBIi9xMVFnnqtZQT6fXF8XwN2UNqe9QS
         ha8A==
X-Forwarded-Encrypted: i=1; AJvYcCVHmrmmeNMmrWbtt9ykJD9v2jvYYdz061e2UP2qq4igxiLcq04yth78boMUEo1lX9RnSICDGVcT+/KnbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpAR6j/UU4sP9twWL5GuYO12mc7t/18MfKshdIAcJObTbMdQ9p
	jJvNOEBsSDf9QMl5Qj7GLLA6xp1HPwrqgeR26XqAHMk7MDGDAG8vn9kcFz5CT0SXZA==
X-Gm-Gg: ASbGncspUK0diMKjrUP0QX1kC4w87ZOTcdSJslUzb48H5s3Gs6tQtVzURMQmddfLSkS
	/y0HBdW/hzMaHEn73OYHreGkyt9kGLxxT/Wt3mt2x37wPDA91TnIGz3Dr/wtWE2jmNU4AHVA4Ky
	iaY2JX5dWqTRj6qawjLhBSX6MxTDcR3SPXFwkVxXAW3X9SmPaLLXFTL+I+nUbb24pr6Zq43nEKI
	UgJfVck9V6OJv64af1eQuuZOBrGMxR4a222saFledSc/fe0zO/QSp2SkxJ01GzufgJxSxyFEIr9
	Bh61iqofYI4ip8DAvJnvrbAFrSgEYq3gy4oqk0UOixTRKWlDwk0v2Zr+DeN/n2nlY45XLv8Ydq/
	USsoJlDXAMdPceosS
X-Google-Smtp-Source: AGHT+IHHK3JkTcCKaUDYK0J7ie9NU72X6OylFLHnhOs1ylG4T57NGJcGpo7Az0XrymfkUHKXHfTIYA==
X-Received: by 2002:a17:903:2f06:b0:234:914b:3841 with SMTP id d9443c01a7336-23e24fe9429mr272868615ad.39.1753062260496;
        Sun, 20 Jul 2025 18:44:20 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:43c7:b6cd:7386:78ec])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6b48e5sm47188745ad.101.2025.07.20.18.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 18:44:20 -0700 (PDT)
Date: Mon, 21 Jul 2025 09:44:15 +0800
From: Sung-Chi Li <lschyi@chromium.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@weissschuh.net>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 1/2] hwmon: (cros_ec) add PWM control over fans
Message-ID: <aH2bbzDbpf3RMcMp@google.com>
References: <20250718-cros_ec_fan-v6-0-8df018396b56@chromium.org>
 <20250718-cros_ec_fan-v6-1-8df018396b56@chromium.org>
 <8869b525-c32d-4a8c-8e1c-b2718896dd2a@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8869b525-c32d-4a8c-8e1c-b2718896dd2a@roeck-us.net>

On Fri, Jul 18, 2025 at 09:45:29PM -0700, Guenter Roeck wrote:
> On Fri, Jul 18, 2025 at 03:08:29PM +0800, Sung-Chi Li wrote:
> > From: Sung-Chi Li <lschyi@chromium.org>
> > 
> > Newer EC firmware supports controlling fans through host commands, so
> > adding corresponding implementations for controlling these fans in the
> > driver for other kernel services and userspace to control them.
> > 
> > The driver will first probe the supported host command versions (get and
> > set of fan PWM values, get and set of fan control mode) to see if the
> > connected EC fulfills the requirements of controlling the fan, then
> > exposes corresponding sysfs nodes for userspace to control the fan with
> > corresponding read and write implementations.
> > As EC will automatically change the fan mode to auto when the device is
> > suspended, the power management hooks are added as well to keep the fan
> > control mode and fan PWM value consistent during suspend and resume. As
> > we need to access the hwmon device in the power management hook, update
> > the driver by storing the hwmon device in the driver data as well.
> > 
> > Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
> > Acked-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> > +
> ...
> 
> > +static int cros_ec_hwmon_read_pwm_enable(struct cros_ec_device *cros_ec, u8 index,
> > +					 u8 *control_method)
> > +{
> > +	struct ec_params_auto_fan_ctrl_v2 req = {
> 
> ec_params_auto_fan_ctrl_v2 isn't declared anywhere. Looks like some patch
> is missing, and I don't immediately see it. Dropping the series.
> 
> Guenter

Hi, these structs are defined in the patchset v5
(https://lore.kernel.org/lkml/20250620-cros_ec_fan-v5-1-5979ea1abb31@chromium.org/).

I removed it from v6 because it was applied before. Can you help pick that
patch? Thank you.
