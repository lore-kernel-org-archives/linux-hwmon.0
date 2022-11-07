Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E41C4332F
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Nov 2022 14:30:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232480AbiKGOaJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 7 Nov 2022 09:30:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232484AbiKGO3o (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 7 Nov 2022 09:29:44 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6CE21FCF0;
        Mon,  7 Nov 2022 06:25:10 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id z192so13838962yba.0;
        Mon, 07 Nov 2022 06:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xvbm0fDp9mG9HcdsqWapj6VIDenFR8Zj1AW2SPoZUXw=;
        b=TYV15S4Z42NV70DVkIW09Bcf1oPTBrVU65nQidNLDYCkKMYQ3eWACnEy1LtM89UN2d
         x/1HTJk0cuwgi2oSdnKAJB1mnon7rt8VVORJ0SeizxBT/7AngtyZwQgUPRn0twszKIWI
         cwCEEH2r3suqCU/tUiPTpxSVgQr7tm4QCqe09rjudKGYf9QFoeri5iUcVry2YjxEBdCd
         aYESVzJ67MAgtsLzYcFNUMBwVF/yLscLaVIGGE65ibC8wTD9ugEAarNDCdyTaVoqOBqx
         qqCRR1rB9MfJwd/yA+WQPIFEHMDrl4UrHR0IqBUQS0CrsUl1EnRim9oCCjfBsUk1ocPf
         yGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xvbm0fDp9mG9HcdsqWapj6VIDenFR8Zj1AW2SPoZUXw=;
        b=6cug+3mCIN2k6iKzr7AJ6b9/kYi48+hh31j2jW7yCkA+s9Ykaa/XFhEtfaCvgK0pM5
         +IRJKfoz/8aOQDNvAdwgLgGK75DHMptLdM8sOJYcm1fwk3GwO/r52kKyKxf7qUf5zf4n
         29cjkQmGo93zjtT+X5gV0toA73mzNEkP55fOyjV8oFKZl9K2dV1IvYxWq6G74aHT+1TU
         czkTmPcYkbK1dKgB9fPGGqfe5mrurf2mJuHcTBT1pQzIYNQgrsS2mNvqLdlQndqW9TK6
         i1dVdtEQyXGL/0lzaAj+pb5X8g6FhpYAdHA3auU3XDIILP26R78Zr+DEjrn1iQVayjQl
         FcpQ==
X-Gm-Message-State: ANoB5pnlALempmXei/Ncir5Dth+8eDizt7zPKe5YPQ77mGEE1jlU0rWj
        SgFJeqztOi/a8QiAPPDebNf8wwM7wJGTtXO5qk0=
X-Google-Smtp-Source: AA0mqf7EFxcovW1IbWzMvbCyrTs75a/nr6/y9UPDpQ5tMqElPKDyHSOSUTbud3VXn0yqGcL+UwBIKaQuQ1VXXGmqHZY=
X-Received: by 2002:a05:6902:50a:b0:6d2:e4d8:666d with SMTP id
 x10-20020a056902050a00b006d2e4d8666dmr19665763ybs.196.1667831109749; Mon, 07
 Nov 2022 06:25:09 -0800 (PST)
MIME-Version: 1.0
References: <20221102150440.208228-1-samsagax@gmail.com> <20221102180430.GC2913353@roeck-us.net>
 <CABgtM3jXVTjxEJXmCXG+z_DGaHAkFFVjZBa2bOCbeqFveesWrA@mail.gmail.com>
 <20221102204407.GA2089083@roeck-us.net> <CABgtM3jaV+jy3PYcCi3o1ij1igk4S7dWTF=QM=rN2acaGLQ_JA@mail.gmail.com>
 <20221103011518.GA2109645@roeck-us.net> <CABgtM3gQ3RpnxLL8kC_gZH6=ahH69BbMpQNocvtJVcK8VU2dLw@mail.gmail.com>
In-Reply-To: <CABgtM3gQ3RpnxLL8kC_gZH6=ahH69BbMpQNocvtJVcK8VU2dLw@mail.gmail.com>
From:   Joaquin Aramendia <samsagax@gmail.com>
Date:   Mon, 7 Nov 2022 11:24:58 -0300
Message-ID: <CABgtM3i1yTAj-f+=kOmNdHx76Fu0EcqJX9NGN-FDOzQpVThEUg@mail.gmail.com>
Subject: Re: [PATCH v4] Add OneXPlayer mini AMD sensors driver
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     pobrn@protonmail.com, hdegoede@redhat.com, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Guenter, thanks so much for your feedback. Just posted the final v6
with your suggestions. Let me know If anything needs to be changed or
clarified.

Cheers
