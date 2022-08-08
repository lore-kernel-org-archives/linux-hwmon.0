Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B1FC00140
	for <linux-hwmon@archiver.kernel.org>; Mon,  8 Aug 2022 10:57:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241944AbiHHK5k (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 8 Aug 2022 06:57:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237179AbiHHK5k (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 8 Aug 2022 06:57:40 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED3B12675
        for <linux-hwmon@vger.kernel.org>; Mon,  8 Aug 2022 03:57:37 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id i14so15872969ejg.6
        for <linux-hwmon@vger.kernel.org>; Mon, 08 Aug 2022 03:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=By0NCMvGqGe44WabzwYtjJFldOAvIvsPsvPQbLvBDuw=;
        b=qMFNUDtoK290Og+eo6Hel5K4fZPqejMbl49JwpF/WQPncX3BLnANRVYllEjhuL9uN5
         3u3ZSiADpDGwQ9riw6rTgTL1gtE6FG3skhXSrA4m6WNqD4OOwrsMbDw2tUdIyDCuDxBm
         eT0639CoMel69UprQ0qGM+Y4kmQAekkLqidTT5V6JovbvvcIhRZRF/lQ2cMujwgMY+CB
         H8BuDIaOZzl7bU90Zu3mwLuvijqKvf3DD0L4IApR8hGKjHdBo7u+V+JvWIrMzifQQ+ix
         /BQBRvmhXIRAmBGxPAOLi4SVMeJChdPwUvNQpw4cEqx+irmg1bguO5qfFrHW3qxhjepP
         LWxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=By0NCMvGqGe44WabzwYtjJFldOAvIvsPsvPQbLvBDuw=;
        b=MHlIR8WKN2o1ZYEAW89jHCRqQVUa/2kAw/irAsU80LPI0PtuI90A5PF52vBI9o5SmU
         +2FvZzb3fvjAXl3oYHdzXRljkncdds41wbAl6xlFF2z38SBwWoFnLomKGWpp5vay7/fp
         jnuY4z+rnVVtfs7C+alxI05YXT0NKscJAaAI0QmXJwa3pqmZ/oP5okTtgnbJrfmNHoXf
         o5FOVoqA9eFkyiAdtODqvJZev7LgxpyGvpg08fJd8ZaxgVh/e/A4jdjcnMe8+5TLVSQH
         tojqLchQ2A4JTpnzKLNp0/rn8IlWt9CskgCKgclAURAXsBNBlbuqZ/6JQ7jwlluXwVKu
         1PvQ==
X-Gm-Message-State: ACgBeo0UN4N2lPxCabMrVTlQi6uKlTcK3Y/yI/jTRbZ1UxNPtbd41oqG
        IdqB+FeuMGGc08Pi6puGHbI=
X-Google-Smtp-Source: AA6agR6tMlAejeYH5YMZOuCx00VFKOFlPvDMARKWDIhY3t0HkBM93zVOHBu4H0yhwGbD3mx3nfWJoA==
X-Received: by 2002:a17:906:cc56:b0:730:a2f0:7466 with SMTP id mm22-20020a170906cc5600b00730a2f07466mr12822716ejb.211.1659956256499;
        Mon, 08 Aug 2022 03:57:36 -0700 (PDT)
Received: from gmail.com (195-38-112-141.pool.digikabel.hu. [195.38.112.141])
        by smtp.gmail.com with ESMTPSA id b19-20020aa7c913000000b004406f11ba7csm3584962edt.32.2022.08.08.03.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 03:57:36 -0700 (PDT)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date:   Mon, 8 Aug 2022 12:57:34 +0200
From:   Ingo Molnar <mingo@kernel.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] hwmon: (lm90) Fix error return value from detect function
Message-ID: <YvDsHnAGWNWdoyAC@gmail.com>
References: <20220808101504.1933123-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220808101504.1933123-1-linux@roeck-us.net>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


* Guenter Roeck <linux@roeck-us.net> wrote:

> lm90_detect_nuvoton() is supposed to return NULL if it can not detect
> a chip, or a pointer to the chip name if it does. Under some circumstances
> it returns an error pointer instead. Some versions of gcc interpret an
> ERR_PTR as region of size 0 and generate an error message.
> 
>   In function ‘__fortify_strlen’,
>       inlined from ‘strlcpy’ at ./include/linux/fortify-string.h:159:10,
>       inlined from ‘lm90_detect’ at drivers/hwmon/lm90.c:2550:2:
>   ./include/linux/fortify-string.h:50:33: error:
>       ‘__builtin_strlen’ reading 1 or more bytes from a region of size 0
>      50 | #define __underlying_strlen     __builtin_strlen
>         |                                 ^
>   ./include/linux/fortify-string.h:141:24: note:
>       in expansion of macro ‘__underlying_strlen’
>     141 |                 return __underlying_strlen(p);
>         |                        ^~~~~~~~~~~~~~~~~~~
> 
> Returning NULL instead of ERR_PTR() fixes the problem.
> 
> Fixes: c7cebce984a2 ("hwmon: (lm90) Rework detect function")
> Reported-by: Ingo Molnar <mingo@kernel.org>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Kees Cook <keescook@chromium.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Tested-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo
