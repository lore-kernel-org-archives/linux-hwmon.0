Return-path: <jdelvare@suse.de>
Date: Thu, 21 Jul 2016 08:10:46 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Matt Ranostay <mranostay@gmail.com>
Cc: linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, David
 Frey <david.frey@sensirion.com>
Subject: Re: [PATCH] hwmon: sht3x: set initial jiffies to last_update
Message-ID: <20160721081046.0f658c18@endymion>
In-Reply-To: <CAKzfze82xFRU6A09rXS3OhtLU99cZt_2waRcFGvTgWbx9huZLA@mail.gmail.com>
References: <1467945971-23798-1-git-send-email-mranostay@gmail.com>
 <1467964564.3225.12.camel@chaos.suse>
 <CAKzfze82xFRU6A09rXS3OhtLU99cZt_2waRcFGvTgWbx9huZLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

Hi Matt,

On Fri, 8 Jul 2016 17:22:10 -0700, Matt Ranostay wrote:
> On Fri, Jul 8, 2016 at 12:56 AM, Jean Delvare <jdelvare@suse.de> wrote:
> > On jeu., 2016-07-07 at 19:46 -0700, Matt Ranostay wrote:
> >> Handling the wraparound requires the data->last_update to be set to an
> >> initial jiffies value. Otherwise you can start in a state where the
> >> sensor will never request a reading.
> >
> > I can't see how. As I read the code, in the worst case, readings can be
> > blocked for interval_ms (2 seconds maximum.)
> 
> On 64-bit systems this is never an issue because the jiffies counter
> will never wrap around.
> 
> But my system is a 32-bit ARM core, so the the kernel sets the initial
> value to 0xfffb6c20 so it will wrap around in 5 minutes to find buggy
> code.
> 
> So looking at time_after(0xfffb6c20, 0) will return false always till
> it finally rolls over.

I've always been confused by how jiffies wrapping is handled. So I
tested it, and you are correct.

> >> Cc: Guenter Roeck <linux@roeck-us.net>
> >> Cc: David Frey <david.frey@sensirion.com>
> >> Signed-off-by: Matt Ranostay <mranostay@gmail.com>
> >> ---
> >>  drivers/hwmon/sht3x.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
> >> index 450645b6053d..05a925257938 100644
> >> --- a/drivers/hwmon/sht3x.c
> >> +++ b/drivers/hwmon/sht3x.c
> >> @@ -722,7 +722,7 @@ static int sht3x_probe(struct i2c_client *client,
> >>       data->setup.blocking_io = false;
> >>       data->setup.high_precision = true;
> >>       data->mode = 0;
> >> -     data->last_update = 0;
> >> +     data->last_update = jiffies;
> >>       data->client = client;
> >>       crc8_populate_msb(sht3x_crc8_table, SHT3X_CRC8_POLYNOMIAL);
> >>
> >
> > Both look equally wrong to me. With your proposal, accessing the sysfs
> > attributes right after loading the driver will not trigger a reading.
> >
> > In order to guarantee that the first access will trigger a reading,
> > data->last_update should be initialized to jiffies -
> > msecs_to_jiffies(2000) (the maximum interval value.)
> 
> Ok that is fine.  Rather do  jiffies + (2 * HZ)

2 * HZ is fine. But it's minus, not plus. You want to initialize the
last update time to 2 seconds BEFORE the driver is being loaded, so
that the current time is at least 2 seconds AFTER the (fake) last
update at first access. And you should subtract another jiffy to be on
the safe side.

Can you please send an updated patch?

-- 
Jean Delvare
SUSE L3 Support
