Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D3D8C433F5
	for <linux-hwmon@archiver.kernel.org>; Fri,  8 Oct 2021 21:07:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D865760F9E
	for <linux-hwmon@archiver.kernel.org>; Fri,  8 Oct 2021 21:07:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242456AbhJHVJe (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 8 Oct 2021 17:09:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231696AbhJHVJe (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 8 Oct 2021 17:09:34 -0400
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1ACFC061570
        for <linux-hwmon@vger.kernel.org>; Fri,  8 Oct 2021 14:07:38 -0700 (PDT)
Received: by mail-oo1-xc33.google.com with SMTP id e16-20020a4ad250000000b002b5e1f1bc78so3271102oos.11
        for <linux-hwmon@vger.kernel.org>; Fri, 08 Oct 2021 14:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+pinIkXMwz/cgE1amLa23en8OIwiJzUaYnDcmv75xlo=;
        b=hE6gDev2coeiR5fyb8oKnRa7AmsWVR4lh+oDR/agv4VDrlk/6YFwktJ0rQJCLHw6TS
         YwvUa3yQ45ClTSy84RHuYFZ7PYfjPgVQOepLp+kwxkrocZbCuLBXjwAe7ctdkUWEemfT
         2ylFD6YkAZRZifrUZxmx8ZBVF/3CccVo4KSDe2oNsFAV7aTlebLwhgU6laqoWiKYkwK3
         s89g4e9AALVopse65OP+ctn34vC5sI/Su7H9NLaD+WuY36D4bAeMVPuU4/LWh46Gqr6r
         O5UgFrAz9LxYssbH6jZ71BU//tHWY68UHcKvPirsEDnd/fHhmH1m/Gpr31ErCfwGwufg
         diIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=+pinIkXMwz/cgE1amLa23en8OIwiJzUaYnDcmv75xlo=;
        b=UDV/fyutNa+TBcU56Sc7hXY/dmIJ9MOa2dzbzSzdHbQ88JK+4KvwexWVlZr3q5Q9cQ
         AkS+O+SkV0SzaMVQhpDvmFcScsrWet8WPAUv0z5IEHUtZYgh1inR32h1Kg1nSwpIa9OR
         b06WYARljmVNSk3qlKPFRbfqVZHMwCqIoWsk6lMkpnCiztIVjjtxuUxJANSnJt5nA41y
         9QS5rIXb3zrDGZjHSUVe/MYDuEcgNyM4dXNKWqaA87FHOPK4If1ys/20LW5Pxjybvoos
         sRdQyZHCeaiWAfWgepC22X2oiBdfUKTn95bbpRY5WhcEkQkUedszgYM8EmcepXjtyejF
         q0Qw==
X-Gm-Message-State: AOAM532CjjNLkUqKaoCmxNZXXeo869mDdSpDmdCIq0jftMoSej7zzFIa
        WZkR+lClnsOQUHTvlrRvIW/HjHK2MU4=
X-Google-Smtp-Source: ABdhPJwmluTwD2wc6MAw0/nDcoeGriAnm/GRJuvs1Ndyun+o2ZYbKbgAIVX2ZTyFBibuh35kdPfRNA==
X-Received: by 2002:a4a:bb98:: with SMTP id h24mr9580056oop.23.1633727257820;
        Fri, 08 Oct 2021 14:07:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e16sm157416oiw.2.2021.10.08.14.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 14:07:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 8 Oct 2021 14:07:36 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     W_Armin@gmx.de
Cc:     pali@kernel.org, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 2/2] hwmon: (dell-smm) Remove unnecessary includes
Message-ID: <20211008210736.GA3473844@roeck-us.net>
References: <20210926221044.14327-1-W_Armin@gmx.de>
 <20210926221044.14327-3-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210926221044.14327-3-W_Armin@gmx.de>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Sep 27, 2021 at 12:10:44AM +0200, W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> sched.h and io.h are not used anywhere in dell-smm-hwmon.c.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/dell-smm-hwmon.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> --
> 2.20.1
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 476f2a74bd8c..af0d0d2b6e99 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -26,8 +26,6 @@
>  #include <linux/mutex.h>
>  #include <linux/hwmon.h>
>  #include <linux/uaccess.h>
> -#include <linux/io.h>
> -#include <linux/sched.h>
>  #include <linux/ctype.h>
>  #include <linux/smp.h>
