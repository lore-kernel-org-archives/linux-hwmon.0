Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E8E4C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu,  3 Feb 2022 19:02:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353633AbiBCTCk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 3 Feb 2022 14:02:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237541AbiBCTCk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 3 Feb 2022 14:02:40 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 070BDC061714;
        Thu,  3 Feb 2022 11:02:40 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id m10so5592961oie.2;
        Thu, 03 Feb 2022 11:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CVIIf4PV8Vh9T6ecRHWiT3dCZbpUvjtsRB0st3JnEiw=;
        b=VdoERpTufTdy5QputkfQhNVJxw7sDp1/bsTpn1WtfRjebcHtZJxlJj+glFNpnsVrIO
         mb4DRCaG/xr2eYnfTvzJtidt3Sp6pM6fJUm5UIXzny9UFW+LpE6ICpP31EQKzan3Qycr
         4iO2dJwLOwk5dMkw1Lda9yToEs+ep1REXmyj+OSYGeSnQGBnfK1wKML6lPuD4y4XWsbP
         n4fe6AQBzUUVTtZUUzQfLJcFmB7qgX3+c9fJFCrADFLM3Y4YPdrpnOzkUBpwn2kK668D
         S7qETo4p35I0vKdF/R9cH4icMWk8fLoxR9BuP/bvRwtoD1YbQnzWwA6Ds5pXHfFn7jkr
         i06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=CVIIf4PV8Vh9T6ecRHWiT3dCZbpUvjtsRB0st3JnEiw=;
        b=UJ/dJsLg0UKtc6O40cLF3njxddn23OZTThLUNcjsHFbXVRXhd4Z1WSn2sPDvBK7fB5
         GDpAkx3kRvRY5HIgPl0vWHL+YyAHIh1jbKVaGRvo7IMb7pXFJXvdNYOx4SRzoo/Ia8Ud
         6DAKLvD0117BKMV53HpNTaWnn+MsF4UbNtI6KprVsPEt7lXQWrC8D4eeWcOTTEjMvj4x
         f3/rSsZZfL3dZXgURFK453WtxIJLwCAEXNPFhN5dsvvzZr4awn9Gfc9nTglAgy5CoLA5
         v5I+lhAw7jKrxgT/cLkruFWt1VvgXCvq+z5f5yJmEevE1hXw72ebl/N/kkqP1UlutL6n
         zB2Q==
X-Gm-Message-State: AOAM5316SVpErkgDvnP+zkuogw1MSOUiq/X2gflV99zCS/1/mQeR87AL
        sG8Ul1C7WRr4kM60tVVyWt4=
X-Google-Smtp-Source: ABdhPJxvo1wDkQEG8WcQAbAmBAVsOG4dzC0Tk+nmFy6ujgo7xS79gbAWs+ky+qxJVWxUz1ju+cTMHQ==
X-Received: by 2002:a05:6808:1792:: with SMTP id bg18mr8293952oib.90.1643914959381;
        Thu, 03 Feb 2022 11:02:39 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n12sm17020094oop.5.2022.02.03.11.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 11:02:38 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 3 Feb 2022 11:02:37 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Marcello Sylvester Bauer <sylv@sylv.io>
Cc:     linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 1/4] hwmon: (max6639) Update Datasheet URL
Message-ID: <20220203190237.GA236416@roeck-us.net>
References: <cover.1643299570.git.sylv@sylv.io>
 <76025f40d2684dc0d3ec02c8899b726b07a0e7da.1643299570.git.sylv@sylv.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76025f40d2684dc0d3ec02c8899b726b07a0e7da.1643299570.git.sylv@sylv.io>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Jan 27, 2022 at 05:17:27PM +0100, Marcello Sylvester Bauer wrote:
> The old Datasheet does not exist anymore.
> 
> Signed-off-by: Marcello Sylvester Bauer <sylv@sylv.io>

Applied.

Thanks,
Guenter

> ---
>  Documentation/hwmon/max6639.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/hwmon/max6639.rst b/Documentation/hwmon/max6639.rst
> index 3da54225f83c..c85d285a3489 100644
> --- a/Documentation/hwmon/max6639.rst
> +++ b/Documentation/hwmon/max6639.rst
> @@ -9,7 +9,7 @@ Supported chips:
>  
>      Addresses scanned: I2C 0x2c, 0x2e, 0x2f
>  
> -    Datasheet: http://pdfserv.maxim-ic.com/en/ds/MAX6639.pdf
> +    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX6639-MAX6639F.pdf
>  
>  Authors:
>      - He Changqing <hechangqing@semptian.com>
