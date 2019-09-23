Return-Path: <SRS0=LAd6=XS=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B011AC04EBF
	for <linux-hwmon@archiver.kernel.org>; Mon, 23 Sep 2019 10:51:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7D42E20820
	for <linux-hwmon@archiver.kernel.org>; Mon, 23 Sep 2019 10:51:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HliQ9W+p"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728337AbfIWKvI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 23 Sep 2019 06:51:08 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40284 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728097AbfIWKvI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 23 Sep 2019 06:51:08 -0400
Received: by mail-pg1-f196.google.com with SMTP id w10so7808383pgj.7;
        Mon, 23 Sep 2019 03:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=FxDAL7Rq31R9jEICMa9ToiI00XCeai6ZZxJhPA1qUK8=;
        b=HliQ9W+p3Cv/hAKmqjAl9k8/YF2cUeqvGYjtjsdDwwBU+mg2LHbF0w2k3xkHzabEbj
         anP55fSii6Vtp8YCO5QgFVJ8GOwVWQpBXbc2k/kI5AeeBM62B26TEazZowl+yxCjXE+o
         FJcO5WMfktSCA1aUoq7iZfcT/wzEezim2CO3vF5xJISomXX4Nps36cHS4ucDmx71tDP3
         mRzxz0/FDhA+2majNr+QQKd1bitD2xVXakVVF/LHC5qKHXzMVyKJwh1BkH+u73O3KGGW
         EwRK5UXe1ZizRl+4fGWI3T2SlCu8zOt1krw85kSb+dZy2CpKtKsqIaRUxqdfDAMICdlB
         jtnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=FxDAL7Rq31R9jEICMa9ToiI00XCeai6ZZxJhPA1qUK8=;
        b=KwI35vQWKbkSYJU1GaL4jxaC8iY2yTE5W7rfU6IrgiNGGrodM/2XIWIJzFPOUthl7R
         rCenfzeX1pglTMOoWwjDtLa9UDVwX8vu/AXzM2NBZOz6+Yt/mBtC+NIhTCOhSf1M5xyD
         e6LcZyeA/HqmSC7EYpqa9JGpEtoSdDlcSco7ffFNZDEt/15rGHnk2hFMIRoiYdEToksC
         t1+A59+d6C0ZeOu0nv3m4AEu5ByrcMU3u8831PFcZx7ltxJohw0fLtfbsWfylBOx1nNX
         pq1MlC940V8DiRUoctxgwH6bVeZhRJIbbzkTD97eMSY8djbZ/frEn/4MoabFff3pbQHu
         aKXQ==
X-Gm-Message-State: APjAAAWXtTn+oiVJsI1MXBWO6y2M91Tkn5/D+Cp/2ACndL1v7Ltu9nrr
        2OTUUOTygFM5BALrAXkjYaU=
X-Google-Smtp-Source: APXvYqzULINnxYRixCLGXM0obFDDq756+5Bhu2gkbj2nYOwuIOXrKo6oSL36DsyKSFiiPp6s5z3unw==
X-Received: by 2002:a63:1222:: with SMTP id h34mr29818479pgl.344.1569235867281;
        Mon, 23 Sep 2019 03:51:07 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w65sm11946486pfb.106.2019.09.23.03.51.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Sep 2019 03:51:06 -0700 (PDT)
Date:   Mon, 23 Sep 2019 03:51:05 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Lukas Zapletal <lzap+git@redhat.com>
Cc:     linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] k10temp: update documentation
Message-ID: <20190923105105.GB22740@roeck-us.net>
References: <20190923071052.25320-1-lzap+git@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190923071052.25320-1-lzap+git@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Sep 23, 2019 at 09:10:52AM +0200, Lukas Zapletal wrote:
> It's been a while since the k10temp documentation has been updated.
> There are new CPU families supported as well as Tdie temp was added.
> This patch adds all missing families which I was able to find from git
> history and provides more info about Tctl vs Tdie exported temps.
> 
> Signed-off-by: Lukas Zapletal <lzap+git@redhat.com>
> ---
>  Documentation/hwmon/k10temp.rst | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/hwmon/k10temp.rst b/Documentation/hwmon/k10temp.rst
> index 12a86ba17de9..bb2d0a02dc45 100644
> --- a/Documentation/hwmon/k10temp.rst
> +++ b/Documentation/hwmon/k10temp.rst
> @@ -1,7 +1,7 @@
>  Kernel driver k10temp
>  =====================
>  
> -Supported chips:
> +Although the driver is named k10temp, it supports wide range of AMD CPUs:
>  
I did ask to drop the above, and I won't accept the patch as-is.
Many hwmon (and other) drivers are named after one chip but support
many, it would be quite pointless to state that in each driver's
documentation, and I won't get it started.

Guenter
