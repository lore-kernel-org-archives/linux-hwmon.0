Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:43920 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932554AbcLHSPo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 8 Dec 2016 13:15:44 -0500
Date: Thu, 8 Dec 2016 10:14:53 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Jean Delvare <jdelvare@suse.de>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 08/17] hwmon: (adt7470) Fix overflows seen when writing
 into limit attributes
Message-ID: <20161208181453.GA27562@roeck-us.net>
References: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
 <1480913740-5678-8-git-send-email-linux@roeck-us.net>
 <20161208161406.700a07ea@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161208161406.700a07ea@endymion>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Dec 08, 2016 at 04:14:06PM +0100, Jean Delvare wrote:
> On Sun,  4 Dec 2016 20:55:31 -0800, Guenter Roeck wrote:
> > Fix overflows seen when writing large values into various temperature limit
> > attributes.
> > 
> > The input value passed to DIC_ROUND_CLOSEST() needs to be clamped to avoid
> > such overflows.
> > 
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > ---
> >  drivers/hwmon/adt7470.c | 9 +++------
> >  1 file changed, 3 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
> > index 6e60ca53406e..8996120b8170 100644
> > --- a/drivers/hwmon/adt7470.c
> > +++ b/drivers/hwmon/adt7470.c
> > @@ -483,8 +483,7 @@ static ssize_t set_temp_min(struct device *dev,
> >  	if (kstrtol(buf, 10, &temp))
> >  		return -EINVAL;
> >  
> > -	temp = DIV_ROUND_CLOSEST(temp, 1000);
> > -	temp = clamp_val(temp, -128, 127);
> > +	temp = DIV_ROUND_CLOSEST(clamp_val(temp, -128000, 127000), 1000);
> >  
> >  	mutex_lock(&data->lock);
> >  	data->temp_min[attr->index] = temp;
> > @@ -517,8 +516,7 @@ static ssize_t set_temp_max(struct device *dev,
> >  	if (kstrtol(buf, 10, &temp))
> >  		return -EINVAL;
> >  
> > -	temp = DIV_ROUND_CLOSEST(temp, 1000);
> > -	temp = clamp_val(temp, -128, 127);
> > +	temp = DIV_ROUND_CLOSEST(clamp_val(temp, -128000, 127000), 1000);
> >  
> >  	mutex_lock(&data->lock);
> >  	data->temp_max[attr->index] = temp;
> > @@ -880,8 +878,7 @@ static ssize_t set_pwm_tmin(struct device *dev,
> >  	if (kstrtol(buf, 10, &temp))
> >  		return -EINVAL;
> >  
> > -	temp = DIV_ROUND_CLOSEST(temp, 1000);
> > -	temp = clamp_val(temp, -128, 127);
> > +	temp = DIV_ROUND_CLOSEST(clamp_val(temp, -128000, 127000), 1000);
> >  
> >  	mutex_lock(&data->lock);
> >  	data->pwm_tmin[attr->index] = temp;
> 
> Seems more readable on 2 lines, but other than this:
> 
You are right. Split into two lines.

> Reviewed-by: Jean Delvare <jdelvare@suse.de>
> 
Thanks a lot for the review!

Guenter
