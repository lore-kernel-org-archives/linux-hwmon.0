Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D80E728CF
	for <linux-hwmon@archiver.kernel.org>; Fri, 29 Sep 2023 17:45:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232954AbjI2Rpm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 29 Sep 2023 13:45:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233233AbjI2Rpm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 29 Sep 2023 13:45:42 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D40B19F
        for <linux-hwmon@vger.kernel.org>; Fri, 29 Sep 2023 10:45:40 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-1c60f1a2652so7341105ad.0
        for <linux-hwmon@vger.kernel.org>; Fri, 29 Sep 2023 10:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696009539; x=1696614339; darn=vger.kernel.org;
        h=content-language:content-transfer-encoding:mime-version:user-agent
         :date:message-id:subject:to:from:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7q/Ocr/LuKL/ulDcDi15T1xKwBX0O06v5b0Uc8oaurk=;
        b=TlQGRmAT/8BbYP5nQkY8LQHZ+gnh/IvZJggAHFhfM3d07hCVnNQ8UsCUKfQquzYzLS
         O+JXkZRPPdN5b9Mtgfix00mUCx19c5MNhQraFJxzAq9TzDdWwAcBJLNm/mtYkIt6SiY7
         zzNarfRJHPsWbd/fekG4adsd5gDzyZTfPS8W9yg9v+8lSP6SSgXO6iO5I9PyWqyqbem9
         LGaSd40VdtLP39HfxwA+ZYvy4UIqc11m5NAw7P+Jj7um5HTusCiC6NnrE+g0MoRoodwP
         cJyELPk1O/8TPyeR4em6ajrLcZ/kX7iH8qAFJn/9oKebI7jARKyPCf7gU1OxY4wEYy09
         3ysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696009539; x=1696614339;
        h=content-language:content-transfer-encoding:mime-version:user-agent
         :date:message-id:subject:to:from:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7q/Ocr/LuKL/ulDcDi15T1xKwBX0O06v5b0Uc8oaurk=;
        b=X6l2XY4EwAGOHArwDcIN7EZLBF2CgSvDwVvKlHElMFpUTCvmiQPJi/Fi5n5INOCtfU
         8akeLiu8NOAuuGMZfo0Hd8Y1IAgLkiizavvvB1JkPmhsLBHHcC1HIaMi37FHKaIW4rIu
         X3vzK7soqaeFtNmYOZoggu8p6N4+8N7pDhH3J7HiasFMYC0+KMBZGTMO9y5XogxNvNGB
         hUbBy/0TN1iN5/DW+AwKZVfpqatrKzGTsF2XuoeZZUZtXBEAI4PSKAXIMfP1SZT9ATgK
         x3WV1tbu2ALJsngzJW0cNXF1a7L8E27hYWnZajqXzZO+WTeEIrlTi4Eo0Dm0cqbMI7of
         25zw==
X-Gm-Message-State: AOJu0YyAmRejBmESWKhjxYGQEFHXOIZ8kDZe3LKCsxtkQbMFAgrcuX3M
        UPAoEoLVp+JBr1J+GX5Tkg9ycGORN7L+lQ==
X-Google-Smtp-Source: AGHT+IHU/OFztXigyvrCJ2w0KjOB2f4hz+CWPA07oDdpbJxoaisrn4aLFEJOlAEYTuFv3mk4+N5ChQ==
X-Received: by 2002:a17:902:ced1:b0:1c6:2866:5aeb with SMTP id d17-20020a170902ced100b001c628665aebmr7334840plg.9.1696009539460;
        Fri, 29 Sep 2023 10:45:39 -0700 (PDT)
Received: from [192.168.43.79] ([47.15.3.9])
        by smtp.gmail.com with ESMTPSA id u14-20020a17090341ce00b001bb9f104328sm17162800ple.146.2023.09.29.10.45.36
        for <linux-hwmon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Sep 2023 10:45:38 -0700 (PDT)
Reply-To: businesssolutionsrocks23@gmail.com
From:   Noor Bano <noorbano3685@gmail.com>
To:     linux-hwmon@vger.kernel.org
Subject: RE: Meeting request
Message-ID: <c7c9ec48-8f77-f2cf-5bf3-ccdf4774c778@gmail.com>
Date:   Fri, 29 Sep 2023 23:15:31 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi

Circling back on my previous email if you have a requirement for Mobile 
App OR Web App Development service.

Can we schedule a quick call for Tuesday (3rd october) or Wednesday (4th 
October)?

Please suggest a suitable time based on your availability. Please share 
your contact information to connect.

Best Regards,
Noor Bano

On Tuesday 22 August 2023 5:43 PM, Noor Bano wrote:


Hi

We are a Software development company creating solutions for many 
industries across all over the world.

We follow the latest development approaches and technologies to build 
web applications that meet your requirements.

Our development teams only use modern and scalable technologies to 
deliver a mobile or web application the way you mean it.

Can we have a quick call to discuss if we can be of some assistance to 
you? Please share your phone number to reach you.

Thanks & Regards,
Noor Bano
