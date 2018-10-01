Return-Path: <nicoleotsuka@gmail.com>
Return-path: <nicoleotsuka@gmail.com>
Date: Sun, 30 Sep 2018 20:15:35 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, afd@ti.com, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] hwmon: ina3221: Add suspend and resume functions
Message-ID: <20181001031534.GA4428@Asurada>
References: <20180929214407.27208-1-nicoleotsuka@gmail.com>
 <20180929214407.27208-4-nicoleotsuka@gmail.com>
 <20180930152749.GA16746@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180930152749.GA16746@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

On Sun, Sep 30, 2018 at 08:27:49AM -0700, Guenter Roeck wrote:

> >  static int ina3221_read_value(struct ina3221_data *ina, unsigned int reg,
> > @@ -415,9 +419,67 @@ static int ina3221_probe(struct i2c_client *client,
> >  		return PTR_ERR(hwmon_dev);
> >  	}
> >  
> > +	dev_set_drvdata(dev, ina);
> > +
> 
> It is better to call that function before registering the hwmon device,
> to avoid the theroretical possibility that suspend is called before drvdata
> is set. I moved the call accordingly.

Oh..I see. Another lesson learned. Thank you for the fix!
