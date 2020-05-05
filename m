Return-Path: <SRS0=lHFq=6T=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9010CC3A5A9
	for <linux-hwmon@archiver.kernel.org>; Tue,  5 May 2020 00:56:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 664B8206D7
	for <linux-hwmon@archiver.kernel.org>; Tue,  5 May 2020 00:56:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tkZg5xwD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbgEEA45 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 4 May 2020 20:56:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbgEEA45 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 4 May 2020 20:56:57 -0400
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B772C061A0F
        for <linux-hwmon@vger.kernel.org>; Mon,  4 May 2020 17:56:56 -0700 (PDT)
Received: by mail-qt1-x84a.google.com with SMTP id y31so20690qta.16
        for <linux-hwmon@vger.kernel.org>; Mon, 04 May 2020 17:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=ZRc01jWZxTETX7I9TZ563+3JwSY2Ac8QdsDwbh/L0Go=;
        b=tkZg5xwDZjunc6jRno4cF2racn45SlHn1PRlM6IOP1tPaNQBoDsJJmG/1602kiaN3A
         zHayG7gtJPo2UU4JFUfbr8cxkZJX7T8QN9ZmACXD1QCQ1aKegd7tQ0UIsQzQKCHJwr3f
         HDwGBwfd9VgX6zDGozfUNv32sejAAFwwB4rQrZTh3245Z6oJlAE4w5JgnimrCMYTbJGV
         pcZkwjtS6ILq58IAenp2HCTn0UpPmZht6Hswn/eEc5JYVwOvPypIV/bMgvhy6lK0mdrr
         NtE5wmt4gy3GxWHEQWIHY8teeljtdOTFV9qybDgf90cZpaaJXgqtSVEu3/UTeSpRJ+1T
         kdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=ZRc01jWZxTETX7I9TZ563+3JwSY2Ac8QdsDwbh/L0Go=;
        b=dAZZyzBOeJ08WA4RRFnUPeStnNbyt8nt5JA3cKnwJqc9y5E23WRqXq/OxEENQgFUB6
         dCCa2ksZzx+qY6oEzHI7vHfxz2UHrVaLPG4qEP+tPeku3rkCxxrNPGiL+cZ4W3n0gEMz
         L8ofZwxz++b9KWB6TaRx/EFzHDr5LE+hgZUYbkXc8E7A1KTVA0cH6CWG6L35G284Fje+
         Qop76xkRYHoQO2dcJYvC5sqDeHoxQdogoO/zd0BSr7PnfZlSZMz7gfTG+LTDlaIgorYx
         womrsfGeBvlLff8g/nXd7Ue7tIRjDF4PKH5eqL2smeX/h9O/9AnThADxddc78+Ht7MxZ
         yZZQ==
X-Gm-Message-State: AGi0PuZZUQg8r3n3fHts2eTdq/W9Ph5UUNynFHLqUQRdMBi/KsnATDju
        t51hQIZKbfWA2LXkeDmrbcpusxDA
X-Google-Smtp-Source: APiQypIdRkHWqPVX2g9WDnRy2TsvSmhyoq9hxpi5yCXo3mYOjQW7ymEFXcOvSl9CmUtKooprGoxhYXb+
X-Received: by 2002:a0c:e992:: with SMTP id z18mr370515qvn.25.1588640215129;
 Mon, 04 May 2020 17:56:55 -0700 (PDT)
Date:   Mon,  4 May 2020 17:56:42 -0700
In-Reply-To: <20200504235428.GA122247@roeck-us.net>
Message-Id: <20200505005644.226627-1-xqiu@google.com>
Mime-Version: 1.0
References: <20200504235428.GA122247@roeck-us.net>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
Subject: 
From:   Alex Qiu <xqiu@google.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


Hi Guenter,

Thanks for pointing these issues out! I wrapped them up with config_lock, since the shunt resistor value in memory is needed to calculate the power reading, and it's also guarded by the same lock. Thx.
