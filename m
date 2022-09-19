Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CAE2C54EE9
	for <linux-hwmon@archiver.kernel.org>; Mon, 19 Sep 2022 12:56:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbiISM4y (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 19 Sep 2022 08:56:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229975AbiISM4x (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 19 Sep 2022 08:56:53 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A84EA44F
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Sep 2022 05:56:51 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id fs14so27738319pjb.5
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Sep 2022 05:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date;
        bh=LhJBAn139IJJNh4xGwOrhfs8O+s0trDrnQCrmIjY4oA=;
        b=CS/l/RnWY5JPgG9hNnCHPsyztAD7B3zN1Our5MPYL5mEH0DyKnqIPQOBxEa4vq2SgL
         mg8pH7D5kJC8Q2t0QqLLaWZJP2y9P/1jzj0/lOIYIz7Ceutg0rPG7o/iGIQqE/toF/PV
         vof0bNi33MdpAE8CYzSIC1q6VfCeI9D7DU+jWYQDUhmnk/DyjLXk5ot8eNEDqDVYTAuP
         MapwXhXQQF28qY3keqbYxoeFJGrhfYvixbirbPhrj9cY0KrLrM/sg3DWZSbUBEKBvWyu
         km2Th6YTKPk7Kk7WLdUiqFFBIT3hGOrMm0mYOqPtN2+/Hx+Nmo4qNaMZQrnUY6VObc7B
         s3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date;
        bh=LhJBAn139IJJNh4xGwOrhfs8O+s0trDrnQCrmIjY4oA=;
        b=iK2PiEuDtc1MoFuR1HaMIt0OgnOWNKCmaPes21WLclae36NFLCBGziyGHEpRJzDmZc
         gyN1jTZfGyyBxoo/EHXq81Lc5ZBBNklQY0LscVtshCl25kZ8A1rtYjJYebaDZLKFiK8o
         bFdkn1CU4LLh1knIvckoFzSFo0HYM0FOQMSowQARfREl1ILL5rGnp+p8Is9par5JiU9H
         AgQ7Iw3njU6CTJhQ+gcrvaik9LBckuCHIvHU00y4xGQRtZaj5DAesWKKBlIPsW610dFn
         QXS6VW22BeGwAo3q+ED0zmtB96oHQhqPnJdrThbRGHpYKADK1oiWn757kg/buj6erCK1
         eMbg==
X-Gm-Message-State: ACrzQf2aNOKdEqzbQbbFgGKGp33U5ccLQUp4JmEo2NmEstF95wDoOJNt
        HIlgUmt10C6ozQvLA1J5WjINprB5+6JmYA==
X-Google-Smtp-Source: AMsMyM4DlIJXkfAq+vunqkNvNJAVy26X87HN7dmmxOo5Kjd/nfBrjTRp534BHfE37O2nhB7aRdqbfw==
X-Received: by 2002:a17:90a:be10:b0:202:cdf2:56a1 with SMTP id a16-20020a17090abe1000b00202cdf256a1mr30187621pjs.41.1663592210973;
        Mon, 19 Sep 2022 05:56:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c26-20020a631c5a000000b0042a713dd68csm18616458pgm.53.2022.09.19.05.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 05:56:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 19 Sep 2022 05:56:49 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Aleksandr Mezin <mezin.alexander@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH] hwmon: (nzxt-smart2) add another USB ID
Message-ID: <20220919125649.GA3544112@roeck-us.net>
References: <20220918115506.61870-1-mezin.alexander@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220918115506.61870-1-mezin.alexander@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Sep 18, 2022 at 05:55:06PM +0600, Aleksandr Mezin wrote:
> No known differences from already supported devices.
> 
> Signed-off-by: Aleksandr Mezin <mezin.alexander@gmail.com>

Applied.

Thanks,
Guenter
