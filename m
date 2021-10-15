Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21DF0C433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 15 Oct 2021 22:45:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EFDD8611C8
	for <linux-hwmon@archiver.kernel.org>; Fri, 15 Oct 2021 22:45:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243337AbhJOWrw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 15 Oct 2021 18:47:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238716AbhJOWrv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 15 Oct 2021 18:47:51 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD871C061570;
        Fri, 15 Oct 2021 15:45:44 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id l10-20020a056830154a00b00552b74d629aso12112otp.5;
        Fri, 15 Oct 2021 15:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gTWn7k5FXjaKopQBSmgaNEZlFddGyn89/sNBl5Gwses=;
        b=HolsvVaUwAjXaqDbfUZbBkXeM7rV85yEA2or/wQDFPkbfo2Lag4+O57MYscmC5FTPD
         Vi8z8Y+VRX/PCQnApX+wmjA+eZblsCpYuP5EQ1cuwUYRMWYxatyck/uXo6IzSKvAeqr9
         +NXOEDkvzXvL95QkWBTxrBYIOPABdoV3lwVbR086aeV69l3F7rtPGbCJarcr+8g1d+sy
         vuXfOb8yAu/5Ni6SZ4d0S56E3XeTsDjQl+CtOi8I8j7ZfycVA5XFDgD7qX45amnoa+u3
         wtQQV+YPT9/7BE1nEz6At4VVYLd7QzgSvC8WB5KCz0n+qCWlIToJ5P+bbWl81M1WnMQz
         oqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=gTWn7k5FXjaKopQBSmgaNEZlFddGyn89/sNBl5Gwses=;
        b=D5Y7XClxFMexO4Z7/5ISvdr8O2ckYTqUDUlgn+vZYsrpIyAkT0yic3fXX2nvMHWKvH
         tX7sFENyCMj0qwJR+bU4BpI8eue15HKbmhjA/c6hEj5fApqjz8LzfX7gdxnBeuEGmvqX
         CbKMqxvPZeMKNE5+MmdPBpH67ab2vG67ehaktJ3THGs1iSPOB6EmNY+0LRPuOGbnwPkP
         zuKZtpX8EWZYNR4UClGP7Qxl7AYjVasLNv0icYg64YVvdm+oZuinnFeTmJ4+iFhQLCmI
         ldhv1s2l6IlGo6F5jNImXKdjinfATIyxtreOuGuTX8MWrB21EndPqHZGLHPgebiWaiWt
         tcLg==
X-Gm-Message-State: AOAM531ex8IhY27tKcqcJd6gzKCh6HMPL1eIM35vh8S/wcvpX8DX4Y86
        MLz+xhpFhpVKna+bss1Y/4M=
X-Google-Smtp-Source: ABdhPJw/BuAb7+ymKPKqL6GtIID51gIxZ3x+DzX0JzSxRtwHJ8BaAln/vHJKz0nPBCYFaiRjwBUqFQ==
X-Received: by 2002:a05:6830:19dc:: with SMTP id p28mr10310396otp.185.1634337944225;
        Fri, 15 Oct 2021 15:45:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f3sm1254835oot.1.2021.10.15.15.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:45:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 15 Oct 2021 15:45:42 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/9] hwmon: (tmp421) add support for defining labels
 from DT
Message-ID: <20211015224542.GA1484162@roeck-us.net>
References: <cover.1634206677.git.krzysztof.adamski@nokia.com>
 <dab0fda6ac0e8d7f163c3762a7fb1e595a4d8159.1634206677.git.krzysztof.adamski@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dab0fda6ac0e8d7f163c3762a7fb1e595a4d8159.1634206677.git.krzysztof.adamski@nokia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Oct 14, 2021 at 03:00:49PM +0200, Krzysztof Adamski wrote:
> tmp42x is a multichannel temperature sensor with several external
> channels. Since those channels can be used to connect diodes placed
> anywhere in the system, their meaning will vary depending on the
> project. For this case, the hwmon framework has an idea of labels which
> allows us to assign the meaning to each channel.
> 
> The similar concept is already implemented in ina3221 - the label for
> each channel can be defined via device tree. See commit a9e9dd9c6de5
> ("hwmon: (ina3221) Read channel input source info from DT")
> 
> This patch adds support for similar feature to tmp421.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> ---
>   drivers/hwmon/tmp421.c | 61 ++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 61 insertions(+)
> 
> diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
> index 707310d616a4..89346ca6c9a9 100644
> --- a/drivers/hwmon/tmp421.c
> +++ b/drivers/hwmon/tmp421.c
> @@ -88,6 +88,7 @@ static const struct of_device_id __maybe_unused tmp421_of_match[] = {
>   MODULE_DEVICE_TABLE(of, tmp421_of_match);
>   
>   struct tmp421_channel {
> +	const char *label;
>   	s16 temp;
>   };

git reports this patch as corrupted and claims it was hand-edited.
Looking into it, there is an extra space in unchanged lines of code.
Indeed, it applies cleanly after replacing douple spaces at the beginning
of each line with a single space.

No idea how that happened, but please be careful whend sending patches.

Applied.

Guenter
