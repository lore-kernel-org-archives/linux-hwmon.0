Return-Path: <SRS0=jE+A=ZO=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA651C432C3
	for <linux-hwmon@archiver.kernel.org>; Fri, 22 Nov 2019 05:53:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 73CB320672
	for <linux-hwmon@archiver.kernel.org>; Fri, 22 Nov 2019 05:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1574402034;
	bh=ZFLASfdovryR7LiQczr3/sQr5TcaQLVbPu/4tYd/oKU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=Th3GBHg3dXWgWsfdAwHqsr4sLtP5XbBeXV/T3X7+Z4Sk+6VnFXVgSpX4hLxxphtH0
	 c0NkqejXo87/ZGzcShIN6yEi3ZkWn0n/6Orok38JrQJSbHR4tT++RXpiGPQv2o3o7V
	 QhBm2QBkhWcVx53KNPsR9X/PxMC2OsD5nyOsBVdc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727874AbfKVFxs (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 22 Nov 2019 00:53:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:59812 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728894AbfKVFxq (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 22 Nov 2019 00:53:46 -0500
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AA10C20672;
        Fri, 22 Nov 2019 05:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574402026;
        bh=ZFLASfdovryR7LiQczr3/sQr5TcaQLVbPu/4tYd/oKU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QquYUjLfoTKdsrZ7MGtb3zHo/ZcZ4eCgYnavZ2KTeAXwgXTlanJiQeZGwbOa/WSsk
         eu/fGao9IahHDtq0K3z+JCGsgxxJ9UQrrsT9x6oTE3671lv6kdNaYHGs+WGyHiawdv
         i1/Xo+JaZO4wL7Yqf8jtDKF3LcQbDBL07Y/4QpWI=
Received: by mail-lf1-f49.google.com with SMTP id f16so4565818lfm.3;
        Thu, 21 Nov 2019 21:53:45 -0800 (PST)
X-Gm-Message-State: APjAAAWSq1ftPLIjXsXF254B0iV6JsiIEi0lu1VOfZwznTNNVLNCaNgt
        4cHkeQojyh5CMCPxzHWoandg0wNuc7UqO4IWHCE=
X-Google-Smtp-Source: APXvYqxWlWvyv7M1PttJXoThDFMC3mJKD4wDrzEDT/AI63x858kL8RmqFmef/OrVPWtH2YgBq5PxUJwQ50uKJsXNy+s=
X-Received: by 2002:ac2:51b5:: with SMTP id f21mr10474788lfk.159.1574402023874;
 Thu, 21 Nov 2019 21:53:43 -0800 (PST)
MIME-Version: 1.0
References: <20191120134153.15418-1-krzk@kernel.org> <e93c7c7e-dac7-8c8d-c68a-edaa9106d6ac@roeck-us.net>
In-Reply-To: <e93c7c7e-dac7-8c8d-c68a-edaa9106d6ac@roeck-us.net>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Fri, 22 Nov 2019 13:53:32 +0800
X-Gmail-Original-Message-ID: <CAJKOXPfw0nEFJum_uVqSBzNX2b_gVFbSuoz6gnULhyCENHORqw@mail.gmail.com>
Message-ID: <CAJKOXPfw0nEFJum_uVqSBzNX2b_gVFbSuoz6gnULhyCENHORqw@mail.gmail.com>
Subject: Re: [PATCH] hwmon: Fix Kconfig indentation
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, 22 Nov 2019 at 13:52, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 11/20/19 5:41 AM, Krzysztof Kozlowski wrote:
> > Adjust indentation from spaces to tab (+optional two spaces) as in
> > coding style with command like:
> >       $ sed -e 's/^        /\t/' -i */Kconfig
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> Quite frankly I'd rather not have to deal with such cosmetic changes.

I understand, let's skip it then.

Best regards,
Krzysztof
