Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235621B28D
	for <linux-hwmon@vger.kernel.org>; Sat, 16 Mar 2024 13:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710596004; cv=none; b=M9BWahCoykRkhJAug6kFBz3k+1Ezo2QpTDF7cdSCn3ErUAHbq+JwG4AF2h0QQ635XTGaD8HOPCxwX22MLp9nugtIn9QwXeSrbdNuYh05d20gLdQIsFFaPcy/1Goyg5Lmhm3vwCt28IevCwEIKn0vz7mQjE9IZZdsBY2brL+42Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710596004; c=relaxed/simple;
	bh=yOMu/bQT4oask69Zx8Faw3+IU5I3D6Qqd/kKf0hBeDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p1UMCVSxjkVEBcyTomgXfhWe5VD46e7Gg1yX3DnLLpUZ+C1adBbIaqspEbwq2351rHeZGn2zt4mbqYihAZLYk+ysgoZvWjDDRf0IEVQzqD6mvicYSO1fMKNl4EBl8HwFYnckSAlOwBHYi/6Lg5WXWUTJ+4V2ap0sR5DILurUjvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NdBYPD15; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NdBYPD15"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-568c51f44e5so251490a12.0
        for <linux-hwmon@vger.kernel.org>; Sat, 16 Mar 2024 06:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710596001; x=1711200801; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yOMu/bQT4oask69Zx8Faw3+IU5I3D6Qqd/kKf0hBeDU=;
        b=NdBYPD15Iy6XzftxIxa47QQyqxC031/Dco/JFrx60qwOnsvkqx48BJbja8d80T981F
         xTuyRP3MlSzbtgASNuRcdmYIDZ9idUtjQXb/2FNS4d+ocl1iebNdTlNME0up3bvC1B8p
         aI6teWjTw25XdNqxfjL4kGmdN84OiA7Te5mLr0PSytC8Hkh/Jl/vdlGDYWnHxPhYR7ow
         0aSnAoNrPxe+Cyd+MWZW8eMC9HAP7cLLk7ll77VqI5HF0fGLpGCOAtoDYKMX9WEokR+D
         oZLtXYbN+SuTQfGYgZ0Wp6h9OZMGIB7Hx+MDIuHvCuwHjZ81bKFHlUjdyygwi3ReTUaX
         y97Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710596001; x=1711200801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yOMu/bQT4oask69Zx8Faw3+IU5I3D6Qqd/kKf0hBeDU=;
        b=TbPmo7aQMGIuh4ANHDKF8szWAAZkj+9j56SzKHThltP/Tl9dqNkBkpAXqc5JOMswq1
         KxaIaVqh3//D/2YxlHHAia/DEBToHZ2Ef8/dQUjvawaQV0at9yge6+oL6B8HX7QLgnof
         SuM1jNX5Ic+Fll5msxb2r2WNxWQxGJAYtofmezqWxV5r69Lkq493yyrnoSPOMrWMNLSm
         VTAj9aT+ARXxDQfOqsnV0Kyc1h/o57ZGv/hw/cBjxv7Ze1elDadKuFRMHg52Ag+yyI9I
         pI81017Zs9sNkUYKeM9a+gAGLoTDzy5SsACNbBQrYMHsIVyF7Df+di+HKUypRmoxiHOe
         574A==
X-Forwarded-Encrypted: i=1; AJvYcCWrYLcnRyL+bkBOaj8/CxdabjUoSyIaGuoZUeKOLgek3tJ5zyB9+yuhFDyh+ZdkiqONlewv/iS9UojbDc9Eftqh357XBuSsVGG5M9k=
X-Gm-Message-State: AOJu0YzWj5mOm8kdlxLM5HnS2fOfRbJNZ7PFGemT+qNNfhsTfz1jIWvC
	R7fPIJknIu8o+hA4jZ23ITvMDj2/6euWkH6SqqgGLLioloOTNKG6HeqWKe30mrV7PtTdDAjE6le
	LXODEYQn3DCk5WC67cGXLtJkRgjpYQA6nxeM=
X-Google-Smtp-Source: AGHT+IEzLj+Bk/BeyKiPad4FrjilzrZ+wXDU5QAnVvqZjnnXJeCwrNOzIIAYlcSRYiIzS0RZtta5KYLSkq2ZzlCExqc=
X-Received: by 2002:a05:6402:5d4:b0:568:b702:e0d3 with SMTP id
 n20-20020a05640205d400b00568b702e0d3mr2966086edx.21.1710596001127; Sat, 16
 Mar 2024 06:33:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240315151855.377627-1-lars.petter.mostad@appear.net> <7fe93aaa-b0ac-4952-a5ef-f42b6053b42e@roeck-us.net>
In-Reply-To: <7fe93aaa-b0ac-4952-a5ef-f42b6053b42e@roeck-us.net>
From: Lars Petter Mostad <larspm@gmail.com>
Date: Sat, 16 Mar 2024 14:33:09 +0100
Message-ID: <CAC-Dm24yn_aeTVjRofst+NGtdzhDDhtouJSxY_bw3yCwZPb1Jg@mail.gmail.com>
Subject: Re: [PATCH 0/1] hwmon: (pmbus_core) Relative encoding of vout related commands
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org, 
	Lars Petter Mostad <lars.petter.mostad@appear.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 15, 2024 at 7:05=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 3/15/24 08:18, Lars Petter Mostad wrote:
> > PMBus 1.3 allows for relative encoding of voltages in certain output
> > voltage related commands. I'm starting this thread to ask if adding sup=
port
> > for this, either by me or someone else, is of interest. I have made an
> > initial attempt to add support that is adequate for my needs. I have
> > included the patch for discussion. I don't expect it to be accepted as =
is.
> >
> > I'm working on the software for an ARM64 based board that uses the
> > TDK FS1412, which uses relative encoding. This is the only chip that us=
es
> > this feature that I have access to. I only have access to this chip on =
this
> > board, so I'm only able to test it on this architecture. I have to use =
the
> > kernel sources from NXPs LLDP project, which ATTOW is based on kernel
> > 6.1.55. I'm not able to test on a newer kernel at the moment. The board=
 is
> > fairly expensive, so I don't dare test setting voltages. I have only te=
sted
> > monitoring voltages.
> >
> > In relative mode, certain output voltage related commands (e.g.
> > VOUT_MARGIN_HIGH) are encoded relative to the nominal value (VOUT_COMMA=
ND).
> > If e.g. the high margin is to be 10% above the nominal value,
> > VOUT_MARGIN_HIGH is set to 1.1. This factor is encoded the same way as
> > VOUT_COMMAND (i.e. as indicated by VOUT_MODE).
> >
> > I have been a little unsure about how to best organize the changes.
> > Decoding the relative values requires access to the current value of
> > VOUT_COMMAND. I decided to handle it the same way exponent is handled.
> > I placed the relevant information next to exponent in pmbus_data.
> > vout_mode_relative is true if relative encoding is used, vout_command
> > stores what is believed to be the current VOUT_COMMAND. As exponent,
> > vout_mode_relative is set during decoding of VOUT_MODE in
> > pmbus_identify_common.
> >
> > I decided to assume that VOUT_COMMAND is not changed outside the driver=
,
> > as this is also done for VOUT_MODE. VOUT_COMMAND is read and saved duri=
ng
> > pmbus_init_common. It is also saved to vout_command during
> > pmbus_regulator_set_voltage.
> >
> > pmbus_regulator_set_voltage usually clamps the requested voltage to be
> > between VOUT_MARGIN_LOW and VOUT_MARGIN_HIGH. This does not make sense =
in
> > relative mode, as the margins move with the requested voltage. This par=
t is
> > skipped in relative mode.
> >
> > pmbus_reg2data does the actual relative decoding. The pmbus_reg2data_*
> > functions return the register value multiplied by 1000, which in relati=
ve
> > mode means the permilleage of the nominal value. If we are in relative =
mode,
> > and the current register is one of the registers that can use relative
> > decoding, the permilleage value is multiplied with the stored vout_comm=
and.
> > Currently, the vout_command in pmbus_data is stored decoded, i.e. 1000x=
 and
> > rounded to an integer. Better precision could be achieved if the
> > multiplication was done inside each pmbus_reg2data_*, before the roundi=
ng
> > to integer, but this would be a bit messier.
> >
> > I welcome comments on wether this is of interest, and what is needed to
> > get it into an acceptable state!
> >
>
> My major concern is unintended side effects. In drivers/hwmon/pmbus/tps54=
6d24.c
> we "solve" the problem by explicitly setting absolute mode. Would that he=
lp
> for the time being ?
>
> I'd prefer to get some experience with actual chips (meaning evaluation b=
oards)
> before trying to provide a supposedly generic solution which retains rela=
tive mode.
> I ordered a couple of evaluation boards for TPS546D24 variants. The evalu=
ation
> board for FS1412 is a bit too expensive for my liking, so I don't really =
want
> to order that one. Do you know of any other chips supporting this functio=
nality ?
>
> Thanks,
> Guenter
>

I did try the solution used for the TI chip by using i2cset to write VOUT_M=
ODE
before binding the driver, but the command only returns "Error: Write faile=
d"
for this address. I guess this chip is relative mode only.

This is the only relative mode chip I have come across.

Thanks for looking into this!

Regards,
Lars Petter
