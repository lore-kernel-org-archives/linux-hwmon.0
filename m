Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 530A1EE49B3
	for <linux-hwmon@archiver.kernel.org>; Fri, 25 Aug 2023 22:14:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbjHYWOE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 25 Aug 2023 18:14:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230222AbjHYWNk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 25 Aug 2023 18:13:40 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDE622704
        for <linux-hwmon@vger.kernel.org>; Fri, 25 Aug 2023 15:13:36 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1bf7423ef3eso10498665ad.3
        for <linux-hwmon@vger.kernel.org>; Fri, 25 Aug 2023 15:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693001616; x=1693606416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0BjJU4w8nwIph8eNiwGoKfedSYPjcFpwJfo8NljTIRk=;
        b=UzpkgeTaNjwZqWYnvXJmrH8H4MUBGOgP+qcXrveK7VV6mTIdR8ZfSUrAHzEPSuyfuX
         o9BsMJ3X0CdwVZ4rkN2AHMiMAaSi3CXp1kpBkuRzhJgyWiEhy4DWSzan1srRbI+Myo2u
         uBa1JWaJlqpuwQtD6KqyrTfE00cTSwFSnQeOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693001616; x=1693606416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0BjJU4w8nwIph8eNiwGoKfedSYPjcFpwJfo8NljTIRk=;
        b=UoPYhTLTEqx111Rc1LqdeFtuMHY67abV3D35aOdPwS6IieV8b5qvp/WnMYlJU8VJqb
         /QbwNbhxVNrMTqb0XrsV8EQWCmMBRKhydP1NKxMq78fpYZsrw34rZKzJyvsdk/s5z6R7
         /X3r5Mqbti1V3AYLDp+p6jZjJVo7VsbNOWNXkxolam5S2e4VVhukMQkrliciz0JIkSz7
         7+k67jSJTFYuhxE2F+wt3SUyJrEU8xgyg+NjOeLUyIjRQX6x9PNKG4lI6HMKIq7WsOfB
         9SpzjnVn4HkfRDtOhjTDGuiGfto0S6tTspzvSdPX6y55W4P7fmLo553mFB0FcbwArn0i
         jvZA==
X-Gm-Message-State: AOJu0YyD6/HyAxWKZ2LqjIEFUbs+pZKsQs/A4MLwIX6GIdpalAgA6Q89
        zgpbCDRBbM1qt3DZx6se4JlztcdoBDMpanetPNI=
X-Google-Smtp-Source: AGHT+IHmApoYxQ/QPGNvuqZJJuCLA/kYG9vprDv9WbQh/uIwdR0ryLsfErzUUgIKN0tApgQ21jWq/Q==
X-Received: by 2002:a17:903:1109:b0:1bb:3a7:6af7 with SMTP id n9-20020a170903110900b001bb03a76af7mr22568511plh.23.1693001616232;
        Fri, 25 Aug 2023 15:13:36 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id o15-20020a170902d4cf00b001b9e86e05b7sm2261569plg.0.2023.08.25.15.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 15:13:35 -0700 (PDT)
Date:   Fri, 25 Aug 2023 15:13:35 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Justin Stitt <justinstitt@google.com>
Cc:     Oded Gabbay <ogabbay@kernel.org>, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] accel/habanalabs: refactor deprecated strncpy to
 strscpy_pad
Message-ID: <202308251513.0F6BF9FEE6@keescook>
References: <20230825-strncpy-habanalabs-combined-v1-1-daa05a89b7e3@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825-strncpy-habanalabs-combined-v1-1-daa05a89b7e3@google.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Aug 25, 2023 at 10:09:51PM +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> We see that `prop->cpucp_info.card_name` is supposed to be
> NUL-terminated based on its usage within `__hwmon_device_register()`
> (wherein it's called "name"):
> |	if (name && (!strlen(name) || strpbrk(name, "-* \t\n")))
> |		dev_warn(dev,
> |			 "hwmon: '%s' is not a valid name attribute, please fix\n",
> |			 name);
> 
> A suitable replacement is `strscpy_pad` [2] due to the fact that it
> guarantees both NUL-termination and NUL-padding on its destination
> buffer.
> 
> NUL-padding on `prop->cpucp_info.card_name` is not strictly necessary as
> `hdev->prop` is explicitly zero-initialized but should be used
> regardless as it gets copied out to userspace directly -- as per Kees' suggestion.
> 
> Link: www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings[1]
> Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Thanks for the consolidation and refresh. :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
