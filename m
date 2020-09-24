Return-Path: <SRS0=A7RS=DB=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6533CC4363D
	for <linux-hwmon@archiver.kernel.org>; Thu, 24 Sep 2020 21:54:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 136AF21D20
	for <linux-hwmon@archiver.kernel.org>; Thu, 24 Sep 2020 21:54:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ldc1k8np"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726638AbgIXVyv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 24 Sep 2020 17:54:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726280AbgIXVyv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 24 Sep 2020 17:54:51 -0400
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80640C0613CE
        for <linux-hwmon@vger.kernel.org>; Thu, 24 Sep 2020 14:54:50 -0700 (PDT)
Received: by mail-qk1-x749.google.com with SMTP id w126so622725qka.5
        for <linux-hwmon@vger.kernel.org>; Thu, 24 Sep 2020 14:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to;
        bh=qYY4Jfs6qYbQPsjI6DWBpW/IJmQf+EIEdurNQROlCNU=;
        b=Ldc1k8npZKQRcmL481jci0BdoRIHXEYC2TVi6qlwEVobiA2KHMCLoTqLrWdH5bLEoh
         LqvnnyPj+Ga85w7//EMDaN4Qpooa/TxJnu5IFJRuwP/fDwe647Tw5CEAR9MoJRXr/OZP
         wnLoMRkzEoz2A2cq//xRpnjWbui2Gul4Il7jKnirECPhx0QA6p9sjRfJM2b5Zbj0MCH3
         xK+DdUDu/KtcvZiNb/xm/L/jybvpLDtzlMGYEUNGkSV1Djup1DugZEceQ1yttLq+Ic+2
         KZcfohPc8iByq1k6oIiHj2v8Yld90Mjh8BQnWCfAZNt2NJ8EN83AjO5ze4V4GQOVf1jZ
         EC3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to;
        bh=qYY4Jfs6qYbQPsjI6DWBpW/IJmQf+EIEdurNQROlCNU=;
        b=HFN/ANy5GAV0LbH5iPqiEES5tMlYDhQt2gJXElYaExIQjhmIF7umvJ/d2KkWikYsz8
         cxrnWP9stmLRrQj2+HduAE2itx3ENwtn9jxEsKuasxh6Tl5ETuft4MC3cXhkVMtqkmP1
         1aCBo+AEcUmtKo592f3554L6yJM9hCxV6NXt0t65T2BTcrViMV5I3btNRD9EUwRowgWH
         hqyJ6joKQsNxYJMBTxyq1bAaU7Pe/E7jLG8QuGHLxhxLn4wjsWEIMboc+ocxsRQXrFjR
         EVqBgwNNs7o1xGn4qR34s2eczqf80DveNXNcaeo8+MB8YlJiM1XeA00U5R8pVwjHX2Kl
         3BcA==
X-Gm-Message-State: AOAM532CSnXcZrPJff1Jby30ATNuDUH04WMyxWjMSkHHr9fF+B/r7ZgZ
        /aaQBZSAi5IN9ibolH/bG9ZsIGvoHrEoILEp
X-Google-Smtp-Source: ABdhPJw3fZTPsUlkZqs9MovY3nYObZdbRRuCz8QrgDICNhujIUYPFiaV/POn6PRZaUwOwcF7jAfn5ZqEUwiw3YnX
Sender: "linchuyuan via sendgmr" <linchuyuan@chu-dev.c.googlers.com>
X-Received: from chu-dev.c.googlers.com ([fda3:e722:ac3:10:24:72f4:c0a8:3cfb])
 (user=linchuyuan job=sendgmr) by 2002:ad4:4af4:: with SMTP id
 cp20mr1419432qvb.40.1600984489668; Thu, 24 Sep 2020 14:54:49 -0700 (PDT)
Date:   Thu, 24 Sep 2020 21:54:42 +0000
Message-Id: <20200924215444.2865885-1-linchuyuan@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
Subject: [PATCH v3 0/2] hwmon: pmbus: max20730: adjust the vout base on
From:   Chu Lin <linchuyuan@google.com>
To:     linchuyuan@google.com, jdelvare@suse.com, linux@roeck-us.net,
        robh+dt@kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        qiongwang@google.com, zhongqil@google.com, jasonling@google.com,
        belgaied@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The patchset includes:
Patch #1 - Implmentation of adjusting vout base on voltage divider
Patch #2 - device tree binding documentation

ChangeLog v1 -> v2
  - Don't do anything to the ret if an error is returned from pmbus_read_word
  - avoid overflow when doing multiplication

ChangeLog v2 -> v3
  - Provide the binding documentation in yaml format

Chu Lin (2):
  dt-bindings: hwmon: max20730: adding device tree doc for max20730
  hwmon: pmbus: max20730: adjust the vout reading given voltage divider

 .../bindings/hwmon/maxim,max20730.yaml        | 63 +++++++++++++++++++
 drivers/hwmon/pmbus/max20730.c                | 18 ++++++
 2 files changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/maxim,max20730.yaml

-- 
2.28.0.681.g6f77f65b4e-goog

