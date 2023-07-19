Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D92A4C001B0
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 Jul 2023 19:54:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231309AbjGSTyj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 19 Jul 2023 15:54:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231313AbjGSTyi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 19 Jul 2023 15:54:38 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA7FD92
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Jul 2023 12:54:37 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-55c993e26ffso2906582a12.0
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Jul 2023 12:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689796477; x=1692388477;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=KH9smJ6EXXNhPv12lBBc+KYvEdzi8mCDG2r8bbKIkXg=;
        b=MQ1PSfeNixkM4ceW/oaP8zERPGx153BGOFTwGVz1QanVzkIkp51e76PzAz/ltQ6VbJ
         GvA2XbMygHYwGzv7RSFEi34vTZ2/ep7A1jxQlKOgq8GIpajhtQ/VDytfI/hpuOwEG77U
         /ilXEjpOk51QRCxx6mr9pgRS0HHwAv3rKU8nFkC0kGf8VDDg/4+3Cy1jBXS1lCNMknKa
         G/x2Yx1tGfwISy8DHHVOzcxobHTk+TfWRKWyUyg7jbQP9A+MfJlY3E3pj16r5z+GEqUS
         MXL3EHF2SZEv+77worlvc1kLvt2mklKNBzWuvCJqraGti26hpZLdMFsx3AmQELxgPaF9
         sXbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689796477; x=1692388477;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KH9smJ6EXXNhPv12lBBc+KYvEdzi8mCDG2r8bbKIkXg=;
        b=iEAwmGh7CJeXWcg7r2q7mR7kfFwO/0N0M88T8NM0KKu7KuOlqJjuwMRnawHlW7E8Q7
         Ztm7xkxHeFnXLhpFOva4xNlm+S4wgA3pApY6bnexd5Q9du57HdzZvHBJ3e14PEo1Td7S
         oL6JNQ9WfdhiSxUkMo/yOyFBPduXNxeKXMnYrZ3f7WnpPceWaKtHtvWAH8aKno3/ySHt
         edGJrkQREjEmLo4R2A1Gwgw6Lyvg9xmC1uz6q/49NiNYhFIboIg0zdCgdErRw4zRyYD/
         z5Pvu1NVH5mwpG4oO2U4Vb/+FQomBI7nAvBuaCkk6nmlYxRklpu3ochSQRqG+wMy8Jvi
         vTgQ==
X-Gm-Message-State: ABy/qLZKf6RsXL0u+IPSYCQ/EJ84ddcfhNLpAGEqd4mY7BYBK4ymmqKT
        qOi7VYdE2Xs6+oTDbuc0IxOb30fwoZ4=
X-Google-Smtp-Source: APBJJlGmvr6KYt76lE4N68UosP3jpcIQNRboSQ4GekZDOc0qgAb6wzl4dPcWaWfzhfEAqr/qCINnCQ==
X-Received: by 2002:a05:6a20:a1a0:b0:137:62b6:65c9 with SMTP id r32-20020a056a20a1a000b0013762b665c9mr1454704pzk.45.1689796477238;
        Wed, 19 Jul 2023 12:54:37 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n123-20020a632781000000b0055c090df2fasm3882750pgn.93.2023.07.19.12.54.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 12:54:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3df44416-a1ad-5519-15ca-3d02839bafa1@roeck-us.net>
Date:   Wed, 19 Jul 2023 12:54:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] hwmon: (nct6775) Add support for 18 IN readings for
 nct6799
Content-Language: en-US
To:     Ahmad Khalifa <ahmad@khalifa.ws>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20230718182912.1746384-1-ahmad@khalifa.ws>
 <ed576af2-8fb8-415b-87db-a30b025096e3@roeck-us.net>
 <738f50ee-c463-bdce-026c-bf97ae34108b@khalifa.ws>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <738f50ee-c463-bdce-026c-bf97ae34108b@khalifa.ws>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/19/23 12:41, Ahmad Khalifa wrote:
> On 19/07/2023 03:49, Guenter Roeck wrote:
>> On Tue, Jul 18, 2023 at 07:29:12PM +0100, Ahmad Khalifa wrote:
>>>      * Add separate scaling_in and pass it through data as they were
>>>        missing in v1 and the factors differ with other chips
>> The scaling change is really a bug fix; it should be a separate patch
>> marked as Fixes:. It also affects NCT6798D.
> 
> Missed checking 6798 voltage, thought it was only temps missing.
> But now that I checked, I can see the 17th voltage and it's the
> same as 6799.
> 
> Not sure if to add that with the 6799 or leave it safely with 15
> as it is. Adding it alone, too risky, I can't test that.
> 

Leave it. We can always add it later if/when someone can test it.
The documentation is inconsistent anyway. The summary and chapter 8.1 both
say that there are 16 voltages. Then 8.6.2 suddenly says that there is also
VHIF, and the registers for VHIF are widely listed. We would need someone
to confirm that it actually works.

Thanks,
Guenter

