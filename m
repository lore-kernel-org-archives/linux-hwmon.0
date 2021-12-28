Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26747C433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 28 Dec 2021 02:22:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232342AbhL1CWY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 27 Dec 2021 21:22:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230372AbhL1CWY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 27 Dec 2021 21:22:24 -0500
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C015C06173E
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Dec 2021 18:22:24 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id w19-20020a056830061300b0058f1dd48932so22102493oti.11
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Dec 2021 18:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ryrfOj2a5ZGjBJFYyO/1SzBTanYs5m1Q4SjMqm4AYcs=;
        b=Bxoi3m4NWnM3RD/NfQi7xtuw9sGv4UpIpRy3Yz+eVkNaMGsLM05JC/wSl08Hy6c0Ze
         wOJD6Aojyh7G0l80K9XaPICJGHd+Vvlw2V0T4UPnHXSdlZ641IgVW2WuPgisiloP+ntn
         L19ti8I5IoZxL14UAL96oAIqFluuGQMinmhAM70ChQEn2xCnTrsjcedMKz4ckZ06zzJR
         vmYoWxbys9GJV/gAPex2FCau5DrkBoIvJdstZSQdYVbiZj0LcJuNZoOWbYmTqyrLlQ3+
         EIOTBQgQqDDAMsDz8mijwaYcJ0nltwSb1Y5eWhJApUo0+WL8Uf36Q/wOUk0AjhoZoDTx
         vEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=ryrfOj2a5ZGjBJFYyO/1SzBTanYs5m1Q4SjMqm4AYcs=;
        b=XDvSz3RhkBebNDxEzxkbM28etgr+ME0OZy73vubCeje5y7OhPRliV/IZfzcCGJ+rHg
         wXzNSQiGmm3/gOikeRrDixnoGCPaAp+ySNpUnBSiO0BzwnE9h49iLtGEZ5QxLVvsSr7S
         f80zgISFaHPE1rHXp8X7WGG/KnsYrTy+93RjQzYl1X6sYfmltxCz3degfTX3OGTf7fHr
         dV39Wd79KmH6vZ7utoJarXiSX3ViQQz2B2gIK8X0VF15Bq3pugTELrqx2CszqntdWZIg
         0hbvTyMKIZONMD/0g8J4bJGoGESbAqIIO28avEZZ93t0bIKYEYVqxFA3vEemZ3kRJ0+2
         Y1Zg==
X-Gm-Message-State: AOAM533HlID3FdazzhzgID+BA+zz71xSSFhfzAxqAsp4QUYKcqdayrA/
        c9lf0vCiswpNoHo15EHQZ/+wpPSBNUM=
X-Google-Smtp-Source: ABdhPJxAo2uE004/OeUAcn2oR6rZ4GUlsPytiz0stil1+FAm3ZGGJjsJAkxMBwAZxw5IEZl+8+wshg==
X-Received: by 2002:a9d:5a12:: with SMTP id v18mr13963569oth.265.1640658143496;
        Mon, 27 Dec 2021 18:22:23 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d3sm3378782oiw.52.2021.12.27.18.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 18:22:23 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 27 Dec 2021 18:22:21 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Aleksandr Mezin <mezin.alexander@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v2] hwmon: (nzxt-smart2) Fix "unused function" warning
Message-ID: <20211228022221.GA737761@roeck-us.net>
References: <20211228014813.832491-1-mezin.alexander@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211228014813.832491-1-mezin.alexander@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Dec 28, 2021 at 07:48:13AM +0600, Aleksandr Mezin wrote:
> Fix warning when building with CONFIG_PM=n (and CONFIG_WERROR=y):
> 
> drivers/hwmon/nzxt-smart2.c:707:12: error: ‘nzxt_smart2_hid_reset_resume’
> defined but not used [-Werror=unused-function]
>   707 | static int nzxt_smart2_hid_reset_resume(struct hid_device *hdev)
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Aleksandr Mezin <mezin.alexander@gmail.com>

Applied.

Thanks,
Guenter

> ---
> v2: __maybe_unused instead of #ifdef
> 
>  drivers/hwmon/nzxt-smart2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/nzxt-smart2.c b/drivers/hwmon/nzxt-smart2.c
> index 534d39b8908e..6e67da766969 100644
> --- a/drivers/hwmon/nzxt-smart2.c
> +++ b/drivers/hwmon/nzxt-smart2.c
> @@ -704,7 +704,7 @@ static int nzxt_smart2_hid_raw_event(struct hid_device *hdev,
>  	return 0;
>  }
>  
> -static int nzxt_smart2_hid_reset_resume(struct hid_device *hdev)
> +static int __maybe_unused nzxt_smart2_hid_reset_resume(struct hid_device *hdev)
>  {
>  	struct drvdata *drvdata = hid_get_drvdata(hdev);
>  
