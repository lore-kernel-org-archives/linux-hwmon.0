Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88AE5C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 29 Apr 2022 09:52:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356873AbiD2Jzg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 29 Apr 2022 05:55:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232073AbiD2Jze (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 29 Apr 2022 05:55:34 -0400
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7108A274
        for <linux-hwmon@vger.kernel.org>; Fri, 29 Apr 2022 02:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1651225937;
  x=1682761937;
  h=date:to:cc:subject:message-id:references:mime-version:
   content-transfer-encoding:in-reply-to:from;
  bh=3tv51TYQ0Y4lu5ONjuF0LUJfYgcFddxxp1UO9fKOJak=;
  b=EWwKa0QSORCRKddvhi3eYapCZpw8Y+U2afuoh37mPaF3SS4qUKMdqk38
   vIGyb8XlDt8bTAdC4t5q5zJA4bwOUE/44Rdx4kR7vaj6ea1z2UVR3F/yo
   XwqIzVVGyo+rVypMF7QK2qOE4xonXfvrZhkwForqtG9WS9QlIQk2QH2CL
   QRNlE3hJMwK4UM0EiFNQeGQeS9Z6GBbovLqG4Tf2E457N8KO+ecWinZIv
   yy7qF1BulT1UGUmTWRxLYwORamEL9GoEv+McR3eCdPTFvQ98Sa4jWr91N
   AP9JBq05JOuv3Kt+WqXfXT4D27NshdWF61wSkcJk2Gzdbu23P5JKpHUmW
   A==;
Date:   Fri, 29 Apr 2022 11:52:15 +0200
To:     Guenter Roeck <linux@roeck-us.net>
CC:     =?iso-8859-1?Q?M=E5rten?= Lindahl <Marten.Lindahl@axis.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        kernel <kernel@axis.com>
Subject: Re: [PATCH v4 4/4] hwmon: (pmbus) Add get_voltage/set_voltage ops
Message-ID: <Ymu1T/kykl0FwL3j@axis.com>
References: <20220428144039.2464667-1-marten.lindahl@axis.com>
 <20220428144039.2464667-5-marten.lindahl@axis.com>
 <6cc1561c-c4dc-076d-d9bf-1cc1cc60eac4@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6cc1561c-c4dc-076d-d9bf-1cc1cc60eac4@roeck-us.net>
From:   Marten Lindahl <martenli@axis.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Apr 28, 2022 at 06:49:21PM +0200, Guenter Roeck wrote:
> On 4/28/22 07:40, Mårten Lindahl wrote:
> > The pmbus core does not have operations for getting or setting voltage.
> > Add functions get/set voltage for the dynamic regulator framework.
> > 
> > Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>
> > ---
> >   drivers/hwmon/pmbus/pmbus_core.c | 63 ++++++++++++++++++++++++++++++++
> >   1 file changed, 63 insertions(+)
> > 
> > diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> > index bd143ca0c320..fe7dbb496e3b 100644
> > --- a/drivers/hwmon/pmbus/pmbus_core.c
> > +++ b/drivers/hwmon/pmbus/pmbus_core.c
> > @@ -1531,6 +1531,11 @@ static const struct pmbus_sensor_attr voltage_attributes[] = {
> >   		.gbit = PB_STATUS_VOUT_OV,
> >   		.limit = vout_limit_attrs,
> >   		.nlimit = ARRAY_SIZE(vout_limit_attrs),
> > +	}, {
> > +		.reg = PMBUS_VOUT_COMMAND,
> > +		.class = PSC_VOLTAGE_OUT,
> > +		.paged = true,
> > +		.func = PMBUS_HAVE_VOUT,
> >   	}
> 
> Ok, you lost me here. This adds an inX_input attribute. Why ? This is completely
> unrelated to the intended scope of this patch. It also doesn't report a measured
> voltage, but a configuration value. If anything, it would have to be a separate
> patch, and you'd have to argue hard why it makes sense to report it as measured
> voltage.

I see. The reason for adding this is as simple as I now understand it is wrong.
Please remember, my first version of the set/get_voltage functions where hardcoded
with L16 input/output. Then in order to use the already existing convertion functions
pmbus_data2reg and pmbus_reg2data I added this only for the need of a sensor object,
as those functions are tailored for a sensor object.

So now I have to ask you for advice. Should I use the existing convertion
functions, or do you suggest new variants of them? If reusing them, I guess I have
two options:
 1: Modify them to take class, page, and data outside of a sensor object as input.
 2: Use them as they are, but create a local 'dummy' sensor object with class, page,
    and data to use when calling the convertion functions.

I hope I made it more clear for you now how I was thinking. There is
absolutely no intention of having sensor inX_input attributes for
reading the setpoint values. This was just an unwanted sideeffect, and I
will glady remove it again.
> 
> >   };
> >   
> > @@ -2563,11 +2568,69 @@ static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned
> >   	return 0;
> >   }
> >   
> > +static int pmbus_regulator_get_voltage(struct regulator_dev *rdev)
> > +{
> > +	struct device *dev = rdev_get_dev(rdev);
> > +	struct i2c_client *client = to_i2c_client(dev->parent);
> > +	struct pmbus_data *data = i2c_get_clientdata(client);
> > +	struct pmbus_sensor *sensor;
> > +	u8 page = rdev_get_id(rdev);
> > +	int ret;
> > +
> > +	sensor = pmbus_find_sensor(data, page, PMBUS_READ_VOUT);
> > +	if (IS_ERR(sensor))
> > +		return -ENODATA;
> > +
> > +	mutex_lock(&data->update_lock);
> > +	pmbus_update_sensor_data(client, sensor);
> > +	if (sensor->data < 0)
> > +		ret = sensor->data;
> > +	else
> > +		ret = (int)pmbus_reg2data(data, sensor) * 1000; /* unit is uV */
> > +	mutex_unlock(&data->update_lock);
> > +
> 
> Same question. Why ?

Same reason as above. Only to get the sensor object for pmbus_reg2data.

> 
> > +	return ret;
> > +}
> > +
> > +static int pmbus_regulator_set_voltage(struct regulator_dev *rdev, int min_uV,
> > +					 int max_uV, unsigned int *selector)
> > +{
> > +	struct device *dev = rdev_get_dev(rdev);
> > +	struct i2c_client *client = to_i2c_client(dev->parent);
> > +	struct pmbus_data *data = i2c_get_clientdata(client);
> > +	struct pmbus_sensor *sensor;
> > +	u8 page = rdev_get_id(rdev);
> > +	s64 tmp = DIV_ROUND_CLOSEST_ULL(min_uV, 1000); /* convert to mV */
> > +	u16 val;
> > +	int ret;
> > +	*selector = 0;
> > +
> > +	sensor = pmbus_find_sensor(data, page, PMBUS_VOUT_COMMAND);
> > +	if (IS_ERR(sensor))
> > +		return -ENODATA;
> > +
> > +	ret = _pmbus_read_word_data(client, page, 0xff, PMBUS_VOUT_MARGIN_LOW);
> > +	if (ret < 0)
> > +		return ret;
> > +
> That actually makes me wonder: What about VOUT_MARGIN_HIGH ?

Ok, I will add a check for VOUT_MARGIN_HIGH also.

> Also, there are optional MFR_VOUT_MIN and MFR_VOUT_MAX registers.
> Would it possibly make sense to determine the valid range once
> during probe and then compare against it ?

Maybe this could be a good thing, so that we don't need to read both
margins every time. But I guess that would need a new kind of page list
with margins added to the pmbus_driver_info struct?
I would prefer to make that change in a separate patch if it's ok with
you?

Kind regards
Mårten
> 
> Thanks,
> Guenter
> 
> > +	val = pmbus_data2reg(data, sensor, tmp);
> > +
> > +	/* Do not fall shorter than low margin */
> > +	if (ret > val)
> > +		val = ret;
> > +
> > +	ret = _pmbus_write_word_data(client, page, PMBUS_VOUT_COMMAND, val);
> > +
> > +	return ret;
> > +}
> > +
> >   const struct regulator_ops pmbus_regulator_ops = {
> >   	.enable = pmbus_regulator_enable,
> >   	.disable = pmbus_regulator_disable,
> >   	.is_enabled = pmbus_regulator_is_enabled,
> >   	.get_error_flags = pmbus_regulator_get_error_flags,
> > +	.get_voltage = pmbus_regulator_get_voltage,
> > +	.set_voltage = pmbus_regulator_set_voltage,
> >   };
> >   EXPORT_SYMBOL_NS_GPL(pmbus_regulator_ops, PMBUS);
> >   
> 
