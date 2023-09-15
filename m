Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE8BEEB59A
	for <linux-hwmon@archiver.kernel.org>; Fri, 15 Sep 2023 06:39:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232335AbjIOGjT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 15 Sep 2023 02:39:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232336AbjIOGjS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 15 Sep 2023 02:39:18 -0400
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FBE42718
        for <linux-hwmon@vger.kernel.org>; Thu, 14 Sep 2023 23:39:09 -0700 (PDT)
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-573921661a6so995822eaf.1
        for <linux-hwmon@vger.kernel.org>; Thu, 14 Sep 2023 23:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694759948; x=1695364748; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y9krPXP60RvOc/Jly4MzMbTGFZqB63oEeqar0n+mZto=;
        b=QT/d3nz7Sh9jd+cGn9PMO+4DvHv00XPDk4LeIdzv10MGU4lMBGxTmvbTIvwsQCLHHW
         HP/YbcQKBNAW+HgGGd1ivovHUUzc5vhDRUZ4BwVZfEhthqQYThlze8O1vS4rPl7Lua95
         L59/KeLLLWsyWWu61tmxP5B8yVVGGoHG2dNTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694759948; x=1695364748;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9krPXP60RvOc/Jly4MzMbTGFZqB63oEeqar0n+mZto=;
        b=aLwZUmFs8j0op+RutQHOXMz39qVVhAhpXshapNH1Vel2He1Vh3WHKsb+QyxUW+c3X1
         Z4LG86dproA4d+uWZDDHYXpn16z74pLXwDzIU3eapsad52FVM7ynmdBvNeIjknu4VMZB
         A11puzTQfc+W42CB9tMwvh0zclHV41dMUdKRCg+EfHMBhOo3ZjKrApstu+CBA4RGT+4Z
         OsOQEpOw+imIZcQde4kk2As1rIi8ZKNmUAgaFhC9/CtFbeoSu8ERRhoz6Fw8CbQAZXWy
         t1NEAGLeQgUyTlRYalYB+sfwg2FiEWWgAqBp7yRzZEkHd7C4T4SLPXVzbG8D/9o4Ep/5
         It/Q==
X-Gm-Message-State: AOJu0YyhkYMJzfX5/kv+zO8QwXdHfBY6INiRF2TRReZzoAZJ9JZhVRnJ
        EIJN5DdNv1yQwc+Z1crGE9rEXA==
X-Google-Smtp-Source: AGHT+IFDmhw7ZRBNGNOL6ig8k8GdAMIkgXC0ino4cM4yA0zOj4mNkUi7jC3Ss/34A3XxvP1tmTpnBg==
X-Received: by 2002:a05:6870:64a2:b0:1d6:3f77:c214 with SMTP id cz34-20020a05687064a200b001d63f77c214mr725392oab.55.1694759948598;
        Thu, 14 Sep 2023 23:39:08 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id n19-20020a637213000000b0056c52d25771sm2114306pgc.69.2023.09.14.23.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 23:39:07 -0700 (PDT)
Date:   Thu, 14 Sep 2023 23:39:07 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Justin Stitt <justinstitt@google.com>,
        Jean Delvare <jdelvare@suse.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-hwmon@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] hwmon: (ibmpowernv) refactor deprecated strncpy
Message-ID: <202309142334.0F81E0EA2D@keescook>
References: <20230914-strncpy-drivers-hwmon-ibmpowernv-c-v1-1-ba6b7f42c98c@google.com>
 <202309142223.D16446A30D@keescook>
 <4b490305-0ab7-403f-7bec-a08fb8f20b56@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b490305-0ab7-403f-7bec-a08fb8f20b56@roeck-us.net>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Sep 14, 2023 at 10:40:37PM -0700, Guenter Roeck wrote:
> It is really sad that the submitters of such "cleanup" patches can't be bothered
> to check what they are doing. They can't even be bothered to write a coccinelle
> script that would avoid pitfalls like this one, and they expect others to do their
> homework for them.

Well I'm not sure that's entirely fair to Justin's efforts (I know he's
been studying these changes and everyone makes mistakes), but that's why
I'm helping review his findings -- some code behaviors are more obvious
than others. :)

-- 
Kees Cook
