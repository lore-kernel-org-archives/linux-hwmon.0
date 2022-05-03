Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C02C3C433F5
	for <linux-hwmon@archiver.kernel.org>; Tue,  3 May 2022 10:14:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231240AbiECKST (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 3 May 2022 06:18:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231584AbiECKSS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 3 May 2022 06:18:18 -0400
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D844137A0B
        for <linux-hwmon@vger.kernel.org>; Tue,  3 May 2022 03:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1651572886;
  x=1683108886;
  h=date:to:cc:subject:message-id:references:mime-version:
   content-transfer-encoding:in-reply-to:from;
  bh=gX+cCHrPSsv/JBA0Z6cdIimNgLTgDfhHPyiuPFO+XCQ=;
  b=GlbF9tsVH6glCJjrL/3mED5y3j56k5wPPNTjArk8Nt81f1D6jsUTP+Xe
   ZQoED50eFkGcsUGEoSo9Uxk5b6Ofy0jpw0yQg++5/0dmkMOPrOx5Ixzkb
   pEmMx59nNcJunsJb5d3Hsjdh79sBqs+x8+C9gxVnuQ7/0SeT5jKdpb5Ke
   KrPBzUqVz7GErrjY8upsSc7OXbU/1ujICCcboJWn6qz6HrlGUVSUx/1g5
   cbmV5u9j9WHbOBZmn0fXZcLDm4gxC7UFingv4/b5RymWXTPMqohimtSzH
   LkSY9EEZb1s4uySUwpMHe5e5m+vX2WqdEeOsD+vhkfbpopYOFyEBt4Nqn
   w==;
Date:   Tue, 3 May 2022 12:14:43 +0200
To:     Guenter Roeck <linux@roeck-us.net>
CC:     =?iso-8859-1?Q?M=E5rten?= Lindahl <Marten.Lindahl@axis.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        kernel <kernel@axis.com>
Subject: Re: [PATCH v5 4/4] hwmon: (pmbus) Add get_voltage/set_voltage ops
Message-ID: <YnEAkxim7/7efhKK@axis.com>
References: <20220502111345.3100970-1-marten.lindahl@axis.com>
 <20220502111345.3100970-5-marten.lindahl@axis.com>
 <0edfd625-8e73-b739-16be-7818f2918fa6@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0edfd625-8e73-b739-16be-7818f2918fa6@roeck-us.net>
From:   Marten Lindahl <martenli@axis.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, May 02, 2022 at 06:48:25PM +0200, Guenter Roeck wrote:
> On 5/2/22 04:13, Mårten Lindahl wrote:
> > The pmbus core does not have operations for getting or setting voltage.
> > Add functions get/set voltage for the dynamic regulator framework.
> > 
> > Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>
> > ---
> >   drivers/hwmon/pmbus/pmbus_core.c | 63 ++++++++++++++++++++++++++++++++
> >   1 file changed, 63 insertions(+)
> > 
> > diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> > index bd143ca0c320..455d06ba5fdf 100644
> > --- a/drivers/hwmon/pmbus/pmbus_core.c
> > +++ b/drivers/hwmon/pmbus/pmbus_core.c
> > @@ -2563,11 +2563,74 @@ static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned
> >   	return 0;
> >   }
> >   
> > +static int pmbus_regulator_get_voltage(struct regulator_dev *rdev)
> > +{
> > +	struct device *dev = rdev_get_dev(rdev);
> > +	struct i2c_client *client = to_i2c_client(dev->parent);
> > +	struct pmbus_data *data = i2c_get_clientdata(client);
> > +	struct pmbus_sensor s = {
> > +		.page = rdev_get_id(rdev),
> > +		.class = PSC_VOLTAGE_OUT,
> > +		.convert = true,
> > +	};
> > +
> > +	s.data = _pmbus_read_word_data(client, s.page, 0xff, PMBUS_READ_VOUT);
> > +	if (s.data < 0)
> > +		return s.data;
> > +
> > +	return (int)pmbus_reg2data(data, &s) * 1000; /* unit is uV */
> > +}
> > +
> > +static int pmbus_regulator_set_voltage(struct regulator_dev *rdev, int min_uV,
> > +					 int max_uV, unsigned int *selector)
> 
> Just noticed: Please don't use camelCase.

Ok, I will change it. But for this I blame include/linux/regulator/driver.h:
struct regulator_ops {
	...
	/* get/set regulator voltage */
	int (*set_voltage) (struct regulator_dev *, int min_uV, int max_uV,
			    unsigned *selector);

> 
> > +{
> > +	struct device *dev = rdev_get_dev(rdev);
> > +	struct i2c_client *client = to_i2c_client(dev->parent);
> > +	struct pmbus_data *data = i2c_get_clientdata(client);
> > +	struct pmbus_sensor s = {
> > +		.page = rdev_get_id(rdev),
> > +		.class = PSC_VOLTAGE_OUT,
> > +		.convert = true,
> > +	};
> > +	s64 tmp = DIV_ROUND_CLOSEST_ULL(min_uV, 1000); /* convert to mV */
> 
> min_uV is already an int, so converting it to s64 will never be
> necessary.

True. Will change.

> 
> > +	int low = -1, high = -1;
> > +	u16 val;
> > +	*selector = 0;
> > +
> > +	if (pmbus_check_word_register(client, s.page, PMBUS_MFR_VOUT_MIN))
> > +		low = _pmbus_read_word_data(client, s.page, 0xff, PMBUS_MFR_VOUT_MIN);
> > +	if (low < 0) {
> > +		low = _pmbus_read_word_data(client, s.page, 0xff, PMBUS_VOUT_MARGIN_LOW);
> > +		if (low < 0)
> > +			return low;
> > +	}
> > +
> > +	if (pmbus_check_word_register(client, s.page, PMBUS_MFR_VOUT_MAX))
> > +		high = _pmbus_read_word_data(client, s.page, 0xff, PMBUS_MFR_VOUT_MAX);
> > +	if (high < 0) {
> > +		high = _pmbus_read_word_data(client, s.page, 0xff, PMBUS_VOUT_MARGIN_HIGH);
> > +		if (high < 0)
> > +			return high;
> > +	}
> > +
> > +	val = pmbus_data2reg(data, &s, tmp);
> > +
> > +	/* Make sure we are within margins */
> > +	if (low > val)
> > +		val = low;
> > +	if (high < val)
> > +		val = high;
> > +
> 
> The above assumes that register values are directly comparable.
> Unfortunately that isn't really the case. It happens to work
> for ULINEAR16 and DIRECT mode, but chips could also support
> IEEE-754 (maybe in the future) or VID mode.
> 
> You need to read the limits from the registers, convert to voltages,
> compare and adjust the voltage, and as final step convert the adjusted
> voltage to a register value.

Thanks. That is a good observation.

Kind regards
Mårten

> 
> Thanks,
> Guenter
