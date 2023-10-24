Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 671B7C00A8F
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Oct 2023 14:33:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234502AbjJXOdR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 24 Oct 2023 10:33:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234500AbjJXOdQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Oct 2023 10:33:16 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D26F98F
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Oct 2023 07:33:14 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-5a1d89ff4b9so2543295a12.0
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Oct 2023 07:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698157994; x=1698762794; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:subject:cc:from:references:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S2BfDwiq289FrZkFuwuYCIWIH3a6VxBH12QkSrHpXpw=;
        b=Eb07HqjCUIikA/NMefSejxgyh6LORfbf/ee/foMW7az+nGYOban63mBfnLv+C7ZB99
         ZJ1uws1xMHnZ8OMD5mbt9O6RoiKD5kVAsYETFjWqNPkmcoT7ov6oZesKwhTPc3odYGUB
         xJquDkkiHdlNMQG+SptHbn0nlKDcVQmBMp7bDgC1kDoRet+vApIg8vFkk7TetJKCou5o
         YOYFOyiWrdPjjC4xVhbG9R+rRyznZm4yP+qyIl4GlQovslmkMiPB+XWllVQ7RlWyxB9Z
         iPhBFWPIvKHTtaN/3S/JjFsaXCiNA76YCLS2wkD7PSqrDfI9ZJIseRpKeJkq61ovTjOX
         JhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698157994; x=1698762794;
        h=content-transfer-encoding:in-reply-to:subject:cc:from:references:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S2BfDwiq289FrZkFuwuYCIWIH3a6VxBH12QkSrHpXpw=;
        b=vVIepkqx3rRkXUueScyW2i/3n5+/qEQSekV0HE3u0qQvTXt/FgiEMA2yhNpC5cYw47
         KEOKEy7NUMg9e6J4pnaD/tuYqqN65MFF43uv7OyuhVPAMJBCx/O+oT4jykzaJQXvoTRg
         1L/Cr8hSkFynwaSweTw+NikMQaLhYwb9DIX2+o7UheecMgO6vHamrt43KiRNNa3EM7fN
         qJPyMIBifi61+pQQ0nC8u1LBjOnY7HHGA2k05SvR9nveU7i6ISs5EWvGRQUP45mml9/F
         dWx0ui4RaljhRIiU/kYQFFzWAmI4xXsBlLUAP25Wj/zc33anba3boOjaIXebZZY6KEXy
         w1QQ==
X-Gm-Message-State: AOJu0YyGghpEndi53rkaSKs3EjyuxhgZG9j5Zrxccq0W1F2nRDU2qRT+
        8u+hILYSAovvDwS7Tj/kpVUGxgWY4bI=
X-Google-Smtp-Source: AGHT+IF7wJP22/ubigezARe5ZsfZANOvgGurjlz572tLcnRwod3Z3C81pQmqf1CL5jVntT+fRDF8ww==
X-Received: by 2002:a17:90b:b15:b0:27d:5616:9907 with SMTP id bf21-20020a17090b0b1500b0027d56169907mr9929141pjb.46.1698157994094;
        Tue, 24 Oct 2023 07:33:14 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id jc1-20020a17090325c100b001c5fe217fb9sm7512915plb.267.2023.10.24.07.33.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Oct 2023 07:33:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <13a32153-5fab-8cb0-0e7f-554f2333d25f@roeck-us.net>
Date:   Tue, 24 Oct 2023 07:33:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To:     Jason Forbes <contact@jasonforbes.ca>
References: <26d372a4-383a-42ee-951a-ef17926119de@jasonforbes.ca>
From:   Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: contributing to nct6683.c/NCT6687D support
In-Reply-To: <26d372a4-383a-42ee-951a-ef17926119de@jasonforbes.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/24/23 05:12, Jason Forbes wrote:
> Hi Geunter,
> 
> I am interested in contributing to hwmon/nct6683.c by extending support for the NCT6687D chip. Since rudimentary support for it already exists in the module, I thought you might have its implementer's documentation on hand. Are you able to send me that documentation, or if not let me know where I can find it?
> 
> Specifically, I would like to add PWM controls.
> 

I did not add support for this chip myself, and I do not have chip
documentation, sorry. You will have to ask Nuvoton.

Note that the chip is really an embedded controller. The firmware
on the chip may not be from Nuvoton and be vendor specific.
That is why the driver not only checks for the chip ID but also
the customer ID. This also means that having the chip datasheet
won't help much; you will need the firmware documentation for
the target board. In my experience, that is all but impossible to get
due to NDAs between Nuvoton and its customers.

Since chip programming is customer specific, any enhancement from
your side must be customer specific, i.e., only apply to the
chip ID _and_ customer ID of the target board.

Please refrain from sending Linux kernel subsystem related e-mail
without copying the mailing list.

Guenter

