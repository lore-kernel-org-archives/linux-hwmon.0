Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1691C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 28 Apr 2022 13:04:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345884AbiD1NHe (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 28 Apr 2022 09:07:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346629AbiD1NHb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 28 Apr 2022 09:07:31 -0400
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DB6F84ED1
        for <linux-hwmon@vger.kernel.org>; Thu, 28 Apr 2022 06:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1651151056;
  x=1682687056;
  h=date:to:cc:subject:message-id:references:mime-version:
   content-transfer-encoding:in-reply-to:from;
  bh=w1uYyxXoHhUDQDC5FvLN6Unzk7VaJH4pkeoSVtG1tA0=;
  b=V7QdT3RX+benAq70lzbOFOvq2xH/2ouZ+kzgSlhysgjY71p9UB2auuI/
   NS82DPR8IzhN018s4qdWLHHM9S4P2lFlaCC296e8hRNRcmiZahrclyCZn
   iYOpjDjRgWYB8AjNoRj7GCrL0DZ6ottAwZmE3Zm64wUQP6JOXodGRjANV
   m/nvCKsVPIOviwjkLoMyyX+YDnngmc3lPLk2kjfnzN2RuBgUbdEVy3wf7
   FQeMXXT13WiSByhbrYWLL1WNevFC6GWsC/Ttf24X/cV3lnQlQaVfxNtxN
   dvsC8wWQ0+l7mUBhpqgUC50x4cxllZa1+n/GAu6MMZSryiqWIyTy7teEG
   Q==;
Date:   Thu, 28 Apr 2022 15:04:14 +0200
To:     Guenter Roeck <linux@roeck-us.net>
CC:     =?iso-8859-1?Q?M=E5rten?= Lindahl <Marten.Lindahl@axis.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        kernel <kernel@axis.com>
Subject: Re: [PATCH v3 3/3] hwmon: (pmbus) Add get_voltage/set_voltage ops
Message-ID: <YmqQzoOt7fBzwMoY@axis.com>
References: <20220427130213.1557793-1-marten.lindahl@axis.com>
 <20220427130213.1557793-4-marten.lindahl@axis.com>
 <489c0db5-8d90-dfde-0859-2306c808817a@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <489c0db5-8d90-dfde-0859-2306c808817a@roeck-us.net>
From:   Marten Lindahl <martenli@axis.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Apr 27, 2022 at 03:10:30PM +0200, Guenter Roeck wrote:
> On 4/27/22 06:02, Mårten Lindahl wrote:
> > The pmbus core does not have operations for getting or setting voltage.
> > Add functions get/set voltage for the dynamic regulator framework.
> > 
> > Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>
> > ---
> >   drivers/hwmon/pmbus/pmbus_core.c | 43 ++++++++++++++++++++++++++++++++
> >   1 file changed, 43 insertions(+)
> > 
> > diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> > index 1b0728c3c7d8..afc238faa8ce 100644
> > --- a/drivers/hwmon/pmbus/pmbus_core.c
> > +++ b/drivers/hwmon/pmbus/pmbus_core.c
> > @@ -2563,11 +2563,54 @@ static int pmbus_regulator_get_error_flags(struct regulator_dev *rdev, unsigned
> >   	return 0;
> >   }
> >   
> > +static int pmbus_regulator_get_voltage(struct regulator_dev *rdev)
> > +{
> > +	struct device *dev = rdev_get_dev(rdev);
> > +	struct i2c_client *client = to_i2c_client(dev->parent);
> > +	u8 page = rdev_get_id(rdev);
> > +	int ret;
> > +
> > +	ret = _pmbus_read_word_data(client, page, 0xff, PMBUS_READ_VOUT);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	ret *= 1000;
> > +
> > +	return ((ret >> 13) * 1000);
> 
> That will need to use voltage conversion functions. VOUT isn't the same
> for all chips.
> 
Ok, I will fix that. Will change it to use pmbus_reg2data()

> > +}
> > +
> > +static int pmbus_regulator_set_voltage(struct regulator_dev *rdev, int min_uV,
> > +					 int max_uV, unsigned int *selector)
> > +{
> > +	struct device *dev = rdev_get_dev(rdev);
> > +	struct i2c_client *client = to_i2c_client(dev->parent);
> > +	u8 page = rdev_get_id(rdev);
> > +	long tmp = DIV_ROUND_CLOSEST(min_uV, 1000);
> > +	u32 val = DIV_ROUND_CLOSEST(tmp << 13, 1000);
> 
> Same as above.

I will make it use pmbus_data2reg() for conversion.

Kind regards
Mårten
> 
> > +	int ret;
> > +	*selector = 0;
> > +
> > +	ret = _pmbus_read_word_data(client, page, 0xff, PMBUS_VOUT_MARGIN_LOW);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	/* Select the voltage closest to min_uV */
> > +	if (ret > val)
> > +		val = ret;
> > +
> > +	ret = _pmbus_write_word_data(client, page, PMBUS_VOUT_COMMAND,
> > +				    (u16)val);
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
