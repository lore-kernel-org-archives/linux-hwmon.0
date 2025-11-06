Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77EC2D24B3
	for <linux-hwmon@vger.kernel.org>; Thu,  6 Nov 2025 09:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762421595; cv=none; b=tZtOyiq/B+ZZkCkGfQcglpeTp9KxXx7Nt4w08o9+/1Z1+CCxIpAHClwfkYcSlEawW7Tf3EmKzghyyKFn4uz4aui3nf+qvSia9YKTb2oNYYXvSCUcgB0NiWw+ZKPDfKDTcRl+RNoTlwXnoY7ZfauONthEdkYFLAO1jySVP166+38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762421595; c=relaxed/simple;
	bh=64q5jybt4KaXmXe1xH+19KsbeJcZF0429vrAv+KpQ4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HhnlMf9vx4wXjM6R6D9xXfKC6dFU3//RJAPhIg2jR+A8CUncPxGkRhx0ulbAu1860RpRypXZkV7KT4VM/OhK1xPmC0t17xIxXOWBYV66rSV6LNlHQr+lui5b09Ti7FMWTssze7N5XcCn3tDN1l3qQN/r6pnxnGo/2OJYgon3wc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XT33OTu+; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XT33OTu+"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-63e393c4a8aso688845d50.2
        for <linux-hwmon@vger.kernel.org>; Thu, 06 Nov 2025 01:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762421593; x=1763026393; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=64q5jybt4KaXmXe1xH+19KsbeJcZF0429vrAv+KpQ4w=;
        b=XT33OTu+onFlGRz9FS5f6lJ5LMZ18M2EHe0iAKcg8UiOlnHEJ6JmdzbNo1dw4RmwL9
         sqohXK503ER+ISgeRyjLrL974tqCGpnWRyFCFtZkcBfe3hBt89yatfpSy3fCNJQJiYK+
         IwAbrBTs4koevD0xNGakbG6EZk87WZBZSG07JB5GpqPRfpJc30XM3v09J+tTjcn0Y+JA
         vTrjV91ol98qwKw/myLQw9gJ2MW0/UbbVzsixh1yyDs4N0ZnFAIihOpvjeEmbV/8zFiN
         G4JZEh9TDtywyv93SkhTrvq4jN9ssu0bKvsu8FIkbyD9XR0hZP+fn+pxFiLpmP6RfAxF
         Cfwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762421593; x=1763026393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=64q5jybt4KaXmXe1xH+19KsbeJcZF0429vrAv+KpQ4w=;
        b=mHYV8DfzlnTL82UVhDasVIM1qvh2Nbn/nmJ7IXkC01FfP4IfXz7fILlhbsxikBiqhH
         msozLHcoX9DKzqxQKtQ6OYkOyOwAPWQolHdfwTBVhtq6IfVwWzgeoPEjPGZ5IvUNY3LN
         +LqXMb9V98rLg9p+i31xzy0kUyTYKCAFDCjaO38ULPwKAq5vfGQnzCCvsQ3qK6RZstfA
         79Ggl1UVX5yjlP1WPFNIEIw0deeZXEnkuvEieCsyun4FabG5AMH2RTJQxoEQfbx/H/y4
         50+Gp46z0xTBLZ2Xlcr9/RPTu/yaCdl+1Nhht4xW7kau29IYR6ogez4IGwxgqJX9KYW4
         WRzA==
X-Forwarded-Encrypted: i=1; AJvYcCVWc4oDKG4qqjmyLplpFRe/ZJuBBzQtBNEEJ4K8b2ZFJIQMGsXVI117mQbySJ0l0jKJZ7JCNqz7GG5kcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSPe5gX7xokhM9mF/ExZKFP6sWZyn4ZOQaZl7Ug7CEtt1hon2h
	iidbiQMUSObLgSDbdTeuNYwwH7L4UOR0hGCYw1yhkoMJQrFJ1wionzUNa5N0u8IQ7S6KnTLVRok
	BYDwTF7acDKUbP+Avj9XufdjY7GPfNWk=
X-Gm-Gg: ASbGncun1gLn7TdVCzFPtY9+cDf8zFvFLFs+cSHVT3uBjST1d1UPgCZxhK5zY09XX2U
	Z/SxuQO/mjLqeVeYIvMe3yvFyFhp1uCUhn4jHwsN7SMWRup3ipCr18osdapd4+uhTajAKiJiboL
	4shTCIFtZH/hOSyJQ72x1XLRX6Ma99ffXbQPaJjCT43f4H9MoYBrX/LaKiwMYmkbfFX2uxYZLtI
	RIZw6GXALydErxyOceewiRCBt6u57P0pd+OlG6GtD1uYmVGS0VQmb4/YOqYq7CY3Jy6XN5y
X-Google-Smtp-Source: AGHT+IGjU/pSnzoRMIIWmPeTYTTkmJVZ18mO7dt3ps4vnqeCihQbTzl65FZVOe1Vtn3ir+mMCEBH8JGu/Q58C+AERwA=
X-Received: by 2002:a05:690e:2542:b0:63f:b9b3:9cb with SMTP id
 956f58d0204a3-63fd35745b5mr4818399d50.39.1762421592752; Thu, 06 Nov 2025
 01:33:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250926014552.1625950-1-jefflin994697@gmail.com> <f35193de-a106-42ec-b318-1501793fcfb9@roeck-us.net>
In-Reply-To: <f35193de-a106-42ec-b318-1501793fcfb9@roeck-us.net>
From: Jeff Lin <jefflin994697@gmail.com>
Date: Thu, 6 Nov 2025 17:33:01 +0800
X-Gm-Features: AWmQ_bkdydm5NQpF_MozFF5PAHQ1T8g5CqTKGa1LNT2Z7L7uaN-Ub_DMGQb54cE
Message-ID: <CAMdV+4f93oZ3jhxo+oZDCiK4tHO=gYqfiLAMoxuzMn9Wn24B3A@mail.gmail.com>
Subject: Re: [PATCH] drivers/hwmon/pmbus: Add support for raa229141 in isl68137
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, cedricjustine.encarnacion@analog.com, 
	ninad@linux.ibm.com, andriy.shevchenko@linux.intel.com, 
	johnerasmusmari.geronimo@analog.com, Mariel.Tinaco@analog.com, 
	jbrunet@baylibre.com, kimseer.paller@analog.com, leo.yang.sy0@gmail.com, 
	nuno.sa@analog.com, chiang.brian@inventec.com, gregkh@linuxfoundation.org, 
	grantpeltier93@gmail.com, peterz@infradead.org, william@wkennington.com, 
	krzysztof.kozlowski@linaro.org, tzungbi@kernel.org, thorsten.blum@linux.dev, 
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for the late reply.
On Fri, Sep 26, 2025 at 4:27=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 9/25/25 18:45, Jeff Lin wrote:
> > In chip RAA229141 there exist ISYS pin which can report the current dat=
a
> > for the device connected to this chip through this pin by routed by Dir=
ect
> > Memory Access(DMA) command. To read the data in ISYS pin, we have to se=
t
> > the DMA address to 0xC5 and then read the DMA data from 0xC7. And then =
use
> > the Direct read format with 10mA per LSB to transfer the data in 0xC7.
> > And for ISYS input pin, the DMA address is 0xE0D3 and for ISYS output p=
in,
> > the DMA address is 0xEE42.
> >
> > Signed-off-by: Jeff Lin <jefflin994697@gmail.com>
>
> As submitted this is a no-go, for several reasons.
>
> The description should describe what is done and why (i.e., here, describ=
e
> the added chip), not implementation details. Those are useful as comments
> in the code, not as patch description.
>
> Introducing a new sensor class is unacceptable. This is a current (I thin=
k),
> treat it as such.
>
> Changes in the core together with other changes are unacceptable.
>
> A new virtual command (or commands) would have to be discussed and be gen=
eric.
>
> A new Kconfig symbol when adding support for a new chip to an existing dr=
iver
> is unacceptable. Besides, the new Kconfig symbol would have no effect if
> the driver supporting the chip is not enabled, so this is not only unacce=
ptable
> but wrong.
>
> Regarding the code itself: Stick with existing coding style. Do not use C=
++ comments,
> declare variables at the beginning of code blocks.
Thank you for your advice. I will keep it in mind.
> I would suggest to add support for RAA229141 in one patch, then we can di=
scuss
> what ISYS_{IN,OUT} actually measures, how it differs from IIN/IOUT, if it=
 indeed
> requires new virtual commands and how those command might look like, or i=
f it
> can be handled by mapping a existing commands.
>
> The datasheet for RAA229141 is not public, so be prepared to provide a de=
tailed
> description.
For RAA229141, the controller can provide the fast input power monitor
SVID device
specified by the VR14 PSYS requirements. When using the VR14 PSYS
capability, connect
the ISYS signal to pin 44 or 45 and the VSYS signal to pin 45 or 46
(depending on
configuration).

Base on the standard version of the specification for this chip from
Renesas, we use
the config of taking pin44 as ISYS for input current sensing and pin45
as VSYS for
input voltage sensing.
For pin 44, ISYS is multifunction pin which sense the system input current.
For pin 45, VSYS is multifunction pin which sense either the voltage
near PSU or the
system input current.

However, in my machine the pin45 is customized as output current
sensing for near PSU
device.

To read these multifuction pin data, it need to use Dicrect Memory Access(D=
MA)
command codes.
DMA Address(Command code 0xc7): Used to set the register address to
use with other
DMA commands.
DMA Data(Command code 0xc5): Used to read from or write to the
register selected by
the DMA Address command.

And to read pin45, it needs to be routed by DMA and should be the 0xEE42, i=
t's
direct read with 10mA/LSB; pin44 is located at 0xE0D3 and it's direct read =
with
10mA/LSB.

That is, write 0xEE42 to 0xc7 and then read the data from 0xc5 with
direct read with
10mA/LSB for pin45(VSYS) and it is the near PSU device's output current.

Since the address 0xc5 is different from IIN(0x89), IOUT(0x8C), I
think it might need
new command to do it.

Thank you for your review. I=E2=80=99ve submitted a v2 of the patch incorpo=
rating your
suggestions. I appreciate your time and feedback.
> Guenter
>
Thank you
Jeff
