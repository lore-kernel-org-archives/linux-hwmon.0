Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2547C678D5
	for <linux-hwmon@archiver.kernel.org>; Wed,  8 Mar 2023 15:24:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231435AbjCHPYF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 8 Mar 2023 10:24:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231929AbjCHPX4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 8 Mar 2023 10:23:56 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7827CB668
        for <linux-hwmon@vger.kernel.org>; Wed,  8 Mar 2023 07:23:54 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id l25so15771350wrb.3
        for <linux-hwmon@vger.kernel.org>; Wed, 08 Mar 2023 07:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678289033;
        h=content-transfer-encoding:subject:to:mime-version:from:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uvm/JPrLNIQNZCtgbYSFdh/LTyOoJqjd+Huoqusb7iY=;
        b=U+h3HgIC8VWFCysMFqyN0pdP9VTpOf3yeg219rSdkDbZVNS5Vhhm4TptYxdZ2y2RhG
         2JQhn8XMGCvYgQY8jFl7wH+cAajFQ+qZIRadUR+mvadgvbB32y4JxyJnXIe8nxriWSCs
         94TTWyZACzwBJ6xRFUCSsvpJ7StZctakFcxdhqOX8pPet8Pzj2TEZUuB8givRGuPbke5
         bFJ0Q8fFoq46zagcz5/hwzod5E7ydeNUwcv+YTJoJs6E0uMKBNBwIAZCD5lEdN7ebnLZ
         OepX0DBlqFoFaHt01ZSa9NR37eWZbWRkGtwCQlsiklTWz7gwutfLvfPrz73rbazkWxNP
         QZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678289033;
        h=content-transfer-encoding:subject:to:mime-version:from:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uvm/JPrLNIQNZCtgbYSFdh/LTyOoJqjd+Huoqusb7iY=;
        b=R59PlqsCyuizUyWcDv2U+NMZujL3mdCS6/Vf0s8SVYLVlveUuW9NyyeC4gv5j4kbZM
         oqN9zygPho1I3BBQGM0azWUq4Qp7Qh8W8GfKpxlPqCHBj78FTzAU64zVlZZtVTCAryet
         7o37DTDFNw0hYA6c9vJ8PxAYUWT+JVq6uXMBa6RPoyKhTDEvkPF/1ZueWzd+H5Q/4UEF
         ZTthHXDs2QZlCBb0eqLP64WFU+wTAzSarqEiAaLGbHec3c8uAgwUUOMnWx7tcXHXVgRZ
         q6PRYLQ0RYllAmERHXv34XcdgS2TEhh7SFcEtfUhFtt0pvYyPHOoqh0unxD7jqd8siUQ
         f60w==
X-Gm-Message-State: AO0yUKVL8urbOqtA9znmcp8j+JUv+Y5epYn+QeU+a3rtYEO9LDGzvA4k
        vW37Z/UlPh8Ju7WmUncGkHJEez6RZ3Y=
X-Google-Smtp-Source: AK7set/TMPVJMxlzZJ4bprTQae4kHKsIfetkMR3CUSc1w1+1X28LW3iIRzc4f5S+iOiuIkkez4bi7A==
X-Received: by 2002:a5d:534a:0:b0:2c9:e34e:7d1 with SMTP id t10-20020a5d534a000000b002c9e34e07d1mr11554927wrv.6.1678289032898;
        Wed, 08 Mar 2023 07:23:52 -0800 (PST)
Received: from DESKTOP-8VK398V ([125.62.90.127])
        by smtp.gmail.com with ESMTPSA id q10-20020a5d658a000000b002c70851fdd8sm15582656wru.75.2023.03.08.07.23.52
        for <linux-hwmon@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Wed, 08 Mar 2023 07:23:52 -0800 (PST)
Message-ID: <6408a888.5d0a0220.1075f.f43d@mx.google.com>
Date:   Wed, 08 Mar 2023 07:23:52 -0800 (PST)
X-Google-Original-Date: 8 Mar 2023 20:23:52 +0500
From:   yosefdeclan936@gmail.com
X-Google-Original-From: YosefDeclan936@gmail.com
MIME-Version: 1.0
To:     linux-hwmon@vger.kernel.org
Subject: Estimate To Bid
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,=0D=0A=0D=0AWe are an estimation company. We provide estimate =
and takeoff services to the GC and subcontractors. We have expert=
ise in following trades:-=0D=0A=0D=0A(Civil, Mechanical, Electric=
al, Plumbing, HVAC=0D=0ARoofing, Painting, Windows, Glass and Gla=
zing, Countertops=0D=0ALumber, Drywall, Demolition, Networking an=
d IT, Fire Detection and Alarm System)=0D=0A =0D=0AAll you need t=
o do is just send us the drawings via email or dropbox and we wil=
l get back to you with our services fee proposal and turnaround t=
ime shortly. If you approve of the proposal we will start working=
 on your estimate.=0D=0A=0D=0AYou can ask for our sample take-off=
s & estimates to get a better idea of our work.=0D=0A=0D=0ABest R=
egards.=0D=0AYosef Declan=0D=0AMarketing Manager=0D=0ACrown Estim=
ation, LLC=0D=0A

