Return-Path: <SRS0=e0Qf=AU=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AECECC433E1
	for <linux-hwmon@archiver.kernel.org>; Thu,  9 Jul 2020 03:30:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 826DC206F6
	for <linux-hwmon@archiver.kernel.org>; Thu,  9 Jul 2020 03:30:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DGITtrcN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbgGIDai (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 8 Jul 2020 23:30:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726117AbgGIDah (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 8 Jul 2020 23:30:37 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AF22C08C5CE
        for <linux-hwmon@vger.kernel.org>; Wed,  8 Jul 2020 20:30:37 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id k7so264070uan.13
        for <linux-hwmon@vger.kernel.org>; Wed, 08 Jul 2020 20:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3UE7RbCMzeCTWKWR3FKIJGU02RygMbupk5QpwvNDfX0=;
        b=DGITtrcNDA2p6QMEiL83uxlFiT3okK/t54evn0UHEw8MPIwkU3xNSX9mLDbO9GmE3U
         oOdoiCPW/0IAnXc1egKoy07oDP5qWY0AZNZpQWqHTS4tWWsKh1NUtHHMClVZJAb31U5H
         DyBydGoU6b92zSFFP7H5VM4Ge0Im8f14PFVj8F1K4ok01MzLIXn/hlSv0Mirb5KGIYiO
         kPC86hxGbxnUdcOrO8xbjAEj4n6sfqkMmay0tMg7pWT0yIV8ShKmjzoTr3Wj3UuBpi/T
         N0XG04BBHymwC5va7fOp92nLM+lUKyotqxLQrmBUgFLVOKHNQV+8D2Wvs3dRJaE0QIM1
         UqjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3UE7RbCMzeCTWKWR3FKIJGU02RygMbupk5QpwvNDfX0=;
        b=Kq1zOnNmuVK1g39jVO1O6q5aMEkfgboWenfKyLVvcseoL5tN7FjoCM98J4xoaMlIvC
         FqDOojmS9Ot/T1r8L69S6vdFyAFKLG/h8HgNezaSnOTVsN0FSdji4WCrRPa9JJ3//3yt
         LhpbSu49JQuiH3SPJWOuVYM21DDCbjDBYBJywWpspPSVOdB1m5sOp6UnjyQeR2+1LVRc
         oS2DtuXG5TNtGkIXH3Kl9C2W6h75Cq4U4QBL7Ejw9h3I0OecrIzHM127UMgjvtI38sSK
         LI5EXp5hdTd1hR5/Xa+cuG+kT1JMUn8PYxZeceT88pzypLYnkQU5U48Kmw7JQxXIBuGO
         mWlQ==
X-Gm-Message-State: AOAM530ZNxy7m9mvEoVPdDQEka6zZDW2soWG/TWpCedTgY+f0ss0bDu3
        PEAo/AZGjLxAicDJTXggCsUJ0EACQnEBP8A0+Yg3gQ==
X-Google-Smtp-Source: ABdhPJw55RL6qPA11nWYNULw1+4SqXgr2FPFwDANVI4NjEU90cA9PpkhYPr/X1GBTccI20Y+wCLWZ9W22Rfg4yjlm2E=
X-Received: by 2002:ab0:6e8e:: with SMTP id b14mr49497543uav.0.1594265436434;
 Wed, 08 Jul 2020 20:30:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200708235306.3854404-1-linchuyuan@google.com> <a219c4ba-23ec-f6a0-1bbb-593e54dd11be@roeck-us.net>
In-Reply-To: <a219c4ba-23ec-f6a0-1bbb-593e54dd11be@roeck-us.net>
From:   Chu Lin <linchuyuan@google.com>
Date:   Wed, 8 Jul 2020 20:30:25 -0700
Message-ID: <CAKCA56DrA30WATZqCv6dDbj0siUW3Uvub0P1_6xRO-aPsMMPVg@mail.gmail.com>
Subject: Re: [PATCH] hwmon: adm1275: Make sure we are reading enough data for
 different chips
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Kais Belgaied <belgaied@google.com>,
        Jason Ling <jasonling@google.com>, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zhongqi Li <zhongqil@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Jul 8, 2020 at 5:33 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 7/8/20 4:53 PM, Chu Lin wrote:
> > Issue:
> > When binding adm1272 to the adm1275 driver, PEC error is reported.
> > See blow:
>
> s/blow/below/
>
> Also, unless I am missing something, the error is only seen if PEC is
> enabled.

This is correct.

Regards,
Chu
