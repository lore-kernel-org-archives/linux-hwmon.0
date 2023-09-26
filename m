Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A27F0E7E644
	for <linux-hwmon@archiver.kernel.org>; Tue, 26 Sep 2023 15:14:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235086AbjIZPOq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 26 Sep 2023 11:14:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234996AbjIZPOm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 26 Sep 2023 11:14:42 -0400
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4080C10E
        for <linux-hwmon@vger.kernel.org>; Tue, 26 Sep 2023 08:14:26 -0700 (PDT)
Received: from eig-obgw-6009a.ext.cloudfilter.net ([10.0.30.184])
        by cmsmtp with ESMTP
        id kqNFqAPzsWU1cl9lZqqv5o; Tue, 26 Sep 2023 15:14:25 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
        by cmsmtp with ESMTPS
        id l9lVqF6fqwit9l9lXq0AXq; Tue, 26 Sep 2023 15:14:24 +0000
X-Authority-Analysis: v=2.4 cv=SNxR6cjH c=1 sm=1 tr=0 ts=6512f550
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=CKMxHAookNUaJbGn3r6bzg==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=oz0wMknONp8A:10 a=vU9dKmh3AAAA:8
 a=2s8rLCK1qyt2EROP6YQA:9 a=QEXdDO2ut3YA:10 a=rsP06fVo5MYu2ilr0aT5:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
        ; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=tFehZFUz2mgeuaZcpcNi7NzcZi1PkHLpBmLwRVsFYbI=; b=eHisMWLMLzfIReZUFGxm1ohNEK
        uyo3pMfKDA98Oge0kHc8Tjn5Mw5C1od5yOK2DU7hH9fhjLWHmgjpoYCLSnnfrcZZ+PQGkU/TpwzbF
        kviXHhIOOY3z0xN8Fja9h80hz/Fzi+jpnNWSDFfm5vJb+bD+WFLneUGFKK/dEL3tkS1CI3GVvcnY6
        0jCHsORlX6b2t72zRQrmG1f6Rrky+vP45ySrpcxC/C50DkuN2AydC0sHVHg212mfmUL0i5uM3/BMm
        QpMcmgBz33pO9EQQmRK08+LIZRIRYAV1LVHQr6YLl3Pvk2mK/3/mHnxpSJGjpzaiiS17ruTtrO0cM
        4OanJQnA==;
Received: from [103.163.95.214] (port=36664 helo=[192.168.1.101])
        by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <saravanan@linumiz.com>)
        id 1ql9lR-004OcK-2J;
        Tue, 26 Sep 2023 20:44:17 +0530
Message-ID: <45bc18bf-eb2c-4dab-d610-6ce787694fe7@linumiz.com>
Date:   Tue, 26 Sep 2023 20:44:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 3/3] hwmon: (pmbus/mpq2286) Add a support for mpq2286
 Power Management IC
To:     Guenter Roeck <linux@roeck-us.net>, sravanhome@gmail.com,
        lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        jdelvare@suse.com
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org
References: <20230911034150.181880-1-saravanan@linumiz.com>
 <20230911034150.181880-4-saravanan@linumiz.com>
 <5acb9307-2be1-dcd2-fdb7-b2842c7ff24d@roeck-us.net>
Content-Language: en-US
From:   Saravanan Sekar <saravanan@linumiz.com>
In-Reply-To: <5acb9307-2be1-dcd2-fdb7-b2842c7ff24d@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 103.163.95.214
X-Source-L: No
X-Exim-ID: 1ql9lR-004OcK-2J
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.101]) [103.163.95.214]:36664
X-Source-Auth: saravanan@linumiz.com
X-Email-Count: 1
X-Org:  HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfP1BplFnceOB8LUnH/lTIrj9vaucafhQc9plt6NeJulXaLSLelSU0+Qp3yOWCoriF48onNH4s21rAPvaAlg2e9763pOOHLnbPA9ILtsCHdhDZPgW4U78
 Pf81LYNiZYuG+xqcVoPqR8ObN/jcM3kinF3shPK0rOz8VcBEsORdJsVY5AOIrgpc+zI4ianmRuPxmAGCTphRpCTrdHj2dC1mbUY=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 11/09/23 09:53, Guenter Roeck wrote:
> On 9/10/23 20:41, Saravanan Sekar wrote:
>> The MPQ2286 is a programmable, high frequency synchronous buck regulator
>> designed to power a variety of Automotive system peripherals. Single buck
>> converters with hardware monitoring capability is configurable over PMBus
>> interface.
>>
>> Signed-off-by: Saravanan Sekar <saravanan@linumiz.com>
>> ---
>>   drivers/hwmon/pmbus/mpq7932.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/hwmon/pmbus/mpq7932.c 
>> b/drivers/hwmon/pmbus/mpq7932.c
>> index af3e5e9590c8..3ffeece28e2d 100644
>> --- a/drivers/hwmon/pmbus/mpq7932.c
>> +++ b/drivers/hwmon/pmbus/mpq7932.c
>> @@ -21,6 +21,7 @@
>>   #define MPQ7932_N_VOLTAGES        256
>>   #define MPQ7932_VOUT_MAX        0xFF
>>   #define MPQ7932_NUM_PAGES        6
>> +#define MPQ2286_NUM_PAGES        1
>>   #define MPQ7932_TON_DELAY        0x60
>>   #define MPQ7932_VOUT_STARTUP_SLEW    0xA3
>> @@ -130,12 +131,14 @@ static int mpq7932_probe(struct i2c_client *client)
>>   static const struct of_device_id mpq7932_of_match[] = {
>>       { .compatible = "mps,mpq7932", .data = (void *)MPQ7932_NUM_PAGES },
>> +    { .compatible = "mps,mpq2286", .data = (void *)MPQ2286_NUM_PAGES },
>>       {},
>>   };
>>   MODULE_DEVICE_TABLE(of, mpq7932_of_match);
>>   static const struct i2c_device_id mpq7932_id[] = {
>>       { "mpq7932", },
>> +    { "mpq2286", },
> 
> Please keep alphabetic order.

agree, will change in v2

> 
>>       { },
>>   };
>>   MODULE_DEVICE_TABLE(i2c, mpq7932_id);
> 
> This is one of those super-secret automotive chips where almost no 
> information
> is available to the public. I'll need authoritative confirmation that 
> all the
> various parameters (b. m, output voltage format, minimum and maximum output
> voltage, step size) match mpq7932 exactly. That is rarely the case, so 
> consider
> me skeptic.

Thanks for your time for review. yes, datasheet is not available in 
public but Monolithic shall share on request. I confirm all the 
parameters are match with mpq7932 datasheet and I have tested the device.

> 
> Guenter
> 

Thanks,
Saravanan
