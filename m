Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32315C43334
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Jun 2022 21:00:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351725AbiFMVAW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 13 Jun 2022 17:00:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352342AbiFMU7F (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 13 Jun 2022 16:59:05 -0400
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09F1D1C93A
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Jun 2022 13:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1655152486;
  x=1686688486;
  h=date:to:cc:subject:message-id:references:mime-version:
   content-transfer-encoding:in-reply-to:from;
  bh=zFdMuu5jL2bYkkgVmOoIgrOfVHcFePtqvx3NC9DHtag=;
  b=JxIs0py9gghtSlyKfA443/paESeMqzv2uHWW9FF4OOOXqTaXItLy0tN1
   bYsmWRJm5kb0DD+4iJpZ6AyXbN0+Fqy4NRBzjJYmhxWwpZl0jg4qt6T+D
   OUvEEKoQ+VRa7LjMK7zl/cDQHgyZLSn/CeAVQh6KCaRByO7P3bAheTfOM
   jqzu48iB8T8qCSdEdtD1YTvYgdC00cOx4jm/vf9McXC5zA8Z1Y79JuFS9
   U/iULoku1cAg9KALU9T2qGWVtAHFS9hwZMexA0Hg6i19IBRrYijZJPLsi
   RALJKBOsMuafMte5j+cWNmJQHCNfflsGowelhOQ7V6qEQoEet8M7w4Kkm
   Q==;
Date:   Mon, 13 Jun 2022 22:34:44 +0200
To:     Guenter Roeck <linux@roeck-us.net>
CC:     =?iso-8859-1?Q?M=E5rten?= Lindahl <Marten.Lindahl@axis.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        kernel <kernel@axis.com>
Subject: Re: [PATCH v2 3/3] hwmon: (pmbus/ltc2978) Set voltage resolution
Message-ID: <YqefZJbfj3ZYWCLd@axis.com>
References: <20220610114732.2370242-1-marten.lindahl@axis.com>
 <20220610114732.2370242-4-marten.lindahl@axis.com>
 <0fd2af05-937a-af7d-8f12-fdee7e03ddb9@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0fd2af05-937a-af7d-8f12-fdee7e03ddb9@roeck-us.net>
From:   Marten Lindahl <martenli@axis.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Jun 10, 2022 at 04:27:55PM +0200, Guenter Roeck wrote:
> On 6/10/22 04:47, Mårten Lindahl wrote:
> > The LTC2977 regulator does not set the regulator_desc .n_voltages value
> > which is needed in order to let the regulator core list the regulator
> > voltage range.
> > 
> > This patch defines a regulator_desc with a voltage range, and uses it
> > for defining voltage resolution for regulators LTC2972/LTC2974/LTC2975/
> > LTC2977/LTC2978/LTC2979/LTC2980/LTM2987 based on that they all have a 16
> > bit ADC with the same stepwise 122.07uV resolution. It also scales the
> > resolution to a 1mV resolution which is easier to handle.
> > 
> > Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>
> > ---
> >   drivers/hwmon/pmbus/ltc2978.c | 56 ++++++++++++++++++++++++++++++++---
> >   1 file changed, 52 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
> > index 531aa674a928..7d44e64c61c1 100644
> > --- a/drivers/hwmon/pmbus/ltc2978.c
> > +++ b/drivers/hwmon/pmbus/ltc2978.c
> > @@ -562,7 +562,36 @@ static const struct i2c_device_id ltc2978_id[] = {
> >   MODULE_DEVICE_TABLE(i2c, ltc2978_id);
> >   
> >   #if IS_ENABLED(CONFIG_SENSORS_LTC2978_REGULATOR)
> > +#define LTC2978_ADC_RES	0xFFFF
> > +#define LTC2978_N_ADC	122
> > +#define LTC2978_MAX_UV	(LTC2978_ADC_RES * LTC2978_N_ADC)
> > +#define LTC2978_UV_STEP	1000
> > +
> > +#define PMBUS_LTC2978_REGULATOR(_name, _id)               \
> > +	[_id] = {                                               \
> > +		.name = (_name # _id),                                \
> 
> This needs 'supply_name = "vin"'. See commit 54cc3dbfc10dc ("hwmon:
> (pmbus) Add regulator supply into macro").
> 
> > +		.id = (_id),                                          \
> > +		.of_match = of_match_ptr(_name # _id),                \
> > +		.regulators_node = of_match_ptr("regulators"),        \
> > +		.ops = &pmbus_regulator_ops,                          \
> > +		.type = REGULATOR_VOLTAGE,                            \
> > +		.owner = THIS_MODULE,                                 \
> > +		.n_voltages = (LTC2978_MAX_UV / LTC2978_UV_STEP) + 1, \
> > +		.uV_step = LTC2978_UV_STEP,                           \
> > +	}
> 
> Please introduce a new generic macro PMBUS_REGULATOR_STEP()
> with additional parameters n_voltages and uV_step and use it here.
> PMBUS_REGULATOR() can then be redefined as
> 
> #define PMBUS_REGULATOR(n, i)	PMBUS_REGULATOR_STEP(n, i, 0, 0)

Hi Guenter!

Yes, that's a good idea. I will do that, and then there wont be any risk
of missing attributes like this new 'supply_name' as it is only defined at
one place.

Kind regards
Mårten

> 
> Thanks,
> Guenter
> 
> > +
> >   static const struct regulator_desc ltc2978_reg_desc[] = {
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
> >   	PMBUS_REGULATOR("vout", 0),
> >   	PMBUS_REGULATOR("vout", 1),
> >   	PMBUS_REGULATOR("vout", 2),
> > @@ -839,10 +868,29 @@ static int ltc2978_probe(struct i2c_client *client)
> >   
> >   #if IS_ENABLED(CONFIG_SENSORS_LTC2978_REGULATOR)
> >   	info->num_regulators = info->pages;
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
> > +			dev_warn(&client->dev, "num_regulators too large!");
> > +			info->num_regulators = ARRAY_SIZE(ltc2978_reg_desc);
> > +		}
> > +		break;
> > +	default:
> > +		info->reg_desc = ltc2978_reg_desc_default;
> > +		if (info->num_regulators > ARRAY_SIZE(ltc2978_reg_desc_default)) {
> > +			dev_warn(&client->dev, "num_regulators too large!");
> > +			info->num_regulators =
> > +			    ARRAY_SIZE(ltc2978_reg_desc_default);
> > +		}
> > +		break;
> >   	}
> >   #endif
> >   
> 
