Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD58FC433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 20 May 2022 11:01:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345872AbiETLBN (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 20 May 2022 07:01:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348324AbiETLBK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 20 May 2022 07:01:10 -0400
Received: from smtpo49.interia.pl (smtpo49.interia.pl [217.74.67.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D95CA1929F
        for <linux-hwmon@vger.kernel.org>; Fri, 20 May 2022 04:01:06 -0700 (PDT)
X-Interia-R: Interia
X-Interia-R-IP: 80.68.225.159
X-Interia-R-Helo: <t480s.localdomain>
Received: from t480s.localdomain (unknown [80.68.225.159])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by poczta.interia.pl (INTERIA.PL) with ESMTPSA;
        Fri, 20 May 2022 13:01:03 +0200 (CEST)
Date:   Fri, 20 May 2022 13:01:02 +0200
From:   Slawomir Stepien <sst@poczta.fm>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, przemyslaw.cencner@nokia.com,
        krzysztof.adamski@nokia.com, alexander.sverdlin@nokia.com,
        Slawomir Stepien <slawomir.stepien@nokia.com>
Subject: Re: [PATCH 7/8] hwmon: (lm90) read the channel's label from
 device-tree
Message-ID: <Yod07jXUCEQIYcRj@t480s.localdomain>
References: <20220520093243.2523749-1-sst@poczta.fm>
 <20220520093243.2523749-8-sst@poczta.fm>
 <bb833b7d-d3c1-0f63-019c-439ed0ec9aad@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb833b7d-d3c1-0f63-019c-439ed0ec9aad@linaro.org>
X-Interia-Antivirus: OK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl;
        s=biztos; t=1653044464;
        bh=2krsosTeFPZot//+uFIYAKcDFb6jn30dmLGFk7hewv0=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=IOMvv6GqVCXOctcxzRrlTj8jLoYYXviRZEBZLufDiyq2T5dpWRnO2HVM59TMOwj5O
         5UpQ9Ks9ytba6druZPIekyUmPYi1AdW3NtHXaTxY7DH6MdnWiwTSiMK9zQ184ZkySw
         tfqM0ODoYI6BhOkx4/xdEQ+gZY+o7qMjrzSq7zM4=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On maj 20, 2022 12:15, Krzysztof Kozlowski wrote:
> On 20/05/2022 11:32, Slawomir Stepien wrote:
> > From: Slawomir Stepien <slawomir.stepien@nokia.com>
> > 
> > Try to read the channel's label from device-tree. Having label in
> > device-tree node is not mandatory.
> > 
> > Signed-off-by: Slawomir Stepien <slawomir.stepien@nokia.com>
> > ---
> >  drivers/hwmon/lm90.c | 70 ++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 70 insertions(+)
> > 
> > diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
> > index 67d48707a8d6..e81cc21e525f 100644
> > --- a/drivers/hwmon/lm90.c
> > +++ b/drivers/hwmon/lm90.c
> > @@ -525,6 +525,7 @@ struct lm90_data {
> >  	struct i2c_client *client;
> >  	struct device *hwmon_dev;
> >  	u32 channel_config[MAX_CHANNELS + 1];
> > +	const char *channel_label[MAX_CHANNELS];
> >  	struct hwmon_channel_info temp_info;
> >  	const struct hwmon_channel_info *info[MAX_CHANNELS];
> >  	struct hwmon_chip_info chip;
> > @@ -1393,6 +1394,7 @@ static umode_t lm90_temp_is_visible(const void *data, u32 attr, int channel)
> >  	case hwmon_temp_emergency_alarm:
> >  	case hwmon_temp_emergency_hyst:
> >  	case hwmon_temp_fault:
> > +	case hwmon_temp_label:
> >  		return 0444;
> >  	case hwmon_temp_min:
> >  	case hwmon_temp_max:
> > @@ -1486,6 +1488,16 @@ static int lm90_read(struct device *dev, enum hwmon_sensor_types type,
> >  	}
> >  }
> >  
> > +static int lm90_read_string(struct device *dev, enum hwmon_sensor_types type,
> > +			    u32 attr, int channel, const char **str)
> > +{
> > +	struct lm90_data *data = dev_get_drvdata(dev);
> > +
> > +	*str = data->channel_label[channel];
> > +
> > +	return 0;
> > +}
> > +
> >  static int lm90_write(struct device *dev, enum hwmon_sensor_types type,
> >  		      u32 attr, int channel, long val)
> >  {
> > @@ -1904,10 +1916,64 @@ static void lm90_regulator_disable(void *regulator)
> >  	regulator_disable(regulator);
> >  }
> >  
> > +static int lm90_probe_channel_from_dt(struct i2c_client *client,
> > +				      struct device_node *child,
> > +				      struct lm90_data *data)
> > +{
> > +	u32 id;
> > +	int err;
> > +	struct device *dev = &client->dev;
> > +
> > +	err = of_property_read_u32(child, "reg", &id);
> > +	if (err) {
> > +		dev_err(dev, "missing reg property of %pOFn\n", child);
> > +		return err;
> > +	}
> > +
> > +	if (id >= MAX_CHANNELS) {
> > +		dev_err(dev, "invalid reg %d in %pOFn\n", id, child);
> > +		return -EINVAL;
> > +	}
> > +
> > +	err = of_property_read_string(child, "label", &data->channel_label[id]);
> > +	if (err == -ENODATA || err == -EILSEQ) {
> > +		dev_err(dev, "invalid label in %pOFn\n", child);
> 
> You did not make it a required property, so why failing?

But if you have it in device-tree, then at least inform the user that there is some problem with it.

> > +		return err;
> > +	}
> > +
> > +	if (data->channel_label[id])
> > +		data->channel_config[id] |= HWMON_T_LABEL;
> > +
> > +	return 0;
> > +}
> > +
> > +static int lm90_parse_dt_channel_info(struct i2c_client *client,
> > +				      struct lm90_data *data)
> > +{
> > +	int err;
> > +	struct device_node *child;
> > +	struct device *dev = &client->dev;
> > +	const struct device_node *np = dev->of_node;
> > +
> > +	for_each_child_of_node(np, child) {
> > +		if (strcmp(child->name, "channel"))
> > +			continue;
> > +
> > +		err = lm90_probe_channel_from_dt(client, child, data);
> > +		if (err) {
> > +			of_node_put(child);
> > +			return err;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  
> 
> No need for double blank lines.

Will fix in v2.

> >  static const struct hwmon_ops lm90_ops = {
> >  	.is_visible = lm90_is_visible,
> >  	.read = lm90_read,
> > +	.read_string = lm90_read_string,
> >  	.write = lm90_write,
> >  };
> >  
> > @@ -2027,6 +2093,10 @@ static int lm90_probe(struct i2c_client *client)
> >  					return err;
> >  			}
> >  		}
> > +
> > +		err = lm90_parse_dt_channel_info(client, data);
> > +		if (err)
> > +			return err;
> >  	}
> >  
> >  	/* Initialize the LM90 chip */
> 
> 
> Best regards,
> Krzysztof

-- 
Slawomir Stepien
