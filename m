Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F46CD37B0
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Sep 2023 18:21:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbjIRSVV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Sep 2023 14:21:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjIRSVU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Sep 2023 14:21:20 -0400
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46EF6101
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Sep 2023 11:21:15 -0700 (PDT)
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-34fe09b3586so4047155ab.1
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Sep 2023 11:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695061274; x=1695666074; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=2yXq7WjUVhDpq+XJo2HQIE8JFRpRqO60M+CS7gtu4jo=;
        b=kiqOIfD76f9y9JuaodSZqaTSZUya8svTdmIG3ZFZ9+hf8b05WLsSbw28DNIjWlQX5C
         +OPhl0bSQS2+lLbZh3ZRAijjiZSG+vLOSJzz04pRagECLJ3+b+vR6eCJFZDwVebLda4g
         MFuGVhlhciYK4ePv0pgOqBa1Tlb8c8tzm9M+w8/94+YVJ1rXAEIJyvLCPn4m+3BMnJul
         /H4InbL5CGUUnso0tqAqnjExBN86xwbj8BbA2O2XgK32TiATL/EU23mHAnktp6H9s3ZS
         euBH80xjunc3BqqkQHwWdlc52VXBxsGsQRMVbzknhMPH98DG/Q2RhXIO8rI+xUh6fx5k
         wlLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695061274; x=1695666074;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2yXq7WjUVhDpq+XJo2HQIE8JFRpRqO60M+CS7gtu4jo=;
        b=OLp2CTTJzbZAY4Pfk+4e9YfJObMDr4kmgpTo4E4rSaLdPfd8aeVJU4SnsUD4WQg1gv
         9uLovwrHktNlG6Cp38zOxtR9nTviFPP887gdGk4n1YXaL1fsYt/W3UG6PmHWg2yc61ly
         Fiva1Uf38gQtVBym+q1dCYYziB/iBvtUjqKTgSPRS3rJ99V8sGojU9/avUZ+b6pCZV9b
         UYk7Ry2ElXnDEvzmKBlxQUbk1y29gEl3KBoeu9MiDIwdIrP0D+Smxa1Bqdt1urxnFqfL
         99agPjoKstmJX+/EQJzcGgPyf+vduE2HajHP8nHJKTMn3dRlYmsiJA4NmTAcNwIBL50n
         AUNg==
X-Gm-Message-State: AOJu0YxuH5OYiIWivlqrg3lHLPNugBrs6qAUDy6Nm+CIvH/WHgDu1jkW
        Ry4Wpw2Y7fXMH7z2oqo+YcRFTvqtKts=
X-Google-Smtp-Source: AGHT+IEn7Nd7l+PQhA/JiZJIf8eg8pViOiRQU3s1rn6yFgiq3tTTWnLnjRF/RuMRKBpiw8JDwq2H+g==
X-Received: by 2002:a92:cdaf:0:b0:34f:49cb:40a9 with SMTP id g15-20020a92cdaf000000b0034f49cb40a9mr13546213ild.4.1695061274536;
        Mon, 18 Sep 2023 11:21:14 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o2-20020a92d382000000b0034fd1bd1adasm1783687ilo.83.2023.09.18.11.21.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 11:21:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9cdefd93-a1f5-0b21-5cbc-280dc90fc71b@roeck-us.net>
Date:   Mon, 18 Sep 2023 11:21:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: hwmon: (nct6775) Regression Bisected
Content-Language: en-US
To:     Ahmad Khalifa <ahmad@khalifa.ws>,
        Doug Smythies <dsmythies@telus.net>
Cc:     'Jean Delvare' <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <002101d9e7e0$f67c4490$e374cdb0$@telus.net>
 <1b747280-a1cc-d125-a40d-c3bcce39297e@roeck-us.net>
 <322119da-0de6-ffe4-d2cb-0d7cda1c4a53@khalifa.ws>
 <001501d9e9ac$656a1cc0$303e5640$@telus.net>
 <8443061b-7d50-4502-3e5c-cbbdb9eb42c8@khalifa.ws>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <8443061b-7d50-4502-3e5c-cbbdb9eb42c8@khalifa.ws>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/18/23 10:02, Ahmad Khalifa wrote:
> On 17/09/2023 22:17, Doug Smythies wrote:
>> With the kernel I compiled yesterday for the test patch, the file was not there.
> 
> That's the better approach, the file shouldn't exist.
> Would you like to submit that patch then? I can test it and reply with a
> "Tested-by" tag after. If not, happy to submit one.
> 

I was waiting for you to submit the patch. Please do.

Thanks,
Guenter

