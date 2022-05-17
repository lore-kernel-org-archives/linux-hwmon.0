Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19566C4332F
	for <linux-hwmon@archiver.kernel.org>; Tue, 17 May 2022 13:37:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343736AbiEQNhk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 17 May 2022 09:37:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241193AbiEQNhj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 17 May 2022 09:37:39 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44FE526554
        for <linux-hwmon@vger.kernel.org>; Tue, 17 May 2022 06:37:38 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id y63so22253953oia.7
        for <linux-hwmon@vger.kernel.org>; Tue, 17 May 2022 06:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QgFq5gEWTa8Ypf1EvaQ6Yt35FFMF7fNB8/gwoFSkjMo=;
        b=W2UDWgjU4R6gA2UxT8D+5Pi/PUsGFveuwhy38jWxcR4wpgWtP4Mbi37brUUa9eyoqf
         ZW33woXTzfR4pMw4oIEokxvsCijVvHaiTU41eUFwlmajjExupaCVJsHJFVBPOa3xm7VO
         upzJJjsaChr3N/ROzPUe2aY2qo3y7IK9j4vaCxYy9itGb12mJWr8Neazpuxu4hsS8IgV
         guRwYLLmmthLxRJ5l3IKcM9RY0gJigIh4eOXNp2izb8WMRKHuxyW/feGQc9GHr0DFrc7
         4lQZFBHwL5zv3EAbncvDoNVAyowku9SOMFDy39nMMreR8nUzb78pDr+Rce1PKkutCOA5
         GJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QgFq5gEWTa8Ypf1EvaQ6Yt35FFMF7fNB8/gwoFSkjMo=;
        b=cMT+4D726D7oyEMzHIn2uASNUP92fj5TunFsKD/p8gwz/P5bPbozU3p+F2s5FAhj7y
         NeZ3w27BefGsNuKwXEQ+EasPLQT1SmJHzpwXQoN8a0rYiDQymFICHRmIBKpL5NHPVIZu
         SXNVW7EF7EQOoObEqvch6Y1EL/bjyTlErI8VYeAKRuNCLV93Ltvx+/RAg4raRkelumGS
         vs6ICtwc/al9lTtcz2O5ORBMT3KnB+u53P7kMtvUECztJSQysmVkUEakD1U9wBogec3U
         Jm/rRPIMdM9EuHkxBKrgOGpoLL7KZ18RLwHAUKFjpOQEQRalE7BrbF4NNa622/0/T1bj
         2n7A==
X-Gm-Message-State: AOAM530PBoRCmw0rtKBsB9kHrBk/UsTj7vYHlzeRp01jx6k0UmDnRYjE
        v+BKW87/xSvJGhOMeNSp2UA=
X-Google-Smtp-Source: ABdhPJxTWcVF4kMzuufjySV7cxJKESUnVEfwm191j2Pi0W2Z7Mgd7x+AYMKCZzZW6rYKcJdQ3Hgk6A==
X-Received: by 2002:a05:6808:21a2:b0:326:a16e:ceeb with SMTP id be34-20020a05680821a200b00326a16eceebmr10489527oib.157.1652794656136;
        Tue, 17 May 2022 06:37:36 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id eh24-20020a056870f59800b000f193bc7b79sm3567182oab.44.2022.05.17.06.37.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 May 2022 06:37:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <408654e0-00d5-3e4d-6a4a-a2b9fd5fc7b9@roeck-us.net>
Date:   Tue, 17 May 2022 06:37:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [v3 3/3] hwmon: (lm90) enable extended range according to DTS
 node
Content-Language: en-US
To:     Holger Brunck <holger.brunck@hitachienergy.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20220517075738.16885-1-holger.brunck@hitachienergy.com>
 <20220517125440.GA3575490@roeck-us.net>
 <DB9PR06MB7289D017682F1085A1ECF173F7CE9@DB9PR06MB7289.eurprd06.prod.outlook.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <DB9PR06MB7289D017682F1085A1ECF173F7CE9@DB9PR06MB7289.eurprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/17/22 06:17, Holger Brunck wrote:
>> On Tue, May 17, 2022 at 09:57:38AM +0200, Holger Brunck wrote:
>>> Some lm90 compatible devices can operate in a extended temperature
>> mode.
>>> This feature is now enabled if the property is set in the
>>> corresponding device tree node.
>>>
>>> Signed-off-by: Holger Brunck <holger.brunck@hitachienergy.com>
>>
>> For my reference:
>>
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>>
> 
> thanks. As you now already applied 1/3 and I have to update 2/3 should
> I send a v4 with the missing two patches, even if this one is reviewed?
> Or should I only send a v4 for 2/3 and if this is applied you apply this
> one?
> 

I applied the first patch because it is independent of the other two
and should be applied in the next commit window even if the other two
patches don't make it. Just send the remaining two patches in the next
version. Please keep my Reviewed-by: tag when you do that.

Thanks,
Guenter
