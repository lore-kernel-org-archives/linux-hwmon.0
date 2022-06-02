Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DD5AC433EF
	for <linux-hwmon@archiver.kernel.org>; Thu,  2 Jun 2022 14:41:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236179AbiFBOk6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 2 Jun 2022 10:40:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236294AbiFBOkq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 2 Jun 2022 10:40:46 -0400
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C3CD285AAD
        for <linux-hwmon@vger.kernel.org>; Thu,  2 Jun 2022 07:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1654180830;
  x=1685716830;
  h=date:to:cc:subject:message-id:references:mime-version:
   content-transfer-encoding:in-reply-to:from;
  bh=YFmulEK8OZcJl4JjtQsEE75RRJmEAm3pwsxBY3XvUw4=;
  b=airmU66KRP/QAuGJTpw8HdcXn1+gEcsrL8ONzShkB9jQkdhB6wOXh3Un
   29qej8DhDOsHmaDulJHCFo6iezYohY4AwChk6LweAbx9NhuguYJ/VoWZ6
   IxYLQZItmh+r3zi7DmpPVnkMjFqchfwjC/p2+gr6UYG/jKga5lbBfOowZ
   VW7eSrt0SV19Y39V1ZlJyX54hcM4yJSgYKpFrKOgv28QD144GN/UFSc2O
   8CiNzkCCeLLajQOWaJ0897Nmv2xQr2LfYVbxKgdjr7Fzs+sWOXJHWmYHG
   HYp1uKsbWuV8M3iNP19136drC3BpTufB4ziaIEdA0YRUMTdatUEmJpVSP
   A==;
Date:   Thu, 2 Jun 2022 16:40:25 +0200
To:     Guenter Roeck <linux@roeck-us.net>
CC:     =?iso-8859-1?Q?M=E5rten?= Lindahl <Marten.Lindahl@axis.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        kernel <kernel@axis.com>
Subject: Re: [PATCH v1] hwmon: (pmbus/ltc2978) Set voltage resolution
Message-ID: <YpjL2XqBuvAE0LfH@axis.com>
References: <20220530143446.2649282-1-marten.lindahl@axis.com>
 <20220601191256.GA1416021@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220601191256.GA1416021@roeck-us.net>
From:   Marten Lindahl <martenli@axis.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Jun 01, 2022 at 09:12:56PM +0200, Guenter Roeck wrote:
> On Mon, May 30, 2022 at 04:34:46PM +0200, Mårten Lindahl wrote:
> > When checking if a regulator supports a voltage range, the regulator
> > needs to have support for listing the range or else -EINVAL will be
> > returned.
> > 
> > This support does not exist for the LTC2977 regulator, so this patch
> > adds support for list voltage to the pmbus regulators by adding
> > regulator_list_voltage_linear to the pmbus_regulator_ops. It also
> > defines the voltage resolution for regulators ltc2972/LTC2974/LTC2975/
> > LTC2977/LTC2978/LTC2979/LTC2980/LTM2987 based on that they all have the
> > same stepwise 122.07uV resolution.
> > 
> > Since 122.07uV resolution is very small the resolution is set to a 1mV
> > resolution to be easier to handle.
> > 
> > Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>
> > ---
> >  drivers/hwmon/pmbus/ltc2978.c    | 57 +++++++++++++++++++++++++++++---
> >  drivers/hwmon/pmbus/pmbus_core.c |  1 +
> >  2 files changed, 54 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
> > index 531aa674a928..cfb568c6c155 100644
> > --- a/drivers/hwmon/pmbus/ltc2978.c
> > +++ b/drivers/hwmon/pmbus/ltc2978.c
> > @@ -562,7 +562,37 @@ static const struct i2c_device_id ltc2978_id[] = {
> >  MODULE_DEVICE_TABLE(i2c, ltc2978_id);
> >  
> >  #if IS_ENABLED(CONFIG_SENSORS_LTC2978_REGULATOR)
> > +#define LTC2978_ADC_RES 0xFFFF
> > +#define LTC2978_N_ADC 122
> > +#define LTC2978_MAX_UV (LTC2978_ADC_RES * LTC2978_N_ADC)
> > +#define LTC2978_UV_STEP (1000)
>

Hi Guenter!

> #define<space>DEFINE<tab>VALUE, please, and the () around 1000
> is unnecessary.

Ok, will fix.

> 
> Also, is the range really correct ? The valid / acceptable
> voltages are in the range detected in pmbus_regulator_set_voltage(),
> based on PMBUS_MFR_VOUT_MIN/PMBUS_VOUT_MARGIN_LOW and
> PMBUS_MFR_VOUT_MAX/PMBUS_VOUT_MARGIN_HIGH, and that will likely differ
> from the fixed number of voltages provided here.
> 
> That makes me wonder if it would make more sense to move this
> functionality into the PMBus core code. Any thoughts on that ?

Yes, I did think about that, but to support regulator_count_voltages
the regulator_desc needs to have .n_voltages set and since the
regulator_desc is const I have to set .n_voltages to the full range
of the 16 bit adc resolution. And then I scale it to 1 mV units by the
defines above.

My understanding of the regulator core list_voltage implementation is
that it tests if a requested range fits within this range, using the
min_uV and max_uV limits (which can be specified in DT) to validate it.

Maybe a new pmbus_regulator_list_voltage function could read the voltage
upper and lower limits and then compare the requested range to that one?

But the regulator_desc .n_voltages still needs to be preset to
something. What should it be set to? Should I perhaps set it to the full
ADC resolution (0xFFFF) without scaling it?

Please note, I added the PMBUS_LTC2978_REGULATOR macro with included
voltages and steps only for the chips listed in the commit msg, based on
that they all have the same ADC resolution and ADC unit size (122 uV).
I would prefer to not add voltages and steps to the generic
PMBUS_REGULATOR macro in pmbus.h, as I don't have knowledge about the
other chips.

> 
> Thanks,
> Guenter
> 
> > +
> > +#define PMBUS_LTC2978_REGULATOR(_name, _id)               \
> > +	[_id] = {                                               \
> > +		.name = (_name # _id),                                \
> > +		.supply_name = "vin",                                 \
> > +		.id = (_id),                                          \
> > +		.of_match = of_match_ptr(_name # _id),                \
> > +		.regulators_node = of_match_ptr("regulators"),        \
> > +		.ops = &pmbus_regulator_ops,                          \
> > +		.type = REGULATOR_VOLTAGE,                            \
> > +		.owner = THIS_MODULE,                                 \
> > +		.n_voltages = (LTC2978_MAX_UV / LTC2978_UV_STEP) + 1, \
> > +		.uV_step = LTC2978_UV_STEP,                           \
> > +	}
> > +
> >  static const struct regulator_desc ltc2978_reg_desc[] = {
> > +	PMBUS_LTC2978_REGULATOR("vout", 0),
> > +	PMBUS_LTC2978_REGULATOR("vout", 1),
> > +	PMBUS_LTC2978_REGULATOR("vout", 2),
> > +	PMBUS_LTC2978_REGULATOR("vout", 3),
> > +	PMBUS_LTC2978_REGULATOR("vout", 4),
> > +	PMBUS_LTC2978_REGULATOR("vout", 5),
> > +	PMBUS_LTC2978_REGULATOR("vout", 6),
> > +	PMBUS_LTC2978_REGULATOR("vout", 7),
> > +};
> > +
> > +static const struct regulator_desc ltc2978_reg_desc_default[] = {
> >  	PMBUS_REGULATOR("vout", 0),
> >  	PMBUS_REGULATOR("vout", 1),
> >  	PMBUS_REGULATOR("vout", 2),
> > @@ -839,10 +869,29 @@ static int ltc2978_probe(struct i2c_client *client)
> >  
> >  #if IS_ENABLED(CONFIG_SENSORS_LTC2978_REGULATOR)
> >  	info->num_regulators = info->pages;
> > -	info->reg_desc = ltc2978_reg_desc;
> > -	if (info->num_regulators > ARRAY_SIZE(ltc2978_reg_desc)) {
> > -		dev_err(&client->dev, "num_regulators too large!");
> > -		info->num_regulators = ARRAY_SIZE(ltc2978_reg_desc);
> > +	switch (data->id) {
> > +	case ltc2972:
> > +	case ltc2974:
> > +	case ltc2975:
> > +	case ltc2977:
> > +	case ltc2978:
> > +	case ltc2979:
> > +	case ltc2980:
> > +	case ltm2987:
> > +		info->reg_desc = ltc2978_reg_desc;
> > +		if (info->num_regulators > ARRAY_SIZE(ltc2978_reg_desc)) {
> > +			dev_err(&client->dev, "num_regulators too large!");
> 
> Let's make this a dev_warn(); it does not result in an error abort,
> after all.

Ok, will fix.

> 
> > +			info->num_regulators = ARRAY_SIZE(ltc2978_reg_desc);
> > +		}
> > +		break;
> > +	default:
> > +		info->reg_desc = ltc2978_reg_desc_default;
> > +		if (info->num_regulators > ARRAY_SIZE(ltc2978_reg_desc_default)) {
> > +			dev_err(&client->dev, "num_regulators too large!");
> 
> Same here.

Ok, will fix.

Thanks!

Kind regards
Mårten

> 
> > +			info->num_regulators =
> > +			    ARRAY_SIZE(ltc2978_reg_desc_default);
> > +		}
> > +		break;
> >  	}
> >  #endif
> >  
> > diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> > index f2cf0439da37..7d642b57c8b2 100644
> > --- a/drivers/hwmon/pmbus/pmbus_core.c
> > +++ b/drivers/hwmon/pmbus/pmbus_core.c
> > @@ -2634,6 +2634,7 @@ const struct regulator_ops pmbus_regulator_ops = {
> >  	.get_error_flags = pmbus_regulator_get_error_flags,
> >  	.get_voltage = pmbus_regulator_get_voltage,
> >  	.set_voltage = pmbus_regulator_set_voltage,
> > +	.list_voltage = regulator_list_voltage_linear,
> >  };
> >  EXPORT_SYMBOL_NS_GPL(pmbus_regulator_ops, PMBUS);
> >  
