Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C0B6C77B61
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 Apr 2023 14:51:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229693AbjDPOvM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 16 Apr 2023 10:51:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbjDPOvL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 16 Apr 2023 10:51:11 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FA32A4
        for <linux-hwmon@vger.kernel.org>; Sun, 16 Apr 2023 07:51:10 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id a16so846815iot.5
        for <linux-hwmon@vger.kernel.org>; Sun, 16 Apr 2023 07:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681656670; x=1684248670;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=WdCN9iaoszOOYEn/TeMEIp8K7zX/KSQ72KI8MkWD7gE=;
        b=SNG0scT/ziGRaaoZKzRLs0aMgaxdIiZlHjJYF6n+mQ3XnxUbYIvARbC1r+vyJtKU20
         MVmHtoRejARRKXHVtIXFYofrfYCPM/wGF2co7FAsxhbNwzJ9lFIdqx0kmNKrl/ebdrzT
         r2aCZHJ8G/Gc2+d30AXYGPcPHFi1TI1HtRGy1vTKGdAHH2S57tAYTTVoeDWwfBx097ri
         5/DEH55NGEqGBmBfLMvluba/UlF0doYE5bEINcX2iF0nPbSY8rz6XKMGrBX0PEZ5pwTo
         2SsADvH49HySxqZXPzEg6Zz73NlGGYfdQMvPjPVDNAUCwylSDNU+QPAi0akjolSD+nOQ
         vACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681656670; x=1684248670;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WdCN9iaoszOOYEn/TeMEIp8K7zX/KSQ72KI8MkWD7gE=;
        b=IHQFxhjOFSwAepVMH1n25btaivM3YSIHBDqWeF1OmTZg7jNLWNr+HXYLi5KzQYdbnL
         YU0Jc6M5S1Ks4TgaJA88pdDyFULEjCKe4oN/ZnA6iaRxJWSHnXiLv92UpDCdLs+8N9ry
         GsNUqRjhKO8iqM2Ra+iUrVd87AcF/M5m9M/pqjlXx/2khPHrw8KIKYI11s5RpEuDN5vt
         45dPff6mRaO4D3ITdIv9+Ea5nAjys2/mDrzLpk233V6OXYkWxzj1G7rnR1lQUpxKbM5a
         +O3OXWZZlIGypP15nKiftQ0rARptaK5AhulkrjRS3uFTemvlshEyZrmCRLnPP0TGvEeD
         HDAQ==
X-Gm-Message-State: AAQBX9d9LnoEnWbIVxDOG7LX9He2AUw2NbPcWMAk1EPulGQBGbJWiEzH
        v77seUbgbG2pR7S8xi8HQAE=
X-Google-Smtp-Source: AKy350aUitxFbhCdlq6Clc4gb7OUAHiNBW7D2ZR7Ju9IOF/1Bfjz+z44Y26yx1xeK3VWI5+WhsEeOA==
X-Received: by 2002:a5d:9714:0:b0:753:2cc5:c8b7 with SMTP id h20-20020a5d9714000000b007532cc5c8b7mr8304230iol.3.1681656669856;
        Sun, 16 Apr 2023 07:51:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p11-20020a92d48b000000b00329614db024sm2547192ilg.31.2023.04.16.07.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 07:51:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 16 Apr 2023 07:51:08 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Frank Crawford <frank@crawford.emu.id.au>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 3/4] hwmon: (it87) Add calls to
 smbus_enable/smbus_disable as required
Message-ID: <45592027-c117-478e-81e1-42b71a186b37@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Apr 16, 2023 at 02:25:09PM +1000, Frank Crawford wrote:
> Disable/re-enable access through SMBus for chip registers when they are
> are being read or written.
> 
> For simple cases this is done at the same time as when a mutex is set,
> however, within loops or during initialisation it is done separately.
> 
> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>

Nit:

CHECK: Alignment should match open parenthesis
#527: FILE: drivers/hwmon/it87.c:3316:
+	if ((it87_read_value(data, IT87_REG_CONFIG) & 0x80) ||
+			     it87_read_value(data, IT87_REG_CHIPID) != 0x90) {

No need to resend, I fixed it up. Applied.

Thanks,
Guenter
