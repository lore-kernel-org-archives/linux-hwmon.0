Return-Path: <rlippert@google.com>
Return-path: <rlippert@google.com>
MIME-Version: 1.0
In-Reply-To: <20171122232816.GA4615@roeck-us.net>
References: <20171122220728.17861-1-rlippert@google.com> <20171122232816.GA4615@roeck-us.net>
From: Rob Lippert <rlippert@google.com>
Date: Wed, 22 Nov 2017 15:39:00 -0800
Message-ID: <CAFRv3wz0GDBNSBDFu_aYdrHJCQ6dwSXxW85JVJdA++c0_yDxAQ@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (pmbus/lm25066) Swap low/high current coefficients
 for LM5066(i)
To: Guenter Roeck <linux@roeck-us.net>
Cc: Robert Lippert <roblip@gmail.com>, linux-hwmon@vger.kernel.org, jdelvare@suse.com,
	linux-kernel@vger.kernel.org, Xo Wang <xow@google.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-hwmon@vger.kernel.org>

On Wed, Nov 22, 2017 at 3:28 PM, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Wed, Nov 22, 2017 at 02:07:28PM -0800, Robert Lippert wrote:
> > The _L low-current mode coefficient values should reference the
> > datasheet rows with CL=VDD but it seems were mistakenly pulled from
> > the rows with CL=GND.
> >
> > This causes the current/power to be reported as approximately double
> > the actual value when CL=GND and half the actual value when CL=VDD.
> >
>
> This would affect all chips supported by this driver. Hmm, and I was sure
> I tested this. I'll have to dig out my hardware and confirm.

I'm still not 100% convinced this commit is correct as I haven't been
able to validate the measurements against an external probe yet (and
my test board uses a non-standard sense resistor which means it needs
additional massaging of the data anyhow).

>
>
> The code currently only uses bit 4 of the DEVICE_SETUP (D9h) command
> to determine which current limit setting to use. Looking into the
> datasheet, it looks like it also has to evaluate bit 2, and I wonder
> if there is a means to determine CL if bit 2 = 0. Any idea ?

On my test board CL=floating (equivalent to GND) and the value of
register 0xD9 is all zeroes.

>
> Does bit 4 report the CL pin value if bit 2 = 0 ?

I can't tell by reading the datasheet that 0xD9 bit4 will ever report
the pin value as the language is difficult to parse :)
But I don't have any hardware setup with CL=VDD to test...

-Rob

>
> Thanks,
> Guenter
>
> > Signed-off-by: Robert Lippert <rlippert@google.com>
> > ---
> >  drivers/hwmon/pmbus/lm25066.c | 24 ++++++++++++------------
> >  1 file changed, 12 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
> > index 10d17fb8f283..aa052f4449a9 100644
> > --- a/drivers/hwmon/pmbus/lm25066.c
> > +++ b/drivers/hwmon/pmbus/lm25066.c
> > @@ -191,19 +191,19 @@ static struct __coeff lm25066_coeff[6][PSC_NUM_CLASSES + 2] = {
> >                       .R = -2,
> >               },
> >               [PSC_CURRENT_IN] = {
> > -                     .m = 10753,
> > +                     .m = 5405,
> >                       .R = -2,
> >               },
> >               [PSC_CURRENT_IN_L] = {
> > -                     .m = 5405,
> > +                     .m = 10753,
> >                       .R = -2,
> >               },
> >               [PSC_POWER] = {
> > -                     .m = 1204,
> > +                     .m = 605,
> >                       .R = -3,
> >               },
> >               [PSC_POWER_L] = {
> > -                     .m = 605,
> > +                     .m = 1204,
> >                       .R = -3,
> >               },
> >               [PSC_TEMPERATURE] = {
> > @@ -222,23 +222,23 @@ static struct __coeff lm25066_coeff[6][PSC_NUM_CLASSES + 2] = {
> >                       .R = -2,
> >               },
> >               [PSC_CURRENT_IN] = {
> > -                     .m = 15076,
> > -                     .b = -504,
> > +                     .m = 7645,
> > +                     .b = 100,
> >                       .R = -2,
> >               },
> >               [PSC_CURRENT_IN_L] = {
> > -                     .m = 7645,
> > -                     .b = 100,
> > +                     .m = 15076,
> > +                     .b = -504,
> >                       .R = -2,
> >               },
> >               [PSC_POWER] = {
> > -                     .m = 1701,
> > -                     .b = -4000,
> > +                     .m = 861,
> > +                     .b = -965,
> >                       .R = -3,
> >               },
> >               [PSC_POWER_L] = {
> > -                     .m = 861,
> > -                     .b = -965,
> > +                     .m = 1701,
> > +                     .b = -4000,
> >                       .R = -3,
> >               },
> >               [PSC_TEMPERATURE] = {
> > --
> > 2.15.0.448.gf294e3d99a-goog
> >
