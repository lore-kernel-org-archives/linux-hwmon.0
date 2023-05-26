Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EC47C77B7A
	for <linux-hwmon@archiver.kernel.org>; Fri, 26 May 2023 21:08:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237887AbjEZVIu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 26 May 2023 17:08:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230058AbjEZVIu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 26 May 2023 17:08:50 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDCEBBD
        for <linux-hwmon@vger.kernel.org>; Fri, 26 May 2023 14:08:48 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-53202149ae2so759531a12.3
        for <linux-hwmon@vger.kernel.org>; Fri, 26 May 2023 14:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685135328; x=1687727328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FcmpkuCH+m52q+434kVc1+jB9feVNqg53nYBzec4upM=;
        b=rcwHyr/DAe78hVyid5CE6/86I7VeHOovVrcmpU2LUR0AjvjpO7OTri87bO/DbF4L3F
         S15BYYuBN9VyF+Iyi1lsNXgJc2fTxjhD2paBAJo9/UMMxx5cyysvbOHZwif/UdLDBz9K
         FEcgAK4Cgr6Sm+LdzGM6pmOnhvXzRtBtjzi+K8+r+ozNwg2ywBNTT3MsLrx+iAunM3z3
         0wv5fU8FGMtFzWzZMdXP+kMmxB7AkVbUn6IcCA/TE7GxHT7nq9peoAvDLY04xH9lj8aq
         NLpFxmWd2fdpglwetvfNPuVO4/btSTFIcDHDo/HdGQywEq59bqnZlYwE9zQsHZsO5d5N
         ipag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685135328; x=1687727328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FcmpkuCH+m52q+434kVc1+jB9feVNqg53nYBzec4upM=;
        b=MJMDeN9qrSwL7WMD4yERUi3o7jJMlNiDjgvUV5iHqEjdtPyOYbOACUgqHJXMcu++1Z
         fhG3LXkbyU4+vWzRc/zaY942t/EgTvCooSiqU0La3TIVGUpsEfLw2yUJfQMV9hKzP00i
         cva3Tb7+5kYGR3ZhbIOA2NtHpp9EmNMPWbo16s4rhEVKWO2aZocsm44jHhXYu0HyKKl2
         fjSNr6R39bWxs7k5tiBkkmBjIIpQgHKKe7peFRJAVBrdNxOA84e4uf6RN1Ma3ncqlnLU
         k5+BmsbXeXQyLJ1Px2bMymQREG2czQTGknSO0WOk0k1PkEe3/vPoIOlTFgsu6CXrXpKb
         +59A==
X-Gm-Message-State: AC+VfDz2Z7IiukzdMyQhSpK40ENl4K5YEXOONpRFLCIhydSPRsQsww0x
        3LawXSitPYsiWivI+yKVrIw=
X-Google-Smtp-Source: ACHHUZ6iAN484lrf478dFpoSZUOAMpovicAmqAo6huNtyEOWXODiDnNXPTFbWC983QyBRbDFOi1/IA==
X-Received: by 2002:a17:902:e547:b0:1b0:103a:53e9 with SMTP id n7-20020a170902e54700b001b0103a53e9mr4235638plf.57.1685135328222;
        Fri, 26 May 2023 14:08:48 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v11-20020a1709029a0b00b001aface7bdd8sm3642011plp.31.2023.05.26.14.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 14:08:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 26 May 2023 14:08:46 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Osama Muhammad <osmtendev@gmail.com>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3] hwmon:(pmbus/adm1266): Drop unnecessary error check
 for debugfs_create_dir
Message-ID: <2d7ed370-169c-4ad9-ac35-afb96cba1d6f@roeck-us.net>
References: <20230526163938.9903-1-osmtendev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230526163938.9903-1-osmtendev@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, May 26, 2023 at 09:39:38PM +0500, Osama Muhammad wrote:
> This patch removes the error checking for debugfs_create_dir
> in adm1266.c. This is because the debugfs_create_dir() does not
> return NULL but an ERR_PTR after an error.
> The DebugFS kernel API is developed in a way that the
> caller can safely ignore the errors that occur during
> the creation of DebugFS nodes.The debugfs Api handles
> it gracefully. The check is unnecessary.
> 
> Link to the comment above debugfs_create_dir:
> https://elixir.bootlin.com/linux/latest/source/fs/debugfs/inode.c#L565
> 
> Signed-off-by: Osama Muhammad <osmtendev@gmail.com>

Applied.

Thanks,
Guenter

> ---
> changes since v2
> 	-Added more descriptive commit message.
> 
> changes since v1
> 	-In v1 the IS_ERR was used for error checking which is dropped now.
> ---
>  drivers/hwmon/pmbus/adm1266.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
> index 1ac2b2f4c570..184d75269d2b 100644
> --- a/drivers/hwmon/pmbus/adm1266.c
> +++ b/drivers/hwmon/pmbus/adm1266.c
> @@ -340,8 +340,6 @@ static void adm1266_init_debugfs(struct adm1266_data *data)
>  		return;
>  
>  	data->debugfs_dir = debugfs_create_dir(data->client->name, root);
> -	if (!data->debugfs_dir)
> -		return;
>  
>  	debugfs_create_devm_seqfile(&data->client->dev, "sequencer_state", data->debugfs_dir,
>  				    adm1266_state_read);
