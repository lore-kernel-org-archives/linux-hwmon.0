Return-Path: <SRS0=mQrJ=RR=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B2D2C43381
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Mar 2019 16:53:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C77EE2087C
	for <linux-hwmon@archiver.kernel.org>; Thu, 14 Mar 2019 16:53:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MWSD+/FP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727184AbfCNQxM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 14 Mar 2019 12:53:12 -0400
Received: from mail-pg1-f181.google.com ([209.85.215.181]:34489 "EHLO
        mail-pg1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727131AbfCNQxM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 14 Mar 2019 12:53:12 -0400
Received: by mail-pg1-f181.google.com with SMTP id v12so4402290pgq.1
        for <linux-hwmon@vger.kernel.org>; Thu, 14 Mar 2019 09:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=P5B80eT6S0A5oLwQoVc7UscoL2CVGqv/XwZGj9cq5z8=;
        b=MWSD+/FPgeDKeGYjot/JMhp1sfUOTCJi4Q7IghwOUtuOdmRk/mxQxsaKv8rN0ow9dO
         2pEN77CnBeAqWqy/V+oO7dEJP6X9H+adl6DqRX4X/fjLrKdCCEF2KPo+zOGrI/EEYzY5
         ZKMRvIprcXG9gWFCUl1jHjeGrspaoJHD0hZySgWBvTy8/KmE9jawR5hVBZWGk/fwlwWQ
         Rb2Z42x+/hgQR2x65EkvUTc+seE2IrgtNX/Y9HywMPvq3zh3uo3xoV3b5ky2cLBi8mCE
         6asUlnQQF+5tTdIkS3CnOMiZGc9iynSKn63V/dYVYNR2zs0ijj5nbJGRvXXzURNCzTAl
         9sWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=P5B80eT6S0A5oLwQoVc7UscoL2CVGqv/XwZGj9cq5z8=;
        b=fnYKkwIfNH+P9b8LgXeF7uvnoESG4uco3LalGN9IO57vFtTwmW7NVNdaPU+L6PMG9V
         Pqs5VQfq+vU2HifIuIfOOg/mERes+cIUg2yywQJmkv76lL+8JacN+cXJ6C5A29W5rkA5
         uEpRS6QjvlG03ubuE8plg9ubefFYVTBB9295PvEIvVXIvngW5tdjAx8HvGfxj7S8LKa2
         XR5mjdBGZ4TuFuG3NxxYh0zTmXRC9Aw0YK5GglWE37AsfwuaR3MRq1AZlhIAt5LuPvoK
         ivLnQa7W/QqNM4dTgok4ZNZkEIlHvomjvHNYGQNEx7iAVPRs12K5bpPzi12y/gRRadg5
         G9Zw==
X-Gm-Message-State: APjAAAVlA4ukeBMc8y+6DBjoRxk6g24fUd69RvDYKGaqWCn+FUIr7wTn
        1wfqEuUFjV2E2ofQVMzrDg4=
X-Google-Smtp-Source: APXvYqzrdGIgadqYYoMdeAzF1zp1MEQGSEzPCVuu46bRwtLJqjn33XMftRM3aRVEzEpDBNNB+At6sA==
X-Received: by 2002:a63:c909:: with SMTP id o9mr17604087pgg.432.1552582391545;
        Thu, 14 Mar 2019 09:53:11 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z15sm24864990pfn.30.2019.03.14.09.53.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Mar 2019 09:53:10 -0700 (PDT)
Date:   Thu, 14 Mar 2019 09:53:08 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     =?iso-8859-1?Q?Gr=F6nke=2C?= Christian <C.Groenke@infodas.de>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: PMBus driver for FSP/3Y Power device with non-standard VOUT
 values (LINEAR11 vs LINEAR16)
Message-ID: <20190314165308.GA14159@roeck-us.net>
References: <0e0877aa3c644765b226654bfd7874bf@infodas.de>
 <20190313151941.GA7122@roeck-us.net>
 <90ca63aeec904168b50b2f8c3f04dd73@infodas.de>
 <20190313163027.GB15451@roeck-us.net>
 <7c2e3520f1d24e51b7002c8d0138f00a@infodas.de>
 <20190314031849.GA19793@roeck-us.net>
 <25260e7b0f3d43588253791046440a64@infodas.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <25260e7b0f3d43588253791046440a64@infodas.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Christian,
On Thu, Mar 14, 2019 at 04:08:32PM +0000, Grönke, Christian wrote:
> 
> The framework code seemed to work fine. I used your code for the conversion:
>     linear11 -> 'scaled integer' -> ieee754
> It provided a way to test the code and was easy for me as my tries to do
> some other bit magic weren't successful. That means I partly tested the code
> from pmbus_data2reg_ieee754 as my read_word function uses this for the
> conversion. Of course not the module local function...
> 

Wondering ... I would have thought that it should be possible to implement
a simplified linear11 <--> ieee754 conversion, without converting to a
scaled integer first. Have you tried that ?

Thanks,
Guenter
