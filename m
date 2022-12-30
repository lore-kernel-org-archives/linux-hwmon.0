Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE98BC4332F
	for <linux-hwmon@archiver.kernel.org>; Fri, 30 Dec 2022 22:59:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235683AbiL3W7C (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 30 Dec 2022 17:59:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235680AbiL3W7B (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 30 Dec 2022 17:59:01 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AA001CFC6
        for <linux-hwmon@vger.kernel.org>; Fri, 30 Dec 2022 14:59:00 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id k22-20020a05600c1c9600b003d1ee3a6289so16077061wms.2
        for <linux-hwmon@vger.kernel.org>; Fri, 30 Dec 2022 14:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f7j2TTrNgzMM8cleI/IQxtrJnF5o03MsL4TpkXBMmrs=;
        b=de0OZcWcQUD6iKmPV98jnRk2ieTrSgFtYvmuZgpRtRlhJgJC2rSEidm0P3CvpVKkaY
         yH3GzYQsIcUxTodXAwdB1XNoI10TRrr7ntTKZFzGVU8Ny5kEKGEiXlbydFYaKv9Tsbtp
         jdLiwdQAE2nABY1qVFZXCJ8ie1c4orHP8s7AzryLNU8a4llUDsL0OPsTPtXM2mTCXpvN
         d89lYTmTWMJfhcBN+md2XQGJZ/WkFzSNLOWTpjwz6a/W8xYQoVnMoxOOm2UWx4SL6dR8
         ZqTUFlzPs8gKUu/VI5pPgLun6Jr7wsjhcCOXX/m+V6Rp1Ah5IcK1PLrIubQ9D/uoMp+b
         x0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f7j2TTrNgzMM8cleI/IQxtrJnF5o03MsL4TpkXBMmrs=;
        b=uyt5WgPY4ET8222TNU51izJlhhBWlqZa2seD9JGQZaZbCzOuFmHZF2YM5QvAkOmfGS
         nsfABlvjZEHs5T4SCj2WbA/0phWwudgMkfXILpwwTllAmlcbkGzvnkpGWgaU1gl5y9+/
         rkWwDoPjvCqX8ngOLfBf2sPzMZ09U3PqrS5e7rQEesscYG1g7Qi7Junrz7PQ1jJGq7e4
         MeBIvJxC1EPcyw5HMVFrz6Yg92hDRd/8AuWlxd9JK3Ay/pyDCor4COWa97ut8rDlQ1Qo
         jK9fhCJwzAoDE3iQsfy8S7hxUb2KGpLcbgxZof0GiRN4m1IzGLQG5Br1iXnwB+Q4l1xU
         uicg==
X-Gm-Message-State: AFqh2koyz1cRBClj+2xkVXD+VsLQTtTxhpYgapNGadeT6AqYyc4WDG1e
        F47SxVekq3bEVFgwJSQ6tU0HoewjZL4=
X-Google-Smtp-Source: AMrXdXvDLTVDQxTyJahmA9zWz1SkLI2JJ43DtowXycs74sOdN/eYKBuCdEepPooinr0X0h/17fy/Yg==
X-Received: by 2002:a05:600c:1c21:b0:3cf:9844:7b11 with SMTP id j33-20020a05600c1c2100b003cf98447b11mr29241574wms.23.1672441138725;
        Fri, 30 Dec 2022 14:58:58 -0800 (PST)
Received: from shift.daheim (pd9e2923a.dip0.t-ipconnect.de. [217.226.146.58])
        by smtp.gmail.com with ESMTPSA id m22-20020a05600c4f5600b003d995a704fdsm11990658wmq.33.2022.12.30.14.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 14:58:58 -0800 (PST)
Received: from localhost ([127.0.0.1])
        by shift.daheim with esmtp (Exim 4.96)
        (envelope-from <chunkeey@gmail.com>)
        id 1pBOL3-000C2Y-35;
        Fri, 30 Dec 2022 23:58:57 +0100
Message-ID: <73d1eb21-6cb9-a60f-218b-af129c2cb7a4@gmail.com>
Date:   Fri, 30 Dec 2022 23:58:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH RFT] hwmon: (nct6755) Add support for NCT6799D
Content-Language: en-US
To:     Sebastian Arnhold <sebastian.arnhold@posteo.de>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, Ahmad Khalifa <ahmad@khalifa.ws>
References: <184c3523-fb00-b0df-cf29-cc1b171c4ab4@gmail.com>
 <20221230175021.GA1136102@roeck-us.net>
 <c8d68feb-d44f-02c6-0a08-d199cef00b46@gmail.com>
 <20221230214855.GA3881237@roeck-us.net>
 <b31ed9ec-3bd5-e032-ea03-b116ece4dac3@posteo.de>
From:   Christian Lamparter <chunkeey@gmail.com>
In-Reply-To: <b31ed9ec-3bd5-e032-ea03-b116ece4dac3@posteo.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Sebastian,

On 12/30/22 23:13, Sebastian Arnhold wrote:
> Thank you very much for the patch, Guenter Roeck!
> 
> I just compiled it using the mainline Kernel as a basis, but "sensors-detect" still claims there are no sensors detected on my ASUS TUF GAMING X670E-PLUS WIFI.

Unfortunately, this might be because ASUS has some "new" ideas :/.
See this RFC from Ahmad back from October (Author is in Cc)
for an in-depth view why this is happening:

https://patchwork.kernel.org/project/linux-hwmon/patch/20221018173428.71080-1-ahmad@khalifa.ws/

Regards,
Christian

