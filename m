Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20BE2C77B61
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 Apr 2023 15:07:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240889AbjDGPG7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 7 Apr 2023 11:06:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240895AbjDGPGn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 7 Apr 2023 11:06:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CED5B452
        for <linux-hwmon@vger.kernel.org>; Fri,  7 Apr 2023 08:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680879816;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=cuQoojtyUSJETR2nd2K1fNz+7Y625dx15WLZe51OqG8=;
        b=T4OndUlOqFns6vhVhk6kmsY5JAWMJ1fsWYUtJWV0ONKx8E6gJR9eievHUtdQxOJnvhqUm8
        1Td/OP/Tc5qfxGHf9yHoyPYMvBn+cenzgZ5kjGwHlXFrMYtShWCXU9L4RjQzvd83uxP1od
        H+cajObIAjr5WxE4yNwtaPwASnMTuk4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-350-QIn2oMG0NuSYdWZU0dcBKw-1; Fri, 07 Apr 2023 11:03:35 -0400
X-MC-Unique: QIn2oMG0NuSYdWZU0dcBKw-1
Received: by mail-wm1-f72.google.com with SMTP id u12-20020a05600c19cc00b003f07be0e96bso602754wmq.7
        for <linux-hwmon@vger.kernel.org>; Fri, 07 Apr 2023 08:03:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680879812;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cuQoojtyUSJETR2nd2K1fNz+7Y625dx15WLZe51OqG8=;
        b=mrUKlpLXxsJSm/2oQMkrH34whfKBPY5+gzQpebqhKTc+NAyz3rQqfPjqhqu2Gnb+KH
         f1H5VpyjAZrLwYfQaTt+WexF6G4qUefcIn75jCd1Eyqdg4ddNqALg4efWyOZrMkmJ9/v
         UXO/HAxrxXbba0p6uDqNigmB2Fqz1/X4HjTmmIxUGLUJ7UNWK5DfQVILhsGt5yxEklB+
         JU8fieaAqtmssvc5z20akXgmNyvtledTBvkkzC2/Ynq+qBLfCR3veLIx3wSqNiQy7C4W
         AlrlQ6EsfAIpBpdhmlaKzyPntleZBivMqWHmfAu1GO0fRH9KzKJh2ExK+uqv5R7Lmq/3
         VU9A==
X-Gm-Message-State: AAQBX9fmaZqpzoVoGI/9ZXLC87EM2o/9ieeMe52fvQbGobBr67DNDhc9
        v0m3sAIlGcynczRGsiffUhahZdQKheuoplX4GUUUrs/Us4fV1/m6ixCLRds92SLUvwu4zkWY0IM
        uw+Dah4qxkifGWOF3OJpv4Bc=
X-Received: by 2002:a1c:f310:0:b0:3ee:282d:1016 with SMTP id q16-20020a1cf310000000b003ee282d1016mr1909992wmq.25.1680879812622;
        Fri, 07 Apr 2023 08:03:32 -0700 (PDT)
X-Google-Smtp-Source: AKy350YlKD1jBpgyeO97TrwIhBOy+olr/w0iTAY7aZtpV6/1SMgATNnjbyQV6aZgywuB2M7d+lyLKA==
X-Received: by 2002:a1c:f310:0:b0:3ee:282d:1016 with SMTP id q16-20020a1cf310000000b003ee282d1016mr1909963wmq.25.1680879812300;
        Fri, 07 Apr 2023 08:03:32 -0700 (PDT)
Received: from redhat.com ([2a06:c701:742d:fd00:c847:221d:9254:f7ce])
        by smtp.gmail.com with ESMTPSA id o22-20020a05600c511600b003ef5bb63f13sm8759938wms.10.2023.04.07.08.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 08:03:31 -0700 (PDT)
Date:   Fri, 7 Apr 2023 11:03:28 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Alvaro Karsz <alvaro.karsz@solid-run.com>,
        Jason Wang <jasowang@redhat.com>,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] vdpa: solidrun: constify pointers to hwmon_channel_info
Message-ID: <20230407110308-mutt-send-email-mst@kernel.org>
References: <20230407150130.79917-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230407150130.79917-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Apr 07, 2023 at 05:01:30PM +0200, Krzysztof Kozlowski wrote:
> Statically allocated array of pointed to hwmon_channel_info can be made
> const for safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

sure, merge it as appropriate
Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
> 
> This depends on hwmon core patch:
> https://lore.kernel.org/all/20230406203103.3011503-2-krzysztof.kozlowski@linaro.org/
> 
> Therefore I propose this should also go via hwmon tree.
> 
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-hwmon@vger.kernel.org
> ---
>  drivers/vdpa/solidrun/snet_hwmon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/vdpa/solidrun/snet_hwmon.c b/drivers/vdpa/solidrun/snet_hwmon.c
> index e695e36ff753..65304354b34a 100644
> --- a/drivers/vdpa/solidrun/snet_hwmon.c
> +++ b/drivers/vdpa/solidrun/snet_hwmon.c
> @@ -159,7 +159,7 @@ static const struct hwmon_ops snet_hwmon_ops = {
>  	.read_string = snet_hwmon_read_string
>  };
>  
> -static const struct hwmon_channel_info *snet_hwmon_info[] = {
> +static const struct hwmon_channel_info * const snet_hwmon_info[] = {
>  	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT | HWMON_T_LABEL,
>  			   HWMON_T_INPUT | HWMON_T_CRIT | HWMON_T_LABEL),
>  	HWMON_CHANNEL_INFO(power, HWMON_P_INPUT | HWMON_P_LABEL),
> -- 
> 2.34.1

