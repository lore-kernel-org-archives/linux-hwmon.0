Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA56BC433EF
	for <linux-hwmon@archiver.kernel.org>; Mon,  2 May 2022 04:24:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382555AbiEBE2I (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 2 May 2022 00:28:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382603AbiEBE2E (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 2 May 2022 00:28:04 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B0901EEC6
        for <linux-hwmon@vger.kernel.org>; Sun,  1 May 2022 21:24:37 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-e5ca5c580fso13339501fac.3
        for <linux-hwmon@vger.kernel.org>; Sun, 01 May 2022 21:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ytlvokIsoDFpbUDzzwFDwel8NPom1BBubq6xB+XTF+4=;
        b=kUe3RRCe4id0/s2Rspr6QsYXyQqktIeJCzklOuXIaqzel1jfH1lJoq/GVbMs7Bv5LT
         G0vNzQDvqMbTt3HDvGXag4a7Kxg2U9fK4l0pCcLV1aC0mlDDg9SErGpE5SHOPw2RroMQ
         zegl0n0lsdtAmrBjlsis/XDh75zD4vz5u4IUbzvuDx2UpCkoZGKBBaNk9k5Qq5Y/aB8Q
         hDiXTgPi7xZOHfLq+UrxnKQU2rTfg6GB6XAyuG3wfTDHkaBBEL8XunGYDgEeldAZkiF9
         /OhZ8NDsxpg5elZ4od1YIR78EYQ58YHEoYZ5wYorINOVwKhkWXH4AABuz0qsbZb0HK/T
         ZmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=ytlvokIsoDFpbUDzzwFDwel8NPom1BBubq6xB+XTF+4=;
        b=iHvLM7m/4wzo/LtqaJZI5qi2ffkA1PAIBv9QJx8WayIMBf0sre8+zb5xgjNZJVzddm
         pON4TQ33bhuBNlHrr+p3ZG71KW9zHM0DOUqiCGo1tqjIgxTBihx+zxxi64QogKYPg4GF
         hrGzcs/5tKirKhuwRS/SHezOXU680g3e4gRtHl/hpOSAsXn3TCKAWLQ2dsQKnVOFJRw6
         hFnxosR8B/Fmk+uhRp2x0lcdPlEu5RVs9/FaOZeJ0X2n0bs9A8hBl11dDFjlK7++IXyE
         ECO4Wu17dCTh+f0WcfTv9RRGvdESh31Dwk6YpUVWaVj1GaQs44PbCuAxMBlOBQHJ+5iG
         +0rg==
X-Gm-Message-State: AOAM532kIyjvAYSSY9/UIMBDKeQ9NJBZRtmyXhkUv0RFocvSyl4nFQsV
        3YKXT8v1d8DVQSSR/ODiTA8=
X-Google-Smtp-Source: ABdhPJzXIdaSvR5Mvc1jL9uDmcKPZVWlhvn3JsyUZcHYjv7/TzZFxLEp7hYOEI3WBMhpYlspS2Aj7A==
X-Received: by 2002:a05:6870:4345:b0:de:f347:e2cd with SMTP id x5-20020a056870434500b000def347e2cdmr5508722oah.113.1651465476370;
        Sun, 01 May 2022 21:24:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v4-20020a9d4e84000000b006060322124bsm2505650otk.27.2022.05.01.21.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 21:24:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 1 May 2022 21:24:34 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?iso-8859-1?Q?M=E5rten?= Lindahl <marten.lindahl@axis.com>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel@axis.com
Subject: Re: [PATCH v4 3/4] hwmon: (pmbus/ltc2978) Add chip specific
 write_byte_data
Message-ID: <20220502042434.GA1717760@roeck-us.net>
References: <20220428144039.2464667-1-marten.lindahl@axis.com>
 <20220428144039.2464667-4-marten.lindahl@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220428144039.2464667-4-marten.lindahl@axis.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Apr 28, 2022 at 04:40:38PM +0200, Mårten Lindahl wrote:
> Several of the manuals for devices supported by this driver describes
> the need for a minimum wait time before the chip is ready to receive
> next command.
> 
> This wait time is already implemented in the driver as a ltc_wait_ready
> function with a driver defined wait time of 100 ms, and is considered
> for specific devices before reading/writing data on the pmbus.
> 
> Since this driver uses the default pmbus_regulator_ops for the enable/
> disable/is_enabled functions we should add a driver specific callback
> for write_byte_data to prevent bypassing the wait time recommendations
> for the following devices: ltc3880/ltc3882/ltc3883/ltc3884/ltc3886/
> ltc3887/ltc3889/ltm4664/ltm4675/ltm4676/ltm4677/ltm4678/ltm4680/ltm4686/
> ltm4700/ltc7880.
> 
> Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/ltc2978.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
> index 0127273883f0..531aa674a928 100644
> --- a/drivers/hwmon/pmbus/ltc2978.c
> +++ b/drivers/hwmon/pmbus/ltc2978.c
> @@ -196,6 +196,17 @@ static int ltc_read_byte_data(struct i2c_client *client, int page, int reg)
>  	return pmbus_read_byte_data(client, page, reg);
>  }
>  
> +static int ltc_write_byte_data(struct i2c_client *client, int page, int reg, u8 value)
> +{
> +	int ret;
> +
> +	ret = ltc_wait_ready(client);
> +	if (ret < 0)
> +		return ret;
> +
> +	return pmbus_write_byte_data(client, page, reg, value);
> +}
> +
>  static int ltc_write_byte(struct i2c_client *client, int page, u8 byte)
>  {
>  	int ret;
> @@ -681,6 +692,7 @@ static int ltc2978_probe(struct i2c_client *client)
>  	info = &data->info;
>  	info->write_word_data = ltc2978_write_word_data;
>  	info->write_byte = ltc_write_byte;
> +	info->write_byte_data = ltc_write_byte_data;
>  	info->read_word_data = ltc_read_word_data;
>  	info->read_byte_data = ltc_read_byte_data;
>  
