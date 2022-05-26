Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A92F3C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 May 2022 07:12:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344243AbiEZHMg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 26 May 2022 03:12:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245118AbiEZHMf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 26 May 2022 03:12:35 -0400
Received: from smtpo68.interia.pl (smtpo68.interia.pl [217.74.67.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66D5D37A95
        for <linux-hwmon@vger.kernel.org>; Thu, 26 May 2022 00:12:31 -0700 (PDT)
Received: from t480s.localdomain (unknown [80.68.225.159])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by poczta.interia.pl (INTERIA.PL) with ESMTPSA;
        Thu, 26 May 2022 09:12:27 +0200 (CEST)
Date:   Thu, 26 May 2022 09:12:26 +0200
From:   Slawomir Stepien <sst@poczta.fm>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH 13/40] hwmon: (lm90) Support multiple temperature
 resolutions
Message-ID: <Yo8oWvd3ChpOyOJ7@t480s.localdomain>
References: <20220525135758.2944744-1-linux@roeck-us.net>
 <20220525135758.2944744-14-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220525135758.2944744-14-linux@roeck-us.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=interia.pl;
        s=biztos; t=1653549148;
        bh=fNjZrZedufIykT6oLuDwiA3DOzQ6aTi7XdJ9QWDzCbo=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=ov7PGEtk5DzPv4MaTcvREjgkKv2RmguOvTcFbqU99MS5l5vhnfcbFeh9f5VVKDmaf
         f4snOIKnGxcx6IKCO8zpPhuOmO5/bj1d7sc+s64CwLIugDO8TfTWANdWDbHn2BXS/x
         50WG8rFXN5C/zST2g/oLY82jxiKa2cj2piymlDSs=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On maj 25, 2022 06:57, Guenter Roeck wrote:
> (...)
> @@ -1477,36 +1332,36 @@ static int lm90_temp_write(struct device *dev, u32 attr, int channel, long val)
>  
>  	switch (attr) {
>  	case hwmon_temp_min:
> -		if (channel == 0)
> -			err = lm90_set_temp8(data,
> -					      lm90_temp_min_index[channel],
> -					      val);
> -		else
> -			err = lm90_set_temp11(data,
> -					      lm90_temp_min_index[channel],
> -					      val);
> +		err = lm90_set_temp(data, lm90_temp_min_index[channel],
> +				    channel, val);
>  		break;
>  	case hwmon_temp_max:
> -		if (channel == 0)
> -			err = lm90_set_temp8(data,
> -					     lm90_temp_max_index[channel],
> -					     val);
> -		else
> -			err = lm90_set_temp11(data,
> -					      lm90_temp_max_index[channel],
> -					      val);
> +		err = lm90_set_temp(data, lm90_temp_max_index[channel],
> +				    channel, val);
>  		break;
>  	case hwmon_temp_crit:
> -		err = lm90_set_temp8(data, lm90_temp_crit_index[channel], val);
> +		err = lm90_set_temp(data, lm90_temp_crit_index[channel],
> +				    channel, val);
>  		break;
>  	case hwmon_temp_crit_hyst:
>  		err = lm90_set_temphyst(data, val);
>  		break;
>  	case hwmon_temp_emergency:
> -		err = lm90_set_temp8(data, lm90_temp_emerg_index[channel], val);
> +		err = lm90_set_temp(data, lm90_temp_emerg_index[channel],
> +				    channel, val);
>  		break;
>  	case hwmon_temp_offset:
> -		err = lm90_set_temp11(data, REMOTE_OFFSET, val);
> +		val = lm90_temp_to_reg(0, val,
> +				       lm90_temp_get_resolution(data, REMOTE_OFFSET));
> +		data->temp[REMOTE_OFFSET] = val;

I do not understand why you do this val assignment here, before doing real i2c write. That write
might fail and then we have "incorrect" value in data->temp.

> +		err = i2c_smbus_write_byte_data(data->client,
> +						LM90_REG_REMOTE_OFFSH,
> +						val >> 8);
> +		if (err)
> +			break;
> +		err = i2c_smbus_write_byte_data(data->client,
> +						LM90_REG_REMOTE_OFFSL,
> +						val & 0xff);
>  		break;
>  	default:
>  		err = -EOPNOTSUPP;
> @@ -2035,6 +1890,7 @@ static int lm90_probe(struct i2c_client *client)
>  	 * ALERT# output
>  	 */
>  	data->alert_alarms = lm90_params[data->kind].alert_alarms;
> +	data->resolution = lm90_params[data->kind].resolution ? : 11;
>  
>  	/* Set chip capabilities */
>  	data->flags = lm90_params[data->kind].flags;

-- 
Slawomir Stepien
