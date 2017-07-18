Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:57357 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751358AbdGRExu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 18 Jul 2017 00:53:50 -0400
Date: Mon, 17 Jul 2017 21:53:42 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tony O'Brien <Tony.OBrien@alliedtelesis.co.nz>
Cc: "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] hwmon: (lm75) Add a basic interrupt handler
Message-ID: <20170718045342.GA25051@roeck-us.net>
References: <20170712025237.24163-1-tony.obrien@alliedtelesis.co.nz>
 <fa3c3cb3-c71d-7118-9d48-7002e1788f99@roeck-us.net>
 <1500241884428.47941@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1500241884428.47941@alliedtelesis.co.nz>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sun, Jul 16, 2017 at 09:51:24PM +0000, Tony O'Brien wrote:
> Hi Guenter -
> 
> The interrupt line the LM75 sits on is shared by other devices and therefore cannot be disabled.  It was added in hardware as a possible feature can cannot be disconnected.
> 

Ah yes, it is declared as shared, which makes me slightly uncomfortable.
Any chance that this (and TRIGGER_LOW) can be specified in devicetree ?

Sorry if I am annoying, but this is a generic driver, and I would like
to prevent bad surprises if possible.

Thanks,
Guenter

> Cheers,
> 
> Tony O'Brien
> Senior Software/Hardware Engineer
> Allied Telesis Labs
> 27 Nazareth Avenue
> Christchurch 8024
> New Zealand
> Ph: +64-3-339 3000
> DDI: +64-3-339 9210
> Web: http://AlliedTelesis.com
> 
> 
> 
> ________________________________________
> From: Guenter Roeck <linux@roeck-us.net>
> Sent: Sunday, 16 July 2017 12:42 p.m.
> To: Tony O'Brien; jdelvare@suse.com; linux-hwmon@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH] hwmon: (lm75) Add a basic interrupt handler
> 
> On 07/11/2017 07:52 PM, Tony O'Brien wrote:
> > The LM75 interrupt cannot be masked in the device so an over-temperature
> > event can cause an interrupt that cannot be cleared.
> > Add an interrupt handler if an interrupt node exists in the DTS for an
> > LM75.  The handler simply reads a device register to clear the interrupt
> > and returns.
> >
> 
> Is this an actual problem ? If no interrupt handler is registered, the interrupt
> should be disabled by the interrupt controller, and it should not matter if
> the interrupt line from the chip is active or not.
> 
> Thanks,
> Guenter
> 
> > Signed-off-by: Tony O'Brien <tony.obrien@alliedtelesis.co.nz>
> > Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> > ---
> >   drivers/hwmon/lm75.c | 28 ++++++++++++++++++++++++++++
> >   drivers/hwmon/lm75.h |  1 +
> >   2 files changed, 29 insertions(+)
> >
> > diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
> > index 005ffb5ffa92..08a833e960aa 100644
> > --- a/drivers/hwmon/lm75.c
> > +++ b/drivers/hwmon/lm75.c
> > @@ -22,6 +22,7 @@
> >   #include <linux/init.h>
> >   #include <linux/slab.h>
> >   #include <linux/jiffies.h>
> > +#include <linux/interrupt.h>
> >   #include <linux/i2c.h>
> >   #include <linux/hwmon.h>
> >   #include <linux/hwmon-sysfs.h>
> > @@ -265,6 +266,17 @@ static void lm75_remove(void *data)
> >       i2c_smbus_write_byte_data(client, LM75_REG_CONF, lm75->orig_conf);
> >   }
> >
> > +static irqreturn_t lm75_process_interrupt(int irq, void *data)
> > +{
> > +     struct i2c_client *client = (struct i2c_client *)data;
> > +     int val;
> > +
> > +     /* Do a read to clear the interrupt */
> > +     val = i2c_smbus_read_byte_data(client, LM75_REG_CONF);
> > +
> > +     return IRQ_HANDLED;
> > +}
> > +
> >   static int
> >   lm75_probe(struct i2c_client *client, const struct i2c_device_id *id)
> >   {
> > @@ -275,6 +287,7 @@ lm75_probe(struct i2c_client *client, const struct i2c_device_id *id)
> >       u8 set_mask, clr_mask;
> >       int new;
> >       enum lm75_type kind;
> > +     int ret;
> >
> >       if (client->dev.of_node)
> >               kind = (enum lm75_type)of_device_get_match_data(&client->dev);
> > @@ -375,6 +388,21 @@ lm75_probe(struct i2c_client *client, const struct i2c_device_id *id)
> >               break;
> >       }
> >
> > +     if (client->irq) {
> > +             /* If requesting an interrupt then set to interrupt mode */
> > +             set_mask |= LM75_MODE_INTERRUPT;
> > +             ret = devm_request_threaded_irq(dev, client->irq, NULL,
> > +                                             lm75_process_interrupt,
> > +                                             IRQF_TRIGGER_LOW | IRQF_ONESHOT |
> > +                                                     IRQF_SHARED,
> > +                                             dev_name(dev),
> > +                                             client);
> > +             if (ret) {
> > +                     dev_err(dev, "Error requesting irq\n");
> > +                     return ret;
> > +             }
> > +     }
> > +
> >       /* configure as specified */
> >       status = i2c_smbus_read_byte_data(client, LM75_REG_CONF);
> >       if (status < 0) {
> > diff --git a/drivers/hwmon/lm75.h b/drivers/hwmon/lm75.h
> > index 5cde94e56f17..82a71d870331 100644
> > --- a/drivers/hwmon/lm75.h
> > +++ b/drivers/hwmon/lm75.h
> > @@ -31,6 +31,7 @@
> >   #define LM75_TEMP_MIN (-55000)
> >   #define LM75_TEMP_MAX 125000
> >   #define LM75_SHUTDOWN 0x01
> > +#define LM75_MODE_INTERRUPT 0x02
> >
> >   /* TEMP: 0.001C/bit (-55C to +125C)
> >      REG: (0.5C/bit, two's complement) << 7 */
> >
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
