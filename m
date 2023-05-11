Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2B40C77B7F
	for <linux-hwmon@archiver.kernel.org>; Thu, 11 May 2023 21:02:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238397AbjEKVC4 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 11 May 2023 17:02:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232629AbjEKVCz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 11 May 2023 17:02:55 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A9396A76
        for <linux-hwmon@vger.kernel.org>; Thu, 11 May 2023 14:02:54 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-96649b412easo996632066b.0
        for <linux-hwmon@vger.kernel.org>; Thu, 11 May 2023 14:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683838973; x=1686430973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TKHC85CCW/UQigcQWcB/z2aPINHr0qLuF+trcts+SxM=;
        b=dPMF0/umyC2nOyff8/CdHJPFZ9zHm0vHdrFz6GQcqxtFmVv9/f+Dv5XsXGtpLa1n9x
         iGMSsPo0t7u/E3P7OVe5tq/bTApyJnsx/pey5NvVrzfYtbs68u0vyPBCeM4vhmU3mrBZ
         D8/3q9x9JU88Z9uhRRVI+EjSRmgeE7/PxuaSXARoWSH5pWhG+lJo3CgKOqX3+iJnIDbQ
         s5a8DiIhJSUhtC7agQBUbAzaJK5VmglaK+e4Je4d4sO1XUwPXG5Bpj/JlSKB80vLz1Nz
         gY6xoL3wHtT6NFZ2bPQt9nWlM9WRcD6i5okZgurjhvWtfzsOsSa+tAkRL2vEHEsYEuRH
         sRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683838973; x=1686430973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TKHC85CCW/UQigcQWcB/z2aPINHr0qLuF+trcts+SxM=;
        b=RcNtXS9UoofXt/Ge/TiyRTxzfAshr3/5OK2nBN679SQaxOOs90NbQbvWpAsnC5lX9l
         OVbiBlz4DLr4u23YTRbHQeMOVpGeygpDPKH/3i39IkLBGHo6/vLzL4TNRna55C+yG5ab
         /gHDkFXNFKpj+V5ZmGy3TiV9bC898eFYFbZE31czNUbog99gzZJnffpuAvs0E+Gw0aCP
         ddzw8Xfg7ZpQ3n2Tg2NTqgLAmvm+zEjakYKz0/KLH+93srwSRZ1AlO8+EMxVSoL+zq/Q
         Km0QgNNc0QeU0YuZuGsUHObBxJqjTvRngC/ShxbB4zto6ked+1tjDg3x201tcO87WCm9
         l6/Q==
X-Gm-Message-State: AC+VfDzELpyA9lN/F9Non5F3CaH/58p4jk8mS9c1ZSGZcYtOLJG2zsZq
        ClIxhZtDhVrw+EETza20JmE=
X-Google-Smtp-Source: ACHHUZ7sv7rXS60wD/4EqzDEAtZIV0Pjeklgth0TpSig1C0hr9Eg4EXzm+Kbh6YMN2yRzNs8ve/OYQ==
X-Received: by 2002:a17:907:744:b0:953:83a2:c813 with SMTP id xc4-20020a170907074400b0095383a2c813mr16827045ejb.32.1683838973031;
        Thu, 11 May 2023 14:02:53 -0700 (PDT)
Received: from localhost.localdomain ([46.211.12.23])
        by smtp.googlemail.com with ESMTPSA id lt14-20020a170906fa8e00b0094efdfe60dcsm4399154ejb.206.2023.05.11.14.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 14:02:52 -0700 (PDT)
From:   Denis Pauk <pauk.denis@gmail.com>
To:     linux@roeck-us.net
Cc:     ahmad@khalifa.ws, jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        sebastian.arnhold@posteo.de,
        =?UTF-8?q?Jannik=20Gl=C3=BCckert?= <jannik.glueckert@gmail.com>,
        Nick Owens <mischief@offblast.org>,
        Slawomir Stepien <sst@poczta.fm>
Subject: [PATCH RFT] hwmon: (nct6755) Add support for NCT6799D
Date:   Fri, 12 May 2023 00:02:23 +0300
Message-Id: <20230511210223.1760-1-pauk.denis@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20221228135744.281752-1-linux@roeck-us.net>
References: <20221228135744.281752-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Cc: Jannik Glückert <jannik.glueckert@gmail.com>
Cc: Nick Owens <mischief@offblast.org>
Cc: Slawomir Stepien <sst@poczta.fm>
Tested-by: Sebastian Arnhold <sebastian.arnhold@posteo.de>
