Return-path: <dan.carpenter@oracle.com>
Date: Thu, 4 May 2017 10:31:09 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: walter harms <wharms@bfs.de>
Cc: Guenter Roeck <linux@roeck-us.net>,
        Samuel Mendoza-Jonas <sam@mendozajonas.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] hwmon: (pmbus) Add missing break statements
Message-ID: <20170504073109.b2etej6kg3dzt4vb@mwanda>
References: <20170503193140.zbxcdgda7k3rnr2m@mwanda>
 <590AD813.6030805@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <590AD813.6030805@bfs.de>
List-ID: <linux-hwmon@vger.kernel.org>

On Thu, May 04, 2017 at 09:28:19AM +0200, walter harms wrote:
> 
> 
> Am 03.05.2017 21:31, schrieb Dan Carpenter:
> > Static checkers complain about these missing break statements.
> > 
> > Fixes: 6eaaea144dc5 ("hwmon: (pmbus) Add client driver for IR35221")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > diff --git a/drivers/hwmon/pmbus/ir35221.c b/drivers/hwmon/pmbus/ir35221.c
> > index cc7b3b542531..00e4a1e264e2 100644
> > --- a/drivers/hwmon/pmbus/ir35221.c
> > +++ b/drivers/hwmon/pmbus/ir35221.c
> > @@ -129,6 +129,7 @@ static int ir35221_read_word_data(struct i2c_client *client, int page, int reg)
> >  	case PMBUS_IIN_OC_WARN_LIMIT:
> >  		ret = pmbus_read_word_data(client, page, reg);
> >  		ret = ir35221_scale_result(ret, -1, PSC_CURRENT_IN);
> > +		break;
> >  	case PMBUS_READ_VIN:
> >  		ret = pmbus_read_word_data(client, page, PMBUS_READ_VIN);
> >  		ret = ir35221_scale_result(ret, -5, PSC_VOLTAGE_IN);
> 
> Just a remark:
> the naming of the variable for pmbus_read_word_data() is unfortunate.
> It would be nice to have it like below: val
> 

Yeah.  I thought so too.

regards,
dan carpenter
