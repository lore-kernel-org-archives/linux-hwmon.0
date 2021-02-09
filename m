Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 813E8C433DB
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Feb 2021 18:35:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 32AFC64E7A
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Feb 2021 18:35:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233267AbhBISbv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 9 Feb 2021 13:31:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233394AbhBISYl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Feb 2021 13:24:41 -0500
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44EB8C06121E;
        Tue,  9 Feb 2021 10:12:51 -0800 (PST)
Received: by mail-oo1-xc31.google.com with SMTP id f26so2153624oog.5;
        Tue, 09 Feb 2021 10:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ydnLhMUOy38N7cnKj1FBGcvXXLfiBwmt+d1PHwycJa0=;
        b=r38hYVB8VEfafmQckbv261fCe2Z4EvdZOuuvKx8S8LkTUzqdgxaZUBvASWpN2KP5/I
         8V2pGCKk/qndeJFrxjp46QnpEY3JmvfOQ5SMEu5kH3JtY5H8m1CpJxMnEuW1AC+0+YEh
         jHggcY3xXPYBhSct1/0BIseKDafizqVH46FT8bou/rfoart2lSPfrIRC/0OjhUwOa5hv
         u/kTVYWwvTdsgJpEDfe17Sd2sPtRGd1iDsVKb6gXNSr/nRojnuVRjlLBB3RB1SETmkbF
         tt6tMO0DAb85upyxQPJrZ5aSjdFKQNp6RVoHfbNl6wwyc2jF/cibwab2YduYOQJS3B32
         nypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=ydnLhMUOy38N7cnKj1FBGcvXXLfiBwmt+d1PHwycJa0=;
        b=Ieog12ng5HN607SCvPx+yeRZz+akjZ+9VtS4DxQi+87YIEvk1vKsnafa5LqZFodkaH
         x+1ymEE5wmSb5j1HeKnlLaU0d+NK3NLLATinOtH/4SKsqQDGLw6K+1vrqhxn6ncAUC8s
         7E5WmuGu1GppT6d9XYmIBaFc5PnwikdfHmwlndAUIdVPdcsDnSzImwKL+3oebsqQhPlz
         rdMn+3uxFWW7NA68pnqUdVMTx2mgm6nT8SMdeuS5yE9EAHiKvP5dbRTiBKKjmTQw2H9T
         JrbYVnq8/vvuncoboP0leDX7O87O2X845V1979lynPbWmyGJkCgIaSIMZ8RluDnzBwG/
         tO6A==
X-Gm-Message-State: AOAM531EhyDLwF8tHlkFNy4Rxg75p8ERI1y1XYdJlLOrp+g/1K7589Mx
        +0Cac+FYF8lczD0PQKfiHNp1po0mHE8=
X-Google-Smtp-Source: ABdhPJzHmoc32wiL9dNBrSi4oZa1qD/staF2dIvIaSz9A3qXCn02JVt8zjmQg6ZQsY9dPg64+p0zvQ==
X-Received: by 2002:a4a:88c9:: with SMTP id q9mr16891447ooh.26.1612894370751;
        Tue, 09 Feb 2021 10:12:50 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b25sm1487364otf.16.2021.02.09.10.12.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Feb 2021 10:12:50 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 9 Feb 2021 10:12:49 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Eddie James <eajames@linux.ibm.com>
Cc:     linux-hwmon@vger.kernel.org, linux-fsi@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, jk@ozlabs.org, joel@jms.id.au,
        alistair@popple.id.au, jdelvare@suse.com
Subject: Re: [PATCH 3/4] hwmon: (occ) Start sequence number at one
Message-ID: <20210209181249.GE142661@roeck-us.net>
References: <20210209171235.20624-1-eajames@linux.ibm.com>
 <20210209171235.20624-4-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210209171235.20624-4-eajames@linux.ibm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Feb 09, 2021 at 11:12:34AM -0600, Eddie James wrote:
> Initialize the sequence number at one, rather than zero, in order
> to prevent false matches with the zero-initialized OCC SRAM
> buffer before the OCC is fully initialized.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

For now I'll assume that the series has to be submitted together,
and that this won't happen through the hwmon branch.

Guenter

> ---
>  drivers/hwmon/occ/common.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
> index 7a5e539b567b..ee0c5d12dfdf 100644
> --- a/drivers/hwmon/occ/common.c
> +++ b/drivers/hwmon/occ/common.c
> @@ -1150,6 +1150,8 @@ int occ_setup(struct occ *occ, const char *name)
>  {
>  	int rc;
>  
> +	/* start with 1 to avoid false match with zero-initialized SRAM buffer */
> +	occ->seq_no = 1;
>  	mutex_init(&occ->lock);
>  	occ->groups[0] = &occ->group;
>  
> -- 
> 2.27.0
> 
