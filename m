Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77731C433EF
	for <linux-hwmon@archiver.kernel.org>; Mon, 16 May 2022 20:57:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348856AbiEPU5Z (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 16 May 2022 16:57:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349394AbiEPU4n (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 16 May 2022 16:56:43 -0400
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EA971277A
        for <linux-hwmon@vger.kernel.org>; Mon, 16 May 2022 13:31:19 -0700 (PDT)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-f16a3e0529so11387382fac.2
        for <linux-hwmon@vger.kernel.org>; Mon, 16 May 2022 13:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WHlVOreJLN8zSzh0VqwYCLU1FX2dhpuOlqQlctUt3Zk=;
        b=cZp6fgxwbqLJ532mmytzh4M67JFhv689SomjJO7drQu7VJI40WPALuqTUxv/d8OT1R
         aa4ws8cJvYg3QGN3ct/3gFldcmGWfC/URVZKNHukvgWsdV6jfAHAoTKWD0QGlWSiZVaE
         Rni2CQsg4yIqC8BPlgRckXMTbC6xnHe55tcYGC08z/5LJ9T/w2FYOcN3FdMx9N8BFxsy
         VETkF9EEWy+tPFjjNrifJNvHx/Aiw7vH7bWDLdyoykqtSqN/+xIbPnJkfMM4ONv+BMDS
         du1GamokdcvId7f1i9UysB9dacYLdzqnY9X17fwbYt46C5/3mrCOZTThojtUr+p9BDbl
         4ZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=WHlVOreJLN8zSzh0VqwYCLU1FX2dhpuOlqQlctUt3Zk=;
        b=2JKyMvrV1mhGOZ/I8fWQGjeSdDWCR4hKYLYnhBg6O3+xyyyDfKhLZ3yB3vIyNMtzFT
         biisiPK58Ht8Y9dE4qKED9F2mCni6W6vrmMLvBSJnPr7PfYAI8UHzpoNDpe0iu786vHd
         aFNm/T38ik4DTNMf6zT69gpv4AI9WkuLb2QDc6DBRQ0EFy0Ru7DwcmiMC9pJzYQ9XyEC
         1tAmTYmm7peDySsWflDt0U4tdhmyiEaovreaC3TRovhsAgAutZ17uFFHam7O2E92avsg
         YTxo/YVZFvtWiDlJmpdyfRxl38G0XHDWmPll5RrvHEu5rBSQ2EEi78T0Izi5TUqztyuD
         7ySw==
X-Gm-Message-State: AOAM530l0455DUyDnUvZ8xvDrd9mq/YH40n8dGSKy8cKdRSdwZbGvttG
        hfH6nvmDvCAXzi1U2KIjYfX5WbyMTqAmnA==
X-Google-Smtp-Source: ABdhPJyj9ThtrqeZOXuzc/dnEQ6v9rzB1hH1ShdZidqbiwQE9y0TJrm4t0XO+eV+S0EgsU8oiZ6a6A==
X-Received: by 2002:a05:6870:798a:b0:ee:35da:33da with SMTP id he10-20020a056870798a00b000ee35da33damr16155604oab.83.1652733077191;
        Mon, 16 May 2022 13:31:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b206-20020aca34d7000000b003266a9846c0sm4153427oia.17.2022.05.16.13.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 13:31:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 16 May 2022 13:31:14 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Holger Brunck <holger.brunck@hitachienergy.com>
Cc:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>
Subject: Re: [v2 2/2] driver/hwmon/lm90: enable extended range according to
 DTS node
Message-ID: <20220516203114.GA4080547@roeck-us.net>
References: <20220510080900.22758-1-holger.brunck@hitachienergy.com>
 <20220510080900.22758-2-holger.brunck@hitachienergy.com>
 <692d5ac7-840f-49da-c06a-c2b0e0e6cf8c@roeck-us.net>
 <DB9PR06MB7289A0505D42DC7151BD8517F7CF9@DB9PR06MB7289.eurprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB9PR06MB7289A0505D42DC7151BD8517F7CF9@DB9PR06MB7289.eurprd06.prod.outlook.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, May 16, 2022 at 08:01:34PM +0000, Holger Brunck wrote:
> > > diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c index
> > > 1c9493c70813..6cdbcfab9f20 100644
> > > --- a/drivers/hwmon/lm90.c
> > > +++ b/drivers/hwmon/lm90.c
> > > @@ -1707,6 +1707,7 @@ static void lm90_restore_conf(void *_data)
> > >
> > >   static int lm90_init_client(struct i2c_client *client, struct lm90_data *data)
> > >   {
> > > +     struct device_node *np = client->dev.of_node;
> > >       int config, convrate;
> > >
> > >       convrate = lm90_read_reg(client, LM90_REG_R_CONVRATE); @@
> > > -1727,7 +1728,8 @@ static int lm90_init_client(struct i2c_client
> > > *client, struct lm90_data *data)
> > >
> > >       /* Check Temperature Range Select */
> > >       if (data->flags & LM90_HAVE_EXTENDED_TEMP) {
> > > -             if (config & 0x04)
> > > +             if (config & 0x04 ||
> > > +                 of_property_read_bool(np,
> > > + "onsemi,extended-range-enable"))
> > >                       data->flags |= LM90_FLAG_ADT7461_EXT;
> > 
> > Maybe I am missing something, but I don't see the matching configuration
> > change. Specifying the flag in devicetree only really makes sense if the chip
> > configuration is changed accordingly.
> > 
> 
> what is confusing here for me is that in the current code we have
> "if (config & 0x4)" and if this is true we configure the flags accordingly. But
> the bit 0x4 in config is nowhere set in current code. Therefore also the flag is
> never set. Or do I miss something? 
> 
The idea is to pick up the configuration set by the BIOS/ROMMON.

> I am asking because if my assumption is correct I would replace the current
> (never matching) check to the new property:

It does match, if set by the BIOS.

> if (of_property_read_bool(np, "ti,extended-range-enable")) {
>   config |= 0x4;
>   data->flags |= LM90_FLAG_ADT7461_EXT;
> }
> 
> Is this ok for you?
> 
Looks ok at first glance, though of course I'll have to see the entire
patch.

Thanks,
Guenter

> Best regards
> Holger
> 
