Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61E7EC433FE
	for <linux-hwmon@archiver.kernel.org>; Mon, 21 Feb 2022 16:56:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381365AbiBUQ4h (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 21 Feb 2022 11:56:37 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381369AbiBUQ4c (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 21 Feb 2022 11:56:32 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7107722535
        for <linux-hwmon@vger.kernel.org>; Mon, 21 Feb 2022 08:56:08 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id w27so2038168lfa.5
        for <linux-hwmon@vger.kernel.org>; Mon, 21 Feb 2022 08:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=qMaUHdHSaoqMzRCmrXLiM/4uMA9yGBrUvPZjtOXxu2c=;
        b=I86sHKsmN316iJQeieLo+Up4Y66eH8Eo/vVM9mQ9YoRBLpsw2cStZ1j+Sg8h2PG1Xu
         XH8cxtd8bJCZeAy401M1pN8+MyYQpmjEeBi02/XaPvOGyDDsRsQl5EmuMcyMQXEgmNZE
         kFSjoA9A49utQhnbqH/1f6G1SHvIGMezHynXcNmfY7c7TFlpdpy1FFF+uIYBu77Geph1
         jvgBntKnsFlkLAuQv88JN4VcfTGoFkqCb4r84F/uaUU2D6acoCUNxBOVmt7Ltc0PZ0td
         sBAj2w3kkTcIW0yhyz6FINeQ9Eo3unuYNR00XMAwvS9K84ILAYoNY6xVC5VPWWlx9UF7
         a0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qMaUHdHSaoqMzRCmrXLiM/4uMA9yGBrUvPZjtOXxu2c=;
        b=VNIN/niSU/noprSj79sJSFAe/j+NGpfRTwzAsn8ttI3ASzC87Hc3zTV8oZKJgpemi2
         l+llj82Y7XoA80StBr9ggu4i5jbKTtfj4OgS7Xtdp1kf/2lRy/iVGgBpsA+iPeYR3R5r
         5HE2TeyjL5lcc05FYvw6J4ONHcoWNdqI4mVsj6iOn4+QNbsdR5Y0SFXtVY/PKWiKvVth
         fj1OvHB4ZVl42pIZvTPFFF7sNMZJMznp8eCIC3CutGPovIYMreh0Mp20wdk7eLkirXK5
         7+L/cELgrmSAcQL12QuNkqKemju8oLWkMmc42xCdlANLRdJ7em3d8TP/ZRm3yapSsRrY
         SoDA==
X-Gm-Message-State: AOAM5307BoLMz36xg89uYwoP83TueCYEFDEBUfTrG5ACB+y105IzhvBS
        8axPQf2SRjrwIdbySfw0F6s=
X-Google-Smtp-Source: ABdhPJxWYFCa+FEsHpmIrf8tIntbmHoYdH1Tjd+Beb1hnmafOuFl7ayj8zzc3Ngvn6X8ZfRaSW0QVQ==
X-Received: by 2002:ac2:51d0:0:b0:43a:df78:18c with SMTP id u16-20020ac251d0000000b0043adf78018cmr14623537lfm.168.1645462566863;
        Mon, 21 Feb 2022 08:56:06 -0800 (PST)
Received: from [192.168.2.145] (109-252-138-165.dynamic.spd-mgts.ru. [109.252.138.165])
        by smtp.googlemail.com with ESMTPSA id c1sm1165115lfc.49.2022.02.21.08.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Feb 2022 08:56:06 -0800 (PST)
Message-ID: <9ad46103-381b-ac0e-c263-cde0d26eab46@gmail.com>
Date:   Mon, 21 Feb 2022 19:56:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] hwmon: Handle failure to register sensor with thermal
 zone correctly
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>,
        Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>, Jon Hunter <jonathanh@nvidia.com>
References: <20220221164434.4169560-1-linux@roeck-us.net>
From:   Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20220221164434.4169560-1-linux@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

21.02.2022 19:44, Guenter Roeck пишет:
> diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
> index 3501a3ead4ba..4bfe3791a5ba 100644
> --- a/drivers/hwmon/hwmon.c
> +++ b/drivers/hwmon/hwmon.c
> @@ -214,12 +214,14 @@ static int hwmon_thermal_add_sensor(struct device *dev, int index)
>  
>  	tzd = devm_thermal_zone_of_sensor_register(dev, index, tdata,
>  						   &hwmon_thermal_ops);
> -	/*
> -	 * If CONFIG_THERMAL_OF is disabled, this returns -ENODEV,
> -	 * so ignore that error but forward any other error.
> -	 */
> -	if (IS_ERR(tzd) && (PTR_ERR(tzd) != -ENODEV))
> -		return PTR_ERR(tzd);
> +	if (IS_ERR(tzd)) {
> +		if (PTR_ERR(tzd) != -ENODEV)
> +			return PTR_ERR(tzd);
> +		dev_warn(dev, "Failed to register temp%d_input with thermal zone\n",
> +			 index + 1);

Do we really need this warning? I suppose it should be okay if sensor
isn't attached to any device in a device-tree and just reports temperature.
