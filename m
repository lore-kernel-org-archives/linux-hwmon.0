Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E41C0015E
	for <linux-hwmon@archiver.kernel.org>; Fri, 21 Jul 2023 18:27:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230496AbjGUS1U (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 21 Jul 2023 14:27:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230487AbjGUS1S (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Jul 2023 14:27:18 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 189F32D58
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Jul 2023 11:27:17 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-78625caa702so92310339f.1
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Jul 2023 11:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689964036; x=1690568836;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NSu0ngYoqJ5ft8KRw5gGC2zvKeKh8OpUg8eWz8QuZq8=;
        b=CRchbyBcLYjXYhWP1lNHho1W4eW7IaCW+MHFQZU9WGi/VfmRv8+LaRTvn247cGeCBt
         /0NevrHuIogUhIquF9q55rqPOxISmKSCpFhh27WMUdCl33khYN7t1kr35yo4Cv72wN6J
         YfIEYmxH2gWv+u83lcKnzCofZmaPS1I/PxyNAxI9F4L+g0xGOanMtXswk4nL+cUyjaUS
         lTaRDtpJ00np/1125XDlR0e/GG6k01xKVun1QZeu/sbSW5RLBD3Zh3BjB/Rdtx+gaLGy
         uLMvn2Birl9wLzyc1NTszelr0aoPxH+bBE74ukLpH44KoT4q5QAelnhVZhv1PRqYX/S5
         MYIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689964036; x=1690568836;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NSu0ngYoqJ5ft8KRw5gGC2zvKeKh8OpUg8eWz8QuZq8=;
        b=c7EHvaqW0NsjGqhkKi0ognDGz/u9FGZJSlo7uW8UOPLVuK/FARuenQJbcrYNLKc6Zg
         jYuryayAQ0H3W7F/kGbhTCcPrbLPOyJa6yPN1vC0ofKgC60tYrbSKHoVN5dr2YL5FSAb
         0/l0IVfBgKQAbNVBbVd+SxClhm4GKFZabcsOJdG8kSJPNaNQZmN+NO+iw0+R6CjT1d50
         M+cDlo1ilaAGkr28hFqBTxeWV6Ges4cJuT1BCmq6UBqpianKAnUQHwEq/1Mq0BCyzgMj
         vWbOQ3vymtoo1WuyIrS7qRtKsgjx6y3pXSltfRZ3tbRgWjVmDdB96Zx+GsYLZAwPOlJy
         Qx+g==
X-Gm-Message-State: ABy/qLZ4XELDyL7L+KW4qyKF4Rx52D+15323u5cT8cTqaBQKwJchNqSN
        0HQ6QrXHDGchLijR+R0vl7k=
X-Google-Smtp-Source: APBJJlEgo0hyEvp35J3y9CYnEQRF325nGpKxK/gZCockqDvFDZXaffhSG5/c77OV8cpb8uq+DbrQCw==
X-Received: by 2002:a5e:850f:0:b0:786:f4a0:d37e with SMTP id i15-20020a5e850f000000b00786f4a0d37emr703890ioj.4.1689964036407;
        Fri, 21 Jul 2023 11:27:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x13-20020a5d944d000000b007864c26fd35sm1185131ior.13.2023.07.21.11.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 11:27:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 21 Jul 2023 11:27:14 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Gilles BULOZ <gilles.buloz@kontron.com>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/1] hwmon: nct7802: Fix for temp6 (PECI1) processed even
 if PECI1 disabled
Message-ID: <1dc6bddf-6a31-4fa1-a149-c792beb406de@roeck-us.net>
References: <e6e6c227-6789-9c82-3561-530095f46e02@kontron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6e6c227-6789-9c82-3561-530095f46e02@kontron.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Jul 21, 2023 at 07:29:19PM +0200, Gilles BULOZ wrote:
> Because of hex value 0x46 used instead of decimal 46, the temp6
> (PECI1) temperature is always declared visible and then displayed
> even if disabled in the chip
> 
> Signed-off-by: Gilles Buloz <gilles.buloz@kontron.com>

Applied.

In the future, please version your patches and provide change logs.
Also, please fix your e-mail address configuration to avoid the
following checkpatch warning.

From:/Signed-off-by: email name mismatch: 'From: Gilles BULOZ <gilles.buloz@kontron.com>' != 'Signed-off-by: Gilles Buloz <gilles.buloz@kontron.com>'

Thanks,
Guenter

> ---
>   drivers/hwmon/nct7802.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/nct7802.c b/drivers/hwmon/nct7802.c
> index 9339bfc..024cff1 100644
> --- a/drivers/hwmon/nct7802.c
> +++ b/drivers/hwmon/nct7802.c
> @@ -725,7 +725,7 @@ static umode_t nct7802_temp_is_visible(struct kobject *kobj,
>   	if (index >= 38 && index < 46 && !(reg & 0x01))		/* PECI 0 */
>   		return 0;
>   
> -	if (index >= 0x46 && (!(reg & 0x02)))			/* PECI 1 */
> +	if (index >= 46 && !(reg & 0x02))			/* PECI 1 */
>   		return 0;
>   
>   	return attr->mode;
