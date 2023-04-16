Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF4ACC77B73
	for <linux-hwmon@archiver.kernel.org>; Sun, 16 Apr 2023 14:48:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229446AbjDPOst (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 16 Apr 2023 10:48:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbjDPOss (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 16 Apr 2023 10:48:48 -0400
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3518E0
        for <linux-hwmon@vger.kernel.org>; Sun, 16 Apr 2023 07:48:47 -0700 (PDT)
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-760d4091047so85896139f.3
        for <linux-hwmon@vger.kernel.org>; Sun, 16 Apr 2023 07:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681656527; x=1684248527;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=X5MWmOYUq5ATKjS1q9oPJThxh0BklLPQcOS0c7ifYVE=;
        b=sbmqbnMHgoxNvTrY1qpVlBgtYlJ6oTu2shwgwhpQFKlzvv46IG0+EGIC40dKXd52Tt
         qGit11mZq9f1CU0nd6P/0VWyxJ79gbU39OSJucYEgZTJrn2Y/uyEUtXFC1Z9FFvdyhjN
         1i4Z8lE0ZhRP1Kr+i4u0EaGzNA2XxeySvhHq44ngV3K59qhjJjRdV+1A2W0L5ebftJ3V
         yUf2CdGzq5hZQ0hUxBUeliKhCmQPBmjVyY5Cb0jWTUgiwCSlfeR9kck2WoEUh4J4oQZp
         wtY9oaKXbaqNQyV9TVpGUU11i2vh0xL1f28bh6Nud+KcoFkp8HS4WlDu0bBQtUZ4S8rR
         bhEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681656527; x=1684248527;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X5MWmOYUq5ATKjS1q9oPJThxh0BklLPQcOS0c7ifYVE=;
        b=RbWPYD46U+J6E+uEwlXssH5XWWwgW8MTRwIUBGtXPJQIv5yDxmS3GwAH1Q63J+VFz4
         9d5TBxmE8r7vV+NVvn+RUQf0rxNO3SkyzrSQMtzU5A6tTEqNwdKBu6iBZnE3D9LwcNPt
         byl4Y74xwoukl7pGjE/13JOMBGbzDNOQLIJDfDdxeQzfJIvur/g++j1pN568dPMoLfja
         5p5utLQYnH8lJ8zKfPx7o2VifL1oMVF8vpyI73FJ2VWcgiofNbfU7LG65zmUnLJ7VhJD
         Y/0IUIijgaCRloclQf60p8AUqTV8j7Ps9OdbqSxwTdNkYhx9wuqcSd3+nGf93eKLrY8/
         /OcQ==
X-Gm-Message-State: AAQBX9exQbHE1nnFYr7wo3/eB5kSZVzsnXYoixuuLzf7o4MiEZqtHH3h
        z5xWNDHQJBE5pveL/COMRRQxYOL6foo=
X-Google-Smtp-Source: AKy350bP29lHpLezMxwhml5W72cv3LtrpttuVjPUFaAVvm41uDVrxjHKmYqWUdfm4AuPkZGKanXwhA==
X-Received: by 2002:a92:d9c2:0:b0:32b:1d01:84f3 with SMTP id n2-20020a92d9c2000000b0032b1d0184f3mr55857ilq.25.1681656527089;
        Sun, 16 Apr 2023 07:48:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h15-20020a022b0f000000b0040d944282b5sm2552521jaa.152.2023.04.16.07.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 07:48:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sun, 16 Apr 2023 07:48:45 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Frank Crawford <frank@crawford.emu.id.au>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 1/4] hwmon: (it87) Disable SMBus access for
 environmental controller registers.
Message-ID: <abf2e8b3-1c4e-4614-beb8-3087933586da@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Apr 16, 2023 at 02:25:07PM +1000, Frank Crawford wrote:
> Add functions to disable and re-enable access by the SMBus for specific
> chips.
> 
> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>

Applied.

Thanks,
Guenter
