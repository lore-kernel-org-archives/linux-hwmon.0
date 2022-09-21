Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17860ECAAD8
	for <linux-hwmon@archiver.kernel.org>; Wed, 21 Sep 2022 13:03:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230351AbiIUNDk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 21 Sep 2022 09:03:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230195AbiIUNDX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 21 Sep 2022 09:03:23 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AAD195AFD;
        Wed, 21 Sep 2022 06:03:23 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id e187so7933408ybh.10;
        Wed, 21 Sep 2022 06:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=UttmRKpPLcmWlV5Z1LXybyhdYlhzhPNFfoIcYEEpeHk=;
        b=VOvruPnaGqM8lCDDTS2AN25lUdkgip2lsxjPs1YpEG7+rTuD1cZTMkXPFwGUnZvtSl
         NKPMqPwGm3SSYVeHVR21mjXsWsf+VqDkwi8nW36lbY5yBzWB4WKF56LDdS0pGsaqCf5B
         IHmXlZh6w+1FQwEhnzp1RCG4cgY5lH0VP/JvIP5HDtHPbecqDt8yQZ9nURT4hXjleQKT
         +WTjryMUn1yuhg9NSgZYgt+nkh0fUU/ONZrurbcB+ZjptnzwrWoj8gTkBIErdijZHUG6
         rUQJfEybZJTnlyxWMFezW3p/GE8//2UTQqwATEkDvLpRBkv8qIX8bPgVAsEem4F87BtH
         3VVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=UttmRKpPLcmWlV5Z1LXybyhdYlhzhPNFfoIcYEEpeHk=;
        b=JWiXJlPoC28Ta4B03OUnD2ACaogtW/aar8XozFPbZUTrVPlS4kT/9gpLPGLWuG0CLf
         t8zQYRn3cE6jc8ZKX1Y+ZwxnqhESyBZY02iVb97hys5aYq1UQO8ssFqZqcSLnnV0L0ZH
         W6mAGoPcJOXHIM6CnQID9juaEktZrd2Xu5xasLh5SRdsD22TtA2oS0tss1LJZ8jiI14f
         MfqUV3DHS5pXgTs3eLGYEaGDk+YsCnF9PERlSxizH7RdO1hLYVKYb64VYYxI2Jz4PVY+
         SQ50eZJKCfw6AgDSZjSkCkm242KIDKxzuer9h6igW1C0RB9QP2gkwdPkmcZjB27vHEms
         B3eg==
X-Gm-Message-State: ACrzQf1fSg742g7EVOj5hw6EkRyO+6WGFbrl4ArLkKdS9KZl3NPEgz5J
        CdpIm9o+ou1L02Zo/L9UULbCs4LICCiL0lQxzuDMlW6cWL4=
X-Google-Smtp-Source: AMsMyM4opAaC76KbxpjyoRIJMnhQ5uPi+pLD3/QLFHGy3NBS31THGy3Nslx15EKTQgkiUHBFPX/akJwobi87xXPwQiM=
X-Received: by 2002:a05:6902:38a:b0:670:aa12:8908 with SMTP id
 f10-20020a056902038a00b00670aa128908mr23392467ybs.446.1663765402222; Wed, 21
 Sep 2022 06:03:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220921121844.8059-1-farbere@amazon.com> <20220921121844.8059-2-farbere@amazon.com>
In-Reply-To: <20220921121844.8059-2-farbere@amazon.com>
From:   Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date:   Wed, 21 Sep 2022 14:02:45 +0100
Message-ID: <CADVatmMnsV2u6an0ORQWsqsjw=josHeHzMTcw-j6CphLPi3ZGQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] hwmon: (mr75203) modify the temperature equation
 according to series 5 datasheet
To:     Eliav Farber <farbere@amazon.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        andriy.shevchenko@intel.com, hhhawa@amazon.com, jonnyc@amazon.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Sep 21, 2022 at 1:18 PM Eliav Farber <farbere@amazon.com> wrote:
>
> Modify the equation and coefficients used to convert the digital output
> to temperature according to series 5 of the Moortec Embedded Temperature
> Sensor (METS) datasheet:
> T = G + H * (n / cal5 - 0.5) + J * F
>
> Where:
> *) G = 60, H = 200, cal5 = 4094, J = -0.1.
> *) F = frequency clock in MHz.
> *) n is the digital output.
>
> In code, the G, H and J coefficients are multiplied by a factor of 1000
> to get the temperature in milli-Celsius.
> Final result is clamped in case it exceeds min/max thresholds.
>
> Change is done since it is unclear where the current equation and
> coefficients came from.
>
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reported-by: kernel test robot <lkp@intel.com>

Only build tested on top of next-20220921 after reverting v5 patches.

Tested-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>


-- 
Regards
Sudip
