Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9277ECAAD4
	for <linux-hwmon@archiver.kernel.org>; Sat,  3 Sep 2022 15:10:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbiICPKA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 3 Sep 2022 11:10:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbiICPJ7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 3 Sep 2022 11:09:59 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E7A8165AE
        for <linux-hwmon@vger.kernel.org>; Sat,  3 Sep 2022 08:09:56 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id mj6so4582536pjb.1
        for <linux-hwmon@vger.kernel.org>; Sat, 03 Sep 2022 08:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date;
        bh=jtc7SNuzeIcNvrv3E2iX9Cn2tO1gjlb9ov73pUdjlI8=;
        b=ZGiuyqSn1YVQeGpSFp3XJl32Di8/xze82znyjJWY0XsJ6B4cOgEzx7rNrFisvfoQAN
         V0l0LXpbyKWD83EZI5037r4N0+jq/mG2EtVo9AHYQxosHqGJ9Z3gzAa4t0MQnb8grTDF
         zwtSs1YJPQMEUF0E7jGKOJUTcxtU9dii7RToVQVlQtp4NuiwRRr8sPBTGyKI4fw/SOAa
         j/upIjMygmMv8faAYyRBlwAhoOA4Br/h1Lif2TVKgS6C299SwMWM+ObBKxwq2CLK90zJ
         7gBC+/r6NjkaDKxzdA8+YFmkDlK6VSoirmAi4wL0rVYusx5jvBpeGLEeJcvFSGZtMhF4
         Ye4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date;
        bh=jtc7SNuzeIcNvrv3E2iX9Cn2tO1gjlb9ov73pUdjlI8=;
        b=0jQwJASghMKSCPMijbbDHltoESXFz13tNnH26qIE8hFi79xOx31CuSp78/+I4OgC8A
         lb/4U6YCxKNeVdr6nVteH8usJ/DGazfV65LeMt+ls4t9pKpeiimX1LpLYMghIaiVjsZY
         lCWRsoBi5c2nU+EvkzRmxg9U/qcObwYTpCTo3p1PqBQhsBUG0LtlmgvWbDxWNpX1Cc6i
         RE+83WWjA8F7i1ZuvFlwAon95ju3YHHww7i5fBs7QucYRtn44P5HIkWGCRh8Avdu0uA3
         X8KkdlX8ZDYtMBlCnb+LXYmpdjbgN6vW36K9cFhMQx7wGfY0UR5Bd9iC8Zm/kFt+I3fq
         W/8A==
X-Gm-Message-State: ACgBeo2Rn/DuL6EzTgXXgAI+WWALvyMXXCz01cBkAuDSU+IYbqqIf1sh
        d8TGkSkDh+L84WDZLuZ6u6SHJMZXkNoyUQ==
X-Google-Smtp-Source: AA6agR6u48YUysWaNcA9gdUTpOEVLmdWjwDo5XE5nO0/v/HQX5TavYw0M86RxFxSs49/yOlLZU/fNw==
X-Received: by 2002:a17:902:c10c:b0:176:9070:8039 with SMTP id 12-20020a170902c10c00b0017690708039mr1646901pli.88.1662217796030;
        Sat, 03 Sep 2022 08:09:56 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id nn5-20020a17090b38c500b001f7a76d6f28sm3464274pjb.18.2022.09.03.08.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Sep 2022 08:09:53 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <62fb8a16-bebd-5de7-0b4f-eed4d2593587@roeck-us.net>
Date:   Sat, 3 Sep 2022 08:09:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Issue in asus_ec_sensors in Fedora installations and other
 distributions
Content-Language: en-US
To:     Christopher Klooz <py0xc3@my.mail.de>, eugene.shalygin@gmail.com
Cc:     linux-hwmon@vger.kernel.org, regressions@lists.linux.dev
References: <6026b5e2-a8f5-1058-6112-f191bde333a6@my.mail.de>
 <47e41e8f-f6b2-4bc7-de3f-0c811ee6fdf7@my.mail.de>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <47e41e8f-f6b2-4bc7-de3f-0c811ee6fdf7@my.mail.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/3/22 04:00, Christopher Klooz wrote:
> Hi Eugene,
> 
> Currently, we have user reports of at least 4 Fedora installations that have issues with asus_ec_sensors since 5.19.4. They remain in 5.19.6.
> 
> All issues can be solved by blacklisting asus_ec_sensors.
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=2121844
> 
> The bugzilla report contains kernel logs of two machines, one with nvidia-driver and one without a tainted kernel.
> 
> The report and the contained ask.fedora link contain some elaborations of how the issue manifests at the users' machines. The major issue is a wrong output of battery power percentage (in one case it gets stuck, in the other cases is becomes erratic). Also, in one case it has effects on suspending (see the report).
> 
> On the Internet, there are already reports from other Linux distributions noting the issue and the same solution (blacklisting).
> 

Eugene,

do you have an immediate idea other than reverting the patch pointed to in the bug report ?

Thanks,
Guenter

