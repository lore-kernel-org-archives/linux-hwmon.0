Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kmC0SMZG"
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F28DEE4;
	Tue, 12 Dec 2023 07:27:10 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3333131e08dso6330094f8f.2;
        Tue, 12 Dec 2023 07:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702394829; x=1702999629; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B38W1esuqMveBz4GM+3+CzV8mGUQVgFrvUut5Ptidsg=;
        b=kmC0SMZGH2u+11X3BKtlxPM5lUTFTLY327O6UjGhLivevu5S6TIKibAF8+ehe33thl
         qYzfDh/XoiC1EIA/JYieGXTrSZ3PzXS5xB6cNRckAKakucYuubL3TVW06jEh2xuv201B
         d1sq+GV7nj8wg95zd8oO1wjYm3h8W7DBXeIEQ0mH3mTbIATNIeqiZbymYTh0L7FFYVsR
         W+JZT8L+TLJzjxAMc5L+5jCP2g15dv6edl+gC0bN86Is6NpO8y2a+yRCV2iAHTHk3et0
         nvT53iglT/BKLOAvbQ1lhbR4ybBThuV7y8fa/tvRFTvTyuDisUkh9+HbREZAD/fLuT2X
         +uCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702394829; x=1702999629;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B38W1esuqMveBz4GM+3+CzV8mGUQVgFrvUut5Ptidsg=;
        b=WJq8HSg6aAY4GkvUOcxdFPJGFaF7c4O+/cIVTxGud7CbAxM4Dy9Ns/0Ohc7fJOYmrV
         +1Qn8EO3jRJaB7VxLOq+eWQSVbSwFCSk+NEAJ0LzkDA2XIzbk87lZZr6PUGWzphFUXYt
         9XddiF3IeJNDxrdydXGkGYih2I5k2EfwcRWLvIxDgaEzb0cRwuUSzqMYjFQUYkouWSQI
         xg93VisiqusWMVAS5J6K/dxISINj9ezGl/JHdrY15ILHwRpf424U/aMtZhtU/jFUVjs4
         0CEAYQK+qn+32K26PBadbcr2sthZiHA6vAnEsL6TjZnIUJiUo6EEqEDS7UUnKPWaIGO5
         c8uQ==
X-Gm-Message-State: AOJu0Yzwxc0KFHg/LzVaeczuoryXJiMRdoeiHsSB+1hg3O+O7CsFFZzu
	vqvg1at1nsavlozTWfw7j7g=
X-Google-Smtp-Source: AGHT+IFZG3xYh01CXHis8sQS+MW2ObMzZFAi5sZtDtpN9tzS1ZdwCHhcT4BcWrhH4S/1V1pGtCmjaQ==
X-Received: by 2002:a5d:4344:0:b0:333:f04:f2d7 with SMTP id u4-20020a5d4344000000b003330f04f2d7mr2822428wrr.55.1702394829201;
        Tue, 12 Dec 2023 07:27:09 -0800 (PST)
Received: from ?IPv6:2003:f6:ef1b:2000:944c:cbc7:1e1c:2c47? (p200300f6ef1b2000944ccbc71e1c2c47.dip0.t-ipconnect.de. [2003:f6:ef1b:2000:944c:cbc7:1e1c:2c47])
        by smtp.gmail.com with ESMTPSA id x15-20020a5d60cf000000b0033635ee4543sm652519wrt.67.2023.12.12.07.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 07:27:08 -0800 (PST)
Message-ID: <38e41d0b92c0cb1f61e7a1d92137cc94a57a7f85.camel@gmail.com>
Subject: Re: [PATCH v3 2/2] hwmon: ltc4282: add support for the LTC4282 chip
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, nuno.sa@analog.com
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley <conor+dt@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Date: Tue, 12 Dec 2023 16:30:12 +0100
In-Reply-To: <436257a1-628e-4a45-884d-348e73d4c5e9@roeck-us.net>
References: <20231205-ltc4282-support-v3-0-e0877b281bc2@analog.com>
	 <20231205-ltc4282-support-v3-2-e0877b281bc2@analog.com>
	 <a0eb6cb4-b8af-4a6f-8888-fa18f8f1d188@roeck-us.net>
	 <d190620900ceda6c2846f3828ee389da917a66e0.camel@gmail.com>
	 <436257a1-628e-4a45-884d-348e73d4c5e9@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2023-12-12 at 07:14 -0800, Guenter Roeck wrote:
> On 12/12/23 06:28, Nuno S=C3=A1 wrote:
> > On Mon, 2023-12-11 at 07:36 -0800, Guenter Roeck wrote:
> > > On Tue, Dec 05, 2023 at 04:22:56PM +0100, Nuno Sa via B4 Relay wrote:
> > > > From: Nuno Sa <nuno.sa@analog.com>
> > > >=20
> > > > The LTC4282 hot swap controller allows a board to be safely inserte=
d and
> > > > removed from a live backplane. Using one or more external N-channel=
 pass
> > > > transistors, board supply voltage and inrush current are ramped up =
at an
> > > > adjustable rate. An I2C interface and onboard ADC allows for monito=
ring
> > > > of board current, voltage, power, energy and fault status.
> > > >=20
> > > > Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> > > > ---
> > > > +
> > >=20
> > > > +power1_good		Power considered good
> > >=20
> > > I really don't like this attribute. Like the ones below it is non-sta=
ndard
> > > and invisible for standard applications. On top of that, I think it i=
sn't
> > > really related to "power" but to the output voltage. What does it act=
ually
> > > report that isn't included in the FET faults ?
> > >=20
> >=20
> > This is detected with the FB pin and a voltage divider (from the output
> > voltage). Basically depending on the level of that pin, the chip indica=
te
> > power
> > good or power bad. I was also very reluctant with this attribute (I men=
tion
> > it
> > in the v1 cover). This might not even indicate any misbehave. We also
> > support
> > reporting this using the gpio1 pin (if we set it that way). So, I guess=
 I
> > can
> > just drop this one and add support for it if we ever have a real usecas=
e
> > where I
> > can actually justify having it :).
> >=20
> > We already have the power_bad fault log in debugfs so I'm not sure if a=
dding
> > this one there adds much value.
> >=20
> > >=20
> > > > +fet_short_fault		FET short alarm
> > > > +fet_bad_fault		FET bad alarm
> > >=20
> > > Those attributes have little value since they are not standard attrib=
utes
> > > and won't be seen by standard applications. On top of that, it is not
> > > clear
> > > (not documented) what the attribute actually reports. I assume it is
> > > associated with the output voltage, i.e., in0, but that is just an
> > > assumption.
> > >=20
> >=20
> > fet_short - This is one is detected if the ADC measures a current sense
> > voltage
> > > 0.25mv while the fet gate is off.
> >=20
> > fet_bad - Is set by monitoring the voltage at the gate and the drain to
> > source
> > voltage.
> >=20
> > These ones might indicate real issues with the HW so I thought they cou=
ld be
> > important...
> > =C2=A0=20
> > > What do you think about introducing a standard inX_fault attribute ?
> > > It would not be as specific as short/bad, but I think it would be mor=
e
> > > useful and we could add it to the ABI.
> > >=20
> >=20
> > It would be better than nothing. And we do have fault logs for both the=
se
> > failures so userspace could also use that to know exactly what was the
> > issue. If
> > that's ok with you, I would then report this in inX_fault? Did you had =
in
> > mind
> > putting this in in0 (vsource) or adding a new channel?
> >=20
> > In my first draft I had another voltage channel (label: VFET) to report=
 the
> > fet_bad condition. I was using the inX_crit or inX_lcrit but it felt ba=
d so
> > I
> > removed it...
> >=20
>=20
> This isn't an extra voltage channel. It should be associated with the out=
put
> voltage because that is what is affected, and that would be in0.
>=20

Noted... will go with that and add an introductory patch for having inX_fau=
lt in
hwmon.

> > > > +fault_logs_reset	Clears all the Logged Faults
> >=20
> > > What exactly does that do that is user visible ?
> >=20
> > Well, this one is because in some configurations the chip won't enable =
the
> > output load until you reset/clear the fault log keeping it from enablin=
g the
> > output.=C2=A0This is the comment I have in the code:
> >=20
> > "Fault log failures. These faults might be important in systems where a=
uto-
> > retry
> > is not enabled since they will cause the part to latch off until they a=
re
> > cleared. Typically that happens when the system admin is close enough s=
o he
> > can
> > check what happened and manually clear the faults. Moreover, manually
> > clearing
> > the faults might only matter when ON_FAULT_MASK in the CONTROL register=
 is
> > set
> > (which is the default) as in that case, a turn off signal from the ON p=
in
> > won't
> > clear them."
> >=20
> > In v1 I was allowing to clear fauls log individually and you recommende=
d to
> > have
> > an attribute to clear them all at once as that would simplify things.
> >=20
> > I just kept it in here because this might be important for the chip to =
work
> > as
> > expected again so having it in debugfs might be weird.
> >=20
>=20
> How about using a write to in0_fault to clear the log ?
>=20

But that would be just related with the output voltage. You can also have
failures on VDD (over and undervolatge fault - I'm using in1_crit and in1_l=
crit)
and if you have the auto retry bit disabled, then clearing fault logs might=
 be
important. This attribute is nice because makes it clear what will be done.
OTOH, I do understand your worries with non standard ABI...

I'm not sure how usual is for fault logs to be around that would justify fo=
r a
global standard attribute.

- Nuno S=C3=A1


