Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 123CFC07E9A
	for <linux-hwmon@archiver.kernel.org>; Wed, 14 Jul 2021 09:48:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E7545613C5
	for <linux-hwmon@archiver.kernel.org>; Wed, 14 Jul 2021 09:48:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238840AbhGNJvo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 14 Jul 2021 05:51:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238337AbhGNJvo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 14 Jul 2021 05:51:44 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C35C3C06175F
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Jul 2021 02:48:52 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id bn5so2095128ljb.10
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Jul 2021 02:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=tLPia/JvDmfSBss+c22zamSy+WTSWu17A9qMJLYq21I=;
        b=RpRQmzImKV/InzSvJZpEUvsGpVhB3y9t3ZHqYabm6LbJRNuiOuH2AI5rTinjLbkWUU
         558F0BPt8POfxnNmwQVni7rGpVBXW3ACOJlaUJVrE+ze5jOkauyQ6fTD+KbISu61B4tC
         Rt/YjwPQ/4tSmNWy/cuWK2GPT+lAz1LBSEUlOF1/mIZTIXbscKIW87SxCxJ3UFK074fa
         N8m2ZBBBHn35A2H2kpVLPpfCwv9JbrynLVyxaf6jzULaSlKEcsS1R2z2qEeIGTlgGcPy
         hd3hvOoKz2A5gEdqbd7/PrerZjRBHr+PCxRxzLMFTNyvN+j+rvMvWWBAs3qJwtl+onhZ
         ODOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=tLPia/JvDmfSBss+c22zamSy+WTSWu17A9qMJLYq21I=;
        b=j7XeCgub8yKk1MDjXN3R+KsW5BCTrNlQg/hfrUdXEl4O3d9G1+g2uuYoIE/t++o4Kj
         oHWdNovcum3PRDxdi2WB6PdqXu78dWoYlJizGe3kxbEtU1njWx5ncRGOxtcJOpbRWbBJ
         7Vfu6r51FDd1UyyeEv7nXNiHOP0YwiSY1866m43p60aUspCtTgl0BGUSCmFuxxMv4OJG
         W6DrVibFc8oNyB6sZxK9fmOTZpdXvrKvPioNOGfV3lzzVdpFmOmMWGXtu6jTAk2SpYKy
         m0h4Opl92Flew7kxTZHzXoDX7sFYYKE7FRJp0Br7eq5l3TiXiwwB+G9j6P7JdBL4B26C
         JBzA==
X-Gm-Message-State: AOAM532UL/ZKxYsMmsdxt/GbQH+Kimtt6uHWIuquu2Qq3+8hS1F5C+m4
        omuzEAboYFSrVtnqCv3+e8d5a6ZIY9JxHPdLpzjDf0Pq+x0=
X-Google-Smtp-Source: ABdhPJwtEfVJzGPQoF55vZgz65BZHkxwVLYH4X39Nz7Okv98rMHbDiwQc/4pjVoYTpPiq0PxdpjSDlTMMDF6cjZWy7c=
X-Received: by 2002:a2e:8049:: with SMTP id p9mr8300465ljg.505.1626256131071;
 Wed, 14 Jul 2021 02:48:51 -0700 (PDT)
MIME-Version: 1.0
References: <202107080039.1680d7Eo018443@systol.god.lan> <CAMFK4TPNYJeEJdfu5Wti7G34m+-tcZvA2wv0N87aPsGq2eygvw@mail.gmail.com>
In-Reply-To: <CAMFK4TPNYJeEJdfu5Wti7G34m+-tcZvA2wv0N87aPsGq2eygvw@mail.gmail.com>
From:   Henk <henk.vergonet@gmail.com>
Date:   Wed, 14 Jul 2021 11:48:40 +0200
Message-ID: <CAMFK4TM0MCEGWs=zCJZLsdnUJKqvM+-0fxZTDhJd864SAG8=ng@mail.gmail.com>
Subject: Re: [PATCH] hwmon: nct6775: Add missing voltage reading NCT6796D
To:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The nuvoton driver has quite some longstanding issues, as far as I can
tell the alarm bits and input registers are not properly configured
for a bunch of the chips.
And this patch only addresses a tiny proportion of the issues.

It would be helpful to get some meaningful feedback.

Is there at least any interest in solving this issue?

Op do 8 jul. 2021 om 02:42 schreef Henk <henk.vergonet@gmail.com>:
>
> Retry with sendmail  hope this helps...
>
> ---
>
> Noticed in the documentation that the NCT6796D actually has 16 analog
> voltage inputs, where only 15 are configured.
>
> See: https://www.nuvoton.com/resource-files/NCT6796D_Datasheet_V0_6.pdf
> page 59-60:
>
> 8.6.2.1. Voltage Reading
> NCT6796D has 16 voltage reading:
> ....
> and the missing one in the driver:
> VIN9: Voltage reading Bank 4, Index 8F
>
> This patch adds support for in15 on the NCT6796D.
> ---
>  drivers/hwmon/nct6775.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
> index 5bd15622a85f..385ef79d79c4 100644
> --- a/drivers/hwmon/nct6775.c
> +++ b/drivers/hwmon/nct6775.c
> @@ -28,7 +28,7 @@
>   * nct6792d    15      6       6       2+6    0xc910 0xc1    0x5ca3
>   * nct6793d    15      6       6       2+6    0xd120 0xc1    0x5ca3
>   * nct6795d    14      6       6       2+6    0xd350 0xc1    0x5ca3
> - * nct6796d    14      7       7       2+6    0xd420 0xc1    0x5ca3
> + * nct6796d    16      7       7       2+6    0xd420 0xc1    0x5ca3
>   * nct6797d    14      7       7       2+6    0xd450 0xc1    0x5ca3
>   *                                           (0xd451)
>   * nct6798d    14      7       7       2+6    0xd428 0xc1    0x5ca3
> @@ -209,14 +209,14 @@ superio_exit(int ioreg)
>
>  /* Common and NCT6775 specific data */
>
> -/* Voltage min/max registers for nr=7..14 are in bank 5 */
> +/* Voltage min/max registers for nr=7..15 are in bank 5 */
>
>  static const u16 NCT6775_REG_IN_MAX[] = {
>         0x2b, 0x2d, 0x2f, 0x31, 0x33, 0x35, 0x37, 0x554, 0x556, 0x558, 0x55a,
> -       0x55c, 0x55e, 0x560, 0x562 };
> +       0x55c, 0x55e, 0x560, 0x562, 0x564 };
>  static const u16 NCT6775_REG_IN_MIN[] = {
>         0x2c, 0x2e, 0x30, 0x32, 0x34, 0x36, 0x38, 0x555, 0x557, 0x559, 0x55b,
> -       0x55d, 0x55f, 0x561, 0x563 };
> +       0x55d, 0x55f, 0x561, 0x563, 0x565 };
>  static const u16 NCT6775_REG_IN[] = {
>         0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x550, 0x551, 0x552
>  };
> @@ -478,7 +478,7 @@ static const u16 NCT6776_REG_TEMP_CRIT[32] = {
>
>  static const u16 NCT6779_REG_IN[] = {
>         0x480, 0x481, 0x482, 0x483, 0x484, 0x485, 0x486, 0x487,
> -       0x488, 0x489, 0x48a, 0x48b, 0x48c, 0x48d, 0x48e };
> +       0x488, 0x489, 0x48a, 0x48b, 0x48c, 0x48d, 0x48e, 0x48f };
>
>  static const u16 NCT6779_REG_ALARM[NUM_REG_ALARM] = {
>         0x459, 0x45A, 0x45B, 0x568 };
> @@ -1047,9 +1047,9 @@ div_from_reg(u8 reg)
>   * Some of the voltage inputs have internal scaling, the tables below
>   * contain 8 (the ADC LSB in mV) * scaling factor * 100
>   */
> -static const u16 scale_in[15] = {
> +static const u16 scale_in[16] = {
>         800, 800, 1600, 1600, 800, 800, 800, 1600, 1600, 800, 800, 800, 800,
> -       800, 800
> +       800, 800, 800
>  };
>
>  static inline long in_from_reg(u8 reg, u8 nr)
> @@ -1143,7 +1143,7 @@ struct nct6775_data {
>         /* Register values */
>         u8 bank;                /* current register bank */
>         u8 in_num;              /* number of in inputs we have */
> -       u8 in[15][3];           /* [0]=in, [1]=in_max, [2]=in_min */
> +       u8 in[16][3];           /* [0]=in, [1]=in_max, [2]=in_min */
>         unsigned int rpm[NUM_FAN];
>         u16 fan_min[NUM_FAN];
>         u8 fan_pulses[NUM_FAN];
> @@ -4200,7 +4200,7 @@ static int nct6775_probe(struct platform_device *pdev)
>         case nct6796:
>         case nct6797:
>         case nct6798:
> -               data->in_num = 15;
> +               data->in_num = (data->kind == nct6796) ? 16 : 15;
>                 data->pwm_num = (data->kind == nct6796 ||
>                                  data->kind == nct6797 ||
>                                  data->kind == nct6798) ? 7 : 6;
> --
> 2.26.2
