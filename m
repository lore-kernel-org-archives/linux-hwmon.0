Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7BC390CB9
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Jul 2026 16:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783613505; cv=none; b=amlX/zeFsGkyIMuqXzbqNFnLj0x2ZHST6rK9NFbHIZJAgN02jXcJ+JAUWKr7aGkGs5hW5wUhMKx/tt7vXJmegiTKBT4ocPKT6s4Z1fssbBWRtznC9binD4YLXgXjcL4wkLwM2BVoJqT93uNAD4SMkz3gqgLBjZ1sT0Oj8Xrjb58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783613505; c=relaxed/simple;
	bh=yDLs2jV76L2eqJnYhRYER0JSZHFGBrzJGq5THI0r5hU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DsEy5/3OL4+OxnibQEhEsbLEtedFDf6f2J+NeiV7rxzzccKJiHn86RK8lyXc0yQHMcVBUEi7agBJCyDQUpIpktT5ENE/JJFYsh/8vS8DpoALfdMJRdIe4oW0dSe6LFCrZaZ4szTcB/x+O2+rRF5DYS5tAH2RFBb4fIYCLUQgLG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C6rKV/IO; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C6rKV/IO"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493c7902f47so16706215e9.1
        for <linux-hwmon@vger.kernel.org>; Thu, 09 Jul 2026 09:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783613503; x=1784218303; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=imNUUfLX6MYDa9RIX1yPiyl4F2oBksK4tqShI5uU2BA=;
        b=C6rKV/IOJyMuvCuC9BOcPB5iSSq/UDe8XDUd/h3tUA79wtwdGKUdXylUg+ysmhbvtI
         F/orUWy3ZQYbMTXQGsnpM1qPGk/f0Cppatkn6ciwQvMTs19GLUOZc6Y3t4WWRxxcxadB
         ECLcmcAuF3aCdUW/iftJqtBP64aSM1gZ1mzAd9Df2LpQhDN0lOttlO3oRuUxYC8z1evD
         T7aO6YjycyEstxuxg+POuiVW/HKEV2LnYoRaA28nVAIGPrqX/EFoVOiCPN9epDKyLrU2
         ozKiauHfdjZnpHhWW41oMg8yJSFypeSUAo1weQjQSw4cOM5/RjZsCVrRWdEJTWmFSe32
         HI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783613503; x=1784218303;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=imNUUfLX6MYDa9RIX1yPiyl4F2oBksK4tqShI5uU2BA=;
        b=O1cHkoAC4O2h+No/+4IUXKfr/udJOmhyjWqIVhvYx1SoP+2/+2h91UD5S9LD8taTLv
         vhRs3GRhbl6k3lKZ7y1QzZba3M6joYGnzw3Jx9xmhoqd00H2hlU3L6wrQRoJErZt8emO
         tfeksB/q3N4LwZzUrYoqeHqR/WFyepfy7mHKHz4s8TgbaYYMSCjdfa6oX6/wMziwa65V
         kbEpFKpVm0X4ieryW1250DLgbQWSOGj9HlGn6st+GnELyeu6vOGXm1Ivr64af2d+Bmo3
         nJQji3/l9KSH5KEHrKoDEwksv1tTW5dtRtyY4HKR+tlbeGRCZkHstp7k6T2UQ7zSRwUn
         ukAQ==
X-Forwarded-Encrypted: i=1; AHgh+RohtS1eSp9ZaZeGFNnoljcQ5MTUdD69FP0iuOEra7H0p/FjRu06hM1pTld04kT8+bi/5YIrmWn7f91kEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxC15PXReIFJJ7684twBwFDAGpzH5dqw/B8PnTF8RpbtbtMTtTr
	/I0/Dagfk8xIxPOmYiF5Ne0nUJD8rI1xl7PYv7mo0KqF8/jIuQ0CCx5V
X-Gm-Gg: AfdE7ckjp2aCcPpIlvb7qU6Jub0IX8m2IqOwE5GpFRjnfclxnKAOVjzmnQrVu+Bmnyj
	KSexdMmZqwDOQyVOqkwX8iTzAy9j+/6onqn71roQMJJJE4zvdhK52bJwv/9oRuhRJTpef0vSbd7
	cWZquRWtuXwMDB6sg+2msIDGqj4q7iFyTlLjfzUd0Gp5ACvx/kZiI6sSteFT2MuhYjx6odzO4hy
	WVD7H8AWccGKgG2r1wACqke13IAvQWzWId8KrWp2JIjOl9N5ZPxJooh7U1GDl8wT1A7LREyu7sc
	YDHeFaLFGYK5hRUkdjFKXaFVnYTBpTRs9fQ7qq+eYjEIxWf0rrjElQzmbBoOhg2vkE8NfO5AIPv
	XV95MpoAKEoQQR/tHC3CRjFLeBfI+MpXdCZftJLoUHD9aQlKbHOFdrDW0Uv82ejU1LTXyLJVwl2
	sjxhkgISR2HLTJYR4=
X-Received: by 2002:a05:600d:8496:20b0:493:f251:3e84 with SMTP id 5b1f17b1804b1-493f2513eccmr3414535e9.15.1783613502546;
        Thu, 09 Jul 2026 09:11:42 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6d4f9fsm69398775e9.4.2026.07.09.09.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 09:11:42 -0700 (PDT)
Date: Thu, 9 Jul 2026 17:12:47 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Fred Chen <fredchen.openbmc@gmail.com>, 
	"Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Wensheng Wang <wenswang@yeah.net>, Frank Li <Frank.Li@nxp.com>, 
	Brian Chiang <chiang.brian@inventec.com>, Cosmo Chou <chou.cosmo@gmail.com>, 
	Dixit Parmar <dixitparmar19@gmail.com>, Eddie James <eajames@linux.ibm.com>, 
	Antoni Pokusinski <apokusinski01@gmail.com>, Thorsten Blum <thorsten.blum@linux.dev>, 
	Ashish Yadav <ashish.yadav@infineon.com>, Syed Arif <arif.syed@hpe.com>, 
	ChiShih Tsai <tomtsai764@gmail.com>, Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
	"Paller, Kim Seer" <KimSeer.Paller@analog.com>, Colin Huang <u8813345@gmail.com>, 
	Yuxi Wang <Yuxi.Wang@monolithicpower.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 2/2] hwmon: (pmbus) Add driver for Analog Devices
 MAX20912 and MAX20916
Message-ID: <ak_HvKbH1QKrweqF@nsa>
References: <20260707122701.751878-3-fredchen.openbmc@gmail.com>
 <f9e32dd1-7c2c-4055-83fa-94683777e30b@roeck-us.net>
 <ak4QO9uhKOt68dl1@nsa>
 <20260708-true-carp-of-champagne-a0dcca@quoll>
 <ak41BRQBNdsQrYww@nsa>
 <b2a5e99c-6d4d-454e-8ecd-8638e4dc0ddb@roeck-us.net>
 <PH0PR03MB63512A19C32B7722D17D0FD4F1FE2@PH0PR03MB6351.namprd03.prod.outlook.com>
 <CABOy65_GqKiZLM+soZUK_34T8MYZS3dRX38-CMf_Bd1EmG0jhA@mail.gmail.com>
 <ak9gFKkfEgkU_q1G@nsa>
 <5b865eed-ae58-47fc-8d80-e14a76a93050@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5b865eed-ae58-47fc-8d80-e14a76a93050@roeck-us.net>

On Thu, Jul 09, 2026 at 08:54:09AM -0700, Guenter Roeck wrote:
> On Thu, Jul 09, 2026 at 09:54:22AM +0100, Nuno Sá wrote:
> > > 
> > > Based on the MAX20912/16 specs on my hand, these chips do not support
> > > PMBUS_PHASE (0x04). Furthermore, the spec only indicates support for VID mode
> > > and does not provide m/b/r. Therefore, some of the features you mentioned might
> > > be specific to the MAX20826 series.
> > 
> > I see, phases are not supported using standard PMBUS.
> > 
> 
> As mentioned in my other e-mail, it can still be supported by the driver.
> That is what the chip drivers are for, after all.

Ah and if it was not clear... The driver I have in hands do support
reading phases. In fact we need a patch in the pmbus header to increase
the max number of phases as, at least, max20826 supports up to 16 phases just in
one rail (or 8 + 8)

- Nuno Sá
> 
> > > 
> > > Regarding enabling VOUT via GPIO, our platform handles this via the CPLD as
> > > part of the hardware power sequencing. Managing this pin through the driver is
> > > not a requirement for our system.
> > 
> > But we cannot assume all systems will behave like the above. But now i
> > do wonder about controlling the GPIOs in the driver. In your system you
> > clearly did not need to do it. In mine (testing with a rpi) I had to
> > use a GPIO (well I could have used hogs or pinctrl). But if you control the pin
> > you do gain the ability to turn off the regulator. If you don't it's always on
> > (which might be indeed the bulk of the real usecases for these systems).
> > 
> Agreed. I don't really like it, but if the chip and some specific hardware
> mandate it, it should be supported. However, that code also needs to be
> tested - an untested implementation would be worse than no implementation.
> 
> Note to anyone from Analog listening: It is really unfortunate that I,
> as subsystem maintainer, do not have access to datasheets. That means I have
> to rely on assumptions and can not really provide actionable feedback other
> than guesswork based on the PMBus standard. That feedback may and likely
> will miss essential details.
> 
> Thanks,
> Guenter
