Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D7D0C6FD1D
	for <linux-hwmon@archiver.kernel.org>; Wed, 15 Mar 2023 21:24:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232898AbjCOVY1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 15 Mar 2023 17:24:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232989AbjCOVYZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 15 Mar 2023 17:24:25 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EC1E5251;
        Wed, 15 Mar 2023 14:24:09 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id bf15so8437720iob.7;
        Wed, 15 Mar 2023 14:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678915448;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=lpkObVnmGcnbAiomQuPojaeuWlMi0Bq8XyCjHk6Oh70=;
        b=Sv+ONJAXpjP3b5CQwmMHCuPkmTLWBWr3ROwbwziZMvxKM3KkKfLR1RprJ5lCeZbQop
         1yffu9SvDGLHCvXKxeyXSrUvVraynolQJXPTnDMBofEl4LjOrC80k8PDWNG41cwU3wKj
         hpHlriThCh8gfWh8p87eWFWd0ed1JeyhvU1T+QG0fBwpUv6uLDtJPDAlngDJBnTW8a6J
         YS2qdciyH6U0/5cvg/2lxMPZEba1fpPoeTfUapI8rABldjqh1TSI+LkNAIdZs3lQLEO9
         sJv6zNw9OMR1q0NJVsQc4u36wJVCv3MyUFCB6E1pIXI5hrtxF772ABNgrU4+X/ADIr0C
         X7Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678915448;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lpkObVnmGcnbAiomQuPojaeuWlMi0Bq8XyCjHk6Oh70=;
        b=XA5okx8vI/RbJ1h5yIgsWpUUCH3qLZShCy5auEJZUo7t2a4X6DzTL8aFbWyna1YlfB
         L72MEmX0MSyv45eVJxw6b9N9rRjQaqPGsT4xo0qLk0bV4JdXL+f5HgJ7Bu+x8yVA/U1M
         mGGcRSJ3zN0oZGcMERz1r61t10vVAcLT3np1Pgq3tphp7t4dKmXN0VnH+DYI9UeYGx7D
         51d6jjiXLTEGNDGXG1XoF9remkPEfDRXXqM7/6h5Beist+fKM3O9rbcPLemb7x2szuDj
         cHIBch5jOEBZc+3faqL7BGmMVxUIupq/fJKLPH43EwZErc2w2eLeLYGWLmAdJMNpgQtN
         8a8w==
X-Gm-Message-State: AO0yUKXKLHnLA9fM3Bnlbj8dQtOrzMFYFmEpHZ+2dllgJXOwr0zHgJnh
        V307lTGABp7Tsq6u61iEyR2Jgw/38Rk=
X-Google-Smtp-Source: AK7set/VJfzd9pYfdVnVvFa3Q5IUrMuj90+Xi/oes7KGMXTb8BlnGNFoQYsHYW2QtCOmHdLmhnTIFw==
X-Received: by 2002:a6b:6a05:0:b0:73d:eb4b:345e with SMTP id x5-20020a6b6a05000000b0073deb4b345emr26412516iog.6.1678915448727;
        Wed, 15 Mar 2023 14:24:08 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u14-20020a02c04e000000b004049ed5bda3sm2029715jam.160.2023.03.15.14.24.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 14:24:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <269496bb-ccc2-a853-f6cd-c494433cca0a@roeck-us.net>
Date:   Wed, 15 Mar 2023 14:24:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] drivers: hwmon: ltc4282: Add support for LTC4282
Content-Language: en-US
To:     Mohammed Danish Ali <mohammed.danish.ali.14@gmail.com>,
        jdelvare@suse.com, corbet@lwn.net, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CAACz5CVXy6CjgOXF-CUC3Zd54MBWWACd=E4GgwH9=2J1gT9ZSg@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <CAACz5CVXy6CjgOXF-CUC3Zd54MBWWACd=E4GgwH9=2J1gT9ZSg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 3/15/23 14:08, Mohammed Danish Ali wrote:
> Date: Wed, 15 Mar 2023 20:48:17 +0000
> 
> Added support for LTC4282: High Current Hot Swap Controller with I2C
> Compatible Monitoring
> 
> Signed-off-by: Mohammed Danish Ali <mohammed.danish.ali.14@gmail.com <mailto:mohammed.danish.ali.14@gmail.com>>
> ---

...

> +   hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name, data, ltc4282_groups);

include/hwmon/hwmon.h:

/*
  * hwmon_device_register_with_groups() and
  * devm_hwmon_device_register_with_groups() are deprecated.
  */

Documentation/hwmon/submitting-patches.rst:

* Use devm_hwmon_device_register_with_info() or, if your driver needs a remove
   function, hwmon_device_register_with_info() to register your driver with the
   hwmon subsystem. Try using devm_add_action() instead of a remove function if
   possible. Do not use any of the deprecated registration functions.
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Please resubmit.

Thanks,
Guenter

