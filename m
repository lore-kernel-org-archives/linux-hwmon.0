Return-Path: <SRS0=5f14=SZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 027ABC10F14
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 13:32:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C2C212077C
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 13:32:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qBcd7yuW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727305AbfDWNc0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 23 Apr 2019 09:32:26 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:42502 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbfDWNc0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 23 Apr 2019 09:32:26 -0400
Received: by mail-pf1-f196.google.com with SMTP id w25so7500982pfi.9
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Apr 2019 06:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NP29rsumCvvUNRC6yuTafrpahsfDfq0Nj9O7+fKOrQg=;
        b=qBcd7yuWaTGbj5/ZEqlkVXf5eZ4KHHW8rjBfdWBj+8czRkN4czcDFsvijuvP4TVvtc
         Hrv5EBjPHMeVd0ozxvYS6JEClbXVQZqXuJ0+A68g2UmCkbbTbkLWIiIiznHdwcnmOiL+
         P/OpNyaFjL4AVmt+0oWcE9/qRgC2PPkecCtPBhNTQUJ5v3kJpZs7HCrnTs/yU/FjQtcv
         ZvrU7xSV2O30zOEJmuN6ZDMArCDB9wQsxn7OcBt4YlSG56Aa86NPr7OGGh+J/Iiy/2kE
         9Yx8ulZiH3mX2u0uakaZxVQWcFanHTnmT1McmHL0aAd5J5HBWsBjREpDXNMny9YjhBrD
         2tSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NP29rsumCvvUNRC6yuTafrpahsfDfq0Nj9O7+fKOrQg=;
        b=NUglxSX+BxzpjtAuKrA8jKJHAIjJAcQCOOR+/DRU0ImsN5NGZ0LHCYCKtQ6OfsPOnq
         B4imcmM3TDhAqlui0gQpf4RqQk6+hgiQGYpgFL49K3zEXlYcLvgfjtCNjeRW3FMQXnTG
         SzW8BJ58GpsU3rVdzZOQiLWNuzleGHCiClCtJ4PvMAtziWTBwU06QqQ8gGVF7EyXLggA
         F+QOtdxEwRrEFZbimnTR5awADSGVS/DFQ0ydyfMVXfCXqIJKGq7QUasUITMv/sOMsKb6
         8qcc/HigFmgsRK5yezhpp8sjuoqhWs3hP9mpyY0FcaAyLqKpWcO/54McSaP1j+UfinUi
         Nnhg==
X-Gm-Message-State: APjAAAXX2QeTDneK06hbqHpMQHE1D4rYuv7COf8GYGTVd1rUpGVk7Blp
        hUwLk+8+zNcdO2G4cKURVoU=
X-Google-Smtp-Source: APXvYqxFk6fOFiGGu5rLyDz4jowDHR0le5nKz/DOVAV1z/5EPPFUmycX9kClf6h5I3JyGFAjEdedGA==
X-Received: by 2002:a65:500d:: with SMTP id f13mr6774600pgo.250.1556026345544;
        Tue, 23 Apr 2019 06:32:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j5sm20910031pfe.15.2019.04.23.06.32.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Apr 2019 06:32:24 -0700 (PDT)
Subject: Re: [PATCH] hwmon: (max6650) Drop call to thermal_cdev_update
To:     Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>
References: <1556023014-6159-1-git-send-email-linux@roeck-us.net>
 <76F84515-0A8D-4792-A2E1-7144CDCD999A@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <7c09c260-ba96-9d4f-1e41-e639864c93cc@roeck-us.net>
Date:   Tue, 23 Apr 2019 06:32:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <76F84515-0A8D-4792-A2E1-7144CDCD999A@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/23/19 5:42 AM, Jean-Francois Dagenais wrote:
> 
>> On Apr 23, 2019, at 08:36, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> The call to thermal_cdev_update() causes any fan connected to the chip
>> to stop immediately. If the thermal subsystem is not set up to actually
>> handle the chip as cooling device, the remains stopped until is is
>> restarted manually with a write to a sysfs attribute.
>>
>> There is evidence that thermal_cdev_update() should only be called from
>> thermal governors, not from thermal cooling device drivers. Drop the call.
>>
>> Cc: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> Tested-by: Jean-Francois Dagenais <jeff.dagenais@gmail.com>

Thanks a lot!

I thought about merging the two patches, but then concluded that your
Tested-by: and the thoughts behind removing the call are valuable,
and decided to keep the patches separate after all.

Guenter
