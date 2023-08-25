Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A09B2C3DA66
	for <linux-hwmon@archiver.kernel.org>; Fri, 25 Aug 2023 13:23:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244065AbjHYNWm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 25 Aug 2023 09:22:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245106AbjHYNWX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 25 Aug 2023 09:22:23 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F05FE198A
        for <linux-hwmon@vger.kernel.org>; Fri, 25 Aug 2023 06:22:21 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-68a3f1d8be2so772772b3a.3
        for <linux-hwmon@vger.kernel.org>; Fri, 25 Aug 2023 06:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692969741; x=1693574541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7E6lxW56tjIH/hIJslkrTuhwu7IiD4VL1t0sFL6KruI=;
        b=Wdvxzf/h4MbhmA09wLtXWlzREZZY8EoDiescI5g+wwYcQpL7/dGrlRUjGGt83/5PDh
         6J2mmbDZ3PJQakOXGXjm9gAr9euXMiL7Ie9o6n/gACtoMP1b3yWuBHPqX8MjLZzWGEMx
         /URYwLkBC5MDa4DsmyBqFIWHkZTFyjTupxVgZflfX5v3K5G16uhCaLsbILzgci5DqhJh
         M9eTf8tG86kSmShtfHSv5tf08v8NQzVJrxhOQ8oVKJDhA4UC2dtCsTBNsMqnUWilBcsX
         +cshAdc86yItHjsUxFnKIcxcHWjfeWr6Pba/pBxOka+mLchQ8OC2GLAwYAeXZaxO0lM6
         zyqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692969741; x=1693574541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7E6lxW56tjIH/hIJslkrTuhwu7IiD4VL1t0sFL6KruI=;
        b=TQLsauJi3UprZ+iZeShZeUMPmfqpYX1mcU3H5zx0s5z5BxDqA/ge8TPSX8T3tTVB3K
         phfOQUDuRez3PhWpcO9GcKj3FMWH29TGIKlzI9wa3e26XkhD94sAaJizl5prkteDdzE7
         VbbbXcRLoXz0Q1jvbqHHa2CnMjnO8gZYU0hXvg5lb8qwqVWEl/QAvSjLqibSvzYY9IEt
         ByKDdTPpgfhuzn5C4TIiyG5SvUvNZAJBZXriquw6vEzrkwhMByBvvb/29IYVt+gtwgli
         Sme8HSYLfhPlnlzXq245qNuU9styUA/b0euzsWkFDAUO+diiDhR70EwKpngfqEwbCfm6
         9Rmw==
X-Gm-Message-State: AOJu0YyLshVD7qmfryCpkg2rmpROJMa8HzBeuFQZPX6Y/ROVMAG7Ctxn
        b7V7wwUN7YcFspU/TL86eas=
X-Google-Smtp-Source: AGHT+IGmSgrs0cBqmBy+uR0d9YlEoqFKegoj9U95zx2ArbLIrJ/MlcExzU8wzX7lE2RLTCTMy0Y0Mw==
X-Received: by 2002:a05:6a00:21cc:b0:68a:5449:7436 with SMTP id t12-20020a056a0021cc00b0068a54497436mr17240103pfj.32.1692969741196;
        Fri, 25 Aug 2023 06:22:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s9-20020aa78d49000000b0067f2f7eccdcsm1505690pfe.193.2023.08.25.06.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 06:22:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 25 Aug 2023 06:22:19 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH hwmon-next 1/1] hwmon: (mlxreg-fan) Extend number of
 supporetd fans
Message-ID: <3a205000-8c0d-4a99-b84c-152e61e8f6da@roeck-us.net>
References: <20230824164006.26868-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824164006.26868-1-vadimp@nvidia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Aug 24, 2023 at 04:40:06PM +0000, Vadim Pasternak wrote:
> Some new big modular systems can be equipped with up to 24 fans.
> Extend maximum number of fans accordingly.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> ---

Applied.

Thanks,
Guenter
