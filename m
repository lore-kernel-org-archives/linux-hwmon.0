Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B811C00140
	for <linux-hwmon@archiver.kernel.org>; Tue, 26 Jul 2022 18:38:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239508AbiGZSi4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 26 Jul 2022 14:38:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230287AbiGZSiy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 26 Jul 2022 14:38:54 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D226A240B1
        for <linux-hwmon@vger.kernel.org>; Tue, 26 Jul 2022 11:38:53 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-10d845dcf92so19623373fac.12
        for <linux-hwmon@vger.kernel.org>; Tue, 26 Jul 2022 11:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+L9iG3M+cLhI/uPvCk2+ugn0i+cIF1nlT0roZ3dFnaw=;
        b=c+CUMr+wMbFEVCY+iyUnimR34M1WTo8V0z+LRUAeOuaD9IvpZPvtwTKCIcEoB62Zee
         xKGIsfVc8/ylUvPXxXwF+akEwwP6ra5UjjBERN4bcDeTECjHLOq1BbIwkr1EU/CaOtgr
         7XWiksXSVL5yPZ3d6QyagCy0YJqssdfZhmI5mrCauPbCZhiTNDg6FWQ1CjInjclRWXI9
         Oqh5cZdEfB4dULNQWTvM1Tsb/FG0HtKLbXxRY2q5imAlX9q6H6vY0G4WjEBSfdZRv1ct
         xrFZRwO8L46GxgyNT4hcPWpHtUF/ZHaMbRZ+8oq0BGgFZmKRCC9csN6cV0L0Z8cP5DIt
         uSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=+L9iG3M+cLhI/uPvCk2+ugn0i+cIF1nlT0roZ3dFnaw=;
        b=iRgksAUApY0VTvn3iIfFjPKzikeK6FSIar4/eRnWd0+NmVUO9Fq3ihDILUKQPEfxDs
         1CDFsbWjdpuCGHK531CuB6IE6Tqz2ezhmxKfFDiFF60PN3MhAwf107L/hp1R7iOfUb5m
         twf8tAd3AK8yniJ0FHJY/jfMZwoYFPSLW0opvt6QU10XL927dcg1O9/dxA7uDjBSb4Qg
         dXsReQe91IN5ZHUKsEG3XWkhHmI/EJxvYnAliVS8GQbUN8nJJJVfsUdjyJfEKbXS3m0e
         KubjHRzWow3xaYP+x3IC6TRdDVPyLpZm0XzYk6vSbINzbSOWwSsUru2MhfMOVuY2G4we
         0UOA==
X-Gm-Message-State: AJIora9+30PWxf5Lxvo5Gs2k0Mu6XJM85MDiffEps5yI9Dfm5qevM3PF
        Vv7S6JfY50nuYZyLWJV4Z25/13zaWm8QEg==
X-Google-Smtp-Source: AGRyM1tNxPoGjRCUcfC60aFwnt9tazcFKdwD2BAe+DfFunQHlDcxBrvJl5Yi9gTyCo5pO6TAn3Qidg==
X-Received: by 2002:a05:6870:f149:b0:de:e873:4a46 with SMTP id l9-20020a056870f14900b000dee8734a46mr258417oac.286.1658860733098;
        Tue, 26 Jul 2022 11:38:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l6-20020a056871068600b0010e20d0b2e3sm2566812oao.44.2022.07.26.11.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 11:38:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 26 Jul 2022 11:38:51 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Robert Schmidt <r-schmidt@web.de>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: NCT6775F new mainboard ASUS TUF GAMING B550-PLUS WIFI II
Message-ID: <20220726183842.GA933251@roeck-us.net>
References: <20220725211246.14e87df2@hydra>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220725211246.14e87df2@hydra>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jul 25, 2022 at 09:12:46PM +0200, Robert Schmidt wrote:
> Hi,
> 
> can you please add the TUF GAMING B550-PLUS WIFI II to nct6775.c?
> 
> I'm running a locally modified version (from Linux 5.18.14) to get the
> monitoring points from the board:
> 
> --- drivers/hwmon/nct6775.c.org	2022-07-25 21:09:50.494065595
> +0200 +++ drivers/hwmon/nct6775.c	2022-07-25 01:00:35.904415955
> +0200 @@ -5139,6 +5139,7 @@
>  	"TUF GAMING B550M-PLUS",
>  	"TUF GAMING B550M-PLUS (WI-FI)",
>  	"TUF GAMING B550-PLUS",
> +	"TUF GAMING B550-PLUS WIFI II",
>  	"TUF GAMING B550-PRO",
>  	"TUF GAMING X570-PLUS",
>  	"TUF GAMING X570-PLUS (WI-FI)",
> 

Can you send me a patch ? Also, please always copy
linux-hwmon@vger.kernel.org.

Thanks,
Guenter

> 
> DMI data for the board is
> 
> Handle 0x0002, DMI type 2, 15 bytes
> Base Board Information
> 	Manufacturer: ASUSTeK COMPUTER INC.
> 	Product Name: TUF GAMING B550-PLUS WIFI II
> 	Version: Rev X.0x
> 	Serial Number: 210991606300962
> 	Asset Tag: Default string
> 	Features:
> 		Board is a hosting board
> 		Board is replaceable
> 	Location In Chassis: Default string
> 	Chassis Handle: 0x0003
> 	Type: Motherboard
> 	Contained Object Handles: 0
> 
> 
> Thanks in advance,
> Robert
