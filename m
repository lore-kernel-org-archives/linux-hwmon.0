Return-Path: <SRS0=O0xC=XR=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F240FC3A5A6
	for <linux-hwmon@archiver.kernel.org>; Sun, 22 Sep 2019 18:26:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CAF1020644
	for <linux-hwmon@archiver.kernel.org>; Sun, 22 Sep 2019 18:26:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ql3zmh0h"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388552AbfIVS0C (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 22 Sep 2019 14:26:02 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:59953 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2388543AbfIVS0C (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 22 Sep 2019 14:26:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1569176760;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=F7kaKvkkLoDGqojZh8FsoY3PtV4q7Cw7Q5mbP0IHtbM=;
        b=Ql3zmh0hVjG4sl+SoIOhHpREOC8Zw668jfDHpe6yV6OMSLFRQabZuiX5P2Xobr0NnCrUmg
        tJFTSdjHY9pJbeRwQPoHIj4zAcA5ElE62++ycfGhL8s3lb2S3+cjOPtvTKFf445xO12+Oz
        9HxW7xslp2/f/QD7qMeL8gjvmNQyXj4=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-wXs7j_FRNXqsVBcPbWouFg-1; Sun, 22 Sep 2019 14:25:58 -0400
Received: by mail-pf1-f197.google.com with SMTP id q127so8716463pfc.17
        for <linux-hwmon@vger.kernel.org>; Sun, 22 Sep 2019 11:25:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sFJizlrWfeVBwXj5blgprJysA7UJlQlW8rT+A7FF6Jc=;
        b=V6qck1/zndOuoiBq2NmCtsaMb/5hp0ocnFAoPFhNXrO6tQ9i0+n2mWayLDgHB9fbo2
         tgn+1tCU3uRM8bsjAgEI6fiLDgSS7WPsLZkgpUByETCQGNVi4mfA8X1aWKRFshLAMg5K
         Sior2Cnjat911+nuyfgmIM7/1gU06R4dyLBAQdNvt/OjZWCwaGSa2/PQEkrrC9KOD3jj
         0bzr2L/ynM1pk3E+yaGcPAZ/n8668fO4z1UhCubmWB1wA7XXYMwFrYASqqnTsKQ35cPK
         LJ84RQ9bd9YR1fOoRCqIVuZ8sUKawPYxWyMTgTl6FWi2ltE4H4XciUa2hzpqlQ/M6CnN
         Ls2Q==
X-Gm-Message-State: APjAAAVQ6ac+1taBVH3vueqtmiJxsXJedcgy+EPSGnj7OL5ne845gdef
        QifeqTm7pUaIFAdxJlgTtDgGwwpvs/Fmd2xVCmQlCeW/v+ersaqArSX58Wiid7CyFeHAk3Ii36O
        lpwMMvR4L6BZdo+q9aUaDnHtIhO753XnMAAJkt70=
X-Received: by 2002:a65:6798:: with SMTP id e24mr14342408pgr.39.1569176757033;
        Sun, 22 Sep 2019 11:25:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzPRqrjZ1EbEZ8ALjXoyBniYDng7AFbO5xlKU/wwa+kfAODeQcxt+LeZcYGCR8JCHgOVCkc8LDZVt50wT64Lj0=
X-Received: by 2002:a65:6798:: with SMTP id e24mr14342395pgr.39.1569176756796;
 Sun, 22 Sep 2019 11:25:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAP80Qm2ORJ4cXukhH8oXeGv-C9LrADa1XyDuyq5LKeV_YaYxqA@mail.gmail.com>
 <20190921115752.GA22647@roeck-us.net>
In-Reply-To: <20190921115752.GA22647@roeck-us.net>
From:   Lukas Zapletal <lzap@redhat.com>
Date:   Sun, 22 Sep 2019 20:25:40 +0200
Message-ID: <CAP80Qm3ayVfh-pE2M5euTSf0Z0EJ3AvwTiK+YjM5xynEKH-g3w@mail.gmail.com>
Subject: Re: [PATCH] k10temp: update documentation
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        Clemens Ladisch <clemens@ladisch.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-MC-Unique: wXs7j_FRNXqsVBcPbWouFg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

> Your patch does not apply to the curent mainline kernel.
> What is the parent branch ?

Oh well, this is my first contribution. I used Greg's staging tree
which I found in a first contributor tutorial on web. I will rebase,
let me know which branch do I need to pick. Thanks.

--=20
Later,
  Lukas @lzap Zapletal

