Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 903EBC433EF
	for <linux-hwmon@archiver.kernel.org>; Thu,  7 Oct 2021 19:24:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 67D186101E
	for <linux-hwmon@archiver.kernel.org>; Thu,  7 Oct 2021 19:24:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232709AbhJGT02 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 7 Oct 2021 15:26:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233105AbhJGT02 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 7 Oct 2021 15:26:28 -0400
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8858C061570
        for <linux-hwmon@vger.kernel.org>; Thu,  7 Oct 2021 12:24:33 -0700 (PDT)
Received: by mail-oo1-xc31.google.com with SMTP id w9-20020a4adec9000000b002b696945457so1719955oou.10
        for <linux-hwmon@vger.kernel.org>; Thu, 07 Oct 2021 12:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uJ7taHxnNG5zat1UONTlDWwij8GkRPpKOroOhjZh+LU=;
        b=Fvj9MD6yxjFKMpytyNTvENGmZrVH47rxdEqVn9jgAtyBQvfDmJ/G4YXTITZvh/nXHy
         F0UObvJ8PFuRSra6NP6Z2D3BLGUIbOBoYzEPAJ6on0Y8dOOThv6rCJrGfc7O7On849i/
         grpYtQKPWgnF4pNNsA3kvdfvEaRM3gKd+Fu+wZ0qZrImd5H+EBcKgV94FQAR5DOl0T4u
         RLmW0xVNFVxa5Yzy0ZyPoQ9xZUJxMZBLWOQnhUkP8igTmJrv37uX/5dkpeOh62u51Kvn
         ftOGj8jeZ3GWCeiYaMzlrAkX+4Rnr9Mznu4ZmiIZnsHo9KaoWFNFlrkPClQ++PoD2hRM
         M6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uJ7taHxnNG5zat1UONTlDWwij8GkRPpKOroOhjZh+LU=;
        b=ASyapzQ1TTLyayg1ZkmNPv95xGZriS2xSZ6KHwHbJm2AwlQPJyumRVSz+UjDtTsqzj
         847kI5EqE4rf+31nBsGy9c4iuSlCK+eiZGObi/ECdG7yKXR6jIy/lvIS9Ge9RNZBcpQO
         CTk1HbZVmWmzowK+tnTao/XiwYgejRRbHS6LLuif8Gr7ivkVBwxpr8eykpvfI7vWzbfb
         CCkZBOFWL+r2ouQO5HYqkp3/Fg2/m4rDIiAKBvqC5tU+9B7tqvAMGvu0yVgb6+Yq5DPz
         stDj0n53TvkBjl9sLopkb0l8q1C9ZOCBxOXxZYN7lQLMQAdTwm3FB7v9hedTtr0mRKOy
         cPmA==
X-Gm-Message-State: AOAM531C7Xq6QfHk3l2VClh+AYJt6lNAHDd+AuJi+hWk8mIlOCoVY8s/
        KNodE7RnUkIwaAnWMV16OIID6VDt3FI=
X-Google-Smtp-Source: ABdhPJypGlnHc2uKM7IMbBtVrxNvFbXyKQiXfvlDwIeS/1sGXTClSKr+evnwZ994LEcLR+UaBHLKiQ==
X-Received: by 2002:a05:6820:1612:: with SMTP id bb18mr4793486oob.7.1633634672323;
        Thu, 07 Oct 2021 12:24:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o8sm84970oiw.39.2021.10.07.12.24.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Oct 2021 12:24:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Armin Wolf <W_Armin@gmx.de>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <7aaa2734-514d-3752-01f1-fe3895718f55@gmx.de>
 <20211002140451.GA34532@roeck-us.net>
 <ce066c64-bf13-e6fa-278f-0dd6f2c2f45e@gmx.de>
 <def290d3-8c45-a44b-ebc7-166a77e8a2b9@roeck-us.net>
 <9f5c769b-416c-c431-5145-2ce9c0bb69ef@gmx.de>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: i5k_amb temp_mid replacement
Message-ID: <c817fb03-a0c7-f562-5000-2c46bad58075@roeck-us.net>
Date:   Thu, 7 Oct 2021 12:24:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <9f5c769b-416c-c431-5145-2ce9c0bb69ef@gmx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/7/21 10:59 AM, Armin Wolf wrote:
> Am 07.10.21 um 18:30 schrieb Guenter Roeck:
>> On 10/7/21 7:20 AM, Armin Wolf wrote:
>>> Am 02.10.21 um 16:04 schrieb Guenter Roeck:
>>>> On Fri, Oct 01, 2021 at 12:13:53AM +0200, Armin Wolf wrote:
>>>>> Hello,
>>>>>
>>>>> while trying to convert i5k_temp to the new hwmon API to resolve
>>>>> https://bugzilla.kernel.org/show_bug.cgi?id=208693,
>>>>> i was asking myself whether or not temp_mid could be replaced with a
>>>>> standard sysfs attribute?
>>>>> Since afaik temp_mid and temp_max are both temperature limits, they
>>>>> could potentially be replaced with
>>>>> temp_max and temp_crit.
>>>>>
>>>> Quite likely. Unfortunately, the chipset documentation is not available
>>>> to the public, so it is difficult to determine what those temperatures
>>>> actually mean.
>>>>
>>>> Guenter
>>> Darrick Wong says the chipset documentation would support such a change.
>>> However, he fears that the changed meaning of tempX_max could confuse
>>> userspace
>>> programs.
>>> But i think the current not using standard attribute names will confuse
>>> even more
>>> programms.
>>
>> I still don't know what temperature limits temp_mid and temp_max actually
>> reflect, so I still can not really comment.
>>
>> Guenter
> "Intel 6400/6402 Advanced Memory Buffer" seems to document that.

Ah, thanks.

 From the description, it should be:

TEMPLO -> temp1_max
TEMPMID -> temp1_crit
TEMPHI -> temp1_emergency

The respective _alarm attributes should be supported as well (via TEMPSTAT),
but that would be a separate patch.

Guenter
