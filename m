Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96691C433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 21 Jan 2022 14:13:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380989AbiAUONU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 21 Jan 2022 09:13:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380987AbiAUONT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Jan 2022 09:13:19 -0500
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98592C061574
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Jan 2022 06:13:19 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id s9so13620551oib.11
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Jan 2022 06:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZHF2uMaQEoj4gWpSK6JJ0fIR2mxbV16ODtDocU4EZpg=;
        b=JlDcQF2P1Yifb5rQhx00q3YbfUdVOHSGycyq69PiiFTBj+WvzRBs1VhoKdbYFhVGIl
         qc+UckEd/0i6dIRkp/NKnbk09PNHPNZbznGkgfcNVeynY1nGkt6qGOSEDWrqLIKOwiVv
         cvFTOWhJWqdd1FfE2dKBJ0JYAlNAmiy5g4SU3kt0ZPUrCBVEYqhtk8ckPixYBWIDwa5y
         NEGI8oIjQYVL+sF60+rFTKeAjHLnBqPnS5pUTwMEUJ+uHDMSe9ZO1Sy4n1XTV8u34Vwg
         bO5BWx2C/caOGngsky2clphrf8Zt7InXo+OJ1LfgIKmlwBstAFQmqsL38VGrgc+dtcb6
         xF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=ZHF2uMaQEoj4gWpSK6JJ0fIR2mxbV16ODtDocU4EZpg=;
        b=HHs4KgaZ4h0G9YcOOlQIemhHs2uwq6fk7KxzGCNEBceHO9O31bcYa/DyNvrw44+jRM
         SK45GHxyUjVejo1vmDgG7zD7kF+s9TwaNyQxlBV2XrntWCtaDE12G0yb/qb68boc09Bb
         flPC/dskEym8dhgFda6/eiUMCYhr6l+flwpxd10tE1vmKyuFtPak/ZN83PJ72i7ygwI+
         LLnZgivpeCyLdb69RZhUCClep6u7d6CPjj/4X4QzRdCeYV2oOUl9Ox+LCvtGDmUpDV+c
         J7kiqjUDxVsdL8gPpCGUwHZx3WgG90BSTcewFc7tXojriiaxfjFMP2jqiizmxSB5okfw
         I1mw==
X-Gm-Message-State: AOAM533INkWqmdzWn6Pulcg7IjjBHWAdAWfxtoyZPga573rEJT+6FoYg
        e1SxHfWJXA8U6RteSdABC+Y9vPU8ONg=
X-Google-Smtp-Source: ABdhPJxT/QdSk1eMSzf7oHZCG3+U0ghFBVUx2oq64yiN9k4x8rHm7QfZrDCp7gjuYa//rXImFqA7yA==
X-Received: by 2002:a05:6808:21a3:: with SMTP id be35mr664272oib.115.1642774398983;
        Fri, 21 Jan 2022 06:13:18 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c5sm1035213otl.67.2022.01.21.06.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 06:13:18 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 21 Jan 2022 06:13:17 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     michaelsh@nvidia.com
Cc:     linux-hwmon@vger.kernel.org, vadimp@nvidia.com
Subject: Re: [PATCH v3 3/3] hwmon: powr1220: Add support for Lattice's
 POWR1014 power manager IC
Message-ID: <20220121141317.GA308603@roeck-us.net>
References: <20220118075611.10665-1-michaelsh@nvidia.com>
 <20220118075611.10665-4-michaelsh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220118075611.10665-4-michaelsh@nvidia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Jan 18, 2022 at 09:56:11AM +0200, michaelsh@nvidia.com wrote:
> From: Michael Shych <michaelsh@nvidia.com>
> 
> This patch adds support for Lattice's POWR1014 power manager IC.
> Read access to all the ADCs on the chip are supported through
> the "hwmon" "sysfs" files.
> 
> The main differences of POWR1014 compared to POWR1220 are
> amount of VMON input lines: 10 on POWR1014 and 12 lines on POWR1220 and
> number of output control signals: 14 on POWR1014 and 20 on POWR1220.
> 
> Signed-off-by: Michael Shych <michaelsh@nvidia.com>
> Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>

Applied.

Thanks,
Guenter

> ---
> v2->v3
> Fixes according to Guenter Roeck notes
> 1. Correct commit notes.
> 2. Don't use usleep_range
> 3. Change devicenames in alphanumeric order.
> 4. Chanhge if statement
> v1->v2
> Fix added by Michael: Fix incorrect device id.
> ---
>  drivers/hwmon/powr1220.c | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/powr1220.c b/drivers/hwmon/powr1220.c
> index 1d4e005977b6..2a5e168a52a9 100644
> --- a/drivers/hwmon/powr1220.c
> +++ b/drivers/hwmon/powr1220.c
> @@ -22,6 +22,8 @@
>  #define ADC_STEP_MV			2
>  #define ADC_MAX_LOW_MEASUREMENT_MV	2000
>  
> +enum powr1xxx_chips { powr1014, powr1220 };
> +
>  enum powr1220_regs {
>  	VMON_STATUS0,
>  	VMON_STATUS1,
> @@ -74,6 +76,7 @@ enum powr1220_adc_values {
>  struct powr1220_data {
>  	struct i2c_client *client;
>  	struct mutex update_lock;
> +	u8 max_channels;
>  	bool adc_valid[MAX_POWR1220_ADC_VALUES];
>  	 /* the next value is in jiffies */
>  	unsigned long adc_last_updated[MAX_POWR1220_ADC_VALUES];
> @@ -171,6 +174,11 @@ static umode_t
>  powr1220_is_visible(const void *data, enum hwmon_sensor_types type, u32
>  		    attr, int channel)
>  {
> +	struct powr1220_data *chip_data = (struct powr1220_data *)data;
> +
> +	if (channel >= chip_data->max_channels)
> +		return 0;
> +
>  	switch (type) {
>  	case hwmon_in:
>  		switch (attr) {
> @@ -271,6 +279,8 @@ static const struct hwmon_chip_info powr1220_chip_info = {
>  	.info = powr1220_info,
>  };
>  
> +static const struct i2c_device_id powr1220_ids[];
> +
>  static int powr1220_probe(struct i2c_client *client)
>  {
>  	struct powr1220_data *data;
> @@ -283,6 +293,15 @@ static int powr1220_probe(struct i2c_client *client)
>  	if (!data)
>  		return -ENOMEM;
>  
> +	switch (i2c_match_id(powr1220_ids, client)->driver_data) {
> +	case powr1014:
> +		data->max_channels = 10;
> +		break;
> +	default:
> +		data->max_channels = 12;
> +		break;
> +	}
> +
>  	mutex_init(&data->update_lock);
>  	data->client = client;
>  
> @@ -296,7 +315,8 @@ static int powr1220_probe(struct i2c_client *client)
>  }
>  
>  static const struct i2c_device_id powr1220_ids[] = {
> -	{ "powr1220", 0, },
> +	{ "powr1014", powr1014, },
> +	{ "powr1220", powr1220, },
>  	{ }
>  };
>  
