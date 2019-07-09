Return-Path: <SRS0=fIHL=VG=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7EBDC73C47
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Jul 2019 13:20:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ACB0A214AF
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Jul 2019 13:20:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vXhbKNee"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbfGINU6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 9 Jul 2019 09:20:58 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:44234 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726820AbfGINU6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Jul 2019 09:20:58 -0400
Received: by mail-pl1-f194.google.com with SMTP id t14so6998931plr.11
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Jul 2019 06:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nAcp9pIYt1USFBhSR/gBh8+vRV9hSxleFVFThrZb6EY=;
        b=vXhbKNeeY/6NIDnzJdwF9C8t3dpufuOXPrlK2iTiKbvDDodOxxVrf0X5zmDsEhLYJG
         qv0kgfrebahPpKo3Is96bbXKAz0I17CUhbYhhlQs7UJgoZ8HxIgh893tSDVSrQTwJKJd
         NPzklR3I7o6F1uM5NA2G+6LGI1R22w0Lu08UXtmyPccLe25OsGuC9CBMicY0u3of/zbU
         Q7eP2AvdFH6aPNIdK7tmwEeD9MC/eUlE6oy2wRoeI+2FyH4wK14t3FSVea8zY89vkm1d
         oa0QlvjBspaNGoU/uAPHTOk5HiDlv0/bcoaMeGlfQufKYyEcPPxsKAngL9aD7vrha+sa
         H7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nAcp9pIYt1USFBhSR/gBh8+vRV9hSxleFVFThrZb6EY=;
        b=TRYCF0z02PosfMVv1NyIdDJjlthfQ4j3vGru/XKOcVQqztRjYCEmNzKWgEdr56CcL8
         XMIkqLJPV1tdnBpknSSNH2V5OY4MjbSsmm52SrqmOxiXVkLvAidOGBOMyD3k3cMZ6szF
         LX0bwzAfF3W/21paU8J7bmmWsgx2B4yiC8de72NiQpAEvcNKCXbGuzWcFiqqflUKZoXM
         SmB5yfB8iw+dJZ7L+BOZfyrG64DzfAuT+9zVVBdBlSlTjttmqL4PPpYGD7MBEkpylOTT
         nMcBuDSBG43r9HrkcEPbkwXek48t3zzil79RgHqIc+9BzeZhwrLkqquIGe6OuWHLTS9Y
         6fZQ==
X-Gm-Message-State: APjAAAUn+4wPqhPgd4+T5bI9bLn2nymT6JdAbiUgcCx26uWMNed2zdwY
        Iy24hEHEX92YFT0M+Mkm7S3Ohzn6
X-Google-Smtp-Source: APXvYqzDnxIrGy/qc/BJFR8KNsfzm2I4PBY1/zksC3dnP8x5W79KXuvTZycqe6Qeux5xgHyNcGjQyw==
X-Received: by 2002:a17:902:7448:: with SMTP id e8mr32216998plt.85.1562678457422;
        Tue, 09 Jul 2019 06:20:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s66sm26613667pgs.39.2019.07.09.06.20.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jul 2019 06:20:56 -0700 (PDT)
Subject: Re: [PATCH v1 1/5] hwmon: (lm75) Add kind field to struct lm75_data
To:     Iker Perez <iker.perez@codethink.co.uk>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20190709095052.7964-1-iker.perez@codethink.co.uk>
 <20190709095052.7964-2-iker.perez@codethink.co.uk>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <e8f78059-db4a-1829-8c9b-7b006335bc60@roeck-us.net>
Date:   Tue, 9 Jul 2019 06:20:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190709095052.7964-2-iker.perez@codethink.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/9/19 2:50 AM, Iker Perez wrote:
> From: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>
> 
> The purpose of this change is to store the kind of device the
> kernel is working with.
> 
> Signed-off-by: Iker Perez del Palomar Sustatxa <iker.perez@codethink.co.uk>
> ---
>   drivers/hwmon/lm75.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
> index 3fb9c0a2d6d0..0209e0719784 100644
> --- a/drivers/hwmon/lm75.c
> +++ b/drivers/hwmon/lm75.c
> @@ -68,6 +68,7 @@ struct lm75_data {
>   	u8			resolution;	/* In bits, between 9 and 16 */
>   	u8			resolution_limits;
>   	unsigned int		sample_time;	/* In ms */
> +	enum lm75_type		kind;
>   };
>   
>   /*-----------------------------------------------------------------------*/
> @@ -237,15 +238,16 @@ lm75_probe(struct i2c_client *client, const struct i2c_device_id *id)
>   	struct device *dev = &client->dev;
>   	struct device *hwmon_dev;
>   	struct lm75_data *data;
> +	struct lm75_data device_data;
>   	int status, err;
>   	u8 set_mask, clr_mask;
>   	int new;
> -	enum lm75_type kind;
>   
> +	data = &device_data;

This makes no sense.

>   	if (client->dev.of_node)
> -		kind = (enum lm75_type)of_device_get_match_data(&client->dev);
> +		data->kind = (enum lm75_type)of_device_get_match_data(&client->dev);
>   	else
> -		kind = id->driver_data;
> +		data->kind = id->driver_data;
>   
... because data is overwritten a couple of lines below when it is allocated.

You would do something like

	data->kind = kind;

after data was allocated. Looking at the above code, though, I really wonder if
and how you tested it.

Guenter

>   	if (!i2c_check_functionality(client->adapter,
>   			I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA))
> @@ -267,7 +269,7 @@ lm75_probe(struct i2c_client *client, const struct i2c_device_id *id)
>   	set_mask = 0;
>   	clr_mask = LM75_SHUTDOWN;		/* continuous conversions */
>   
> -	switch (kind) {
> +	switch (data->kind) {
>   	case adt75:
>   		clr_mask |= 1 << 5;		/* not one-shot mode */
>   		data->resolution = 12;
> 

