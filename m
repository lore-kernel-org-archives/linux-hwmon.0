Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AB53C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Jul 2022 03:40:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbiGUDkh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 20 Jul 2022 23:40:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbiGUDkf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 20 Jul 2022 23:40:35 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5687442AE6
        for <linux-hwmon@vger.kernel.org>; Wed, 20 Jul 2022 20:40:34 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id w7so632451plp.5
        for <linux-hwmon@vger.kernel.org>; Wed, 20 Jul 2022 20:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=S0qr9SymR+KbwhOQpdo/sy7c/OPbBigCD20C7M24V9M=;
        b=qa0fJ8gn1cpmWheqWqC16EuWTDeX3Sn2yRJeLTvFwVQF6grXwo4bd/qB88BqXpMmcv
         SNUqp3jtqPFvNc2CXwVVU4qFL3nO8aMR2unFsLNdSi0eSE29KEr10oyy/4sbqqSobagL
         qAg7+XJC9dVQywP1BKc8AH5h+LRVNH82kr8wVMjCjeJluVYW6CtWazTqgz+KJNkURzfE
         tPpO6JxFFUnJni1pImFg1o0JiPp1fMRiqiuvEHCDKFzrsN9x2BpByhZYLZpTRND5ewu2
         6D8UYmDZWii+nAkZGdccH1bQjRUo0wdfpgktSxQqWdUqe6WMStKjm3YfcPgcygKtZV7B
         HH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=S0qr9SymR+KbwhOQpdo/sy7c/OPbBigCD20C7M24V9M=;
        b=DRclpOXE8Gwxr5korXIjLU41eD4NIsHkgWMfdspFvt9jk8F/HSwwr4u9XbnzpX1hEJ
         Y2KvZ8+6Zf7jGyZ/fDjkYXH1zz0Tqur/fDhRK90mpulJ+WHOvXolssOBTEeBL/Dgjxui
         o7zDzctrHuIZQWaMabItWM/nFRShjgNf4wcGxj4g5uxoCQRHOU98ZkNOout7Ugt8IUeu
         zupEKi6IDybOME0hsP8e+h8+oxYnU/bpuAKzKehWUDrogKpm6Sqd1S2KSSZj2fqUYvYp
         HfXpIeFiDK+1Fjs80ItkUwESfzo2yk4EKi4iUb7S7pUDuWW/iPoAbIKX+7QvFv/WiKu9
         vhSQ==
X-Gm-Message-State: AJIora/EDSVmAFfeXAzqmw+1DVivTTsw5cnYArkfOIb8vPXbnS9okovq
        tHTIPchQ5PIpKoONGZ6fPd/IFoyTMmU2ZQ==
X-Google-Smtp-Source: AGRyM1vJJD0gUl5PnlZU1LbI7umfjauMMs/L0MEBw5olPSFBe63qD+l+UjqUcRd1pics/jotr6r27g==
X-Received: by 2002:a17:90b:2252:b0:1f2:2e7:fb45 with SMTP id hk18-20020a17090b225200b001f202e7fb45mr8959518pjb.17.1658374833749;
        Wed, 20 Jul 2022 20:40:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i8-20020a170902c94800b0016d2dc52eb1sm362890pla.18.2022.07.20.20.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 20:40:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 20 Jul 2022 20:40:32 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Alexandru Gagniuc <mr.nuke.me@gmail.com>
Cc:     robert.marko@sartura.hr, linux-hwmon@vger.kernel.org,
        luka.perkov@sartura.hr, jdelvare@suse.com
Subject: Re: [PATCH] hwmon: (tps23861) fix byte order in current and voltage
 registers
Message-ID: <20220721034032.GA1642353@roeck-us.net>
References: <20220721032255.2850647-1-mr.nuke.me@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220721032255.2850647-1-mr.nuke.me@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Jul 20, 2022 at 10:22:55PM -0500, Alexandru Gagniuc wrote:
> Trying to use this driver on a big-endian machine results in garbage
> values for voltage and current. The tps23861 registers are little-
> endian, and regmap_read_bulk() does not do byte order conversion. Thus
> on BE machines, the most significant bytes got modified, and were
> trimmed by the VOLTAGE_CURRENT_MASK.
> 
> To resolve this use uint16_t values, and convert them to host byte
> order using le16_to_cpu(). This results in correct readings on MIPS.
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/tps23861.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwmon/tps23861.c b/drivers/hwmon/tps23861.c
> index 8bd6435c13e8..e07f6b8a1898 100644
> --- a/drivers/hwmon/tps23861.c
> +++ b/drivers/hwmon/tps23861.c
> @@ -140,7 +140,8 @@ static int tps23861_read_temp(struct tps23861_data *data, long *val)
>  static int tps23861_read_voltage(struct tps23861_data *data, int channel,
>  				 long *val)
>  {
> -	unsigned int regval;
> +	uint16_t regval;
> +	long raw_val;
>  	int err;
>  
>  	if (channel < TPS23861_NUM_PORTS) {
> @@ -155,7 +156,8 @@ static int tps23861_read_voltage(struct tps23861_data *data, int channel,
>  	if (err < 0)
>  		return err;
>  
> -	*val = (FIELD_GET(VOLTAGE_CURRENT_MASK, regval) * VOLTAGE_LSB) / 1000;
> +	raw_val = le16_to_cpu(regval);
> +	*val = (FIELD_GET(VOLTAGE_CURRENT_MASK, raw_val) * VOLTAGE_LSB) / 1000;
>  
>  	return 0;
>  }
> @@ -163,8 +165,9 @@ static int tps23861_read_voltage(struct tps23861_data *data, int channel,
>  static int tps23861_read_current(struct tps23861_data *data, int channel,
>  				 long *val)
>  {
> -	unsigned int current_lsb;
> -	unsigned int regval;
> +	long raw_val, current_lsb;
> +	uint16_t regval;
> +
>  	int err;
>  
>  	if (data->shunt_resistor == SHUNT_RESISTOR_DEFAULT)
> @@ -178,7 +181,8 @@ static int tps23861_read_current(struct tps23861_data *data, int channel,
>  	if (err < 0)
>  		return err;
>  
> -	*val = (FIELD_GET(VOLTAGE_CURRENT_MASK, regval) * current_lsb) / 1000000;
> +	raw_val = le16_to_cpu(regval);
> +	*val = (FIELD_GET(VOLTAGE_CURRENT_MASK, raw_val) * current_lsb) / 1000000;
>  
>  	return 0;
>  }
