Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60DBEECAAD3
	for <linux-hwmon@archiver.kernel.org>; Wed,  7 Sep 2022 08:07:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230191AbiIGIHm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 7 Sep 2022 04:07:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230089AbiIGIHl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 7 Sep 2022 04:07:41 -0400
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18DD374BA1
        for <linux-hwmon@vger.kernel.org>; Wed,  7 Sep 2022 01:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1662538060;
  x=1694074060;
  h=date:to:cc:subject:message-id:references:mime-version:
   content-transfer-encoding:in-reply-to:from;
  bh=JAggwOKQIfeiKS1eoJWPnPV6hdUzaEfGXXQ8cczk+IQ=;
  b=IpsQIvPrKAEyQVOTjt/eckKeWNWtpJDmRIhval2BX1DeAd4LaDu2cFJI
   QHyEW8KemMwzNbkLbcSo5q9IPIMCRg86Evy27mnex7PYMA3h/8Jzpiilw
   enseROioYI0wL7spCFHClnpFSQfDdoQgHYktdACGc/pTuqLH0EA2FZo2V
   QsjCcv2seENOqaEz/S95LfvFBUdNqN0wh2bypE5ODhBnRE1+bNmDDmFsV
   UnlUuCHkeEauE2d+jOYVxFRxT51W01HOktb05swr9M23o1X525gXyZY0m
   xYQqxVpW2PsXpuBsruUBz34crpZPVbqjkCsoTFodoQ8kG1aggXyDenh/J
   w==;
Date:   Wed, 7 Sep 2022 10:07:38 +0200
To:     Guenter Roeck <linux@roeck-us.net>
CC:     =?iso-8859-1?Q?M=E5rten?= Lindahl <Marten.Lindahl@axis.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        kernel <kernel@axis.com>
Subject: Re: [PATCH] hwmon: (pmbus) Add debugfs output voltage related
 commands
Message-ID: <YxhRSgo3GNNHGVbP@axis.com>
References: <20220906092743.1327269-1-marten.lindahl@axis.com>
 <20220906171532.GA1523417@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220906171532.GA1523417@roeck-us.net>
From:   Marten Lindahl <martenli@axis.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Sep 06, 2022 at 07:15:32PM +0200, Guenter Roeck wrote:
> On Tue, Sep 06, 2022 at 11:27:43AM +0200, Mårten Lindahl wrote:
> > Export vout_command, vout_margin_high, and vout_margin_low through
> > debugfs. This is useful in order to manually configure the output
> > voltage on a channel.
> > 
> 
> NACK, voltages must be set through regulators which is already supported.
> We are not going to start bypassing regulators. Also, I don't think it
> is a good idea to allow manipulating margin voltages. Those are critical
> and should be set by manufacturing.
> 
> Guenter

Ok, accepted. Thanks.

Kind regards
Mårten
> 
> > Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>
> > ---
> >  drivers/hwmon/pmbus/pmbus_core.c | 80 +++++++++++++++++++++++++++++++-
> >  1 file changed, 78 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> > index 81d3f91dd204..25da2ff2d09f 100644
> > --- a/drivers/hwmon/pmbus/pmbus_core.c
> > +++ b/drivers/hwmon/pmbus/pmbus_core.c
> > @@ -3050,6 +3050,41 @@ static int pmbus_debugfs_get(void *data, u64 *val)
> >  DEFINE_DEBUGFS_ATTRIBUTE(pmbus_debugfs_ops, pmbus_debugfs_get, NULL,
> >  			 "0x%02llx\n");
> >  
> > +static int pmbus_debugfs_get_word(void *data, u64 *val)
> > +{
> > +	struct pmbus_debugfs_entry *entry = data;
> > +	struct pmbus_sensor s = {
> > +		.page = entry->page,
> > +		.class = PSC_VOLTAGE_OUT,
> > +		.convert = true,
> > +		.data = -1,
> > +	};
> > +
> > +	s.data = _pmbus_read_word_data(entry->client, entry->page, 0xff, entry->reg);
> > +	if (s.data < 0)
> > +		return s.data;
> > +	*val = pmbus_reg2data(i2c_get_clientdata(entry->client), &s);
> > +
> > +	return 0;
> > +}
> > +
> > +static int pmbus_debugfs_set_word(void *data, u64 val)
> > +{
> > +	struct pmbus_debugfs_entry *entry = data;
> > +	struct pmbus_sensor s = {
> > +		.page = entry->page,
> > +		.class = PSC_VOLTAGE_OUT,
> > +		.convert = true,
> > +		.data = -1,
> > +	};
> > +	val = pmbus_data2reg(i2c_get_clientdata(entry->client), &s, val);
> > +
> > +	return _pmbus_write_word_data(entry->client, entry->page, entry->reg,
> > +				      (u16)val);
> > +}
> > +DEFINE_DEBUGFS_ATTRIBUTE(pmbus_debugfs_ops_rw_word, pmbus_debugfs_get_word,
> > +			 pmbus_debugfs_set_word, "%llu\n");
> > +
> >  static int pmbus_debugfs_get_status(void *data, u64 *val)
> >  {
> >  	int rc;
> > @@ -3126,10 +3161,10 @@ static int pmbus_init_debugfs(struct i2c_client *client,
> >  	/*
> >  	 * Allocate the max possible entries we need.
> >  	 * 6 entries device-specific
> > -	 * 10 entries page-specific
> > +	 * 13 entries page-specific
> >  	 */
> >  	entries = devm_kcalloc(data->dev,
> > -			       6 + data->info->pages * 10, sizeof(*entries),
> > +			       6 + data->info->pages * 13, sizeof(*entries),
> >  			       GFP_KERNEL);
> >  	if (!entries)
> >  		return -ENOMEM;
> > @@ -3299,6 +3334,47 @@ static int pmbus_init_debugfs(struct i2c_client *client,
> >  					    &entries[idx++],
> >  					    &pmbus_debugfs_ops);
> >  		}
> > +
> > +		/*
> > +		 * VOUT_COMMAND - Nominal DC/DC output voltage setpoint.
> > +		 */
> > +		if (data->info->func[i] & PMBUS_HAVE_VOUT) {
> > +			entries[idx].client = client;
> > +			entries[idx].page = i;
> > +			entries[idx].reg = PMBUS_VOUT_COMMAND;
> > +			scnprintf(name, PMBUS_NAME_SIZE, "vout%d_command", i);
> > +			debugfs_create_file(name, 0644, data->debugfs,
> > +					    &entries[idx++],
> > +					    &pmbus_debugfs_ops_rw_word);
> > +		}
> > +
> > +		/*
> > +		 * VOUT_MARGIN_HIGH - Margin high DC/DC converter output.
> > +		 */
> > +		if (data->info->func[i] & PMBUS_HAVE_VOUT) {
> > +			entries[idx].client = client;
> > +			entries[idx].page = i;
> > +			entries[idx].reg = PMBUS_VOUT_MARGIN_HIGH;
> > +			scnprintf(name, PMBUS_NAME_SIZE,
> > +				  "vout%d_margin_high", i);
> > +			debugfs_create_file(name, 0644, data->debugfs,
> > +					    &entries[idx++],
> > +					    &pmbus_debugfs_ops_rw_word);
> > +		}
> > +
> > +		/*
> > +		 * VOUT_MARGIN_LOW - Margin low DC/DC converter output.
> > +		 */
> > +		if (data->info->func[i] & PMBUS_HAVE_VOUT) {
> > +			entries[idx].client = client;
> > +			entries[idx].page = i;
> > +			entries[idx].reg = PMBUS_VOUT_MARGIN_LOW;
> > +			scnprintf(name, PMBUS_NAME_SIZE,
> > +				  "vout%d_margin_low", i);
> > +			debugfs_create_file(name, 0644, data->debugfs,
> > +					    &entries[idx++],
> > +					    &pmbus_debugfs_ops_rw_word);
> > +		}
> >  	}
> >  
> >  	return devm_add_action_or_reset(data->dev,
