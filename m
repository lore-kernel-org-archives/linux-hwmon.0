Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74ACEC77B61
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 Apr 2023 14:51:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229717AbjDPOvg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 16 Apr 2023 10:51:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbjDPOvf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 16 Apr 2023 10:51:35 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 804CCA4
        for <linux-hwmon@vger.kernel.org>; Sun, 16 Apr 2023 07:51:34 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-7606ce89ebcso51718439f.0
        for <linux-hwmon@vger.kernel.org>; Sun, 16 Apr 2023 07:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681656694; x=1684248694;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=qpgPHop59NXSOLJGznBrtHTPG91T77SwUoXav1feCQQ=;
        b=nCXKwOynNGPrgQZ/K2M9rsJQ524NNcZqiUijHXivgs1rjklboaj0ulr0zWAlTbj+4Q
         w5ADxzPvnslluiPR3LSwCc4mWn5kjMqspWacVFSoijCjZsDI+pZXh1u06gm7PhKxhEmn
         tvx16ZIGE8p3JUTu3q8QKnTSkJoVc+p09FXqKIzFXaEHwKcLl0zUDQelABdveyW+6kv6
         j5OqzGe6Xe7d8baWNqiMmxCs9vEaiyM/TaI4C9sMG6OqMq91FTkET0ede4YIJ6a2XOYm
         F2nP4W4WSWb7KGf9FjoqhlMmBIYl7v8H1N3/VzraV9PsPmVDJ/jGR7SY703a0Mb4ongO
         /dmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681656694; x=1684248694;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qpgPHop59NXSOLJGznBrtHTPG91T77SwUoXav1feCQQ=;
        b=chS1pfvVwj75wOk3r9JsgZ2hRVWnzaYIHFL5lizHGIOg9V2eJnaTgidteF8+eFKtGX
         mFOoCbBJpARpPJjfTcmUHLojVOO2qJute7uiCV5rtV+sHaBgb84bbofVj/c9Er5cowfG
         UhQMcEixt1+A6NXlgUSMAKG2idc8Z+L98zxbtErJqZ/rSKQZ+yhdyb5mfsp77X89LOi/
         C44/Ucymkc0nJNnw1XRivgTq0z+NcKSUOBK7F/uXbRolaCEtUQ9XmBk5ZvWSVgkGGI5G
         hqtZGfLp1kiGiGAbK5ot27q8Zam9yvIebDeSDvCjDB/F6k3AK3cxzjGbpX8AmVaDnsRP
         cysA==
X-Gm-Message-State: AAQBX9cdvwBjEt9oTWri1LSGDbG2f4ve2l93UCKa1jYWwx1iiN2TtQP7
        E95t8E6Ms+F3Ff8oR0ZxOAU=
X-Google-Smtp-Source: AKy350ZrLBtj0XFGvBeANTpKr80SRyDn1Z74RsRI3QPTCpvKtCpxcTqowal8QBHMxeiSrP7HQbJOQw==
X-Received: by 2002:a92:c80f:0:b0:316:d9fa:f31b with SMTP id v15-20020a92c80f000000b00316d9faf31bmr7761039iln.32.1681656693901;
        Sun, 16 Apr 2023 07:51:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l5-20020a92d8c5000000b003158a3455bbsm2296029ilo.78.2023.04.16.07.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 07:51:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 16 Apr 2023 07:51:32 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Frank Crawford <frank@crawford.emu.id.au>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 4/4] hwmon: (it87) Disable/enable SMBus access for
 IT8622E chipset
Message-ID: <24138c50-acb1-4935-b722-18be90ed88d8@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Apr 16, 2023 at 02:25:10PM +1000, Frank Crawford wrote:
> Configure the IT8622E chip to disable/re-enable access via an SMBus when
> reading or writing the chip's registers.
> 
> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>

Applied.

Thanks,
Guenter
