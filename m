Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21D0FC07E9D
	for <linux-hwmon@archiver.kernel.org>; Sat, 24 Sep 2022 14:33:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233075AbiIXOdQ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 24 Sep 2022 10:33:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231670AbiIXOdP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 24 Sep 2022 10:33:15 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78EA49E0FF
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Sep 2022 07:33:14 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id q15-20020a17090a304f00b002002ac83485so2904555pjl.0
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Sep 2022 07:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date;
        bh=bE9yCYRLIbQIXG+lCXwJjm3R6CpYeCBg1j4cRkac160=;
        b=VS4d3cCZLtufmY3xta2fruf4ilk4GoNhu+PdXyfDrysd5TrjhZ0d2dsOEuQGhfUj2E
         ivBtbejodrqwLu5y/zx3S6fQQqm5IkTkXmf2BjOl+2Te/uieOMORO9bOaq62Rjs+v29B
         vKvhPRMUm5Pp7DpBo+ERxLZiy8xXWezqRc0P+LIT6t9OgCFdjWO01SPYs5P4vO0+QivL
         n9hnE/TjrwmvY4+KiyV8Ue8dK3WZk6NhzUBvMm2Dlwbc5fkWGv5z41fZTZC3u2Pyf2GZ
         8Ik/6sBUcialDvRi8l0hyhiFyW5On4ye9dCog9/1c/g9RQC8UUQHmoiCmk4IAFvGd+OF
         MXCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date;
        bh=bE9yCYRLIbQIXG+lCXwJjm3R6CpYeCBg1j4cRkac160=;
        b=Tuxp/PyMNwHe9tGPCV8w9KDdBXJP14ebvLklXu4CaiKLh0QxPsp5ubvtMEMXjOwLT2
         2Nwzqnbq2+e/Ykw4GGLoBEIPYag57xdeOkZtMC5C7jkpnbb/QkKXAQoOEH6Q2rh9YZgq
         YuP8FdCDq8fzennXbH5gQNkDOyNYFIOgc1zPkmGm/r0LF8JvRHOs2NK/i7mKCseGj1I/
         EqI54tI2yEzoDh6husZsrmSAdg2MHx7Y3JRd6ke6nIfoHb2Ao7gG5TZknmg+e0WqulYm
         W/bLkOXB9ZSo8Wn/X1G81/S2CoG359zEsdn0UYGdk7p4sIxLTIsmTXRZq/EgTuI+kW5E
         +FWQ==
X-Gm-Message-State: ACrzQf321Z+45UgU7Vas0QvasA4pM2EhNIFQr4BGZcIbDhHi/g/uk4xL
        9tzQbTNVSj2fwPYlURHBqxU=
X-Google-Smtp-Source: AMsMyM7EzTHNbzoO1lLZpltgp8tBY2UeUP17+a4xeNstJje5BcpAo/I8dm3yKpjvXYwf4ZnSKV7tCQ==
X-Received: by 2002:a17:902:7294:b0:178:a2be:ac13 with SMTP id d20-20020a170902729400b00178a2beac13mr13488636pll.59.1664029994049;
        Sat, 24 Sep 2022 07:33:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bb11-20020a170902bc8b00b0016c57657977sm7894215plb.41.2022.09.24.07.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 07:33:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 24 Sep 2022 07:33:12 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Li Zhong <floridsleeves@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com
Subject: Re: [PATCH v3] drivers/hwmon/adm9240: fix data race in
 adm9240_fan_read
Message-ID: <20220924143312.GA2299605@roeck-us.net>
References: <20220924001751.1726369-1-floridsleeves@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220924001751.1726369-1-floridsleeves@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Sep 23, 2022 at 05:17:51PM -0700, Li Zhong wrote:
> In
> adm9240_read()
>   adm9240_fan_read()
>     adm9240_write_fan_div(),
> 
> it assumes that the caller of adm9240_write_fan_div() must hold
> data->update_lock. Otherwise, it may cause data races when data is
> updated by other threads.
> 
> Signed-off-by: Li Zhong <floridsleeves@gmail.com>

Applied.

Thanks,
Guenter
