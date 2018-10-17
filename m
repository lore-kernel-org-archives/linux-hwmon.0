Return-Path: <nicoleotsuka@gmail.com>
Return-path: <nicoleotsuka@gmail.com>
Date: Wed, 17 Oct 2018 13:53:48 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] hwmon: (ina3221) Make sure data is ready after
 channel enabling
Message-ID: <20181017205348.GC15941@Asurada-Nvidia.nvidia.com>
References: <20181017012426.26958-1-nicoleotsuka@gmail.com>
 <20181017012426.26958-5-nicoleotsuka@gmail.com>
 <20181017165543.GA22822@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181017165543.GA22822@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

Hello Guenter,

On Wed, Oct 17, 2018 at 09:55:43AM -0700, Guenter Roeck wrote:
> > @@ -676,6 +701,13 @@ static int __maybe_unused ina3221_resume(struct device *dev)
> >  	if (ret)
> >  		return ret;
> >  
> > +	/* Make sure data conversion is finished */
> > +	ret = ina3221_wait_for_data_if_active(ina);
> 
> This is quite expensive and would delay resume (and enable, for that matter).
> A less expensive solution would be to save the enable time here and in
> ina3221_write_enable(). ina3221_wait_for_data_if_active() can then be called
> from read functions and would wait if not enough time has expired.
> 
> 	if (time_before(...))
> 		usleep_range(missing wait time, missing_wait_time * 2);
> 
> or something like that. This could be done per channel or, to keep
> things simple, just using a single time for all channels.

I was thinking something that'd fit one-shot mode too so decided
to add a polling. But you are right. It does make sense to skip
polling until an actual read happens, though it also feels a bit
reasonable to me that putting a polling to the enabling routine.

The wait time would be sightly more complicated than the polling
actually, as it needs to involve total conversion time which may
vary depending on the number of enabled channels. I will see what
would be safer and easier and apply that in v2.

Thanks
Nicolin
