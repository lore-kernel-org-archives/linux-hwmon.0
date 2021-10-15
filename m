Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D6A2C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 15 Oct 2021 22:56:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0BF2D6105A
	for <linux-hwmon@archiver.kernel.org>; Fri, 15 Oct 2021 22:56:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243407AbhJOW6b (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 15 Oct 2021 18:58:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243393AbhJOW6a (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 15 Oct 2021 18:58:30 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD21AC061570;
        Fri, 15 Oct 2021 15:56:23 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id t4so15151216oie.5;
        Fri, 15 Oct 2021 15:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NZPab106rGZWn9b7GulYndOOMtprW0R2cy1kKf22OOc=;
        b=lFdQoUOO5tgGxI9Xdzl/rj9TwtuFD0nsRXS2BsI4qf5qNhit+fZu7NcqqddLIIIRFc
         uXuXP6Y1JJ5rrEte8dFB5ylMm5j9f64TiHteL5xCGQnERSk0zAI802y2gjfTBdyzPxPt
         dgKpIpdlxrdGgjMG8JhrTbIcU9X1PoR/jsTYfSIs5BWq5MQFr4RTx/klJdHhn0cl1vLE
         qriH9McrDe9FjCfgxiDBo2oVIuP27Po/iO/z9ps8syx6uu6ZIUzmMfWlT8RSbC+wSbbg
         jZhw8QK4OhXMK3bMXfR2/zC800UhXyfXwS1PbORC3exVthsToH+Pl+drdfxqUTwDYpcG
         uOwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=NZPab106rGZWn9b7GulYndOOMtprW0R2cy1kKf22OOc=;
        b=5/282zVHda4NXq3H6zUVdrBH0vXuhkZvrWlJc3B5HeYPpQqaEo8LBLz7gnQtGuXfTG
         hoPsqtgLqpZlGtYMhORMBGhYmvo5ZL6q0RvsQ8clFdXaFgjDkAjWzBYNnmygpIyl8WgT
         51+5b49XSLGLfl+IpcwY1kEUa5TqjUkL7TJzZRBFUcnhT0gh78+y2RY1YJ0AjW9E3PYn
         NsBeWluKPGQqqy040qiAPEP7l4YW+O5Jfy0uVL3UzBpaCHHpXSEE7B8ayZk6K+GXyAVE
         Qk2AEV7m+BP+EutoDwxvOXc8aP3qq1ytsYYSrR7ouQ5aVNxnDcq2aSZjIliMFZK9xTA7
         PvnQ==
X-Gm-Message-State: AOAM530kmATVIU9QIvZwdnpgD0WYV1492r/H/K+LuzAdx9954cc8NNI0
        Au2dS9f/I1vQ+BBSDo52iwA=
X-Google-Smtp-Source: ABdhPJy9WqXB+iHeF2Bqi5mzp3oJyIxm3l/kCFGKYd4qLefhetscE7DROgUuJxHGJSGjMJlDiY77yg==
X-Received: by 2002:a54:4401:: with SMTP id k1mr10530803oiw.25.1634338583281;
        Fri, 15 Oct 2021 15:56:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y4sm1440702oix.23.2021.10.15.15.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:56:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 15 Oct 2021 15:56:21 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Krzysztof Adamski <krzysztof.adamski@nokia.com>
Cc:     Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 8/9] hwmon: (tmp421) ignore non-channel related DT
 nodes
Message-ID: <20211015225621.GA1486145@roeck-us.net>
References: <cover.1634206677.git.krzysztof.adamski@nokia.com>
 <8e9e332b18dc2cf545f8e8255157e408d356f916.1634206677.git.krzysztof.adamski@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e9e332b18dc2cf545f8e8255157e408d356f916.1634206677.git.krzysztof.adamski@nokia.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Oct 14, 2021 at 03:11:02PM +0200, Krzysztof Adamski wrote:
> In case the DT contains some nodes not describing the input channels,
> ignore them instead of exiting with error.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski@nokia.com>

Applied, after the usual fixup.

Guenter

> ---
>  drivers/hwmon/tmp421.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/hwmon/tmp421.c b/drivers/hwmon/tmp421.c
> index 2e20c558fcb0..493a24cdfca2 100644
> --- a/drivers/hwmon/tmp421.c
> +++ b/drivers/hwmon/tmp421.c
> @@ -414,6 +414,9 @@ static int tmp421_probe_from_dt(struct i2c_client *client, struct tmp421_data *d
>  	int err;
>  
>  	for_each_child_of_node(np, child) {
> +		if (strcmp(child->name, "channel"))
> +			continue;
> +
>  		err = tmp421_probe_child_from_dt(client, child, data);
>  		if (err)
>  			return err;
