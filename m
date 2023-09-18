Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AA8CCD37B0
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Sep 2023 18:53:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbjIRSxb (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Sep 2023 14:53:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjIRSxb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Sep 2023 14:53:31 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AE6BF7
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Sep 2023 11:53:26 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-79536bc6697so165084839f.1
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Sep 2023 11:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695063205; x=1695668005; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RnjOIX5GhTu/FAQsXHmEi2zu0Z1iXJHIuyieCH7XltI=;
        b=X6jk/yYoo9hFXc3EI+S/mfCHG9AnC7ml+bOi0lYkW59ePBCE+MzfoV3Ec63QDxji25
         H14GEbBhuHl0abSPQoz4C1+xgrjYmtWfDqfgFI9qaHR4gk5sz8uY2fBeQLjIe4THYuLy
         RirzL+329pzzYWmiVSb3uVKLQYmdMBkg3pc82yYo/guUTi3GvhKfwI5917H9b0yMUUNU
         QoYTMl36MyUYiq2/C7z8udjw9FpMJdNFn2Shd/1XAWT6v4AtdFGDdc8tA1kKTDYmaDki
         EgjVlmknc0nkRWBoczTyaL+YYWdfgaIVnn8hVOIh6JdPclIUINqbgHLZHomZJgkYJQcP
         p8Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695063205; x=1695668005;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RnjOIX5GhTu/FAQsXHmEi2zu0Z1iXJHIuyieCH7XltI=;
        b=eaBcI51XQON+IhQ64nARIIocfjI4JACuQI3Y215+sQ/YvanZUixC2qVoobDXIX3xEv
         3dzGc1yUYu4Z554w3RX1qklWpjbU6+XPLud3Od+Hcew/ICE8yAiqgwDqjz82cZOrVRab
         katFrGXCY3ZxGhoYMjfSOvialWY8GACEMpFWYAV0xi1mI4FzHyc7/ol1lA7svBcUpu+y
         PA8gbJoqoXsi944uaBlZcgSVOX0Jr4eS2292rcyN0ODfi8tyJiMeXKQZuJWFIgJoWEji
         4QXRvOMeOyrnDBXGCMfklFvGr94gnfGdLFC9MuYeweJ3/5abSl0meBKWBPdfxUcNhe2v
         ABxQ==
X-Gm-Message-State: AOJu0Yxe0KrlZeE6D5wjw8lRe3hDrz3dTLI6E3S8mChKexxyRM+koLXU
        cLrZ49UqPTbPLE3e4U+PCjkhVmXRWY0=
X-Google-Smtp-Source: AGHT+IF9jtO/oofHNA0zHNS7RRsbSH4a2FPStMfVOpKzqpsAkboele06mpV17Nk7jSrnAZwi7tg5Ig==
X-Received: by 2002:a05:6602:1cd:b0:790:a211:b95a with SMTP id w13-20020a05660201cd00b00790a211b95amr10723091iot.4.1695063205331;
        Mon, 18 Sep 2023 11:53:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c19-20020a02a613000000b0042bb03d3a2esm2891180jam.96.2023.09.18.11.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 11:53:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 18 Sep 2023 11:53:23 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ahmad Khalifa <ahmad@khalifa.ws>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Doug Smythies <dsmythies@telus.net>
Subject: Re: [PATCH] hwmon: (nct6775) Fix non-existent ALARM warning
Message-ID: <e12a84f5-e5d1-495f-98c9-25cfbb889c23@roeck-us.net>
References: <20230918184722.2033225-1-ahmad@khalifa.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230918184722.2033225-1-ahmad@khalifa.ws>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Sep 18, 2023 at 07:47:22PM +0100, Ahmad Khalifa wrote:
> Skip non-existent ALARM attribute to avoid a shift-out-of-bounds
> dmesg warning.
> 
> Reported-by: Doug Smythies <dsmythies@telus.net>
> Closes: https://lore.kernel.org/linux-hwmon/ZQVzdlHgWdFhOVyQ@debian.me/T/#mc69b690660eb50734a6b07506d74a119e0266f1b
> Fixes: b7f1f7b2523a ("hwmon: (nct6775) Additional TEMP registers for nct6799")
> Signed-off-by: Ahmad Khalifa <ahmad@khalifa.ws>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/nct6775-core.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
> index 02a71244fc3b..b5b81bd83bb1 100644
> --- a/drivers/hwmon/nct6775-core.c
> +++ b/drivers/hwmon/nct6775-core.c
> @@ -1910,6 +1910,10 @@ static umode_t nct6775_in_is_visible(struct kobject *kobj,
>  	struct device *dev = kobj_to_dev(kobj);
>  	struct nct6775_data *data = dev_get_drvdata(dev);
>  	int in = index / 5;	/* voltage index */
> +	int nr = index % 5;	/* attribute index */
> +
> +	if (nr == 1 && data->ALARM_BITS[in] == -1)
> +		return 0;
>  
>  	if (!(data->have_in & BIT(in)))
>  		return 0;
