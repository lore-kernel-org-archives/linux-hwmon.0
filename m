Return-Path: <SRS0=Rv8n=UE=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2D36C28CC5
	for <linux-hwmon@archiver.kernel.org>; Wed,  5 Jun 2019 20:25:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A957C2075B
	for <linux-hwmon@archiver.kernel.org>; Wed,  5 Jun 2019 20:25:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FGob1Ckt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726527AbfFEUZN (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 5 Jun 2019 16:25:13 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:41048 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726464AbfFEUZN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 5 Jun 2019 16:25:13 -0400
Received: by mail-pg1-f193.google.com with SMTP id 83so6201656pgg.8
        for <linux-hwmon@vger.kernel.org>; Wed, 05 Jun 2019 13:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0D3rPtrFenGq6bZ1zGdLFdAff9jspgFhqaiG/oH8SkM=;
        b=FGob1Ckt2SjfiFW42BBpYXg18QBMLXL7vjtUOPZiUt6N0sFBzF+VOanMR1uHrXJrOy
         0Cgiqvm+ebZHuo5qig6gZWaVFjIK7Lnee1tGAZiaHtPsv7Y3jh1Kvguawxc5ww2A22Id
         ceV8sgITx4UHFnOVva1ci6xeiujsnplmj++idj8Sz9+/yYPkzhwbpgqfp165oGOtvSB8
         BcKzKoBVGSIyScYsdJTL6ENmNXRLh/k7YwgC9GRPv/vsfwlURvbPyZTt9D2B/VPEyqEY
         +2/A0FL4I8TYTpuDjSM5W4nMcnvcXadYv9GCS2oV1l06ttZ0ru6H/QfJvf/drJl1K9cF
         LD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=0D3rPtrFenGq6bZ1zGdLFdAff9jspgFhqaiG/oH8SkM=;
        b=NkLHTNramPLzmI/7rARU0ctA6bqdz9bVLkTL661P9E1dyNCD+5wTswHi6yu+Hb/Gqq
         p7DWkpDGa679/fePuTnfsdJFCdxaIRLJbCJwlHZU4ZW/QSZxLzfd6AduYmM4Xeh9fzDr
         nuHrqmeEczCpGnEe2Vzb7J8UHGBAiqWk6qqwkc1rKEMjFUR+CVlN1dGM0QvQYNrEBqTA
         K4rL/P/mwghKhtL6wjNdk6ZKcINUfQRAy3zU8UY0sSUI5HyE4jpbT0wDuiwlPLYuZnUO
         tTpLI3rBJVHTbr9hTkl19di6xvwWLZ4LoZ/aGdlBXx7nO7k+DX07Bui4bSJ++IyCLhu2
         CDMQ==
X-Gm-Message-State: APjAAAV7BJ6FYqnLxOIFcpPKL2brGRA5RBpbCuq3D1ts9YFnFVsAJZ0b
        Eb//Db+u79LZP2Cr3wo5psuyZ+Tc
X-Google-Smtp-Source: APXvYqzar5695FkpTyncUkYOQJsZZd0lPTloO1BaUOowrSEAxntyUSFf9yLkHyecJYvqo6ZSxh+x6Q==
X-Received: by 2002:a62:770e:: with SMTP id s14mr18800606pfc.150.1559766312458;
        Wed, 05 Jun 2019 13:25:12 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w66sm21609867pfb.47.2019.06.05.13.25.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 13:25:10 -0700 (PDT)
Date:   Wed, 5 Jun 2019 13:25:09 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Adamski, Krzysztof (Nokia - PL/Wroclaw)" 
        <krzysztof.adamski@nokia.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: Re: [PATCH v2 1/2] pmbus: (core) mutex_lock write in
 pmbus_set_samples
Message-ID: <20190605202509.GA27491@roeck-us.net>
References: <25c0f33fa281e8fb9781b71bda9e2f570113df85.1559140351.git.krzysztof.adamski@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25c0f33fa281e8fb9781b71bda9e2f570113df85.1559140351.git.krzysztof.adamski@nokia.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, May 29, 2019 at 02:33:52PM +0000, Adamski, Krzysztof (Nokia - PL/Wroclaw) wrote:
> update_lock is a mutex intended to protect write operations. It was not
> taken, however, when _pmbus_write_word_data is called from
> pmbus_set_samples() function which may cause problems especially when
> some PMBUS_VIRT_* operation is implemented as a read-modify-write cycle.
> 
> This patch makes sure the lock is held during the operation.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>
> Reviewed-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/pmbus_core.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index ef7ee90ee785..62cd213cc260 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -1946,7 +1946,9 @@ static ssize_t pmbus_set_samples(struct device *dev,
>  	if (kstrtol(buf, 0, &val) < 0)
>  		return -EINVAL;
>  
> +	mutex_lock(&data->update_lock);
>  	ret = _pmbus_write_word_data(client, reg->page, reg->attr->reg, val);
> +	mutex_unlock(&data->update_lock);
>  
>  	return ret ? : count;
>  }
