Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B62C43334
	for <linux-hwmon@archiver.kernel.org>; Wed,  8 Jun 2022 04:51:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbiFHEvY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 8 Jun 2022 00:51:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232732AbiFHEuB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 8 Jun 2022 00:50:01 -0400
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD1AC2509EC
        for <linux-hwmon@vger.kernel.org>; Tue,  7 Jun 2022 18:14:35 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-fe023ab520so2189624fac.10
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Jun 2022 18:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language:to
         :references:from:subject:in-reply-to:content-transfer-encoding;
        bh=kBIySTAJjbizEz0lOsKHr+uK6tOPrCBwD+VayVTxzQ4=;
        b=MCDZPQAJ1bc7E7TWI/TddSwSc40DI04iu6X924AaRYf5W/F3LaTHb1YGDUMVwF6jLB
         ZKf7oqSVm2WMQF7YCqd4Tmnr8/v/LpJCj+LwdLJJlNlDBGf/lJC7lawn8zW+zza1/tts
         W4tY98XaiC6q/vJVCmP8Qu/a7kW9qWM5kPgTUdlsdXIvKtkSzDFJmf/+wvBS3NNCsIZn
         YYkjG27Bl3tXJM9E/ZzFX9oTppKe6efxyqGhPEUod94Z/ySYv4MWzA57ttEcscvjMwin
         cOsDCijtZo+aW1NE1ZF6DDFO31qv5M7LQZwMAg3kjWj84R1xyLHfLJr+IvVphiVIt12f
         Kj2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:to:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=kBIySTAJjbizEz0lOsKHr+uK6tOPrCBwD+VayVTxzQ4=;
        b=TXHYGQcBfSVHHTciEKb+yEy6RDVY/Y+hBs4YfUtY2lvgZD0uMV0vYHAO2BLGGtS9o0
         +1lZX5orCPaQB5ei18GFNdbLCM76/mlXVBD12gYdlp4VrHFhQy0pS/SoNP91U1JYXy3i
         5OJeO+ywIWiZgqzakTjWMqJr/2DN5dakpu4+lcfhxDPmd9x6TNIzoHY6tlE3EXrxJLdQ
         1qOAnVmgEfykds0WFIdlkPKEV0IFkexB8tsJdB1nrJEVby9hZUUK4LLoxyY6gqKIJrYr
         aBN3TfECu22EacglWvCjfH5LMD49Vuf5BzftGnGCjtMoZjp/hOUfyP6Ekp9RjdGxIrBp
         hUfA==
X-Gm-Message-State: AOAM530VBCZveDUlu7OhwOKjRn+kPVyyDIpA3cAKxAD7idALlJVmBen/
        LNgEQnPWUtleiIkeKOG0KuLzZJ7gF4c=
X-Google-Smtp-Source: ABdhPJxdWG4xXsD6AUUk8HYb3a1sp2KVyaroExaee8tgvUl2jx/z7X5ur0NHy3KnHqe+lWN8b8BGAw==
X-Received: by 2002:a05:6870:f2a9:b0:f2:c0bc:411d with SMTP id u41-20020a056870f2a900b000f2c0bc411dmr990648oap.239.1654650814848;
        Tue, 07 Jun 2022 18:13:34 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m8-20020a0568080f0800b00325cda1ff94sm11165785oiw.19.2022.06.07.18.13.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 18:13:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <cf1a2ff9-59b3-fb2d-62fd-bdeac57bb9c0@roeck-us.net>
Date:   Tue, 7 Jun 2022 18:13:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To:     Jim Wright <wrightj@linux.ibm.com>, linux-hwmon@vger.kernel.org,
        joel@jms.id.au, openbmc@lists.ozlabs.org
References: <20220607205306.145636-1-wrightj@linux.ibm.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hwmon: (ucd9000) Add voltage monitor types
In-Reply-To: <20220607205306.145636-1-wrightj@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 6/7/22 13:53, Jim Wright wrote:
> The UCD90240 and UCD90320 devices support monitor types "Input Voltage",
> "Voltage With AVS", and "Input Voltage With AVS", add support to driver
> to recognize these types as voltage monitors.
> 
> Signed-off-by: Jim Wright <wrightj@linux.ibm.com>
> ---
>   drivers/hwmon/pmbus/ucd9000.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
> index 75fc770c9e40..28cc214d4d6b 100644
> --- a/drivers/hwmon/pmbus/ucd9000.c
> +++ b/drivers/hwmon/pmbus/ucd9000.c
> @@ -45,6 +45,9 @@ enum chips { ucd9000, ucd90120, ucd90124, ucd90160, ucd90320, ucd9090,
>   #define UCD9000_MON_TEMPERATURE	2
>   #define UCD9000_MON_CURRENT	3
>   #define UCD9000_MON_VOLTAGE_HW	4
> +#define UCD9000_MON_INPUT_VOLTAGE	5
> +#define UCD9000_MON_VOLTAGE_AVS	6
> +#define UCD9000_MON_INPUT_VOLTAGE_AVS	7
>   
>   #define UCD9000_NUM_FAN		4
>   
> @@ -566,6 +569,9 @@ static int ucd9000_probe(struct i2c_client *client)
>   		switch (UCD9000_MON_TYPE(block_buffer[i])) {
>   		case UCD9000_MON_VOLTAGE:
>   		case UCD9000_MON_VOLTAGE_HW:
> +		case UCD9000_MON_INPUT_VOLTAGE:
> +		case UCD9000_MON_VOLTAGE_AVS:
> +		case UCD9000_MON_INPUT_VOLTAGE_AVS:
>   			info->func[page] |= PMBUS_HAVE_VOUT
>   			  | PMBUS_HAVE_STATUS_VOUT;
>   			break;

I don't think it makes sense to claim VOUT support if the chip is
configured to monitor input voltages. This should probably be something
like

...
 > +		case UCD9000_MON_VOLTAGE_AVS:
 >   			info->func[page] |= PMBUS_HAVE_VOUT
 >   			  | PMBUS_HAVE_STATUS_VOUT;
 >   			break;
		case UCD9000_MON_INPUT_VOLTAGE:
		case UCD9000_MON_INPUT_VOLTAGE_AVS:
			info->func[page] |= PMBUS_HAVE_VIN;
  			break;

with appropriate mapping code to map the READ_VIN command for the
affected pages to READ_VOUT. Question is if the limit registers on
those pages are also reporting the limits using the vout limit
commands; if so, those should be mapped as well.

Guenter
