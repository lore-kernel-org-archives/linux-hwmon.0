Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E16F9C04A95
	for <linux-hwmon@archiver.kernel.org>; Sun, 25 Sep 2022 19:51:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231970AbiIYTvC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 25 Sep 2022 15:51:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231783AbiIYTvB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 25 Sep 2022 15:51:01 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 545BD2610C
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 12:50:59 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id q9so4812741pgq.8
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 12:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date;
        bh=YS6W7N+TYUpScytiNQbTdHuw3vUuIwPthHVMJjatvpQ=;
        b=Vd1d5pKuNGETDUPds1xRn6LSM7TxCidgf1h9AWGBx0Xim/3iy98TU6ZBTC388LD9S4
         LPviopbqzxVqpcYzFJJwfeA2XCk2IqTk16xPp+f9X3+6M9OS+/TMG3ztAKBa5ADnzBF7
         EEOli+3yF6YXpVBVySxtQM3vhbyb2zqkWBkq/pZIdJ8qFvzYWKmCOLZgUjfqWHhza+vy
         oHFsEUf7BZPYaksQ6GtmHRSGCu+Jk3v+Fn9YcmCtluZGn9DcpeNOtLTPqECCdhgN8mJR
         2N5jiIPXrMJNk2BC1hR8mtrS54LBQVADwjA41JbtAu433sJiepa8H1ptOrm1bA+1bfCk
         0Zmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date;
        bh=YS6W7N+TYUpScytiNQbTdHuw3vUuIwPthHVMJjatvpQ=;
        b=W4xZDl9Ily0vpPXK94XUc3DZtCLSqLUPIm2CFCqrfpjrPoJuiHjXHvb06RUa0RRrVl
         JoY1eIu3Lw2D35F6bw2lDB/6A5Int7gJPUjHwEjcdmMxlOobupOkjkKs/fJqriMFeYCW
         Uo55GIUOs0Oi8kukEucH9NZCRNddy64seu2/3lxiqSbhiPV8Rv7B4iJKfQaSPkAQ6pW+
         W5Ne+YiOpD9qwGip65TKwm6M6zmZgpeHbA4+kkW7+30UQoRxCLg7lWT6O/vNJ+SdBK2/
         0v4p8ld6kmGmFTEm1PWmzeI6EpvWfnKPJmkdwQ6QnMEOrTVmTUMnmOTJavmgc1lQUDKf
         r2sw==
X-Gm-Message-State: ACrzQf15NhDf/eW5EJ2DGmwKw+FTKtIwVksHl97VtayfoGcvI0dh5mzf
        Up2cYh0lXsdaRmKCfc0V1aQhBZcwcWQNRg==
X-Google-Smtp-Source: AMsMyM7KoImL52Rze3CHpNB7dGqKFagGHErzcOsmS2NhkymNqNesHIN/plCPFvo5I0e+fygGHCYjbA==
X-Received: by 2002:a05:6a00:1a07:b0:541:6060:705d with SMTP id g7-20020a056a001a0700b005416060705dmr20475302pfv.61.1664135458779;
        Sun, 25 Sep 2022 12:50:58 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g16-20020a633750000000b0041c35462316sm9125339pgn.26.2022.09.25.12.50.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Sep 2022 12:50:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <02b28838-846d-e3cd-ce3b-25fc2a9d5881@roeck-us.net>
Date:   Sun, 25 Sep 2022 12:50:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        kernel@pengutronix.de
References: <20220925142631.GA1751571@roeck-us.net>
 <20220925191810.gnlkg53jifxk2glq@pengutronix.de>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hwmon: f71882fg: Reorder symbols to get rid of a few
 forward declarations
In-Reply-To: <20220925191810.gnlkg53jifxk2glq@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/25/22 12:18, Uwe Kleine-König wrote:
> On Sun, Sep 25, 2022 at 07:26:31AM -0700, Guenter Roeck wrote:
>> On Sat, Sep 24, 2022 at 11:28:52PM +0200, Uwe Kleine-König wrote:
>>> Declarations for static symbols are useless code repetition (unless
>>> there are cyclic dependencies).
>>>
>>> Reorder some functions and variables which allows to get rid of 42
>>> forward declarations.
>>>
>>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>>
>> Applied to hwmon-next.
> 
> Thanks for your prompt action on my patches, very appreciated!
> 
> Let me just note two things:
> 
> a) vger refused to accept this mail with "Message too long (>100000
> chars)", so I guess it won't appear in the archives
> 

I guess that explains why I don't see all patches in patchwork.

> b) Your reply didn't have a "In-Reply-To:" header, so the threading is
> broken. Because of a) you cannot see this in the archives, but it
> happend already before, but not on all the mail I got from you. An
> earlier instance is
> 
> 	https://lore.kernel.org/linux-hwmon/20220923002301.GA1159397@roeck-us.net
> 

Some of the e-mails I reply from mutt, others from Thunderbird. I suspect
that one of them doesn't add the "In-Reply-To:" header. This one is from
Thunderbird. I'll send another one without Cc: from mutt. Please let me know
which one is missing the header.

Thanks,
Guenter
