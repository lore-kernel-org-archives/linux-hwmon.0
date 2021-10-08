Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21207C4332F
	for <linux-hwmon@archiver.kernel.org>; Fri,  8 Oct 2021 14:33:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0CB756113E
	for <linux-hwmon@archiver.kernel.org>; Fri,  8 Oct 2021 14:33:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239719AbhJHOfm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 8 Oct 2021 10:35:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240847AbhJHOfk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 8 Oct 2021 10:35:40 -0400
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A523C061755;
        Fri,  8 Oct 2021 07:33:45 -0700 (PDT)
Received: by mail-oo1-xc31.google.com with SMTP id y16-20020a4ade10000000b002b5dd6f4c8dso2959158oot.12;
        Fri, 08 Oct 2021 07:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TyZwl74lRCt2TasBtcyjKKOdKqwyWiXvdieNTc+JDP8=;
        b=ato6ulzHug6BQckfLqvQTdNQV3wk/Ar84KBv+iI/P+AYBcTjwrMNaZvVMKc3a/OFyt
         dNSNDdS4+zWKhfzCocPrmozna8w4qXluRMt4wos52KGHKdolNNyG9NcuEhst9+eVfj4s
         qGQOcYXC9unL5Xgdvu9zSpCpUa6/Ic2tlr6fND0Qcbby2bN3dWPCRfqSrkAE1/HF3NSu
         Gc7tW6QTM4uWYOnaw+OmQi08UmFs1zFFjXiaxWiSHb7o52nhUH5U4HqPGPjm8/q9sWfr
         UL+QyM8ZOqLzaHWlppaclALVyaTEGq9Lqg7vAqfm+UIboVX1L+/a3XiLvhtFhvAE8m7l
         MPzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TyZwl74lRCt2TasBtcyjKKOdKqwyWiXvdieNTc+JDP8=;
        b=h9NTIh/LiVb1fPzFhy5nvJ8BNNLeLNzZPIHMubu1ozZYp94X8zK8MadnNiEfzfe/3t
         dxubPDmOiojDgGQPHA88Wo2+waWeRjgtzE4BZzumn1imcr2gQlgWAM/pRQBGeQNL9/WD
         qP8x5jq2GzF8uGU+mzRFYPGckcWtzWUj4rYIskGhJwovFbTl4o+7XinDgOGGaX+CfBNo
         IDypZUKkIltTzvH/kLVUyvVcBFJamHKNLcPkKtZZyYl1/Q2+A2uh4kzAKaFTmeo78Vzi
         ZLY8b0XC0/mFXn/g3u5ta/bYBmdZmxqnQMMgfFTQdpjEc6Cdeedn/Y6BOJf+BotOTlIJ
         8bbA==
X-Gm-Message-State: AOAM532q/wCHhCJrDD/ld6h17K9N6krUY9Qy+Lqm6YyOFVg3ZB5Y8Wsf
        txGUrMznxyVvs31JjOHvffuA6LdsIr8=
X-Google-Smtp-Source: ABdhPJzTzyGrvdvODixbybo2XIzPLTO3cIFBQY8n7nnZ6xMTpyR7kgcdY456Yhpnhg0LZvTzzHr8pw==
X-Received: by 2002:a4a:c18d:: with SMTP id w13mr8168077oop.15.1633703624478;
        Fri, 08 Oct 2021 07:33:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l25sm542102oot.36.2021.10.08.07.33.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Oct 2021 07:33:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v3 11/11] dt-bindings: hwmon: allow specifying channels
 for tmp421
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Rob Herring <robh@kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
References: <cover.1632984254.git.krzysztof.adamski@nokia.com>
 <3ff7b4cc57dab2073fa091072366c1e524631729.1632984254.git.krzysztof.adamski@nokia.com>
 <20211002142219.GC34532@roeck-us.net>
 <YVqu92dUgNKlYMlG@localhost.localdomain>
 <20211005141457.GB2395636@roeck-us.net> <YV4NUqf7ey5Yr55P@robh.at.kernel.org>
 <YV6m8MRa4+lKOWTp@localhost.localdomain>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <18a5d5c9-2885-68da-256b-7ae1c3b95819@roeck-us.net>
Date:   Fri, 8 Oct 2021 07:33:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YV6m8MRa4+lKOWTp@localhost.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/7/21 12:51 AM, Krzysztof Adamski wrote:
> Dnia Wed, Oct 06, 2021 at 03:55:46PM -0500, Rob Herring napisał(a):
>>>
>>>     input@0 {
>>>         reg = <0>;
>>>         label = "output voltage";
>>>     };
>>>
>>> Anyway, maybe Rob has an idea how to name this properly.
>>
>> No, I don't have a sense of the range of h/w...
> 
> I feel like we are stuck. Rob does not have a sense of the range of the
> h/w and Guenter does not have a sense of the DeviceTree idioms. How can
> we solve that?
> 

That is why I am asking questions. It doesn't mean we are stuck.

> Could we, maybe, just focus on this typical, simplified, case I have for
> now - a sensor with several channels of known, same type (temperature)?
> We clearly are unable handle all possible cases here, for now.
> 
> Does this look sane for that usecase or what would you, Rob, change?
> 
> sensor@4c {
>    compatible = "ti,tmp422";
>    reg = <0x4c>;
>    #address-cells = <1>;
>    #size-cells = <0>;
> 
>    input@0 {
>      reg = <0x0>;
>      ti,n-factor = <0x1>;
>      label = "local";
>    };
> 
>    input@1 {
>      reg = <0x1>;
>      ti,n-factor = <0x0>;
>      label = "somelabel";
>    };
> 
>    input@2 {
>      reg = <0x2>;
>      status = "disabled";
>    };
> };
> 
> There were some doubts whether "input" makes sense here.  I still think
> it doas as even in HWMON subsystem, we have "hwmon_temp_input" and
> HWMON_T_INPUT, so a temperature channel _is_ an input.  Of course I can
> change it to "temperature" or "channel", just tell me which one is
> accepted.
> 

I'd be fine with "channel" or "sensor". Both would be generic.

Guenter
