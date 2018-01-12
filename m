Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:33889 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964967AbeALSpp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 12 Jan 2018 13:45:45 -0500
Received: by mail-wm0-f68.google.com with SMTP id 81so3582359wmb.1
        for <linux-hwmon@vger.kernel.org>; Fri, 12 Jan 2018 10:45:44 -0800 (PST)
Date: Fri, 12 Jan 2018 19:45:40 +0100
From: Emiliano Ingrassia <ingrassia@epigenesys.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: sht3x: wait predefined limits loading complete
 before access
Message-ID: <20180112184540.GA30138@ingrassia.epigenesys.com>
References: <20180112172901.GA15784@ingrassia.epigenesys.com>
 <20180112182051.GA15480@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180112182051.GA15480@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Guenter,

thanks for the patch review.

On Fri, Jan 12, 2018 at 10:20:51AM -0800, Guenter Roeck wrote:
> On Fri, Jan 12, 2018 at 06:29:01PM +0100, Emiliano Ingrassia wrote:
> > An sht3x sensor include limits register which contains temperature
> > and humidity limit values. After a reset, pre-defined values are loaded
> > into that register. During the probe function, the driver reads the
> > limits register. However, if the reads are made too early, for example
> > because the I2C bus frequency is high (e.g. 400 kHz), the loading could be
> > not completed and the sensor returns a NACK which causes the probe to fail.
> > A delay of 500 us before the first read solves this issue.
> > 
> > Signed-off-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
> > ---
> >  drivers/hwmon/sht3x.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/hwmon/sht3x.c b/drivers/hwmon/sht3x.c
> > index 6ea99cd6ae79..cec06b76656e 100644
> > --- a/drivers/hwmon/sht3x.c
> > +++ b/drivers/hwmon/sht3x.c
> > @@ -732,6 +732,8 @@ static int sht3x_probe(struct i2c_client *client,
> >  	mutex_init(&data->i2c_lock);
> >  	mutex_init(&data->data_lock);
> >  
> > +	udelay(500);
> > +
> 
> Why is it necessary to perform an active wait, ie why don't you use
> usleep_range() ? Please explain.
>

Ok, I'll correct the patch to use usleep_range. Actually I think I'll
use the same value for min and max because the 500 us was obtained
empirically. Do you have any information about the limits loading time ?
I can't find it on the sht3x and alert datasheets.

> Also, please add a comment into the code, describing why the delay
> is necessary.
>

Ok. Did you have any experience with this issue? We're experimenting
this on a BeagleBone Black on a i2c bus clocked at 400 kHz.
The issue disappears clocking it at 50 kHz.

> Thanks,
> Guenter

Regards,

Emiliano
