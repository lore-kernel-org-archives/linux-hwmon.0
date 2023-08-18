Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C9F7C77B7F
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Aug 2023 16:25:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351215AbjHRQYk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Aug 2023 12:24:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378605AbjHRQYi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Aug 2023 12:24:38 -0400
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E07730F1;
        Fri, 18 Aug 2023 09:24:37 -0700 (PDT)
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-56cc3453e31so772231eaf.1;
        Fri, 18 Aug 2023 09:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692375876; x=1692980676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UuxLysHfHgXmaDjRCG7hoacYwkksDqmzeaddr2U9INA=;
        b=lrePtNV7NLyPrHBpD4fWVttiNKAIATqGaL5X/CGR7SFpUwHQhUrfKzbaLq6KRKTUbb
         4bEAEF1WcNyrbZBRMEa8xDRi7H7L/bsqQ6sEvWSBaTlRdOkmF20JReRym7Izg8qCZrr8
         n2rwOeVrZ1tZJkJJtoHn2gpvgm4VyMLt/Tfztygr46aBBE1DeKdKkmLoXiGj3uxzyzR0
         XAi5M3QIZzmDMbIdZi5hiSZFXqLxGlORRu23u2U3sbp78Cw9jNBLoXYtLGN+06bbm26g
         nDL2Dq/CDmDaYV7gcejPrrjbX4KPHyMBY5b/bTIluD/x0CinBqCPQZy2Gw6jcdcl4TF9
         NtMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692375876; x=1692980676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UuxLysHfHgXmaDjRCG7hoacYwkksDqmzeaddr2U9INA=;
        b=D6r2IHnXJlADJ/BCNV/rfpTtmLLHs8Zh9ZDBLslZYy2i0ZcyxNVLocq3i7jlzvukWZ
         0HunKhSYTVByus+oH814HTVxAotuPAlH5DGrpCFuynKwgJKGEhyG2pUp+dZ4mWxwKOtm
         1Tp8rxWYVbrHaW+P/UVf3A354X+mQXn41Y3+3NDasuMJNhZOpEY4ewCDL09VMyneVEOx
         fjifzRP3l/cWJNE13bOmQEinGbtDK8hX+LZ0hOMt3ApLlkbK4fsQW6T44tuK3ngVM84F
         844FqYS1HNCYcCQVLh3i0eNRnsS0zleUyK1mGL+dSO8gTaFh7XDH8Hgavj4ESUz7u2re
         IJXQ==
X-Gm-Message-State: AOJu0YwczuxHtSz/Jt7VmugMcknPJyebjFACWMWQyz5/CAW0airosh7G
        gelk3aVuyMhlx6zzNbrES7HeBuN4yk7Y7JxdRLg=
X-Google-Smtp-Source: AGHT+IGU3ZMCRKh3cD8gBFcZeVD7oHu4Bo5GVPRQfX1ji83LYaRHXjfxTp3CmR2dfr+bkxt0kySQ7Q1jLe7MhrvlYFg=
X-Received: by 2002:a05:6870:e88d:b0:1c4:d735:38e9 with SMTP id
 q13-20020a056870e88d00b001c4d73538e9mr2868146oan.57.1692375876474; Fri, 18
 Aug 2023 09:24:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230817060644.74477-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20230817060644.74477-1-jiapeng.chong@linux.alibaba.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Fri, 18 Aug 2023 12:24:25 -0400
Message-ID: <CADnq5_OOHM4CcWUps4gput7Jh4m1r=8Z+VK79PG2vF6a3Vgkdg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Fix unsigned expression compared with zero
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc:     alexander.deucher@amd.com, linux-hwmon@vger.kernel.org,
        jdelvare@suse.com, Xinhui.Pan@amd.com,
        Abaci Robot <abaci@linux.alibaba.com>,
        linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
        linux@roeck-us.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Aug 17, 2023 at 2:07=E2=80=AFAM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> The val is defined as unsigned int type, if(val<0) is invalid, modify
> to int type.
>
> drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_pm.c:2813 amdgpu_hwmon_show_power=
_input() warn: unsigned 'val' is never less than zero.
> drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_pm.c:2800 amdgpu_hwmon_show_power=
_avg() warn: unsigned 'val' is never less than zero.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D6181
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Thanks.  The function signatures for amdgpu_hwmon_get_power() and
amdgpu_hwmon_get_sensor_generic() should be fixed up as well.  I'll
send out a fix.

Alex

> ---
>  drivers/gpu/drm/amd/pm/amdgpu_pm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/=
amdgpu_pm.c
> index 5b1d73b00ef7..fe490e5860d2 100644
> --- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> +++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> @@ -2794,7 +2794,7 @@ static ssize_t amdgpu_hwmon_show_power_avg(struct d=
evice *dev,
>                                            struct device_attribute *attr,
>                                            char *buf)
>  {
> -       unsigned int val;
> +       int val;
>
>         val =3D amdgpu_hwmon_get_power(dev, AMDGPU_PP_SENSOR_GPU_AVG_POWE=
R);
>         if (val < 0)
> @@ -2807,7 +2807,7 @@ static ssize_t amdgpu_hwmon_show_power_input(struct=
 device *dev,
>                                              struct device_attribute *att=
r,
>                                              char *buf)
>  {
> -       unsigned int val;
> +       int val;
>
>         val =3D amdgpu_hwmon_get_power(dev, AMDGPU_PP_SENSOR_GPU_INPUT_PO=
WER);
>         if (val < 0)
> --
> 2.20.1.7.g153144c
>
