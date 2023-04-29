Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D81EC77B7C
	for <linux-hwmon@archiver.kernel.org>; Sat, 29 Apr 2023 14:44:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbjD2Ool (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 29 Apr 2023 10:44:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230523AbjD2Ook (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 29 Apr 2023 10:44:40 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C52A21986
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Apr 2023 07:44:39 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-63b7096e2e4so825018b3a.2
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Apr 2023 07:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682779479; x=1685371479;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0F7XJAuDocyGGhiIQgbZLD08SoBu8nIifMsoJcWuDls=;
        b=jZHlaE+nAP99CPjNtl8uWhAM60DU65tH7EljtjzQA79EN+lf0wFJhmpgHpJa0dcfgQ
         9JifhSv6k1G2xTC1PpjHwbO+oTNWyKaYLPRX/MfHaOU5rqJqWMkaskAik1eLZ1oGLE5o
         YAXxRpDYuSiEg5z2KdSd6DP/aIL8jgx22w2C5PtMEKAUmwRnH6o+u+MoraphHbDZ05gR
         hDSzw7hqR2AGFzXn8nrbfs6a37wM1CQKOvsXc48NSYH8A1chm5zhfBub9Dx0NiTdTrPP
         ymwSujv/vq9OVmzrK+H2XS7lNXFn6xXm94ZDYAANVNnyqE7QYguXrt7xOy94F2VJaZ5D
         BODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682779479; x=1685371479;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0F7XJAuDocyGGhiIQgbZLD08SoBu8nIifMsoJcWuDls=;
        b=Npre8yPFF0i5RPktGFmUfSRtuH45mtNVBdnMgYOgPHe6hwUNhI/+69zKD+n0TwiWVq
         VllTyoCkreHVQATvR4QU3rSzLnEFMls7Y4m0zeVGCTHFayzXQoDOW9vnhElzXHKEOjrs
         aHFjxjUsqK/y4C/uoaOZksYDOZQW4DjmdeX/1odzFkZZCbU9mp4cLQl1b06TqW5sELdH
         r8Hwa9u6yUaVkHiV5HOh+ZPoZauQGpmw/MJjzI62xmdtPJGgM9KuUisWEKef+1PEG+ar
         GFKMkRWIMDCtImDp5sre54UQQhj4JP47XrShbpK61IIh0/u4Unm/P4fkLwNGFzylMccE
         enBw==
X-Gm-Message-State: AC+VfDzvt8XhXgZr4bSYdY4sdoj+ZHMl675LNeE37Aiy99nA37DsDBgy
        ms7MCOu+afxtW+csiFtLEVk=
X-Google-Smtp-Source: ACHHUZ6mXE9U0IzMAOeoLccWja6vQu7Fa0EEvXgDWjmIAr0z6cZTQVfGDETMTMUXKnS1JWWvNsHMtA==
X-Received: by 2002:a05:6a00:2485:b0:641:4d30:7922 with SMTP id c5-20020a056a00248500b006414d307922mr778314pfv.4.1682779479168;
        Sat, 29 Apr 2023 07:44:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y7-20020a056a00190700b0063f1430dd57sm14831483pfi.49.2023.04.29.07.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 07:44:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 29 Apr 2023 07:44:37 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Frank Crawford <frank@crawford.emu.id.au>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v1 1/3] hwmon: (it87) Add controls for chips with only 4
 fans
Message-ID: <a87ab348-bfa4-4270-8e85-9ecab34b665c@roeck-us.net>
References: <20230429115205.1547251-1-frank@crawford.emu.id.au>
 <20230429115205.1547251-2-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230429115205.1547251-2-frank@crawford.emu.id.au>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Apr 29, 2023 at 09:52:03PM +1000, Frank Crawford wrote:
> Add feature and support for chips with only 4 fans.
> 
> Reorder macro definitions to bring all fan definitions together.
> 
> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>

Applied to hwmon-next.

Thanks,
Guenter
