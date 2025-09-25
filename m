Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F233C2DC79C
	for <linux-hwmon@vger.kernel.org>; Thu, 25 Sep 2025 14:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758810860; cv=none; b=JEK4hHzXNpV+r4rxLsq1S5zUuqqxZ1pNKcjqUNQ0CdI1YmQM3MWgvJKwODPpyt0+1Od9mFEbTaCuXlS96hn7auMtZ2GX9ASbOL+t4mHD/FOYuJok8Kl9kUd74JiK88m4F6XjVK+cmjKV8qI3oJ+qve+F/joirOJfUWNCwYGqMrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758810860; c=relaxed/simple;
	bh=Bafperz37KGVRRgmYq3qAN2sQBrGyfvc4L8Phv7qEY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GP3uBoo0RCKJuasRNvS+6kN5JRE89En5Rot8xJiF2yB+NIG6G+owKVennRAttF6kB2plQz191O32SNBWFXq6/m6Ri5IuFbBWQB+mJj3Zy6R5KcaIb59TUEJoqxsj64/75f2RQodWCNxQyog/eSGOr3uu/hMh30Q+VF0qiXeB8QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lSPse5+T; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lSPse5+T"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-77c1814ca1dso856950b3a.2
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Sep 2025 07:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758810858; x=1759415658; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QQHQjEm6KdWL1vc6/aoJqmYvJIjnRA6W3fpAuarwDrE=;
        b=lSPse5+Tdllu8IB6RKd8mwCho7Jzr2BNMiQtn3ePa2U4wNaexa6er1AmeAek5g939W
         gyvB7vgWFzf7ZkHBT3x2DX9tveHGALynhCnRPPbi+xUh1kWySYwcbeeYhr5aEUNliHXq
         NAWc56rFraP/a6aV8yK2igbBU+ZI6q1fQPPyKg3iMdSxRpL0eRmq2Iu/xiERaSRmvDK+
         UBrvWpOWrUpYAIuCLjRIEfYDq/XQIFKwvUx5tugZqwvnvQdSG+ZM8ayCtIpkmD501oWZ
         rA+zUD7zyp/BKdxR0JsY+SJkYC3emI5S2BqeuXSDMAxLA2UM2MPHbU6A8nkQZjpzbxIC
         TMPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758810858; x=1759415658;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QQHQjEm6KdWL1vc6/aoJqmYvJIjnRA6W3fpAuarwDrE=;
        b=ti4OWyaRqWbQXq54jO/9iPA4iR7SFt0Rq8ODtVG+I9aj7n+gAX5L8PyGay7uZqnJlp
         iUbt+Hpqbse/3HqXWaOYmoDOfr8mSGde0vXyx74Jzgurx6WLOO3K5LkaFg5B/AFjEk0e
         qoiED/iUHIUd/Zcc/sWDI29Py0ldTqJ4cPe+X/+FgAyK4raFU5rQJRvlYqYsCMosWMOn
         UurcXoJi0+7R5MCCPBU6KvOSfila9JErT5GA/awI+kCR4Nq6slh0ycSkcAcZz1HfEbOX
         DW/bjzX8GxN4L9ULkNzhNLuH0nAUQAYWw6b1RYhOSikeTR5uuVllG9ofCAmJnb9vo+E7
         adJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUzPZCcKX71YVjvoxFL/8nbUF/QR/WXoIqwPiwCdQcvxMv8dJvgn6lRf/n/uFwYwofvOd1OH89YXGIGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXdmVNa6G/AlUG0aboUVl2lbJ08HD987Hpf9h/GG5xNjmcIsf2
	+Kf5QhkNvrqAWCjwCYIdLtFJjQCUbuXXSgfV3qXX3/oiP4xwuXht7nAq
X-Gm-Gg: ASbGncurA4E8RTTLEbJASTLXA0fBGXCdG6eYexc4QT6Olz7YcScLFxZZN2MEzoLGMgM
	hfoeCBb6Jmdzy3GZej09U6lAkCLbRe/yni3bNw2VlyaIdkMG/c2ESdZlso+AQbloeNtdV9fVM81
	nrolYATayQ1KW3In+84I8VZ4io314sTadUGPS6tUAKGsrCwhCFzxseMysPU954snVIWzYD05p+v
	KVAgbuMPaIUI0TwBfMVmJ7K1dAcAN4p+YoZrh0czYT/b/eyvUPzNn9Fq9fnam9vS6jgalCtTDMK
	bMiOu57ySoJVGt3dUTZa1jXsVVl9jig89A4Y2bwkdDSS5ggKe3OWLDPdcI5LjhiiMlQBeYqn0bx
	0vBrthPPJJ/9cLeH5WLpbE3J4gJnhoJcvbfw=
X-Google-Smtp-Source: AGHT+IHtHAEv8pJFUOuDFi9x9lY6fvRX5HRt2NaxDvCZUSfir5HznJYK8VHavo8T5HJ5S5KcaigutQ==
X-Received: by 2002:a05:6a00:14ce:b0:776:14f1:493d with SMTP id d2e1a72fcca58-780fcdf4cd9mr4319096b3a.2.1758810858249;
        Thu, 25 Sep 2025 07:34:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238e9a9sm2193140b3a.15.2025.09.25.07.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 07:34:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 25 Sep 2025 07:34:16 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Stanimir Varbanov <svarbanov@suse.de>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Rob Herring <robh@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Saenz Julienne <nsaenz@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 2/4] hwmon: adc: rp1: Add Raspberry Pi's RP1 ADC driver
Message-ID: <3f1295b0-b637-4fe0-b141-67f086960072@roeck-us.net>
References: <20250925000416.2408457-1-svarbanov@suse.de>
 <20250925000416.2408457-3-svarbanov@suse.de>
 <d07158fc-678e-4ae4-8943-168146a58fe0@roeck-us.net>
 <e53865df-7566-4790-9214-0af875950742@gmx.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e53865df-7566-4790-9214-0af875950742@gmx.net>

On Thu, Sep 25, 2025 at 07:26:10AM +0200, Stefan Wahren wrote:
> Hi Guenter,
> 
> Am 25.09.25 um 04:42 schrieb Guenter Roeck:
> > On Thu, Sep 25, 2025 at 03:04:14AM +0300, Stanimir Varbanov wrote:
> > > A five-input successive-approximation analogue-to-digital converter
> > > with 12-bit (effective number of 9.5 bits) resolution at 500kSPS.
> > > The ADC has four external inputs and one internal temperature sensor.
> > > 
> > > Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> > > Signed-off-by: Jonathan Bell <jonathan@raspberrypi.com>
> > > Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> > I just realized that there is already a hwmon driver for
> > Rasperri Pi - drivers/hwmon/raspberrypi-hwmon.c.
> > 
> > Please add this code to that driver.
> could you please explain the reason for this?
> 
> Yes, both drivers are for Raspberry Pi boards, but they don't share any code
> base. The raspberrypi-hwmon uses a mailbox interfaces to get the sensor data
> and works for the board generation 1 - 4. This driver works completely
> differently ( MMIO ), doesn't depend on the mailbox interface and applies
> only for board generation 5. Actually I don't see a benefit of merging them.
> 
Ok. Please make sure to add this explanation to the patch description.

Guenter
