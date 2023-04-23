Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F857C77B60
	for <linux-hwmon@archiver.kernel.org>; Sun, 23 Apr 2023 15:23:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbjDWPXB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 23 Apr 2023 11:23:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjDWPXA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 23 Apr 2023 11:23:00 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEEFC10D1;
        Sun, 23 Apr 2023 08:22:58 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-63b64a32fd2so5038567b3a.2;
        Sun, 23 Apr 2023 08:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682263378; x=1684855378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QoplVgvQ+18BLdc7apo2kZtdWD54kzFKWT/vYSrwZc8=;
        b=SouJjadKRSJ0iqzIv0YqrnKoQG8FpTMGyrpsJrd3je48ErjMhRx8LL2M7ojVxJK90q
         IY8qT2PYaN/jNMD7OaPbIjlib+tBiFkkUOMum2KqtXeZ2MWMy7KZVCBsKtdPoO0Sba/3
         D8azwW2OIDs4IBu+ULJD1mnHXecACcsChZozxTe97kIIKger2ScThUsevFpVMn7zU61L
         Fl2szDIFidrzWqEkDPc1HrRNtaaorHS6gplFqlv4yHx6KKJzVdHzLzKlxrhM0U31BbUU
         Q3MfXaB1XI4X9wDepU/3o0aelMJy4Qqh8bc8bCXumkpaybIhPZLQbBbkgZPU2jaW58pQ
         7wdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682263378; x=1684855378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QoplVgvQ+18BLdc7apo2kZtdWD54kzFKWT/vYSrwZc8=;
        b=CrC4e2NBj5AHyr/5YAheC1FZ4orEHyQgWT/QHbZ5NP7BU1CpJxqbsN4tuf1N9J7oMV
         QcE+6kC1OakfbSDNWSs7G4tMv2MAnC/sjtfNw5/S2/SZyRN4l4z46/+1pTnuAsXNynCq
         541I8vN2yJHQKB0pHocyqUaZNUMpR4Lku5tt6cGQ8oJMjNnFtAU0xECKLem31/PFfOAN
         VFSuKJEP+y9zi6q4rO8d9zCbAFo2U4W252B/d5tpZvii55Vbk8j/Kjm2OMWUoJBdk0q6
         lk46rw7uEp4Q9K9BwFk8mSMPk87S+cYFFslCL8fUgf/wv5pgRtUnsYp6I0d/S75+D/JS
         +TzQ==
X-Gm-Message-State: AAQBX9dVaCYhEDI7OlVNz202rt+zzM4Os0r3BcTfa3rhir6brTUbZi+I
        p4J6UoLGh7+z4yIQWCEvVyY=
X-Google-Smtp-Source: AKy350ZUL9MAuvG5a4GrxIi3M//et74tqKTI3UnqKvMs5o/UK64eXglOfd1qagW5oC0DZpE+tHeOrw==
X-Received: by 2002:a05:6a20:4323:b0:f2:895c:ccc9 with SMTP id h35-20020a056a20432300b000f2895cccc9mr10278006pzk.45.1682263378039;
        Sun, 23 Apr 2023 08:22:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k16-20020aa788d0000000b00625616f59a1sm5434325pff.73.2023.04.23.08.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Apr 2023 08:22:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 23 Apr 2023 08:22:55 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Charles Keepax <ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, patches@opensource.cirrus.com,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: lochnagar: Remove the unneeded include
 <linux/i2c.h>
Message-ID: <ab8a280a-7295-4cc5-b0e6-7e19e3f96864@roeck-us.net>
References: <df555e724d1b52bd9958c0bd729a774dfe0cf150.1682237387.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df555e724d1b52bd9958c0bd729a774dfe0cf150.1682237387.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Apr 23, 2023 at 10:10:07AM +0200, Christophe JAILLET wrote:
> This driver does not use i2c, so there is no point in including
> <linux/i2c.h>
> 
> Remove it.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.

Thanks,
Guenter
