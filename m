Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99C92E728D6
	for <linux-hwmon@archiver.kernel.org>; Fri, 29 Sep 2023 18:56:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233828AbjI2S47 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 29 Sep 2023 14:56:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233793AbjI2S46 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 29 Sep 2023 14:56:58 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEA6319F
        for <linux-hwmon@vger.kernel.org>; Fri, 29 Sep 2023 11:56:55 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-692c02adeefso9185179b3a.3
        for <linux-hwmon@vger.kernel.org>; Fri, 29 Sep 2023 11:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696013815; x=1696618615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38pbwnD/6eDKhHLG19a5SyUZuoCH2GCeORBXHSAlt1U=;
        b=Isl9SkMcfMurRagz8HyCgmPmq2YMHkBwmZWNnPuaeYC8fZ6jr0J+DGH9kxIQaUZ+xH
         cDb/5rtLXHAQSXgRLNk7N9yi2pDK4W4WkLbRwx8HVjU32UbRZYUMsNDzeuuEqmnjTyTD
         t5C+bLjKn1/2UGoUyNCXP0507FgbgkBfdg310=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696013815; x=1696618615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=38pbwnD/6eDKhHLG19a5SyUZuoCH2GCeORBXHSAlt1U=;
        b=hXgWxeb2W88y3xnVBqjwkQA0DD7y82o0A3tGFB78OTWqGIsxCYK059f8KEphfuarrg
         RQWtTCM8o1AmC7xkslR6+Y02kItcLoZKWOK71fXlF5a6GYyHkfCtEystqoYFqTLSFpT3
         o/t66uf7oGmz++PCdTj7jQYP0KDRZotqhRIyExq/OSa+Hi8Y4edeNXB7HWUnW5fMpuYX
         z5ljRSBPEA6rQpcUgqMejJOvK2fgxb+d+/Qo3CrDqqA9cMZhGPcZiHfY1G5lHf2QvyzD
         fIFnRqO51jBz9SjyNp1m+ulCCPFByR0c5pOhnx/i66qaFNJtfES3O5/7GIaEeIIc8XIE
         DIww==
X-Gm-Message-State: AOJu0YzeYUwikbKzYuQD6L0gpm0wslzd80Pw/Xixt54q956Dv/VXugQ2
        YxjgvIYShAls/VLtFmxjbdnt7A==
X-Google-Smtp-Source: AGHT+IF5nt/LdTUwDsS/akLaNEuPbpl4qhURQmh05OKPQrNtEcQY/ppQfYdlDqxFeMC5y6YUPwJZjQ==
X-Received: by 2002:a05:6a21:32a3:b0:15e:10e:2cc3 with SMTP id yt35-20020a056a2132a300b0015e010e2cc3mr5542828pzb.60.1696013815496;
        Fri, 29 Sep 2023 11:56:55 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id z6-20020a170902ee0600b001c7283d3089sm5497300plb.273.2023.09.29.11.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 11:56:55 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Ed Brindley <kernel@maidavale.org>,
        Denis Pauk <pauk.denis@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Justin Stitt <justinstitt@google.com>
Cc:     Kees Cook <keescook@chromium.org>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] hwmon: (asus_wmi_sensors) refactor deprecated strncpy
Date:   Fri, 29 Sep 2023 11:56:46 -0700
Message-Id: <169601380449.3011049.1674985914851229968.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230914-strncpy-drivers-hwmon-asus_wmi_sensors-c-v1-1-e1703cf91693@google.com>
References: <20230914-strncpy-drivers-hwmon-asus_wmi_sensors-c-v1-1-e1703cf91693@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, 14 Sep 2023 23:10:34 +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> We should prefer more robust and less ambiguous string interfaces.
> 
> A suitable replacement is `strscpy` [2] due to the fact that it
> guarantees NUL-termination on the destination buffer without
> unnecessarily NUL-padding. If, for any reason, NUL-padding is needed
> let's opt for `strscpy_pad`.
> 
> [...]

Applied to for-next/hardening, thanks! (Subject updated...)

Take care,

-- 
Kees Cook

