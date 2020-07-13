Return-Path: <SRS0=nJvH=AY=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78C54C433E1
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Jul 2020 17:40:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5828020674
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Jul 2020 17:40:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="fFAlKRqw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729703AbgGMRkj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 13 Jul 2020 13:40:39 -0400
Received: from mout.gmx.net ([212.227.15.19]:55783 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729700AbgGMRki (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 13 Jul 2020 13:40:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1594662019;
        bh=CdgJg309SEZxK0xviXVAcgdURPo6x1qBniXM5KA2Ui8=;
        h=X-UI-Sender-Class:Subject:From:To:Cc:Date:In-Reply-To:References;
        b=fFAlKRqwNtABZqY6igXD8UZ/vBodUPFpBAAyQF5Vh+Uk3Xe2lx7QIkvi/gcmd1hzv
         T5bA58K651kUctM+A8CkEGUEDM3+dbK8XdxYLwypNp6fcNNCpUpluP0jj2Nv33kzn+
         ciWFTiR9f+uc0VNgQM4+p3B6C2QJvQ3/YRy9QYVk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.0.2] ([84.156.118.156]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MulqD-1kmatU21Nz-00rmb9; Mon, 13
 Jul 2020 19:40:19 +0200
Message-ID: <119b8c4d3791bafae015f1643b4fba9114d3eb65.camel@gmx.de>
Subject: Re: hwmon (nct6775): Please fix Invalid temperature source error
 for NCT6798D
From:   Stefan Dietrich <roots@gmx.de>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org
Date:   Mon, 13 Jul 2020 19:40:18 +0200
In-Reply-To: <20200712224620.GA19097@roeck-us.net>
References: <66053ce744dafbad6925df53b6ef2db1e2859740.camel@gmx.de>
         <e4ad12d1-3dca-2ff5-a0a6-12dc6dc22c83@roeck-us.net>
         <48f415c34f4ca3f5239650711daaf1e11342da8e.camel@gmx.de>
         <d54732db-255c-54be-ab43-997369e0da87@roeck-us.net>
         <e02ef4f8633e035ecf6019abb72e3a22bfc29732.camel@gmx.de>
         <20200712224620.GA19097@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Qsz00SuLSc1ookRyjJNvu6i/6ch3BkMOcGHu97EcohXXp7ldafb
 xfa2cERSoE9xYYHMu9P3WBtbKG2JiV+TxSTU0709zaD7jTHbwCERMgOUrBYndar/3law5Gz
 ctSOhFCG26GXV44A5pkVbl1GuiwXMa3zmsoZ0rsiYFqAvDSMTS75bHVgpD1z4yFdJc1Zjld
 XqLDz/Q8mQ68r3C8j3mjQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ODKUdpaXVhg=:cSHPXhseURFRcA6J7X1INu
 ZlwsJgFwV1VVR6CFs2/9HJ48ExQMGlwO55jTC7x6YqKwVIWRd53SdaveF8H9lRh2I8LtHLOjJ
 YiMboVQGkFKG3twxxcPLBIk7BDN73Blbebub4QCRnxBmQTGIsr0MozNKNJGVm89K0IRHkPUhx
 NAbdC2K/31WMDXVft4zdIp9pZINLFMBaQAIQDkVeDyd0X2u/t+zJJjXhvRPNkE4m0i1vuluey
 inMrtg3TePAGHbT8am5QKe6ILkeDoazuRYYtBBr+awCsoGYNJyE5PG92ORZ4/dXxGE+RPNbIR
 Aj3WhbadyApaZ1e2SD9HfkQC6Bp+csUiHq8k7hwwYvTNXkd/s7aaQp7nGtv5D268RtdXYAPuU
 rqCLi4S1xzRygsatOWgAvqFrWH9F6pf5LF9X66bwTdI6cztJJt1+EX12tCYP38p3KOtnexpLk
 oPUVcszH46Le38jtUJqxZHDiU0/fBkvRHVOh+vYG5PPVdyZ8PNRTvM1JNDqwgvVWttn1D+qDm
 uQBJeWeVrgMdRk3EVCZDa4sWlxPfX5EOdgT7QZldsfk591JZ+aXXSTtZPtQCX6C9Gk4/Ev30X
 7o1X/y76vxy8KXgpttZZoaWm+6RUPwIt/bqy3vm4XW9FQo7PLlskmFq4HCiCMIMfU2bhzuX3s
 Kw4WN2/iUwPtfcwMFMYfjOv/1AygjFV2NInCyfLq5MsL9Ou6/xlhniZy0N+iWVgTF9Ry4VlnW
 sNLbQpx6yG2q58intJCKqjvG5hGcvcMaRX+ZmFeu0oKNeuGBnPMyV1yosMXBuNYl8qY/Zpd2k
 g5SPV8jSuJsKTLocG7oSokJdU0MBjwGwXqP2c2iWCDnVTBSolWLpVDXMXeNlKNDxxz8uLAHMl
 1YlywcMcafowAeu1g8JxNoKioquNkClnhtBqTqCOetHyKguaNeM3qlJn9TrJRBvrP9hsLbGSD
 jjC84G/B8iKY0OGl8oWoXWPJVBM70dEBCZF0F+801JVNODcQzuiTs7kNLrxCMBipLaYVAuB/C
 +TIbv7owzioBdR8l/nf8Ld2jNQRUSF+NKMAxPp+nMqoTeZXseHKnivFe1xyS5/sGpPJ6GOICZ
 pkhWZUhNL9aXUB0pSPIOvp+zJYlzYIS2WRPVi1tA94rnqhaa0RBu9YdHTb8MPGpyU1v/N0SbJ
 EoLJgnFYN/7rhgQl0RqHSTwqmX6Eyqi1ZRV2aV17iT2NniOB+7MTDtjoVSDuyqZ0CPMi26JEN
 /GVopbk9P8E6YtQ47
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, 2020-07-12 at 15:46 -0700, Guenter Roeck wrote:
> On Sun, Jul 12, 2020 at 09:51:42AM +0200, Stefan Dietrich wrote:
> > On Sun, 2020-07-05 at 07:21 -0700, Guenter Roeck wrote:
> [ ... ]
> > Would you mind giving me a pointer on how this would be done? I
> > assume
> > for those familiar with the driver it will be less than a handful
> > of
> > lines of code?!
> > I will certainly report back as soon as I have obtained any
> > results.
>
> Something like the diffs below should do. Caution - this is cut-and-
> paste,
> so you'll have to make the changes manually.
>
> Guenter
>
> ---
> diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
> index 7efa6bfef060..ec427ce503f0 100644
> --- a/drivers/hwmon/nct6775.c
> +++ b/drivers/hwmon/nct6775.c
> @@ -786,9 +786,9 @@ static const char *const nct6798_temp_label[] =3D {
>         "Agent1 Dimm1",
>         "BYTE_TEMP0",
>         "BYTE_TEMP1",
> -       "",
> -       "",
> -       "",
> +       "Unknown28",
> +       "Unknown29",
> +       "Unknown30",
>         "Virtual_TEMP"
>  };

Dankeschoen - I just tried that, but I'm still getting

[  324.901595] nct6775 nct6775.656: Invalid temperature source 28 at
index 0, source register 0x100, temp register 0x73
[  324.901637] nct6775 nct6775.656: Invalid temperature source 28 at
index 1, source register 0x200, temp register 0x75
[  324.901679] nct6775 nct6775.656: Invalid temperature source 28 at
index 2, source register 0x300, temp register 0x77
[  324.901722] nct6775 nct6775.656: Invalid temperature source 28 at
index 3, source register 0x800, temp register 0x79
[  324.901765] nct6775 nct6775.656: Invalid temperature source 28 at
index 4, source register 0x900, temp register 0x7b
[  324.901807] nct6775 nct6775.656: Invalid temperature source 28 at
index 5, source register 0xa00, temp register 0x7d

I double checked that it really is the modified driver that is loaded.
Now does that mean the diffs did not do the trick, or that there's
really nothing to see here?


Thanks,
Stefan

