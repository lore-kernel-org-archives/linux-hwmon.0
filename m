Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f194.google.com ([209.85.215.194]:40538 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726412AbeJRFOs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 18 Oct 2018 01:14:48 -0400
Date: Wed, 17 Oct 2018 14:17:14 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] hwmon: (ina3221) Make sure data is ready after
 channel enabling
Message-ID: <20181017211714.GB10990@roeck-us.net>
References: <20181017012426.26958-1-nicoleotsuka@gmail.com>
 <20181017012426.26958-5-nicoleotsuka@gmail.com>
 <20181017165543.GA22822@roeck-us.net>
 <20181017205348.GC15941@Asurada-Nvidia.nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181017205348.GC15941@Asurada-Nvidia.nvidia.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Oct 17, 2018 at 01:53:48PM -0700, Nicolin Chen wrote:
> Hello Guenter,
> 
> On Wed, Oct 17, 2018 at 09:55:43AM -0700, Guenter Roeck wrote:
> > > @@ -676,6 +701,13 @@ static int __maybe_unused ina3221_resume(struct device *dev)
> > >  	if (ret)
> > >  		return ret;
> > >  
> > > +	/* Make sure data conversion is finished */
> > > +	ret = ina3221_wait_for_data_if_active(ina);
> > 
> > This is quite expensive and would delay resume (and enable, for that matter).
> > A less expensive solution would be to save the enable time here and in
> > ina3221_write_enable(). ina3221_wait_for_data_if_active() can then be called
> > from read functions and would wait if not enough time has expired.
> > 
> > 	if (time_before(...))
> > 		usleep_range(missing wait time, missing_wait_time * 2);
> > 
> > or something like that. This could be done per channel or, to keep
> > things simple, just using a single time for all channels.
> 
> I was thinking something that'd fit one-shot mode too so decided
> to add a polling. But you are right. It does make sense to skip
> polling until an actual read happens, though it also feels a bit
> reasonable to me that putting a polling to the enabling routine.
> 
> The wait time would be sightly more complicated than the polling
> actually, as it needs to involve total conversion time which may
> vary depending on the number of enabled channels. I will see what
> would be safer and easier and apply that in v2.
> 
It isn't that complex; we have done it in other drivers. It is less
costly and has less overhead than extra i2c read operation(s).

Thanks,
Guenter
