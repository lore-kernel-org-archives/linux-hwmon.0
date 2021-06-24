Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43E51C49EA5
	for <linux-hwmon@archiver.kernel.org>; Thu, 24 Jun 2021 12:32:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28D51613B1
	for <linux-hwmon@archiver.kernel.org>; Thu, 24 Jun 2021 12:32:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231580AbhFXMe1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 24 Jun 2021 08:34:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbhFXMe0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 24 Jun 2021 08:34:26 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62B46C061574;
        Thu, 24 Jun 2021 05:32:07 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id v5-20020a0568301bc5b029045c06b14f83so5338543ota.13;
        Thu, 24 Jun 2021 05:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=544/8df+bmPFH+cWBj59xOz69dHyhs3v7jqO6mT7lUE=;
        b=HVA1pAfBwnLo32ReUkni8iP8wc1Yw681MdrU0HGTZbO/3FBpPYofsU29k3BtUTd0mm
         ONlly1krZscSIzfl5HEqUgPWQJetG8RcjGoEFx5COUpVcmY55cwmiIrdalFVguCMfSmp
         BDJDryzBp/HugnPLwBtyMRQUbh7l05wMdJ91k87ZFScN6wTN0U5y12mInuxDSkWgBN+t
         YXOrlRTiFFLPsaV4F4ZRLERyThv4lPi5UXp3CRXR8dSW3LiWVi/n9rmhfjJm5m0ua0gx
         bfVWZ1vbrhp7WK7vTjxrkdVznntuEKB7xcb1MinaKYnVYi2JXd1m5W8nFabaA+TwqNxY
         wHvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=544/8df+bmPFH+cWBj59xOz69dHyhs3v7jqO6mT7lUE=;
        b=LSMwHEmuOOsL8cHjPrZC3F6PQWFDDWUmw1OEE2WUygOsPXPoNbFx9Y/Mn8rw2oIwnm
         QC0Kre46FwsB+E5I92RE7Y4ekxqx8i7uk1phbqaC5CXUrbnEZf1CxAAb+M8BrSqDoux8
         BsA5SzDWqV8ylijO4DlqhyhEVdxSNidZLBQ0DMCRZRlvSpsaZyzTmilZ2uAIUW1KCIQ8
         EUmhO+Vq6L7IWOQk8LhZDIKjN9V71WyB9F9+PPqvezLpydCq9n/zkrHQtK/dqmFVlngk
         IUMUT6T612xKqIM66unotMGK6Sh2UvUXqPzPmGg2kUUG7FCFJ8MBS01jTexngDk1/oeA
         pqnQ==
X-Gm-Message-State: AOAM533ScnWy9cgEf5cmNEVh5ZH6SUSLAUkHDhAxBqxCnPUBev0h0x2s
        HlwE2/o16Jyu/nEkFf37aheVZ78Vt/8=
X-Google-Smtp-Source: ABdhPJxILzRWvP568GHRBBRCRceiYeOH3loqWG3cuQelodzyoWakcZSrnlFTzban8jw6/SRgQ0260Q==
X-Received: by 2002:a9d:4d87:: with SMTP id u7mr4449938otk.131.1624537926748;
        Thu, 24 Jun 2021 05:32:06 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w20sm662124otl.51.2021.06.24.05.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 05:32:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 24 Jun 2021 05:32:04 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     ainux.wang@gmail.com
Cc:     jdelvare@suse.com, corbet@lwn.net, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, sterlingteng@gmail.com,
        chenhuacai@kernel.org, chenhuacai@loongson.cn
Subject: Re: [RFC] hwmon: (pmbus) Some questions about PMBUS_STATUS
Message-ID: <20210624123204.GA1670703@roeck-us.net>
References: <20210624022327.6192-1-ainux.wang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210624022327.6192-1-ainux.wang@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Jun 24, 2021 at 10:23:27AM +0800, ainux.wang@gmail.com wrote:
> From: "Ainux.Wang" <ainux.wang@gmail.com>
> 
> There are some questions about PMBUS_STATUS in core.
> 
I am curious - why do you think such questions would be appropriate as
comment in the code ?

> Signed-off-by: Ainux.Wang <ainux.wang@gmail.com>
> ---
>  drivers/hwmon/pmbus/pmbus_core.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index bbd745178147..e16c85997148 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -2200,6 +2200,19 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
>  	 * Some PMBus chips don't support PMBUS_STATUS_WORD, so try
>  	 * to use PMBUS_STATUS_BYTE instead if that is the case.
>  	 * Bail out if both registers are not supported.
> +	 *
> +	 * Question 1:
> +	 *  Why bail out if both registers are not supported?
> +	 *  MP2949A both registers are not supported.
> +	 *

The status registers are essential for chip operation.

_Normally_ the chip should return an error when trying to access an
unsupported command/register, and it should set an error bit in the
status register. Obviusly the second part won't work here.

> +	 * Question 2:
> +	 *  Use i2c_smbus_read_word_data() or i2c_smbus_read_byte_data
> +	 *  to read, the MP2949A will return undetermined value, although
> +	 *  we already known this chip do not support both registers.
> +	 *  What should we do?

PMBus drivers should never call those functions directly but use the functions
provided by the PMBUs core.

> +	 *  Can we use pmbus_read_status_byte() or pmbus_read_status_word()?
> +	 *  and in MP2949A driver's .read_byte_data and .read_word_data to
> +	 *  filter out both registers?

You would use those functions, but not to filter out both commands but to
simulate one of them and filter out the other.

In general, it is acceptable to simulate or filter out a command if a chip
doesn't support it but does not return an error when accessing it. If you
may recall, I asked you several times why you wanted to filter out the
PMBUS_VOUT_MODE command. You always answered with "the chip does not
support it". Again, that is not a reason to filter out a command. However,
if a chip does not support a command but does not return an error when
accessing it either, it is perfectly valid (and even necessary) to filter
out or simulate such unsupported commands. This is, however, only
acceptable if a chip does not return an error when trying to access the
unsupported registers. Such situations need to be documented in the code,
which should include a comment such as "This chip does not support the
following command(s) and returns random data when reading from them/it".

>  	 */
>  	data->read_status = pmbus_read_status_word;
>  	ret = i2c_smbus_read_word_data(client, PMBUS_STATUS_WORD);
> -- 
> 2.18.1
> 
