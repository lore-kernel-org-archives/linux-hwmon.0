Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C178C433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Oct 2021 14:43:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 47E5A60E0C
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Oct 2021 14:43:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235422AbhJLOqA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 12 Oct 2021 10:46:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230195AbhJLOp7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Oct 2021 10:45:59 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27820C061570;
        Tue, 12 Oct 2021 07:43:58 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id s18-20020a0568301e1200b0054e77a16651so9415410otr.7;
        Tue, 12 Oct 2021 07:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bgyXPXHs4QhKG/HOiLNZ4pXor7jZAeH7ayibLqUfYUQ=;
        b=U0qIA9HnTdQgItNLP669pAviiaDAwPOE1ItNIp/+nwHSvk4T/Uc7IEqwxN4UKYWCm4
         vUDQspQ0jmY+v/S1274q1lfAGdYhoXrMBFCes7HyjvqnpWeSki3m6s/MDoGvydx8dRNG
         ybp4rNW0RDMgd9hr6ObJseTK5Bdf/D7uGSowsi7dqlxN0yiar7NCEbbP0mjg07KRP4W7
         DdNsHpHmqG0sbzXxsyl2E4PYmcd+C9sksIRotiJ9hwbIf/Fd747vNl4hY25Z3W7l4OcK
         HcsmrY5BRttmyl3Xt1oEqF3lob/c2O7mYVkSk7Nk/XucG0OpRnl8kkvQSxTqHwKhehVD
         n1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bgyXPXHs4QhKG/HOiLNZ4pXor7jZAeH7ayibLqUfYUQ=;
        b=divNSz09ZucqznmgTFlIrkrW/NsYnKYAx17H7aTlKcCtDiOktUPE0HzpRIg5bB1Bc0
         MH6IN3iRWmIKIB5W05bZxH9aLIrQa+h2Plfq/OdTOgKHOMyB3Bt6BMfkuVPFD+lhbnvU
         ZLBDOPvXbHl02ox8E2ASH2GsbQbuz+yxC+EbrIxPqGd++bsk4Wh7nX4ni3DM3Q4NZz6a
         4fCAvorNCW9aayTy19T1A+K4CpNihsXs7FV8l5FNHZP643iWBGYAH/MH/zPTm9SwXKZ4
         o3mM4m5L5Mi3Q3XAsT6U0VUlFxAt5Mc/dy9Z7i89Si5ODwvt4ri78EzQgvStmGhAI14y
         Of8g==
X-Gm-Message-State: AOAM533fpPi21s7rhTnXVBFTzveHGFtKa7yoy9cp8OWnFRrhWXAKIeUO
        pbaeXTFfNPue/DtK5QhdAVGnHBNmIlA=
X-Google-Smtp-Source: ABdhPJwgjNOOyaXTptR6KwM3nmdtyW7MNt4/vv4AwGrVcguTlOvOznW3xW1EKO1inCBkyts5o5cvxA==
X-Received: by 2002:a9d:a4d:: with SMTP id 71mr26487188otg.249.1634049837318;
        Tue, 12 Oct 2021 07:43:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e7sm1350233otq.4.2021.10.12.07.43.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Oct 2021 07:43:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v4 08/10] hwmon: (tmp421) update documentation
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
References: <cover.1634029538.git.krzysztof.adamski@nokia.com>
 <a201eebf656d06f54bd6926c20d4aec12db933e8.1634029538.git.krzysztof.adamski@nokia.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <63c59076-5816-fed6-4a0f-cfa2d509ac51@roeck-us.net>
Date:   Tue, 12 Oct 2021 07:43:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <a201eebf656d06f54bd6926c20d4aec12db933e8.1634029538.git.krzysztof.adamski@nokia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/12/21 2:30 AM, Krzysztof Adamski wrote:
> Sysfs interface of the tmp421 driver was extended in the recent patches
> so lets update the documentation to reflect that.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>

For my reference:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   Documentation/hwmon/tmp421.rst | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/hwmon/tmp421.rst b/Documentation/hwmon/tmp421.rst
> index ddcd5159c75d..a3002117bbd7 100644
> --- a/Documentation/hwmon/tmp421.rst
> +++ b/Documentation/hwmon/tmp421.rst
> @@ -64,3 +64,13 @@ the temperature values via the following sysfs files:
>   **temp[1-4]_input**
>   
>   **temp[2-4]_fault**
> +
> +Each sensor can be individually disabled via Devicetree or from sysfs
> +via:
> +
> +**temp[1-4]_enable**
> +
> +If labels were specified in Devicetree, additional sysfs files will
> +be present:
> +
> +**temp[1-4]_label**
> 

