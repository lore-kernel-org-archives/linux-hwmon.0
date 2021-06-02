Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17BF3C4708F
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Jun 2021 12:36:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E8A2C6100B
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Jun 2021 12:36:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbhFBMid (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 2 Jun 2021 08:38:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbhFBMic (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 2 Jun 2021 08:38:32 -0400
Received: from office2.cesnet.cz (office2.cesnet.cz [IPv6:2001:718:1:101::144:244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1705FC061574
        for <linux-hwmon@vger.kernel.org>; Wed,  2 Jun 2021 05:36:50 -0700 (PDT)
Received: from localhost (ip-78-45-210-72.net.upcbroadband.cz [78.45.210.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by office2.cesnet.cz (Postfix) with ESMTPSA id 8D44140006E;
        Wed,  2 Jun 2021 14:36:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cesnet.cz;
        s=office2-2020; t=1622637407;
        bh=Mh25O1JGXS5xhvHc2Dj3HAo4hupTmTfHhhhMVaWuzd0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=IDXunYWiTBsypxkgK+bVtOTizphzffG1kQ8urDra83cp/sYQXHB6iV56WxL5ChEuH
         ntKtU9Rek60CuWMH5JJsN0LL7gD+AeMjm1Wg1TRjwZGdtWuUOoUBIoEJvTe261TDLr
         el+f3KNgDidCL8WYF09N8o+BvBMc9AZipsqtJmEU9LbwBNjzIPz13UeA+56ioRhMGS
         dIR9lQ+jqH2IFflJ1QpKKzBSAxL0QhWXqgtausHRJe8lkaGRb3JWvjgMS4lrdFtkbx
         sSFpE4pgeJJq8HDGVr4h/9LUw4cWd9FQ1yw3Gv4jmmXpF/RGjZhxbNkORHTs8DQQRG
         r9mcKtxjWvWQQ==
From:   =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     <linux-hwmon@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>,
        <kubernat@cesnet.cz>
Subject: Re: [PATCH 2/7] hwmon: (max31790) Report correct current pwm duty =?iso-8859-1?Q?cycles?=
Date:   Wed, 02 Jun 2021 14:36:47 +0200
MIME-Version: 1.0
Message-ID: <ac3e8a59-57ed-44ff-9468-69eb0cdf560e@cesnet.cz>
In-Reply-To: <20210526154022.3223012-3-linux@roeck-us.net>
References: <20210526154022.3223012-1-linux@roeck-us.net>
 <20210526154022.3223012-3-linux@roeck-us.net>
Organization: CESNET
User-Agent: Trojita/unstable-2020-07-06; Qt/5.15.2; xcb; Linux; 
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On st=C5=99eda 26. kv=C4=9Btna 2021 17:40:17 CEST, Guenter Roeck wrote:
> The MAX31790 has two sets of registers for pwm duty cycles, one to request
> a duty cycle and one to read the actual current duty cycle. Both do not
> have to be the same.
>
> When reporting the pwm duty cycle to the user, the actual pwm duty cycle
> from pwm duty cycle registers needs to be reported. When setting it, the
> pwm target duty cycle needs to be written. Since we don't know the actual
> pwm duty cycle after a target pwm duty cycle has been written, set the
> valid flag to false to indicate that actual pwm duty cycle should be read
> from the chip instead of using cached values.
>
> Cc: Jan Kundr=C3=A1t <jan.kundrat@cesnet.cz>
> Cc: V=C3=A1clav Kubern=C3=A1t <kubernat@cesnet.cz>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Jan Kundr=C3=A1t <jan.kundrat@cesnet.cz>

Cheers,
Jan
