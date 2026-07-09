Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EB242314E
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Jul 2026 15:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783612453; cv=none; b=Qvb2ve42Bisr+dXAzvwo6n06N8MmOJTNQO6BNOKarkdnqLwIUmdUYrCpv6M7Ztuv54GSXj7PE+tD1clRWkns5Ixa92qo6nx4vAd2wMLPRINXo/g7JDJfpTw8lqGo1ZJ5LpOIEScdADoBLYEYo42Z6ydBoD6EMV2zvht/p9r5fx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783612453; c=relaxed/simple;
	bh=E7xh6evd46JlapDcP1wu59TPdEBuTy/YptxJBkiz3T8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QqNgyeowOmjniI2qtEArbZApS102ZQvEYffOn5ZbPALRJyQNDynUqNA//d+CmXgfW0AttbDilIOSncVMjNI8H/c2ASnq6YmOTVLGz6WzhC1roMxFu+B2bQyqv5j1Y0/2TWO2umVSaGKwQWzA/4VCGp59eH1mZU4Szb8+YHiOojo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CAhydAe+; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CAhydAe+"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso20557535ad.2
        for <linux-hwmon@vger.kernel.org>; Thu, 09 Jul 2026 08:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783612451; x=1784217251; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iyiC5ezPowkdRB/jC99TZVbd/6jva1/e2ioHJ+vpJlU=;
        b=CAhydAe+OhkxBPdygMWMa98stHEw/YsRduHEum3lnZ9PBWL6Qfbuc/Ejfs7VGCi8oj
         ZuuessoqrKGRMWQSNnBMiBFJkRc08UOfASEIEWl+o3lDzF5qj6OdKecR1fP3mDwtJe8M
         29a/uqvBok7bYqahsDYPvFSjgh62w9n2I1tsVwMoci7cj7Mpcvi1XX4+3axOzFnkok80
         PEbjc/KFGoWagNG1O8Qjm28K57SwFUiJ42uotEG8A76sZOJ7STPEu2noJcwnEoEwWOcv
         3sION70qAfk+4vvN3mArxF7hMjX/x/mBdgdLDL5Dxnt1ZFPjbjvC3aESJo6a6JDgT6sy
         9m3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783612451; x=1784217251;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iyiC5ezPowkdRB/jC99TZVbd/6jva1/e2ioHJ+vpJlU=;
        b=ilK4FpHwB5gTKrIvqp8Jzv2rQNqdFJVLIJzad9EwlWWrAFrBvaKEC+FFKdpr2AcfYE
         rigux13mzIDzzMvtuQ6c5JocW8l+AlD0BcbzA7Ztuhm9mEyBlseX5PzY3aFplXEhrxbt
         RK/mvOgdrNOh6mmJKo9rwh5Ok2rWfmgmgUj5Up7/Ye7jHnTzEVFDE6sXcQNblVmumb+K
         jq3kW4QAdUeW92MDhQJeqbkFQe3GZe/nyNY9XtKm/bsD3G5tzwXWjXHIQu9Vios1Q7t6
         h+Mgt2igUAm6p9DFLpN0pOcHR1dHbQtJyyqd+qi8ZiXxXWLb8ksjKI+TqRMPs+JqtYqR
         CCUg==
X-Forwarded-Encrypted: i=1; AHgh+Rp5Q9lzLn7qqpKr1OscdX+K87+djd3a/YYXc97lBj8b8VJS3tf/u31WdaEMW2wKQfwLIypraR8BuXU8jQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9+BCCmjMi2OxScpJ4lNZra1PBMZcBHZpMXQs21FqqQEkuUZJB
	xajf4KEYm82mz3E2nTngxM/zzkfROaf/1GInoHVeDKCPTQ3LpNGfbdiA
X-Gm-Gg: AfdE7cmoq4bbjp5LqYcC374vPIBhw8XzOKCnmvUUFYAcWZRD/mnnqvph2BM7BO6350y
	4PifktntFGB1OAtxwbOfOQa4qZ+kpJ7fHU97iQgsbbmapWA6JbkOP4zC3rJFXMZY0t28PlmuRMW
	uhw8gKY6p59JMdescFyrEYRyOageQ/WFqd69Qk/4bWTIX4kz8esFpy/fVPy7ba10iBleCHKtA37
	SCE3dWqVct8Z9Yd9soVsB6JoNChDzEp79Jyiq93mKw6yr/UY2w1NxU0EeSwLYLg+MKQnu2SliUP
	2/5Z3XRBisOrqLyAWiuQGtgGxlO/2Umfv4NOzgeHSbZOvQ+OUJpizlPqRaJa1iYnyGtT/lrC5/r
	ro04QmH4w2kkP+gXtFeLbEAyoR30fT2dtA82TR8S7Ln9AjUnWEJovnmwmjU5Xxzu6/cfGhUKUlp
	PQ7UNbnoLIywVN/GQK9jVYtuEcXg==
X-Received: by 2002:a17:903:2990:b0:2cc:f4d4:29a7 with SMTP id d9443c01a7336-2ccf4d46bd1mr64154525ad.24.1783612451048;
        Thu, 09 Jul 2026 08:54:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1edb0sm46019575ad.53.2026.07.09.08.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 08:54:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 9 Jul 2026 08:54:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
Cc: Fred Chen <fredchen.openbmc@gmail.com>,
	"Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Wensheng Wang <wenswang@yeah.net>, Frank Li <Frank.Li@nxp.com>,
	Brian Chiang <chiang.brian@inventec.com>,
	Cosmo Chou <chou.cosmo@gmail.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Eddie James <eajames@linux.ibm.com>,
	Antoni Pokusinski <apokusinski01@gmail.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Syed Arif <arif.syed@hpe.com>, ChiShih Tsai <tomtsai764@gmail.com>,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>,
	"Paller, Kim Seer" <KimSeer.Paller@analog.com>,
	Colin Huang <u8813345@gmail.com>,
	Yuxi Wang <Yuxi.Wang@monolithicpower.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 2/2] hwmon: (pmbus) Add driver for Analog Devices
 MAX20912 and MAX20916
Message-ID: <5b865eed-ae58-47fc-8d80-e14a76a93050@roeck-us.net>
References: <20260707122701.751878-1-fredchen.openbmc@gmail.com>
 <20260707122701.751878-3-fredchen.openbmc@gmail.com>
 <f9e32dd1-7c2c-4055-83fa-94683777e30b@roeck-us.net>
 <ak4QO9uhKOt68dl1@nsa>
 <20260708-true-carp-of-champagne-a0dcca@quoll>
 <ak41BRQBNdsQrYww@nsa>
 <b2a5e99c-6d4d-454e-8ecd-8638e4dc0ddb@roeck-us.net>
 <PH0PR03MB63512A19C32B7722D17D0FD4F1FE2@PH0PR03MB6351.namprd03.prod.outlook.com>
 <CABOy65_GqKiZLM+soZUK_34T8MYZS3dRX38-CMf_Bd1EmG0jhA@mail.gmail.com>
 <ak9gFKkfEgkU_q1G@nsa>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ak9gFKkfEgkU_q1G@nsa>

On Thu, Jul 09, 2026 at 09:54:22AM +0100, Nuno Sá wrote:
> > 
> > Based on the MAX20912/16 specs on my hand, these chips do not support
> > PMBUS_PHASE (0x04). Furthermore, the spec only indicates support for VID mode
> > and does not provide m/b/r. Therefore, some of the features you mentioned might
> > be specific to the MAX20826 series.
> 
> I see, phases are not supported using standard PMBUS.
> 

As mentioned in my other e-mail, it can still be supported by the driver.
That is what the chip drivers are for, after all.

> > 
> > Regarding enabling VOUT via GPIO, our platform handles this via the CPLD as
> > part of the hardware power sequencing. Managing this pin through the driver is
> > not a requirement for our system.
> 
> But we cannot assume all systems will behave like the above. But now i
> do wonder about controlling the GPIOs in the driver. In your system you
> clearly did not need to do it. In mine (testing with a rpi) I had to
> use a GPIO (well I could have used hogs or pinctrl). But if you control the pin
> you do gain the ability to turn off the regulator. If you don't it's always on
> (which might be indeed the bulk of the real usecases for these systems).
> 
Agreed. I don't really like it, but if the chip and some specific hardware
mandate it, it should be supported. However, that code also needs to be
tested - an untested implementation would be worse than no implementation.

Note to anyone from Analog listening: It is really unfortunate that I,
as subsystem maintainer, do not have access to datasheets. That means I have
to rely on assumptions and can not really provide actionable feedback other
than guesswork based on the PMBus standard. That feedback may and likely
will miss essential details.

Thanks,
Guenter
