Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6161DC56201
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 Nov 2020 09:57:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 09153221FE
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 Nov 2020 09:57:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xC0FljWq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725928AbgKLJ5m (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 12 Nov 2020 04:57:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727672AbgKLJ5V (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 12 Nov 2020 04:57:21 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7406AC0613D4
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Nov 2020 01:57:19 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id c16so4903848wmd.2
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Nov 2020 01:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SJdlB8xXslxrXWz+83yO6rq8sfEN0xtnjkNe/5k6q8o=;
        b=xC0FljWqdDp0JYyC2N6sRxyC4M5oR8YfJDzzWjOcUUI2nmbP1cPJsYPk+zSNsuZl91
         I2y+3FjkSM/lnfwZcAbKvd4jRftxtMK66fC2xdbI14LiJtQl2H83DDZOATO4jAtyEz1K
         CEr728uOPMjJeqsa239TbdxYsFO6ufLh9/bPVnMS+etRZ5NA6kQBhBbrbESm5lkO1q/S
         xMQjty3iW7tgKcYqnKYaU5RnAcGeNs838Z9B5bRVoVjrZYv3hJeuZzLeFB06ZW+msqOQ
         m1/0uQsgIPTLp6+nN0v/N82+WrU7N66Kfk4TRwhLvXwgZGcLpyjmSoSzoybIjwE5u9Tv
         QKWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SJdlB8xXslxrXWz+83yO6rq8sfEN0xtnjkNe/5k6q8o=;
        b=Bcdd/xCRFUi7cPkLKg4h/tBrENyHdPJt76mJD5lfkaPblCLzX+fr4lwHzFcQHtYjeU
         WRGiTjgdOUR5h4+F+KB8Dkycbhii+ro2PrwQ/RxMhO/uBjcNjZH8Gygu8HanZWXjHhkU
         x39PFkF4PJeS9Lsczd7rfwSi2JC2Tj+CugIr7h1PFAo80pZzp69fUy6snZl+ByQrVGw+
         k48WBLKky/fwmbnf/snjbBiOKdEK75sd7cAw5sIJQ/yRU/9Nh9+qujZymY47CkE0tGn9
         zqeRJpaKzVSHD8sQIOo5DLUz6s3khgEV4mWYOV8F8xN58DVRc21KCQhzEKhTl4JT+fVS
         +uQA==
X-Gm-Message-State: AOAM530ujsbZkWmvqniWSl1Wvfem62x4V0BZtETdp9xvdfuu6HbGMt0g
        Zrc6oI7ij9MO6uaayWGwXt+chw==
X-Google-Smtp-Source: ABdhPJxg3Ef2Soll0LH/c+2LR15Uk1TaaSB8m0drUb+pvQ4sDVM8xS9tns/UgMX2m4xG1FCkRr4LAQ==
X-Received: by 2002:a7b:c2f7:: with SMTP id e23mr8872342wmk.100.1605175038192;
        Thu, 12 Nov 2020 01:57:18 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id n15sm6138792wrq.48.2020.11.12.01.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 01:57:17 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     jdelvare@suse.com, linux@roeck-us.net
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        "Andrew F. Davis" <afd@ti.com>,
        Beniamin Bia <beniamin.bia@analog.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        linuxppc-dev@lists.ozlabs.org,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Neelesh Gupta <neelegup@linux.vnet.ibm.com>,
        Paul Mackerras <paulus@samba.org>
Subject: [PATCH 0/3] Rid W=1 warnings from HWMON
Date:   Thu, 12 Nov 2020 09:57:12 +0000
Message-Id: <20201112095715.1993117-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This set is part of a larger effort attempting to clean-up W=1
kernel builds, which are currently overwhelmingly riddled with
niggly little warnings.

Lee Jones (3):
  hwmon: adm1177: Fix kerneldoc attribute formatting
  hwmon: ina3221: Demote seemingly unintentional kerneldoc header
  hwmon: ibmpowernv: Silence strncpy() warning

 drivers/hwmon/adm1177.c    | 10 +++++-----
 drivers/hwmon/ibmpowernv.c |  2 +-
 drivers/hwmon/ina3221.c    |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

Cc: "Andrew F. Davis" <afd@ti.com>
Cc: Beniamin Bia <beniamin.bia@analog.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Michael Hennerich <Michael.Hennerich@analog.com>
Cc: Neelesh Gupta <neelegup@linux.vnet.ibm.com>
Cc: Paul Mackerras <paulus@samba.org>
-- 
2.25.1

