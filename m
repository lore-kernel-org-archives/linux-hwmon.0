Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01CD5C43334
	for <linux-hwmon@archiver.kernel.org>; Thu,  7 Jul 2022 16:13:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236292AbiGGQNT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 7 Jul 2022 12:13:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235743AbiGGQMj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 7 Jul 2022 12:12:39 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C1312CE0C
        for <linux-hwmon@vger.kernel.org>; Thu,  7 Jul 2022 09:12:16 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id e15so2829318edj.2
        for <linux-hwmon@vger.kernel.org>; Thu, 07 Jul 2022 09:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tK5lHod9VIHuRKzd2GfoBvHOMOlwl6X/2A4iC9byFb8=;
        b=WsSr0CSKGupc7yHcckdNkVH30/oLx1OYGcfUuOwEMQ42j5zzo7mVqyfjM6N39pLLYo
         DhS56zENW73koep0Wkoe9079Gsl4CP8GRolLj1d1ifCDIeD2o39Hjs2Z58Y0UGTjbiM9
         f7fKsYRKIQLkMEZp1MZ0LR7p1YZnbHfwHwOxX1H+9SllDXWWtOX5f+FrQFB5PT2hwovj
         rxGoTCZEgW1AaEJOb8DKwmBh63qwj192Ge1vOu67MIpZiNwaTNVt/PkGHxpXan1JOZae
         1GoCDiNHvZWwzCemgPO/Ria8iX5Rc71WLSUN/9AISZa6iQSsUYIuqHUAMpdCLClLIfrw
         J8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tK5lHod9VIHuRKzd2GfoBvHOMOlwl6X/2A4iC9byFb8=;
        b=wJ8VrsN4u9y5n5lBpxk4z52Chul8emgt4SapdvvacsbiynGBY/IWiByM1OT00gUDaV
         +zmRhTlrvGQRMJqMzH+9c8PVGINlWMB+N4kJNcbMH2EY7rq8jq1yWOOoXiZszds3/FqE
         L8GJ0OBKFw/Xb25SCEjlAHiyg+kzNdJ7xAOPp0WiNP/Ijp0vpgyZ7d0J7HaqmW7aFar2
         Uk0NLy3cx92zu3Txt0m2mXWQfzl2i2Lt4gfu0DK0hHUijX78YxpfJa+n4Giuwrxb8QaL
         0N93VkAskweYKWZNGYpwmVWiOxAKJjTvrQ+mMjsK5co7kby9fd0WJD2a+gC8MgXVLpLF
         /ijw==
X-Gm-Message-State: AJIora9E12u1XTg/arNxR3Lii1E7PrK8zayPrSriV/OQnQEojKm1nP6G
        ozUB8DaJWCBML6Xhd0/0fJup3KpfMSiRvCz0
X-Google-Smtp-Source: AGRyM1vwoIyE+blz7OnpVKqypWxBStsIjDZNpoARanYYqGIFZ1y1GzA2E1DmuAHOAkEqHky2C+rsuw==
X-Received: by 2002:a05:6402:148d:b0:43a:8f93:1d1 with SMTP id e13-20020a056402148d00b0043a8f9301d1mr11379790edv.57.1657210334613;
        Thu, 07 Jul 2022 09:12:14 -0700 (PDT)
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id k14-20020aa7c04e000000b00431962fe5d4sm28731372edo.77.2022.07.07.09.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 09:12:13 -0700 (PDT)
From:   Naresh Solanki <naresh.solanki@9elements.com>
X-Google-Original-From: Naresh Solanki <Naresh.Solanki@9elements.com>
To:     Roland Stigge <stigge@antcom.de>, linux-hwmon@vger.kernel.org
Cc:     Naresh Solanki <Naresh.Solanki@9elements.com>
Subject: [PATCH 0/2] Add max6639 regulator and devicetree support
Date:   Thu,  7 Jul 2022 18:12:00 +0200
Message-Id: <20220707161202.1228999-1-Naresh.Solanki@9elements.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

These patches add devicetree support for MAX6639.

Changes:
- add dt-binding
- add max6639 specific property i.e., maxim,rpm-range

Marcello Sylvester Bauer (2):
  dt-bindings: hwmon: Add binding for max6639
  hwmon: (max6639) Change from pdata to dt configuration

 .../bindings/hwmon/maxim,max6639.yaml         | 112 ++++++++++++
 drivers/hwmon/max6639.c                       | 162 +++++++++++++-----
 include/linux/platform_data/max6639.h         |  15 --
 3 files changed, 231 insertions(+), 58 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max6639.yaml
 delete mode 100644 include/linux/platform_data/max6639.h


base-commit: 9f6ca00b5be47e471e9703e6b017e1e2cfa7f604
-- 
2.35.3

