Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40099C433F5
	for <linux-hwmon@archiver.kernel.org>; Tue, 17 May 2022 12:54:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346491AbiEQMyw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 17 May 2022 08:54:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346611AbiEQMyo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 17 May 2022 08:54:44 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A85944D9D4
        for <linux-hwmon@vger.kernel.org>; Tue, 17 May 2022 05:54:42 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id z15-20020a9d65cf000000b00605f064482cso12096986oth.6
        for <linux-hwmon@vger.kernel.org>; Tue, 17 May 2022 05:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gA9rZo6PdD24XHU33WPWzeBcvcuYbVgXgFQzpdX4hto=;
        b=OaT78H20385aZ8DQ6PEB6i4522PFwuSO3pWuJqRb0ydOC5/Imoev0lbGzjPzcGHkUl
         E/DUpmAneHOjhStIa8EpRJM3WyonqUdw4sSSJkLC8QqFkSsU762axL8TvymWddfpw7O2
         WwINlQXwB59DZ7geTCurF4Bfo2e5PEgydlhPqiyTkoWOqH8dNt2UZWXEHM8AeKUf0F9B
         KATspORUToseP7uHCl6Tbrc5Ywe+A4ZJ1DTT15VpMl/kvcBJyIhFsFOg6MYXnwT+IdxJ
         eOC+AEdX/PpF1Jpkyq4g027nDgAKC4EJan+vqkq5lLkkkM3UyS+Lkh33DOaITpIwelqC
         WJJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=gA9rZo6PdD24XHU33WPWzeBcvcuYbVgXgFQzpdX4hto=;
        b=XLjyi/Rl4U1ws26ClViOCmH+SgmRYPKDBOuFkmjSORqAVCdppS66fckSGisSDAHAxj
         jgfbfWBNjngwHcOim2833RHIsy2RhQ9QG6Z/7Wsvw8dhcH+oHpXhfGXziredNCrEHC+O
         xwTTo07c9M0nggs2O6ZjFhuLLyyggBTTidxf4UjfIrfe2HQGcbnZQh9jIRuiPJzo67Cp
         kJ34Y9G4Aacz1o1sBDsY592kzFuUQ+rkHu7EN+NDEsMcN/rmqCb+a8cbmLQmKwjJmgJh
         bkqh1KTInDpinfhEtVuuzxE1R6M6BtvDx0Zba/Ff9WpKbekmCbgpKPmrpkzi7XJYztfG
         GhNw==
X-Gm-Message-State: AOAM530FYu71/x4/V3PSDTL/rQ+q/+0odCdIVPcDXRi0Q/PB4SPGe+85
        YeP7zN3bU6VD88Y0dfrl+1k=
X-Google-Smtp-Source: ABdhPJz/IEljDJu+ZVXN+hlrsaVzXGeU4TrAXgGsnXmM0iXDLjH8bCv9nRLhhRzZ/eWJU29+3C7K2A==
X-Received: by 2002:a05:6830:1645:b0:606:fe3:fa21 with SMTP id h5-20020a056830164500b006060fe3fa21mr8142496otr.268.1652792082005;
        Tue, 17 May 2022 05:54:42 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e45-20020a9d01b0000000b0060603221281sm4835594ote.81.2022.05.17.05.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 05:54:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Tue, 17 May 2022 05:54:40 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Holger Brunck <holger.brunck@hitachienergy.com>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [v3 3/3] hwmon: (lm90) enable extended range according to DTS
 node
Message-ID: <20220517125440.GA3575490@roeck-us.net>
References: <20220517075738.16885-1-holger.brunck@hitachienergy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517075738.16885-1-holger.brunck@hitachienergy.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, May 17, 2022 at 09:57:38AM +0200, Holger Brunck wrote:
> Some lm90 compatible devices can operate in a extended temperature mode.
> This feature is now enabled if the property is set in the corresponding
> device tree node.
> 
> Signed-off-by: Holger Brunck <holger.brunck@hitachienergy.com>

For my reference:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> changes for v3:
>   - set config bit is property is set in DTS
>   - rephrase commit msg
>   - rename property
> 
>  drivers/hwmon/lm90.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
> index 1c9493c70813..3820f0e61510 100644
> --- a/drivers/hwmon/lm90.c
> +++ b/drivers/hwmon/lm90.c
> @@ -1707,6 +1707,7 @@ static void lm90_restore_conf(void *_data)
>  
>  static int lm90_init_client(struct i2c_client *client, struct lm90_data *data)
>  {
> +	struct device_node *np = client->dev.of_node;
>  	int config, convrate;
>  
>  	convrate = lm90_read_reg(client, LM90_REG_R_CONVRATE);
> @@ -1727,6 +1728,9 @@ static int lm90_init_client(struct i2c_client *client, struct lm90_data *data)
>  
>  	/* Check Temperature Range Select */
>  	if (data->flags & LM90_HAVE_EXTENDED_TEMP) {
> +		if (of_property_read_bool(np, "ti,extended-range-enable"))
> +			config |= 0x04;
> +
>  		if (config & 0x04)
>  			data->flags |= LM90_FLAG_ADT7461_EXT;
>  	}
