Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 656B1C6FD19
	for <linux-hwmon@archiver.kernel.org>; Sun, 12 Mar 2023 18:29:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232049AbjCLS3Y (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 12 Mar 2023 14:29:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229756AbjCLS3H (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 12 Mar 2023 14:29:07 -0400
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90B622685C
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Mar 2023 11:23:50 -0700 (PDT)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-176b90e14a9so11593085fac.9
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Mar 2023 11:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678645313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lOPnPDD34aMBDSf5U9S9oKwYPPbU9uE9BMHYH5RbQHE=;
        b=j8ghwCp/ntwsLqy+prtBVIgr6H+EaW95wQBS/PQDN9cZePq3XgHR4jbbP8TL2LMb1D
         YqPyIZOhL7NF+3pS1P+3cTdU2cMKqssPQgMDcmn9woDtZNJ/MOYqfnCZ8B+GV1RqqFxA
         Fp+T5s+HvEepEeiJ6MFxZwocgjd7TKbvq7ho1Enm6GLrD/7tSLYlaWDkEqQemLDh8LkM
         eWLaA/oYD0DoyFKCsUXkWTrhvlDn8MPItUDGjmhnmYQR5H+8XAFcYCyvPQTFgwNnjJXh
         BCuKrEPrjfCicucD1Ja4e63ITGqxs17E485kCau41lou9E32t+36iVd3iBu4ZMe/aedK
         HCGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678645313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lOPnPDD34aMBDSf5U9S9oKwYPPbU9uE9BMHYH5RbQHE=;
        b=Z69LPcW39qi8A1rFr/Slk6XOiAbObdbR3NZRqAMuZBu0dosJYYYGVCLNqH5YvXJGem
         rok21tz2krnRWqUmD4LQA883ExLgnPeWHDKZUXgz1n7erdpVR76bQhbk0hEnLBjI2Sw5
         Zdk7ISa2BduScIkfBUTuO0GVuLvCHYHhJPu1gtRwLxd950pSJYiohZN0knLpJmKVpFt3
         igwkXJd7X/6e1iNkuRv9Nw/X0BsQ+2k44EJ6CMnJuc5RYe0GEx0MDwU1m+oJda9TuxkW
         Ai/l6W/53oDbL5bYQ0N1jjSqC7nvKqINEVOwr2Tr3zpoW4fS83p2zUr+HwT3uzHx93eh
         Ep4A==
X-Gm-Message-State: AO0yUKVPnqS2Ac5GLeGekni7NDliOeHkbcZXgybLI9CpuLONElkEByJL
        JQRXE9P25HtFz7K7DRc3dxBDHRtGt0U=
X-Google-Smtp-Source: AK7set/FKo7fG40W6rjeSmIw5X9BsYNzI5udv8Tehbf50jV6o3HRzYvbN8LQ8jAt4qH95gLdeytozQ==
X-Received: by 2002:aca:650d:0:b0:377:ff1d:dcb2 with SMTP id m13-20020aca650d000000b00377ff1ddcb2mr14989071oim.0.1678644751995;
        Sun, 12 Mar 2023 11:12:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r11-20020acaa80b000000b00383ef567cfdsm2288806oie.21.2023.03.12.11.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 11:12:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 12 Mar 2023 11:12:30 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Lars-Peter Clausen <lars@metafoo.de>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (ucd90320) Add minimum delay between bus accesses
Message-ID: <facfa1cd-9f77-4b8a-8bc2-605f0ed12a21@roeck-us.net>
References: <20230312160312.2227405-1-lars@metafoo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230312160312.2227405-1-lars@metafoo.de>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Mar 12, 2023 at 09:03:12AM -0700, Lars-Peter Clausen wrote:
> When probing the ucd90320 access to some of the registers randomly fails.
> Sometimes it NACKs a transfer, sometimes it returns just random data and
> the PEC check fails.
> 
> Experimentation shows that this seems to be triggered by a register access
> directly back to back with a previous register write. Experimentation also
> shows that inserting a small delay after register writes makes the issue go
> away.
> 
> Use a similar solution to what the max15301 driver does to solve the same
> problem. Create a custom set of bus read and write functions that make sure
> that the delay is added.
> 
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/ucd9000.c | 75 +++++++++++++++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
> index 75fc770c9e40..3daaf2237832 100644
> --- a/drivers/hwmon/pmbus/ucd9000.c
> +++ b/drivers/hwmon/pmbus/ucd9000.c
> @@ -7,6 +7,7 @@
>   */
>  
>  #include <linux/debugfs.h>
> +#include <linux/delay.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
> @@ -16,6 +17,7 @@
>  #include <linux/i2c.h>
>  #include <linux/pmbus.h>
>  #include <linux/gpio/driver.h>
> +#include <linux/timekeeping.h>
>  #include "pmbus.h"
>  
>  enum chips { ucd9000, ucd90120, ucd90124, ucd90160, ucd90320, ucd9090,
> @@ -65,6 +67,7 @@ struct ucd9000_data {
>  	struct gpio_chip gpio;
>  #endif
>  	struct dentry *debugfs;
> +	ktime_t write_time;
>  };
>  #define to_ucd9000_data(_info) container_of(_info, struct ucd9000_data, info)
>  
> @@ -73,6 +76,73 @@ struct ucd9000_debugfs_entry {
>  	u8 index;
>  };
>  
> +/*
> + * It has been observed that the UCD90320 randomly fails register access when
> + * doing another access right on the back of a register write. To mitigate this
> + * make sure that there is a minimum delay between a write access and the
> + * following access. The 250us is based on experimental data. At a delay of
> + * 200us the issue seems to go away. Add a bit of extra margin to allow for
> + * system to system differences.
> + */
> +#define UCD90320_WAIT_DELAY_US 250
> +
> +static inline void ucd90320_wait(const struct ucd9000_data *data)
> +{
> +	s64 delta = ktime_us_delta(ktime_get(), data->write_time);
> +
> +	if (delta < UCD90320_WAIT_DELAY_US)
> +		udelay(UCD90320_WAIT_DELAY_US - delta);
> +}
> +
> +static int ucd90320_read_word_data(struct i2c_client *client, int page,
> +				   int phase, int reg)
> +{
> +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> +	struct ucd9000_data *data = to_ucd9000_data(info);
> +
> +	if (reg >= PMBUS_VIRT_BASE)
> +		return -ENXIO;
> +
> +	ucd90320_wait(data);
> +	return pmbus_read_word_data(client, page, phase, reg);
> +}
> +
> +static int ucd90320_read_byte_data(struct i2c_client *client, int page, int reg)
> +{
> +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> +	struct ucd9000_data *data = to_ucd9000_data(info);
> +
> +	ucd90320_wait(data);
> +	return pmbus_read_byte_data(client, page, reg);
> +}
> +
> +static int ucd90320_write_word_data(struct i2c_client *client, int page,
> +				    int reg, u16 word)
> +{
> +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> +	struct ucd9000_data *data = to_ucd9000_data(info);
> +	int ret;
> +
> +	ucd90320_wait(data);
> +	ret = pmbus_write_word_data(client, page, reg, word);
> +	data->write_time = ktime_get();
> +
> +	return ret;
> +}
> +
> +static int ucd90320_write_byte(struct i2c_client *client, int page, u8 value)
> +{
> +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> +	struct ucd9000_data *data = to_ucd9000_data(info);
> +	int ret;
> +
> +	ucd90320_wait(data);
> +	ret = pmbus_write_byte(client, page, value);
> +	data->write_time = ktime_get();
> +
> +	return ret;
> +}
> +
>  static int ucd9000_get_fan_config(struct i2c_client *client, int fan)
>  {
>  	int fan_config = 0;
> @@ -598,6 +668,11 @@ static int ucd9000_probe(struct i2c_client *client)
>  		info->read_byte_data = ucd9000_read_byte_data;
>  		info->func[0] |= PMBUS_HAVE_FAN12 | PMBUS_HAVE_STATUS_FAN12
>  		  | PMBUS_HAVE_FAN34 | PMBUS_HAVE_STATUS_FAN34;
> +	} else if (mid->driver_data == ucd90320) {
> +		info->read_byte_data = ucd90320_read_byte_data;
> +		info->read_word_data = ucd90320_read_word_data;
> +		info->write_byte = ucd90320_write_byte;
> +		info->write_word_data = ucd90320_write_word_data;
>  	}
>  
>  	ucd9000_probe_gpio(client, mid, data);
