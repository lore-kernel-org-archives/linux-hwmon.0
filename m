Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BDB20E6
	for <linux-hwmon@vger.kernel.org>; Fri,  8 Aug 2025 00:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754613209; cv=none; b=I/e/hL8fHFRctjSxj2U4CdnMqH7aDRf9KqhS5T8+BOmmhAHQKqZYPaDr/nPFrZTUrZ5N/tCUPvpKPMsn0baHX2gmACfF+gWnhDcEUwvk145KrsIVeJE23KWS7KkoIW4h5uFzEIy7fZqnhqphFRuLv4BWho2MpiXwFZX2/Q7ZoK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754613209; c=relaxed/simple;
	bh=ISzZLFX5pipQn66FkfsVwYyhb0ejn/fMGEdPQ+7SJb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aXiflZcbmXUBOO8mPSzJkW4Xe5UOatyiCBskJPsAybZW9Os6MHaIIs2xZhsRR/wcQ0e+OmDj7MomenvJALN6MgZ3itgzU0+d5G98QkI1SaoreMXmgokL2idz4iVQr00JOmjVW3iF0zUcAz9eURD7MFNJ5/rZZISZYL39yXomG84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iYuxY1qH; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iYuxY1qH"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6157c81ff9eso2430052a12.3
        for <linux-hwmon@vger.kernel.org>; Thu, 07 Aug 2025 17:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754613206; x=1755218006; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UgZOXxl0u4BK+TIBauBAunMIJ0liJ4HSDESproV9+2Q=;
        b=iYuxY1qH5PBHw/l5yveGX+yRnJmns2zjodXU3TCEwNc/TKBEcEt6ayT0TMhQRrnDCp
         D+ERjwvnDGHugGTE+z9WPYumi0PjxgzOzD56/NR7gRGBjLiZ89UOBITlrbLZe6zCWtKb
         fKxv6nNEyTOvrpsE+6PSB6xIMf8mFn16TZ/RZflvPZ4C2DTtL6rTXUV8SIPYawP++Tg3
         sqyERtQMqjZwySbNi8bQrlk/uKMKPJOqiD+9u5+rl0TpnND4hYcicrC/d2z/c1oV3Qmt
         R+ZDE95qnYoCPeSbKv+jw8a/IotOeS2j76/59qA2WVkVsyFoeAboupXFodtO3PFp6KcR
         o7CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754613206; x=1755218006;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UgZOXxl0u4BK+TIBauBAunMIJ0liJ4HSDESproV9+2Q=;
        b=AqCrQbj+DkqRigNvb+s6fKATkBWh/U20wO1w9XkAvHxdz7CqtK0NgNCit7OpiwVG8C
         xQLCcANpNiFkawlfYxptz2zypbqJfdjlv4NE/A0HIxaGJnTAs1NRx1KYScZH3c2GorZo
         NA0QFAKeIPHL6fOiGpJJy067ov3/1gzjUmTOn1ZnMTZpVcz3lOQN8Mcy9iUQDY2Igt3s
         5tGWlr4WBB0N+wECGnmEnwQ9sNAm9GNlZvhSk++QrtmEua1G1sjFaX6AwboE2Jgn6xE9
         ttqWXZHfbLvjc9sPq5cN4JcuGw3JwwgiWkw0Ne5eJZo4qEcWCyla0vtO9vSqXY5TinRt
         p67A==
X-Gm-Message-State: AOJu0YyF8/GHj3BBg+RavgT8JDtzATFvI8RP+uRkJzU7/FqtvgO41T3B
	8SP2Sq9I+rVOskrCsRWpAJUnRnPg6mliA7qRL0d8vumSfQgVuTfm+28cUCPIEcXEDlwy/yUtPe6
	zjTePBM54b/eKAU4kfH3gPbZENn11YQ==
X-Gm-Gg: ASbGnctI929B4p1PwSWq+J2d8CE1UmV9Ajk8/cUlq8y5DaRiwuHA4he4nGNTQExXRjr
	zy+9pBGLIVgc2qBxpGrFxTbx6Y/wehiUk2MQF3566uhUQcqIMVwKUapPhU9gsFufmw+8WoO9LNL
	O7jKgMCEJj2xDoPD/CYRHQ4jgdkug6Ij8nuAhQYjqS/m0WXmAfCY+0CENm637TdX5qE7R4XSrul
	MG4shOT
X-Google-Smtp-Source: AGHT+IFAS9oQbTJ7vEAMK6g/JAD2fNxfylNWOSbLe7LVy1GZ3MzY8abFgAZIppqJrJP9T01rRz3MFe6cd0T/fqm7xO4=
X-Received: by 2002:a05:6402:27d0:b0:617:e56f:3413 with SMTP id
 4fb4d7f45d1cf-617e56f370fmr421120a12.20.1754613205729; Thu, 07 Aug 2025
 17:33:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250807215037.1891666-1-gfuchedgi@gmail.com> <38d57e7d-bc13-4fd1-8eea-39581c4488c9@roeck-us.net>
In-Reply-To: <38d57e7d-bc13-4fd1-8eea-39581c4488c9@roeck-us.net>
From: Gregory Fuchedgi <gfuchedgi@gmail.com>
Date: Thu, 7 Aug 2025 17:32:48 -0700
X-Gm-Features: Ac12FXy4ZZurfTzZmTizwT3cvnj1pTFaryiLYqCknFOYKe6xzxD7OPGYN5qjOuY
Message-ID: <CAAcybut=yhWL5fSQGCHuiGHwfyappQonDfZX-H4vXaDHvC91YA@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (tps23861) add class restrictions and semi-auto
 mode support
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, robert.marko@sartura.hr, 
	luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"

> Bindings and driver changes need to be separate patches.
Thanks for the feedback! I'll wait for the complete review and start a
new patch series with the split and other fixes applied?
Would documentation change need to be a separate patch as well or
bundle it with bindings or the driver change?

> > +     const struct tps23861_data *data = input_data;
> > +     if (channel < TPS23861_NUM_PORTS && data->ports[channel].fully_disabled) {
> Why would it be necessary t check "channel < TPS23861_NUM_PORTS",
> and why would it make sense to declare attributes as valid if they
> are for a channel >= TPS23861_NUM_PORTS ?
That's because there's one extra hwmon voltage with index 4 in
addition to per-port voltages(indices 0-3).
So channel here can be equal to 4 for this special case and
data->ports check must be skipped.
See tps23861_info struct.

> > -     hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
> > +     tps23861_init_ports(client);
> > +
> > +     hwmon_dev = devm_hwmon_device_register_with_info(dev, dev->of_node->name,
> Changing the name of the device may impact existing userspace code. On top of that,
> this change makes devicetree support mandatory. I didn't check the rest of the code,
> but mandating that dev->of_node is not NULL is simply unacceptable.
My thinking here was that most device trees likely have tps23861 as
the node name anyway,
so this change would unlikely to have a userspace impact, at the same
time it would enable us to
provide more meaningful name via device tree for cases when several
tps23861 present and
userspace code wants to differentiate them.
I also thought that for the probe to run a device tree node must be present,
so of_node would always be available.
Do you think it would be acceptable to use of_node->name if it is
available and fall back to
client->name otherwise? Or should I revert this piece?
