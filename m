Return-Path: <SRS0=c1px=3D=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0111AC33CB1
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jan 2020 14:12:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C5FD024672
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jan 2020 14:12:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dJlHb1/y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728755AbgANOMn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 14 Jan 2020 09:12:43 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39538 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725904AbgANOMn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Jan 2020 09:12:43 -0500
Received: by mail-pf1-f196.google.com with SMTP id q10so6643277pfs.6;
        Tue, 14 Jan 2020 06:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MRgBvCtjRNlYz6e9qjURgTK4XgDrJzyI0jj9xZ4LvTc=;
        b=dJlHb1/yR4hekA5crCHMwlnpiKYsK17WvxA6GbktTtF7C3RsqqzancL5DoycJSejlq
         APjYrPscu//sYsxdrdsq8PHBUkk6AbDYl5oZ8mPOCR58EyVNvrJcV4V0CC5ThpjGqx2S
         bBHtQvE4McD41TiFYJ6Cd5b7rLaVTlw14fy+8zKsvH2z6HO3L6PupgL1aZ9LVRnszR6y
         jfa0H1bIMvfttVztDDMjYAXuuOwgwGJdaGlJ+sQATK+4CLqoNiIbft1crP6Uhu6XyXJZ
         m1TBtDDuhc4CqxmjvBASywC8tESrYa5Zeu705EkjEtoNlMkGA3dGweSu/uXk1slHX/p7
         ioaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=MRgBvCtjRNlYz6e9qjURgTK4XgDrJzyI0jj9xZ4LvTc=;
        b=nzdGLfztDOHK3LDXWBWCMpKzJHziYnsIijxPPvlCYOyHlWGeAORyQWC3lbPLjgNaKu
         NN/Jcg7+JzRZFvaRSOx5s5J0p/nsqehB0WgCKA7ILQyNvrdlZQHFqNg/C/Q7YFXrdTRn
         GuNU57jTsIx1uiisOO1aVp/YlV8LYadzLgajz7fgNPem5wx8B4oV3kMA5g5JWT0Cisw0
         wC4UxI+00muSx/uyexcwzVuTDO1h8fSOfRd752he5PRpE5j3nMJWiW2/uTY6D6v9zoug
         SEe8Jw5njoQEPH3OwaGIc0fMi30ifZIzDDR6bqK9uaGBaIGuX8ny22j1wVsJsidN6hTT
         E4jA==
X-Gm-Message-State: APjAAAV9W+tp1WeAUfLvql8iApsZeRvoLcqAYa5p+L1GGBaAJ3pOSxHk
        s9BtBAqqtET28GnepKUcKmo=
X-Google-Smtp-Source: APXvYqzZMBywXhuDjnf1dNp/5C/bgOFlEk20gy7PJ8mqOPsagytkZhMfyVlMFTrgG3LvCligS2EdNw==
X-Received: by 2002:aa7:9629:: with SMTP id r9mr25712036pfg.51.1579011162152;
        Tue, 14 Jan 2020 06:12:42 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t63sm18550655pfb.70.2020.01.14.06.12.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 06:12:41 -0800 (PST)
Date:   Tue, 14 Jan 2020 06:12:40 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Beniamin Bia <beniamin.bia@analog.com>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] hwmon: (adm1177) Fix adm1177_write_alert_thr()
Message-ID: <20200114141240.GA16302@roeck-us.net>
References: <20200114055125.ro5slro6zewr56tx@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200114055125.ro5slro6zewr56tx@kili.mountain>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Jan 14, 2020 at 08:51:25AM +0300, Dan Carpenter wrote:
> There is a reversed condition so the adm1177_write_alert_thr() function
> doesn't update "st->alert_threshold_ua".
> 
> Fixes: 829091f9c56c ("hwmon: (adm1177) Add ADM1177 Hot Swap Controller and Digital Power Monitor driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

The fix was folded into v4 of the series, so I took that.

Thanks for reporting!

Guenter

> ---
>  drivers/hwmon/adm1177.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/adm1177.c b/drivers/hwmon/adm1177.c
> index 1f2ff7a29306..d314223a404a 100644
> --- a/drivers/hwmon/adm1177.c
> +++ b/drivers/hwmon/adm1177.c
> @@ -63,7 +63,7 @@ static int adm1177_write_alert_thr(struct adm1177_state *st,
>  
>  	ret = i2c_smbus_write_byte_data(st->client, ADM1177_REG_ALERT_TH,
>  					val);
> -	if (!ret)
> +	if (ret)
>  		return ret;
>  
>  	st->alert_threshold_ua = alert_threshold_ua;
