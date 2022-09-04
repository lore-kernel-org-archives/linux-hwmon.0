Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3BE0ECAAD4
	for <linux-hwmon@archiver.kernel.org>; Sun,  4 Sep 2022 13:19:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233715AbiIDNTq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 4 Sep 2022 09:19:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233655AbiIDNTp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 4 Sep 2022 09:19:45 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BB3F9FEA
        for <linux-hwmon@vger.kernel.org>; Sun,  4 Sep 2022 06:19:44 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id d68so5107389iof.11
        for <linux-hwmon@vger.kernel.org>; Sun, 04 Sep 2022 06:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=1Z50Lfymh1PlbkiwBA/PwOqZtMKxrfRNBW2U0b3NRB4=;
        b=jPYqbT91EXpvabefP4wXgkLu3BSFHcinWtR5ZSBMeJ1h5sYsm/CIVkfMjQ6moOCWzL
         n3W1FmutnnvXKfJEFZ2a9tHZ7ri1mDBsq9O6qFcVnaBbCSqTyR/sZRoE5pcAhwtwcieX
         EzxP1ENUNEvj5eCze+GJfFc36tPFHYpkI4g6snbSsB/zpjqLVIDkg60S6Dk3iCmK1XR/
         Gz5Hj0JRgW70Wi797RnHdb2AkCJ0mYGaikSaH6xD/+0Ijp7RiuQaEXq/hFnWKYbmiw0E
         OXLE9jOK8lVqUtCfryuEo1YEPLXLepYivS7axZ7YvDbiWgEMSo7gbF2H2eRld5tW+rYS
         mAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=1Z50Lfymh1PlbkiwBA/PwOqZtMKxrfRNBW2U0b3NRB4=;
        b=iZAxaQW9v0vjxOd5uQowPhGRmGeMN6Q6YAzXD6g+w74CrMiotAi8Q2pn7BfmHTHhFN
         B4Kr+HoRaaMV9MMVksrKg3omQeK76SUnqLxQb9sQqpO3opd2JQbglMXbcq9pCyLLI0IJ
         Mf4qq+m8CEK6I6FftiY5JSBCGkmiTynLGkUoBpUmEut0qsrQFPj9QuodjL/guZwPOkCt
         JohrAJj15+OxkDNfC3ttzNieH/DAJdxq14i9jEbK3BUD83g1s24w+esGyY2lPpQfVtcx
         xZTfZN1ECwqpJ5ccRCoWMx/JdQeIpQLwGR5+323eWVh/7UzlVkVg4RNeyqH9hkT6SdoX
         3NfQ==
X-Gm-Message-State: ACgBeo2B78P76NUzivvsIad/hkUjIhg8IUGtX6LK8/bO+2CUUNuKWf+f
        2d8GBiG5LF/lAG3k9Rty4W3lNmzj4OSjAigrrgg6GJRXiJY=
X-Google-Smtp-Source: AA6agR67SqrtMJ8xv+Xs/AipmBBhh9/S/k/SoCqE0wZRKHE2hVw1FMxFUiXPGDEtsdp4x0q6lt9ZM83xzroLgVzBDig=
X-Received: by 2002:a6b:b716:0:b0:68b:b14e:6220 with SMTP id
 h22-20020a6bb716000000b0068bb14e6220mr13049361iof.133.1662297583436; Sun, 04
 Sep 2022 06:19:43 -0700 (PDT)
MIME-Version: 1.0
References: <6026b5e2-a8f5-1058-6112-f191bde333a6@my.mail.de>
 <47e41e8f-f6b2-4bc7-de3f-0c811ee6fdf7@my.mail.de> <62fb8a16-bebd-5de7-0b4f-eed4d2593587@roeck-us.net>
 <CAB95QATHd1sJwbYOPeb28j9vZAfZAu-Xa+pXWUhbMTVifKz93A@mail.gmail.com>
 <5e42685d-ae82-d74d-4883-d8a9e9fcb243@roeck-us.net> <CAB95QAQ9EXX3uZhiZyxr=aAwiSR6j6i1GstFg9iX4eF06b5GUQ@mail.gmail.com>
 <ac202c2e-3add-2470-3fa6-85783c1494a0@roeck-us.net> <CAB95QAT=x8V7yg70azPnnD=Hv70goQbA6S8fOVjRpsvKfcK8Ww@mail.gmail.com>
 <2f14746c-8051-b711-cd28-7ca521d21c4d@roeck-us.net>
In-Reply-To: <2f14746c-8051-b711-cd28-7ca521d21c4d@roeck-us.net>
From:   Eugene Shalygin <eugene.shalygin@gmail.com>
Date:   Sun, 4 Sep 2022 15:19:32 +0200
Message-ID: <CAB95QARMOq0ie0SmhRx73L=mptTaa-eEHfNjGRH5CXvVFh-RLw@mail.gmail.com>
Subject: Re: Issue in asus_ec_sensors in Fedora installations and other distributions
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Christopher Klooz <py0xc3@my.mail.de>, linux-hwmon@vger.kernel.org,
        regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, 4 Sept 2022 at 01:47, Guenter Roeck <linux@roeck-us.net> wrote:

> A driver with a probe function can be unloaded and reloaded manually.
> I don't see how you can do that if the functions are marked __init
> and the driver is built into the kernel.

Did that and a user tested those changes. Unfortunately, the ACPI EC
is still inoperational if a module uses the ACPI id of the EC device
and its probe function returns an error. Looks like I have to change
MODULE_DEVICE_TABLE completely.

Regards,
Eugene
