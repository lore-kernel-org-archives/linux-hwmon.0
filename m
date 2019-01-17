Return-Path: <SRS0=PihD=PZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FAKE_REPLY_C,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48FD0C43387
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 23:45:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1960C20855
	for <linux-hwmon@archiver.kernel.org>; Thu, 17 Jan 2019 23:45:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s0RpV753"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbfAQXpQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 17 Jan 2019 18:45:16 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:32943 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbfAQXpQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Jan 2019 18:45:16 -0500
Received: by mail-pg1-f195.google.com with SMTP id z11so5159035pgu.0
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Jan 2019 15:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=gmC4ruy1H0PLhjXYrGtsxMRJmCwVE2e8Fod/0hgNRo8=;
        b=s0RpV753xJrVDX2VMOxP6kH7itXWTtQTJAzNUEZD6aZ4SHbBv443sA+td85fguN1t6
         bvNTN+LJmlTIBcSp4skcipY0kiJV2uteSdt2Sa0pJZzU34b8v6Ciht3Chu2JEITH0Fim
         FxR3gKVIXGMEf+6Tw6ySVmmR7hYFeUNlgZsrOTCWVc751tDLfODNfjHLVIulSJY2x3BM
         m84cLQvSCLGHvnKWNuMBz7tA7zjhMHv6ypd/BnqzgUEQnStgjLdSNizAmO/nWyrry3aA
         +0zbxFg/kl44QEo1vRUiUKTIUpK/tclKocFIJsQCxZPa2Rpvk98X4BIMvv1dXtYgjYJ/
         pUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mime-version:content-disposition:user-agent;
        bh=gmC4ruy1H0PLhjXYrGtsxMRJmCwVE2e8Fod/0hgNRo8=;
        b=jffbIlMXLAtGgDXzvGm0RGxqzZBWED5ysmMlsu2UAC+euvG1KfBZVzq9kJgzUNN91k
         f1ZfW78ijnqGo73Qt3V5yFiVnD/trFpZOnpAVXgPTeLLOuh8col7INTD5pxq3dPLSjIU
         qfcphgEPR4bsR/7G0i4asFqtlydAYOUWcD6NNLAYG6lvYZvy3EJXXV502TqX9JHboA8v
         /nNRHiyKG3vdHLaZRSoQiwl26y4nkewFoazZbshTtiefgkCF/zpdvEi8qYd5TkbKoSBL
         +zA92kdgP7B5CB3Jtb1PVhv2d/2NHI6dueL4Ish7nIKOuj5HXdnxJ+thZAtXECCYqvDk
         7JNA==
X-Gm-Message-State: AJcUukcVcOrgWJimuM346pkRpKHXSSte8fojklouQYEPqBVNadJWpfAE
        fCDfkN36T5x8Gu79PenvWi4=
X-Google-Smtp-Source: ALg8bN5IHQRZOUPQUuvrpyfd7I/a2ZcEbFlcrTiwWx1Tr9m9cAmFFwejuYddsYSjaj0o8dO+ei/l+w==
X-Received: by 2002:a62:4549:: with SMTP id s70mr16784594pfa.233.1547768715467;
        Thu, 17 Jan 2019 15:45:15 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s21sm4908928pfk.133.2019.01.17.15.45.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Jan 2019 15:45:14 -0800 (PST)
Date:   Thu, 17 Jan 2019 15:45:13 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Steffen Kothe <steffen.kothe.gc1993@googlemail.com>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH] f71882fg: add support f81804 & f81966
Message-ID: <20190117234513.GA25041@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Jan 15, 2019 at 11:27:22AM +0100, Steffen Kothe wrote:

Please do not send patches as attachment.

> Support for Fintek F81804 & F81966.
> Enumerate chip and use Fintek F81866 as template,
> because implementation is the same.
> 

Can someone confirm that this correct ? I don't have access to any Fintek
datasheets.

> Signed-off-by: Steffen Kothe <steffen.kothe.gc1993@googlemail.com>
> ---
>  drivers/hwmon/f71882fg.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/f71882fg.c b/drivers/hwmon/f71882fg.c
> index ca54ce5c8e10..8a2bc1ecf991 100644
> --- a/drivers/hwmon/f71882fg.c
> +++ b/drivers/hwmon/f71882fg.c
> @@ -62,6 +62,7 @@
>  #define SIO_F81768D_ID		0x1210	/* Chipset ID */
>  #define SIO_F81865_ID		0x0704	/* Chipset ID */
>  #define SIO_F81866_ID		0x1010	/* Chipset ID */
> +#define SIO_F81804_ID		0x1502	/* Chipset ID, same for Fintek F81966 */
>  
>  #define REGION_LENGTH		8
>  #define ADDR_REG_OFFSET		5
> @@ -2685,7 +2686,8 @@ static int __init f71882fg_find(int sioaddr, struct f71882fg_sio_data *sio_data)
>  		sio_data->type = f81865f;
>  		break;
>  	case SIO_F81866_ID:
> -		sio_data->type = f81866a;
> +	case SIO_F81804_ID:
> +		sio_data->type = f81866a;	/*correlates to Fintek f81866a*/

The downside of this solution is that the kernel will report that it
found a f81866a. Introducing a new ID seems excessive if the chips
are truly compatible, but I am open to a better solution.

At the very least, I think it would be appropriate to change the log
message to something like "Found XXXX or compatible chip at ...".

Thanks,
Guenter

>  		break;
>  	default:
>  		pr_info("Unsupported Fintek device: %04x\n",
> -- 
> 2.17.1
