Return-Path: <SRS0=Zk20=6Y=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CAE5C38A2A
	for <linux-hwmon@archiver.kernel.org>; Sun, 10 May 2020 19:58:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EDD4C206B8
	for <linux-hwmon@archiver.kernel.org>; Sun, 10 May 2020 19:58:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k2+XDM6/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729138AbgEJT6p (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 10 May 2020 15:58:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728071AbgEJT6p (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 10 May 2020 15:58:45 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C48BC061A0C
        for <linux-hwmon@vger.kernel.org>; Sun, 10 May 2020 12:58:45 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id a2so13156674oia.11
        for <linux-hwmon@vger.kernel.org>; Sun, 10 May 2020 12:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BGcmJTr+I4xJ4ohXD7CGetFglEF96ROWbRIzv4TBhDk=;
        b=k2+XDM6//VFeafzOzGUjhwVXZ9KPy8IS9QP5BM14yYzrxvXEK1FWQ24fTCkQiu84/h
         Xod9JkfCP3cKaLMu4CmKgeHedBXmFTTdzfXX3EUe3QrPVwLD4xwgxCo1dlMf4FTHVN/p
         rKzwGVCamMGLMqMR371ovoP5674CDbDEIfe+ACS2lPfVugRn6WTQgNrtLGQNr2j7/0H2
         Nz60rG5OyPKJ7Vu9lIiGenli5tXyqxEqkNTJ6NKXz7iPUBrIV3UPyuTv0y/+Xp2SM2PF
         aNoZtY7bYsGhFmCJjbCZY3M2m+PQukjubgbAxFuyhgrM3T5a+SivQaarF8XipzRksjOK
         LvMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BGcmJTr+I4xJ4ohXD7CGetFglEF96ROWbRIzv4TBhDk=;
        b=spfXfXuGaDxboIgCf9JLLz71i5vuNwfF0VPMELB4n+uPkJ3iPOvg8wDBQ7UWiMa11x
         PllX/Au41bsdX4uWrGgbX9Ly6UjP2nJIZQW5rPrlLLZQjDzLnPRjmujMfP0Fy3vSd2LI
         n84wyKy90lLqlMEiWOmTCdbG1ZmvqMXr2UWDN7QWNHjVY+nf3C4Lvw90+1xGZQxdMZO/
         zfhjHAqJNg1deLpQGxp4NHXRN4gyUXq15cr0CzkdqmIfHFCDCCrxI5uZbOLu95daGz4G
         glPSLPFbt6RhwrgHkVwopbEGYF14TIeJwSAHgsgYkyqQiF6DdF2OgalAHYREaBeQvSpy
         Cgiw==
X-Gm-Message-State: AGi0PubZJvQMAfY9s8NDqU2lLJhiVqBLzew1RJGWaLNkzxNMv81hPfQr
        MvKx4BWYLhIm3N//fNBL8i7TArP04WdK/zLj7Vs+FwPz
X-Google-Smtp-Source: APiQypK1dE6XeEBR0V1rirsIjOsnSOYGrrfwu5xV/dlL2eZJUNELuLt6tuiEnSjZBs+Es9D8RBJaHGGAlZ4DAYqHy0U=
X-Received: by 2002:aca:5943:: with SMTP id n64mr9781613oib.62.1589140724383;
 Sun, 10 May 2020 12:58:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200509213734.206409-1-linux@roeck-us.net>
In-Reply-To: <20200509213734.206409-1-linux@roeck-us.net>
From:   Alex Qiu <xqiu@google.com>
Date:   Sun, 10 May 2020 12:58:34 -0700
Message-ID: <CAA_a9xJ95h3LudbcoCLJ_EfT=kgvnBzTyFF5DwQF11M65rHL1w@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon: (pmbus) Driver for Maxim MAX16601
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Guenter,

On Sat, May 9, 2020 at 2:37 PM Guenter Roeck <linux@roeck-us.net> wrote:
> +#define REG_SETPT_DVID         0xd1
> +#define  DAC_10MV_MODE         BIT(4)
> +#define REG_IOUT_AVG_PK                0xee
> +#define REG_IIN_SENSOR         0xf1
> +#define REG_TOTAL_INPUT_POWER  0xf2
> +#define REG_PHASE_ID           0xf3
> +#define  CORE_RAIL_INDICATOR   BIT(7)
> +#define REG_PHASE_REPORTING    0xf4

LGTM. Thank you very much!
