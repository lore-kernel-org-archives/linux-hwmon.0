Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37D40ECAAD5
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Sep 2022 17:26:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233310AbiIFR0s (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 6 Sep 2022 13:26:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234298AbiIFR0b (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 6 Sep 2022 13:26:31 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7027792F6A
        for <linux-hwmon@vger.kernel.org>; Tue,  6 Sep 2022 10:15:34 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id s14-20020a17090a6e4e00b0020057c70943so6430671pjm.1
        for <linux-hwmon@vger.kernel.org>; Tue, 06 Sep 2022 10:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date;
        bh=tWGSIpdv2tjYMYWOr3Ii9kTUkv8s1vGG5PsDaVWrLEc=;
        b=fbzCyzMqPGN3CCrLB/2OxDCPKTzoPfTmFCFVa7uVNfbW5DczVHz5lOadULWgNA79ZX
         q1isEX5YY1pMWjmH6KM8GLs2NduOmIIBTPGpgwENTdt1CITmbh9l9cQTx8GTl5mKCW7Z
         xqPqfTk4Ev1iHpwUW4NoNtCpLhw0O8q/iZE/hmX5J04DyPlviCkp1K5XOkoiJuGuefdf
         hGzaeEaRj5q0nlvL6MciN/J0PyLZNb0X94Khm98jG08BTSXsjmt7w6PplCT7RINa65DC
         EJBWTB314BaghaYyEMsDxAUDEeIN/zPrKmPHzBdv/hZSkAo9kJuNrjj4/CCuC3/RATWe
         /uCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date;
        bh=tWGSIpdv2tjYMYWOr3Ii9kTUkv8s1vGG5PsDaVWrLEc=;
        b=2zCfyQh9XI8YAT0+bTC6vM5nmWyWCGen9qSEymOvCdYPy1cBZNcX/j8JQbUyOttrvO
         cEgUs/TYtKU1EOzZYt6rfl07tGzvTzOPKHMBNtgmC7SrL36+PfDdRRh2PTzqKRYDJExM
         pqNWvcul3nSHk8nZbi8DDMzYx4mrvHTWrxNSSaMt9jzPPuqh3VspDVtooYFcVh3nsKzL
         ldfm5lmuH8HKTOTr4jdS9OjybZRYhJOQ7ZEPOgq+NHm6UpDshhSLivj6KrotvqHv6qXh
         7rs9V4oK4iH3O016OhPFPQTLv2uAeHbdpYb7Ch8Lrw/gKcT2xhvJEFt6/fcuJ0dPM11U
         AbmQ==
X-Gm-Message-State: ACgBeo2UOPyF4Cj0dNp3Ats/VGBssLF5yJClii3IR++8n1DbrOK5pNbv
        kJjUL7s8PgWvo5lX7y05hyg=
X-Google-Smtp-Source: AA6agR7PaKY+YHl1X/RHjovOMmA3YzcTpton1ENSRAM08uWcGbAkk9japvoVaPRxwgHQGsAJjJwcpQ==
X-Received: by 2002:a17:902:7b87:b0:172:8ae9:2015 with SMTP id w7-20020a1709027b8700b001728ae92015mr56328487pll.112.1662484533915;
        Tue, 06 Sep 2022 10:15:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b2-20020a170903228200b00173cfb184c0sm10252288plh.32.2022.09.06.10.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 10:15:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 6 Sep 2022 10:15:32 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?iso-8859-1?Q?M=E5rten?= Lindahl <marten.lindahl@axis.com>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel@axis.com
Subject: Re: [PATCH] hwmon: (pmbus) Add debugfs output voltage related
 commands
Message-ID: <20220906171532.GA1523417@roeck-us.net>
References: <20220906092743.1327269-1-marten.lindahl@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220906092743.1327269-1-marten.lindahl@axis.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Sep 06, 2022 at 11:27:43AM +0200, Mårten Lindahl wrote:
> Export vout_command, vout_margin_high, and vout_margin_low through
> debugfs. This is useful in order to manually configure the output
> voltage on a channel.
> 

NACK, voltages must be set through regulators which is already supported.
We are not going to start bypassing regulators. Also, I don't think it
is a good idea to allow manipulating margin voltages. Those are critical
and should be set by manufacturing.

Guenter

> Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>
> ---
>  drivers/hwmon/pmbus/pmbus_core.c | 80 +++++++++++++++++++++++++++++++-
>  1 file changed, 78 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 81d3f91dd204..25da2ff2d09f 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -3050,6 +3050,41 @@ static int pmbus_debugfs_get(void *data, u64 *val)
>  DEFINE_DEBUGFS_ATTRIBUTE(pmbus_debugfs_ops, pmbus_debugfs_get, NULL,
>  			 "0x%02llx\n");
>  
> +static int pmbus_debugfs_get_word(void *data, u64 *val)
> +{
> +	struct pmbus_debugfs_entry *entry = data;
> +	struct pmbus_sensor s = {
> +		.page = entry->page,
> +		.class = PSC_VOLTAGE_OUT,
> +		.convert = true,
> +		.data = -1,
> +	};
> +
> +	s.data = _pmbus_read_word_data(entry->client, entry->page, 0xff, entry->reg);
> +	if (s.data < 0)
> +		return s.data;
> +	*val = pmbus_reg2data(i2c_get_clientdata(entry->client), &s);
> +
> +	return 0;
> +}
> +
> +static int pmbus_debugfs_set_word(void *data, u64 val)
> +{
> +	struct pmbus_debugfs_entry *entry = data;
> +	struct pmbus_sensor s = {
> +		.page = entry->page,
> +		.class = PSC_VOLTAGE_OUT,
> +		.convert = true,
> +		.data = -1,
> +	};
> +	val = pmbus_data2reg(i2c_get_clientdata(entry->client), &s, val);
> +
> +	return _pmbus_write_word_data(entry->client, entry->page, entry->reg,
> +				      (u16)val);
> +}
> +DEFINE_DEBUGFS_ATTRIBUTE(pmbus_debugfs_ops_rw_word, pmbus_debugfs_get_word,
> +			 pmbus_debugfs_set_word, "%llu\n");
> +
>  static int pmbus_debugfs_get_status(void *data, u64 *val)
>  {
>  	int rc;
> @@ -3126,10 +3161,10 @@ static int pmbus_init_debugfs(struct i2c_client *client,
>  	/*
>  	 * Allocate the max possible entries we need.
>  	 * 6 entries device-specific
> -	 * 10 entries page-specific
> +	 * 13 entries page-specific
>  	 */
>  	entries = devm_kcalloc(data->dev,
> -			       6 + data->info->pages * 10, sizeof(*entries),
> +			       6 + data->info->pages * 13, sizeof(*entries),
>  			       GFP_KERNEL);
>  	if (!entries)
>  		return -ENOMEM;
> @@ -3299,6 +3334,47 @@ static int pmbus_init_debugfs(struct i2c_client *client,
>  					    &entries[idx++],
>  					    &pmbus_debugfs_ops);
>  		}
> +
> +		/*
> +		 * VOUT_COMMAND - Nominal DC/DC output voltage setpoint.
> +		 */
> +		if (data->info->func[i] & PMBUS_HAVE_VOUT) {
> +			entries[idx].client = client;
> +			entries[idx].page = i;
> +			entries[idx].reg = PMBUS_VOUT_COMMAND;
> +			scnprintf(name, PMBUS_NAME_SIZE, "vout%d_command", i);
> +			debugfs_create_file(name, 0644, data->debugfs,
> +					    &entries[idx++],
> +					    &pmbus_debugfs_ops_rw_word);
> +		}
> +
> +		/*
> +		 * VOUT_MARGIN_HIGH - Margin high DC/DC converter output.
> +		 */
> +		if (data->info->func[i] & PMBUS_HAVE_VOUT) {
> +			entries[idx].client = client;
> +			entries[idx].page = i;
> +			entries[idx].reg = PMBUS_VOUT_MARGIN_HIGH;
> +			scnprintf(name, PMBUS_NAME_SIZE,
> +				  "vout%d_margin_high", i);
> +			debugfs_create_file(name, 0644, data->debugfs,
> +					    &entries[idx++],
> +					    &pmbus_debugfs_ops_rw_word);
> +		}
> +
> +		/*
> +		 * VOUT_MARGIN_LOW - Margin low DC/DC converter output.
> +		 */
> +		if (data->info->func[i] & PMBUS_HAVE_VOUT) {
> +			entries[idx].client = client;
> +			entries[idx].page = i;
> +			entries[idx].reg = PMBUS_VOUT_MARGIN_LOW;
> +			scnprintf(name, PMBUS_NAME_SIZE,
> +				  "vout%d_margin_low", i);
> +			debugfs_create_file(name, 0644, data->debugfs,
> +					    &entries[idx++],
> +					    &pmbus_debugfs_ops_rw_word);
> +		}
>  	}
>  
>  	return devm_add_action_or_reset(data->dev,
