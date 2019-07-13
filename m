Return-Path: <SRS0=MrID=VK=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0332CC742A7
	for <linux-hwmon@archiver.kernel.org>; Sat, 13 Jul 2019 13:25:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BC9E320850
	for <linux-hwmon@archiver.kernel.org>; Sat, 13 Jul 2019 13:25:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CuOkXVLj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727638AbfGMNZB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 13 Jul 2019 09:25:01 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39297 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726474AbfGMNZA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 13 Jul 2019 09:25:00 -0400
Received: by mail-pl1-f194.google.com with SMTP id b7so6115189pls.6;
        Sat, 13 Jul 2019 06:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1lBa4mcJkva9S5bC7+ha4hZyO8xurJu7hVx3I7DL1pI=;
        b=CuOkXVLjkBIOfftdehBksYpZ4YeLO07CmiBBCzqx47G3I152FZrGEyZWQqh3ExweSM
         T43XcsgvuTB5/0zPLrjyRa5o9vd8ZsGFJDP74zqISk0FGxPGhgTGxTrRbPbI8F2+Gh/r
         lMoLtknkYcrktislbQh1pV6FHVbS8HUjvf/NM2HM+Xyvm+VoLjlRT1gUmZnLmuG8HPtP
         GkcSPjKbv6B/kcIXMLV6PhPcKnpJW4mdCkDn9SNrXPnX/74thFIcONiUhLmQuwYsS0/7
         dF+nkCsKrBdpYw6K18PnOA6WlWueUgBb97goxq0xPNWeS1auz1L9pRJFiDzYYc4e2E5C
         s/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=1lBa4mcJkva9S5bC7+ha4hZyO8xurJu7hVx3I7DL1pI=;
        b=QUVCyKftpCAspD7sPxKz36K0FAcrW4L6QURkXfD6CcEb+BcR3Pr1AjhMfNpEcg64+w
         SN9ALzIsCq4huXS7Hucg+ynyMgBUWQk4jY8ViFDHk2sxpF9wRJtPHcMOrvL4M/FjZfYt
         sB1+I8PTO+kRHXP8ppM/WQhs3YR0Yxrn7HcT3hI09ju/aTTUyuLCSHwAPcv/rRpshvkO
         L8xvsr/Csjj73wWc5v+8A/siuzqPXJiRC8pYz7fHNhwZPe8LT0zUuHXCvgM6jG/mviMg
         gVr7ubtldGe8rSl8dQJ7lxRviDbU60mn1QrF4FeQrwtxRdPZvnfFs7A/b1vsC7HLvoLn
         bu1Q==
X-Gm-Message-State: APjAAAV1w6Upw894Xlz9Jx2s52H58AkhHGW3zS3FImqpDcYMlHr35JMe
        XcGMB2p6PX3DWFGe19xmEy3qja2j
X-Google-Smtp-Source: APXvYqyxw3BOuYkfawZOIgCHosgrFBKVzQuaCkYZcdHq/yzUqhOBqzrbcOSrQ8RJWTRhZm3YBElx3g==
X-Received: by 2002:a17:902:9a07:: with SMTP id v7mr7480610plp.245.1563024300258;
        Sat, 13 Jul 2019 06:25:00 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z2sm10370389pgg.58.2019.07.13.06.24.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 Jul 2019 06:24:59 -0700 (PDT)
Date:   Sat, 13 Jul 2019 06:24:58 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Daniel Mack <daniel@zonque.org>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        jdelvare@suse.com
Subject: Re: [PATCH 1/2] device-tree: bindinds: add NXP PCT2075 as compatible
 device to LM75
Message-ID: <20190713132458.GA13733@roeck-us.net>
References: <20190711124504.7580-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190711124504.7580-1-daniel@zonque.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Jul 11, 2019 at 02:45:03PM +0200, Daniel Mack wrote:
> The PCT2075 is compatible to other chips that are already handled by
> the LM75 driver.
> 
> Signed-off-by: Daniel Mack <daniel@zonque.org>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  Documentation/devicetree/bindings/hwmon/lm75.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/lm75.txt b/Documentation/devicetree/bindings/hwmon/lm75.txt
> index 12d8cf7cf592..bfb22b249708 100644
> --- a/Documentation/devicetree/bindings/hwmon/lm75.txt
> +++ b/Documentation/devicetree/bindings/hwmon/lm75.txt
> @@ -15,6 +15,7 @@ Required properties:
>  		"maxim,max31725",
>  		"maxim,max31726",
>  		"maxim,mcp980x",
> +		"nxp,pct2075",
>  		"st,stds75",
>  		"st,stlm75",
>  		"microchip,tcn75",
