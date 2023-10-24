Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47D26C00A8F
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Oct 2023 14:48:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234469AbjJXOs5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 24 Oct 2023 10:48:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343497AbjJXOs5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Oct 2023 10:48:57 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD897B3
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Oct 2023 07:48:52 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1c5cd27b1acso37930655ad.2
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Oct 2023 07:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698158932; x=1698763732; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:subject:from:cc:references:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=geodVAx2aVGSYUVKCREkNfDfr6HRCvzvW0wpu5g3zYw=;
        b=gWEW23jUiZWS36vrjIG8moc2oYAwvkr36Kx3VypqWMGxd4nyUnnDf+DApenEdZsj9F
         gUDkVELpkmgqGrdgNK/Rt/ZM0OZjaFiJRKEcuqEcsQCsJfbKGYAQmoUOiCclTclHRbEx
         3erkrTGH8hahjSLsZqvqTo8q73KzYgNz61ERKHaSlAkyos5lHYjoYP/4HI4uqSXrpQJx
         K73TXlawBcLz0Arb+7wIrVvXb8IbNoQMjY5Ck6SYIVd27CaIYmVuCO4WnA0wcwPfa8Df
         TNB3JRTOs7FSXa++G0zhAYcrbT+sVknzIIFFfhxLTqDuVmXMCjfbg5GQPROWXI85blAN
         q+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698158932; x=1698763732;
        h=content-transfer-encoding:in-reply-to:subject:from:cc:references:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=geodVAx2aVGSYUVKCREkNfDfr6HRCvzvW0wpu5g3zYw=;
        b=HlHE9Rbs5Tm48N+3bw3MJN23AaDk7KENBX8AeIT9d0NmxTf1nGpKXFUX4X1jz2qku7
         pSl99dUfha+Dhvha/X1M5823R8nqRr2jSOEm6g7zw/PuvD/bN9Q8doRQvHTLWKRkNz0r
         yu0tjA1YaBZAnZmGZWoD9XwrC8zzU9/2uKMo44SGWIO8oYdttPPgIDtlCTIJ3Bld6SZW
         cuVElPAe3haUR+Li+oT4tIEEy4og7ZyR5xH9k3XRJnxC6yDuxBEr8wVz6S3lGu80OGin
         6zRH1kn/R9vPllAU+sPDoZGS9+OeJGD7jg5r74gPoQakQt/LOaXJp8V/cuRfVS5qq3a9
         c3gg==
X-Gm-Message-State: AOJu0Yy5nhkLdmwPXkHvJ4dJBiLFFnCOJGdegqFCqXQAnd0nJ5ztFeL8
        e95woi6BMymnhozU+z9zBW3IQsSNFi8=
X-Google-Smtp-Source: AGHT+IFBZ+2zL7qw2fJ2eaCTvUovhKMweuJVTsS5/F3yRuUmq0qYcMSrgEh/f0O8Y7kVzDDq9ZfQQg==
X-Received: by 2002:a17:902:e88f:b0:1bc:2abb:4e98 with SMTP id w15-20020a170902e88f00b001bc2abb4e98mr11253325plg.21.1698158932031;
        Tue, 24 Oct 2023 07:48:52 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p11-20020a170902eacb00b001c9ad9470a5sm7504529pld.253.2023.10.24.07.48.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Oct 2023 07:48:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9c099de7-4290-5699-122b-927e39577439@roeck-us.net>
Date:   Tue, 24 Oct 2023 07:48:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To:     Ian Nartowicz <deadbeef@nartowicz.co.uk>
References: <20231024150438.68dd079b@debian.org>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        Armin Wolf <W_Armin@gmx.de>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: sch5627 on Fujitsu Celsius W280
In-Reply-To: <20231024150438.68dd079b@debian.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/24/23 07:04, Ian Nartowicz wrote:
> I just upgraded a Celsius W280 to the 6.1 kernel and noticed that hardware
> monitoring was gone.  Was working in 5.10.  When I added it to the
> dmi_override_table, it started working again (with a slightly different device
> name).  dmidecode shows it as an on board device, type other, status disabled
> (just the watchdog?), and description "SMsC SuperI/O".
> 

Weird, this is the second private e-mail I get in a single day.
Is there some information out there suggesting that kernel maintainers
should be contacted without copying the mailing list ? If so, tell them
it is wrong. As warning to everyone, I won't reply any further
to private e-mails like this.

Looking at the code, try adding ignore_dmi=1 as module parameter when
loading the driver. I think commit 393935baa45e5c messed it up and
prevents the driver from loading if the parameter is not provided.
Maybe the conditions in sch56xx_init() are wrong or too generic.
Armin, any comments ? Do we need to revert your patch ?

Guenter

