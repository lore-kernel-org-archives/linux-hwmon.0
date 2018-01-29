Return-Path: <pali.rohar@gmail.com>
Return-path: <pali.rohar@gmail.com>
Date: Mon, 29 Jan 2018 09:46:50 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>,
	Oleksandr Natalenko <oleksandr@natalenko.name>,
	Jonathan Buzzard <jonathan@buzzard.org.uk>,
	Mario Limonciello <mario.limonciello@dell.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [4/4] hwmon: (dell-smm) Measure time duration of SMM call around
 inlined asm
Message-ID: <20180129084650.stj2x65zplou6vma@pali>
References: <20180127162351.13858-1-pali.rohar@gmail.com>
 <20180127175145.GA12923@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20180127175145.GA12923@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

On Saturday 27 January 2018 09:51:45 Guenter Roeck wrote:
> On Sat, Jan 27, 2018 at 05:23:51PM +0100, Pali Roh=C3=A1r wrote:
> > Measure only inlined asm code, not other functions to have as precise as
> > possible measured time.
> >=20
> > Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> > ---
> >  drivers/hwmon/dell-smm-hwmon.c | 14 ++++++++++----
> >  1 file changed, 10 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hw=
mon.c
> > index bf3bb7e1adab..e001afd53f46 100644
> > --- a/drivers/hwmon/dell-smm-hwmon.c
> > +++ b/drivers/hwmon/dell-smm-hwmon.c
> > @@ -147,14 +147,16 @@ static int i8k_smm_func(void *par)
> >  	int ebx =3D regs->ebx;
> >  	unsigned long duration;
> >  	ktime_t calltime, delta, rettime;
> > -
> > -	calltime =3D ktime_get();
> >  #endif
> > =20
> >  	/* SMM requires CPU 0 */
> >  	if (smp_processor_id() !=3D 0)
> >  		return -EBUSY;
> > =20
> > +#ifdef DEBUG
> > +	calltime =3D ktime_get();
> > +#endif
> > +
> >  #if defined(CONFIG_X86_64)
> >  	asm volatile("pushq %%rax\n\t"
> >  		"movl 0(%%rax),%%edx\n\t"
> > @@ -208,13 +210,17 @@ static int i8k_smm_func(void *par)
> >  	    :    "a"(regs)
> >  	    :    "%ebx", "%ecx", "%edx", "%esi", "%edi", "memory");
> >  #endif
> > -	if (rc !=3D 0 || (regs->eax & 0xffff) =3D=3D 0xffff || regs->eax =3D=
=3D eax)
> > -		rc =3D -EINVAL;
> > =20
> >  #ifdef DEBUG
> >  	rettime =3D ktime_get();
> >  	delta =3D ktime_sub(rettime, calltime);
> >  	duration =3D ktime_to_ns(delta) >> 10;
> > +#endif
> > +
> > +	if (rc !=3D 0 || (regs->eax & 0xffff) =3D=3D 0xffff || regs->eax =3D=
=3D eax)
> > +		rc =3D -EINVAL;
> > +
> > +#ifdef DEBUG
>=20
> FWIW, the error introduced by dividing nS by 1,024 instead of 1,000 is
> much worse than the improvements from moving the calls around. Using
> specific numbers, the current code reports 500 mS as 488,281 uS.
> So why bother ?

Ah, I have not noticed this yet :-(

> I would have suggested to use ktime_us_delta(ktime_get(), calltime)
> instead to make the results more accurate. Sure, you get the offset from
> the additional divide operation, but at least that would be a constant
> and not a systematic error.
>=20
> I'll hold this patch off for a bit. Please confirm that you want it
> applied as-is. I applied the other patches from the series.

Ok, I will fix this patch and resend just new version of this one.

Anyway, if 2/4 is targeting stable, then 3/4 should too. But now I see
that I added Cc only to patch 2/4.

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
