Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:33602 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726433AbeJYCXF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 24 Oct 2018 22:23:05 -0400
Date: Wed, 24 Oct 2018 10:54:00 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: linux@roeck-us.net
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] hwmon: (ina3221) Make sure data is ready before
 reading
Message-ID: <20181024175400.GA6374@Asurada-Nvidia.nvidia.com>
References: <20181024023623.4231-1-nicoleotsuka@gmail.com>
 <20181024023623.4231-5-nicoleotsuka@gmail.com>
 <20181024091035.Horde.F-g3MefpEv95EQd6w9-rB3D@cp2.active-venture.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181024091035.Horde.F-g3MefpEv95EQd6w9-rB3D@cp2.active-venture.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Oct 24, 2018 at 09:10:35AM +0000, linux@roeck-us.net wrote:
> > @@ -150,6 +183,12 @@ static int ina3221_read_in(struct device *dev, u32
> > attr, int channel, long *val)
> >  		if (!ina3221_is_enabled(ina, channel))
> >  			return -ENODATA;
> > 
> > +		ret = ina3221_wait_for_data(ina);
> > +		if (ret) {
> > +			dev_err(dev, "Timed out at waiting for CVRF bit\n");
> > +			return ret;
> > +		}
> 
> Thanks for explaining why we can't just blindly wait.
> However, I am concerned about this log message: If something is wrong
> with the chip, this will spam the kernel log. Can you drop the message
> here and below ? After all, the error will be reported to userspace,
> and a kernel log message should not be necessary.

Will do that.

Thanks
Nicolin

> 
> Thanks,
> Guenter
> 
> > +
> >  		ret = ina3221_read_value(ina, reg, &regval);
> >  		if (ret)
> >  			return ret;
> > @@ -189,6 +228,13 @@ static int ina3221_read_curr(struct device *dev,
> > u32 attr,
> >  	case hwmon_curr_input:
> >  		if (!ina3221_is_enabled(ina, channel))
> >  			return -ENODATA;
> > +
> > +		ret = ina3221_wait_for_data(ina);
> > +		if (ret) {
> > +			dev_err(dev, "Timed out at waiting for CVRF bit\n");
> > +			return ret;
> > +		}
> > +
> >  		/* fall through */
> >  	case hwmon_curr_crit:
> >  	case hwmon_curr_max:
> > --
> > 2.17.1
> 
> 
> 
