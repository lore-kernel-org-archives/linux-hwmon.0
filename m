Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4821C25B4E
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Jan 2023 15:14:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234158AbjAXPOY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 24 Jan 2023 10:14:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233992AbjAXPOX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Jan 2023 10:14:23 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03FD5470A0
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Jan 2023 07:14:22 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id n20-20020a17090aab9400b00229ca6a4636so18004290pjq.0
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Jan 2023 07:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nsn51J1gH9Yb3IRURvfNBn4uVGd6ILE70cJUebMVeQQ=;
        b=Q8gDf18QgDXYYaQZSvENZiy1uTsmmQMMMQPraGxPJ8qjrBswhk+XuGvVZIezTYGKPU
         B26iJxcYUkLhBW185Nh5nQJaEHQqNkIYZQEpi+uSK/ZmCKosfopKrvsYZm3zLG3Sjttn
         QLO6+IdhFMM/PLaxKSUFKxdcHnLsyzIIYsrhVzc6/jQ6tK50ra2DIoq5k5goyCEnepF4
         GS8y4jsdpE7Xy3VERy2apYd0Pi8fU05z8u9OA8IStcIE+C91PbBL1ApiUPIhjwv1SZD2
         /CRigIiIYRuNt2AV6D+XsTfGxK0sJpAS4sZtwKX1qJH/ush/LMT9FdYIyILsGEG3hVFl
         D+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nsn51J1gH9Yb3IRURvfNBn4uVGd6ILE70cJUebMVeQQ=;
        b=VvlXVlri9VXlcpQQ1QviJzxwg8rZUS98wcAPCOBrV7xBbxI1xq3K4eUil9KpS9TB8y
         a+2QJCWso80WNXMmys/oJ+ETgr1xdfTPGewLWxSDx7VbCsyNAAD2sv1UM9TpyMErCTq6
         s0PgpbED/EnDgMfoWg6gRo75aC71LOe0ui14Khfuk+ndRJ6ByzEscuxy2oofzn1lD4Sf
         ubWviCpfz26J9lxTH6YD7dmg2/owdo3WU1xFdYBeF02wKaIW3j1ZU4wLK8EtTlYN+hll
         fD2g3J8MUlt2jVPfAI1iVusYfqiwYlF1kSpvOTYjqWn3TnbnuKIH9pVv/28Gf9Cuj4sX
         K8WA==
X-Gm-Message-State: AFqh2kpVy92+9ZEOi02+tgv7M334R2N/eGLIHLG9k8cIBGqNCRqemkte
        AqLkdFvNzYQwgNeRRoGonAvv/Q==
X-Google-Smtp-Source: AMrXdXuEW9/o8vSQGT0BvtzSvjWO/BoUrlnvSIRTGHBeH6wdgO9oTlWGGwC7ImfJ3Hj3Xs48+LcV1A==
X-Received: by 2002:a17:90b:3cb:b0:229:2441:53e3 with SMTP id go11-20020a17090b03cb00b00229244153e3mr29157705pjb.39.1674573261368;
        Tue, 24 Jan 2023 07:14:21 -0800 (PST)
Received: from ?IPV6:2405:201:d02f:d899:2028:7962:400:43b6? ([2405:201:d02f:d899:2028:7962:400:43b6])
        by smtp.gmail.com with ESMTPSA id l2-20020a17090ad10200b00218daa55e5fsm1676422pju.12.2023.01.24.07.14.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 07:14:20 -0800 (PST)
Message-ID: <7de492aa-8622-b0d3-f932-2e8d7dcb8704@9elements.com>
Date:   Tue, 24 Jan 2023 20:44:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 2/2] hwmon: (pmbus/tda38640) Add driver for Infineon
 TDA38640 Voltage Regulator
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-kernel@vger.kernel.org
References: <20230124144847.423129-1-Naresh.Solanki@9elements.com>
 <20230124144847.423129-2-Naresh.Solanki@9elements.com>
 <94176a1b-f9ad-b096-fc39-5e333f4eb09f@linaro.org>
From:   Naresh Solanki <naresh.solanki@9elements.com>
In-Reply-To: <94176a1b-f9ad-b096-fc39-5e333f4eb09f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



On 24-01-2023 08:39 pm, Krzysztof Kozlowski wrote:
> On 24/01/2023 15:48, Naresh Solanki wrote:
>> From: Patrick Rudolph <patrick.rudolph@9elements.com>
>>
>> Add the pmbus driver for the Infineon TDA38640 voltage regulator.
>>
>> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
>> Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
>> ---
> 
> (...)
> 
>> +
>> +#include <linux/err.h>
>> +#include <linux/i2c.h>
>> +#include <linux/init.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/regulator/driver.h>
>> +#include "pmbus.h"
>> +
>> +static const struct regulator_desc __maybe_unused tda38640_reg_desc[] = {
>> +	PMBUS_REGULATOR("vout", 0),
>> +};
>> +
>> +static struct pmbus_driver_info tda38640_info = {
>> +	.pages = 1,
>> +	.format[PSC_VOLTAGE_IN] = linear,
>> +	.format[PSC_VOLTAGE_OUT] = linear,
>> +	.format[PSC_CURRENT_OUT] = linear,
>> +	.format[PSC_CURRENT_IN] = linear,
>> +	.format[PSC_POWER] = linear,
>> +	.format[PSC_TEMPERATURE] = linear,
>> +
>> +	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT
>> +	    | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
>> +	    | PMBUS_HAVE_IIN
>> +	    | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
>> +	    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT
>> +	    | PMBUS_HAVE_POUT | PMBUS_HAVE_PIN,
>> +#if IS_ENABLED(CONFIG_SENSORS_TDA38640_REGULATOR)
>> +	.num_regulators = 1,
>> +	.reg_desc = tda38640_reg_desc,
>> +#endif
>> +};
>> +
>> +static int tda38640_probe(struct i2c_client *client)
>> +{
>> +	return pmbus_do_probe(client, &tda38640_info);
>> +}
>> +
>> +static const struct i2c_device_id tda38640_id[] = {
>> +	{"tda38640", 0},
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(i2c, tda38640_id);
>> +
>> +static const struct of_device_id __maybe_unused tda38640_of_match[] = {
>> +	{ .compatible = "infineon,tda38640"},
>> +	{ },
>> +};
>> +MODULE_DEVICE_TABLE(of, tda38640_of_match);
> 
> No improvements here. Do not send new version without solving the
> feedback (or finishing the discussion). Its usage is still missing in
> your i2c_driver.
I realized I missed reference to tda38640_of_match below.

static struct i2c_driver tda38640_driver = {
         .driver = {
                    .name = "tda38640",
                    .of_match_table = of_match_ptr(tda38640_of_match),
                    },
         .probe_new = tda38640_probe,
         .id_table = tda38640_id,
};

Will fix that.
> 
> Best regards,
> Krzysztof
> 
Thanks,
Naresh
