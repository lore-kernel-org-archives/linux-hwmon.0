Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 956E4C433B4
	for <linux-hwmon@archiver.kernel.org>; Thu, 15 Apr 2021 16:34:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5848F611AB
	for <linux-hwmon@archiver.kernel.org>; Thu, 15 Apr 2021 16:34:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231549AbhDOQfT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 15 Apr 2021 12:35:19 -0400
Received: from office2.cesnet.cz ([195.113.144.244]:38936 "EHLO
        office2.cesnet.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231137AbhDOQfT (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 15 Apr 2021 12:35:19 -0400
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by office2.cesnet.cz (Postfix) with ESMTPSA id 100F2400070
        for <linux-hwmon@vger.kernel.org>; Thu, 15 Apr 2021 18:34:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cesnet.cz;
        s=office2-2020; t=1618504495;
        bh=F/6Gvq/CQbx6dwnQLEwGyImbW4MTVQOL2OiyuLOI0KQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc;
        b=KC26agXLyijjjorJBiJ3zKGW48yOqm2h+PkYqpJ+/awqFPzK/jFp0evnkfdohT6RL
         1BCYPSfTMa6sw3Q/aQuLD0pWytx6R0TptuQpXuyX/wKmjzrRlDx8wPWxSoJqo061N7
         JvGMxnv8TusQRzLD28wXglKW6ovcgEKoS0geq1jDbExIMj60/IiYGuc8UwoOHE71NL
         Utz5HQpO0VtGpQcMEEA7mE1YOOmZ/uOtGreRET4M5hXrJj+ty1IqmoTpovviy1EuQR
         4Gmp1GDmicsP+wi7tsxYY5xCiLuEo3rBPP6kA9B4y/KOqGzbSG5bLD0BV/jzY3x4sf
         MY6xhpc18ST2Q==
Received: by mail-pf1-f180.google.com with SMTP id m11so16415405pfc.11
        for <linux-hwmon@vger.kernel.org>; Thu, 15 Apr 2021 09:34:54 -0700 (PDT)
X-Gm-Message-State: AOAM5330jGrJL+bpinhM3vaZY2v6aD1GlIHJHJLxh965mGaEPCLOWt1C
        EzMHX4a4Nlag6IUBR6Rxh2Q4cri5xw4/Y49UEpQ=
X-Google-Smtp-Source: ABdhPJx/nKCBSS1f8/FzSAMbTesSjUTM/1edFLBzx6fbYdE9GLo8Nv9qLGAoPGLyubBRreT0LqahCL+verNvEu+veMw=
X-Received: by 2002:a62:68c4:0:b029:226:5dc5:4082 with SMTP id
 d187-20020a6268c40000b02902265dc54082mr3764169pfc.48.1618504493549; Thu, 15
 Apr 2021 09:34:53 -0700 (PDT)
MIME-Version: 1.0
References: <202104142348.TP8JF6QJ-lkp@intel.com>
In-Reply-To: <202104142348.TP8JF6QJ-lkp@intel.com>
From:   =?UTF-8?B?VsOhY2xhdiBLdWJlcm7DoXQ=?= <kubernat@cesnet.cz>
Date:   Thu, 15 Apr 2021 18:34:41 +0200
X-Gmail-Original-Message-ID: <CABKa3npWANE5EQE+bTUZ02ngDMT36kGsLO-8kdf8oroba7kjWw@mail.gmail.com>
Message-ID: <CABKa3npWANE5EQE+bTUZ02ngDMT36kGsLO-8kdf8oroba7kjWw@mail.gmail.com>
Subject: Re: [hwmon:hwmon-next 33/33] drivers/hwmon/pmbus/fsp-3y.c:204:48:
 warning: missing braces around initializer
To:     kernel test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org, linux-hwmon@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello.

I received this email only after I submitted the PSU patch. I'm not
sure what I should do. Also, I don't understand the warning, I don't
know where the braces are missing.

V=C3=A1clav

st 14. 4. 2021 v 17:11 odes=C3=ADlatel kernel test robot <lkp@intel.com> na=
psal:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-stag=
ing.git hwmon-next
> head:   f0af35c3a1254fc0cca601cdc4f228b9ad24a2a4
> commit: f0af35c3a1254fc0cca601cdc4f228b9ad24a2a4 [33/33] hwmon: Add drive=
r for fsp-3y PSUs and PDUs
> config: arc-allyesconfig (attached as .config)
> compiler: arceb-elf-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-st=
aging.git/commit/?id=3Df0af35c3a1254fc0cca601cdc4f228b9ad24a2a4
>         git remote add hwmon https://git.kernel.org/pub/scm/linux/kernel/=
git/groeck/linux-staging.git
>         git fetch --no-tags hwmon hwmon-next
>         git checkout f0af35c3a1254fc0cca601cdc4f228b9ad24a2a4
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s W=3D1 ARCH=3Darc
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/hwmon/pmbus/fsp-3y.c:204:48: warning: missing braces around in=
itializer [-Wmissing-braces]
>      204 | static const struct i2c_device_id fsp3y_id[] =3D {
>          |                                                ^
>    ......
>      207 |  {0}
>          |   {}
>
>
> vim +204 drivers/hwmon/pmbus/fsp-3y.c
>
>    203
>  > 204  static const struct i2c_device_id fsp3y_id[] =3D {
>    205          {"ym2151e", ym2151e},
>    206          {"yh5151e", yh5151e},
>    207          {0}
>    208  };
>    209
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
