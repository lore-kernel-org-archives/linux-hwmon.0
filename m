Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D4D4C433E0
	for <linux-hwmon@archiver.kernel.org>; Tue, 30 Mar 2021 17:53:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 200576187E
	for <linux-hwmon@archiver.kernel.org>; Tue, 30 Mar 2021 17:53:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232292AbhC3RxO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 30 Mar 2021 13:53:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231579AbhC3RxK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 30 Mar 2021 13:53:10 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ABBDC061762
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Mar 2021 10:53:08 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id c4so16725140qkg.3
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Mar 2021 10:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=protocubo.io; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YjgPknUpx6ijub4GHdEiRvZSDU1FqZwlL7wT3fyQ/R4=;
        b=AFRnX/BToqNeJ7jBkT+A78U2/chMo1d1iQamFxcc5m+JIO9wEEJNcUr3IeT/jIo3dh
         PjZcZjwHTexZQVpdF3aR7BXE1dL4zjhH0LHrRoDx+F843c5Tk3Qq4V7Mt/qeS3ZcyKla
         nKRu+TIXlRqQBCuIknbRXQbSkWy7xoS2hdY9zIHnakVwRqecXILONz/kmXDtIBOvbI63
         VvKOs4cC80QdzFQVvWbq0AK3uXlcHe1CLObQfzhzmZTfXHExj+6SpQg8Ph5Kcz77N3ql
         kvH/Xw6viGxZkYoTvz08zyQAmKrjU4yiQjKa+Qd60aJtVBKKyFTklk77sOn9sOsuNm7m
         ESvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YjgPknUpx6ijub4GHdEiRvZSDU1FqZwlL7wT3fyQ/R4=;
        b=C9Z+HiQEsYenvy4AdDdvY8J59oz64WnToC3jo4UGN6Afjrq8lwPv306qCb1otRHai9
         Ego5bvk1LV2yqWat8IWlZ12mxjYhqdydlDcWDxo18X8OkVnJ/MTGZXv9TKYuhLqwAth/
         aaulv50NNm5OKk0Aqj9vm4wNI9o+k5VWbwa699LhtryUeuMKX3BKD2G/ph/iNbBRDXK7
         xKji+ZHxmhQBYlijv17+VJQPZ4nWRnbOaGRmBgrGSnNq0waZrTS4minNJFa6dIkAJjC5
         VVQdMm/iPCt2AosUbkzJ2DFXcdIONh+DI+W2f5T4WVXSrDXg6F98hxvuz4NO30gtMm3D
         myOA==
X-Gm-Message-State: AOAM533ZpbU9MHyRGp7trBFfs9yQDvAb+0mCrCsBLaaJn62k+Gssk9wf
        NITxFKCgqn2FrxgsmrRL3aybZQ==
X-Google-Smtp-Source: ABdhPJzj3VquU21kzlmzd09Nbi6WRrQGCC5XiCzMB4og3ZZWjonIg6M2my7/64gwKI6mWne6x11QHQ==
X-Received: by 2002:a37:a8d3:: with SMTP id r202mr32849486qke.383.1617126787406;
        Tue, 30 Mar 2021 10:53:07 -0700 (PDT)
Received: from calvin.localdomain ([2804:14d:5c5a:802e:bdc9:ded9:cc08:a4e9])
        by smtp.gmail.com with ESMTPSA id d68sm16446012qkf.93.2021.03.30.10.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 10:53:06 -0700 (PDT)
Date:   Tue, 30 Mar 2021 14:53:02 -0300
From:   Jonas Malaco <jonas@protocubo.io>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (nzxt-kraken2) mark and order concurrent accesses
Message-ID: <20210330175302.ihsmijnidxjhmcqa@calvin.localdomain>
References: <20210329082211.86716-1-jonas@protocubo.io>
 <20210329215339.GH220164@roeck-us.net>
 <20210330002131.s2qz3dr6bwr6jz25@calvin.localdomain>
 <56ebbf0f-cdcb-d5af-e1ad-c7604597566e@roeck-us.net>
 <20210330031652.zhhxft4trli6zqtw@calvin.localdomain>
 <37e5b3d3-8868-c70e-4c01-2d3d777df4de@roeck-us.net>
 <20210330062749.tcscp2kzxqugbtiv@calvin.localdomain>
 <38c76eb1-808a-1c9a-2494-208270a66e14@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <38c76eb1-808a-1c9a-2494-208270a66e14@roeck-us.net>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Mar 30, 2021 at 03:51:21AM -0700, Guenter Roeck wrote:
> [ ... ]
> 
> Then please explain why _this_ use of time_after() is wrong but all
> others in the kernel are not. Also, please note that we are not
> concerned with code generation by the compiler as long as the
> generated code is correct (and I don't see any indication that
> it isn't).

The accesses to priv->temp_input[], ->fan_input[] and ->updated (where
this relates to your question about time_after()) are not wrong, but
undefined.

But if we are not concerned with code that is currently generated
correctly, which indeed is the case in the five arch x compiler
combinations I tested, then there simply is no point to this patch.

Thanks for going through this with me,
Jonas

P.S. Admittedly from a sample way too small, but in the kernel
time_after(jiffies, x) calls do not generally appear to involve an
expression x with a data race.  And there are a few calls where
READ_ONCE() is indeed used in x.
