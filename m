Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD84C433FE
	for <linux-hwmon@archiver.kernel.org>; Wed,  5 Oct 2022 21:55:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbiJEVzx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 5 Oct 2022 17:55:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbiJEVzw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 5 Oct 2022 17:55:52 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91C7C7CB72
        for <linux-hwmon@vger.kernel.org>; Wed,  5 Oct 2022 14:55:51 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 25so8524lft.9
        for <linux-hwmon@vger.kernel.org>; Wed, 05 Oct 2022 14:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pcpartpicker.com; s=google;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=l9pFc4qRNg84TyShH0/F9GYHn2QB19LyBaSxBQzM4Y8=;
        b=jXE4FYTZJkN9w8YWWCK+X+5XXkN2+UrhsuEr6XX8Qz+liL4M0dGnFXG5rJZuNLgneN
         lDwNtW3l2HG+En9AEl01GcDMOesJ7GeIkVtFEzNbVjmXCKIHUi5SJWQUKXYtNfHv2A50
         7CcEuTtPwLd4xOl3+k/q+BuA3iGLhs2opI7lKIbYOAeQb15WV9C1jI137OLQ7O7lOXXv
         zJXxOQAvZ43tguS4x0mnrP84T0mPhHee2inV/rRs0momdb8Y1ExCqWHb05fJYJxRwNXn
         bbJx1Tu2GUvZfnInKK+JkM604U2qOnaQkPh/SVnO86ZJLrhVozjY6T1GkdFH4AmnaTTX
         P+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=l9pFc4qRNg84TyShH0/F9GYHn2QB19LyBaSxBQzM4Y8=;
        b=u77mMX5xsw05xOMoFqh8l3SFWO1GMEgkyjfa9boG3rN1pqhZi970m1aVagNxbEprG4
         gerdMS2bx8NtDStktxeVgIja8SiQrlc/D9kw/hKkTlIRDht0bJnOgA/BJjPWT0umvghm
         qzUzZOhNOcI/EMaZUIu5uWj9fjTRs5EFfuVRFE/sARzDZB+jnOUPiGQ1TrxmhayfbCvl
         fZYzuYMRPavtGytmO0HUHUNboRd+6FMfCfsphJV5bPXb6OTG3no9JjFZyW89hCL7eRrg
         CvglRfj6bSw4lLdBfsEeTkZZEP12elpqtLJN2aB8tpsDCauNYny1/MNbHLmigDuHwX4g
         6cTg==
X-Gm-Message-State: ACrzQf2rgvPI/2XiXiIxFveWxFZ2VlJ4hyGpFabp0D11vwt9/GSGpHOP
        Z7sWcv6a7imtq9T7P+rsES7XktgUlvKHwtvceZGpLzbPs6tXRYj2
X-Google-Smtp-Source: AMsMyM5UzN3qi7vmA9UCWUtCN/XZBJz1zsplzOWxd6pvZ0fLEN+eFINqIqkTDZO/TtCSBtVVEtnl8HacR0pwkIEpSmo=
X-Received: by 2002:a19:9202:0:b0:49d:7310:742f with SMTP id
 u2-20020a199202000000b0049d7310742fmr708764lfd.312.1665006949631; Wed, 05 Oct
 2022 14:55:49 -0700 (PDT)
MIME-Version: 1.0
From:   Nick Neumann <nick@pcpartpicker.com>
Date:   Wed, 5 Oct 2022 16:55:37 -0500
Message-ID: <CADqNVTr55B6cCmRhm9dbwUrDzKK8Gsa2cPr34f3Wkdsrzs77XQ@mail.gmail.com>
Subject: Trying to understand hwmon drivers - where is code that reads hwmon_chip_attributes?
To:     linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Apologies for the newbie question. I'm trying to follow the hwmon code
and see how hwmon_chip_attributes are read and used. (Namely, I'm
interested in hwmon_chip_update_interval, and what the default update
interval is if no interval is specified.)

I can find lots of different drivers that provide
hwmon_chip_update_interval, but I'm looking for the code that actually
uses its value, if that makes sense. I've been slowly trying to follow
it through and am guessing it may be in the general device driver
infrastructure, but haven't yet been able to follow it to the code
that actually uses hwmon_chip_update_interval or the other chip
attributes.

Any pointers to code or docs that would help? Thanks!
