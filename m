Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 374D5FA373D
	for <linux-hwmon@archiver.kernel.org>; Thu, 27 Oct 2022 06:39:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233923AbiJ0Gjk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 27 Oct 2022 02:39:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234067AbiJ0Gjj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 27 Oct 2022 02:39:39 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABBC2260E
        for <linux-hwmon@vger.kernel.org>; Wed, 26 Oct 2022 23:39:38 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id a5so1060647edb.11
        for <linux-hwmon@vger.kernel.org>; Wed, 26 Oct 2022 23:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GbHSooS4QhaEEND7QiOS4F8RUVOWaQu1gJuMKGWbWWw=;
        b=h4ebWPx6ctj8ot0OtMvkzliRm3mexKCqwpe+zL9LahvX0hbF/7nnYR30cZP4SybDJ5
         jkCHzmwD0SI0+xGPdZqV9csB62a27eoF2TXyVKkZ0KB8XwH6HBFxDsZDNLusByjZdYLH
         PGcbBjzBHBdl7On71Mc2gSxkgRXuJ+x8s1AlY96cGtmBE6uHBZTwm25H2vzJBKRGDEXI
         G2BBb8Mhs5wO80HvTQbKYz5wm6dLTLT3ND2qmZhKdpFfCQwQo2GheNu7P7oLZq1kynJT
         k9aWDO8eKuA4mQYwZ784zQGAQR6/TSIDFMJBWhKTO/CZRb0M3R1xkTGC7FNutuDSOJqP
         w5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GbHSooS4QhaEEND7QiOS4F8RUVOWaQu1gJuMKGWbWWw=;
        b=4UCy7dQyt2lHFx2aalGCzeLKVxdtD6eTA6pJ0eDGPvZycPmPoxNmc0sdKnyUzCevA8
         rv8uV/8xokei8XvkXCykfNlEwMJaNztKkBsnD/oZUz/idhzgSB+roaQP+jeDaiiacQXV
         Hs8vu7WYeCHk/FM26BdV1F0Kj8Vy8y8edHpjeDuz2OJ60jgDyNMYXRjR8ZUOJ3zAKLJS
         2wGa8RGLpeWRr68+e1+kkN6XsmIk2F+DT51lStqg7BhKBGLGlHFqrPBL0xjDl8bUT+ac
         7c29mz2asydb0KCo6ITe6kXmq90GKsFOtE3aY1oNAfLhRHH8vFhEythFbIFF9W5597tX
         oigA==
X-Gm-Message-State: ACrzQf3f92Xsz6UVmmWgtgUeGfDhkvDjv55HQyJhCMi6mOoOHUuRPNy/
        wf53Vt3uThJd9g3ETL/b2Nfpwo9SBJsh9ldNdfkGpn50hxc=
X-Google-Smtp-Source: AMsMyM52RXfpY7BFowt6obXRlF8bRHjv72QTwnp1bVBUXveWMwBBq2y2oZpTE/jyJrqU/j8ilJJZEHR3louOHW/QEBE=
X-Received: by 2002:a05:6402:35d6:b0:45d:a52f:2d30 with SMTP id
 z22-20020a05640235d600b0045da52f2d30mr43110175edc.4.1666852776751; Wed, 26
 Oct 2022 23:39:36 -0700 (PDT)
MIME-Version: 1.0
References: <20221027062931.598247-1-yangyingliang@huawei.com>
In-Reply-To: <20221027062931.598247-1-yangyingliang@huawei.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Thu, 27 Oct 2022 08:39:25 +0200
Message-ID: <CAFBinCDVU3YtFG1r1z9d2XODvNvzsaRMREbW4HxdkmZ45m3BUg@mail.gmail.com>
Subject: Re: [PATCH -next] hwmon: (jc42) Fix missing unlock on error in jc42_write()
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-hwmon@vger.kernel.org, linux@roeck-us.net, jdelvare@suse.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Oct 27, 2022 at 8:31 AM Yang Yingliang <yangyingliang@huawei.com> wrote:
>
> Add the missing unlock before return from function jc42_write()
> in the error handling case.
>
> Fixes: 37dedaee8bc6 ("hwmon: (jc42) Convert register access and caching to regmap/regcache")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Thanks for spotting and fixing this issue!
