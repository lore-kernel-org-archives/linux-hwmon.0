Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A95AEEE4980
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Aug 2023 17:38:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349781AbjHRRiN (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Aug 2023 13:38:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379135AbjHRRhl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Aug 2023 13:37:41 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C620F3C25
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Aug 2023 10:37:38 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-565f58f4db5so919026a12.0
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Aug 2023 10:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692380258; x=1692985058;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3LKfiXOUv4Y78GYwccbn9eLRl2BI7RjZ4/fZETpGexM=;
        b=AwtNaCfH+hxlFLkfnuSI87gwp+VrGSgjnV1+zyCVrSwmJJC4EGOeaIRRhY9RTx6MYP
         FgApMLQbcYGXFIUxmq7WRH1DlieMuCOArB0NAHYwn8eFVczWDLMlggXkB/l7FmumT4gH
         p8dBl4LTXYAJn2srL2qSVGJh9kAj2+MdjgNnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692380258; x=1692985058;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3LKfiXOUv4Y78GYwccbn9eLRl2BI7RjZ4/fZETpGexM=;
        b=jCg+aMw9dBn1hYM/jffq5H6a1tOSMpVc3JJTtWlJ98cge1wdX76m7KGXxsFNV2gjcg
         uhvtO90BHkcAdnozhsEitCN1fkI6hAkI9BR7uZveSvNLocejx20y4ILBKVCkkOnfBwsY
         Xi34HwWQx7Weq62+MHRwWOHJOX3LyuStOZwwzGeSZdUmYOpzSG4IySMfQVyKhYYyMPmA
         CsQxbXR/3DzjH/Dlr7eebTRVsnd61SegvQiK60jaE9STA52m0/TrrNW3UG4E7ZT0dDih
         bXAcrMt/aa/XlEaQgNqeYCxS92SD/PrZD8V9e4NuDolRWscJQ9yh9jkvIYO3X/jjLHu0
         6U9g==
X-Gm-Message-State: AOJu0YyUbICdxorWaCZZtjRN4VnrlBJ759RCeudpBogJZj3mcdUxvFCY
        NV301hT++VqIzwalK92Y+K5ZWw==
X-Google-Smtp-Source: AGHT+IGJ++HaMEe6fHz/+u8LhwdAhyc4KdGymaYjDc60SFpqfaa9p36TY5f9p3+CAiEcdKVw+eWCoA==
X-Received: by 2002:a17:90b:438d:b0:26d:4346:6eb2 with SMTP id in13-20020a17090b438d00b0026d43466eb2mr2675522pjb.46.1692380258263;
        Fri, 18 Aug 2023 10:37:38 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id ci13-20020a17090afc8d00b002684b837d88sm1828910pjb.14.2023.08.18.10.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 10:37:37 -0700 (PDT)
Date:   Fri, 18 Aug 2023 10:37:36 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     Fiona Ebner <f.ebner@proxmox.com>, linux-kernel@vger.kernel.org,
        siva.kallam@broadcom.com, prashant@broadcom.com,
        mchan@broadcom.com, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, richardcochran@gmail.com,
        jdelvare@suse.com, Guenter Roeck <linux@roeck-us.net>,
        netdev@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Linux Regressions <regressions@lists.linux.dev>
Subject: Re: "Use slab_build_skb() instead" deprecation warning triggered by
 tg3
Message-ID: <202308181036.8F79E77@keescook>
References: <1bd4cb9c-4eb8-3bdb-3e05-8689817242d1@proxmox.com>
 <ZN9SId_KNgI3dfVI@debian.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZN9SId_KNgI3dfVI@debian.me>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Aug 18, 2023 at 06:12:33PM +0700, Bagas Sanjaya wrote:
> On Fri, Aug 18, 2023 at 10:05:11AM +0200, Fiona Ebner wrote:
> > Hi,
> > we've got a user report about the WARN_ONCE introduced by ce098da1497c
> > ("skbuff: Introduce slab_build_skb()") [0]. The stack trace indicates
> > that the call comes from the tg3 module. While this is still kernel 6.2
> > and I can't verify that the issue is still there with newer kernels, I
> > don't see related changes in drivers/net/ethernet/broadcom/tg3.* after
> > ce098da1497c, so I thought I should let you know.
> > 
> 
> Thanks for the regression report. I'm adding it to regzbot:
> 
> #regzbot ^introduced: ce098da1497c6d
> #regzbot link: https://forum.proxmox.com/threads/132338/
> 
> PS: The proxmox forum link (except full dmesg log pasted there) is in
> German, so someone fluent in the language can be helpful here.

Since this doesn't cause a behavioral regression, should it be tracked
by regzbot? The WARN is serving as a reminder to the maintainer to
adjust the allocation method.

-- 
Kees Cook
