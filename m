Return-Path: <SRS0=ITnn=WY=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A06FC3A5A1
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Aug 2019 15:47:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4A3102070B
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Aug 2019 15:47:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lmG0KQBl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbfH1PrI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 28 Aug 2019 11:47:08 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38687 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726475AbfH1PrH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 28 Aug 2019 11:47:07 -0400
Received: by mail-pf1-f193.google.com with SMTP id o70so56304pfg.5
        for <linux-hwmon@vger.kernel.org>; Wed, 28 Aug 2019 08:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:subject:to:from:user-agent:date;
        bh=sFhySaQPXwX9MRQe0foAX2FYmuzG6cNkdJdqj7EEblY=;
        b=lmG0KQBlWpjKnZlFHfDQlTm9UOwyYvuDM2fH4v0HichQhDaCFoUpVjTGO/VYilr63R
         q/8qZgh5b7cA5G0yGufIGhfLvkEyqd/DXHHpDtdOdR0DE3i6CB3JPKhcJboupIJj+54m
         YnTjc8/M9Sh82KrMldlQHCTsPlcaRwPU4/c0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:subject:to:from
         :user-agent:date;
        bh=sFhySaQPXwX9MRQe0foAX2FYmuzG6cNkdJdqj7EEblY=;
        b=N9Wu1DTxptlYmaTE7szncKmAnn0rkOjv/vEtquMSv4evYVDEMtl6liqkINQqxEh0vo
         KccS2t13SlKIzsdV298ymBn8t6H6Enkj3LTKyivFqIfxxb1finf9piw4Lu1/0/F4uqKN
         KzW+0+naSc02hmuYTg97x6Txki5PgR5Kb+wI5JwIg/v2DIj1N32XfRsiDmWXW+zqG9YL
         FxQ2qpRrnsn3sG9xjp6bp7ijggDBgVxqAr4QWDK+3yqCqOJZh02sBrAGOtUIbIZNzrZa
         7TVXLKKWVW82bZSJy3Pzlm3DvL1pzccP95aUhnhTLVfYn+MV7bpvvMtIOeueUeWTUiOV
         ocOg==
X-Gm-Message-State: APjAAAU95+yZX1Na3tSPy0VIqzCxz05slNt2VwV/WIC3i6irvysJvsoW
        hDBnevPmTcQq3XPy5DCIqSiF+5WhXEO1ag==
X-Google-Smtp-Source: APXvYqyFNtvh9DFPjG1vU7r5zU4Ke58Q2L583umHLa/6bPVIvqw/Q33fbEVhHGx/68HWhv8CEPjhwQ==
X-Received: by 2002:a63:2148:: with SMTP id s8mr3960898pgm.336.1567007226929;
        Wed, 28 Aug 2019 08:47:06 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id s11sm7842018pgv.13.2019.08.28.08.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2019 08:47:06 -0700 (PDT)
Message-ID: <5d66a1fa.1c69fb81.a6c42.f3f9@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190828083411.2496-2-thierry.reding@gmail.com>
References: <20190828083411.2496-1-thierry.reding@gmail.com> <20190828083411.2496-2-thierry.reding@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: pwm-fan: Use platform_get_irq_optional()
To:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Kamil Debski <kamil@wypas.org>,
        Thierry Reding <thierry.reding@gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Wed, 28 Aug 2019 08:47:05 -0700
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Quoting Thierry Reding (2019-08-28 01:34:11)
> From: Thierry Reding <treding@nvidia.com>
>=20
> The PWM fan interrupt is optional, so we don't want an error message in
> the kernel log if it wasn't specified.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

