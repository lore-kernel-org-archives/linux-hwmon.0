Return-Path: <SRS0=ZqwK=VF=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BD2AC606C7
	for <linux-hwmon@archiver.kernel.org>; Mon,  8 Jul 2019 18:16:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2283A21852
	for <linux-hwmon@archiver.kernel.org>; Mon,  8 Jul 2019 18:16:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oo8vVHRq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728860AbfGHSQg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 8 Jul 2019 14:16:36 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46126 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728765AbfGHSQg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 8 Jul 2019 14:16:36 -0400
Received: by mail-pf1-f195.google.com with SMTP id c73so3324966pfb.13
        for <linux-hwmon@vger.kernel.org>; Mon, 08 Jul 2019 11:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rGSknTYNkI+tPGDzBnsKlAhpOjhRrQApg6BZ/O8aKGg=;
        b=oo8vVHRqi1mhxrXtAwEVMTw3cr4pkgRzMPM952HlF62QNFouRD3RzIlpwhp5q3Exjm
         EUOXfj8dH2qHkW3MvIS/bXhw8foxwFyt0WbGokCdSWz8RluREjWFxyVH9eAvJtoZBEbo
         FShJ5JbBVetgxoWexT32zhcWpXyteYB1QHap/5e0syHy6KWDMozsj7X0qvN1zAB4uwOq
         HGuH9iwyo1a91+YIpUCLPosPIra/q5sMfUdNarmh5wswldZkWyBoWKuA2xBP78/UgHN0
         r0LQ+ucxockUZ4A+fKebohzbnfcdbdOS3jtjo3rI3ye+Kj/tvTuRr32nE8v7th6Ejw94
         XjTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=rGSknTYNkI+tPGDzBnsKlAhpOjhRrQApg6BZ/O8aKGg=;
        b=sBSCj9SYyBCUs+suhuQI4kjGJgZJe46oa49PENewDR5NkYfQX01yqkqzWPC908r5PP
         r6fJawqFxUFWp9in1xJh8dk802QfRGtKaQBqzlgOZeo5VCmWe6pe2/FtuPu11F1h9GUK
         8lJZO7WvwyuQazwvQ/nOGBQZu6ZpVVg1bAnT5WRlr12TE6xURcetwNQW1CPp1wWcrVZ+
         cdqmpUwSDyIuueB1gqIf984thDOR+VEBYRCBVZjiboFqmemH7WhUzk6mx25/16ISfmcg
         45oUvZDKGN1JyHRPbCMv4g1GmPrIGSoBr5+6LNumQKgPPH3DqkFpHP3bxG7lZdcyycGC
         DFVw==
X-Gm-Message-State: APjAAAWiMZSKJIOQH9baUlEuUdwyni03mVkA9//2dMay6ZYQhReGKpJx
        cYTZ4pkXLRhZD2B3KUQbzZI=
X-Google-Smtp-Source: APXvYqy0vblH4HtlMCuX6Jnm4QRl7fFhT2y7gUQTOztTV0eHM7/z17a5EDxraMHpMuvsDKAhBej7vA==
X-Received: by 2002:a17:90a:bf02:: with SMTP id c2mr27605801pjs.73.1562609795652;
        Mon, 08 Jul 2019 11:16:35 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s193sm19915020pgc.32.2019.07.08.11.16.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jul 2019 11:16:34 -0700 (PDT)
Date:   Mon, 8 Jul 2019 11:16:34 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: ina3221.c: Add of_node_put() before return
Message-ID: <20190708181633.GA15102@roeck-us.net>
References: <20190706132130.3129-1-nishkadg.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190706132130.3129-1-nishkadg.linux@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Jul 06, 2019 at 06:51:30PM +0530, Nishka Dasgupta wrote:
> Each iteration of for_each_child_of_node puts the previous
> node, but in the case of a return from the middle of the loop, there is
> no put, thus causing a memory leak. Hence add an of_node_put before the
> return.
> Issue found with Coccinelle.
> 
> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>

Applied. For future patches, please don't put source file extensions
into the subject line.

Thanks,
Guenter

> ---
>  drivers/hwmon/ina3221.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
> index 55943b4dcc7b..0037e2bdacd6 100644
> --- a/drivers/hwmon/ina3221.c
> +++ b/drivers/hwmon/ina3221.c
> @@ -713,8 +713,10 @@ static int ina3221_probe_from_dt(struct device *dev, struct ina3221_data *ina)
>  
>  	for_each_child_of_node(np, child) {
>  		ret = ina3221_probe_child_from_dt(dev, child, ina);
> -		if (ret)
> +		if (ret) {
> +			of_node_put(child);
>  			return ret;
> +		}
>  	}
>  
>  	return 0;
