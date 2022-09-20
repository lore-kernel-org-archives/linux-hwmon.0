Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77B80C6FA8E
	for <linux-hwmon@archiver.kernel.org>; Tue, 20 Sep 2022 14:31:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbiITObC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 20 Sep 2022 10:31:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231555AbiITOav (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 20 Sep 2022 10:30:51 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96A6524F13
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Sep 2022 07:30:50 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id 3so2826700pga.1
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Sep 2022 07:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date;
        bh=vD+KeMmGPGqg8ATJzSVfpqtVVs1rBq8fmdfZN6QsDAo=;
        b=PHDfnR0SZSkxT/2y703j8i4HJZszv1tfqk9yS53YbyYzXWx8MIYZCtUsrcajARPlDb
         OJLMBamPBn60Ka3VC84WlkCY+wIexKkZYpwdZ8I3C4b7k1kiHMbTXiiDDX7UcPlijWKp
         zuyeZsksFb8sSJhG84wNfpvXfYye+X4YwGqOW3qZkr4xrs0X8BmDrUMMJUtA3XplOt7s
         0TRcgJCL3ngrfA79ATdRuQZKax8Xjtepb0TcMRAcrC7cxogMuFpH2fcXre4HBjMtCmxE
         JH4PJhAYW07vXODZkyqkenSHW66X7eklh9ks+eVsMvn+BhaSGJMy83fwoFd69a6Zel5t
         wS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date;
        bh=vD+KeMmGPGqg8ATJzSVfpqtVVs1rBq8fmdfZN6QsDAo=;
        b=kwa1wwoTjcSX664gcbnqz10GOBuZHboXfNg++cqNEQ59smTIhUQkokWSUHjuxnMVVH
         evqQpI3qm/pDDhKBmYpn47pWZ+CwC3QqwGGxcd/NctSDMdujdjwYqXJUZNFXmUrdYdFd
         iNjRWnYC0l98U3aVleAZgyu7rSQvmzBqrkvV/2F4Q8tnwQWljN2rhsl/PHe5HfnVYbdG
         2kPZM85ZLj4xRv3eUiUmKxenSgdpNNwlJsBrxwG7yFJQGEUJFfpTomXRnBw5ByHSACi8
         1o9GOMQi2LR0kIzN4UVBrqbrolpIMsDuULigOcxhPgYzdRJn1+SJ03E4wFuGHYIwuft9
         x7xw==
X-Gm-Message-State: ACrzQf17vqzBz5DFb4VDOLjMGRXwSd2vjlXbhgL3ySZeqcJgvyeuWT14
        T4H/XR+G41cUAkrJ20od050=
X-Google-Smtp-Source: AMsMyM5ryqpeyxAETK0YTMynz/5RcFVIE9U7Ln9h3e5xOpSIrqslrg/Fn4DEm/HSIXI1r06ZEeR5pA==
X-Received: by 2002:a05:6a00:1307:b0:53a:9663:1bd6 with SMTP id j7-20020a056a00130700b0053a96631bd6mr24241244pfu.55.1663684250047;
        Tue, 20 Sep 2022 07:30:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u9-20020a17090a0c4900b0020322204672sm97259pje.38.2022.09.20.07.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 07:30:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 20 Sep 2022 07:30:48 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Roger Lucas <vt8231@hiddenengine.co.uk>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 2/2] hwmon: vt8231: Reorder symbols to get rid of a few
 forward declarations
Message-ID: <20220920143048.GA4072537@roeck-us.net>
References: <20220920135617.1046361-1-u.kleine-koenig@pengutronix.de>
 <20220920135617.1046361-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220920135617.1046361-2-u.kleine-koenig@pengutronix.de>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Sep 20, 2022 at 03:56:17PM +0200, Uwe Kleine-König wrote:
> Declarations for static symbols are useless repetition unless there are
> cyclic dependencies.
> 
> Reorder the functions and variables to get rid of 5 forward declarations.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Applied to hwmon-next.

Thanks,
Guenter
