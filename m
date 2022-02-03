Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01BFDC433EF
	for <linux-hwmon@archiver.kernel.org>; Thu,  3 Feb 2022 19:00:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241724AbiBCTAX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 3 Feb 2022 14:00:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230426AbiBCTAX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 3 Feb 2022 14:00:23 -0500
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1978C061714
        for <linux-hwmon@vger.kernel.org>; Thu,  3 Feb 2022 11:00:22 -0800 (PST)
Received: by mail-oo1-xc2a.google.com with SMTP id q145-20020a4a3397000000b002e85c7234b1so2308773ooq.8
        for <linux-hwmon@vger.kernel.org>; Thu, 03 Feb 2022 11:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ou6SteQ7e8jD8A+4zqassRqV6LLFpo+pYcUVGMYTaro=;
        b=oDb2z8xcZr48m5ct8ONk0DhUdO0ForJGWDFkim914NvSuz2iz5A7TokpELKqFxYlon
         UTHAU9fd7nBWFUiECxxJtn7KLBv8JCOikX9HBi4+Bok8uGbVoWDEAokEkBsOgGjBMgbw
         1ACeEvqn48Twv9XRnUEe0zu2Jvj6cD0VpoRuZc8ibaMK8he7RtqhO5Fdj1HlBJTNdKqa
         ccgwwusjtrMd4+94SegSenKYyUqPBpFzN4hfd6tWGZs8LHYEiCEA7vESnsBpFMoFO4dM
         t5D0iapiAwZCd4yEIKy0am+TUMK/DAcaFd6YSUFk0hZwrRIC1pUauCdJztp/TNdRkv9f
         hRKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=Ou6SteQ7e8jD8A+4zqassRqV6LLFpo+pYcUVGMYTaro=;
        b=FtCPBeg3Ap178nU8n7wNooZLMrhqtxfBi81UcWs54fTB8VWMzzq2droVi+JJEJwODF
         /EN+kyrjNxTxPJTweXWVa/vA7qdT0xpTmnEWTPKEwHaiQvc5OT395AmOM+CwJ+dtTNCY
         zPraDz+7mGz1NvzqqCZoZruvUwjhe9qjnWuaWuKQx9sTcxiyp7nJ7/5M7jC9+ezD2YjF
         E+XtT+ORIolCu1Jiwq90XLWMMrY6Q6T2vAROueYFqu8DpDVpOqbuXg8orPsKKd8OZZv+
         lHHVYOnUBKDjzxxUErwCoJX8rT20QNC8U8xpJrbW9Rh2I40n6ENRHRWpxNyuoX3u8COn
         G+aw==
X-Gm-Message-State: AOAM531VSsAWxNUUKb51zhXmTnjKJuniPj7pV70Ia/cM5WS+SvLgkIb7
        dfqZUms5zngd5WfPwjtMwNGtLWdlSeA1qA==
X-Google-Smtp-Source: ABdhPJzKmQBQZ4NsyoMF5kN2wik5YsBuSl4qZRhzImL64CPctO0QpEfnGPHyAmWD3R0EJocptVrCNg==
X-Received: by 2002:a05:6870:8785:: with SMTP id r5mr475316oam.159.1643914821982;
        Thu, 03 Feb 2022 11:00:21 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q14sm3834805ooi.40.2022.02.03.11.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 11:00:21 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 3 Feb 2022 11:00:20 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH hwmon-next v2 1/1] hwmon: (mlxreg-fan) Use pwm attribute
 for setting fan speed low limit
Message-ID: <20220203190020.GA236152@roeck-us.net>
References: <20220126141825.13545-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220126141825.13545-1-vadimp@nvidia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Jan 26, 2022 at 04:18:25PM +0200, Vadim Pasternak wrote:
> Recently 'cur_state' user space 'sysfs' interface 'sysfs' has been
> deprecated. This interface is used in Nvidia systems for setting fan
> speed limit. Currently fan speed limit is set from the user space by
> setting 'sysfs' 'cur_state' attribute to 'max_state + n', where 'n' is
> required limit, for example: 15 for 50% speed limit, 20 for full fan
> speed enforcement.
> The purpose of this feature is to provides ability to limit fan speed
> according to some system wise considerations, like absence of some
> replaceable units (PSU or line cards), high system ambient temperature,
> unreliable transceivers temperature sensing or some other factors which
> indirectly impacts system's airflow.
> 
> The motivation is to support fan low limit feature through 'hwmon'
> interface.
> 
> Use 'hwmon' 'pwm' attribute for setting low limit for fan speed in
> case 'thermal' subsystem is configured in kernel. In this case setting
> fan speed through 'hwmon' will never let the 'thermal' subsystem to
> select a lower duty cycle than the duty cycle selected with the 'pwm'
> attribute.
> From other side, fan speed is to be updated in hardware through 'pwm'
> only in case the requested fan speed is above last speed set by
> 'thermal' subsystem, otherwise requested fan speed will be just stored
> with no PWM update.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>

Applied with minimal change.

Guenter

...
> +		/* Sit minimal PWM speed. */

s/Sit/Set/
