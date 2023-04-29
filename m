Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66AF5C77B60
	for <linux-hwmon@archiver.kernel.org>; Sat, 29 Apr 2023 14:46:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231232AbjD2Oqf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 29 Apr 2023 10:46:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230523AbjD2Oqf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 29 Apr 2023 10:46:35 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A755C173D
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Apr 2023 07:46:33 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-63b60366047so751311b3a.1
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Apr 2023 07:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682779593; x=1685371593;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RX3TtPQHNaus0jnJSvVjcRbkLoOx3db3UZv/dnFywfc=;
        b=X9UsCbcnfuNcx2oxLbhfPYEUyAxile3TFGP3I+RoxutKvfUFeQh5poutE3acQTxMwo
         xL+BWXlPMOhwHV/Twu2Tq/YtzMMcX5ALjIiMDQaMfPe3RYQEqL7Al9vaG5BprUcsukmf
         7NzjiDgJ7v1qyD5Qd932TsIbECLj0D9Iy20F0448ifZsrHTquB9kyW7XWCfBPWyNFl6m
         PJeAg7EsVsCewgvvga7XMHxeRiFoGuJephohT61+0YaZ8lRuzZz1FVWQLOHu1TT4K8JP
         idZAVxIumuVMFHcO9PMcnApfXXvSDhBHMET3d3gLrQ6CX2+QwEWV4Zqt/AngPOtiIW9j
         B2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682779593; x=1685371593;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RX3TtPQHNaus0jnJSvVjcRbkLoOx3db3UZv/dnFywfc=;
        b=RKrqvo0bAizenL7EVTl70zo6CohFPHXaihT7JkrCBQZiOx2BKYhEpGrV/F+yFnIogo
         hVsqHiMqwzbJj7SZyL3PTdfghjuKZUHM1hQIIdtgs71bEzW3HPqkg38OVnHkFGXdXU7p
         bAxMNHx2c3Q7CWTbBz2va9vfyKm/V1WhM+uasvrXwun8mNU7j1QqwuNgLBVcQOC4cU6s
         14JrR8oY5BLRD1A4kHQiDe2RVS9S5zY3AMwoLbuCNUGgDCqipegGRjsMol/s79Fj6RpC
         4P+w4yKV087ii+r22RqKBOOsRprGvd/gZjqJezjhnsduegCAcs9uVkf6cakMvV2MvnWz
         wWxw==
X-Gm-Message-State: AC+VfDyUZnHpUlLF6GFZif7LNx0riki7vZyz6Pm3xngmkdyjaPTxlPVh
        iuTPXIwipmAo1JH9ZoiVclI=
X-Google-Smtp-Source: ACHHUZ7wirAS6cv83aG9zLbyr18cyVNqJWnXRJn2z4BtaP0/eV60H6tuSKYru3aYkd/Eeg7Y0j97Fg==
X-Received: by 2002:a05:6a00:22d3:b0:63b:89a2:d624 with SMTP id f19-20020a056a0022d300b0063b89a2d624mr14021912pfj.12.1682779593168;
        Sat, 29 Apr 2023 07:46:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c17-20020a056a000ad100b005ae02dc5b94sm17101087pfl.219.2023.04.29.07.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 07:46:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 29 Apr 2023 07:46:31 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Frank Crawford <frank@crawford.emu.id.au>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v1 3/3] hwmon: (it87) Update IT8732F chip for 4 fans and
 PWMs
Message-ID: <fcb584b1-9e96-4d8f-a966-6e3569916074@roeck-us.net>
References: <20230429115205.1547251-1-frank@crawford.emu.id.au>
 <20230429115205.1547251-4-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230429115205.1547251-4-frank@crawford.emu.id.au>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Apr 29, 2023 at 09:52:05PM +1000, Frank Crawford wrote:
> Add support for 4 fans and 4 PWMs to chipset IT8732F.
> 
> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>

Applied to hwmon-next.

Thanks,
Guenter
