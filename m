Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F039FC433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 15 Oct 2021 22:47:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C974F611EE
	for <linux-hwmon@archiver.kernel.org>; Fri, 15 Oct 2021 22:47:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243365AbhJOWtv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 15 Oct 2021 18:49:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238716AbhJOWtu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 15 Oct 2021 18:49:50 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1ECCC061570;
        Fri, 15 Oct 2021 15:47:43 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id n63so15163718oif.7;
        Fri, 15 Oct 2021 15:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NBfI6iqUhgdHU2sIOkBbmdc8dIihDrGyO66JJlyVlaQ=;
        b=oRhSCps/w1QuMYW/jz5QdN4sMZacTAY2tRZF1TnJggT3AQGN7pWt+7Pt8v2ZsEXkx5
         W54Z0yljUx9CElyqvfsNr6jelULTcw8M5j+Y1MHgwxkOqZEbDfpbRcCm3J2O9RhsgYfi
         pxhE4OPNXJMBBar9SolRwXEBcXkWSE1EZ3wsQuUGQlrz0aA8Jtuufrv6we1FtVrbdKzD
         xx/LNlKnraJTgWg0T5PDp4U7B7KYRxsDW+/PEYPZMNXFzOHTdJKK7L1H481vgciqjAtR
         cvpd6IWfUkJekDHTcMDM+PRSWY23dd1nzpGNvdtUD3d52obAKYwgewQR2xP7gTpcv4BK
         OXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=NBfI6iqUhgdHU2sIOkBbmdc8dIihDrGyO66JJlyVlaQ=;
        b=vOsIUGZ4OEDSteQQEckDdm/LI0TrtG1BJG48Ez/tOEpyP4uqTYQ6I+5HoSP+wxmPI1
         +8AASE0Q3ga0N1+QurY/LjV1Z/nabgLYBMbivI0itjLGZuqYQlh5ezyYy4/T6cvpsnMA
         NJy8PhLUxaLqHfLyyuMlvfhSzdb8FgOT3bpAwigCVQ3rnG0xrQI4jOOmaD9Zl1PqTgOv
         z7QJ1XpQR1yXEikiFKjp9qLEbFzEKocxuE8yPsAOn+BP3sP3bqSbkST/DJ06mOc5hdLE
         HlKRt96pQdn7d/Q4ME9WrHNwLJ+8HNwBfRhMnMfggEnlmzmeIutq3pYnz/azDXsrE4YU
         BGhQ==
X-Gm-Message-State: AOAM532ZkMqXl1AZRJF4SIG/Kzkz1HkoMtwlR3czjb33j9YNOsNIl2XY
        9Y6V+NU0QQT3e3B8z8gU9qc=
X-Google-Smtp-Source: ABdhPJw2gcAsrVYl0CL/c/gfRoVabKTb1jmVHRgtidIJa1baPtew5EPjE9/CRNWlFhF7w2TvZYXRjQ==
X-Received: by 2002:aca:5e07:: with SMTP id s7mr19112527oib.15.1634338063116;
        Fri, 15 Oct 2021 15:47:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t24sm1503944otk.58.2021.10.15.15.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:47:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 15 Oct 2021 15:47:41 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 3/9] hwmon: (tmp421) support disabling channels from DT
Message-ID: <20211015224741.GA1484653@roeck-us.net>
References: <cover.1634206677.git.krzysztof.adamski@nokia.com>
 <a85d623f0792b862870933a875bdf802f4c017f1.1634206677.git.krzysztof.adamski@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a85d623f0792b862870933a875bdf802f4c017f1.1634206677.git.krzysztof.adamski@nokia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Oct 14, 2021 at 03:01:09PM +0200, Krzysztof Adamski wrote:
> The previous patch introduced per channel subnodes in DT that let us
> specify some channel specific properties. This built a ground for easily
> disabling individual channels of the sensor that may not be connected to
> any external diode and thus are not returning any meaningful data.
> 
> This patch adds support for parsing the "status" property of channels DT
> subnodes and makes sure the -ENODATA is returned when disabled channels
> value is read.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>

Same problem as with patch 2/9. Any idea what happened ?

Anyway, applied after fixing it up.

Guenter

> ---
>  drivers/hwmon/tmp421.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
> index 89346ca6c9a9..af08bc985a13 100644
> --- a/drivers/hwmon/tmp421.c
> +++ b/drivers/hwmon/tmp421.c
> @@ -89,6 +89,7 @@ MODULE_DEVICE_TABLE(of, tmp421_of_match);
>  
>  struct tmp421_channel {
>  	const char *label;
> +	bool enabled;
>  	s16 temp;
>  };
>  
> @@ -170,6 +171,9 @@ static int tmp421_read(struct device *dev, enum hwmon_sensor_types type,
>  	if (ret)
>  		return ret;
>  
> +	if (!tmp421->channel[channel].enabled)
> +		return -ENODATA;
> +
>  	switch (attr) {
>  	case hwmon_temp_input:
>  		*val = temp_from_raw(tmp421->channel[channel].temp,
> @@ -323,6 +327,8 @@ static int tmp421_probe_child_from_dt(struct i2c_client *client,
>  	if (data->channel[i].label)
>  		data->temp_config[i] |= HWMON_T_LABEL;
>  
> +	data->channel[i].enabled = of_device_is_available(child);
> +
>  	return 0;
>  }
>  
> @@ -371,8 +377,10 @@ static int tmp421_probe(struct i2c_client *client)
>  	if (err)
>  		return err;
>  
> -	for (i = 0; i < data->channels; i++)
> +	for (i = 0; i < data->channels; i++) {
>  		data->temp_config[i] = HWMON_T_INPUT | HWMON_T_FAULT;
> +		data->channel[i].enabled = true;
> +	}
>  
>  	err = tmp421_probe_from_dt(client, data);
>  	if (err)
