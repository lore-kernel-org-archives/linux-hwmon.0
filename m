Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD738EE021D
	for <linux-hwmon@archiver.kernel.org>; Fri, 15 Sep 2023 05:18:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232113AbjIOFSU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 15 Sep 2023 01:18:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232111AbjIOFST (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 15 Sep 2023 01:18:19 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF4E92D47
        for <linux-hwmon@vger.kernel.org>; Thu, 14 Sep 2023 22:18:06 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-68fbbb953cfso1473858b3a.2
        for <linux-hwmon@vger.kernel.org>; Thu, 14 Sep 2023 22:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694755086; x=1695359886; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z4avXvzursC+45bqw32CiKah19BSXYGGSK9tL8yLNEc=;
        b=PwaqgrlsEMxq+k/+X5gjVldHqbDjToMtesJUqILPx/co+97vthVRTL+dqjs45tcBI/
         QzhmJMTr7CJTxQ8SPODAc0YyIFr5eaNS9cw9bwyeRLBsFK6xvMHBVF+1LEz9evzqybzK
         TNcNQGEpYFF5DMNAwXj1skrn7rDfSvHxYMQtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694755086; x=1695359886;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4avXvzursC+45bqw32CiKah19BSXYGGSK9tL8yLNEc=;
        b=bEXsq8ypSxK6Abw4pIaJdGKSApWwlSBy9uKbxugAAD96dbSE/H1OgM0SCBNouLgE+O
         CCERWrh7hX8YMfWEu+aQ0Zm6cm+VcHI8wshTFuSGOCzIly9Puo7X22R5lIrDYequEQNX
         KpC+y8gTYG1MhA6aS5sYyUOjR7QOdA9wI+p9uAZ8ooCYCxbMplifQXlHJ3tfqJKr65io
         iJDfjdUYCDCPGcywA8XJQTvBnshXSUCJWWedTcp2TQY7PSc1K3TuEu+OjNKfspLJWyjF
         qsSvxQdLDTlDH44CylkOM6pDwP8nHYIZYRfcfn9xiiA+kPuF4JbTB6D3FJJvrZQu1SHN
         WcaA==
X-Gm-Message-State: AOJu0YydhQ9DaYyVJyB/6CGwYwnQ1JOnS9rQurHbi5gvYBlvlb4jEPn0
        cNr0HOYC58/u+NHfY5BvftKKUnjJP8MqOys3VNg=
X-Google-Smtp-Source: AGHT+IHq5WZANeEmrea53fQ6D2rWl8TUw4jDTvHg9q/A6e+oGx/sMo0ZRXEBUETgmxze8sZ4MHulnQ==
X-Received: by 2002:a05:6a21:4849:b0:14c:ca56:69f7 with SMTP id au9-20020a056a21484900b0014cca5669f7mr797797pzc.28.1694755086219;
        Thu, 14 Sep 2023 22:18:06 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id x53-20020a056a000bf500b0069029a2206bsm2147947pfu.47.2023.09.14.22.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 22:18:05 -0700 (PDT)
Date:   Thu, 14 Sep 2023 22:18:05 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Justin Stitt <justinstitt@google.com>
Cc:     Ed Brindley <kernel@maidavale.org>,
        Denis Pauk <pauk.denis@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH] hwmon: (asus_wmi_sensors) refactor deprecated strncpy
Message-ID: <202309142217.52EEAEA1@keescook>
References: <20230914-strncpy-drivers-hwmon-asus_wmi_sensors-c-v1-1-e1703cf91693@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914-strncpy-drivers-hwmon-asus_wmi_sensors-c-v1-1-e1703cf91693@google.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Sep 14, 2023 at 11:10:34PM +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> We should prefer more robust and less ambiguous string interfaces.
> 
> A suitable replacement is `strscpy` [2] due to the fact that it
> guarantees NUL-termination on the destination buffer without
> unnecessarily NUL-padding. If, for any reason, NUL-padding is needed
> let's opt for `strscpy_pad`.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>

A classic replacement. :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
