Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 978C2C0015E
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Jul 2023 17:29:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229654AbjGOR3V (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Jul 2023 13:29:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbjGOR3U (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Jul 2023 13:29:20 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E74D272B
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Jul 2023 10:29:19 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-666eec46206so3087276b3a.3
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Jul 2023 10:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689442159; x=1692034159;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=yrt079iz0MMK6shD+7kEzF16h6RrPkqLxrfnJ38p2P0=;
        b=fDj33yh/afbOmOWI3fxFRl1VWqCBArqqZzlktRaD+Uq3mZVh2GF4HZ/VNMYDeJqF6e
         ihycxZzHstWhEC5fMMRiVqNfnj9NlfspNVCar5MKLAVgDCnMJD144sa8xioOCdU6Xe3q
         e+6rk3Zlxxhut+OFL4ywpI5+J/TyauFDQguF2xVs5IfMFxaMTpogWzguiOixbnQ+WQmd
         VZrEIf92dtW4+862g3hJPEvku6jDlaHD8CYy2gyYf7GslEIRmEzhcKrgFRUGPvBNAF/o
         rsLSfJnQL7G4yOqUD+uyT9Z4n2umc+Kc0AhX+z2y/jRoHyeNitzadMxrCYz6kMmI3aSO
         Iqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689442159; x=1692034159;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yrt079iz0MMK6shD+7kEzF16h6RrPkqLxrfnJ38p2P0=;
        b=SnR1as9wLghU9xDbnhMaXDGzxSSYpmbqMlnjIisZ/TaJY4xXXqReYEcBSxR1pax6jU
         A+jUOhiILGiPF+9MDBRdm4XI1+KQUlIpM2zrQqXSTSF4drqJio0WZheyhI+IpHzQZO6u
         LimyFIqe9C0oLuvDJ0CSjfis17x96nhkTNQwk1KFt8pJLblwB9m4X1RVyDOHDvfOqffj
         a/yiVT3SODHdKM99oAMmaLM5jdS5MsbFzcX7woWvCG+/ZTGXHsHQzjV6iPezWkrEGXo/
         rqBgayoVkO1IUjwHaOm4OcUrTbbxaCTeV0POh70nIqQp/RfmT1t5daKTWuLIJyfseWKZ
         pElQ==
X-Gm-Message-State: ABy/qLYdhilbn2/QWrJTegMInf6CGfDX7FvldPwePmsXkwdmEomcRU/3
        7cz0/93vJI2Cqb3O4fcmwXk=
X-Google-Smtp-Source: APBJJlEzJ9S4GopZNE5nVmuHMWuXi3CioC0GSnU9k3ZQ1cjXi93nhC6N10i4HSFw4BE8e1DkiVz8vA==
X-Received: by 2002:a05:6a20:7d90:b0:11d:8a8f:655d with SMTP id v16-20020a056a207d9000b0011d8a8f655dmr10756179pzj.4.1689442158913;
        Sat, 15 Jul 2023 10:29:18 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i11-20020a63bf4b000000b0053fb1fbd3f2sm8627097pgo.91.2023.07.15.10.29.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jul 2023 10:29:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c583a03b-78ae-16cf-c69b-474fd90ddff1@roeck-us.net>
Date:   Sat, 15 Jul 2023 10:29:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] hwmon: (nct6775) Flip Caseopen alarm as 1 is OK
Content-Language: en-US
To:     Ahmad Khalifa <ahmad@khalifa.ws>, linux-hwmon@vger.kernel.org
References: <20230715153234.1307325-1-ahmad@khalifa.ws>
 <d1307352-7b13-6064-25e2-b7504f55569e@roeck-us.net>
 <3e2862d4-c686-7a25-a898-32a1e3683b0e@khalifa.ws>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <3e2862d4-c686-7a25-a898-32a1e3683b0e@khalifa.ws>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/15/23 09:43, Ahmad Khalifa wrote:
> On 15/07/2023 17:33, Guenter Roeck wrote:
>> On 7/15/23 08:32, Ahmad Khalifa wrote:
>>> +    /* nc6796d-s datasheet states: CASEOPEN0_STS. CaseOpen Status.
>>> +     * 1: Caseopen0 is detected and latched.
>>> +     * 0: Caseopen0 is not latched.
>>> +     * so we flip intrusion alarms, 1 is OK
>>> +     */
>> Ok, I am lost here. 1 means that case open is detected and latched. That
>> is no different to all other chips of the series. Why would you want
>> to return 0 (no alarm) in this case for nc6796d-s ?
> 
> I read it as 'latched' vs 'not latched', but if it's the same for all
> of them, then I take this patch back.
> My mistake.
> 
> 
The chips latch the case open signal, so once case open is detected
it has to be reset by writing into the attribute. The rest (latched
vs. not latched) is just wording; "not latched" just means that
case open was not detected since the bit was last reset.

Guenter

