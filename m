Return-Path: <SRS0=lHFq=6T=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CE69C3A5A9
	for <linux-hwmon@archiver.kernel.org>; Tue,  5 May 2020 00:59:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2988C206C0
	for <linux-hwmon@archiver.kernel.org>; Tue,  5 May 2020 00:59:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="snD9oeKi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726744AbgEEA72 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 4 May 2020 20:59:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726531AbgEEA70 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 4 May 2020 20:59:26 -0400
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE63FC061A0F
        for <linux-hwmon@vger.kernel.org>; Mon,  4 May 2020 17:59:24 -0700 (PDT)
Received: by mail-qk1-x74a.google.com with SMTP id l4so598316qke.2
        for <linux-hwmon@vger.kernel.org>; Mon, 04 May 2020 17:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=ZRc01jWZxTETX7I9TZ563+3JwSY2Ac8QdsDwbh/L0Go=;
        b=snD9oeKiHuRErrbgdP/5qJJB2DzwZKY9GOsLiTDuv7xWC9BAIjvv58gef4/rUgVUcE
         PppVbK33THuYWCtRXz5EHTeD2IT5NbPrMIhC6PFpi+hICfuBz26vw1O1+R9CpwwsyRGc
         U+x8uC9MJFY3Y6CHZ0bV8gwpulIX96opi96yZN+SWw1kNWYU5/Lp5yUN4i7UbFeF/4jv
         PLd7yin/dDXLTgY9bHFsdvyJNyO4BklUvgkMoEEmS4tb7AcJTdi0G8hj/58jRedCVIKn
         gY0DS2P6L6ELGXmM+93kyiu/H7YpLdfLj25Vpa8ZYoU9qv89boXz3tpU1aZ13nKpJVBa
         IGCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=ZRc01jWZxTETX7I9TZ563+3JwSY2Ac8QdsDwbh/L0Go=;
        b=KQvn0PfS20Hwhsj28E0yjsJLlkXLIs6DYMXcPzE+FUsjQnaKPF4zSlUfXHGiIbM4Fu
         k/gqXm0zy4q+pd/XTiX3ZlCvt99XL9g0tkemrjGF3wbmk7DOSMy3VasIzm/wND4RV5Qw
         7pGlSDFXHlMZRlm/Aw0cO7Nh7C9Up1R96Vn87FlbWQ84gUHdphrGb65FAcyCIQ+N/TO+
         SoKWmze7EHlSsYg/hYpC7D7ZhdkX4MVs0o/T09KDpMAhAuxKm5/fjfsb1ADONCz/b0wv
         40l1BC5vUmnZaPhfAGWpDH4XR9qDgvOxdB2wvvroScD2uYonZU1ZGXWPQl2YlsTJobkX
         PvCw==
X-Gm-Message-State: AGi0PuZzYSe0eaeEbfq4JVbRIXBayXyivlQwMA9h5jYVuepOjMwBg/Ry
        vJdVDfYruKdAViEXGKpZPqmbFs4v
X-Google-Smtp-Source: APiQypIv5cc3hIntaT4rrXzm4xlEt8w4Qo/zWZGpI/ylEZsrT2+mDdyCC9mQmVCEGmirjGRPDicVudPd
X-Received: by 2002:ad4:4e84:: with SMTP id dy4mr358228qvb.139.1588640364128;
 Mon, 04 May 2020 17:59:24 -0700 (PDT)
Date:   Mon,  4 May 2020 17:59:04 -0700
In-Reply-To: <20200504235428.GA122247@roeck-us.net>
Message-Id: <20200505005904.227491-1-xqiu@google.com>
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

