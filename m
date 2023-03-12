Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8781CC6FD19
	for <linux-hwmon@archiver.kernel.org>; Sun, 12 Mar 2023 14:49:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230104AbjCLOt6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 12 Mar 2023 10:49:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230055AbjCLOtz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 12 Mar 2023 10:49:55 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 794BE4D29D
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Mar 2023 07:49:52 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id 32-20020a9d0323000000b0069426a71d79so5461106otv.10
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Mar 2023 07:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678632592;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=TIlvIG7wBDtY/KfRf32miv4+qCLT8/WCMae9NcHEwIE=;
        b=XCtZan7DJbY+m6D6sAa8GaGykDWnbGXc4j14uEB+yGGyDQ6gVYGXX4Vi4WQ3b2kRKk
         57TIG+n5y4FMSDROa/wSIlpuWMLbB34Y6k95WjmnhiELLx2uS9AFBzXKACjKUmVrLSjU
         WvFF4BU+5+qNRKqKVsMwq35D7ZFcNaiebL8/nml5uL7yIuOU6dJFDUOq5JZXLGQbbeQy
         6iwpAyMuRBTIQxkF8IojUrlxD7EAb2AXFYFh2ci8qUiMt/kwCZmGDcURPQN08YAI6iN5
         FMN+yWQ0RmKWzgC+J4dNNUZbq+3FZqvo7Yo5padGUDbthH2Lhupe7Rg0rdaqtyLOmvIy
         z5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678632592;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TIlvIG7wBDtY/KfRf32miv4+qCLT8/WCMae9NcHEwIE=;
        b=gkX6zQcacqXWzhyPvUV/vrdqyww/mi1srtPOT6jwA2aQ0Qftp7FIcDepf/Z1OHOToN
         3wxpjbzJwq2DmCNo+giQ3Y/mtAG/fAzGU70z5mqU+ei3+W1LhFHmbgOwauMswmtBQSv6
         ENC7Wpqys14Nib8dZeHkVDq7MBrEc8Z4B93g3hio4L4epoy2HmJiaKvAudOHJ/SLq7cg
         JRVL2oeRLZ2T5pql6oR8+62o+JY2fAMynJPGPEquTLYeB4jEBrTH/mRwIRsxAB2jhC6g
         f2nCZgPlyLQSdSoz4KWtRPegz7q2Ggd3ieY2Fj2bpq3ur/YLP07+Hnp1H1dCIHLOEcvL
         xc+Q==
X-Gm-Message-State: AO0yUKUVMYMCD8ji4TCjuRjU5L7pN4Lp34BPH4dnYKbj/+HyIxReQXMI
        k1Ytn8VWi0I0VrsHb/jkyKEDtHOZD3k=
X-Google-Smtp-Source: AK7set8P1XRIi+n07pekHe7zJOYOXDc+EJUWgeAO2Mti23vhFmDCT3NounOFnPpOGw70Qt4qh0LQmg==
X-Received: by 2002:a9d:3cf:0:b0:68f:26fb:fb8d with SMTP id f73-20020a9d03cf000000b0068f26fbfb8dmr16502030otf.1.1678632591878;
        Sun, 12 Mar 2023 07:49:51 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o20-20020a9d7194000000b0068657984c22sm2219015otj.32.2023.03.12.07.49.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Mar 2023 07:49:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0933980e-921d-1e0c-a0a2-b2b44a6882c0@roeck-us.net>
Date:   Sun, 12 Mar 2023 07:49:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 2/3] hwmon (it87): Add scaling macro for recent ADC
 voltages
Content-Language: en-US
To:     Frank Crawford <frank@crawford.emu.id.au>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-hwmon@vger.kernel.org
References: <20230312043137.1744885-1-frank@crawford.emu.id.au>
 <20230312043137.1744885-3-frank@crawford.emu.id.au>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20230312043137.1744885-3-frank@crawford.emu.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 3/11/23 20:31, Frank Crawford wrote:
> Generalise scaling to include all recent ADC values and match the labels
> for internal voltage sensor to match.
> 
> This includes correction of an existing error for voltage scaling for
> chips that have 10.9mV ADCs, where scaling was not performed.
> 

That is really two patches (one patch per logical change). The bug fix
should be the first patch of the series so it can be backported
to older kernels.

In general please only introduce new code like the 11mv scaling together
with code actually using it, or I can not apply it.

Thanks,
Guenter

