Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eewZiZl4"
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 581C8D0;
	Wed, 13 Dec 2023 02:06:28 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a1f8510883aso544474766b.3;
        Wed, 13 Dec 2023 02:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702461987; x=1703066787; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JO/HiJ+kSEpW62CdEw92u2NUo66uRjUgw4hq2FXSzZc=;
        b=eewZiZl4w6iSre8RXg5GFEjNsWtUBJICgCXlyeXW7JaHvE1c/9JzDH56FrkQuvtzjl
         ggJFQevk0KUGan5EXmORwi2/8RxrsxFcnCJpuY2aaOp/5J+y4xSXB/gdS6o2hoXiCWBi
         o+bcXZEVATClE9HsPCUZHrFqYgNxvw2WwqPbkkWfCiTz32CRFGEGI//G9M7qkzIO3u5O
         +mSCc/3l6pcF0IAtOTH4qcLknp1j9ya9ekesVW2kyACUu/hx83dckDMTTBCZ1eJ5B7HU
         eMfkdBtLPKcujN5EcL9MQ4PzfuuckU/W19N+/mRaQWNfSXXM84br9CF4ToTNVqX67ujl
         R9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702461987; x=1703066787;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JO/HiJ+kSEpW62CdEw92u2NUo66uRjUgw4hq2FXSzZc=;
        b=Ww7y7ceWk8UBzlizaT1CTPoESDd67uKzKQhO3P4zJN1ai+wszzJXWzzC8cA4r2L4oG
         +GuCKvnnpzhA25iyn2fLZh4UIJ/oYg/IygHV8pGyYJCHHdQmxm3XLOWgyqQjAlB+oZO6
         6JZpj/VyoKHB4XiHmazt983iI2GUivUkgi80TJjVmk746mLPuUe4TGZpfSTRoA0AEV2L
         EILHOQgB3PqblUpLV60K24r3OyE9jvpas2H8//Tm5cDvuIj487pIIAo66wXi0lTHeDbn
         gJXCMSyuJDC9kO6/1Y4q5ozfBe7FOg+jaSijG2vZvoQFUGGdYFLo3n6Z8PeBLB11at+9
         WcWA==
X-Gm-Message-State: AOJu0YwmKzV978rm91Ohe8ZI2O8+NllYqyfGVLQaYiR+Fdo/MufQ2GVJ
	s5lXNpDIKejDkcWyA34ipfw=
X-Google-Smtp-Source: AGHT+IHxTaCnqbYO7DXlZwQq/8jTkWKawpSDlMAjwhTIAOGgHnNifn1VsFqIyhtZBPEa80x5PDnFPg==
X-Received: by 2002:a17:907:724d:b0:a1c:a39d:dcbd with SMTP id ds13-20020a170907724d00b00a1ca39ddcbdmr2612616ejc.232.1702461986410;
        Wed, 13 Dec 2023 02:06:26 -0800 (PST)
Received: from ?IPv6:2001:a61:3456:4e01:6ae:b55a:bd1d:57fc? ([2001:a61:3456:4e01:6ae:b55a:bd1d:57fc])
        by smtp.gmail.com with ESMTPSA id th19-20020a1709078e1300b00a1bda8db043sm7364051ejc.120.2023.12.13.02.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 02:06:25 -0800 (PST)
Message-ID: <cdf4876c8e5f70d70ac362f79f295cae5e39b1ef.camel@gmail.com>
Subject: Re: [PATCH v3 2/2] hwmon: ltc4282: add support for the LTC4282 chip
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, nuno.sa@analog.com
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley <conor+dt@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Date: Wed, 13 Dec 2023 11:06:25 +0100
In-Reply-To: <92699a3e-1198-4bf9-b5c0-ea8c5c189336@roeck-us.net>
References: <20231205-ltc4282-support-v3-0-e0877b281bc2@analog.com>
	 <20231205-ltc4282-support-v3-2-e0877b281bc2@analog.com>
	 <a0eb6cb4-b8af-4a6f-8888-fa18f8f1d188@roeck-us.net>
	 <d190620900ceda6c2846f3828ee389da917a66e0.camel@gmail.com>
	 <436257a1-628e-4a45-884d-348e73d4c5e9@roeck-us.net>
	 <38e41d0b92c0cb1f61e7a1d92137cc94a57a7f85.camel@gmail.com>
	 <92699a3e-1198-4bf9-b5c0-ea8c5c189336@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2023-12-12 at 09:59 -0800, Guenter Roeck wrote:
> On 12/12/23 07:30, Nuno S=C3=A1 wrote:
> > On Tue, 2023-12-12 at 07:14 -0800, Guenter Roeck wrote:
> > > On 12/12/23 06:28, Nuno S=C3=A1 wrote:
> > > > On Mon, 2023-12-11 at 07:36 -0800, Guenter Roeck wrote:
> > > > > On Tue, Dec 05, 2023 at 04:22:56PM +0100, Nuno Sa via B4 Relay wr=
ote:
> > > > > > From: Nuno Sa <nuno.sa@analog.com>
> > > > > >=20
> > > > > > The LTC4282 hot swap controller allows a board to be safely ins=
erted and
> > > > > > removed from a live backplane. Using one or more external N-cha=
nnel pass
> > > > > > transistors, board supply voltage and inrush current are ramped=
 up at an
> > > > > > adjustable rate. An I2C interface and onboard ADC allows for mo=
nitoring
> > > > > > of board current, voltage, power, energy and fault status.
> > > > > >=20
> > > > > > Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> > > > > > ---
> > > > > > +
> > > > >=20
> > > > > > +power1_good=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0Power considered good
> > > > >=20
> > > > > I really don't like this attribute. Like the ones below it is non=
-standard
> > > > > and invisible for standard applications. On top of that, I think =
it isn't
> > > > > really related to "power" but to the output voltage. What does it=
 actually
> > > > > report that isn't included in the FET faults ?
> > > > >=20
> > > >=20
> > > > This is detected with the FB pin and a voltage divider (from the ou=
tput
> > > > voltage). Basically depending on the level of that pin, the chip in=
dicate
> > > > power
> > > > good or power bad. I was also very reluctant with this attribute (I=
 mention
> > > > it
> > > > in the v1 cover). This might not even indicate any misbehave. We al=
so
> > > > support
> > > > reporting this using the gpio1 pin (if we set it that way). So, I g=
uess I
> > > > can
> > > > just drop this one and add support for it if we ever have a real us=
ecase
> > > > where I
> > > > can actually justify having it :).
> > > >=20
> > > > We already have the power_bad fault log in debugfs so I'm not sure =
if adding
> > > > this one there adds much value.
> > > >=20
> > > > >=20
> > > > > > +fet_short_fault=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0FET short alarm
> > > > > > +fet_bad_fault=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0FET bad alarm
> > > > >=20
> > > > > Those attributes have little value since they are not standard at=
tributes
> > > > > and won't be seen by standard applications. On top of that, it is=
 not
> > > > > clear
> > > > > (not documented) what the attribute actually reports. I assume it=
 is
> > > > > associated with the output voltage, i.e., in0, but that is just a=
n
> > > > > assumption.
> > > > >=20
> > > >=20
> > > > fet_short - This is one is detected if the ADC measures a current s=
ense
> > > > voltage
> > > > > 0.25mv while the fet gate is off.
> > > >=20
> > > > fet_bad - Is set by monitoring the voltage at the gate and the drai=
n to
> > > > source
> > > > voltage.
> > > >=20
> > > > These ones might indicate real issues with the HW so I thought they=
 could be
> > > > important...
> > > > =C2=A0=C2=A0=20
> > > > > What do you think about introducing a standard inX_fault attribut=
e ?
> > > > > It would not be as specific as short/bad, but I think it would be=
 more
> > > > > useful and we could add it to the ABI.
> > > > >=20
> > > >=20
> > > > It would be better than nothing. And we do have fault logs for both=
 these
> > > > failures so userspace could also use that to know exactly what was =
the
> > > > issue. If
> > > > that's ok with you, I would then report this in inX_fault? Did you =
had in
> > > > mind
> > > > putting this in in0 (vsource) or adding a new channel?
> > > >=20
> > > > In my first draft I had another voltage channel (label: VFET) to re=
port the
> > > > fet_bad condition. I was using the inX_crit or inX_lcrit but it fel=
t bad so
> > > > I
> > > > removed it...
> > > >=20
> > >=20
> > > This isn't an extra voltage channel. It should be associated with the=
 output
> > > voltage because that is what is affected, and that would be in0.
> > >=20
> >=20
> > Noted... will go with that and add an introductory patch for having inX=
_fault in
> > hwmon.
> >=20
> > > > > > +fault_logs_reset=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Clea=
rs all the Logged Faults
> > > >=20
> > > > > What exactly does that do that is user visible ?
> > > >=20
> > > > Well, this one is because in some configurations the chip won't ena=
ble the
> > > > output load until you reset/clear the fault log keeping it from ena=
bling the
> > > > output.=C2=A0This is the comment I have in the code:
> > > >=20
> > > > "Fault log failures. These faults might be important in systems whe=
re auto-
> > > > retry
> > > > is not enabled since they will cause the part to latch off until th=
ey are
> > > > cleared. Typically that happens when the system admin is close enou=
gh so he
> > > > can
> > > > check what happened and manually clear the faults. Moreover, manual=
ly
> > > > clearing
> > > > the faults might only matter when ON_FAULT_MASK in the CONTROL regi=
ster is
> > > > set
> > > > (which is the default) as in that case, a turn off signal from the =
ON pin
> > > > won't
> > > > clear them."
> > > >=20
> > > > In v1 I was allowing to clear fauls log individually and you recomm=
ended to
> > > > have
> > > > an attribute to clear them all at once as that would simplify thing=
s.
> > > >=20
> > > > I just kept it in here because this might be important for the chip=
 to work
> > > > as
> > > > expected again so having it in debugfs might be weird.
> > > >=20
> > >=20
> > > How about using a write to in0_fault to clear the log ?
> > >=20
> >=20
> > But that would be just related with the output voltage. You can also ha=
ve
> > failures on VDD (over and undervolatge fault - I'm using in1_crit and i=
n1_lcrit)
> > and if you have the auto retry bit disabled, then clearing fault logs m=
ight be
> > important. This attribute is nice because makes it clear what will be d=
one.
> > OTOH, I do understand your worries with non standard ABI...
> >=20
>=20
> Depends on the meaning of "fault". PMBus, for example, uses the "fault" t=
erminology
> to indicate that critical limits have been exceeded. That isn't a "fault"=
 in the
> terminology used by the hwmon subsystem. Violating a voltage/current/powe=
r range
> isn't a fault. A shorted FET or temperature sensor, however, is a fault.
>=20
> In that sense, if the output is turned off because a voltage / current / =
power
> limit was violated, a write into the respective alarm register would be a=
ppropriate
> to reset it if the condition doesn't auto-reset. It really all depends on=
 the
> context.
>=20

Yeah, maybe I'm also failing in giving you all the "context". The device ha=
s kind of
three registers for failures/status/logs:

1. The ADC_ALERT_LOG. This is the typical one for violated min/max limits. =
They don't
auto-reset so I'm already doing that in the driver (after reading the alarm=
 bit).

2. The STATUS register. In this one, we have the fet bad/short failures and=
 critical
limits for VDD (under/over voltage detection). We also have overcurrent det=
ection and
the power1_good stuff we already talked about. This is one auto clears and =
it's RO.
So we kind of have a mix of faults and critical limits in here.

3. The FAULT_LOG register. This one is more about logging and is very simil=
ar (if not
identical) in the reported bits with the STATUS register. The differences i=
s that
this one does not auto-clears as it's about logging so we want to know abou=
t historic
failures and in some configurations (as mentioned before) we do need to cle=
ar the
fault log bit so the chip will be able to enable again the output voltage. =
And
regarding that we have these main bits:

 * Under voltage on VDD
 * Over voltage on VDD
 * Over current on the sense resistor
 * FET bad
 * FET short=20
 * Power bad

I can say that the under/over voltage and current will prevent the output t=
o be
enabled. I could force that state in my test environment and could see that
happening. For the FET faults I'm not sure as I cannot force those faults. =
The power
stuff won't affect the output.

> > I'm not sure how usual is for fault logs to be around that would justif=
y for a
> > global standard attribute.
> >=20
>=20
> We could also use in[01]_reset_history. While that is originally intended=
 to reset
> min/max voltage history, I think it makes sense to extend the meaning to =
include
> fault history (even more so if that history includes over/undervoltage ev=
ents).
> Plus, there are other _reset_history attributes which could be used to re=
set
> power/current/temperature history separately if that is supported by the =
chip.
>=20

Well, I'm already supporting _reset_history in the voltage/power/current ch=
annels so
I can easily extend that for clearing fault history if that is fine with yo=
u. I just
need to document it because it's a bit of an "hidden" thing. The question w=
ould also
be, should I just document this for this chip docs or in the general hwmon =
docs?

- Nuno S=C3=A1
