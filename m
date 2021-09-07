Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAD3FC433F5
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Sep 2021 15:46:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8CD146103D
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Sep 2021 15:46:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345471AbhIGPrc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Sep 2021 11:47:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345510AbhIGPrb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 7 Sep 2021 11:47:31 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CC06C06175F;
        Tue,  7 Sep 2021 08:46:25 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id l7-20020a0568302b0700b0051c0181deebso13288403otv.12;
        Tue, 07 Sep 2021 08:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NIrqxGSKd6RMNR1eLcDFMwmrSMGWYh5vzoGzwvUUHvE=;
        b=bnXSKXKHyG40vqGjfoK/H6dfcy8CzEmHLWrIuFVOrk0jPecLvgVZldWRJafUb2RqM7
         VsBGUb4800cqKbHpQ7Wr5sPB33Adr15lJ9ppHa+WAG8ZfLt0+nguSesKCADc0V2GjGjJ
         o03Nefj0dpnnVyS67nmFT8iPyyrvOIKa08HdVXieS7APg68Kyn63PKv7zCD/zhFZO7aW
         59RGbF0u+SEMQZKSn2Yf479xzTepF0e4w73jQSsTPp2iTmq0CRBFmUrGR7/7cDuPPeh+
         FHUlE7N1VtUvSCusJH/GT4FTdwsMcXFip4F3rkNYcHjCo4GACr8Eh+r42ThYMBpKRw0+
         RlUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NIrqxGSKd6RMNR1eLcDFMwmrSMGWYh5vzoGzwvUUHvE=;
        b=shj085y8nv/dbNHm27pQbxSnDGMPk4RBeID5zgPJfrpSW9LZxIw0brGAc/EwtzXApI
         9WR/K/4apmfsRWQ+clHihDaNTzFAuEgpu+G1rt/65gbOas/XZ2lsxvEGlNh0DDsWRbAq
         xbAoVsSpCnKFeuEQ/WlW5B7hBpJt2Ib6p0JC/TnZMhTjmO8lB/MucbBPUnGJmRjokYWW
         IoNZHtMl2jNpwbFlnhKBTb4zcECSOhHCl8SYuZH0Dg5HZY/7qFH2zuewSQmEXubEXYo8
         Yd1C7xCQEs1U2eoZcM7ylIiDzfa4G3YUj1NaHJezO2LmJymkhWlSj6XCR3DSOjGp/C03
         YC7Q==
X-Gm-Message-State: AOAM533uOC/EsA9x+R27aohAiygHlYMwo8Mo6EfghwJL5hc4JlJeWnTr
        oQXNs6Md68q2iw0tVszT63WvOMds5vs=
X-Google-Smtp-Source: ABdhPJyxjS+SDIuMnkT56qj9j9bNX1Bwf/lHqUpDOFj13ky8lEldalkdStQfqiZn53tGD1Unhp9WJA==
X-Received: by 2002:a05:6830:2487:: with SMTP id u7mr16397228ots.235.1631029584556;
        Tue, 07 Sep 2021 08:46:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n13sm2471383otr.11.2021.09.07.08.46.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 08:46:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 4/8] hwmon: (tmp421) add support for defining labels from
 DT
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
References: <cover.1631021349.git.krzysztof.adamski@nokia.com>
 <22639314543a98b4c24e55b7e5a803325ad9e568.1631021349.git.krzysztof.adamski@nokia.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <30814a02-10f1-2590-26a5-b3f6ff367be1@roeck-us.net>
Date:   Tue, 7 Sep 2021 08:46:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <22639314543a98b4c24e55b7e5a803325ad9e568.1631021349.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/7/21 6:43 AM, Krzysztof Adamski wrote:
> tmp42x is a multichannel temperature sensor with several external
> channels. Since those channels can be used to connect diodes placed
> anywhere in the system, their meaning will vary depending on the
> project. For this case, the hwmon framework has an idea of labels which
> allows us to assign the meaning to each channel.
> 
> The similar concept is already implemented in ina3221 - the label for
> each channel can be defined via device tree. See commit a9e9dd9c6de5
> ("hwmon: (ina3221) Read channel input source info from DT")
> 
> This patch adds support for similar feature to tmp421.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> ---
>   drivers/hwmon/tmp421.c | 51 ++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 51 insertions(+)
> 
> diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
> index 1068fe59df0b..a1dba1d405ee 100644
> --- a/drivers/hwmon/tmp421.c
> +++ b/drivers/hwmon/tmp421.c
> @@ -88,6 +88,7 @@ static const struct of_device_id __maybe_unused tmp421_of_match[] = {
>   MODULE_DEVICE_TABLE(of, tmp421_of_match);
>   
>   struct tmp421_channel {
> +	const char *label;
>   	s16 temp;
>   };
>   
> @@ -177,6 +178,16 @@ static int tmp421_read(struct device *dev, enum hwmon_sensor_types type,
>   
>   }
>   
> +static int tmp421_read_string(struct device *dev, enum hwmon_sensor_types type,
> +			     u32 attr, int channel, const char **str)
> +{
> +	struct tmp421_data *data = dev_get_drvdata(dev);
> +
> +	*str = data->channel[channel].label;
> +
> +	return 0;
> +}
> +
>   static umode_t tmp421_is_visible(const void *data, enum hwmon_sensor_types type,
>   				 u32 attr, int channel)
>   {
> @@ -187,6 +198,8 @@ static umode_t tmp421_is_visible(const void *data, enum hwmon_sensor_types type,
>   		return 0444;
>   	case hwmon_temp_input:
>   		return 0444;
> +	case hwmon_temp_label:
> +		return 0444;
>   	default:
>   		return 0;
>   	}
> @@ -279,9 +292,45 @@ static int tmp421_detect(struct i2c_client *client,
>   	return 0;
>   }
>   
> +void tmp421_probe_child_from_dt(struct i2c_client *client,
> +				struct device_node *child,
> +				struct tmp421_data *data)
> +
> +{
> +	struct device *dev = &client->dev;
> +	u32 i;
> +	int err;
> +
> +	err = of_property_read_u32(child, "reg", &i);
> +	if (err) {
> +		dev_err(dev, "missing reg property of %pOFn\n", child);
> +		return;

Report to caller

> +	} else if (i > MAX_CHANNELS) {

else after return is pointless.

> +		dev_err(dev, "invalid reg %d of %pOFn\n", i, child);
> +		return;

Again report to caller.

> +	}
> +
> +	of_property_read_string(child, "label", &data->channel[i].label);
> +	if (data->channel[i].label)
> +		data->temp_config[i] |= HWMON_T_LABEL;
> +
> +}
> +
> +void tmp421_probe_from_dt(struct i2c_client *client, struct tmp421_data *data)
> +{
> +	struct device *dev = &client->dev;
> +	const struct device_node *np = dev->of_node;
> +	struct device_node *child;
> +
> +	for_each_child_of_node(np, child) {
> +		tmp421_probe_child_from_dt(client, child, data);
> +	}
> +}
> +
>   static const struct hwmon_ops tmp421_ops = {
>   	.is_visible = tmp421_is_visible,
>   	.read = tmp421_read,
> +	.read_string = tmp421_read_string,
>   };
>   
>   static int tmp421_probe(struct i2c_client *client)
> @@ -310,6 +359,8 @@ static int tmp421_probe(struct i2c_client *client)
>   	for (i = 0; i < data->channels; i++)
>   		data->temp_config[i] = HWMON_T_INPUT | HWMON_T_FAULT;
>   
> +	tmp421_probe_from_dt(client, data);
> +
>   	data->chip.ops = &tmp421_ops;
>   	data->chip.info = data->info;
>   
> 

