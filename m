Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89B62EB64D9
	for <linux-hwmon@archiver.kernel.org>; Sun,  2 Jul 2023 20:51:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbjGBUvo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 2 Jul 2023 16:51:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbjGBUvo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 2 Jul 2023 16:51:44 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A86BA6
        for <linux-hwmon@vger.kernel.org>; Sun,  2 Jul 2023 13:51:43 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1b84c7a2716so18410585ad.3
        for <linux-hwmon@vger.kernel.org>; Sun, 02 Jul 2023 13:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688331102; x=1690923102;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=GNQ7MCU0vFQALsRwU6Qk+wtv/uz0hK2eGYJI5C64+Mc=;
        b=iB1xxEuaDfR9jwFh1VUCMJb6A4gHq9fWcLuQPvrmXjGWdDfNjVrL6LzQUlDL43L9TD
         KhfKfqr7RFwwRIWI+4MiKRz7Fxp/KozJfZbvsMhlSxHU2lIKqEepDWZu/ZfLFvD96p1d
         8IoRBPLVKqirYqjtspeeSsUv9aiEi7rh7P5Y1V6bVGK3eU+ZqpFDOHlwMRPglEwN4SVk
         OQHrv2fHXLqGW8iP9TuryOO7GHLfbMcpCgl/9WMVVXHkpbJo9isY9xxgH/biOQKL3OoI
         zIEU+pn6PgNMcsrtoJGG1yHqTvJMGeS3x+LAmEVsm/OGvzDiRCcKUa69CyOZd1kyHDO6
         5CJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688331102; x=1690923102;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GNQ7MCU0vFQALsRwU6Qk+wtv/uz0hK2eGYJI5C64+Mc=;
        b=hUCLetT5wmEwYyVxAM1mObm905Xqaa9J1b5ZTthrP0sFtNvZc78Ie0AwXXGknT99DA
         /AQXpCEjGfVGxfGd3sMgCm8B0dgBptp5WbTfWq6uXQb7G94+FAHB2RjCFeBqKHBRk3vt
         c7NrMy9QZU3fm121Y2AJ8CT2XD/kij6dUaODS86Ybr2BiL0qe6kKPYeMmc33VV296cOO
         WCNxMZhAqm/rPEoXoNSLMyk6CVr7UBcOyq0de9rUPu++KOUDUmPrctSS+MxFjsxushjQ
         88B2Fw86edXydP0Z0gjwLe26uBq1Kh2z1Mp12A5+xYQcLmSpqY+ugRXugh8EF34vOOkn
         R4dQ==
X-Gm-Message-State: ABy/qLYXSOsx/w0u7HWLEJ46sKodn8mD/Nm/5pxT2rGCcNNHbax+o8S6
        MWVjWhynSpOywTB6QCfctsE=
X-Google-Smtp-Source: APBJJlF4OXSrfI76rKfx9UR12l626wyyHZoSLHdtd8sAf0dFkhpcSZPIEvVjGOQKRQ+IFwfHbFqIsg==
X-Received: by 2002:a17:902:b209:b0:1ac:63ac:10a7 with SMTP id t9-20020a170902b20900b001ac63ac10a7mr5439520plr.68.1688331102607;
        Sun, 02 Jul 2023 13:51:42 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 8-20020a17090a004800b00262af345953sm16463236pjb.4.2023.07.02.13.51.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Jul 2023 13:51:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4b71ba43-4cbb-0840-a46a-3fe4518254d0@roeck-us.net>
Date:   Sun, 2 Jul 2023 13:51:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 0/6] Add HWMON support for DGFX
Content-Language: en-US
To:     "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc:     Badal Nilawar <badal.nilawar@intel.com>,
        intel-xe@lists.freedesktop.org, linux-hwmon@vger.kernel.org,
        anshuman.gupta@intel.com, andi.shyti@linux.intel.com,
        riana.tauro@intel.com, matthew.brost@intel.com
References: <20230627183043.2024530-1-badal.nilawar@intel.com>
 <87ilb385fv.wl-ashutosh.dixit@intel.com>
 <5aa93c3a-a4c5-9ca3-6ecd-38cef9f59605@roeck-us.net>
 <874jmme276.wl-ashutosh.dixit@intel.com>
 <d571bfca-9156-7280-a5eb-783c431500c3@roeck-us.net>
 <873526dpl3.wl-ashutosh.dixit@intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <873526dpl3.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/2/23 13:29, Dixit, Ashutosh wrote:

> Of course people might have been abusing the deprecated API's (or NULL chip
> parameter) but to me it seems there is also some legitimate use for them.
> 

You still neglect to explain what you think that legitimate use would be.

Guenter

