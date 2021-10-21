Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E166C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Oct 2021 20:14:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A80B61359
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Oct 2021 20:14:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231853AbhJUURO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Oct 2021 16:17:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231784AbhJUURO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Oct 2021 16:17:14 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 196C0C061764
        for <linux-hwmon@vger.kernel.org>; Thu, 21 Oct 2021 13:14:58 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id y15-20020a9d460f000000b0055337e17a55so1810375ote.10
        for <linux-hwmon@vger.kernel.org>; Thu, 21 Oct 2021 13:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iaLukhDXVjDK6gdf8RFTZ44QkzR/ED8HAJevru4P9zM=;
        b=HdIaxuNVdvq4ResoafnFlxcsP81jnjPn77f0czerhxpStoZD1l/mZO+bPDhrL+XRCu
         DG2z3ZWVZ404q7lKMowP7MExukeYfoVfDpy5XXQpaPykfV3GXbXMPVWKvTGT/i1dnnUm
         1XOhNrvkFLLWqVAIq+H0Q2xt8Sgxmg5DNaplHr8CcR8OuLMSaAgo338oJl9A/TAZ+Gpx
         lKiE+ZVufIkzIG6C8QfAsh7a8wEEP6KJhFJSxo5Hz35l9Tc8wYUC1Z6XP3nBNIkIvsmF
         IkyVKjajce20SVaX2u53tdmpiv2aF44DJCLdsmPt81l2opIHjR/SSvJrav/2as424iw/
         YnjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=iaLukhDXVjDK6gdf8RFTZ44QkzR/ED8HAJevru4P9zM=;
        b=TDiOCgAvNfpySEoCv4Bzzec8zZMngpgDiFKztXeYj8Kiw7ToOlpSHB5wvHCn1xEAtU
         LJICUHu0K33/FzdULoo1o7V6knwT/fpUGXJUUI+sZBTJgr61kSvISztMYnLC7uvo9U/o
         YYFuYLjj7kYmDGEr4fs5QWaa8L4s5PhZUQp0YjxUVtHW38TCjLj9jWDNbApG2ACbKsHU
         I8k/QPGz8qmnKQJO8CSmJTltB0XELZJXKWbEZSCt+dptlknUMWjgMo76/e4KUBow2PKX
         ms2GbQ3R2698CLONtsusHkIKSxj9SvE1gw2SDUGbBWcIC741RvCeyVQfYLD/j8/1qyMh
         5GCQ==
X-Gm-Message-State: AOAM5337/uech4Ywi4ObmnOoh4C8PpKGIh6yOp8pRYaNtYVcnKDcPAqO
        sIhKRSdZRalgsCL9QofBfqbkDClmlzk=
X-Google-Smtp-Source: ABdhPJxD/3tiqqi8Vvz8KAVjzGgSVyl4EvXrb2NNHblPBfibgKl7KLDVid/2iRUWeWRCgasM3SjCdg==
X-Received: by 2002:a05:6830:2b28:: with SMTP id l40mr6944349otv.162.1634847297463;
        Thu, 21 Oct 2021 13:14:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 91sm688331otx.12.2021.10.21.13.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 13:14:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 21 Oct 2021 13:14:55 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     W_Armin@gmx.de
Cc:     pali@kernel.org, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 0/5] hwmon: (dell-smm) Miscellaneous Improvments
Message-ID: <20211021201455.GA3153488@roeck-us.net>
References: <20211021190531.17379-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021190531.17379-1-W_Armin@gmx.de>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Oct 21, 2021 at 09:05:26PM +0200, W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> This patch series contains various improvments to the
> dell-smm-hwmon driver. The first patch is merely a cosmetic
> change. The next two patches improve the ioctl handling
> and have been tested with i8kutils (the only program using
> this interface). The fourth patch adds some clarification
> about i8k_config_data[], and the last patch
> accelerates the setting of fan speed and has been tested as well
> over the legacy interface and the hwmon sysfs interface.
> 
> Tested on a Dell Inspiron 3505, the Dell Latitude C600 is
> currently out-of-service.

Series applied.

Thanks,
Guenter

> ---
> Changes in v2:
> - drop patch 4 and instead add a comment on when to use
> i8k_config_data[]
> - reword patch 5
> 
> Armin Wolf (5):
>   hwmon: (dell-smm) Sort includes in alphabetical order
>   hwmon: (dell-smm) Use strscpy_pad()
>   hwmon: (dell-smm) Return -ENOIOCTLCMD instead of -EINVAL
>   hwmon: (dell-smm) Add comment explaining usage of i8k_config_data[]
>   hwmon: (dell-smm) Speed up setting of fan speed
> 
>  drivers/hwmon/dell-smm-hwmon.c | 40 +++++++++++++++++++++-------------
>  1 file changed, 25 insertions(+), 15 deletions(-)
> 
> --
> 2.20.1
> 
