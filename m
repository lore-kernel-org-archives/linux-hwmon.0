Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6533CE728CF
	for <linux-hwmon@archiver.kernel.org>; Fri, 29 Sep 2023 18:56:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233781AbjI2S4r (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 29 Sep 2023 14:56:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233807AbjI2S4q (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 29 Sep 2023 14:56:46 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1147C1B0
        for <linux-hwmon@vger.kernel.org>; Fri, 29 Sep 2023 11:56:43 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1c60f1a2652so7849455ad.0
        for <linux-hwmon@vger.kernel.org>; Fri, 29 Sep 2023 11:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696013802; x=1696618602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=viFu6r0UYe+M2GIK9v2NmILPjJMba2+ouWRdc3CGGmo=;
        b=jMV9oe6EEaoKvB+JTAdGlNYnF6xqS9J9ZjjSU7N94MPptoxN5tlNNXxAi6SLmrzfpj
         KE6yD8l6kmKZTg31bmYU4IDBGYZMUYUcWS9COrjbkKHmYtyB9cBZwCH0SQUBoc1WtL90
         i10wwRzklmZaMkxdx5Lcv9/yCiM4W4/YslX6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696013802; x=1696618602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=viFu6r0UYe+M2GIK9v2NmILPjJMba2+ouWRdc3CGGmo=;
        b=GWIssGeyJCC0vCDEklwx9rlZZa6NdTfgSR/Ph5dByiHMk24wIghwtYoApVh/Z1d7MY
         /guHdhdYS0eh9gJbczM8wY0jz1CIGL47q2IRRjmvhuZRjYoUBW1w1/uSkrGRSGwZYLDG
         PiX06vX63VuNXCubmrNYef1HQ2kF2JRee1Tetq1qBcbNZgAFRB9+ohWssrndnndpIVtG
         WEs5n2N3ZlgNAny/6+Q34VRvtMvheGeBzgvEcP7/bn6RJwsoXcshKLYe2gSkZnEpCl7R
         bXmNfaTcPyLin0mp7MkF2xojBGgMZMkp7SPPChu4Y+DN/gM+qFenRTRwzxhJzaGYT14i
         y5oQ==
X-Gm-Message-State: AOJu0Yw98EANYL0gu0cOigfVqwG1splgSl4b+nOZbAOn9JZHERsFBq6R
        tx2nfzGjyezMCTsSEpUn9gVDyQ==
X-Google-Smtp-Source: AGHT+IG6ycLvJhoXuGVCEKkMG9iMqITIOTXsWbm9Kz37/RyNws1GzSB+B8H7SuyFFn3vA3gbgMfwlw==
X-Received: by 2002:a17:902:c948:b0:1bf:193a:70b6 with SMTP id i8-20020a170902c94800b001bf193a70b6mr8030559pla.5.1696013802531;
        Fri, 29 Sep 2023 11:56:42 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id ix5-20020a170902f80500b001c733c0e456sm3829091plb.22.2023.09.29.11.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 11:56:42 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Justin Stitt <justinstitt@google.com>
Cc:     Kees Cook <keescook@chromium.org>, linux-hwmon@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (ibmpowernv) refactor deprecated strncpy
Date:   Fri, 29 Sep 2023 11:55:45 -0700
Message-Id: <169601374243.3010937.14194696181874272859.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230919-strncpy-drivers-hwmon-ibmpowernv-c-v2-1-37d3e64172bc@google.com>
References: <20230919-strncpy-drivers-hwmon-ibmpowernv-c-v2-1-37d3e64172bc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, 19 Sep 2023 05:22:51 +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> A suitable replacement is `memcpy` as we've already precisely calculated
> the number of bytes to copy while `buf` has been explicitly
> zero-initialized:
> | 	char buf[8] = { 0 };
> 
> [...]

Applied to for-next/hardening, thanks! (I've updated the Subject here
and with the older "refactor" subjects...)

Take care,

-- 
Kees Cook

