Return-Path: <nicoleotsuka@gmail.com>
Return-path: <nicoleotsuka@gmail.com>
Date: Wed, 17 Oct 2018 13:15:02 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] hwmon: (core) Inherit power properties to hdev
Message-ID: <20181017201501.GA15941@Asurada-Nvidia.nvidia.com>
References: <20181017012426.26958-1-nicoleotsuka@gmail.com>
 <20181017012426.26958-2-nicoleotsuka@gmail.com>
 <20181017194430.GA6812@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181017194430.GA6812@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

On Wed, Oct 17, 2018 at 12:44:30PM -0700, Guenter Roeck wrote:

> > +	hdev->driver = dev->driver;
> > +	hdev->power = dev->power;
> > +	hdev->pm_domain = dev->pm_domain;
> 
> dev can, unfortunately, be NULL
> 
> >  	hdev->of_node = dev ? dev->of_node : NULL;
> 
> ... as you can see here.

Oops..will fix it.

Thanks!

> 
> Guenter
> 
> >  	hwdev->chip = chip;
> >  	dev_set_drvdata(hdev, drvdata);
> > -- 
> > 2.17.1
> > 
