Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45F35C433ED
	for <linux-hwmon@archiver.kernel.org>; Mon, 10 May 2021 15:36:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 19352611C1
	for <linux-hwmon@archiver.kernel.org>; Mon, 10 May 2021 15:36:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232937AbhEJPhy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 10 May 2021 11:37:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236887AbhEJPgX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 May 2021 11:36:23 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F613C061346
        for <linux-hwmon@vger.kernel.org>; Mon, 10 May 2021 08:35:10 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id i23-20020a9d68d70000b02902dc19ed4c15so10799070oto.0
        for <linux-hwmon@vger.kernel.org>; Mon, 10 May 2021 08:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=a4XjX4IqWaLrXYMPg+nNiJISiMBT9cLdzVf2lf2vnkc=;
        b=tGVYMUGN+BX62Vww1Db1iulFYeTO6J2GHm9WUB8Hqqr6oYofsc51rxnaSTDi9/tHzC
         FgQX5e20Xt17+iQgMxZpWaXjGK2um+bDTDXk/HeDek/+RChMpG92PDW7cMD8dwj9fYkD
         i40G3fhTtodRdODhSqqIXn490oBMNEWBWUfBK5rQAyTUmSQC1BkwsI8wCvkJRG9t2IUf
         pdMD9g1NOYDChQ9vMdQVSJai83LkanYd6lWH+mS0B2sI4G7+W9cTPKQKgRH07yxMp0IH
         0x5vb4IQ7zKoRLPRlS/vQjrXCjyXUXjJZZFCHVDagtKziU+o7mdQj0pSXeB8dcdV5Fr1
         575w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=a4XjX4IqWaLrXYMPg+nNiJISiMBT9cLdzVf2lf2vnkc=;
        b=YH8rCmmfSg6C0sGHnPgtIsUZWYXsxaEhihyZ73kzgh9XHHWc33oUONbCfBRct9mv1p
         LJW+vKzvWktOfIPc3WxzR/D1Z+uDDdglO7wMEC2Vv7AthZ7c0ATmCpJZxczbr+cgITjM
         j8hizODmn8PcC6dcDOn1rJRn3t6s5+zUry2SBx6a1Wplb410bQonvR1dJnSx0TWPGeH/
         yMWdGeaG6d4K9qYzFwXlHOhP6qUtWjENKpY5aujUwW1dwYANEkH1PXbjvL/SLqXhs+9N
         EB+cEzIzpGLYmYlTbj4DbYZe0NKXwFVgmE/PINIw/HTZB1rmUMenQzUD0u0SSg3j5kX0
         GuPQ==
X-Gm-Message-State: AOAM533+n1tCz3N+UzzMizj+7dGEnLapuwELw2tLbzhkYXKg7huRsoaz
        vl6VjrPmaCaptzpuqNmBU9k=
X-Google-Smtp-Source: ABdhPJxeqMcDSjCqhiueR59PhmZS2l1OOe1jmtXjz9hsN9YftDJXbCJUJ86jWW+3DmAYNn3j578DZA==
X-Received: by 2002:a05:6830:1656:: with SMTP id h22mr21996650otr.371.1620660909514;
        Mon, 10 May 2021 08:35:09 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w20sm58766oic.54.2021.05.10.08.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 08:35:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 10 May 2021 08:35:07 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     W_Armin@gmx.de
Cc:     hdegoede@redhat.com, linux-hwmon@vger.kernel.org, jdelvare@suse.com
Subject: Re: [PATCH v2 2/4] hwmon: (sch56xx-common) Use strscpy
Message-ID: <20210510153507.GB3212231@roeck-us.net>
References: <20210508131457.12780-1-W_Armin@gmx.de>
 <20210508131457.12780-3-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210508131457.12780-3-W_Armin@gmx.de>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, May 08, 2021 at 03:14:55PM +0200, W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> strlcpy is considered deprecated.
> Replace it with strscpy.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Applied.

Thanks,
Guenter
