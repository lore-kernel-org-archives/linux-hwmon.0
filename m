Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1478C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 26 Apr 2022 13:39:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237564AbiDZNm1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 26 Apr 2022 09:42:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241488AbiDZNmZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 26 Apr 2022 09:42:25 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30C7166AC9
        for <linux-hwmon@vger.kernel.org>; Tue, 26 Apr 2022 06:39:18 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id 12so20640342oix.12
        for <linux-hwmon@vger.kernel.org>; Tue, 26 Apr 2022 06:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+8VyYS2dsHXfyDs4/az3z2bvd89nmKsmlJ7TSSmd4YY=;
        b=nGQ+wMAOJrg2OY9FU2uc12NxJho9aOjFGZRG+JcfaOBrD3Zf9klwIuBxAJdpp3VLvC
         gLDLJ6levxziYfeAnE7BJ0uTvlFoG78cf11iDWgUChv84Gol6jPG8ZGF9Han3uByx3JF
         382DyuLiBZLfdGGA4Kz9HWu6YI58QbObWDRJNLokotQa1LLk2hnAHOVxG+ZR6vpPiTbP
         95SIC+hTZieOhhVZ6ePCDXehf5POB4UNuQRfm+Sk8fn6J2PjlEvnFqRLNqGrj9O356Sh
         tXn8baF6RCwaVRG1hT0WJWaeQos/2wySDzDsHXxgQHAmsKgXMry5xsKdKl1A8gzAAlF/
         4IUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+8VyYS2dsHXfyDs4/az3z2bvd89nmKsmlJ7TSSmd4YY=;
        b=uGY4RVzMU8Ppb8Q6Dobj5i/fB5biIHj+552CSMMEJ+ulQeAbovLJpq77XHTPxvzwju
         o4d/NK8wQrdLAOPEP2iWLjXV2hZiZVVemiN2snQjQ5sZ9ke01ZnhCqWwNrnYlpxyhoPw
         nHru6fW8EATeI1bz7r4l6Q8AHqThomTlE4w+fvsRn/VrUfNHdldDPyeotZHeFp4agyGk
         Kb28zNq7ZBEZ7IBRysYYgzt50YYhPJD7lowoYtErH7L+9ErKY89qDZLML73Jw+Gyslf0
         nzufCCdGMTvtLAsazN65WUir72NYjScsYD52cFMH53UhzFJ83sEcPy2bbsSpnd25j1E5
         EBmw==
X-Gm-Message-State: AOAM530g5gNl7KPINneAgy++nVXsnJ79ZmqYpyQ4Mq7niX2I4aTYx4rE
        c6zcYcYHJzxnYmHdQdj/25I=
X-Google-Smtp-Source: ABdhPJz2M4GTAdXigjQPG1mMGSDBHhW8CkjB35AzYX+IB3GzUuFulC30GuH/mJLQg/a8wRiSU1bXEg==
X-Received: by 2002:a05:6808:1a1f:b0:322:8f6e:c5f4 with SMTP id bk31-20020a0568081a1f00b003228f6ec5f4mr15554780oib.184.1650980357551;
        Tue, 26 Apr 2022 06:39:17 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x16-20020a056808145000b00323371f6935sm4936046oiv.15.2022.04.26.06.39.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Apr 2022 06:39:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a7fa7c5f-578f-480d-a2c3-eecb38032202@roeck-us.net>
Date:   Tue, 26 Apr 2022 06:39:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] hwmon: (pmbus/ltc2978) Use driver specific ops if
 they exist
Content-Language: en-US
To:     =?UTF-8?Q?M=c3=a5rten_Lindahl?= <marten.lindahl@axis.com>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-hwmon@vger.kernel.org, kernel@axis.com
References: <20220426092936.1127114-1-marten.lindahl@axis.com>
 <20220426092936.1127114-2-marten.lindahl@axis.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220426092936.1127114-2-marten.lindahl@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/26/22 02:29, Mårten Lindahl wrote:
> Several of the manuals for devices supported by this driver describes
> the need for a minimum wait time before the chip is ready to receive
> next command.
> 
> This wait time is already implemented in the driver as a ltc_wait_ready
> function with a driver defined wait time of 100 ms, and is considered
> for specific devices before reading/writing data on the pmbus.
> 
> Since this driver uses the default pmbus_regulator_ops for the enable/
> disable/is_enabled functions and these functions do not check for driver
> specific read/write ops, the wait time recommendations are bypassed for
> several of the devices managed by this driver (ltc3880/ltc3882/ltc3883/
> ltc3884/ltc3886/ltc3887/ltc3889/ltm4664/ltm4675/ltm4676/ltm4677/ltm4678/
> ltm4680/ltm4686/ltm4700/ltc7880).
> 
> Lets add support for driver specific callbacks in pmbus core which takes
> the wait time into consideration for the specified devices.
> 

This should be two patches: one patch to add the callback to the pmbus core
and a second patch to use it from the ltc2978 driver.

Guenter
