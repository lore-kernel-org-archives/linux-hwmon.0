Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FADBECAAD8
	for <linux-hwmon@archiver.kernel.org>; Thu, 22 Sep 2022 03:22:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231358AbiIVDWC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 21 Sep 2022 23:22:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231284AbiIVDVf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 21 Sep 2022 23:21:35 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D11AB2CEC
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Sep 2022 20:16:22 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id q9-20020a17090a178900b0020265d92ae3so813245pja.5
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Sep 2022 20:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date;
        bh=FqjVYVOELwD6B0d6rfYMa2vVb2jr2GokelYZSbJInak=;
        b=MDu90ijwmMqNNu9EGKXfbfLZ9OeyNBMmOos4QpBe2n0aHnBGhDn9RsWgz7L4tpGDny
         D0wxK5JI9cy/3q7A8Wvg9kldwNEiGl/cmdFlt/82yzDdbHlrFmrRk3YWeoaG076blmm/
         Ys1tf+7gW3S/UCuc0oSa1ddo+RHhLmquvk4cKiPgCVdc2+V45ZNvauzLGOvSJGJCu7gc
         cesWMM0NM5IMf8Ut6vYFitydyb4mvJGrD994SUnt4ayGROrBOVEIStvJ2BljSLMP3T9y
         +3cNFJY27eLgv524MtApCldWhHIkSvRpORGE6OSRDpqoVJ4JbD2E0z/5dmNj4oD6bQXg
         FhZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date;
        bh=FqjVYVOELwD6B0d6rfYMa2vVb2jr2GokelYZSbJInak=;
        b=kusEN6wAndsZbzGYMjbIxHrA0A/5GaSn4WlzCrg4oFRgDpHM9F9w9mZ2nzz1CBtPSh
         FhiKrK06cT1KZ/LZ9GcEaT9CSEb6zdhkL/leJVC44k8CxgIU5XQnfwbXhY9MhF+y5l6B
         /zBG8KKv/WXN+9UbukfpIgLnmGVPv45b8Lh46IZcXqjEm/0UXsdBNBFHHbP/fnFiaNv+
         D4sRGxuf3amCEewoVNjs6e1F+nOQjPr0NNvKsUzcRTkgzLaYUvKpJbAVFyhS+2oJ4738
         PRT6VT3UHHigTIf0SJ8T8jQOACn3s9hgY4wDjtAcBoMmZCFNZgmuLss7mgKED9HF4y9s
         4TFQ==
X-Gm-Message-State: ACrzQf0r1gEJCTjiOYGOLCOH2oZByCW6FuGsf9rtXAo8AFg3JW50q/Zd
        7AugRCfD+rPDOcWrIcA18qk=
X-Google-Smtp-Source: AMsMyM6xfhJE6wjxBYLMwoOS6v3abhELt0rVsfu+agFY1ZJs1kMPCPynM1hxxiW1ff/531I1TnQ0fw==
X-Received: by 2002:a17:902:dac8:b0:178:401c:f699 with SMTP id q8-20020a170902dac800b00178401cf699mr1186128plx.19.1663816581531;
        Wed, 21 Sep 2022 20:16:21 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m2-20020a17090a730200b002032bda9a5dsm2621593pjk.41.2022.09.21.20.16.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 20:16:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <99ea1416-46dc-9712-271a-9e3daaa43e05@roeck-us.net>
Date:   Wed, 21 Sep 2022 20:16:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To:     Li Zhong <floridsleeves@gmail.com>, linux-hwmon@vger.kernel.org
Cc:     jdelvare@suse.com
References: <20220921233109.1672345-1-floridsleeves@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [BUG] drivers: adm9240: possible data race bug in
 adm9240_fan_read()
In-Reply-To: <20220921233109.1672345-1-floridsleeves@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/21/22 16:31, Li Zhong wrote:
> Hello,
> 
> My static analysis tool reports a possible bug in the adm9240 driver in Linux
> v6.0:
> 
> drivers/hwmon/adm9240.c:
> 
> adm9240_read()
>      adm9240_fan_read() --> Line 509
>          adm9240_write_fan_div()
> 
> adm9240_write_fan_div() says 'callers must hold
> data->update_lock'. However, it seems like the context does
> not hold the lock it requires. So it may cause data race when
> setting new fan div.
> 
> I am not quite sure whether this is a real bug. Any feedback would be
> appreciated!
> 

You are correct, the code in adm9240_fan_read() should acquire
the mutex before calling adm9240_write_fan_div() and while
manipulating data->fan_div[channel].

Guenter
