Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E5ADC433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 May 2022 00:10:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349563AbiELAKK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 11 May 2022 20:10:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349554AbiELAKJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 May 2022 20:10:09 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2914A880D1
        for <linux-hwmon@vger.kernel.org>; Wed, 11 May 2022 17:10:08 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id q10so4586786oia.9
        for <linux-hwmon@vger.kernel.org>; Wed, 11 May 2022 17:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:content-language
         :from:to:cc:references:subject:in-reply-to:content-transfer-encoding;
        bh=Gd4q8xPotJnaqvX45sdf/PT8tVd4GN5lAZX9Dm5396o=;
        b=Ovw8JGvAfHcD3spq7jzYYoy8hsXE9DNSKCOuZokyyfDlu1mPQwxKMwuZyhy0/x4H/J
         lYPq0aZMTUrLZns/UMg9remh6tcDYx04AK1o/QpYLohbyzbUu9WXtELYlX/h+0P/sWMi
         oiDxmoBdCOvl4BUnllua1gc1NrQ9Y4rT32nxRj2bwEAWtAmlBPhy4yO0LmStGGSYQ9YQ
         M5feBcXEHWdgrcfkCNK63Z1Jc9Z3cXlqLWig7iByeRJ15c50iTcAS9mW17r4RqIg4jSr
         slkD+kUkUZ9z71SMj3XPRfjn6zBocRoM9CuB7hpMcvUfZJJhMuFs4UCtXPF2aBYndpy7
         Qgiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :content-language:from:to:cc:references:subject:in-reply-to
         :content-transfer-encoding;
        bh=Gd4q8xPotJnaqvX45sdf/PT8tVd4GN5lAZX9Dm5396o=;
        b=r4b+FXv9nI9O/g2O7kiN5k9aGJCQXnwdBWX159w4WhCCWGSmyUCgt2a9nDdo1H9sgS
         WPbVp9c37HfWiS5Y55jzQk/iZ+YrNrLguRct1wNwKV9VtC7RJSRyhqB+WmG11iDBxkKf
         NX2rv3+QvUClg1o9EUN598QhtYncyuKid0sBI/mZwjjgNbkUCe0C2EGWdQR4tLVsxzkB
         f0v4IWTJ5afBFw6LpS0NzdEs6TD6JyRbniJ6EFY5XYxlNvFAkaDA6qyQ5JiPTd/cjMIL
         /hFxUXxbBduyObWBotpMKFKP/NfLvkkclmAziMmc1etISD8iUK6rGLtwkhDPwV4JoWQs
         zWeg==
X-Gm-Message-State: AOAM532Oie8/RtAabRtzoEKbOEgizerZajAUREVnbSdER6rooUpTr4i2
        HI1GjZ0jM6ptdBxJjuupE3c=
X-Google-Smtp-Source: ABdhPJyNmByHHPQGcLGsIEUAm+zcqKrqMDm5PwRsYeUj6bx8ReiM+B2sBv1om+2wugY6sK2EZHmn/w==
X-Received: by 2002:aca:e155:0:b0:325:6d76:da4b with SMTP id y82-20020acae155000000b003256d76da4bmr3993452oig.125.1652314207510;
        Wed, 11 May 2022 17:10:07 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g6-20020acab606000000b00325cda1ffbasm1235888oif.57.2022.05.11.17.10.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 17:10:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4b9b0b06-c5a9-df99-6b76-75e670513179@roeck-us.net>
Date:   Wed, 11 May 2022 17:10:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
From:   Guenter Roeck <linux@roeck-us.net>
To:     Zhang Rui <rui.zhang@intel.com>, jdelvare@suse.com
Cc:     linux-hwmon@vger.kernel.org, srinivas.pandruvada@intel.com,
        Corentin Labbe <clabbe@baylibre.com>
References: <20220511075444.3376950-1-rui.zhang@intel.com>
 <b72b9ec1-666c-e4b0-0b6f-8b745857af78@roeck-us.net>
 <95a7beb8b4383b03799276e572298ff54a48bb2e.camel@intel.com>
 <490cfcf5-0134-bd36-1e1b-d50db8aa6d56@roeck-us.net>
Subject: Re: [RFC PATCH] hwmon: (acpi_power_meter): Convert to
 hwmon_device_register_with_info
In-Reply-To: <490cfcf5-0134-bd36-1e1b-d50db8aa6d56@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/11/22 09:53, Guenter Roeck wrote:
[ ... ]

>> If this could happen in real life, we cannot rely on a fixed
>> hwmon_chip_info and attribute_groups at driver registration phase.
>>
> 
> You have a point. However, if anything, that means that we might have
> to improve/extend the hwmon API to make attributes visible or invisible
> dynamically (ie add an API call such as hwmon_update_visibility()
> and have it call sysfs_update_groups()).
> 
Actually, adding a new API function isn't even necessary. A call to
sysfs_update_groups(hwdev->groups) (where hwdev is the device pointer
returned by the hwmon registration function) should do.

We could still add an api function for clarity, but all it would do
would be to execute that call. That would be cleaner, but it isn't
technically necessary.

Thanks,
Guenter
