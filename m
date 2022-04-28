Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF75AC433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 28 Apr 2022 13:00:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346751AbiD1NEL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 28 Apr 2022 09:04:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346743AbiD1ND6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 28 Apr 2022 09:03:58 -0400
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C3A36B647
        for <linux-hwmon@vger.kernel.org>; Thu, 28 Apr 2022 06:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1651150841;
  x=1682686841;
  h=date:to:cc:subject:message-id:references:mime-version:
   content-transfer-encoding:in-reply-to:from;
  bh=CubIUqhcwDEzYwL+v/Vx1nlpf7CfFgFaBKaFRjJCZxQ=;
  b=C1YUxGEACki5fkpECgDm3n2LcLrCUO8lkg9OUbtm1SFY1+V6w9XdA4k7
   koTtSTxXezmm2YMnEHq7A9QHT9K9PgUIU2KmQTXSkiD541CklXIYcrKhD
   tb7a7lKhaoYXHBEGmG+P/L3CZxzeQ0nfCSMoee6mqC3TBLTu4k2hNeA2v
   ALuv22LYxOhf0B1cQjhKP6V/irNL7wgpZnMahFSoptt15IK8S/qZiXmOR
   TvdRsvW4TedsOAeHbNDyth74jP1LTgKkpBy9T/hd+0oVjaUNrZB77eI5c
   eVTZ8EXCOs2R8nAIMw8s2PjVFZ42q4DKTqU1oXxP8LGLH3yfGk8Cxg8J3
   w==;
Date:   Thu, 28 Apr 2022 15:00:38 +0200
To:     Guenter Roeck <linux@roeck-us.net>
CC:     =?iso-8859-1?Q?M=E5rten?= Lindahl <Marten.Lindahl@axis.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        kernel <kernel@axis.com>
Subject: Re: [PATCH v3 1/3] hwmon: (pmbus) Use driver specific ops if they
 exist
Message-ID: <YmqP9v0vnqA5IXP8@axis.com>
References: <20220427130213.1557793-1-marten.lindahl@axis.com>
 <20220427130213.1557793-2-marten.lindahl@axis.com>
 <20220427132656.GA3187691@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220427132656.GA3187691@roeck-us.net>
From:   Marten Lindahl <martenli@axis.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Apr 27, 2022 at 03:26:56PM +0200, Guenter Roeck wrote:
> On Wed, Apr 27, 2022 at 03:02:11PM +0200, Mårten Lindahl wrote:
> > Pmbus drivers using the default pmbus_regulator_ops for the enable/
> > disable/is_enabled functions will use the standard pmbus core functions
> > pmbus_read/write_byte_data. This could potentially influence some
> > specific regulator chips that for example need a time delay before each
> > data access.
> > 
> > Lets add support for drivers to use chip specific read/write operations
> > when using the standard pmbus_regulator_ops.
> 
> The subject is misleading. It should be something like "introduce and
> use write_byte_data callback". Also, existing code calling
> pmbus_write_byte_data() should call _pmbus_write_byte_data() instead.
> This applies to pmbus_update_fan() and pmbus_get_boolean().

Ok, I will change the subject to your suggestion, and change those two
functions. Thanks!

Kind regards
Mårten
> 
> Thanks,
> Guenter
> 
> > 
> > Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>
> > ---
> >  drivers/hwmon/pmbus/pmbus.h      |  2 ++
> >  drivers/hwmon/pmbus/pmbus_core.c | 58 +++++++++++++++++++++-----------
> >  2 files changed, 40 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> > index e74b6ef070f3..c031a9700ace 100644
> > --- a/drivers/hwmon/pmbus/pmbus.h
> > +++ b/drivers/hwmon/pmbus/pmbus.h
> > @@ -438,6 +438,8 @@ struct pmbus_driver_info {
> >  	int (*read_byte_data)(struct i2c_client *client, int page, int reg);
> >  	int (*read_word_data)(struct i2c_client *client, int page, int phase,
> >  			      int reg);
> > +	int (*write_byte_data)(struct i2c_client *client, int page, int reg,
> > +			      u8 byte);
> >  	int (*write_word_data)(struct i2c_client *client, int page, int reg,
> >  			       u16 word);
> >  	int (*write_byte)(struct i2c_client *client, int page, u8 value);
> > diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> > index b2618b1d529e..1b0728c3c7d8 100644
> > --- a/drivers/hwmon/pmbus/pmbus_core.c
> > +++ b/drivers/hwmon/pmbus/pmbus_core.c
> > @@ -384,25 +384,6 @@ int pmbus_write_byte_data(struct i2c_client *client, int page, u8 reg, u8 value)
> >  }
> >  EXPORT_SYMBOL_NS_GPL(pmbus_write_byte_data, PMBUS);
> >  
> > -int pmbus_update_byte_data(struct i2c_client *client, int page, u8 reg,
> > -			   u8 mask, u8 value)
> > -{
> > -	unsigned int tmp;
> > -	int rv;
> > -
> > -	rv = pmbus_read_byte_data(client, page, reg);
> > -	if (rv < 0)
> > -		return rv;
> > -
> > -	tmp = (rv & ~mask) | (value & mask);
> > -
> > -	if (tmp != rv)
> > -		rv = pmbus_write_byte_data(client, page, reg, tmp);
> > -
> > -	return rv;
> > -}
> > -EXPORT_SYMBOL_NS_GPL(pmbus_update_byte_data, PMBUS);
> > -
> >  /*
> >   * _pmbus_read_byte_data() is similar to pmbus_read_byte_data(), but checks if
> >   * a device specific mapping function exists and calls it if necessary.
> > @@ -421,6 +402,43 @@ static int _pmbus_read_byte_data(struct i2c_client *client, int page, int reg)
> >  	return pmbus_read_byte_data(client, page, reg);
> >  }
> >  
> > +/*
> > + * _pmbus_write_byte_data() is similar to pmbus_write_byte_data(), but checks if
> > + * a device specific mapping function exists and calls it if necessary.
> > + */
> > +static int _pmbus_write_byte_data(struct i2c_client *client, int page, int reg, u8 value)
> > +{
> > +	struct pmbus_data *data = i2c_get_clientdata(client);
> > +	const struct pmbus_driver_info *info = data->info;
> > +	int status;
> > +
> > +	if (info->write_byte_data) {
> > +		status = info->write_byte_data(client, page, reg, value);
> > +		if (status != -ENODATA)
> > +			return status;
> > +	}
> > +	return pmbus_write_byte_data(client, page, reg, value);
> > +}
> > +
> > +int pmbus_update_byte_data(struct i2c_client *client, int page, u8 reg,
> > +			   u8 mask, u8 value)
> > +{
> > +	unsigned int tmp;
> > +	int rv;
> > +
> > +	rv = _pmbus_read_byte_data(client, page, reg);
> > +	if (rv < 0)
> > +		return rv;
> > +
> > +	tmp = (rv & ~mask) | (value & mask);
> > +
> > +	if (tmp != rv)
> > +		rv = _pmbus_write_byte_data(client, page, reg, tmp);
> > +
> > +	return rv;
> > +}
> > +EXPORT_SYMBOL_NS_GPL(pmbus_update_byte_data, PMBUS);
> > +
> >  static struct pmbus_sensor *pmbus_find_sensor(struct pmbus_data *data, int page,
> >  					      int reg)
> >  {
> > @@ -2396,7 +2414,7 @@ static int pmbus_regulator_is_enabled(struct regulator_dev *rdev)
> >  	int ret;
> >  
> >  	mutex_lock(&data->update_lock);
> > -	ret = pmbus_read_byte_data(client, page, PMBUS_OPERATION);
> > +	ret = _pmbus_read_byte_data(client, page, PMBUS_OPERATION);
> >  	mutex_unlock(&data->update_lock);
> >  
> >  	if (ret < 0)
