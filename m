Return-Path: <SRS0=f3EG=RV=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 774B4C43381
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Mar 2019 14:17:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3C2D220657
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Mar 2019 14:17:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ASmfu1tI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727438AbfCRORv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Mar 2019 10:17:51 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43435 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726356AbfCRORv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Mar 2019 10:17:51 -0400
Received: by mail-pf1-f194.google.com with SMTP id c8so4707755pfd.10
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Mar 2019 07:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ajV7kHp2EPHQgyDnkZgcg9jWQLkBilZv9Q7JeUDgIkw=;
        b=ASmfu1tINcL5oqZUeGmbnKTuioeZi1GAsvmr3AibnFwPEYKBf0tmRptJ+2XtraNl/Q
         Xgg3/GxFsDo9N7WzU+Kzx85kATX1wtq7UYQkuE01qXqvb4ld2j5UGH9nZA8mbn6xUFB1
         cYvyngvCif1bv6JLodz94IZURCRO5E6ah5PlJEtggd9Xwcm6qdDPTB3QIuw73BZzgXYw
         COTddFqUChK5qRHQPr6MPKFMhvl+OEYi/L2oSW3STuQxaLPhLOtLl3n8C5QUegRjE3pF
         AU6jMuYtrE3Zda3HG5pcDdSH4u0vWPbpnIiZxwzTEKUUHiTlpSLg3a2WkE7NeIMoOdvJ
         3C7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ajV7kHp2EPHQgyDnkZgcg9jWQLkBilZv9Q7JeUDgIkw=;
        b=mhLEyfifOo30toKVPCLe4GWm4ubJNACEBKes0rm9Iula+OVYZgyUmS30I0G4wUZjJ6
         0nVSKx1U1C578YTCNRDAmK0gnJdN0gnvronIRZchv/w5jsjTxcwKqFJMgCAjJxFzw8TQ
         mmL+wZn16CPHC4kBNJFPpPDcrsEDPhwqAFfbsGNPQP3c1XgZmDKNuok2ymhRzZsZK6ve
         MVsmr7IppwVWF5LBRZJA8mF1+aPs+zQHf4T8Iv+4pBC0B52BKFkWdkMLbRc3sQlKRVYj
         1NlYIsWO7qyGDZMA9Civ+bv77OXXIg2XfRG+F1mdd1MXpbgDlHzJEsUvowzRwxO/EEad
         9L9g==
X-Gm-Message-State: APjAAAX+0Mtt5Bnw487NF7DC0VaCjkT1ZRT42jpoFyqBTWDfj3btGbod
        sNg5lBSn+OYYptuH+94tDPptOLE6
X-Google-Smtp-Source: APXvYqyMeg0BM8zlGpB650d/yfjSn7nMhZHHsDey6eojsmyE5Hlm6y/t7cWLmVTX+2/wXBsCp/7pTw==
X-Received: by 2002:a65:5cc4:: with SMTP id b4mr17992889pgt.334.1552918670376;
        Mon, 18 Mar 2019 07:17:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 8sm1252018pfs.50.2019.03.18.07.17.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Mar 2019 07:17:49 -0700 (PDT)
Subject: Re: [PATCH v1 hwmon-next] hwmon: (mlxreg-fan) Add support for fan
 capability registers
To:     Vadim Pasternak <vadimp@mellanox.com>
Cc:     linux-hwmon@vger.kernel.org
References: <20190318105324.2602-1-vadimp@mellanox.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <476542da-23fd-0062-ce87-002356410b4d@roeck-us.net>
Date:   Mon, 18 Mar 2019 07:17:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190318105324.2602-1-vadimp@mellanox.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 3/18/19 3:53 AM, Vadim Pasternak wrote:
> Add support for fan capability registers in order to distinct between
> the systems which have minor fan configuration differences. This
> reduces the amount of code used to describe such systems.
> The capability registers provides system specific information about the
> number of physically connected tachometers and system specific fan
> speed scale parameter.
> For example one system can be equipped with twelve fan tachometers,
> while the other with for example, eight or six. Or one system should
> use default fan speed divider value, while the other has a scale
> parameter defined in hardware, which should be used for divider
> setting.
> Reading this information from the capability registers allows to use the
> same fan structure for the systems with the such differences.
> 
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> ---
>   drivers/hwmon/mlxreg-fan.c | 78 +++++++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 73 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
> index db8c6de0b6a0..5a4d5348516a 100644
> --- a/drivers/hwmon/mlxreg-fan.c
> +++ b/drivers/hwmon/mlxreg-fan.c
> @@ -27,7 +27,10 @@
>   #define MLXREG_FAN_SPEED_MAX			(MLXREG_FAN_MAX_STATE * 2)
>   #define MLXREG_FAN_SPEED_MIN_LEVEL		2	/* 20 percent */
>   #define MLXREG_FAN_TACHO_SAMPLES_PER_PULSE_DEF	44
> -#define MLXREG_FAN_TACHO_DIVIDER_DEF		1132
> +#define MLXREG_FAN_TACHO_DIVIDER_MIN		283
> +#define MLXREG_FAN_TACHO_DIVIDER_DEF		(MLXREG_FAN_TACHO_DIVIDER_MIN \
> +						 * 4)

This is where the unnecessary MLXREG_FAN prefix really starts to hurt.

> +#define MLXREG_FAN_TACHO_DIVIDER_SCALE_MAX	64
>   /*
>    * FAN datasheet defines the formula for RPM calculations as RPM = 15/t-high.
>    * The logic in a programmable device measures the time t-high by sampling the
> @@ -360,12 +363,57 @@ static const struct thermal_cooling_device_ops mlxreg_fan_cooling_ops = {
>   	.set_cur_state	= mlxreg_fan_set_cur_state,
>   };
>   
> +static int mlxreg_fan_connect_verify(struct mlxreg_fan *fan,
> +				     struct mlxreg_core_data *data,
> +				     bool *connected)
> +{
> +	u32 regval;
> +	int err;
> +
> +	err = regmap_read(fan->regmap, data->capability, &regval);
> +	if (err) {
> +		dev_err(fan->dev, "Failed to query capability register 0x%08x\n",
> +			data->capability);
> +		return err;
> +	}
> +
> +	*connected = (regval & data->bit) ? true : false;
> +
> +	return 0;
> +}

This function could be simplified by returning an int, negative for error or 0/1.
	return !!(regval & data->bit);
Even if not,
	*connected = regval & data->bit;
would do or, if you want to be explicit,
	*connected = !!(regval & data->bit);

> +
> +static int mlxreg_fan_speed_divider_get(struct mlxreg_fan *fan,
> +					struct mlxreg_core_data *data)
> +{
> +	u32 regval;
> +	int err;
> +
> +	err = regmap_read(fan->regmap, data->capability, &regval);
> +	if (err) {
> +		dev_err(fan->dev, "Failed to query capability register 0x%08x\n",
> +			data->capability);
> +		return err;
> +	}
> +
> +	/*
> +	 * Set divider value according to the capability register, in case it
> +	 * contains valid value. Otherwise use default value. The purpose of
> +	 * this validation is to protect against the old hardware, in which
> +	 * this register can be un-initialized.

un-initialized -> random ? "can return zero" might be a better description if
that is what it is.


> +	 */
> +	if (regval > 0 && regval <= MLXREG_FAN_TACHO_DIVIDER_SCALE_MAX)
> +		fan->divider = regval * MLXREG_FAN_TACHO_DIVIDER_MIN;
> +
> +	return 0;
> +}
> +
>   static int mlxreg_fan_config(struct mlxreg_fan *fan,
>   			     struct mlxreg_core_platform_data *pdata)
>   {
>   	struct mlxreg_core_data *data = pdata->data;
> -	bool configured = false;
> +	bool configured = false, connected = false;
>   	int tacho_num = 0, i;
> +	int err;
>   
>   	fan->samples = MLXREG_FAN_TACHO_SAMPLES_PER_PULSE_DEF;
>   	fan->divider = MLXREG_FAN_TACHO_DIVIDER_DEF;
> @@ -376,6 +424,18 @@ static int mlxreg_fan_config(struct mlxreg_fan *fan,
>   					data->label);
>   				return -EINVAL;
>   			}
> +
> +			if (data->capability) {
> +				err = mlxreg_fan_connect_verify(fan, data,
> +								&connected);
> +				if (err)
> +					return err;
> +				if (!connected) {
> +					tacho_num++;
> +					continue;
> +				}
> +			}
> +
>   			fan->tacho[tacho_num].reg = data->reg;
>   			fan->tacho[tacho_num].mask = data->mask;
>   			fan->tacho[tacho_num++].connected = true;
> @@ -394,13 +454,21 @@ static int mlxreg_fan_config(struct mlxreg_fan *fan,
>   				return -EINVAL;
>   			}
>   			/* Validate that conf parameters are not zeros. */
> -			if (!data->mask || !data->bit) {
> +			if (!data->mask && !data->bit && !data->capability) {
>   				dev_err(fan->dev, "invalid conf entry params: %s\n",
>   					data->label);
>   				return -EINVAL;
>   			} > -			fan->samples = data->mask;
> -			fan->divider = data->bit;
> +			if (data->capability) {
> +				err = mlxreg_fan_speed_divider_get(fan, data);
> +				if (err)
> +					return err;
> +			} else {
> +				if (data->mask)
> +					fan->samples = data->mask;
> +				if (data->bit)
> +					fan->divider = data->bit;
> +			}
>   			configured = true;
>   		} else {
>   			dev_err(fan->dev, "invalid label: %s\n", data->label);
> 

