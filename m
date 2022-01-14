Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F965C433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 14 Jan 2022 18:44:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243198AbiANSon (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 14 Jan 2022 13:44:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236181AbiANSol (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 14 Jan 2022 13:44:41 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49634C061574
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jan 2022 10:44:41 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id e81so13371455oia.6
        for <linux-hwmon@vger.kernel.org>; Fri, 14 Jan 2022 10:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gScBbqyWDw0+3dyvIkzTNA2FCfCiH4nq9v23IRn2GuU=;
        b=ESxvp7bCxRMRFfLQ18zOc7AEbPfhV6ZF9tLMHDj4mPMny/goGyd97PKWU0jaiiFNuK
         q3hL45OddBHbKyfTniawt8B0eZOurvTuvebpMnz9cWZ5HgtEKtAzkjqZUicOVdQfjSm9
         PHebqRaFeCfk/BltA4LxOreqb7lAN+IeYiDuL+qH330t8kA8qTCfwDiFY82MhNiFYdNb
         eInsJIJ/f71YcgZbMC/ZM/kOA904nOmhe2rGMXoP/JnhPdfmh7ywGo/nFp1sxzV4GfJd
         Tx0H5Caj0x7tSFP5oJ58ywU1pqu4B52kFCp8X2NdWkiNkiFwLIfzg+bWnWX7yKkB+4NO
         I/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:to:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gScBbqyWDw0+3dyvIkzTNA2FCfCiH4nq9v23IRn2GuU=;
        b=4p/95QP9eZeHaiFI0hylPSD7Ycok00yhcT6gpG6ZTYiKguAth95ZIWfBarwbRsof5V
         kDwH2mWbxegRM6D6R1Tp8IhZu1+owNVUjwkfRqc2aBNSTrQ1l8yez0CUP5n/vUUZNvkA
         guggAbUO9QgGpFUKALqlKnvpXIuywxPIailD35fIqQzXJaNtfwitVnSIzgl2zM21Cgp6
         bDvDSXBr26vVaT66NrCLX6PKyxupwD+LCnoBk/z/2dZPXAd0gOq1QzFbBZ7IDl4yl44v
         AuE3BQ2HSrax30MJsp9WD0UpVUhqJfadsu1ycmPaRV4U4u0QJuaPTI7TAOLFXbzfigqC
         ydyw==
X-Gm-Message-State: AOAM5309AW30LnfmfHJA6RBH/HFCJkj2nJAAnVEZCgxEkdrqV+ybdR2P
        j2/9OV/PXyMeDpc+pDc8QEdsIdRHt4E=
X-Google-Smtp-Source: ABdhPJzt2+a0xVUw8YMZ3R7UV/e9nEkMdVKRtqdrrR2mgad7gAEJ1pd9/My6QnQMzUFaYg23mCFpvw==
X-Received: by 2002:a05:6808:200d:: with SMTP id q13mr6369193oiw.81.1642185880611;
        Fri, 14 Jan 2022 10:44:40 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c26sm2065951otr.65.2022.01.14.10.44.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jan 2022 10:44:39 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     michaelsh@nvidia.com, linux-hwmon@vger.kernel.org,
        vadimp@nvidia.com
References: <20220111173239.21006-1-michaelsh@nvidia.com>
 <20220111173239.21006-3-michaelsh@nvidia.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 2/2] hwmon: powr1220: Add support for Lattice's
 POWR1014 power manager IC
Message-ID: <fddc8fb4-a78e-9036-cb42-a3f9b675f07f@roeck-us.net>
Date:   Fri, 14 Jan 2022 10:44:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220111173239.21006-3-michaelsh@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 1/11/22 9:32 AM, michaelsh@nvidia.com wrote:
> From: Michael Shych <michaelsh@nvidia.com>
> 
> This patch adds support for Lattice's POWR1014 power manager IC.
> Read access to all the ADCs on the chip are supported through
> the "hwmon" "sysfs" files.
> 
> The main difference of POWR1014 compared to POWR1220 is amount
> of VMON input lines: 10 on POWR1014 and 12 lines on POWR1220.
> 
> Extend wait time for conversion to complete, since for POWR1014 it
> could be longer.
> 

That is not correct, according to the POWR1014 datasheet, and
the change is wrong anyway. More on that see below.

> Signed-off-by: Michael Shych <michaelsh@nvidia.com>
> Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
> v1->v2
> Fix added by Michael: Fix incorrect device id.
> ---
>   drivers/hwmon/powr1220.c | 27 +++++++++++++++++++++------
>   1 file changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwmon/powr1220.c b/drivers/hwmon/powr1220.c
> index 1b833781e89d..84f1508f1cbd 100644
> --- a/drivers/hwmon/powr1220.c
> +++ b/drivers/hwmon/powr1220.c
> @@ -22,6 +22,8 @@
>   #define ADC_STEP_MV			2
>   #define ADC_MAX_LOW_MEASUREMENT_MV	2000
>   
> +enum powr1xxx_chips { powr1220, powr1014 };

Please put these into (alpha)numberic order, ie powr1014 first.
Same everywhere below.

> +
>   enum powr1220_regs {
>   	VMON_STATUS0,
>   	VMON_STATUS1,
> @@ -74,6 +76,7 @@ enum powr1220_adc_values {
>   struct powr1220_data {
>   	struct i2c_client *client;
>   	struct mutex update_lock;
> +	u8 max_channels;
>   	bool adc_valid[MAX_POWR1220_ADC_VALUES];
>   	 /* the next value is in jiffies */
>   	unsigned long adc_last_updated[MAX_POWR1220_ADC_VALUES];
> @@ -128,11 +131,8 @@ static int powr1220_read_adc(struct device *dev, int ch_num)
>   		if (result)
>   			goto exit;
>   
> -		/*
> -		 * wait at least Tconvert time (200 us) for the
> -		 * conversion to complete
> -		 */
> -		usleep(200);
> +		/* wait Tconvert time (200us - 400us) for the conversion to complete */
> +		usleep_range(200, 400);

This is confusing. I don't mind using usleep_range(), but usleep_range means
that it is the kernel's choice how long to wait, and it may return after
200uS. If the chip specification states that the conversion may take up to
400uS to complete, the above may return before the conversion is complete.

So please clarify what the chip actually specifies. If the conversion time for
POWR1014 can indeed be 400uS but is only 200uS for POWR1220, the minimum sleep
time would have to be 400uS. If the above is just a personal preference change
to relax sleep time, please make it a separate patch.

Follow-up: I looked up the datasheets. The maximum conversion time for POWR1014
is 100uS, and the maximum conversion time for POWR1220 is 200uS. The above really
doesn't make sense in this context. Tconvert is never "200us - 400us" for any
of the supported chips. Please don't do that as part of an unrelated patch.
If you want to relax wait time, please submit a separate patch that includes
a rationale (and one that is correct and backed up by a datasheet).

>   
>   		/* get the ADC reading */
>   		result = i2c_smbus_read_byte_data(data->client, ADC_VALUE_LOW);
> @@ -170,6 +170,9 @@ static umode_t
>   powr1220_is_visible(const void *data, enum hwmon_sensor_types type, u32
>   		    attr, int channel)
>   {
> +	if (((struct powr1220_data *)data)->max_channels <= channel)
> +		return 0;
> +

I would prefer to have a separate variable for struct powr1220_data *
here, and please don't use Joda programming. Something like

	struct powr1220_data *data = _data;

	if (channel >= data->max_channels)
		return 0;

>   	switch (type) {
>   	case hwmon_in:
>   		switch (attr) {
> @@ -270,6 +273,8 @@ static const struct hwmon_chip_info powr1220_chip_info = {
>   	.info = powr1220_info,
>   };
>   
> +static const struct i2c_device_id powr1220_ids[];
> +
>   static int powr1220_probe(struct i2c_client *client)
>   {
>   	struct powr1220_data *data;
> @@ -282,6 +287,15 @@ static int powr1220_probe(struct i2c_client *client)
>   	if (!data)
>   		return -ENOMEM;
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
>   	mutex_init(&data->update_lock);
>   	data->client = client;
>   
> @@ -293,7 +307,8 @@ static int powr1220_probe(struct i2c_client *client)
>   }
>   
>   static const struct i2c_device_id powr1220_ids[] = {
> -	{ "powr1220", 0, },
> +	{ "powr1220", powr1220, },
> +	{ "powr1014", powr1014, },
>   	{ }
>   };
>   
> 

