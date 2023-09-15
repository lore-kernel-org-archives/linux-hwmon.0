Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC109EE021D
	for <linux-hwmon@archiver.kernel.org>; Fri, 15 Sep 2023 05:24:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbjIOFY5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 15 Sep 2023 01:24:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbjIOFYz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 15 Sep 2023 01:24:55 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87E3B2700
        for <linux-hwmon@vger.kernel.org>; Thu, 14 Sep 2023 22:24:50 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-68a3ced3ec6so1589674b3a.1
        for <linux-hwmon@vger.kernel.org>; Thu, 14 Sep 2023 22:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694755490; x=1695360290; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x0qVdiNnNK1x44nux0ZGC5YO/63axRdKDDjAcPyMmoU=;
        b=eq3Fj1bPTp4EN47AXXmrfGqA4A24a9bNZDEaVXXpLiFSlMwiXk8sqa9Y3mBuu59PHi
         NE9JPzBlHX+yOkYJnLWcOIS84j9R+3F95bwyTZm6iV+/iLQM1mBzu8DMp2w0emeGnVaH
         l4BM+HY9mEGK18mozAYogUo57aISMLYo84sAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694755490; x=1695360290;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x0qVdiNnNK1x44nux0ZGC5YO/63axRdKDDjAcPyMmoU=;
        b=DTCdnWRvrk8J9kqHpxulPJIzhmhc0MQpeT7qcfusSpCL0A68dq5K69mkjSiHUuVEvz
         XwDmUxZn5OnulvMy2T8SXdQqCxQ68rVxJFhhr3W6EMZaj7eX8v0MOCh2NXYl+s4Yzdoj
         zhv5gqF4Zfkd//cRPhp61JVOGIjioFXIG95ZLywNX90v2rIlkb59ljtvBEA+szdF7swg
         dj5Cuivoqvprahxgj0GrtyIZBjmqGduwt+QTCMvR83D9rDWo+1cBdxiKf+UcX89cwPfY
         Nq+3lFr/WECniENQks+zSUfqQ0Bx/lFCeYr3ZAhaE4cfRbGQMIvHOmFw1HUSTn1iEue5
         YWRg==
X-Gm-Message-State: AOJu0YxluVGNDXfVmqVsRU0sQFm46mfr8fA+f/jlxS+e4JAL7NwBqkiv
        tgV8rgNvTXUzOsKEniCLwFolXg==
X-Google-Smtp-Source: AGHT+IFED1FDb4BajsYclNy37LUDYQbCJaFpMaXLXHfXnR4m0zHZlA65aGamnmGLaiEoj43nxFWQ+w==
X-Received: by 2002:a05:6a20:244e:b0:134:8d7f:f4d9 with SMTP id t14-20020a056a20244e00b001348d7ff4d9mr1002623pzc.52.1694755490009;
        Thu, 14 Sep 2023 22:24:50 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id d5-20020a170902c18500b001aadd0d7364sm2521635pld.83.2023.09.14.22.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 22:24:49 -0700 (PDT)
Date:   Thu, 14 Sep 2023 22:24:48 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Justin Stitt <justinstitt@google.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-hwmon@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] hwmon: (ibmpowernv) refactor deprecated strncpy
Message-ID: <202309142223.D16446A30D@keescook>
References: <20230914-strncpy-drivers-hwmon-ibmpowernv-c-v1-1-ba6b7f42c98c@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914-strncpy-drivers-hwmon-ibmpowernv-c-v1-1-ba6b7f42c98c@google.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Sep 14, 2023 at 11:21:06PM +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> We should prefer more robust and less ambiguous string interfaces.
> 
> A suitable replacement is `strscpy` [2] due to the fact that it
> guarantees NUL-termination on the destination buffer without
> unnecessarily NUL-padding since `buf` is already zero-initialized.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
>  drivers/hwmon/ibmpowernv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/ibmpowernv.c b/drivers/hwmon/ibmpowernv.c
> index 594254d6a72d..57d829dbcda6 100644
> --- a/drivers/hwmon/ibmpowernv.c
> +++ b/drivers/hwmon/ibmpowernv.c
> @@ -234,7 +234,7 @@ static int get_sensor_index_attr(const char *name, u32 *index, char *attr)
>  	if (copy_len >= sizeof(buf))
>  		return -EINVAL;
>  
> -	strncpy(buf, hash_pos + 1, copy_len);
> +	strscpy(buf, hash_pos + 1, copy_len);

This is another case of precise byte copying -- this just needs to be
memcpy. Otherwise this truncates the trailing character. Imagine a name
input of "fan#2-data". "buf" wants to get "2". copy_len is 1, and
strscpy would eat it. :)

-Kees

>  
>  	err = kstrtou32(buf, 10, index);
>  	if (err)
> 
> ---
> base-commit: 3669558bdf354cd352be955ef2764cde6a9bf5ec
> change-id: 20230914-strncpy-drivers-hwmon-ibmpowernv-c-80a03f16d93a
> 
> Best regards,
> --
> Justin Stitt <justinstitt@google.com>
> 

-- 
Kees Cook
