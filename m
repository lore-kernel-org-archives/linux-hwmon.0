Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 723F7C76196
	for <linux-hwmon@archiver.kernel.org>; Mon, 10 Apr 2023 19:15:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbjDJTPg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 10 Apr 2023 15:15:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229748AbjDJTPI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Apr 2023 15:15:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A828D171F
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Apr 2023 12:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681154071;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=V929y0DuvK7xtChWhUBw/eFqjVuZ3zFTuJadDMK7r9I=;
        b=P/F8ehYuVXRwObVrKbBbr3dH1EXhyKwBNPktBGkwtXLJtwgfXidlqEPvKFBfgIdtLbW/Eb
        GXl8EHfVzPwrbb/hMtY+ZOu4dGQjtn8V5FToeLqh68mMDySUfys85sMPs9BUhP/3k9AbIh
        CaBXucsMT7mehQcErbBjEHpNodqh8MU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-345-tndBRlm1OHGD_EdRHWytOw-1; Mon, 10 Apr 2023 15:14:30 -0400
X-MC-Unique: tndBRlm1OHGD_EdRHWytOw-1
Received: by mail-wm1-f70.google.com with SMTP id r20-20020a05600c35d400b003edd2023418so4321010wmq.4
        for <linux-hwmon@vger.kernel.org>; Mon, 10 Apr 2023 12:14:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681154069;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V929y0DuvK7xtChWhUBw/eFqjVuZ3zFTuJadDMK7r9I=;
        b=ZEcBQlgi5ZaK9+wUdM/pAgkl1FKufxa53tsiIaOD4SmogVZOmh/dZdRPkYZR4o+Ogz
         zMGjeZfMo64iUSmyN/BWbU8GuHA692QK1osJVl7v9emAJPtbTbFS9N+bMdmoENKH3C51
         3S4rry4QdlopuDymPFM64P5DodD7cYIGXA+Ldvjsp5N9cwcDoRmSr9lz9jNx0gIdt3Qs
         Vo5hcg8gC0FNweqMGSIHtEEilO70E4Mn4EHeCsShKa5TVgehJXoLqHp5myLzlVUDWY2z
         WSqrKGO8W5IUJF9JbW5x4PoPfR/CazSfHWdzKxDpN5/mlkMdDmgttfUHd9dZcuigtFgd
         bOCA==
X-Gm-Message-State: AAQBX9cml7gpm1daakwVM5xULSnQQzM0kCRDiCZC7koHNkHbTv15a3sS
        1iT0ZFzEg7IgGjdKttp49bYsRPrEtCZp+Dc5d/Pdr+iolIS03cftY7yOj9VbdxhrE1DrjJpqUOy
        vgnBdu9o4PzyLWSmFe3vNtv1cps7zLO8g0w==
X-Received: by 2002:a5d:494c:0:b0:2c7:6bb:fb7a with SMTP id r12-20020a5d494c000000b002c706bbfb7amr6847042wrs.54.1681154069154;
        Mon, 10 Apr 2023 12:14:29 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZB01v4hRzyu7pDWRWnh2OLlh5MZFbKYbk/7NuN3PZ2CE4+XympLGJoeAWb/QCYhp3Tn3l29w==
X-Received: by 2002:a5d:494c:0:b0:2c7:6bb:fb7a with SMTP id r12-20020a5d494c000000b002c706bbfb7amr6847028wrs.54.1681154068798;
        Mon, 10 Apr 2023 12:14:28 -0700 (PDT)
Received: from redhat.com ([2.52.10.80])
        by smtp.gmail.com with ESMTPSA id e10-20020adfdbca000000b002ceac2ccc4asm12473201wrj.23.2023.04.10.12.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 12:14:28 -0700 (PDT)
Date:   Mon, 10 Apr 2023 15:14:24 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Alvaro Karsz <alvaro.karsz@solid-run.com>,
        Jason Wang <jasowang@redhat.com>,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] vdpa: solidrun: constify pointers to hwmon_channel_info
Message-ID: <20230410151317-mutt-send-email-mst@kernel.org>
References: <20230407150130.79917-1-krzysztof.kozlowski@linaro.org>
 <0395eff6-694e-1a2f-de78-8cb9d7b129a7@roeck-us.net>
 <20230410055634-mutt-send-email-mst@kernel.org>
 <2facc7cd-81fa-b8b7-6974-217392906578@roeck-us.net>
 <a6e07080-0c0d-0461-52a2-768d60af53c3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6e07080-0c0d-0461-52a2-768d60af53c3@linaro.org>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Apr 10, 2023 at 06:48:12PM +0200, Krzysztof Kozlowski wrote:
> On 10/04/2023 16:03, Guenter Roeck wrote:
> > On 4/10/23 02:56, Michael S. Tsirkin wrote:
> >> On Fri, Apr 07, 2023 at 04:08:30PM -0700, Guenter Roeck wrote:
> >>> On 4/7/23 08:01, Krzysztof Kozlowski wrote:
> >>>> Statically allocated array of pointed to hwmon_channel_info can be made
> >>>> const for safety.
> >>>>
> >>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>>>
> >>>> ---
> >>>>
> >>>> This depends on hwmon core patch:
> >>>> https://lore.kernel.org/all/20230406203103.3011503-2-krzysztof.kozlowski@linaro.org/
> >>>>
> >>>> Therefore I propose this should also go via hwmon tree.
> >>>
> >>> I am not going to apply patches for 10+ subsystems through the hwmon tree.
> >>> This can only result in chaos. The dependent patch is available at
> >>>
> >>> git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-const
> >>
> >> Doesn't it cause build errors or warnings there?
> >>
> > 
> > Are you saying that "hwmon: constify pointers to hwmon_channel_info" applied on its own
> > on top of v6.3-rc5 (as done in above branch) causes build errors or warnings ?
> > I have not seen any such reports, and I don't immediately see why that would be
> > the case. Please elaborate.
> 
> My tree and patches are extensively tested by kbuild and there was no
> warning reported (when the above patch is applied with above dependency).
> 
> Best regards,
> Krzysztof

I don't know, I assumed the vdpa patch fixes build. If not,
I think we can just wait with the vdpa patch until after
the hwmon one is upstream.

Thanks!


-- 
MST

