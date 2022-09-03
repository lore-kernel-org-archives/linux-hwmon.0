Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D639FECAAD5
	for <linux-hwmon@archiver.kernel.org>; Sat,  3 Sep 2022 22:37:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbiICWhm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 3 Sep 2022 18:37:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbiICWhm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 3 Sep 2022 18:37:42 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FB444DB52
        for <linux-hwmon@vger.kernel.org>; Sat,  3 Sep 2022 15:37:41 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id n202so4405984iod.6
        for <linux-hwmon@vger.kernel.org>; Sat, 03 Sep 2022 15:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=VG4WdCRTKsnUl8DU++AAwbVOVF3DpGRyvXwvrmGK6oA=;
        b=pQeJQuP2nXfb0+sReafFsUZaOcsbp+inidtF93HkRXkV2hDDIRDL+jcyE6mSJJORbH
         TwK68BzQAdPTsKl/0k9+sOG3Vu/tHUzxCCHpSJyxmQLDC5ldZtGpqLVJ9cRp3Fc+Syt0
         +0NW/QPecJ0e6fOsrog2K/ozECF+1WLc+nCewjFMT4wgwNbHX3WWwd9PbXRC3pkLx1z8
         wVPKGnvpR064v62Q6oOsN2qlksoABCuSdfyVJdVe2waeAlDGCk1NhY7ZSfZUaUJUrPRL
         vrpibt3U/JyMhzSHm0dHvCA8rXyo3ajymwq+xy2dA7CQu1F/OUGfjuC50LBBZkqt3lxS
         yIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=VG4WdCRTKsnUl8DU++AAwbVOVF3DpGRyvXwvrmGK6oA=;
        b=4BtClmkSMsPJf5e+/Sr0CkYhjxQMy2b2pCik8pHYAW9yPw9T8BsryTIMN/ye23GrgO
         R7vI3ISokK1j2UH/3X8Hw5chaPPu9d2g1dJQhGw1pS9sNPk7Ht6grF3xpNNWe+bi60kJ
         aSsdTTya1vXwMGO2U51yzbPcQQ5mv9gecCDP7N6x4/TE7QLiJUjo1JqVvJcGrmizohe7
         3Bc/jnNXeMIFDBo/Xm2QzTYYReilog9HpwQP/tIsLmCpy4u3bjNePCL3KvQjo7QJgv5+
         H1/DAzS8kcxtf2+do+HbBfVE0sewAXza0sB2j66lgpEUWZMIZC0W1IvrjQjZgdWbd/El
         bMsw==
X-Gm-Message-State: ACgBeo2aTpdpdu764HaaG6zF2TA1WW9AgGu213zhIvXXt/K8fQ7oy1T/
        bgkh8vPPJ2L9d5p0X/hWhykVBtValqTjeqsjjV3jYF7WQyt1JA==
X-Google-Smtp-Source: AA6agR6SnB6cO1ifmtXXYnCDdd9ICvZ3HAoKwlUo3SzdXMb+RTmlbN2PKYQIJxHMHHm/nyWwVeB/P52/M+h1JFprFnY=
X-Received: by 2002:a05:6638:1396:b0:350:1059:29bb with SMTP id
 w22-20020a056638139600b00350105929bbmr3292827jad.67.1662244660593; Sat, 03
 Sep 2022 15:37:40 -0700 (PDT)
MIME-Version: 1.0
References: <6026b5e2-a8f5-1058-6112-f191bde333a6@my.mail.de>
 <47e41e8f-f6b2-4bc7-de3f-0c811ee6fdf7@my.mail.de> <62fb8a16-bebd-5de7-0b4f-eed4d2593587@roeck-us.net>
 <CAB95QATHd1sJwbYOPeb28j9vZAfZAu-Xa+pXWUhbMTVifKz93A@mail.gmail.com>
 <5e42685d-ae82-d74d-4883-d8a9e9fcb243@roeck-us.net> <CAB95QAQ9EXX3uZhiZyxr=aAwiSR6j6i1GstFg9iX4eF06b5GUQ@mail.gmail.com>
 <ac202c2e-3add-2470-3fa6-85783c1494a0@roeck-us.net>
In-Reply-To: <ac202c2e-3add-2470-3fa6-85783c1494a0@roeck-us.net>
From:   Eugene Shalygin <eugene.shalygin@gmail.com>
Date:   Sun, 4 Sep 2022 00:37:29 +0200
Message-ID: <CAB95QAT=x8V7yg70azPnnD=Hv70goQbA6S8fOVjRpsvKfcK8Ww@mail.gmail.com>
Subject: Re: Issue in asus_ec_sensors in Fedora installations and other distributions
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Christopher Klooz <py0xc3@my.mail.de>, linux-hwmon@vger.kernel.org,
        regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, 4 Sept 2022 at 00:00, Guenter Roeck <linux@roeck-us.net> wrote:
> What does the name of the struct platform_driver data structure
> have to do with __init ?

That's what the modpost warning message suggests:
WARNING: modpost:
/home/eugene/develop/asus-ec-sensors/asus-ec-sensors.o(.data+0x60):
Section mismatch in reference from the variable
asus_ec_sensors_platform_driver to the function
.init.text:asus_ec_probe()
The variable asus_ec_sensors_platform_driver references
the function __init asus_ec_probe()
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

Regards,
Eugene
