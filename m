Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF68BE74902
	for <linux-hwmon@archiver.kernel.org>; Mon,  2 Oct 2023 17:39:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbjJBRjw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 2 Oct 2023 13:39:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238249AbjJBRjw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 2 Oct 2023 13:39:52 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B972294
        for <linux-hwmon@vger.kernel.org>; Mon,  2 Oct 2023 10:39:47 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-69101d33315so15650b3a.3
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Oct 2023 10:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696268387; x=1696873187; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TpVKVfOllcQbS/ZFFzm5rvtMjeszAGVS8sUGlEYlZ2I=;
        b=jJGgYRZMWi7/h+uboTMzxc2yPPkE10cMGTYVEXhsFt2bC1/qav9/U/CeayDNt866bJ
         7wxKkpEModSLt2jVVYbuP5HLYH5itIzjpPcY2/CELldUwMheB66irN3MoodZS14uGciM
         1La40tt6mBl/BuoiFFqXPUllNVzhGdoWjwc0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696268387; x=1696873187;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TpVKVfOllcQbS/ZFFzm5rvtMjeszAGVS8sUGlEYlZ2I=;
        b=Huf0aIHaval2/97ZweKknehD8+Hvf9jdOvVx+ojay5Atz49QQ7WR9UraH2w5brV/5I
         POur2ejMk18UGuPvvb+oLOay8UbtzuNzUp4+6AqgaiqYwcCyJisF67B3YjZfUqpTBmte
         KYe+stNvV56bONhTY+M6OuBgnnWDt3VmepooqU6ddlDFM4OcbMDjWkHGgiCorhscIs7u
         hz/rF9iWwksQNCz4eruQobSQQqCPciDm8ZKaev39TaKbx2cllfsxZRdQqCbNs4N3uqcG
         CT8qsPLugVa4XbSQHpb9kekdxqohqPflsECxXwLhv2h1S4M5wZOvTkBXoX653zD6llJx
         tS+Q==
X-Gm-Message-State: AOJu0Yz+0jL/nwAaR3aavHZT4h6gdccUmQ4FLIKvEM5Cco0wWfq9HLrf
        oYHv/BsK+OmC4Dl4/YccuBOB3Q==
X-Google-Smtp-Source: AGHT+IFPixOT7PLEvjE3i0KA0O/A27DOjo/GqhKHxqOgkmL+NKkqUCM4OONVLUct28kbISv0eENneQ==
X-Received: by 2002:a05:6a20:948c:b0:157:7568:6796 with SMTP id hs12-20020a056a20948c00b0015775686796mr9204380pzb.60.1696268386709;
        Mon, 02 Oct 2023 10:39:46 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id a6-20020a170902ee8600b001c55db80b14sm6404674pld.221.2023.10.02.10.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 10:39:46 -0700 (PDT)
Date:   Mon, 2 Oct 2023 10:39:39 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Justin Stitt <justinstitt@google.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH v5] hwmon: (acpi_power_meter) replace open-coded
 kmemdup_nul
Message-ID: <202310021039.C13E217@keescook>
References: <20230926-strncpy-drivers-hwmon-acpi_power_meter-c-v5-1-3fc31a9daf99@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230926-strncpy-drivers-hwmon-acpi_power_meter-c-v5-1-3fc31a9daf99@google.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Sep 26, 2023 at 06:59:15AM +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> Let's refactor this kcalloc() + strncpy() into a kmemdup_nul() which has
> more obvious behavior and is less error prone.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Thanks for continue to rev this change. This looks much nicer, is more
readable, etc. :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
