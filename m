Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6378DC47091
	for <linux-hwmon@archiver.kernel.org>; Sun, 30 May 2021 13:14:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 388C16102A
	for <linux-hwmon@archiver.kernel.org>; Sun, 30 May 2021 13:14:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbhE3NP6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 30 May 2021 09:15:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbhE3NP6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 30 May 2021 09:15:58 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B6F0C061574
        for <linux-hwmon@vger.kernel.org>; Sun, 30 May 2021 06:14:19 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id i23-20020a9d68d70000b02902dc19ed4c15so8489536oto.0
        for <linux-hwmon@vger.kernel.org>; Sun, 30 May 2021 06:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=JGplJ9+fgFe4CSS6AxO+D1FH6A+L0snooci/4G7Usvg=;
        b=JODW6rCtZdyIOglu0HbiUHsUiJcYZlmNGRxCUyy5W10G+sOtllusFxiCfv+4lVrcyy
         4rNHTJuyfe8OBdIdnBPuu0AS/V0bxmpodby2YPVg+/yYKKIjWUJSKz/4g6InVVv0yF2I
         Lk5lH3ufWf5H7hCLhOOINoctstn9Q6aGrebIvT7O66BlTo4ptPK5RWt9upKpBFpTSMaK
         VTFNAZEs8Y3l/QnvuSb+yHbH3wrGafCrzIh7oFDE//rNGfjD6z5x2RrLlP2AI2jTLuZd
         7DrBzQLkI7aFR9T1SYsdjbjf75J0bffVVoYBvG4xT+aog2oT12My/8n3e9w6sMWeXlem
         AkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=JGplJ9+fgFe4CSS6AxO+D1FH6A+L0snooci/4G7Usvg=;
        b=cxgzfIUtADsgqokwlIrH6Y7NNr9SXbayXZRZQKShzmXjttMpldP0Zf5kK7aYfdJKKK
         gTCvEkshuShkeY1QLFIMsygFLGBEbHfgz3JyOLXjW4ZZ7UV/ahw9aw7/KMrYTAB9Btx2
         IWA49oYEMZ95G4apbuw8cwXiYuklIDUZf42dzJZVbSEZ6azLHfePBZbOfrD71UIWoteN
         VBDpSNzsaMo3UyTGGIdKkHc1BsRdm2uQDr9U8rxrM+gdbSu+98l12wCEaq8aw3suZkse
         sWInnd1DY15PloUZ4lujena0yqwYjL3umEQsPtlL6p8vn3LFqyKpmUgaGUeLk/VAdCWN
         PiQw==
X-Gm-Message-State: AOAM533i+cH05RLR1nvlh9VX5IZB2wA241pMTwQ8EBuZ+BOFhGMcKd0Q
        6cf4A9oKIXYTmlPyDEY/+0qrTNfSHSc=
X-Google-Smtp-Source: ABdhPJyUncQZELCgTZzeKeodB3qkKeZLHIKKaPiMg2xvxusbF6Q4IhugDngsmC7qo6fdywvN65XOMg==
X-Received: by 2002:a9d:721b:: with SMTP id u27mr3495398otj.335.1622380458728;
        Sun, 30 May 2021 06:14:18 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t26sm2464561oth.14.2021.05.30.06.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 06:14:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 30 May 2021 06:14:16 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Armin Wolf <W_Armin@gmx.de>
Cc:     Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 6/6] hwmon: (dell-smm-hwmon) Update docs
Message-ID: <20210530131416.GA2483596@roeck-us.net>
References: <20210528173716.10975-1-W_Armin@gmx.de>
 <20210528173716.10975-7-W_Armin@gmx.de>
 <20210528175310.53ey6xq5ttpfkod6@pali>
 <90260e4f-7e3f-20af-7706-add965ae9192@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90260e4f-7e3f-20af-7706-add965ae9192@gmx.de>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, May 28, 2021 at 10:37:06PM +0200, Armin Wolf wrote:
> Am 28.05.21 um 19:53 schrieb Pali Rohár:
> > On Friday 28 May 2021 19:37:16 W_Armin@gmx.de wrote:
> > > From: Armin Wolf <W_Armin@gmx.de>
> > > 
> > > pwm1_enable is now readable too.
> > Hello! pwm1_enable cannot be readable. It is write-only node. See also:
> > https://lore.kernel.org/linux-hwmon/201605221717.26604@pali/
> > 
> Hello,
> 
> in Documentation/hwmon/sysfs-interface, pwmX_enable is marked as RW, and the document also states that
> "Read/write values may be read-only for some chips, depending on the hardware implementation", so i
> thought that pwm1_enable being WO is a violation of that rule.
> 

Reality doesn't always match expectations.

Guenter
