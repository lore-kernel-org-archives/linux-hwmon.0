Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DFAFC001B0
	for <linux-hwmon@archiver.kernel.org>; Fri, 11 Aug 2023 23:07:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237216AbjHKXHZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 11 Aug 2023 19:07:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235787AbjHKXHF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 11 Aug 2023 19:07:05 -0400
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40C363C0A;
        Fri, 11 Aug 2023 16:05:22 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-1c0fcbf7ae4so1756707fac.0;
        Fri, 11 Aug 2023 16:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691795121; x=1692399921;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=47fQ1cuYrE5cpslsXXWEGXSOFdaTOthr0Ed0/nVycP0=;
        b=Hx4Je/UKhzyS2WZer6iF4ELG7m0cEljNzP0pLVYa287LcLyKSFIeGgOX2nkiq5Kx6S
         Z0MJcalf/iADTRsJY+pwCf8LlJDs9QPqxpuD11fHSL0cpkWgvSAaB38O9LDSXZICQ8cF
         WCpa6DEiMZ7fy4MPSAlVQKmRYBrEz7EwN1lAmrQ1iuJ8AvILC7gz8Ryt+/zq75YaxZYU
         uO4vt/sd4EE947FzzLd4i3m8YTeZxIX+PFO2wfBa/0w+DwQexUZOSkBdZ/anDtw/k8Hb
         59qkencdkbKkwU8nQIx5ahURQi7fRR1FasrjrKb3d0WRqqyMtw3mOVCgE2mf/UJnUvnO
         R7Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691795121; x=1692399921;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=47fQ1cuYrE5cpslsXXWEGXSOFdaTOthr0Ed0/nVycP0=;
        b=CaYUv1VfuRtr3GyvTvhMF+kgKgiko6eEZYfBIjwv0chx0Tm8sdKxRf0uhvdYIDolvv
         tZEAgeFwvZ9drjQTQk+b/6w8/WBkU+PqPxA7Ec/+030L78GS7e0CHZgO/1/KsYTkFSB9
         Fmy3B8oruW2s9n88+VtwmMM8alVkORTRpcydjf7z7+AnUaSBSSHBUF1TsvTJPk8FDe/A
         MuuJtE5mDV/m5BdIQMfDfiWq9u1CaPc0yU6m74Fxihf0Ocwq6sOC68RoqJwToc7IoyNn
         fQvEsd/9r+WljKP8Q8WtraHFukwtEMcjvpWb0HKd39JdynOZ/y6hKQmQ3Ac9HNqWNfwF
         VlfA==
X-Gm-Message-State: AOJu0YyT/SQUnSc47tzgDyskVWAs2EzjKHhEMtp6DDvQ5LQX4RjgoGQ+
        2a6QLfNx4fiV2jtDd0Z6lgf+e9uY0k8=
X-Google-Smtp-Source: AGHT+IGmR5s6DLOAfgkah1O5hAFKZcjzHi8ZvTi8/GDjjvlvluw1Puiax+EeUdTo+ZN2dfy/QZpPRQ==
X-Received: by 2002:a05:6870:4207:b0:1b0:60ff:b74a with SMTP id u7-20020a056870420700b001b060ffb74amr3555356oac.56.1691795121530;
        Fri, 11 Aug 2023 16:05:21 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v16-20020a02b910000000b0042b482a8763sm1296837jan.70.2023.08.11.16.05.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Aug 2023 16:05:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0d94544e-59d7-1860-2cc4-1a9130023b2f@roeck-us.net>
Date:   Fri, 11 Aug 2023 16:05:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3] hwmon: (aquacomputer_d5next) Add selective 200ms delay
 after sending ctrl report
Content-Language: en-US
To:     Aleksa Savic <savicaleksa83@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, Jack Doan <me@jackdoan.com>,
        Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org
References: <20230807172004.456968-1-savicaleksa83@gmail.com>
 <c151d464-da26-4c53-ba7a-d16bb8fca949@roeck-us.net>
 <e7bcf401-991c-808c-66df-65664940bf22@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <e7bcf401-991c-808c-66df-65664940bf22@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 8/10/23 11:15, Aleksa Savic wrote:
> On 2023-08-10 06:09:13 GMT+02:00, Guenter Roeck wrote:
>> On Mon, Aug 07, 2023 at 07:20:03PM +0200, Aleksa Savic wrote:
>>> Add a 200ms delay after sending a ctrl report to Quadro,
>>> Octo, D5 Next and Aquaero to give them enough time to
>>> process the request and save the data to memory. Otherwise,
>>> under heavier userspace loads where multiple sysfs entries
>>> are usually set in quick succession, a new ctrl report could
>>> be requested from the device while it's still processing the
>>> previous one and fail with -EPIPE. The delay is only applied
>>> if two ctrl report operations are near each other in time.
>>>
>>> Reported by a user on Github [1] and tested by both of us.
>>>
>>> [1] https://github.com/aleksamagicka/aquacomputer_d5next-hwmon/issues/82
>>>
>>> Fixes: 752b927951ea ("hwmon: (aquacomputer_d5next) Add support for Aquacomputer Octo")
>>> Signed-off-by: Aleksa Savic <savicaleksa83@gmail.com>
>>
>> I would have suggested to use fsleep() to avoid unnecessary
>> sleep times if they are small, bt I guess it doesn't make much
>> of a difference.
> 
> Will keep that in mind.
> 
>>
>> Applied.
> 
> Will this patch perhaps be marked for stable?
> 

It has a Fixes: tag, so it will be applied to affected stable releases
automatically, at least if it applies cleanly. I could have added Cc:
stable@ to make it explicit, but I had pushed it already, and I didn't
want to rebase the branch just for that.

Guenter

