Return-Path: <SRS0=lHFq=6T=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC0FC3A5A9
	for <linux-hwmon@archiver.kernel.org>; Tue,  5 May 2020 01:00:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D0DD2206C0
	for <linux-hwmon@archiver.kernel.org>; Tue,  5 May 2020 01:00:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TT5ZLgRJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727093AbgEEBAA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 4 May 2020 21:00:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726641AbgEEBAA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 4 May 2020 21:00:00 -0400
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5261C061A0F
        for <linux-hwmon@vger.kernel.org>; Mon,  4 May 2020 17:59:58 -0700 (PDT)
Received: by mail-qt1-x849.google.com with SMTP id x24so5471qta.4
        for <linux-hwmon@vger.kernel.org>; Mon, 04 May 2020 17:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=ZRc01jWZxTETX7I9TZ563+3JwSY2Ac8QdsDwbh/L0Go=;
        b=TT5ZLgRJe0IWb7adTrB3H6KTSQ94rgU8nLAGl5jhfcK00g2IuKN/jYwF9KO8cZKxu+
         kYhxaY43iNvfyvIO5IDqqUtzJjNVStMIzg/GAkgZeHn/q3ChDo/4ASeVZGcwnC06n8xD
         YvRllww+Lc4uBEzejMtH8Vd3CNcRqsVJY71F9GiRqOSfyDvdE3Z1IyrUTmkO8mlwFhhM
         /WOZMBqAib9AVayJWXNMEHxPS2hK4oNWMlzO/SoQGZh3lRmc5Bk1phdneLhf024ro0g1
         71UTNxyNdoq5pyfm9a8ICPGh48BeoolvyxpJEkCQCp2ibcX/+qCx6KE9n+FVRFukCo+o
         w7yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=ZRc01jWZxTETX7I9TZ563+3JwSY2Ac8QdsDwbh/L0Go=;
        b=UyRA+wGTswKJ0EhCKDi36WHMZpRR/Ax+NHdV2mbwRLerwb0u0tszb31PZGaSnGYNUK
         Bal9dC9N0QqWgY+o/zqnORINzC2XWoP+Uo1SMFGwceMXzLQJs/aWiWqAgh5DzzoU/Zgt
         nyFJv41p33i0JEenP9QeOc98v9tTm1OcV0425r15P0621VTsriU7xY8NZUbyMnl9mgXK
         OVHYXG5/T5ahwmMelDK7vNs0027kpXxbYDstRi1tFxf7Zyl3pcPQzrirBudQ8XS6mA87
         3bm8qJFlTO0BtY5nBP7ZKgWMZIaGsxgpnus0CtKbWoz53JJi0CLvBQVRyzRSSqTkTuA6
         IVlQ==
X-Gm-Message-State: AGi0PuYwaQdG4zx0t/j6ha57sG4Kov1EiQ1OEclbA8hgux3zv+pkOc4U
        EKkqPalHXOoUitxYIFGi8DuOvxHT
X-Google-Smtp-Source: APiQypJb6tNxVMvi+wPK4pQgdeBaimLuT330+AhVGn2zNQADUExkOyU0SaYXMTV4EBTkG++c3hBOUPSP
X-Received: by 2002:a05:6214:1402:: with SMTP id n2mr406085qvx.104.1588640397829;
 Mon, 04 May 2020 17:59:57 -0700 (PDT)
Date:   Mon,  4 May 2020 17:59:44 -0700
In-Reply-To: <20200504235428.GA122247@roeck-us.net>
Message-Id: <20200505005945.228561-1-xqiu@google.com>
Mime-Version: 1.0
References: <20200504235428.GA122247@roeck-us.net>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
Subject: [PATCH v2] hwmon: (ina2xx) Implement alert functions
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

