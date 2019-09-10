Return-Path: <SRS0=z2fx=XF=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4221C49ED9
	for <linux-hwmon@archiver.kernel.org>; Tue, 10 Sep 2019 18:43:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8573521479
	for <linux-hwmon@archiver.kernel.org>; Tue, 10 Sep 2019 18:43:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I9pFoCt2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726214AbfIJSnz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 10 Sep 2019 14:43:55 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:44392 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbfIJSnz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 10 Sep 2019 14:43:55 -0400
Received: by mail-pg1-f194.google.com with SMTP id i18so10161248pgl.11
        for <linux-hwmon@vger.kernel.org>; Tue, 10 Sep 2019 11:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ysmT91H+Vz3rOxXKhOMXoJWqBk0oocjaiY3BTPXIal0=;
        b=I9pFoCt2nP4h8HJD62B7TqOWZud/kxwRsSh5HzzoqFxLtGChJ6gGCMo0AYPpaggBva
         ES1HXHZGP4vKL0Ia6DXyxwQE5kScy0906fsIzSIIF8pMLT+NHTFaeofIOQpT4+cMsQn2
         jljT88VmLx51ZC5ZeZwAM9ROaGLZtKN3WGcyp4qo9+R5S/M5tRJNb/Qi4SdU6jlKHBQM
         3CQSs310uy0jXcaRQ1SBcNeAYS+6J///JGaWWUpkuflpom8cSpuBQPwC/TeaVZW/qWG+
         Id0Lk6AzT9fHvWUmRt4zu3pxwuEngdLWE6corM4g4KBQbi6nV7YwUf3mOhTpgaA9RSTQ
         yLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=ysmT91H+Vz3rOxXKhOMXoJWqBk0oocjaiY3BTPXIal0=;
        b=dL+6W3pnIsIBujmWNSE1oBvZoF2bqapc+6AEGfqxHAtGSaYFKhW9QcpR8oCIM9Ws3f
         7QGnQpBIqUBBcowz/hqGgY2Bc9FeaMTRIN50QVhZNNqe65OAPOf5p2kPDysGvn2GBrBR
         PDR2M6OqLP7RgLWuidDLz4CyQ/5s9qy43dVC6xCd49O2YLQb+sjWmwryedAtqAdDgbCa
         7cHYVlqKQzZbwlXGqzvnET6ZWuoN4w414cxCeTo3CmcQpa+k+qEjiB8NZ7tQIH13PZET
         hZ01bqpFDq4TnpHxVpp9NSquwC1ylYe6xHBIfzLrX1JgMtnFCQVCcndJhNEq9p64RABt
         FRpg==
X-Gm-Message-State: APjAAAXt9h4Vm85NnvzKrCGsiUS4tPKdz4MmO/FXKYWe3rxOpF0rC5st
        ex3LrS90J3jLUua7QrfATq5wINyj
X-Google-Smtp-Source: APXvYqziBI4Oohs1CtTiIStfeTnszg7OXoDSCJrU4M7OkgQMw9dzRIEMOr79XPU/TVc2+uMXTz9z5g==
X-Received: by 2002:a63:2f44:: with SMTP id v65mr4903594pgv.380.1568141034308;
        Tue, 10 Sep 2019 11:43:54 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j126sm7289269pfb.186.2019.09.10.11.43.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Sep 2019 11:43:53 -0700 (PDT)
Date:   Tue, 10 Sep 2019 11:43:52 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Dan Robertson <dan@dlrobertson.com>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH 2/2] hwmon: (shtc1) fix shtc1 and shtw1 id mask
Message-ID: <20190910184352.GA29644@roeck-us.net>
References: <20190905010130.15019-2-dan@dlrobertson.com>
 <20190905014554.21658-1-dan@dlrobertson.com>
 <20190905014554.21658-3-dan@dlrobertson.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190905014554.21658-3-dan@dlrobertson.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Sep 05, 2019 at 01:45:54AM +0000, Dan Robertson wrote:
> Fix an error in the bitmaskfor the shtc1 and shtw1 bitmask used to
> retrieve the chip ID from the ID register. See section 5.7 of the shtw1
> or shtc1 datasheet for details.
> 
> Fixes: 1a539d372edd9832444e7a3daa710c444c014dc9 ("hwmon: add support for Sensirion SHTC1 sensor")
> Signed-off-by: Dan Robertson <dan@dlrobertson.com>

Applied after reordering and adjusting. The fix should come first,
followed by adding support for the new chip.

Thanks,
Guenter

> ---
>  drivers/hwmon/shtc1.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/shtc1.c b/drivers/hwmon/shtc1.c
> index 3e9a859a2b58..c628313a20d4 100644
> --- a/drivers/hwmon/shtc1.c
> +++ b/drivers/hwmon/shtc1.c
> @@ -27,14 +27,14 @@ static const unsigned char shtc1_cmd_measure_nonblocking_lpm[] = { 0x60, 0x9c };
>  static const unsigned char shtc1_cmd_read_id_reg[]             = { 0xef, 0xc8 };
>  
>  /* constants for reading the ID register
> - * SHTC1: 0x0007 with mask 0x001f
> - * SHTW1: 0x0007 with mask 0x001f
> + * SHTC1: 0x0007 with mask 0x003f
> + * SHTW1: 0x0007 with mask 0x003f
>   * SHTC3: 0x0807 with mask 0x083f
>   */
>  #define SHTC3_ID      0x0807
>  #define SHTC3_ID_MASK 0x083f
>  #define SHTC1_ID      0x0007
> -#define SHTC1_ID_MASK 0x001f
> +#define SHTC1_ID_MASK 0x003f
>  
>  /* delays for non-blocking i2c commands, both in us */
>  #define SHTC1_NONBLOCKING_WAIT_TIME_HPM  14400
