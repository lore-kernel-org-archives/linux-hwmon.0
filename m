Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V20MR84v"
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A3328F;
	Tue, 12 Dec 2023 06:25:00 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40c32df9174so49272665e9.3;
        Tue, 12 Dec 2023 06:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702391099; x=1702995899; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wT+VDqG3XoXgaVhq1uWAJL5Mh+pcqg7vqqy6t8enn7o=;
        b=V20MR84vVemiR/FcRW1Ta1fCSJSBef7Z3RrQw/uwmkjQRONcCIkEEaAWtNMGNuzM4v
         pKriVuS2E0X0bFFMSujux8MNF/5MQibvU/zgC3/cevE7wHxoJi46+V/4ZpXuvDiFNnXK
         ikXo17SQA+Ea9pCVuT9+e470Qw/0gHls62OV7C1k9XmHKKAlU2x6OrGVZXOePSnHWWBu
         Hr6IyeJM+tJPUmyMxFLeXvnDTvZl5G5aWAsL82gjEmVrgfawQnjxtnERs+Wj49R4kq0X
         +JcaIrsePWd91vfh/quHY0lKhodGdyvxcKCG6qx+62vatJV2x2fP72bfoj+eWQcOjkYZ
         Y8gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702391099; x=1702995899;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wT+VDqG3XoXgaVhq1uWAJL5Mh+pcqg7vqqy6t8enn7o=;
        b=oWXc5Xy7R7YIjYyGM7L1c9mc++s0cR8bwN2DY5YQrgnGm0mVKhoKUp8iXRA+BiRUnN
         3AiSQSW9EzwXUkE5xrw+3Ypxa5x1RkQxXIUjXuosgSo6xgzvkatl6tTbe+MXoDZqpE/T
         YJ41z+/IpfWdw1kTMsFoXjMmOsKQXl5aGoeL/l/1p82ZyDwYza8+CJX2qpaiWtxBjIXo
         /ixivpxdGU9ScZlOxDlidxyjM+0G6hvsKQFLok6fo6ouLzI3qY/6X4ZKnv2U1dVWhzo3
         ol2WlHHwalaRzqdFDnd5RhMXqIrM1Et8r6xGgagupwcGoGswUl1s6vTLcrOkDu6RMK9R
         cUcA==
X-Gm-Message-State: AOJu0YzFXGR/2hfXej3Md77ILfhMph/pmEYrVzQHyqlrqAN5ahU1Q6Ga
	8FzKXtHg4su5VP2Air0z7tE=
X-Google-Smtp-Source: AGHT+IGH51NOBoO6nuzdx+4kZ9NNmSPNiBfBdJrzPHJq7wSmapSwkjPSMN4nDURa6XRgJ8ySn9n0Sw==
X-Received: by 2002:a7b:cbcb:0:b0:40c:34f9:6c14 with SMTP id n11-20020a7bcbcb000000b0040c34f96c14mr2372738wmi.161.1702391098474;
        Tue, 12 Dec 2023 06:24:58 -0800 (PST)
Received: from ?IPv6:2003:f6:ef1b:2000:944c:cbc7:1e1c:2c47? (p200300f6ef1b2000944ccbc71e1c2c47.dip0.t-ipconnect.de. [2003:f6:ef1b:2000:944c:cbc7:1e1c:2c47])
        by smtp.gmail.com with ESMTPSA id v6-20020a05600c444600b0040c4886f254sm6920056wmn.13.2023.12.12.06.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 06:24:58 -0800 (PST)
Message-ID: <d190620900ceda6c2846f3828ee389da917a66e0.camel@gmail.com>
Subject: Re: [PATCH v3 2/2] hwmon: ltc4282: add support for the LTC4282 chip
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, nuno.sa@analog.com
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley <conor+dt@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Date: Tue, 12 Dec 2023 15:28:02 +0100
In-Reply-To: <a0eb6cb4-b8af-4a6f-8888-fa18f8f1d188@roeck-us.net>
References: <20231205-ltc4282-support-v3-0-e0877b281bc2@analog.com>
	 <20231205-ltc4282-support-v3-2-e0877b281bc2@analog.com>
	 <a0eb6cb4-b8af-4a6f-8888-fa18f8f1d188@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2023-12-11 at 07:36 -0800, Guenter Roeck wrote:
> On Tue, Dec 05, 2023 at 04:22:56PM +0100, Nuno Sa via B4 Relay wrote:
> > From: Nuno Sa <nuno.sa@analog.com>
> >=20
> > The LTC4282 hot swap controller allows a board to be safely inserted an=
d
> > removed from a live backplane. Using one or more external N-channel pas=
s
> > transistors, board supply voltage and inrush current are ramped up at a=
n
> > adjustable rate. An I2C interface and onboard ADC allows for monitoring
> > of board current, voltage, power, energy and fault status.
> >=20
> > Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> > ---
> > +
>=20
> > +power1_good		Power considered good
>=20
> I really don't like this attribute. Like the ones below it is non-standar=
d
> and invisible for standard applications. On top of that, I think it isn't
> really related to "power" but to the output voltage. What does it actuall=
y
> report that isn't included in the FET faults ?
>=20

This is detected with the FB pin and a voltage divider (from the output
voltage). Basically depending on the level of that pin, the chip indicate p=
ower
good or power bad. I was also very reluctant with this attribute (I mention=
 it
in the v1 cover). This might not even indicate any misbehave. We also suppo=
rt
reporting this using the gpio1 pin (if we set it that way). So, I guess I c=
an
just drop this one and add support for it if we ever have a real usecase wh=
ere I
can actually justify having it :).

We already have the power_bad fault log in debugfs so I'm not sure if addin=
g
this one there adds much value.

>=20
> > +fet_short_fault		FET short alarm
> > +fet_bad_fault		FET bad alarm
>=20
> Those attributes have little value since they are not standard attributes
> and won't be seen by standard applications. On top of that, it is not cle=
ar
> (not documented) what the attribute actually reports. I assume it is
> associated with the output voltage, i.e., in0, but that is just an
> assumption.
>=20

fet_short - This is one is detected if the ADC measures a current sense vol=
tage
> 0.25mv while the fet gate is off.

fet_bad - Is set by monitoring the voltage at the gate and the drain to sou=
rce
voltage.

These ones might indicate real issues with the HW so I thought they could b=
e
important...
=20
> What do you think about introducing a standard inX_fault attribute ?
> It would not be as specific as short/bad, but I think it would be more
> useful and we could add it to the ABI.
>=20

It would be better than nothing. And we do have fault logs for both these
failures so userspace could also use that to know exactly what was the issu=
e. If
that's ok with you, I would then report this in inX_fault? Did you had in m=
ind
putting this in in0 (vsource) or adding a new channel?

In my first draft I had another voltage channel (label: VFET) to report the
fet_bad condition. I was using the inX_crit or inX_lcrit but it felt bad so=
 I
removed it...

> > +fault_logs_reset	Clears all the Logged Faults

> What exactly does that do that is user visible ?

Well, this one is because in some configurations the chip won't enable the
output load until you reset/clear the fault log keeping it from enabling th=
e
output.=C2=A0This is the comment I have in the code:

"Fault log failures. These faults might be important in systems where auto-=
retry
is not enabled since they will cause the part to latch off until they are
cleared. Typically that happens when the system admin is close enough so he=
 can
check what happened and manually clear the faults. Moreover, manually clear=
ing
the faults might only matter when ON_FAULT_MASK in the CONTROL register is =
set
(which is the default) as in that case, a turn off signal from the ON pin w=
on't
clear them."

In v1 I was allowing to clear fauls log individually and you recommended to=
 have
an attribute to clear them all at once as that would simplify things.=C2=A0

I just kept it in here because this might be important for the chip to work=
 as
expected again so having it in debugfs might be weird.

Thanks!
- Nuno S=C3=A1


