Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61243ECAAD3
	for <linux-hwmon@archiver.kernel.org>; Sun,  4 Sep 2022 14:10:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbiIDOK0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 4 Sep 2022 10:10:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233765AbiIDOKZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 4 Sep 2022 10:10:25 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ED382652
        for <linux-hwmon@vger.kernel.org>; Sun,  4 Sep 2022 07:10:24 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id o4so6171901pjp.4
        for <linux-hwmon@vger.kernel.org>; Sun, 04 Sep 2022 07:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date;
        bh=/gHBjKku3P8caFwwAMIPXhFBShRIJ0U2g3RpNf94/7k=;
        b=AtnwMSPJEBsTMyufxEdrGKx3rLIdydFUmWAvlx3hwGObbrSrjLVZML0ZwrxeJ7q+Ep
         aQWTZJMz3QEA3WqogN0ZKLDcyfIQ+v449NUDIz1mA4zKgw4wT7Cswndcht6rkDa4zZj1
         /DuThg/6ygVFJT1ifiV2nGa4fnarJ33IaEAPSpLdfcSQ9RAFJF1Z4AggBVZF+/9T4CXZ
         wh7/IDegTIJH+zicW2FKW3zoMypvsO19/oOxtXx/TXAUiZZtb1W1NLkIZNfue6AN+G+3
         1g61KFvRxgnMpXWVP19Ku6W/ET088Ea0aWCKjxU1LKAcRdnUBsZY8bhIdJxz4LvINc+s
         TCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date;
        bh=/gHBjKku3P8caFwwAMIPXhFBShRIJ0U2g3RpNf94/7k=;
        b=D2jV/WbuuWR64v3Kqcn3qIl/+qo8Kz68j/FJnOTeMownhTshxIFiXpgxGfmwk/oy3x
         G/EcF2SanPGZJwZZLU5unA00LGHdYDL+oMFKlkNPtCzlJ7o6xaX6O+73u+ZCcABBX177
         jNznCd5iIY7Gfy+4Z7VJ/wMQDdIMFi4wwoUDzwdwLUknCpgXdDt1UeJZv+0bUSpB1xng
         /SAD6vGEdIh9nnIbl1myXVS39GVRABX4sn8DzmqP0N9CDaMjobdn6pckQr9aCg5p+5hz
         hTMUutj3w5nu2IFbO6mZ5OqLTHXSaTwUx2Pn5kvX/P+stc6wSqYaxKivdNcAI7M4weYW
         bUDw==
X-Gm-Message-State: ACgBeo0lHhni1MMh32nxbxlrUGik+X61O2o61OQcFk4vndxFiBUcnnMm
        XabGtwVTInYfYc/+2xkacdkiiqGDbTV8Rw==
X-Google-Smtp-Source: AA6agR4nf0ceOu4X8RBjT9NyoIEGErZP8cxSRcAHLRHP2S1fbAjprO/zObcGiJdMFs6ZKhutHZWYrQ==
X-Received: by 2002:a17:90a:c789:b0:1fa:6bc0:77f6 with SMTP id gn9-20020a17090ac78900b001fa6bc077f6mr15254214pjb.1.1662300623804;
        Sun, 04 Sep 2022 07:10:23 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k14-20020aa79d0e000000b0052d2b55be32sm5872495pfp.171.2022.09.04.07.10.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Sep 2022 07:10:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1d234266-af01-5d8e-408f-ca58b53d870e@roeck-us.net>
Date:   Sun, 4 Sep 2022 07:10:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Issue in asus_ec_sensors in Fedora installations and other
 distributions
Content-Language: en-US
To:     Eugene Shalygin <eugene.shalygin@gmail.com>
Cc:     Christopher Klooz <py0xc3@my.mail.de>, linux-hwmon@vger.kernel.org,
        regressions@lists.linux.dev
References: <6026b5e2-a8f5-1058-6112-f191bde333a6@my.mail.de>
 <47e41e8f-f6b2-4bc7-de3f-0c811ee6fdf7@my.mail.de>
 <62fb8a16-bebd-5de7-0b4f-eed4d2593587@roeck-us.net>
 <CAB95QATHd1sJwbYOPeb28j9vZAfZAu-Xa+pXWUhbMTVifKz93A@mail.gmail.com>
 <5e42685d-ae82-d74d-4883-d8a9e9fcb243@roeck-us.net>
 <CAB95QAQ9EXX3uZhiZyxr=aAwiSR6j6i1GstFg9iX4eF06b5GUQ@mail.gmail.com>
 <ac202c2e-3add-2470-3fa6-85783c1494a0@roeck-us.net>
 <CAB95QAT=x8V7yg70azPnnD=Hv70goQbA6S8fOVjRpsvKfcK8Ww@mail.gmail.com>
 <2f14746c-8051-b711-cd28-7ca521d21c4d@roeck-us.net>
 <CAB95QARMOq0ie0SmhRx73L=mptTaa-eEHfNjGRH5CXvVFh-RLw@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <CAB95QARMOq0ie0SmhRx73L=mptTaa-eEHfNjGRH5CXvVFh-RLw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/4/22 06:19, Eugene Shalygin wrote:
> On Sun, 4 Sept 2022 at 01:47, Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> A driver with a probe function can be unloaded and reloaded manually.
>> I don't see how you can do that if the functions are marked __init
>> and the driver is built into the kernel.
> 
> Did that and a user tested those changes. Unfortunately, the ACPI EC
> is still inoperational if a module uses the ACPI id of the EC device
> and its probe function returns an error. Looks like I have to change
> MODULE_DEVICE_TABLE completely.
> 

If you insist on the __probe name hack, please add a note to the code
explaining why that name is necessary. There is only one single driver
besides this using that trick (I'd call it hack), hardly anyone will
know about it, and thus it needs to be explained in the driver to
prevent that the structure is renamed.

Having said that, how did you de-instantiate the device when it was
built into the kernel ?

Thanks,
Guenter
