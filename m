Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2108AC4332F
	for <linux-hwmon@archiver.kernel.org>; Thu,  2 Nov 2023 03:08:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232884AbjKBDI5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 1 Nov 2023 23:08:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjKBDI5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 1 Nov 2023 23:08:57 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2255101;
        Wed,  1 Nov 2023 20:08:54 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3b2ea7cca04so292065b6e.2;
        Wed, 01 Nov 2023 20:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698894534; x=1699499334; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FDyUdMXxOZyxGka8nH6miMPNn2W5hAmBJES98BuVD/s=;
        b=j24z/zUFO4sJggHkZicSnrP9HnesHh1b4d+1sPk5Q17Km0DOXiM5D7SFWGP6+k8IRX
         qxgnvrZ3NPakDKZZuxxQJ6GFH5dKmA3kEMsYWum70WwIHEvLqZzTjdtKy1W/7aYGciC6
         GB+PWxvJ9M5UJ1iQd31Y5NXy8QzpPFy4I+5g+ODss957lkYpvcV59FxZneKvijs5XtCf
         1gXdu/JPilZsH032u1cjAgUdAw59P9m4eX4LSQslj28h8zjNwGV8nDg3oavxDmojujR/
         hTSynyxwUtc6cKmXYN4imD1HK6xyZfIgSTAOehEYIG6VEKhnYCxxqx6ZR9Oh08xwnOdC
         rmWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698894534; x=1699499334;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDyUdMXxOZyxGka8nH6miMPNn2W5hAmBJES98BuVD/s=;
        b=LO1M/m4ePTbmFYLVj+wMtwZMwIA0xanZswKFGwQPwx2GUr7+OLdrDpUnrW940h5K8h
         Ckw6OC9iLkNM7824N/FR2bn2aYEj+KuPTplqYg9Zjzp8S5topK/QP8Mq84BkmmAwUU9I
         jzLNhm+mVmBeyYU9wTKFollq4qietDm8ci8xD7Zy3rnUnW/hnskvm1lTRPNnZGStjxnN
         uhc5duxNn0qWDrjLN5Mel+r4vQt2ePW/BajV4XxtllOxSLzBzPaGUa0Pi7MJ0fH8nqbE
         bUsl2ptns3I06Dd6LH6HtG3/PasjPhrPbuYT0XJiHbaigrk3bEy2iqm8kWFeSdaEr8VT
         J4YA==
X-Gm-Message-State: AOJu0Yx9uxt+O9Z/y4eKhNekyhxdqbdDZLmf0Rsnd8gz1vC5aw+TL8h/
        zYKHwjB+xJisnBmwyGeNe3X3OvMFE30=
X-Google-Smtp-Source: AGHT+IFSJoRUgQ/5MywXb/2S6QGk99xonwcFvX+ypA5VRZJuvCPHBCTd9pVbyqGuafFGwh10+y/m9g==
X-Received: by 2002:aca:1214:0:b0:3ae:1446:d48b with SMTP id 20-20020aca1214000000b003ae1446d48bmr17972225ois.3.1698894533827;
        Wed, 01 Nov 2023 20:08:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u37-20020a056808152500b003afe5617691sm421510oiw.12.2023.11.01.20.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 20:08:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 1 Nov 2023 20:08:51 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     Antoniu Miclaus <antoniu.miclaus@analog.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] hwmon: ltc2991: Fix spelling mistake "contiuous"
 -> "continuous"
Message-ID: <fff2742f-6e90-4d7a-b9e5-365429c57f4d@roeck-us.net>
References: <20231031084240.2148339-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031084240.2148339-1-colin.i.king@gmail.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Oct 31, 2023 at 08:42:40AM +0000, Colin Ian King wrote:
> There is a spelling mistake in a dev_err_probe messages. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Applied.

Thanks,
Guenter
