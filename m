Return-Path: <SRS0=HSB5=QZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A12C43381
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Feb 2019 15:58:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A8EA6217F5
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Feb 2019 15:58:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DHi5Q0QN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731210AbfBRP6c (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Feb 2019 10:58:32 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:43270 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730199AbfBRP6c (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Feb 2019 10:58:32 -0500
Received: by mail-pf1-f196.google.com with SMTP id q17so8767539pfh.10
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Feb 2019 07:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2Dj1YyaObEwmNKpjMLuak/yRVx3GevGQ7TCMbJNP1UM=;
        b=DHi5Q0QNOwNkIVN5+xI3C9cgPvB7vAZZ8fQB+pcrNIBd2vd+FX/5tVuUjUXdzskYiX
         16xavn78C2/LsTBkTqY/p1fktFwaR6G9Nh897l0raI2yZqIvDy0ZrJTUsiT++YUZHGRo
         9csqYiTVLlplVqqOQphpRBWnRdhMlnVGRSLfN+j8oWQ03+XE4TkTIru549Ch3dwQmkiG
         lKW6L3Yku4LNodq+AoukrQwLEuLV1h41fAzwwKGtrtnZsSZrsG64Pj1t831yOyFqc1g8
         tEgAStbPguSlvF5IaDH0aSLDhSKbArk1j+IvL5gy42SMkBQf5sSB3kIkPRKy1OwwLX+s
         HU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=2Dj1YyaObEwmNKpjMLuak/yRVx3GevGQ7TCMbJNP1UM=;
        b=nLlvlveO0zOuJgZtjN4z9cnMsajrgzsaq7MtFshoIWzfEyzLH4pNABXqcM11oTBSR9
         1zNJzI7udvT+zFmtBD41ZCpQ5UpBHg5drk+lYt+q/ipASun8MDA1n8Fkd+4lQdV6pfh2
         A9AA1IiWoRHEKbsDQTVuwmDCFap2sZbfgziRg/wiLFH6zIc/vDV0t8gpWWOnOyv9o4V2
         he3gcgZ83MqsEC+rq/Hf0u+BAznuxJq6mBObGs3zBJEtpL8JIG6xli2Ojat6VRVv/nG3
         tqmJysSgun5zhiIeuegWlsmYDW/MDBhcT2ytO7IYVdntsraiKPV/5ZWStG/WsCtVfeQ+
         TwpQ==
X-Gm-Message-State: AHQUAuaud9qTs0zBKAbaB2MWVqZ0gykoSJmWati7PKc1dzxmGqBzsJyq
        JSqcEzaCVJnagPY/lPRMSJQ=
X-Google-Smtp-Source: AHgI3IbmeXkJbFz4DpSiFjvOqmMnCendnQ/TPu3g3nleH4GvVZsOAX/pD4PV/cHAJ0QXrw/lwv9iXg==
X-Received: by 2002:a63:2c0e:: with SMTP id s14mr19705287pgs.132.1550505511341;
        Mon, 18 Feb 2019 07:58:31 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x2sm20493299pfx.78.2019.02.18.07.58.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Feb 2019 07:58:30 -0800 (PST)
Date:   Mon, 18 Feb 2019 07:58:29 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Vadim Pasternak <vadimp@mellanox.com>
Cc:     linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v1 hwmon] hwmon: (pmbus) Fix driver info initialization
 in probe routine
Message-ID: <20190218155829.GA31609@roeck-us.net>
References: <20190217174155.25829-1-vadimp@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190217174155.25829-1-vadimp@mellanox.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On Sun, Feb 17, 2019 at 05:41:55PM +0000, Vadim Pasternak wrote:
> Fix tps53679_probe() by using dynamically allocated "pmbus_driver_info"
> structure instead of static. Usage of static structures causes
> overwritten of the field "vrm_version", in case the system is equipped
> with several tps53679 devices with the different "vrm_version".
> In such case the last probed device overwrites this field for all
> others.
> 
> Fixes: 610526527a13 ("hwmon: (pmbus) Add support for Texas Instruments tps53679 device")
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> ---
>  drivers/hwmon/pmbus/tps53679.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.c
> index 85b515cd9df0..45eacc504e2f 100644
> --- a/drivers/hwmon/pmbus/tps53679.c
> +++ b/drivers/hwmon/pmbus/tps53679.c
> @@ -80,7 +80,15 @@ static struct pmbus_driver_info tps53679_info = {
>  static int tps53679_probe(struct i2c_client *client,
>  			  const struct i2c_device_id *id)
>  {
> -	return pmbus_do_probe(client, id, &tps53679_info);
> +	struct pmbus_driver_info *info;
> +
> +	info = devm_kzalloc(&client->dev, sizeof(*info), GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	memcpy(info, &tps53679_info, sizeof(*info));
> +

Good find, but why not use devm_kmemdup() ?

Thanks,
Guenter

> +	return pmbus_do_probe(client, id, info);
>  }
>  
>  static const struct i2c_device_id tps53679_id[] = {
