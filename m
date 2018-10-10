Return-Path: <kunyi@google.com>
Return-path: <kunyi@google.com>
MIME-Version: 1.0
References: <20181008214925.86281-1-kunyi@google.com> <20181010003832.GA21971@roeck-us.net>
In-Reply-To: <20181010003832.GA21971@roeck-us.net>
From: Kun Yi <kunyi@google.com>
Date: Tue, 9 Oct 2018 20:55:19 -0700
Message-ID: <CAGMNF6WC054KEMk-cOwEUoLzWEq4wpfCXAwDzsvLDWZpWsqzTw@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (npcm-750-pwm-fan): Change initial pwm target to 255
To: Guenter Roeck <linux@roeck-us.net>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, jdelvare@suse.com,
	OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-hwmon@vger.kernel.org,
	Robert Lippert <rlippert@google.com>, Benjamin Fair <benjaminfair@google.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-hwmon@vger.kernel.org>

Great, thanks!

On Tue, Oct 9, 2018 at 5:38 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Mon, Oct 08, 2018 at 02:49:25PM -0700, Kun Yi wrote:
> > Change initial PWM target to 255 to prevent overheating, for example
> > when BMC hangs in userspace or when userspace fan control application is
> > not implemented yet.
> >
> > Signed-off-by: Kun Yi <kunyi@google.com>
>
> Makes sense to me, and in line with other drivers. Applied to hwmon-next.
>
> Thanks,
> Guenter
>
> > ---
> >  drivers/hwmon/npcm750-pwm-fan.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/hwmon/npcm750-pwm-fan.c b/drivers/hwmon/npcm750-pwm-fan.c
> > index 96634fd54e0b..c0fab54c0094 100644
> > --- a/drivers/hwmon/npcm750-pwm-fan.c
> > +++ b/drivers/hwmon/npcm750-pwm-fan.c
> > @@ -52,7 +52,7 @@
> >
> >  /* Define the Counter Register, value = 100 for match 100% */
> >  #define NPCM7XX_PWM_COUNTER_DEFAULT_NUM              255
> > -#define NPCM7XX_PWM_CMR_DEFAULT_NUM          127
> > +#define NPCM7XX_PWM_CMR_DEFAULT_NUM          255
> >  #define NPCM7XX_PWM_CMR_MAX                  255
> >
> >  /* default all PWM channels PRESCALE2 = 1 */



-- 
Regards,
Kun
